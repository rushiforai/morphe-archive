<#
.SYNOPSIS
    Build the patch bundle in CI, apply it to an Instagram APK, and report what actually applied.

.DESCRIPTION
    "Build patches" only proves the bundle compiles - it never applies a patch to an APK, so a
    green run can still ship a bundle whose fingerprints no longer match. This script closes that
    gap:

      1. triggers build-patches.yml on main and waits for it (-SkipBuild / -Bundle to reuse one),
      2. downloads the .mpp artifact,
      3. patches an APK with morphe-desktop, continuing past individual failures,
      4. prints how many patches applied and names the ones that did not.

    Failures are split into OURS (view history) and piko's own: the first needs a fingerprint
    update, the second usually means the APK is not the build piko targets.

.PARAMETER Apk
    APK or APKM to patch. Defaults to the newest Instagram file in Downloads.

.PARAMETER Out
    Where to write the patched APK. Defaults to instagram-patched.apk on the Desktop.

.PARAMETER Patcher
    morphe-desktop.jar. Defaults to ..\tools\morphe-desktop.jar or .\tools\morphe-desktop.jar.

.PARAMETER Bundle
    Use this .mpp instead of building one.

.PARAMETER SkipBuild
    Reuse the newest .mpp in dist\ instead of triggering CI.

.PARAMETER Keystore
    Signing keystore. Defaults to piko.jks next to the patcher. If it is missing, one is created on
    first use so the signature stays stable across builds.

.PARAMETER Validate
    Also pass --validate, so any fingerprint matching more than one method is reported as failed.

.EXAMPLE
    .\update.ps1

.EXAMPLE
    .\update.ps1 -SkipBuild -Bundle .\dist\patches-3.11.1.mpp

.EXAMPLE
    .\update.ps1 -Apk "$HOME\Downloads\instagram.apkm" -Out "$HOME\Desktop\instagram-patched.apk"

.NOTES
    Needs gh (authenticated) and java on PATH. Run from anywhere; paths resolve from this file.
#>

[CmdletBinding()]
param(
    [string]$Apk,
    [string]$Out,
    [string]$Patcher,
    [string]$Bundle,
    [switch]$SkipBuild,
    [switch]$Validate,
    [string]$Keystore,
    [string]$KeystorePassword = 'pikohistory',
    [string]$KeystoreAlias = 'morphe',
    [string]$KeystoreEntryPassword = 'pikohistory',
    [string]$Repo = 'Dekum69/piko-view-history',
    [string]$Workflow = 'build-patches.yml'
)

$ErrorActionPreference = 'Stop'

$root = $PSScriptRoot
$dist = Join-Path $root 'dist'
New-Item -ItemType Directory -Path $dist -Force | Out-Null

function Write-Step([string]$Text) {
    Write-Host ""
    Write-Host "==> $Text" -ForegroundColor Cyan
}

function Stop-WithError([string]$Text) {
    Write-Host ""
    Write-Host "ERROR: $Text" -ForegroundColor Red
    exit 1
}

function Find-FirstExisting([string[]]$Paths) {
    foreach ($p in $Paths) {
        if ($p -and (Test-Path -LiteralPath $p)) { return (Resolve-Path -LiteralPath $p).Path }
    }
    return $null
}

function Get-KeytoolPath {
    $java = Get-Command java -ErrorAction SilentlyContinue
    if ($java) {
        $candidate = Join-Path (Split-Path $java.Source -Parent) 'keytool.exe'
        if (Test-Path -LiteralPath $candidate) { return $candidate }
    }
    $keytool = Get-Command keytool -ErrorAction SilentlyContinue
    if ($keytool) { return $keytool.Source }
    return $null
}

# --- patcher and APK ---------------------------------------------------------------------------

$Patcher = Find-FirstExisting @(
    $Patcher,
    (Join-Path $root 'tools\morphe-desktop.jar'),
    (Join-Path (Split-Path $root -Parent) 'tools\morphe-desktop.jar')
)
if (-not $Patcher) { Stop-WithError "morphe-desktop.jar not found. Pass -Patcher <path to jar>." }
if (-not (Get-Command java -ErrorAction SilentlyContinue)) { Stop-WithError "java is not on PATH." }

if (-not $Apk) {
    $downloads = Join-Path $HOME 'Downloads'
    $Apk = Get-ChildItem -LiteralPath $downloads -File -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -match 'instagram' -and $_.Extension -in '.apk', '.apkm' } |
        Sort-Object LastWriteTime -Descending |
        Select-Object -First 1 -ExpandProperty FullName
    if (-not $Apk) { Stop-WithError "No Instagram .apk/.apkm found in $downloads. Pass -Apk <path>." }
}
$Apk = (Resolve-Path -LiteralPath $Apk).Path

if (-not $Out) { $Out = Join-Path ([Environment]::GetFolderPath('Desktop')) 'instagram-patched.apk' }
$Out = [System.IO.Path]::GetFullPath($Out)

# --- bundle ------------------------------------------------------------------------------------

if (-not $Bundle -and -not $SkipBuild) {
    Write-Step "Building the bundle in CI ($Repo, $Workflow)"

    $before = gh run list --repo $Repo --workflow $Workflow --limit 1 --json databaseId --jq '.[0].databaseId'
    if ($LASTEXITCODE -ne 0) { Stop-WithError "gh is not authenticated for $Repo." }

    gh workflow run $Workflow --repo $Repo --ref main
    if ($LASTEXITCODE -ne 0) {
        Stop-WithError "Could not trigger $Workflow. Check that it exists on main and has workflow_dispatch."
    }

    $runId = $null
    for ($i = 0; $i -lt 60; $i++) {
        Start-Sleep -Seconds 5
        $now = gh run list --repo $Repo --workflow $Workflow --limit 1 --json databaseId --jq '.[0].databaseId'
        if ($now -and $now -ne $before) { $runId = $now; break }
    }
    if (-not $runId) { Stop-WithError "The workflow did not start within five minutes." }

    Write-Host "Run $runId queued; waiting for it to finish..."
    gh run watch $runId --repo $Repo --interval 15 | Out-Null

    $conclusion = gh run view $runId --repo $Repo --json conclusion --jq '.conclusion'
    if ($conclusion -ne 'success') {
        Stop-WithError "CI run $runId finished as '$conclusion'. Run: gh run view $runId --repo $Repo --log-failed"
    }

    $artifactDir = Join-Path $dist 'ci'
    Remove-Item -LiteralPath $artifactDir -Recurse -Force -ErrorAction SilentlyContinue
    gh run download $runId --repo $Repo -D $artifactDir
    if ($LASTEXITCODE -ne 0) { Stop-WithError "Could not download the artifact from run $runId." }

    $Bundle = Get-ChildItem -LiteralPath $artifactDir -Recurse -Filter *.mpp |
        Sort-Object LastWriteTime -Descending |
        Select-Object -First 1 -ExpandProperty FullName
}

if (-not $Bundle) {
    $Bundle = Get-ChildItem -LiteralPath $dist -Filter *.mpp -File -ErrorAction SilentlyContinue |
        Sort-Object LastWriteTime -Descending |
        Select-Object -First 1 -ExpandProperty FullName
    if (-not $Bundle) { Stop-WithError "No .mpp in $dist. Run without -SkipBuild, or pass -Bundle <path>." }
    Write-Host "Reusing $Bundle"
}
$Bundle = (Resolve-Path -LiteralPath $Bundle).Path

# --- signing keystore --------------------------------------------------------------------------

$Keystore = Find-FirstExisting @(
    $Keystore,
    (Join-Path (Split-Path $Patcher -Parent) 'piko.jks'),
    (Join-Path $root 'piko.jks')
)

function Get-SigningArgs {
    if (-not $Keystore) { return @() }
    return @(
        '--keystore', $Keystore,
        '--keystore-password', $KeystorePassword,
        '--keystore-entry-alias', $KeystoreAlias,
        '--keystore-entry-password', $KeystoreEntryPassword
    )
}

function Invoke-Patch {
    param([string[]]$SigningArgs)

    Remove-Item -LiteralPath $Out, $log, $report -Force -ErrorAction SilentlyContinue

    $javaArgs = @('patch', '-p', $Bundle, '-o', $Out, '--continue-on-error', '-r', $report)
    if ($Validate) { $javaArgs += '--validate' }
    if ($SigningArgs) { $javaArgs += $SigningArgs }
    $javaArgs += $Apk

    java -jar $Patcher @javaArgs 2>&1 | Tee-Object -FilePath $log | Out-Null

    if (Test-Path -LiteralPath $report) {
        try { return (Get-Content -LiteralPath $report -Raw | ConvertFrom-Json) } catch { return $null }
    }
    return $null
}

$log = Join-Path $dist 'last-run.log'
$report = Join-Path $dist 'last-run.json'

Write-Step "Patching $([System.IO.Path]::GetFileName($Apk))"
Write-Host "Bundle:   $Bundle"
Write-Host "Output:   $Out"
if ($Keystore) { Write-Host "Keystore: $Keystore" }

$result = Invoke-Patch (Get-SigningArgs)

# morphe's bundled keystore loader fails on some JDKs ("JCE cannot authenticate the provider BC").
# A JKS keystore goes through the SUN provider instead, and keeps the signature stable.
$bcFailure = $result -and (-not $result.success) -and ($result.failureReason -match 'JCE|provider BC')
if ($bcFailure -and -not $Keystore) {
    Write-Host ""
    Write-Host "Signing failed inside morphe's BouncyCastle keystore loader; retrying with a JKS keystore." -ForegroundColor Yellow

    $keytool = Get-KeytoolPath
    if (-not $keytool) { Stop-WithError "keytool not found, so a JKS keystore cannot be created. Pass -Keystore <path>." }

    $Keystore = Join-Path (Split-Path $Patcher -Parent) 'piko.jks'
    New-Item -ItemType Directory -Path (Split-Path $Keystore -Parent) -Force | Out-Null
    & $keytool -genkeypair -keystore $Keystore -storetype JKS -alias $KeystoreAlias `
        -storepass $KeystorePassword -keypass $KeystoreEntryPassword `
        -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Piko View History" 2>&1 | Out-Null

    if (-not (Test-Path -LiteralPath $Keystore)) {
        Stop-WithError "Could not create $Keystore."
    }
    Write-Host "Created $Keystore (keep it: the same key signs every future build)."

    $result = Invoke-Patch (Get-SigningArgs)
}

# --- report ------------------------------------------------------------------------------------

if (-not $result) {
    # Older patcher without -r: fall back to the log.
    if (-not (Test-Path -LiteralPath $log)) { Stop-WithError "The patcher produced no output." }
    $text = [regex]::Replace((Get-Content -LiteralPath $log -Raw), "$([char]27)\[[0-9;]*m", '')
    $lines = $text -split "`r?`n"
    $applied = @($lines | Where-Object { $_ -match '^INFO: Applied: ' } | ForEach-Object { ($_ -replace '^INFO: Applied: ', '').Trim() })
    $failed = @($lines | Where-Object { $_ -match '^ERROR: Failed: ' } | ForEach-Object { ($_ -replace '^ERROR: Failed: ', '').Trim() })
    $failureReason = ($lines | Where-Object { $_ -match '^ERROR: Patching aborted: ' } | Select-Object -First 1)
}
else {
    $applied = @($result.appliedPatches)
    $failed = @($result.failedPatches)
    $failureReason = $result.failureReason
}

$ourPatches = @(
    'View history',
    'Log feed posts to view history',
    'Log Reels to view history',
    'Log stories to view history'
)

Write-Step "Result"
Write-Host "Applied: $($applied.Count)   Failed: $($failed.Count)"

if ($failed.Count -gt 0) {
    Write-Host ""
    foreach ($name in $failed) {
        if ($ourPatches -contains $name) { Write-Host "  [ours] $name" -ForegroundColor Red }
        else { Write-Host "  [piko] $name" -ForegroundColor DarkYellow }
    }
}

if ($result -and -not $result.success -and $failed.Count -eq 0) {
    Stop-WithError "Patching did not finish: $failureReason`nSee $log"
}

if ($applied.Count -eq 0 -and $failed.Count -eq 0) {
    Stop-WithError "No patch was applied. The APK is probably not the build this bundle targets (check the version in $log)."
}

if (-not (Test-Path -LiteralPath $Out)) {
    Stop-WithError "No APK was written. See $log"
}

$apkInfo = Get-Item -LiteralPath $Out
$hash = (Get-FileHash -LiteralPath $Out -Algorithm SHA256).Hash.ToLower()

Write-Host ""
Write-Host ("APK:    {0}" -f $apkInfo.FullName)
Write-Host ("Size:   {0:N2} MB" -f ($apkInfo.Length / 1MB))
Write-Host ("SHA256: {0}" -f $hash)

$oursFailed = @($failed | Where-Object { $ourPatches -contains $_ })
$pikoFailed = @($failed | Where-Object { $ourPatches -notcontains $_ })

if ($oursFailed.Count -gt 0) {
    Write-Host ""
    Write-Host "A view-history patch failed. That is our fingerprint drifting, not a bad APK." -ForegroundColor Red
    Write-Host "Fix: MAINTENANCE.md -> Scenario 2 (the error names the file and lists the candidates)."
    exit 1
}

if ($pikoFailed.Count -gt 0) {
    Write-Host ""
    Write-Host "Only stock piko patches failed, so this APK is not the build the bundle targets." -ForegroundColor Yellow
    Write-Host "Use the Instagram version named in $log, or wait for a piko release that supports this one."
    exit 1
}

Write-Host ""
Write-Host "All $($applied.Count) patches applied." -ForegroundColor Green
exit 0
