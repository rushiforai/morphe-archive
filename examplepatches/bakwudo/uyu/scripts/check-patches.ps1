<#
.SYNOPSIS
    Patches a Twitch APK/APKM with the built bundle and lists which patches failed and why.

.DESCRIPTION
    Used when moving to a new Twitch version (see docs/updating.md). Every patch is attempted
    (--continue-on-error), so one run shows all fingerprints that no longer match.

    The Morphe Desktop jar is taken from -MorpheDesktop or the UYU_MORPHE_DESKTOP environment variable.

.PARAMETER Apk
    Twitch APK/APKM to patch. Defaults to the newest *.apkm or *.apk in apk/.

.PARAMETER Mpp
    Patch bundle to test. Defaults to the newest patches/build/libs/patches-*.mpp.

.PARAMETER Build
    Build the bundle first (scripts/gradlew.ps1 buildAndroid).

.PARAMETER Force
    Skip Morphe's app version check. Only needed when testing an APK whose version does not
    match Constants.TWITCH_VERSION.

.EXAMPLE
    ./scripts/check-patches.ps1 -Build
#>
param(
    [string]$Apk,
    [string]$Mpp,
    [string]$MorpheDesktop = $env:UYU_MORPHE_DESKTOP,
    [switch]$Build,
    [switch]$Force
)
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot

if ($Build) {
    & (Join-Path $PSScriptRoot 'gradlew.ps1') buildAndroid
    if ($LASTEXITCODE -ne 0) { throw 'Build failed.' }
}

if (-not $MorpheDesktop -or -not (Test-Path $MorpheDesktop)) {
    throw 'Morphe Desktop jar not found. Pass -MorpheDesktop <path> or set UYU_MORPHE_DESKTOP.'
}

if (-not $Apk) {
    $Apk = Get-ChildItem (Join-Path $root 'apk') -File -ErrorAction SilentlyContinue |
        Where-Object { $_.Extension -in '.apkm', '.apk' } |
        Sort-Object LastWriteTime -Descending | Select-Object -First 1 -ExpandProperty FullName
    if (-not $Apk) { throw 'No *.apkm or *.apk found in apk/. Pass -Apk <path>.' }
}

if (-not $Mpp) {
    $Mpp = Get-ChildItem (Join-Path $root 'patches\build\libs') -Filter 'patches-*.mpp' -File -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -notmatch 'sources|javadoc' } |
        Sort-Object LastWriteTime -Descending | Select-Object -First 1 -ExpandProperty FullName
    if (-not $Mpp) { throw 'No built bundle found. Run with -Build or pass -Mpp <path>.' }
}

$work = Join-Path $root 'build\check'
New-Item -ItemType Directory -Force $work | Out-Null
$result = Join-Path $work 'result.json'
if (Test-Path $result) { Remove-Item $result }

$arguments = @(
    '-jar', $MorpheDesktop, 'patch',
    '-p', $Mpp,
    '--continue-on-error',
    '--unsigned',
    '-r', $result,
    '-o', (Join-Path $work 'patched.apk'),
    '-t', (Join-Path $work 'tmp')
)
if ($Force) { $arguments += '--force' }
$arguments += $Apk

Write-Host "APK:    $Apk"
Write-Host "Bundle: $Mpp"
& java @arguments

if (-not (Test-Path $result)) {
    throw "Morphe Desktop did not write $result (exit code $LASTEXITCODE)."
}

$report = Get-Content $result -Raw | ConvertFrom-Json
Write-Host ''
Write-Host "Target: $($report.packageName) $($report.packageVersion)"
Write-Host ''
Write-Host "Applied ($(@($report.appliedPatches).Count)):"
foreach ($patch in $report.appliedPatches) { Write-Host "  OK    $($patch.name)" }

$failed = @($report.failedPatches)
Write-Host ''
Write-Host "Failed ($($failed.Count)):"
foreach ($entry in $failed) {
    Write-Host "  FAIL  $($entry.patch.name)" -ForegroundColor Red
    Write-Host "        $($entry.reason)"
}

$failedSteps = @($report.patchingSteps | Where-Object { -not $_.success })
if ($failedSteps.Count -gt 0) {
    Write-Host ''
    foreach ($step in $failedSteps) {
        Write-Host "  STEP FAILED  $($step.step)" -ForegroundColor Red
    }
}

if ($failed.Count -gt 0 -or $failedSteps.Count -gt 0) { exit 1 }
