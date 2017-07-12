@echo off
REM ---------------------------------------------------------------------------
REM File Name   : evernote_auto_backup_win7.bat
REM Author      : ZHANG Wenming
REM Mail        : 
REM Description : This batch can backup one specified note of evernote!
REM Reversion   : 20170622  File created
REM ---------------------------------------------------------------------------

REM constant define
set evernote_exe_path= ""
set evernote_reg_path_num=2
set evernote_reg_path1="HKCU\Software\Microsoft\Windows\CurrentVersion\App Paths\ENScript.exe"
set evernote_reg_path2="HKLM\Software\Microsoft\Windows\CurrentVersion\App Paths\ENScript.exe"

REM ---------------------------------------------------------------------------
REM Search path of evernote.exe
REM ---------------------------------------------------------------------------
for %%i in (1 1 %evernote_reg_path_num%) do (
    reg query %evernote_reg_path%i%% /v Path
    if %errorlevel% equ 0 (
        set ev_exe_flag=1
        set evernote_reg_path=%evernote_reg_path1%
        goto TB_EV_REG_FOUND
        ) else (
        set ev_exe_flag=0
        )
    )
:TB_EV_REG_FOUND
if %ev_exe_flag% equ 0 (
    goto TB_EV_REG_NOT_FOUND
    )
echo Evernote.exe have been found in your reg path:
echo %evernote_reg_path%
goto TB_END_OF_SCRIPT


REM ---------------------------------------------------------------------------
REM ERROR_PROCESS: Evernote.exe not found
REM ---------------------------------------------------------------------------
:TB_EV_REG_NOT_FOUND
echo Evernote.exe not found in your reg path:
echo %evernote_reg_path1%
echo %evernote_reg_path2%
goto TB_END_OF_SCRIPT

REM ---------------------------------------------------------------------------
REM End Of Script
REM ---------------------------------------------------------------------------
:TB_END_OF_SCRIPT
pause
