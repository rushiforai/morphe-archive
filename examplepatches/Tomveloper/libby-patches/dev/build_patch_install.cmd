@echo off
title Libby - Build, Patch, Install
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0build-and-install.ps1"
echo.
pause
