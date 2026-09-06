# run-replay.ps1 — build and run the Prime Video native filter replay harness.
#
# This is the fast feedback loop. It runs the exact shipping filter logic
# against captured payloads on the host, in about one second, with no device,
# no APK build, and no manual playback.
#
# Usage:
#   .\run-replay.ps1
#   .\run-replay.ps1 -FixtureDir "C:\path\to\fixtures"

[CmdletBinding()]
param(
    [string]$FixtureDir,
    [string]$VsDevCmd = 'C:\Program Files\Microsoft Visual Studio\18\Professional\Common7\Tools\VsDevCmd.bat'
)

$ErrorActionPreference = 'Stop'

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
if ([string]::IsNullOrWhiteSpace($FixtureDir)) {
    $FixtureDir = Join-Path $scriptDir 'fixtures'
}

if (-not (Test-Path -LiteralPath $VsDevCmd)) {
    $found = Get-ChildItem -Path 'C:\Program Files\Microsoft Visual Studio' -Recurse `
        -Filter 'VsDevCmd.bat' -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($null -eq $found) {
        throw "VsDevCmd.bat not found. Pass -VsDevCmd with the correct path."
    }
    $VsDevCmd = $found.FullName
}

if (-not (Test-Path -LiteralPath $FixtureDir)) {
    throw "Fixture directory not found: $FixtureDir"
}

Push-Location $scriptDir
try {
    $sources = @(
        'replay.cpp'
        '..\jni\ad_response.cpp'
        '..\jni\remote_strip.cpp'
    ) -join ' '

    $flags = @(
        '/nologo'
        '/std:c++17'
        '/EHsc'
        '/W4'
        '/DPV_SKIP_GVA_REMOTES=1'
        '/DPV_REMOTE_DIAG=1'
    ) -join ' '

    $build = "`"$VsDevCmd`" -arch=x64 -host_arch=x64 >nul && cl.exe $flags $sources /Fe:replay.exe"
    & cmd.exe /d /s /c $build
    if ($LASTEXITCODE -ne 0) { throw "compile failed with exit code $LASTEXITCODE" }

    & .\replay.exe $FixtureDir
    $replayExit = $LASTEXITCODE

    Get-ChildItem -Path $scriptDir -Filter '*.obj' -ErrorAction SilentlyContinue |
        Remove-Item -Force -ErrorAction SilentlyContinue

    exit $replayExit
}
finally {
    Pop-Location
}
