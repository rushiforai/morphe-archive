@echo off
title Libby - Build
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0build-and-install.ps1" -Build
echo.
pause
