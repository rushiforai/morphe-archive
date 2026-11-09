<#
.SYNOPSIS
    Builds the "one APK per ABI": the patched Apple Music engine APK with our
    framework-only Java UI injected as an extra dex + a MAIN/LAUNCHER activity in the
    binary manifest. No companion app, no resources, no AndroidX/Kotlin/Compose.

.DESCRIPTION
    The UI lives in single-apk/single-ui (package com.anderson.applemusic.one) and is
    compiled with javac + d8, exactly like the phase-A probe. The engine stays the
    account/DRM/playback backend; its own activities (login at common.MainActivity)
    remain installed, only the launcher entry changes.

    For every ABI:
      1. extract the engine's binary AndroidManifest.xml;
      2. inject <activity android:name=... android:theme=...> with MAIN/LAUNCHER and
         rewrite the manifest's versionName/versionCode to the UI version
         (single-apk/tools/axml_inject.py);
      3. pack the patched manifest + classesN.dex into a copy of the engine
         (single-apk/tools/pack_single_apk.py);
      4. zipalign + apksigner with the Morphe certificate;
      5. verify: signature, LAUNCHER entry, and that the produced dex only contains
         com.anderson.applemusic.one.* classes (dexdump).

.EXAMPLE
    ./single-apk/build-one-apk.ps1
    ./single-apk/build-one-apk.ps1 -Abi arm64,x86
#>
[CmdletBinding()]
param(
    [string]$Arm64Engine = ".pipeline/ci162/AppleMusic-engine-arm64.apk",
    [string]$Arm32Engine = ".pipeline/rel160/AppleMusic-engine-arm32.apk",
    [string]$X86Engine = ".pipeline/emulator/AppleMusic-engine-x86.apk",
    [string]$OutDir = "single-apk/out-one",
    # Version of the injected UI (not the engine's 7.0.0). It becomes Version.NAME/CODE,
    # the value updates.json carries as one-<abi>.versionCode.
    [string]$PoneVersion = "1.9.0",
    [int]$PoneVersionCode = 0,
    [string]$Activity = "com.anderson.applemusic.one.OneActivity",
    # @android:style/Theme.Material.NoActionBar (0x0103022e; same id on API 29..36).
    [string]$Theme = "0x0103022e",
    [string]$Keystore = "tools/tv-app-signing.p12",
    [string]$KeystorePass = "Morphe",
    [string]$KeyAlias = "morphe",
    [string[]]$Abi = @("arm64", "arm32", "x86")
)

$ErrorActionPreference = "Stop"
$repo = Split-Path -Parent $PSScriptRoot

function Resolve-RepoPath([string]$Path) {
    if ([IO.Path]::IsPathRooted($Path)) { return $Path }
    return Join-Path $repo $Path
}

function Invoke-Tool([string]$Exe, [string[]]$ArgList) {
    & $Exe @ArgList
    if ($LASTEXITCODE -ne 0) { throw "$Exe failed with exit code $LASTEXITCODE" }
}

# --- toolchain -------------------------------------------------------------------------
$sdk = $env:ANDROID_HOME
if (-not $sdk) { $sdk = $env:ANDROID_SDK_ROOT }
if (-not $sdk) { $sdk = Join-Path $env:LOCALAPPDATA "Android\Sdk" }
if (-not (Test-Path $sdk)) { throw "Android SDK not found (set ANDROID_HOME)" }

$buildTools = Get-ChildItem (Join-Path $sdk "build-tools") -Directory |
    Sort-Object { [int]($_.Name.Split(".")[0]) } -Descending | Select-Object -First 1
$platforms = Join-Path $sdk "platforms"
# compileSdk 36, as the engine was built.
$platform = Get-ChildItem $platforms -Directory |
    Where-Object { $_.Name -eq "android-36" } | Select-Object -First 1
if (-not $platform) {
    $platform = Get-ChildItem $platforms -Directory |
        Sort-Object { [int]($_.Name -replace "^android-", "") } -Descending | Select-Object -First 1
}
$aapt2 = Join-Path $buildTools.FullName "aapt2.exe"
$d8 = Join-Path $buildTools.FullName "d8.bat"
$zipalign = Join-Path $buildTools.FullName "zipalign.exe"
$apksigner = Join-Path $buildTools.FullName "apksigner.bat"
$dexdump = Join-Path $buildTools.FullName "dexdump.exe"
$androidJar = Join-Path $platform.FullName "android.jar"
foreach ($tool in @($aapt2, $d8, $zipalign, $apksigner, $dexdump, $androidJar)) {
    if (-not (Test-Path $tool)) { throw "missing tool: $tool" }
}

$outDir = Resolve-RepoPath $OutDir
$keystorePath = Resolve-RepoPath $Keystore
$srcRoot = Join-Path $PSScriptRoot "single-ui/src/main/java"
$tools = Join-Path $PSScriptRoot "tools"
$engines = @{
    arm64 = Resolve-RepoPath $Arm64Engine
    arm32 = Resolve-RepoPath $Arm32Engine
    x86   = Resolve-RepoPath $X86Engine
}
$names = @{
    arm64 = "AppleMusic-one-arm64.apk"
    arm32 = "AppleMusic-one-arm32.apk"
    x86   = "AppleMusic-one-x86.apk"
}

# The manifest carries the UI version, so the engine's own 7.0.0 no longer shows up in
# the package; capture it from the input APK for the "Atualizações" panel.
$engineProbe = @($Abi | ForEach-Object { $engines[$_] } |
    Where-Object { Test-Path $_ } | Select-Object -First 1)
$engineVersion = "?"
if ($engineProbe.Count -gt 0) {
    $enginePackage = & $aapt2 dump badging $engineProbe[0] | Select-String -Pattern "^package:"
    if ("$enginePackage" -match "versionCode='(\d+)' versionName='([^']+)'") {
        $engineVersion = "$($Matches[2]) ($($Matches[1]))"
    }
}

New-Item -ItemType Directory -Force $outDir | Out-Null
Write-Host "build-tools: $($buildTools.Name)  platform: $($platform.Name)"

# --- 1. compile the framework-only UI --------------------------------------------------
$classesDir = Join-Path $outDir "classes"
$dexDir = Join-Path $outDir "dex"
$genDir = Join-Path $outDir "generated/com/anderson/applemusic/one"
Remove-Item $classesDir, $dexDir -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force $classesDir, $dexDir, $genDir | Out-Null

# Version.java, like updates.json at release time: NAME from -PoneVersion and CODE from
# -PoneVersionCode (derived as MAJOR*10000+MINOR*100+PATCH when omitted).
if ($PoneVersion -notmatch '^[0-9A-Za-z._-]+$') { throw "invalid -PoneVersion '$PoneVersion'" }
if ($PoneVersionCode -le 0) {
    if ($PoneVersion -match '^(\d+)\.(\d+)(?:\.(\d+))?$') {
        $patch = if ($Matches[3]) { [int]$Matches[3] } else { 0 }
        $PoneVersionCode = [int]$Matches[1] * 10000 + [int]$Matches[2] * 100 + $patch
    }
}
if ($PoneVersionCode -le 0) { throw "-PoneVersion '$PoneVersion' has no numeric versionCode; pass -PoneVersionCode" }

$versionJava = @"
package com.anderson.applemusic.one;

/** Generated by build-one-apk.ps1 at build time; do not edit. */
final class Version {
    static final String NAME = "$PoneVersion";
    static final int CODE = $PoneVersionCode;
    static final String ENGINE = "$engineVersion";

    private Version() {
    }
}
"@
[IO.File]::WriteAllText((Join-Path $genDir "Version.java"), $versionJava + "`n",
    (New-Object System.Text.UTF8Encoding($false)))
Write-Host "version  : $PoneVersion ($PoneVersionCode)"

$javaFiles = @(Get-ChildItem $srcRoot -Recurse -Filter *.java | ForEach-Object { $_.FullName })
$javaFiles += Join-Path $genDir "Version.java"
Write-Host "javac    : $($javaFiles.Count) file(s), --release 8 (framework only)"
Invoke-Tool "javac" (@("--release", "8", "-Xlint:-options", "-encoding", "UTF-8",
        "-classpath", $androidJar, "-d", $classesDir) + $javaFiles)

$uiJar = Join-Path $outDir "single-ui.jar"
Invoke-Tool "jar" @("cf", $uiJar, "-C", $classesDir, ".")
Write-Host "d8       : min-api 29"
Invoke-Tool $d8 @("--release", "--min-api", "29", "--lib", $androidJar,
    "--output", $dexDir, $uiJar)
$uiDex = Join-Path $dexDir "classes.dex"
if (-not (Test-Path $uiDex)) { throw "d8 did not produce classes.dex" }

# --- 2. dex audit: only our package (plus its anonymous classes) -----------------------
Write-Host "dexdump  : auditing classes in $uiDex"
$classLines = & $dexdump -l plain $uiDex 2>&1 | Select-String "Class descriptor"
$classes = @($classLines | ForEach-Object {
        $text = $_.ToString()
        $start = $text.IndexOf("L")
        $end = $text.IndexOf(";")
        if ($start -ge 0 -and $end -gt $start) { $text.Substring($start, $end - $start + 1) }
    })
if ($classes.Count -eq 0) { throw "dexdump returned no classes" }
$foreign = @($classes | Where-Object { -not $_.StartsWith("Lcom/anderson/applemusic/one/") })
if ($foreign.Count -gt 0) {
    $foreign | Select-Object -First 20 | ForEach-Object { Write-Host "  FOREIGN $_" }
    throw "the UI dex contains classes outside com.anderson.applemusic.one"
}
Write-Host ("dexdump  : {0} classes, all com.anderson.applemusic.one.*" -f $classes.Count)
$classes | ForEach-Object { Write-Host "           $_" }

# --- 3. pack + sign every ABI -----------------------------------------------------------
Add-Type -AssemblyName System.IO.Compression.FileSystem
foreach ($abiName in $Abi) {
    if (-not $engines.ContainsKey($abiName)) { throw "unknown ABI '$abiName' (arm64|arm32|x86)" }
    $enginePath = $engines[$abiName]
    if (-not (Test-Path $enginePath)) { throw "engine APK not found: $enginePath" }

    $abiDir = Join-Path $outDir $abiName
    New-Item -ItemType Directory -Force $abiDir | Out-Null
    Write-Host ""
    Write-Host "== $abiName : $enginePath"

    $manifestBin = Join-Path $abiDir "engine-manifest.bin"
    $patchedBin = Join-Path $abiDir "engine-manifest-patched.bin"
    $zip = [IO.Compression.ZipFile]::OpenRead($enginePath)
    try {
        $entry = $zip.GetEntry("AndroidManifest.xml")
        if (-not $entry) { throw "AndroidManifest.xml not found in $enginePath" }
        $stream = $entry.Open()
        $file = [IO.File]::Create($manifestBin)
        try { $stream.CopyTo($file) } finally { $file.Dispose(); $stream.Dispose() }
    } finally {
        $zip.Dispose()
    }

    Write-Host "manifest : injecting $Activity (theme $Theme) + REQUEST_INSTALL_PACKAGES + version $PoneVersion ($PoneVersionCode)"
    Invoke-Tool "python" @((Join-Path $tools "axml_inject.py"), "--in", $manifestBin,
        "--out", $patchedBin, "--activity", $Activity, "--theme", $Theme,
        "--permission", "android.permission.REQUEST_INSTALL_PACKAGES",
        "--version-name", $PoneVersion, "--version-code", "$PoneVersionCode")

    $packed = Join-Path $abiDir "one-unsigned.apk"
    Write-Host "pack     : engine + single-ui dex + assets/one + patched manifest"
    Invoke-Tool "python" @((Join-Path $tools "pack_single_apk.py"), "--engine", $enginePath,
        "--dex", $uiDex, "--manifest", $patchedBin, "--assets",
        (Join-Path $PSScriptRoot "single-ui/assets"), "--out", $packed)

    $aligned = Join-Path $abiDir "one-aligned.apk"
    $signed = Join-Path $outDir $names[$abiName]
    Invoke-Tool $zipalign @("-f", "-p", "4", $packed, $aligned)
    Write-Host "sign     : $KeyAlias / $Keystore"
    Invoke-Tool $apksigner @("sign", "--ks", $keystorePath, "--ks-pass", "pass:$KeystorePass",
        "--ks-key-alias", $KeyAlias, "--key-pass", "pass:$KeystorePass",
        "--out", $signed, $aligned)

    Write-Host "verify   : zipalign / signature / launcher"
    Invoke-Tool $zipalign @("-c", "-p", "4", $signed)
    Invoke-Tool $apksigner @("verify", "--print-certs", $signed)
    $badging = & $aapt2 dump badging $signed
    $badging | Select-String -Pattern "package:|launchable-activity|sdkVersion"
    $packageLine = "$($badging | Select-String -Pattern '^package:' | Select-Object -First 1)"
    if ($packageLine -notmatch "versionName='$([regex]::Escape($PoneVersion))'") {
        throw "versionName in $signed is not $PoneVersion ($packageLine)"
    }
    if ($packageLine -notmatch "versionCode='$PoneVersionCode'") {
        throw "versionCode in $signed is not $PoneVersionCode ($packageLine)"
    }
    if (-not ($badging | Select-String -Pattern "launchable-activity: name='$Activity'")) {
        throw "injected activity is not the launcher in $signed"
    }
    # The Inter TTFs must be inside the APK as assets/one/fonts/*.ttf, otherwise
    # Typeface.createFromAsset silently falls back to sans-serif.
    $zip = [IO.Compression.ZipFile]::OpenRead($signed)
    try {
        $font = $zip.GetEntry("assets/one/fonts/inter_bold.ttf")
        $license = $zip.GetEntry("assets/one/OFL.txt")
        $assets = @($zip.Entries | Where-Object { $_.FullName.StartsWith("assets/one/") })
    } finally {
        $zip.Dispose()
    }
    if (-not $font -or -not $license) { throw "assets/one missing from $signed" }
    Write-Host ("assets   : {0} entries, Inter OK" -f $assets.Count)
    Write-Host ("APK      : {0} ({1} MB)" -f $signed,
        [math]::Round((Get-Item $signed).Length / 1MB, 1))
}

Write-Host ""
Write-Host "done. Install over the existing engine (keeps the account):"
Write-Host "  adb -s <serial> install -r single-apk/out-one/AppleMusic-one-<abi>.apk"
Write-Host "  adb -s <serial> shell am start -n com.apple.android.music/$Activity"
