@echo off
title Libby - Install
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0build-and-install.ps1" -Install
echo.
pause
