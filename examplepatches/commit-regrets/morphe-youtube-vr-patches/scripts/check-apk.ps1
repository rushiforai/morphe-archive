<#
.SYNOPSIS
    Headless patch-run gate: patch every stock APK in apk/ that the bundle supports, and fail on
    any patch failure, audit finding or role mismatch. No device, no install.

.DESCRIPTION
    The failure this gate exists for is the version bump: R8 reassigns every name per release,
    and the way a fingerprint stops matching is a patch that fails at patch time -- which only
    shows up when somebody runs the pipeline against the new APK. This script makes that run a
    one-command check: for each stock APK it invokes scripts/patch-and-install.ps1 -NoInstall
    (default options, no development switches, so the release-shaped build is what is checked),
    which itself fails loudly on a failed patch, on a patch the required set is missing, and on
    any audit finding -- and asserts the exit code here.

    Which APKs the bare command sweeps, and why it is not simply "all of them":

    - a version is treated as supported exactly when its verified role expectations are committed
      as tools/dexaudit/roles/<version>.json;
    - a stock APK OLDER than the newest supported target is skipped with a note, so the dropped
      version left behind in apk/ after a flip does not fail the documented bare command;
    - a stock APK NEWER than the newest supported target is a FAILURE, not a skip. That APK is
      the store update this gate exists to catch, and skipping it would print PASS while never
      touching the version that needs re-deriving. Re-anchor it, run
      scripts/patch-probe.ps1 -Apk <path>, then generate its roles file from the verified build;
    - an APK whose filename carries no version (the store-id name) cannot be classified before
      patching, so it is skipped with a note -- pass it with -Apk to gate it. An APK named
      explicitly via -Apk is always gated strictly, whatever its version.

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
    # Stock APKs to check. Defaults to every supported stock APK in apk/ (the oculus_<versionCode>
    # build names whose version has a tools/dexaudit/roles/<version>.json), excluding patched/test
    # outputs (ytvr-*, test-*). APKs of versions OLDER than the newest supported target are skipped
    # with a printed note; an APK NEWER than it fails the run (see the description). An APK named
    # explicitly via -Apk is always gated strictly, whatever its version.
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

# The supported-version set, read off the roles directory: a version is supported exactly when
# its verified role expectations are committed. This is what lets the default sweep skip a
# dropped stock APK (1.89.09 after the 1.91.10 flip) instead of failing the documented bare
# pre-push command on it -- and what makes "newer than the newest supported target" detectable
# from the filenames alone.
$rolesDir = Join-Path $repo 'tools/dexaudit/roles'
$supportedVersions = @(Get-ChildItem $rolesDir -Filter '*.json' -ErrorAction SilentlyContinue |
    ForEach-Object { $_.BaseName })
$newestSupported = ($supportedVersions | ForEach-Object { [version]$_ } |
    Sort-Object -Descending | Select-Object -First 1)

# `oculus_<versionCode>_...` carries the version in the name: the 8 digits of 19110000 are
# major, two-digit minor, two-digit patch (1.91.10). The store-id filename carries no version,
# so the default sweep cannot tell whether it is supported before patching it.
function Get-VersionFromApkName([string] $fileName) {
    if ($fileName -match '^oculus_(\d{8})_') {
        $digits = $Matches[1]
        return '{0}.{1}.{2}' -f $digits[0], $digits.Substring(1, 2), $digits.Substring(3, 2)
    }
    return ''
}

if (-not $Apk -or $Apk.Count -eq 0) {
    if ($supportedVersions.Count -eq 0) {
        Fail "no role expectations in $rolesDir -- a version's tools/dexaudit/roles/<version>.json is what marks it supported; every APK would otherwise be skipped"
    }
    # Default sweep: only the APKs the bundle supports. The pipeline itself would fail an
    # unsupported version anyway (its patches are *skipped*, and the required-patch assertion
    # fails on that), so skipping an older one here is visible rather than silent -- but a NEWER
    # one is the store update this gate exists for, and must not be skipped (see the description).
    $Apk = @()
    foreach ($file in (Get-ChildItem (Join-Path $repo 'apk') -Filter '*.apk')) {
        if ($file.Name -notmatch '^(com\.google\.android\.apps\.youtube\.vr\.oculus|oculus_)') { continue }
        if ($file.Name -match 'patched|final|test|before|phantom') { continue }
        $versionInName = Get-VersionFromApkName $file.Name
        if (-not $versionInName) {
            Write-Host "check-apk: skipping $($file.Name) -- its version is not in the filename; pass it with -Apk to gate it" -ForegroundColor Yellow
            continue
        }
        if ($supportedVersions -notcontains $versionInName) {
            if ([version]$versionInName -gt $newestSupported) {
                Fail ("$($file.Name) is version $versionInName, newer than the newest supported " +
                    "target $newestSupported. That is the store update this gate exists to catch, " +
                    "so it is not skipped: re-derive the fingerprints against it " +
                    "(scripts/patch-probe.ps1 -Apk <path> is the work list), generate " +
                    "tools/dexaudit/roles/$versionInName.json from the verified build, and re-run. " +
                    "(-Apk <path> gates one APK before its roles file exists.)")
            }
            Write-Host "check-apk: skipping $($file.Name) -- version $versionInName is older than the newest supported target $newestSupported" -ForegroundColor Yellow
            continue
        }
        $Apk += $file.FullName
    }
    if (-not $Apk -or @($Apk).Count -eq 0) {
        Fail "no stock APK for a supported version found in apk/ -- pass one with -Apk <path>"
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
        continue
    }

    # Role expectations (tools/dexaudit/roles/<version>.json): the patched APK's injection sites
    # must match the verified build's exactly. This is the check the patch run cannot do -- a
    # re-anchor that matched the wrong-shaped-but-wrong method still reports every patch
    # Applied. The version comes from the result file (the stock APK's filename carries it only
    # in the oculus_<versioncode> shape). A missing file is a failure, not a skip: this gate
    # exists to make a new version's re-derivation finish with the expectations committed.
    $patched = Join-Path $outDir 'ytvr-patched.apk'
    $resultFile = Join-Path $outDir 'ytvr-patched.result.json'
    $version = ''
    if (Test-Path $resultFile) {
        $version = (Get-Content $resultFile -Raw | ConvertFrom-Json).packageVersion
    }
    if (-not $version) {
        $results += [pscustomobject] @{ Apk = $name; Verdict = 'FAIL' }
        Write-Host "[$name] FAIL -- no packageVersion in the patch result; cannot pick a roles file" -ForegroundColor Red
        continue
    }
    # `${version}` braces, not `$version:` -- the colon would parse as a drive-qualified variable.
    $rolesFile = Join-Path $repo "tools/dexaudit/roles/${version}.json"
    if (-not (Test-Path $rolesFile)) {
        $results += [pscustomobject] @{ Apk = $name; Verdict = 'FAIL' }
        Write-Host "[$name] FAIL -- no role expectations for version ${version}: create tools/dexaudit/roles/${version}.json from a verified build of it" -ForegroundColor Red
        continue
    }
    Write-Host "[$name] role expectations for $version ..." -ForegroundColor Cyan
    & pwsh -NoProfile -File (Join-Path $PSScriptRoot 'audit-patched-apk.ps1') `
        -Apk $patched -Roles $rolesFile -SkipXml -SkipReach 2>&1 |
        ForEach-Object { "$_" | Tee-Object -FilePath $log -Append }
    if ($LASTEXITCODE -ne 0) {
        $results += [pscustomobject] @{ Apk = $name; Verdict = 'FAIL' }
        Write-Host "[$name] FAIL -- role expectations mismatch -- see $log" -ForegroundColor Red
        continue
    }

    $results += [pscustomobject] @{ Apk = $name; Verdict = 'PASS' }
    Write-Host "[$name] PASS" -ForegroundColor Green
}

Write-Host ""
$results | Format-Table -AutoSize
$failed = @($results | Where-Object Verdict -eq 'FAIL')
if ($failed.Count -gt 0) {
    Fail "$($failed.Count) APK(s) failed the patch run"
}
Write-Host "check-apk: every supported stock APK patched cleanly and matched its role expectations" -ForegroundColor Green
