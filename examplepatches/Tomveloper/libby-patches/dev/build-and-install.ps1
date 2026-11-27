<#
.SYNOPSIS
Build the patch bundle, apply it to the stock Libby APK, and install it.

.DESCRIPTION
With no switches, all three steps run in order. Use one or more switches to run
only those steps. Files are discovered automatically, so no version numbers are
hardcoded here.

.EXAMPLE
.\dev\build-and-install.ps1              # build, patch, install
.\dev\build-and-install.ps1 -Build       # build only
.\dev\build-and-install.ps1 -Patch       # patch only
.\dev\build-and-install.ps1 -Install     # install only
.\dev\build-and-install.ps1 -Patch -Install
#>
[CmdletBinding()]
param(
    [switch] $Build,
    [switch] $Patch,
    [switch] $Install
)

$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent $PSScriptRoot
Set-Location $repo

function Get-LatestFile {
    param([string] $Pattern, [string] $Label)

    $files = @(Get-ChildItem -Path $Pattern -File -ErrorAction SilentlyContinue)
    if ($files.Count -eq 0) {
        throw "No file matches '$Pattern' (needed for $Label)."
    }
    $file = $files | Sort-Object LastWriteTime -Descending | Select-Object -First 1
    if ($files.Count -gt 1) {
        Write-Host "Several $Label files found; using $($file.Name)." -ForegroundColor Yellow
    }
    return $file.FullName
}

function Assert-Success {
    param([string] $Step)
    if ($LASTEXITCODE -ne 0) {
        throw "$Step failed (exit code $LASTEXITCODE)."
    }
}

function Invoke-BuildStep {
    Write-Host '== Build ==' -ForegroundColor Cyan
    & .\gradlew.bat buildAndroid --console=plain
    Assert-Success 'Build'
}

function Invoke-PatchStep {
    Write-Host '== Patch ==' -ForegroundColor Cyan

    $jar = Get-LatestFile (Join-Path $repo 'dev/tools/morphe-desktop-*-all.jar') 'Morphe jar'
    $bundle = Get-LatestFile (Join-Path $repo 'patches/build/libs/patches-*.mpp') 'patch bundle'
    $apk = Get-LatestFile (Join-Path $repo 'dev/tools/libby-*.apk') 'stock Libby APK'

    # Morphe 2.4.0 looks for the signing key next to the jar, not in build/.
    # Restore it from the backup copy if that directory is missing or clean.
    $toolDir = Split-Path -Parent $jar
    $dataDir = Join-Path $toolDir 'morphe-data'
    $liveKey = Join-Path $dataDir 'morphe.keystore'
    $backupKey = Join-Path $toolDir 'morphe.keystore'
    if (-not (Test-Path $liveKey)) {
        New-Item -ItemType Directory -Force $dataDir | Out-Null
        Copy-Item $backupKey $liveKey
        Write-Host "Restored signing key from $backupKey"
    }

    $output = Join-Path $repo 'build/libby-patched.apk'
    New-Item -ItemType Directory -Force (Split-Path -Parent $output) | Out-Null

    Write-Host "jar:    $jar"
    Write-Host "bundle: $bundle"
    Write-Host "input:  $apk"
    & java -jar $jar patch -p $bundle -o $output $apk
    Assert-Success 'Patch'
    Write-Host "Patched APK: $output"
}

function Invoke-InstallStep {
    Write-Host '== Install ==' -ForegroundColor Cyan

    $output = Join-Path $repo 'build/libby-patched.apk'
    if (-not (Test-Path $output)) {
        throw "No patched APK at $output. Run -Patch first."
    }

    $adb = Join-Path $env:LOCALAPPDATA 'Android/Sdk/platform-tools/adb.exe'
    if (-not (Test-Path $adb)) {
        $adb = 'adb'
    }

    & $adb devices
    Assert-Success 'adb devices'
    # -r updates in place and keeps app data. It only works while the signing
    # key matches the installed build.
    & $adb install -r $output
    Assert-Success 'adb install'
}

$runAll = -not ($Build -or $Patch -or $Install)
if ($runAll -or $Build) { Invoke-BuildStep }
if ($runAll -or $Patch) { Invoke-PatchStep }
if ($runAll -or $Install) { Invoke-InstallStep }
