@echo off
setlocal enabledelayedexpansion

echo === Tantan APK Signature Extractor ===
echo.

REM Check if APK exists
if not exist "tantan-7.3.6.apk" (
    echo APK not found. Pulling from device...
    echo.
    adb pull /data/app/~~I9ouu8Dy0osFDx6Wu-ynzA==/com.tantantribe.tribe-hlmqYxXoe5ADovZzRBpn2A==/base.apk tantan-7.3.6.apk
    if errorlevel 1 (
        echo ERROR: Failed to pull APK from device
        pause
        exit /b 1
    )
    echo.
    echo APK pulled successfully
    echo.
)

REM Try Method 1: apksigner from Android SDK
echo Method 1: Trying apksigner from Android SDK...
set "APKSIGNER_FOUND="

REM Check common Android SDK locations
for /d %%d in ("%LOCALAPPDATA%\Android\Sdk\build-tools\*") do (
    if exist "%%d\apksigner.bat" (
        echo Found apksigner at: %%d\apksigner.bat
        echo.
        echo Extracting signature...
        echo.
        "%%d\apksigner.bat" verify --print-certs tantan-7.3.6.apk > signature-output.txt 2>&1
        
        REM Look for SHA-256 in output
        findstr /C:"SHA-256" signature-output.txt >nul
        if !errorlevel! equ 0 (
            echo === Signature Found ===
            echo.
            findstr /C:"SHA-256" signature-output.txt
            echo.
            
            REM Extract just the hash
            for /f "tokens=2 delims=:" %%a in ('findstr /C:"SHA-256" signature-output.txt') do (
                set "HASH=%%a"
                set "HASH=!HASH: =!"
                echo SHA-256 Hash ^(for Constants.kt^):
                echo !HASH!
                echo.
                echo Add this to Constants.kt:
                echo signatures = setOf^("!HASH!"^)
                set "APKSIGNER_FOUND=1"
            )
        )
        goto :cleanup
    )
)

if "!APKSIGNER_FOUND!"=="" (
    echo apksigner not found in Android SDK
    echo.
)

REM Try Method 2: keytool (for v1 signatures)
echo Method 2: Trying keytool...
where keytool >nul 2>&1
if %errorlevel% equ 0 (
    echo Found keytool in PATH
    echo.
    echo Extracting signature...
    echo.
    keytool -printcert -jarfile tantan-7.3.6.apk > signature-output.txt 2>&1
    
    REM Check if it worked
    findstr /C:"SHA256:" signature-output.txt >nul
    if !errorlevel! equ 0 (
        echo === Signature Found ===
        echo.
        findstr /C:"SHA256:" signature-output.txt
        echo.
        
        REM Extract just the hash
        for /f "tokens=2 delims=:" %%a in ('findstr /C:"SHA256:" signature-output.txt') do (
            set "HASH=%%a"
            set "HASH=!HASH: =!"
            set "HASH=!HASH::=!"
            echo SHA-256 Hash ^(for Constants.kt^):
            echo !HASH!
            echo.
            echo Add this to Constants.kt:
            echo signatures = setOf^("!HASH!"^)
            goto :cleanup
        )
    ) else (
        echo keytool failed - APK likely uses v2/v3 signing scheme
        echo.
    )
) else (
    echo keytool not found in PATH
    echo.
)

REM Try Method 3: Python script
echo Method 3: Trying Python script...
where python >nul 2>&1
if %errorlevel% equ 0 (
    echo Found Python
    echo.
    python extract-signature.py tantan-7.3.6.apk
    goto :cleanup
) else (
    echo Python not found
    echo.
)

REM If all methods failed
echo === All Methods Failed ===
echo.
echo Could not extract signature automatically.
echo.
echo Manual options:
echo.
echo 1. Install Android SDK Command Line Tools:
echo    https://developer.android.com/studio#command-tools
echo.
echo 2. Or install Python and run:
echo    python extract-signature.py tantan-7.3.6.apk
echo.
echo 3. Or manually search for apksigner:
echo    Get-ChildItem -Path $env:LOCALAPPDATA -Recurse -Filter 'apksigner.bat' -ErrorAction SilentlyContinue
echo.

:cleanup
if exist signature-output.txt del signature-output.txt
echo.
pause
