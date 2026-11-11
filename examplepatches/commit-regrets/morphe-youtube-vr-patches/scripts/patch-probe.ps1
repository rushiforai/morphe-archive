<#
.SYNOPSIS
    Diagnostic patch run of a stock APK with the current bundle -- the re-derivation workhorse
    (VERSIONING.md checklist step 3). No install, no device.

.DESCRIPTION
    Patches one stock APK with `--force --continue-on-error` so a fingerprint that stopped
    matching reports FAILED instead of stopping (or worse, skipping) the run, and prints the
    per-patch verdict from the result file. Diagnostics are on by default so the
    diagnostics-gated fingerprints (the innertube one) are exercised too; a probe with them off
    reports failures those fingerprints would have caught.

    The patch run is the authority on which fingerprints broke; the scratch harnesses
    (apk/scratch/Probe19*.java) only *measure* candidate anchors, and their predicates have
    drifted from the shipped fingerprints before -- a probe check that reads 0 while the patch
    applies is a stale probe, not a broken fingerprint. See docs/VERSIONING.md.

    Output lands in build/probe/patch-probe/<apk-name>/ (gitignored).

.EXAMPLE
    pwsh -NoProfile -File scripts\patch-probe.ps1 -Apk apk\oculus_19110000_..._1.91.10.apk
#>
[CmdletBinding()]
param(
    # The stock APK to probe.
    [Parameter(Mandatory = $true)]
    [string] $Apk,

    # Patch bundle. Defaults to the newest build in patches/build/libs (same as the pipeline).
    [string] $Bundle,

    # Keep diagnostics OFF -- only when deliberately probing the release-shaped hook set.
    [switch] $NoDiagnostics,

    # Where the probe APK, options file and result file are written.
    [string] $OutDir = (Join-Path (Split-Path $PSScriptRoot -Parent) 'build/probe/patch-probe')
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
# The resolvers read these script-scope variables; under StrictMode every one the script's
# call path touches must exist (see scripts/lib/resolvers.ps1).
$script:Java = $null
$script:MorpheCli = $null
$script:OurBundle = $Bundle
$script:Adb = $null
. (Join-Path $PSScriptRoot 'lib\resolvers.ps1')

function Fail([string] $message) {
    Write-Host "ERROR: $message" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $Apk)) { Fail "APK not found: $Apk" }
$java = Resolve-Java
$cli = Resolve-MorpheCli
if (-not $Bundle) { $Bundle = Resolve-OurBundle }
$name = [IO.Path]::GetFileNameWithoutExtension($Apk)
$out = Join-Path $OutDir $name
New-Item -ItemType Directory -Force -Path $out | Out-Null
$optionsFile = Join-Path $out 'probe.options.json'
$resultFile = Join-Path $out 'probe.result.json'
$outApk = Join-Path $out 'probe-patched.apk'
foreach ($f in @($optionsFile, $resultFile)) { if (Test-Path $f) { Remove-Item $f -Force } }

Write-Host "patch-probe: $name <- $(Split-Path $Bundle -Leaf) (cli $(Split-Path $cli -Leaf))" -ForegroundColor Cyan

# Full-coverage options file from the bundle's own skeleton, then overlay the run's values --
# the same shape the install pipeline uses (a minimal hand-rolled file makes the CLI warn, and
# a bare -O binds to the first --enable, dropping later options).
& $java -jar $cli options-create -p $Bundle -o $optionsFile | ForEach-Object { Write-Host "   $_" }
if ($LASTEXITCODE -ne 0) { Fail "options-create failed -> $optionsFile" }
$skeleton = Get-Content $optionsFile -Raw | ConvertFrom-Json
if (-not $NoDiagnostics) {
    $entry = $skeleton.patches.PSObject.Properties['Extension'].Value
    if (-not $entry) { Fail "the bundle has no 'Extension' patch to switch diagnostics on" }
    $entry | Add-Member -NotePropertyName enabled -NotePropertyValue $true -Force
    $entry.options | Add-Member -NotePropertyName enableDiagnostics -NotePropertyValue $true -Force
}
$json = ConvertTo-Json -InputObject @($skeleton) -Depth 16
[System.IO.File]::WriteAllText($optionsFile, $json, (New-Object System.Text.UTF8Encoding($false)))

$arguments = @('-jar', $cli, 'patch', '--patches', $Bundle,
    '--options-file', $optionsFile,
    '--force', '--continue-on-error',
    '--result-file', $resultFile, '-o', $outApk, $Apk)
Write-Host ">> $java $($arguments -join ' ')" -ForegroundColor DarkGray
& $java @arguments | ForEach-Object { Write-Host "   $_" }
if ($LASTEXITCODE -ne 0 -or -not (Test-Path $resultFile)) {
    Fail "the patch run failed (exit $LASTEXITCODE) -> $resultFile"
}

$r = Get-Content $resultFile -Raw | ConvertFrom-Json
$applied = @($r.appliedPatches)
$failed = @($r.failedPatches)
foreach ($p in $applied) { Write-Host "  OK    $p" }
foreach ($p in $failed) {
    $message = $p.error -replace '\r?\n.*', ''
    Write-Host "  FAIL  $($p.name): $message" -ForegroundColor Red
}
Write-Host ""
if ($failed.Count -gt 0) {
    Fail "$($failed.Count) patch(es) failed on $name -- that is the re-derivation work list"
}
Write-Host "patch-probe: all $($applied.Count) patch(es) applied cleanly on $name" -ForegroundColor Green
