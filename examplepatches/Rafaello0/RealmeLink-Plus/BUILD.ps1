#Requires -Version 7.0
<#
Build RealmeLink Plus locally. No admin privileges and no APK modification.
First build needs internet and Java 21, Git, PowerShell 7.
Credentials (if required by Morphe GitHub Packages) are read from environment.
#>
param([switch]$Reclone)
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)

$root = $PSScriptRoot
$repo = Join-Path $root "_work\hxreborn-v1.80.0"
$expected = "83839f596c9c7d8555c97809c34c2daabde03ec7"
$overlay = Join-Path $root "overlay"
$dist = Join-Path $root "dist"

function Require-Tool([string]$name) {
    if (-not (Get-Command $name -ErrorAction SilentlyContinue)) {
        throw "Required command '$name' not found."
    }
}
function Assert-Success([string]$step) {
    if ($LASTEXITCODE -ne 0) { throw "$step failed (exit $LASTEXITCODE)" }
}

Require-Tool "git"
Require-Tool "python"
Require-Tool "java"
Require-Tool "javac"
$javaVersion = (& java -version 2>&1 | Select-Object -First 1)
Write-Host "Java: $javaVersion"
if ($javaVersion -notmatch '"21(?:[\."])') { throw "Java JDK 21 required, check JAVA_HOME" }

if ($Reclone -and (Test-Path -LiteralPath $repo)) {
    Remove-Item -LiteralPath $repo -Recurse -Force
}
if (-not (Test-Path -LiteralPath (Join-Path $repo ".git"))) {
    New-Item -ItemType Directory -Path (Split-Path $repo -Parent) -Force | Out-Null
    & git -c core.longpaths=true clone --quiet --depth 1 --branch v1.80.0 https://github.com/hxreborn/morphe-patches.git $repo
    Assert-Success "git clone"
}
$actual = (& git -C $repo rev-parse HEAD).Trim()
Assert-Success "git rev-parse"
if ($actual -ne $expected) { throw "Unexpected hxreborn commit: $actual" }

# Restore the pinned clean checkout before each overlay; this is a dedicated build workspace.
& git -C $repo reset --hard $expected
Assert-Success "Reset pinned upstream"
& git -C $repo clean -fdx
Assert-Success "Clean upstream workspace"

& python (Join-Path $root "tools\test_runtime_java.py")
Assert-Success "Runtime regression tests"
& python (Join-Path $root "tools\test_prepare_upstream.py")
Assert-Success "Overlay retention tests"

foreach ($relative in @(
    "patches/src/main/kotlin/app/morphe/patches/realmelink/modes/ModeMemoryPatches.kt",
    "patches/src/main/kotlin/app/morphe/patches/realmelink/home/CleanHomeScreenPatch.kt",
    "extensions/extension/src/main/java/app/hxreborn/extension/realmelink/ModeKeeper.java",
    "extensions/extension/src/main/java/app/hxreborn/extension/realmelink/ModeSettingsUi.java"
)) {
    $from = Join-Path $overlay $relative
    if (-not (Test-Path -LiteralPath $from)) { throw "Missing $relative" }
    $to = Join-Path $repo $relative
    New-Item -ItemType Directory -Path (Split-Path $to -Parent) -Force | Out-Null
    Copy-Item -LiteralPath $from -Destination $to -Force
    Write-Host "Overlay $relative"
}


& python (Join-Path $root "tools\prepare_upstream.py") $repo
Assert-Success "Prepare upstream and rename bundle"
Push-Location $repo
try {
    & .\gradlew.bat ":patches:buildAndroid" "--no-daemon" "--stacktrace"
    Assert-Success "Morphe Gradle buildAndroid"
} finally {
    Pop-Location
}

$files = @(Get-ChildItem -LiteralPath (Join-Path $repo "patches\build\libs") -Filter "*.mpp" -File)
if ($files.Count -ne 1) { throw "Expected exactly one .mpp, found $($files.Count)" }
New-Item -ItemType Directory -Path $dist -Force | Out-Null
$version = if ($env:REALMELINK_RELEASE_VERSION) { $env:REALMELINK_RELEASE_VERSION } else { "0.3.0" }
if ($version -notmatch '^0\.3\.(\d+)$') { throw "Invalid release version: $version" }
$build = $Matches[1]
$target = Join-Path $dist "RealmeLink-Plus_build${build}_local.mpp"
Copy-Item -LiteralPath $files[0].FullName -Destination $target -Force
& python (Join-Path $root "tools\verify_bundle.py") $target
Assert-Success "Validate bundle metadata"
Write-Host "Created: $target"
Write-Host "SHA256: $((Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash)"
