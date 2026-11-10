<#
.SYNOPSIS
    Rebuild a TimeTree XAPK with the ad pipeline patched out.

.DESCRIPTION
    Full pipeline: unpack -> smali patch -> reassemble -> zipalign -> sign -> repack XAPK.
    Resources are never recompiled (apktool -r), because TimeTree's resources.arsc
    references attributes that no longer have a <attr> declaration
    (state_swiped, glance_isTopLevelLayout, ...) and aapt2 refuses to link them.

.PARAMETER Xapk
    Source XAPK (with base + config splits) of a supported TimeTree version.

.PARAMETER OutDir
    Working directory. Defaults to .\build.

.PARAMETER Keystore
    Keystore used to sign base and every split. Created when missing.

.EXAMPLE
    .\build-patched-apk.ps1 -Xapk .\TimeTree_15.34.1.xapk
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][string]$Xapk,
    [string]$OutDir = ".\build",
    [string]$Keystore = ".\timetree.keystore",
    [string]$KeyAlias = "timetree",
    [string]$StorePass = "timetree123",
    [string]$ApktoolJar = ".\tools\apktool_2.12.0.jar",
    [string]$JavaHome = $env:JAVA_HOME,
    [string]$BuildTools = ""
)

$ErrorActionPreference = "Stop"
$script:root = Split-Path -Parent $MyInvocation.MyCommand.Path
$script:jdk = if ($JavaHome) { Join-Path $JavaHome "bin\java.exe" } else { "java.exe" }

function Get-AndroidTool([string]$name) {
    if ($BuildTools) {
        $hit = Get-ChildItem -Path $BuildTools -Recurse -Filter $name -ErrorAction SilentlyContinue |
            Select-Object -First 1
        if ($hit) { return $hit.FullName }
    }
    $cmd = Get-Command $name -ErrorAction SilentlyContinue
    if ($cmd) { return $cmd.Source }
    throw "$name not found. Pass -BuildTools <android-sdk build-tools dir>."
}

function Step([string]$text) { Write-Host "==> $text" -ForegroundColor Cyan }

New-Item -ItemType Directory -Force -Path $OutDir | Out-Null
$OutDir = (Resolve-Path $OutDir).Path
$tmp = Join-Path $OutDir "tmp"
New-Item -ItemType Directory -Force -Path $tmp | Out-Null

# 1. unpack the xapk container
Step "unpacking $Xapk"
$stage = Join-Path $OutDir "xapk"
Remove-Item -Recurse -Force $stage -ErrorAction SilentlyContinue
Expand-Archive -Path $Xapk -DestinationPath $stage -Force
$splits = Get-ChildItem $stage -Filter "config.*.apk"
$base = Get-ChildItem $stage -Filter "*.apk" |
    Where-Object { $_.Name -notlike "config.*" } |
    Sort-Object Length -Descending | Select-Object -First 1
if (-not $base) { throw "base APK not found inside $Xapk" }
Write-Host "    base: $($base.Name)  splits: $($splits.Name -join ', ')"

# 2. decode code only
Step "decoding (code only)"
$decoded = Join-Path $OutDir "decoded"
Remove-Item -Recurse -Force $decoded -ErrorAction SilentlyContinue
& $script:jdk "-Djava.io.tmpdir=$tmp" -jar $ApktoolJar d -r -f --frame-path (Join-Path $OutDir "framework") -o $decoded $base.FullName
if ($LASTEXITCODE -ne 0) { throw "apktool decode failed" }

# 3. apply smali edits
Step "applying ad patches"
python (Join-Path $script:root "tools\apply_smali_patch.py") $decoded
if ($LASTEXITCODE -ne 0) { throw "smali patch failed - app version changed, update the fingerprints" }

# 4. reassemble
Step "reassembling"
$rebuilt = Join-Path $OutDir "base_rebuilt.apk"
& $script:jdk "-Djava.io.tmpdir=$tmp" -Xmx6g -jar $ApktoolJar b -f --frame-path (Join-Path $OutDir "framework") -o $rebuilt $decoded
if ($LASTEXITCODE -ne 0) { throw "apktool build failed" }

# 5. drop the duplicated assets.dex that apktool emits for assets/*.dex
Step "cleaning redundant entries"
python (Join-Path $script:root "tools\strip_assets_dex.py") $rebuilt
if ($LASTEXITCODE -ne 0) { throw "entry cleanup failed" }

# 6. align + sign
if (-not (Test-Path $Keystore)) {
    Step "creating keystore $Keystore"
    & (Join-Path (Split-Path $script:jdk) "keytool.exe") -genkeypair -keystore $Keystore `
        -storepass $StorePass -keypass $StorePass -alias $KeyAlias `
        -keyalg RSA -keysize 2048 -validity 10000 `
        -dname "CN=TimeTree Mod, OU=Local, O=Local, L=Local, S=Local, C=TW"
}
$zipalign = Get-AndroidTool "zipalign.exe"
$apksignerJar = Get-AndroidTool "apksigner.jar"

Step "aligning base"
$aligned = Join-Path $OutDir "base_aligned.apk"
& $zipalign -p -f 4 $rebuilt $aligned
if ($LASTEXITCODE -ne 0) { throw "zipalign failed" }

Step "signing base + splits (same key)"
$signed = Join-Path $OutDir "signed"
Remove-Item -Recurse -Force $signed -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force -Path $signed | Out-Null
$signArgs = @(
    "-jar", $apksignerJar, "sign",
    "--ks", (Resolve-Path $Keystore).Path,
    "--ks-pass", "pass:$StorePass",
    "--key-pass", "pass:$StorePass",
    "--ks-key-alias", $KeyAlias,
    "--min-sdk-version", "32",
    "--v1-signing-enabled", "false",
    "--v2-signing-enabled", "true",
    "--v3-signing-enabled", "true"
)
& $script:jdk @signArgs --out (Join-Path $signed $base.Name) $aligned
foreach ($split in $splits) {
    & $script:jdk @signArgs --out (Join-Path $signed $split.Name) $split.FullName
    if ($LASTEXITCODE -ne 0) { throw "signing failed for $($split.Name)" }
}

# 7. repack
foreach ($extra in @("manifest.json", "icon.png")) {
    $src = Join-Path $stage $extra
    if (Test-Path $src) { Copy-Item $src (Join-Path $signed $extra) -Force }
}
Step "packing xapk"
$result = Join-Path $OutDir ("TimeTree_ads-patched.xapk")
Remove-Item -Force $result -ErrorAction SilentlyContinue
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::CreateFromDirectory(
    $signed, $result,
    [System.IO.Compression.CompressionLevel]::NoCompression, $false)

Step "done"
Write-Host "patched xapk: $result"
Write-Host "sha256      : $((Get-FileHash $result -Algorithm SHA256).Hash)"
