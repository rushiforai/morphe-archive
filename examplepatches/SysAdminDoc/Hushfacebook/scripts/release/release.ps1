<#
.SYNOPSIS
    Runs a Hushfacebook release one stage at a time.

.DESCRIPTION
    preflight  The quick checks a release gate would otherwise reach late, in about five minutes:
               the script contract tests, the patch tests that don't read the Facebook fixtures,
               the extension's translation and release-check tests, both Android lints and the
               release facts with the index still on the previous release. Run it on the clean
               source commit, before the push whose pre-push gate runs everything.

    Gradle goes through HUSHFACEBOOK_BUILD_WRAPPER as the pre-push gate does, or through the
    machine's build queue (BUILD_QUEUE_SCRIPT) when no wrapper is set. Every heavy step runs at
    release priority, and the variables this sets are put back when it ends.

.EXAMPLE
    scripts/release/release.ps1 -Stage preflight -Version 0.9.0
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][ValidateSet('preflight')][string]$Stage,
    [Parameter(Mandatory = $true)][ValidatePattern('^\d+\.\d+\.\d+$')][string]$Version
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
. (Join-Path $root 'scripts/common.ps1')

function Step([string]$Text) { Write-Host "[release] $Text" -ForegroundColor Cyan }

function Assert-Clean {
    $changes = @(& git -C $root status --porcelain --untracked-files=all)
    if ($LASTEXITCODE -ne 0) { throw "git could not read the working tree at $root." }
    if ($changes.Count -gt 0) { throw "The working tree has changes, so what's checked isn't a commit: $($changes[0])" }
}

function Assert-SourceVersion {
    $source = Get-BundleVersion -Root $root
    if ($source -ne $Version) { throw "gradle.properties says $source, not $Version." }
}

function Invoke-Gradle {
    param([Parameter(Mandatory = $true)][string[]]$Tasks)
    Set-GitHubPackagesCredential
    $wrapper = $env:HUSHFACEBOOK_BUILD_WRAPPER
    if ($wrapper -and -not (Test-Path -LiteralPath $wrapper -PathType Leaf)) {
        throw "HUSHFACEBOOK_BUILD_WRAPPER names $wrapper, which is not there."
    }
    $global:LASTEXITCODE = 0
    if ($wrapper) {
        & $wrapper -ProjectDir $root -Tasks $Tasks
    } else {
        Invoke-HeavyJob -Label "release gradle $($Tasks[0])" -ScriptBlock { & (Join-Path $root 'gradlew.bat') -p $root @Tasks }
    }
    if ($LASTEXITCODE -ne 0) { throw "Gradle $($Tasks -join ' ') did not pass (exit $LASTEXITCODE)." }
}

# The hook imports these from the user's registry the same way: a shell opened before they were
# set doesn't have them. What this run sets or imports is put back at the end, so the shell isn't
# left at release priority or holding a token it didn't have.
$touched = @('HUSHFACEBOOK_FIXTURE_DIR', 'HUSHFACEBOOK_BUILD_WRAPPER', 'HUSHFACEBOOK_DESKTOP_JAR', 'HUSHFACEBOOK_WORKDIR',
    'BUILD_QUEUE_SCRIPT', 'BUILD_QUEUE_PRIORITY', 'GITHUB_ACTOR', 'GITHUB_TOKEN')
$before = @{}
foreach ($name in $touched) { $before[$name] = [Environment]::GetEnvironmentVariable($name, 'Process') }
try {
    foreach ($name in $touched | Where-Object { $_ -like 'HUSHFACEBOOK_*' -or $_ -eq 'BUILD_QUEUE_SCRIPT' }) {
        if (-not $before[$name]) {
            $value = [Environment]::GetEnvironmentVariable($name, 'User')
            if ($value) { [Environment]::SetEnvironmentVariable($name, $value, 'Process') }
        }
    }
    $env:BUILD_QUEUE_PRIORITY = 'release'

    switch ($Stage) {
        'preflight' {
            Assert-Clean
            Assert-SourceVersion
            $started = Get-Date

            Step 'script contract tests'
            $global:LASTEXITCODE = 0
            & (Get-Process -Id $PID).Path -NoProfile -File (Join-Path $root 'scripts/test-script-contracts.ps1') -Root $root
            if ($LASTEXITCODE -ne 0) { throw "The script contract tests did not pass (exit $LASTEXITCODE)." }

            # One Gradle run: the patch tests without the fixture partition and its selection check,
            # the extension tests a release's text depends on, and both lints. The pre-push gate's
            # quick pass is the same patch partition, so this is what fails first there too.
            Step 'quick patch tests, translation and release-check tests, both lints'
            Invoke-Gradle @(
                ':patches:test', '-x', ':patches:fixtureTest', '-x', ':patches:verifyPatchTestSelection',
                ':extensions:facebook:testDebugUnitTest', '--tests', '*L10nTest', '--tests', '*L10nCatalogTest',
                '--tests', '*ReleaseCheckTest',
                ':extensions:shared:library:lint', ':extensions:facebook:lint')

            Step 'release facts, with the index still on the previous release'
            $global:LASTEXITCODE = 0
            & (Join-Path $root 'scripts/validate-release-facts.ps1') -Root $root -SkipDescriptionTestCount `
                -AllowPublishedIndexLag -SkipTestResults
            if ($LASTEXITCODE -ne 0) { throw "The release facts check did not pass (exit $LASTEXITCODE)." }

            $minutes = ((Get-Date) - $started).TotalMinutes
            if ($minutes -gt 5) {
                Write-Warning (("Preflight took {0:N1} minutes, past its five-minute budget. A quick check that " +
                    'got slow belongs in the gate, not here.') -f $minutes)
            }
            Step ("preflight passed in {0:N1} minutes. Push the source commit; its pre-push gate runs the fixture tests" -f $minutes)
        }
    }
} finally {
    foreach ($name in $touched) { [Environment]::SetEnvironmentVariable($name, $before[$name], 'Process') }
}
