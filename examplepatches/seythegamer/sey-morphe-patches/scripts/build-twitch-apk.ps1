# Builds the combined bundle and applies the Twitch patches to the original
# Twitch APKM with the Morphe CLI. The CLI merges every split, so the output is
# a single universal APK.
[CmdletBinding()]
param(
    [string]$InputApk,
    [string]$OutputApk,
    [string]$Version = '1.2.4'
)

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot '_common.ps1')
Set-Location $script:RepoRoot

if (-not $InputApk) {
    $InputApk = Join-Path $script:RepoRoot 'tv.twitch.android.app_13.0.0.2-1100000018_2arch_1dpi_24lang_fb696e0c77dafead708ead3bb0faae4a_apkmirror.com.apkm'
}
if (-not $OutputApk) {
    $OutputApk = Join-Path $script:RepoRoot 'dist\TwitchTV-Morphe-13.0.0.2-universal.apk'
}

& (Join-Path $PSScriptRoot 'build-patch.ps1') -Version $Version

$InputApk = [System.IO.Path]::GetFullPath($InputApk)
$OutputApk = [System.IO.Path]::GetFullPath($OutputApk)
$mpp = Join-Path $script:RepoRoot "dist\SeyMorphe-$Version.mpp"
$patcherJar = Join-Path $script:RepoRoot 'tools\morphe-desktop.jar'
$keystore = Join-Path $script:RepoRoot 'build\twitch-morphe.keystore'
$keyAlias = 'morphe'
$storePassword = 'morphe123'

if (-not (Test-Path $InputApk)) {
    throw "Input APK not found: $InputApk"
}

$java = Get-ToolJava
$keytool = Join-Path (Split-Path $java -Parent) 'keytool.exe'

if (-not (Test-Path $keystore)) {
    Write-Host "Creating signing key at $keystore..."
    New-Item (Split-Path $keystore -Parent) -ItemType Directory -Force | Out-Null
    & $keytool -genkeypair `
        -keystore $keystore `
        -storepass $storePassword `
        -keypass $storePassword `
        -alias $keyAlias `
        -keyalg RSA `
        -keysize 2048 `
        -validity 10000 `
        -dname "CN=Morphe Twitch TV, OU=Morphe, O=Morphe, L=NA, ST=NA, C=NA"
    if ($LASTEXITCODE -ne 0) {
        throw "keytool failed with exit code $LASTEXITCODE."
    }
}

New-Item (Split-Path $OutputApk -Parent) -ItemType Directory -Force | Out-Null
if (Test-Path $OutputApk) {
    Remove-Item $OutputApk -Force
}

Write-Host "Patching $InputApk..."
& $java -jar $patcherJar patch `
    --patches $mpp `
    --out $OutputApk `
    --result-file (Join-Path $script:RepoRoot 'dist\twitch-patch-result.json') `
    --keystore $keystore `
    --keystore-password $storePassword `
    --keystore-entry-password $storePassword `
    --keystore-entry-alias $keyAlias `
    $InputApk
if ($LASTEXITCODE -ne 0) {
    throw "Morphe CLI failed with exit code $LASTEXITCODE."
}

$buildTools = Get-BuildToolsDir
$apksigner = Join-Path $buildTools 'apksigner.bat'
$zipalign = Join-Path $buildTools 'zipalign.exe'

Write-Host "Verifying signature and alignment..."
& $apksigner verify --print-certs $OutputApk
if ($LASTEXITCODE -ne 0) {
    throw "apksigner verification failed."
}

& $zipalign -c -p 4 $OutputApk
if ($LASTEXITCODE -ne 0) {
    throw "zipalign verification failed."
}

Write-Host "Patched APK: $OutputApk ($((Get-Item $OutputApk).Length) bytes)"
