@echo off
title Libby - Patch
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0build-and-install.ps1" -Patch
echo.
pause
