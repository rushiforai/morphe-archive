<#
.SYNOPSIS
    Headless patch-run gate: patch every stock APK in apk/ with the current bundle and fail on
    any patch failure. No device, no install.

.DESCRIPTION
    The failure this gate exists for is the version bump: R8 reassigns every name per release,
    and the way a fingerprint stops matching is a patch that fails at patch time -- which only
    shows up when somebody runs the pipeline against the new APK. This script makes that run a
    one-command check: for each stock APK it invokes scripts/patch-and-install.ps1 -NoInstall
    (default options, no development switches, so the release-shaped build is what is checked),
    which itself fails loudly on a failed patch, on a patch the required set is missing, and on
    any audit finding -- and asserts the exit code here.

    It cannot run in CI: the stock APK is not committed. Run it before pushing, and whenever a
    store update lands:

        pwsh -NoProfile -File scripts/check-apk.ps1

    Patched outputs land in build/apk-check/<apk-name>/ (gitignored) so the runs cannot overwrite
    the user's own apk/ytvr-patched.apk.

.EXAMPLE
    pwsh -NoProfile -File scripts/check-apk.ps1 -Apk apk/com.google.android.apps.youtube.vr.oculus.apk
#>
[CmdletBinding()]
param(
    # Stock APKs to check. Defaults to every stock APK in apk/: the store-id name or an
    # oculus_<versioncode> build name, excluding patched/test outputs (ytvr-*, test-*).
    [string[]] $Apk,

    # Patch bundle. Defaults to the newest build in patches/build/libs, exactly like the
    # install pipeline -- and the pipeline's staleness guard refuses to run against an
    # out-of-date bundle, which is part of what makes this check trustworthy.
    [string] $Bundle,

    # Where the check's patched APKs and logs are written.
    [string] $OutRoot = 'build/apk-check'
)

$ErrorActionPreference = 'Stop'
$repo = Join-Path $PSScriptRoot '..'

function Fail([string] $message) {
    Write-Host "ERROR: $message" -ForegroundColor Red
    exit 1
}

if (-not $Apk -or $Apk.Count -eq 0) {
    $Apk = Get-ChildItem (Join-Path $repo 'apk') -Filter '*.apk' |
        Where-Object {
            $_.Name -match '^(com\.google\.android\.apps\.youtube\.vr\.oculus|oculus_)' -and
            $_.Name -notmatch 'patched|final|test|before|phantom'
        } |
        ForEach-Object { $_.FullName }
    if (-not $Apk -or @($Apk).Count -eq 0) {
        Fail "no stock APK found in apk/ -- pass one with -Apk <path>"
    }
}

$bundleArg = @()
if ($Bundle) { $bundleArg = @('-OurBundle', $Bundle) }

Write-Host "check-apk: patching $(@($Apk).Count) APK(s) headlessly (no device, no install)" -ForegroundColor Cyan

$results = @()
foreach ($apkPath in $Apk) {
    if (-not (Test-Path $apkPath)) { Fail "APK not found: $apkPath" }
    $name = [IO.Path]::GetFileNameWithoutExtension($apkPath)
    $outDir = Join-Path $repo "$OutRoot/$name"

    Write-Host ""
    Write-Host "[$name] patching $(Split-Path $apkPath -Leaf) ..." -ForegroundColor Cyan
    $log = Join-Path $outDir 'patch.log'
    New-Item -ItemType Directory -Force -Path $outDir | Out-Null

    # The pipeline prints its own loud failure (failed patch, missing required patch, audit
    # finding); the exit code is the verdict. Output goes to the console AND the log, so a
    # failure can be read back without re-running.
    & pwsh -NoProfile -File (Join-Path $PSScriptRoot 'patch-and-install.ps1') `
        -Apk $apkPath -NoInstall -OutDir $outDir @bundleArg 2>&1 |
        ForEach-Object { "$_" | Tee-Object -FilePath $log -Append }

    if ($LASTEXITCODE -ne 0) {
        $results += [pscustomobject] @{ Apk = $name; Verdict = 'FAIL' }
        Write-Host "[$name] FAIL -- see $log" -ForegroundColor Red
    } else {
        $results += [pscustomobject] @{ Apk = $name; Verdict = 'PASS' }
        Write-Host "[$name] PASS" -ForegroundColor Green
    }
}

Write-Host ""
$results | Format-Table -AutoSize
$failed = @($results | Where-Object Verdict -eq 'FAIL')
if ($failed.Count -gt 0) {
    Fail "$($failed.Count) APK(s) failed the patch run"
}
Write-Host "check-apk: every stock APK patched cleanly" -ForegroundColor Green
