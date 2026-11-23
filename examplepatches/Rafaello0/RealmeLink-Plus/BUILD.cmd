@echo off
setlocal
chcp 65001 >nul
where pwsh.exe >nul 2>&1
if errorlevel 1 (
  echo ERROR: PowerShell 7 ^(pwsh^) is required. No administrator privileges needed.
  pause
  exit /b 1
)
pwsh.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0BUILD.ps1" %*
set "result=%ERRORLEVEL%"
if not "%result%"=="0" echo Build failed with exit code %result%.
pause
exit /b %result%
