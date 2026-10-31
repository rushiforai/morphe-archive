# Builds the local-lists store/backup tests and runs them through app_process
# on the retained emulator. Uses synthetic data only; no APK, app data, or
# credentials are copied. Requires JDK, Android SDK build-tools 36.0.0 and a
# connected device (default: the stable private ADB transport).
param(
    [string]$Serial = "127.0.0.1:5581",
    [string]$Adb = "",
    [string]$AdbPort = ""
)

$ErrorActionPreference = "Stop"
if (-not $Adb) {
    $Adb = if ($env:ADB) { $env:ADB } else { "adb" }
}
if (-not $AdbPort) {
    $AdbPort = if ($env:ADB_PORT) { $env:ADB_PORT } else { "5037" }
}
$root = Split-Path $PSScriptRoot -Parent
$javaHome = if ($env:JAVA_HOME) { $env:JAVA_HOME } else { "C:\Program Files\Android\Android Studio\jbr" }
$env:JAVA_HOME = $javaHome
$androidHome = if ($env:ANDROID_HOME) { $env:ANDROID_HOME } else { "C:\Users\Admin\AppData\Local\Android\Sdk" }
$javac = Join-Path $javaHome "bin\javac.exe"
$buildTools = Join-Path $androidHome "build-tools\36.0.0"
$d8 = Join-Path $buildTools "d8.bat"
$platform = Get-ChildItem (Join-Path $androidHome "platforms") -Directory |
    Where-Object { Test-Path (Join-Path $_.FullName "android.jar") } |
    Sort-Object Name -Descending | Select-Object -First 1
if (-not $platform) { throw "No Android platform android.jar found" }
$androidJar = Join-Path $platform.FullName "android.jar"
if (-not (Test-Path $javac)) { throw "javac not found: $javac" }
if (-not (Test-Path $d8)) { throw "d8 not found: $d8" }
if (-not (Test-Path $Adb)) { throw "adb not found: $Adb" }

$out = Join-Path $root "build\locallists-tests"
if (Test-Path $out) { Remove-Item -Recurse -Force $out }
New-Item -ItemType Directory -Force -Path (Join-Path $out "classes") | Out-Null

$sources = @()
$sources += Get-ChildItem (Join-Path $root "extensions\extension\src\main\java\app\badfella\extension\ticktick\locallists") -Filter "*.java" |
    Select-Object -ExpandProperty FullName
$sources += Join-Path $root "tests\locallists\LocalListsTestMain.java"

& $javac -encoding UTF-8 -source 8 -target 8 -Xlint:-options -cp $androidJar -d (Join-Path $out "classes") $sources
if ($LASTEXITCODE -ne 0) { throw "javac failed" }

$classesJar = Join-Path $out "classes.jar"
& (Join-Path $javaHome "bin\jar.exe") cf $classesJar -C (Join-Path $out "classes") .
if ($LASTEXITCODE -ne 0) { throw "jar failed" }
& $d8 --release --min-api 26 --lib $androidJar --output $out $classesJar
if ($LASTEXITCODE -ne 0) { throw "d8 failed" }

$dex = Join-Path $out "classes.dex"
$remote = "/data/local/tmp/badfella-local-lists-test.dex"
& $Adb -P $AdbPort -s $Serial push $dex $remote | Out-Null
if ($LASTEXITCODE -ne 0) { throw "adb push failed" }

& $Adb -P $AdbPort -s $Serial shell "rm -rf /data/local/tmp/badfella-local-lists-tests; CLASSPATH=$remote app_process /system/bin app.badfella.extension.ticktick.locallists.LocalListsTestMain"
$result = $LASTEXITCODE
& $Adb -P $AdbPort -s $Serial shell "rm -f $remote" | Out-Null
exit $result
