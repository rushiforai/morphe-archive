<#
.SYNOPSIS
    Phase B of the single-APK spike: a resource-free Compose UI (single-apk/compose-probe)
    injected into the Apple Music engine APK with the *dex order inverted* (probe first).

.DESCRIPTION
    Phase A proved that an extra dex + an activity can be added to the engine APK.  Phase B
    asks whether a real Compose UI can live there: the app dex must come *before* the engine
    dexes so that the newest AndroidX/Compose copy wins over the engine's R8-shrunk one.

    Steps:
      1. build single-apk/compose-probe (standalone Gradle build, AGP 9.4.1 + Kotlin 2.4.21)
         and take its classes*.dex;
      2. patch the engine's binary AndroidManifest.xml (tools/axml_inject.py);
      3. rewrite the zip (tools/pack_inverted_apk.py): probe dexes become classes.dex..K,
         engine dexes are renumbered classes(K+1)..N, everything else is preserved;
      4. zipalign + apksigner (Morphe p12);
      5. verify and, with -Install, update the device over the top (install -r).

.EXAMPLE
    ./single-apk/build-single-apk-compose.ps1 -Install -LaunchAndCapture
#>
[CmdletBinding()]
param(
    [string]$Engine = ".pipeline/rel160/AppleMusic-engine-arm32.apk",
    [string]$OutDir = "single-apk/out/compose-arm32",
    [string]$Activity = "com.anderson.applemusic.probe.compose.ComposeProbeActivity",
    [string]$Device = "100.74.105.35:5555",
    [string]$Keystore = "tools/tv-app-signing.p12",
    [string]$KeystorePass = "Morphe",
    [string]$KeyAlias = "morphe",
    [string]$ApkName = "AppleMusic-single-apk-compose-arm32.apk",
    [switch]$SkipBuild,
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
$zipalign = Join-Path $buildTools.FullName "zipalign.exe"
$apksigner = Join-Path $buildTools.FullName "apksigner.bat"
$androidJar = Join-Path $platform.FullName "android.jar"
foreach ($tool in @($aapt2, $zipalign, $apksigner, $androidJar)) {
    if (-not (Test-Path $tool)) { throw "missing tool: $tool" }
}

$enginePath = Resolve-RepoPath $Engine
$outDir = Resolve-RepoPath $OutDir
$keystorePath = Resolve-RepoPath $Keystore
$tools = Join-Path $PSScriptRoot "tools"
$probeDir = Join-Path $PSScriptRoot "compose-probe"
$probeApk = Join-Path $probeDir "build/outputs/apk/debug/compose-probe-debug-unsigned.apk"
if (-not (Test-Path $enginePath)) { throw "engine APK not found: $enginePath" }

Write-Host "engine   : $enginePath"
Write-Host "build-tools: $($buildTools.Name)  platform: $($platform.Name)"

# --- 1. build the probe -> its dex files ------------------------------------------------
if (-not $SkipBuild) {
    Write-Host "gradle   : :compose-probe assembleDebug (standalone build)"
    Push-Location $repo
    try {
        Invoke-Tool (Join-Path $repo "gradlew.bat") @(
            "-p", $probeDir, "assembleDebug", "--console=plain")
    } finally {
        Pop-Location
    }
}
if (-not (Test-Path $probeApk)) { throw "probe APK not found: $probeApk" }

$probeDexDir = Join-Path $outDir "probe-dex"
Remove-Item $probeDexDir -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force $probeDexDir, $outDir | Out-Null
Add-Type -AssemblyName System.IO.Compression.FileSystem
$zip = [IO.Compression.ZipFile]::OpenRead($probeApk)
try {
    $probeDexEntries = @($zip.Entries | Where-Object { $_.FullName -match '^classes\d*\.dex$' })
    if ($probeDexEntries.Count -eq 0) { throw "no classes*.dex in $probeApk" }
    foreach ($entry in $probeDexEntries) {
        [IO.Compression.ZipFileExtensions]::ExtractToFile(
            $entry, (Join-Path $probeDexDir $entry.FullName), $true)
    }
} finally { $zip.Dispose() }
Write-Host "probe dex: $($probeDexEntries.Count) file(s) -> $probeDexDir"

# --- 2. patch the engine's binary manifest ---------------------------------------------
$flatManifest = Join-Path $outDir "engine-manifest.bin"
$patchedManifest = Join-Path $outDir "engine-manifest-patched.bin"
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

# --- 3. pack with the inverted dex order -----------------------------------------------
$packed = Join-Path $outDir "single-apk-unsigned.apk"
Write-Host "pack     : probe dex first, engine dexes renumbered"
Invoke-Tool "python" @((Join-Path $tools "pack_inverted_apk.py"), "--engine", $enginePath,
    "--probe-dex-dir", $probeDexDir, "--manifest", $patchedManifest, "--out", $packed)

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
    $tag = "compose"
    & adb -s $Device logcat -c
    & adb -s $Device shell am force-stop com.apple.android.music
    Start-Sleep -Seconds 2

    Write-Host "launch   : $Activity (cold process)"
    & adb -s $Device shell am start -W -n "com.apple.android.music/$Activity"
    Start-Sleep -Seconds 10
    & adb -s $Device shell screencap -p "/sdcard/spike-$tag-probe.png"
    & adb -s $Device pull "/sdcard/spike-$tag-probe.png" (Join-Path $evidence "spike-$tag-probe.png") | Out-Null

    Write-Host "launch   : engine MainActivity com.apple.android.music.common.MainActivity"
    & adb -s $Device shell am start -W -n "com.apple.android.music/com.apple.android.music.common.MainActivity"
    Start-Sleep -Seconds 10
    & adb -s $Device shell screencap -p "/sdcard/spike-$tag-engine.png"
    & adb -s $Device pull "/sdcard/spike-$tag-engine.png" (Join-Path $evidence "spike-$tag-engine.png") | Out-Null

    $log = Join-Path $evidence "spike-$tag-logcat.txt"
    & adb -s $Device logcat -d -v time | Out-File -Encoding utf8 $log
    Write-Host "logcat   : $log"
    Write-Host "errors   :"
    Select-String -Path $log -Pattern "NoSuchMethodError|ClassNotFound|NoClassDefFound|FATAL EXCEPTION" |
        Select-Object -First 20
}
