@echo off
rem Builds a minimal context bundle for a new AI chat.
rem Put this file in the project root (the folder that contains README.md and patches), then double-click it.
rem Output: ai-context folder and ai-context.zip next to this file. Safe to re-run.
setlocal
set "SRC=%~dp0"
set "OUT=%~dp0ai-context"
set "MISSING=0"

if not exist "%SRC%README.md" (
  echo ERROR: README.md not found next to this script. Move the script to the project root.
  pause
  exit /b 1
)

if exist "%OUT%" rmdir /s /q "%OUT%"
if exist "%OUT%.zip" del /q "%OUT%.zip"
mkdir "%OUT%"

call :copyfile "README.md"
call :copyfile "docs\TECHNICAL.md"
call :copyfile "docs\TODO.md"
call :copyfile "patches\src\main\kotlin\app\morphe\patches\facebook\marketplace\MarketplaceOnlyPatch.kt"
call :copyfile "patches\src\main\kotlin\app\morphe\patches\facebook\marketplace\Fingerprints.kt"
call :copyfile "patches\src\main\kotlin\app\morphe\patches\facebook\marketplace\MarketplaceRenamePatch.kt"
call :copyfile "extensions\facebook\src\main\java\app\morphe\extension\facebook\marketplace\MarketplaceOnly.java"
call :copyfile "agent-tools\README.md"
call :copyfile "build.ps1"

call :writestart

if "%MISSING%"=="1" echo.
if "%MISSING%"=="1" echo Some files were missing, see the MISSING lines above.

rem tar ships with Windows 10 and later; -a picks zip from the extension
tar -a -c -f "%OUT%.zip" -C "%OUT%" . 2>nul
if exist "%OUT%.zip" (echo Zip: "%OUT%.zip") else (echo tar not available, upload the ai-context folder contents instead)
echo.
echo Folder: "%OUT%"
dir /s /-c "%OUT%" | find "File(s)"
echo.
echo Attach the zip (or the files inside the folder) to a new chat and say: read START_HERE.md first.
pause
exit /b 0

:copyfile
if not exist "%SRC%%~1" (
  echo MISSING: %~1
  set "MISSING=1"
  goto :eof
)
for %%D in ("%OUT%\%~1") do if not exist "%%~dpD" mkdir "%%~dpD"
copy /y "%SRC%%~1" "%OUT%\%~1" >nul
echo copied: %~1
goto :eof

:writestart
set "SH=%OUT%\START_HERE.md"
>>"%SH%" echo # START HERE (context bundle for a new AI chat)
>>"%SH%" echo.
>>"%SH%" echo This is a trimmed copy of a personal project, not the whole repo. Read this file first, then README.md, then docs\TODO.md.
>>"%SH%" echo.
>>"%SH%" echo ## What the project is
>>"%SH%" echo A Morphe patch set (Morphe patches APKs directly, no decompile or recompile) that turns the Facebook Android app (com.facebook.katana, version 582.0.0.50.54 only, arm64) into a Marketplace-only app. The patched app is renamed to package io.focalpoint.prism with the display name Marketplace and a storefront launcher icon, so it installs next to stock Facebook.
>>"%SH%" echo.
>>"%SH%" echo Two patches:
>>"%SH%" echo - Marketplace only (MarketplaceOnlyPatch.kt + Fingerprints.kt): bytecode patch anchored on Redex-obfuscated class names, plus a Java runtime extension (MarketplaceOnly.java).
>>"%SH%" echo - Marketplace rename (MarketplaceRenamePatch.kt): resource patch. Depends on Morphe's built-in Clone app patch for the package name, and sets android:label and android:icon in the manifest.
>>"%SH%" echo.
>>"%SH%" echo ## Status
>>"%SH%" echo See the checklist in docs\TODO.md. The rename, icon, blank-strip fix, external links and Reels blocking are confirmed working on the device. Items marked [~] are written but untested, items marked [ ] are not started.
>>"%SH%" echo.
>>"%SH%" echo ## How the work happens
>>"%SH%" echo - The user builds on Windows with build.ps1 (Java 21 Temurin, git, a GitHub classic token with read:packages) and tests on a real phone, then reports back. Logs come from adb logcat.
>>"%SH%" echo - The AI has no APK, no Gradle and no network in its sandbox, so nothing it writes gets compiled or run by it. Be conservative, mirror existing patterns in the repo, and say clearly what is unverified.
>>"%SH%" echo - Deliver changed files at their project-relative paths so they can be dropped over the tree (a zip is convenient).
>>"%SH%" echo - README.md has a rule: document every piece of bytecode you rely on (obfuscated name, what it does, register layout, how it was found, app version) in the KDoc next to the fingerprint.
>>"%SH%" echo - Learned the hard way: before injecting smali, check the method register count, and never read p0 at a return-void, because compilers reuse parameter registers (this caused a VerifyError crash).
>>"%SH%" echo.
>>"%SH%" echo ## Not included here (ask the user to paste or upload what you need)
>>"%SH%" echo - The Facebook APK and its dex files (never share or commit it).
>>"%SH%" echo - work/ : a clone of https://github.com/MorpheApp/morphe-patches. The rename patch relies on app/morphe/patches/all/misc/clone/CloneAppPatch.kt from there (setOrGetFallbackPackageName).
>>"%SH%" echo - tools/dexscan.py and agent-tools/Dex.java and arsc.py : dex and resource inspectors, described in README.md and agent-tools/README.md.
>>"%SH%" echo - tests/ (plain-JVM tests for the extension), build.sh (Linux/macOS twin of build.ps1), tools/icon/ (icon generator and the generated icon files).
goto :eof
