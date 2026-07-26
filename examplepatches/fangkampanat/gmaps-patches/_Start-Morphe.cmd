@echo off
setlocal

pushd "%~dp0" || (
    echo Unable to open the Morphe Desktop folder:
    echo %~dp0
    pause
    exit /b 1
)

for /f "delims=" %%F in ('dir /b /a-d /o-d "morphe-desktop-*-all.jar" 2^>nul') do if not defined MORPHE_JAR set "MORPHE_JAR=%%~fF"

if not defined MORPHE_JAR (
    echo Morphe Desktop JAR was not found in:
    echo %CD%
    echo.
    echo Place this script in the same folder as morphe-desktop-*-all.jar.
    popd
    pause
    exit /b 1
)

if /i "%~1"=="--dry-run" (
    echo Selected: %MORPHE_JAR%
    if exist "%MORPHE_JAR%" (echo Accessible: yes) else (echo Accessible: no)
    popd
    exit /b 0
)

where javaw.exe >nul 2>&1
if errorlevel 1 (
    echo javaw.exe was not found. Install Java 21 or add it to PATH.
    popd
    pause
    exit /b 1
)

for %%F in ("%MORPHE_JAR%") do echo Starting %%~nxF with the en-US Java locale
start "" javaw.exe -Duser.language=en -Duser.country=US -jar "%MORPHE_JAR%"

popd
endlocal
