@echo off
setlocal
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0verify-full.ps1" %*
exit /b %ERRORLEVEL%
