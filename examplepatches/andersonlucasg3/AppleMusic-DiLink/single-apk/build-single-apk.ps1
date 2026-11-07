<#
.SYNOPSIS
    Builds "one APK per device": the patched Apple Music engine APK with our probe
    activity injected as an extra dex + a MAIN/LAUNCHER entry in the binary manifest.

.DESCRIPTION
    Phase A spike of the single-APK distribution: instead of a companion app bound through
    sharedUserId, the probe lives inside the engine APK (same package, same UID, same cert),
    so the installed engine is only updated with `adb install -r` (account preserved).

    Steps:
      1. javac + d8 the probe activity (no resources, no R.*, no Compose);
      2. patch the engine's binary AndroidManifest.xml (tools/axml_inject.py);
      3. rewrite the zip: replace the manifest, add classesN.dex, keep everything else;
      4. zipalign + apksigner (Morphe p12);
      5. verify (apksigner/aapt2) and, with -Install, update the device over the top.

.EXAMPLE
    ./single-apk/build-single-apk.ps1
    ./single-apk/build-single-apk.ps1 -Install -LaunchAndCapture -Device 100.74.105.35:5555
#>
[CmdletBinding()]
param(
    [string]$Engine = ".pipeline/release/AppleMusic-1.4.0-AndroidTV-arm32.apk",
    [string]$OutDir = "single-apk/out",
    [string]$Activity = "com.anderson.applemusic.probe.ProbeActivity",
    [string]$Device = "100.74.105.35:5555",
    [string]$Keystore = "tools/tv-app-signing.p12",
    [string]$KeystorePass = "Morphe",
    [string]$KeyAlias = "morphe",
    [string]$ApkName = "AppleMusic-single-apk-arm32.apk",
    [switch]$Install,
    [switch]$LaunchAndCapture
)

$ErrorActionPreference = "Stop"
$repo = Split-Path -Parent $PSScriptRoot

function Resolve-RepoPath([string]$Path) {
    if ([IO.Path]::IsPathRooted($Path)) { return $Path }
    return Join-Path $repo $Path
}

function Invoke-Tool([string]$Exe, [string[]]$ArgList) {
    & $Exe @ArgList
    if ($LASTEXITCODE -ne 0) {
        throw "$Exe failed with exit code $LASTEXITCODE"
    }
}

# --- toolchain -------------------------------------------------------------------------
$sdk = $env:ANDROID_HOME
if (-not $sdk) { $sdk = $env:ANDROID_SDK_ROOT }
if (-not $sdk) { $sdk = Join-Path $env:LOCALAPPDATA "Android\Sdk" }
if (-not (Test-Path $sdk)) { throw "Android SDK not found (set ANDROID_HOME)" }

$buildTools = Get-ChildItem (Join-Path $sdk "build-tools") -Directory |
    Sort-Object { [int]($_.Name.Split(".")[0]) } -Descending | Select-Object -First 1
$platform = Get-ChildItem (Join-Path $sdk "platforms") -Directory |
    Sort-Object { [int]($_.Name -replace "^android-", "") } -Descending | Select-Object -First 1
$aapt2 = Join-Path $buildTools.FullName "aapt2.exe"
$d8 = Join-Path $buildTools.FullName "d8.bat"
$zipalign = Join-Path $buildTools.FullName "zipalign.exe"
$apksigner = Join-Path $buildTools.FullName "apksigner.bat"
$androidJar = Join-Path $platform.FullName "android.jar"
foreach ($tool in @($aapt2, $d8, $zipalign, $apksigner, $androidJar)) {
    if (-not (Test-Path $tool)) { throw "missing tool: $tool" }
}

$enginePath = Resolve-RepoPath $Engine
$outDir = Resolve-RepoPath $OutDir
$keystorePath = Resolve-RepoPath $Keystore
$probeSrc = Join-Path $PSScriptRoot "probe/src"
$tools = Join-Path $PSScriptRoot "tools"
if (-not (Test-Path $enginePath)) { throw "engine APK not found: $enginePath" }

Write-Host "engine   : $enginePath"
Write-Host "build-tools: $($buildTools.Name)  platform: $($platform.Name)"

# --- 1. compile probe -> dex -----------------------------------------------------------
$classesDir = Join-Path $outDir "classes"
$dexDir = Join-Path $outDir "dex"
Remove-Item $classesDir, $dexDir -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force $classesDir, $dexDir, $outDir | Out-Null

$javaFiles = Get-ChildItem $probeSrc -Recurse -Filter *.java | ForEach-Object { $_.FullName }
Write-Host "javac    : $($javaFiles.Count) file(s)"
Invoke-Tool "javac" (@("--release", "8", "-Xlint:-options", "-classpath", $androidJar,
        "-d", $classesDir) + $javaFiles)

Write-Host "d8       : min-api 29"
$probeJar = Join-Path $outDir "probe.jar"
Invoke-Tool "jar" @("cf", $probeJar, "-C", $classesDir, ".")
Invoke-Tool $d8 @("--min-api", "29", "--lib", $androidJar, "--output", $dexDir, $probeJar)
$probeDex = Join-Path $dexDir "classes.dex"
if (-not (Test-Path $probeDex)) { throw "d8 did not produce classes.dex" }

# --- 2. patch the engine's binary manifest ---------------------------------------------
$flatManifest = Join-Path $outDir "engine-manifest.bin"
$patchedManifest = Join-Path $outDir "engine-manifest-patched.bin"
Add-Type -AssemblyName System.IO.Compression.FileSystem
$zip = [IO.Compression.ZipFile]::OpenRead($enginePath)
try {
    $entry = $zip.GetEntry("AndroidManifest.xml")
    if (-not $entry) { throw "AndroidManifest.xml not found in $enginePath" }
    $stream = $entry.Open()
    $file = [IO.File]::Create($flatManifest)
    try { $stream.CopyTo($file) } finally { $file.Dispose(); $stream.Dispose() }
} finally {
    $zip.Dispose()
}

Write-Host "manifest : patching (activity $Activity)"
Invoke-Tool "python" @((Join-Path $tools "axml_inject.py"), "--in", $flatManifest,
    "--out", $patchedManifest, "--activity", $Activity)

# --- 3. pack ----------------------------------------------------------------------------
$packed = Join-Path $outDir "single-apk-unsigned.apk"
Write-Host "pack     : adding probe dex + patched manifest to the engine"
Invoke-Tool "python" @((Join-Path $tools "pack_single_apk.py"), "--engine", $enginePath,
    "--dex", $probeDex, "--manifest", $patchedManifest, "--out", $packed)

# --- 4. align + sign --------------------------------------------------------------------
$aligned = Join-Path $outDir "single-apk-aligned.apk"
$signed = Join-Path $outDir $ApkName
Invoke-Tool $zipalign @("-f", "-p", "4", $packed, $aligned)
Write-Host "sign     : $KeyAlias / $Keystore"
Invoke-Tool $apksigner @("sign", "--ks", $keystorePath, "--ks-pass", "pass:$KeystorePass",
    "--ks-key-alias", $KeyAlias, "--key-pass", "pass:$KeystorePass", "--out", $signed, $aligned)

# --- 5. verify --------------------------------------------------------------------------
Write-Host "verify   : zipalign"
Invoke-Tool $zipalign @("-c", "-p", "4", $signed)
Write-Host "verify   : apksigner"
Invoke-Tool $apksigner @("verify", "--print-certs", $signed)
Write-Host "verify   : badging"
& $aapt2 dump badging $signed | Select-String -Pattern "package:|launchable-activity|sdkVersion"
Write-Host "APK      : $signed ($([math]::Round((Get-Item $signed).Length / 1MB, 1)) MB)"

if (-not ($Install -or $LaunchAndCapture)) {
    Write-Host "done (pass -Install -LaunchAndCapture to update the device)"
    return
}

# --- 6. device: update over the top (never uninstall) ----------------------------------
$evidence = Join-Path $PSScriptRoot "evidence"
New-Item -ItemType Directory -Force $evidence | Out-Null

Write-Host "adb      : installing over the existing engine on $Device (install -r)"
& adb -s $Device install -r $signed
if ($LASTEXITCODE -ne 0) {
    throw "adb install -r failed; the previously installed engine was not removed"
}

if ($LaunchAndCapture) {
    $tag = "tv"
    & adb -s $Device logcat -c
    Write-Host "launch   : $Activity"
    & adb -s $Device shell am start -W -n "com.apple.android.music/$Activity"
    Start-Sleep -Seconds 12
    $log = Join-Path $evidence "spike-single-$tag-logcat.txt"
    & adb -s $Device logcat -d -v time | Out-File -Encoding utf8 $log
    Write-Host "logcat   : $log"
    & adb -s $Device shell screencap -p /sdcard/spike-single-$tag.png
    & adb -s $Device pull /sdcard/spike-single-$tag.png (Join-Path $evidence "spike-single-$tag.png")
    Write-Host "screenshot: $(Join-Path $evidence "spike-single-$tag.png")"
}
