param([string]$ApkPath = 'dist\lunar-edge-4.0.2-armv7-fixed.apk')
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path $PSScriptRoot -Parent)
$morphe = Join-Path $PWD 'tools\morphe-desktop.jar'
& 'tools\kotlin-current\kotlinc\bin\kotlinc.bat' scripts\verify-patched-apk.kt scripts\verify-dlna-manifest.kt scripts\verify-background.kt -classpath $morphe -jvm-target 11 -d build\verification.jar
if ($LASTEXITCODE -ne 0) { throw 'No se pudo compilar el verificador.' }
& java -cp "build\verification.jar;$morphe" Verify_patched_apkKt $ApkPath
if ($LASTEXITCODE -ne 0) { throw 'La APK no supera la verificación.' }
& java -cp "build\verification.jar;$morphe" Verify_dlna_manifestKt $ApkPath
if ($LASTEXITCODE -ne 0) { throw 'La APK no registra el servicio DLNA interno.' }
& java -cp "build\verification.jar;$morphe" Verify_backgroundKt $ApkPath
if ($LASTEXITCODE -ne 0) { throw 'La APK no integra el mantenimiento de segundo plano.' }
