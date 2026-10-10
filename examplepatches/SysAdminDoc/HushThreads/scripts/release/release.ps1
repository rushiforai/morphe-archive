<#
.SYNOPSIS
    Runs a HushThreads release one stage at a time: prepare, preflight, build, publish, index.

.DESCRIPTION
    One command per stage, in this order. Each stage checks that the one before it finished and
    refuses to run otherwise. A stage that stopped part way can be run again after the fix: what it
    already did is checked rather than done twice.

    prepare    The release-prep edits on main, from a clean tree: the CHANGELOG's Unreleased section
               dated as the release, the version in gradle.properties, the README badge and the
               release check test's User-Agent, the patch list, then the README's latest-release
               line with the patch count. Then the release facts with the index still on the
               previous release. Review the diff, README prose that still names the previous
               release included, and commit it as "chore(release): prepare vX.Y.Z". The bug report
               form names the published version, so it moves in the index stage.
    preflight  The quick checks a release gate would otherwise reach late, in about five minutes:
               the verified advisory comparator the script contracts read, the script contract
               tests, the release text tests, the patch tests that don't read the Threads fixtures,
               the extension's translation and release-check tests, both Android lints and the
               release facts with the index still on the previous release. Then it pushes main at
               release priority, so the pre-push gate runs everything on the prep commit.
    build      From the pushed, clean prep commit (a tree with changes stamps the bundle 0): the
               runtime and patch tests again with --rerun and both lints, the patch list, which
               has to come out unchanged, then the bundle. Each declared Threads build in
               HUSHTHREADS_FIXTURE_DIR is patched once with verify-all-patches.ps1 -KeepIn, and the
               receipt reads those kept runs. The bundle, its SBOM, the receipt and SHA256SUMS.txt
               go to build/release-assets/<version>. Last, the commit is tagged vX.Y.Z and the tag
               pushed: the gate already ran on that commit, and the hook reads a tag of it as
               changing no file.
    publish    The GitHub release, its notes carrying every bullet of the CHANGELOG section with
               -Intro above them and -Update after, and the four assets, each downloaded back and
               compared. Then the repository description names the release, its patch count and
               Threads build.
    index      patches-bundle.json and the bug report form's version placeholder, the release facts
               against the published assets, then the commit "chore(release): point the index at
               vX.Y.Z", pushed through the gate's index check.

    Gradle goes through HUSHTHREADS_BUILD_WRAPPER as the pre-push gate does, or through the
    machine's build queue (BUILD_QUEUE_SCRIPT) when no wrapper is set, and each fixture run and the
    receipt wait for a slot of that queue too. Every heavy step runs at release priority, and the
    variables this sets are put back when it ends. The text work is scripts/release/release_text.py,
    run with the Python HUSHTHREADS_PYTHON names, else the py launcher's Python 3, else python.

.EXAMPLE
    scripts/release/release.ps1 -Stage prepare -Version 0.0.13
    scripts/release/release.ps1 -Stage preflight -Version 0.0.13
    scripts/release/release.ps1 -Stage build -Version 0.0.13
    scripts/release/release.ps1 -Stage publish -Version 0.0.13 -Intro intro.md -Update update.md
    scripts/release/release.ps1 -Stage index -Version 0.0.13 -Summary summary.txt
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][ValidateSet('prepare', 'preflight', 'build', 'publish', 'index')][string]$Stage,
    [Parameter(Mandatory = $true)][ValidatePattern('^\d+\.\d+\.\d+$')][string]$Version,
    # prepare: the CHANGELOG heading's date, today when left out.
    [string]$Date,
    # build: the fixture of each declared build, when the fixture folder holds more than one.
    [string[]]$Fixture,
    # publish: files holding the notes' opening paragraphs and their Update steps.
    [string]$Intro,
    [string]$Update,
    # index: a file holding what's new, for the description Morphe Manager shows.
    [string]$Summary
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
. (Join-Path $root 'scripts/common.ps1')
. (Join-Path $root 'scripts/patch-target.ps1')

$tag = "v$Version"
$assets = Join-Path $root "build/release-assets/$Version"
$bundleName = "patches-$Version.mpp"
$sbomName = "patches-$Version.cdx.json"
$receiptName = "release-receipt-$Version.json"
$assetNames = @($bundleName, $sbomName, $receiptName, 'SHA256SUMS.txt')
$indexFiles = @('patches-bundle.json', '.github/ISSUE_TEMPLATE/bug_report.yml')
$indexSubject = "chore(release): point the index at $tag"

function Step([string]$Text) { Write-Host "[release] $Text" -ForegroundColor Cyan }

function Invoke-Git {
    # git against this checkout with no inherited git environment: a GIT_DIR left by a hook or
    # another tool points git -C somewhere else. The output comes back, $LASTEXITCODE says how it went.
    param([Parameter(Mandatory = $true)][string[]]$Arguments)
    $saved = @{}
    foreach ($variable in @(Get-ChildItem Env: | Where-Object { $_.Name -like 'GIT_*' })) {
        $saved[$variable.Name] = $variable.Value
        Remove-Item -LiteralPath ('Env:\' + $variable.Name)
    }
    try {
        & git -C $root @Arguments
    } finally {
        foreach ($name in $saved.Keys) { Set-Item -LiteralPath ('Env:\' + $name) -Value $saved[$name] }
    }
}

function Get-GitLine {
    param([string[]]$Arguments, [string]$What)
    $answer = @(Invoke-Git $Arguments)
    if ($LASTEXITCODE -ne 0) { throw "git could not read $What." }
    return ([string]($answer | Select-Object -First 1)).Trim()
}

function Get-TreeChanges {
    $changes = @(Invoke-Git @('status', '--porcelain', '--untracked-files=all'))
    if ($LASTEXITCODE -ne 0) { throw "git could not read the working tree at $root." }
    return $changes
}

function Assert-Clean {
    $changes = @(Get-TreeChanges)
    if ($changes.Count -gt 0) { throw "The working tree has changes, so what's checked isn't a commit: $($changes[0])" }
}

function Assert-SourceVersion {
    $source = Get-BundleVersion -Root $root
    if ($source -ne $Version) { throw "gradle.properties says $source, not $Version." }
}

function Test-Prepared {
    # The dated heading Morphe Manager reads, which only prepare writes.
    $path = Join-Path $root 'CHANGELOG.md'
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { return $false }
    return [regex]::IsMatch([IO.File]::ReadAllText($path), "(?m)^## $([regex]::Escape($Version)) \(\d{4}-\d{2}-\d{2}\)")
}

function Assert-Prepared {
    Assert-SourceVersion
    if (-not (Test-Prepared)) { throw "CHANGELOG.md has no dated $Version heading. Run -Stage prepare first." }
}

function Assert-OnMain {
    $branch = @(Invoke-Git @('symbolic-ref', '--quiet', '--short', 'HEAD'))
    if ($LASTEXITCODE -ne 0 -or ([string]($branch | Select-Object -First 1)).Trim() -ne 'main') {
        throw 'Releases are cut on main, and HEAD is not on it.'
    }
}

function Get-RemoteRef {
    # The commit origin holds at a ref, peeled when it's a tag, or '' when origin has no such ref.
    param([string]$Ref)
    $lines = @(Invoke-Git @('ls-remote', 'origin', $Ref, "$Ref^{}"))
    if ($LASTEXITCODE -ne 0) { throw "git could not read $Ref from origin." }
    $peeled = @($lines | Where-Object { "$_" -match ('\s' + [regex]::Escape("$Ref^{}") + '$') })
    $plain = @($lines | Where-Object { "$_" -match ('\s' + [regex]::Escape($Ref) + '$') })
    $line = if ($peeled.Count -gt 0) { $peeled[0] } elseif ($plain.Count -gt 0) { $plain[0] } else { '' }
    return ([string]$line -split '\s+')[0]
}

function Get-LocalTag {
    $local = @(Invoke-Git @('rev-parse', '--verify', '--quiet', "refs/tags/$tag^{commit}"))
    if ($LASTEXITCODE -ne 0) { return '' }
    return ([string]($local | Select-Object -First 1)).Trim()
}

function Assert-PushedHead {
    Assert-Clean
    $head = Get-GitLine @('rev-parse', 'HEAD') 'HEAD'
    $remote = Get-RemoteRef 'refs/heads/main'
    if ($head -ne $remote) {
        throw "HEAD $head isn't origin's main ($remote). Run -Stage preflight, which pushes the prep commit through the gate."
    }
    return $head
}

function Push-Main {
    # The pre-push gate runs on this, at the release priority this script set.
    param([string]$What)
    Assert-OnMain
    Invoke-Git @('push', 'origin', 'HEAD:refs/heads/main') | Out-Host
    if ($LASTEXITCODE -ne 0) { throw "The push of $What did not pass (exit $LASTEXITCODE). Fix what the gate said and run this stage again." }
}

function Invoke-Gradle {
    param([Parameter(Mandatory = $true)][string[]]$Tasks)
    Set-GitHubPackagesCredential
    $wrapper = $env:HUSHTHREADS_BUILD_WRAPPER
    if ($wrapper -and -not (Test-Path -LiteralPath $wrapper -PathType Leaf)) {
        throw "HUSHTHREADS_BUILD_WRAPPER names $wrapper, which is not there."
    }
    $global:LASTEXITCODE = 0
    if ($wrapper) {
        & $wrapper -ProjectDir $root -Tasks $Tasks
    } else {
        Invoke-HeavyJob -Label "release gradle $($Tasks[0])" -ScriptBlock { & (Join-Path $root 'gradlew.bat') -p $root @Tasks }
    }
    if ($LASTEXITCODE -ne 0) { throw "Gradle $($Tasks -join ' ') did not pass (exit $LASTEXITCODE)." }
}

function Invoke-Python {
    # Isolated (-I), so nothing beside the script or in the working folder is imported in place of
    # the standard library.
    param([Parameter(Mandatory = $true)][string[]]$Arguments, [string]$What)
    # In @(), or a one-item answer comes back as a string and [0] reads its first letter.
    $python = @(if ($env:HUSHTHREADS_PYTHON) { $env:HUSHTHREADS_PYTHON }
        elseif (Get-Command py -CommandType Application -ErrorAction SilentlyContinue) { 'py', '-3' }
        elseif (Get-Command python -CommandType Application -ErrorAction SilentlyContinue) { 'python' }
        else { throw 'No Python 3 for the release text. Install it, or set HUSHTHREADS_PYTHON to one.' })
    $prefix = @($python | Select-Object -Skip 1)
    $global:LASTEXITCODE = 0
    & $python[0] @prefix -I @Arguments | Out-Host
    if ($LASTEXITCODE -ne 0) { throw "$What did not pass (exit $LASTEXITCODE)." }
}

function Invoke-ReleaseText {
    param([Parameter(Mandatory = $true)][string[]]$Arguments)
    Invoke-Python -Arguments (@((Join-Path $PSScriptRoot 'release_text.py')) + $Arguments) -What "The release text step '$($Arguments[0])'"
}

function Invoke-Gh {
    # gh with its exit code checked. -Probe asks a question: stderr is dropped and a failure comes
    # back as $null. Continue for the call alone, since Windows PowerShell 5.1 turns a redirected
    # native stderr into a terminating error under Stop.
    param([string]$What, [string[]]$Arguments, [switch]$Probe)
    $preference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        $global:LASTEXITCODE = 0
        $output = if ($Probe) { @(& gh @Arguments 2>$null) } else { @(& gh @Arguments) }
    } finally {
        $ErrorActionPreference = $preference
    }
    if ($LASTEXITCODE -ne 0) {
        if ($Probe) { return $null }
        throw "$What did not pass (exit $LASTEXITCODE)."
    }
    return $output
}

function Invoke-FactsCheck {
    param([hashtable]$Arguments, [string]$What)
    $global:LASTEXITCODE = 0
    & (Join-Path $root 'scripts/validate-release-facts.ps1') -Root $root @Arguments
    if ($LASTEXITCODE -ne 0) { throw "$What did not pass (exit $LASTEXITCODE)." }
}

function Invoke-FactsPrecheck {
    Step 'release facts, with the index still on the previous release'
    Invoke-FactsCheck -Arguments @{ SkipDescriptionTestCount = $true; AllowPublishedIndexLag = $true; SkipTestResults = $true } `
        -What 'The release facts check'
}

function Get-RepositorySlug {
    # The repository the index points Manager at, read the way the release facts check reads it.
    $url = [string](Get-Content -LiteralPath (Join-Path $root 'patches-bundle.json') -Raw | ConvertFrom-Json).download_url
    $match = [regex]::Match($url, '^https://github\.com/([^/\s]+/[^/\s]+)/releases/download/')
    if (-not $match.Success) { throw "patches-bundle.json's download_url names no GitHub repository: $url" }
    return $match.Groups[1].Value
}

function Get-Sha256([string]$Path) { (Get-FileHash -Algorithm SHA256 -LiteralPath $Path).Hash.ToLowerInvariant() }

function Get-ReleaseFixtures {
    # One fixture per declared build: threads-<version>-* in the fixture folder, the vendor's .xapk
    # or .apkm, or a merged .apk where there's no bundle. -Fixture names them instead.
    param([Parameter(Mandatory = $true)]$Target)
    if ($Fixture) {
        return @($Fixture | ForEach-Object {
                if (-not (Test-Path -LiteralPath $_ -PathType Leaf)) { throw "-Fixture names $_, which is not there." }
                $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($_)
            })
    }
    $folder = $env:HUSHTHREADS_FIXTURE_DIR
    return @(foreach ($build in @($Target.PackageVersions)) {
            $files = @(Get-ChildItem -LiteralPath $folder -File | Where-Object { $_.Name.StartsWith("threads-$build-") })
            $bundles = @($files | Where-Object { $_.Extension -in '.xapk', '.apkm' })
            $pick = @(if ($bundles.Count -gt 0) { $bundles } else { $files | Where-Object { $_.Extension -eq '.apk' } })
            if ($pick.Count -ne 1) {
                throw ("Expected one threads-$build-* fixture in $folder, found $($pick.Count)" +
                    $(if ($pick.Count -gt 1) { ' (' + (($pick | ForEach-Object Name) -join ', ') + ')' } else { '' }) +
                    '. Name each build''s fixture with -Fixture.')
            }
            $pick[0].FullName
        })
}

function Assert-BuiltBundle {
    # What the receipt refuses, read before any fixture is patched: the bundle, its SBOM and
    # checksum, a stamp pinned to the commit (a tree with changes stamps 0) and the classes.dex
    # Morphe Manager loads.
    param([string]$Bundle, [string]$Commit)
    $folder = Split-Path -Parent $Bundle
    foreach ($path in $Bundle, (Join-Path $folder $sbomName)) {
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { throw "No $(Split-Path -Leaf $path) in $folder after :patches:buildAndroid." }
    }
    $recorded = Join-Path $folder 'bundle.sha256'
    if ((Test-Path -LiteralPath $recorded -PathType Leaf) -and
            [IO.File]::ReadAllText($recorded).Trim().ToLowerInvariant() -ne (Get-Sha256 $Bundle)) {
        throw "bundle.sha256 doesn't match $bundleName, so the bundle changed after the build wrote it."
    }
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $zip = [IO.Compression.ZipFile]::OpenRead($Bundle)
    try {
        $entry = $zip.GetEntry('META-INF/MANIFEST.MF')
        if ($null -eq $entry) { throw "$bundleName has no META-INF/MANIFEST.MF." }
        $reader = New-Object IO.StreamReader($entry.Open())
        try { $manifest = $reader.ReadToEnd() } finally { $reader.Dispose() }
        $dex = $zip.GetEntry('classes.dex')
        $hasDex = $null -ne $dex -and $dex.Length -gt 0
    } finally {
        $zip.Dispose()
    }
    $stamp = [regex]::Match($manifest, '(?m)^Timestamp: (\d+)').Groups[1].Value
    $seconds = Get-GitLine @('log', '-1', '--format=%ct', $Commit) "the time of $Commit"
    if ($stamp -ne "${seconds}000") {
        throw ("$bundleName is stamped '$stamp', not $Commit's time (${seconds}000). A tree with changes stamps 0, " +
            'so build it again from a clean checkout of the commit. Nothing was patched.')
    }
    if (-not $hasDex) { throw "$bundleName has no classes.dex, so Morphe Manager would load no patches from it. Nothing was patched." }
}

function Assert-AssetSums {
    $listed = @{}
    foreach ($line in [IO.File]::ReadAllLines((Join-Path $assets 'SHA256SUMS.txt'))) {
        $match = [regex]::Match($line, '^([0-9a-f]{64})\s+\*?(\S+)\s*$')
        if ($match.Success) { $listed[$match.Groups[2].Value] = $match.Groups[1].Value }
    }
    foreach ($name in $bundleName, $sbomName, $receiptName) {
        if ($listed[$name] -ne (Get-Sha256 (Join-Path $assets $name))) {
            throw "SHA256SUMS.txt doesn't list $name as it is in $assets. Run -Stage build again."
        }
    }
}

# The hook imports these from the user's registry the same way: a shell opened before they were
# set doesn't have them. What this run sets or imports is put back at the end, so the shell isn't
# left at release priority or holding a token it didn't have.
$touched = @('HUSHTHREADS_FIXTURE_DIR', 'HUSHTHREADS_BUILD_WRAPPER', 'HUSHTHREADS_DESKTOP_JAR', 'HUSHTHREADS_WORKDIR',
    'HUSHTHREADS_PYTHON', 'BUILD_QUEUE_SCRIPT', 'BUILD_QUEUE_PRIORITY', 'GITHUB_ACTOR', 'GITHUB_TOKEN')
$before = @{}
foreach ($name in $touched) { $before[$name] = [Environment]::GetEnvironmentVariable($name, 'Process') }
try {
    foreach ($name in $touched | Where-Object { $_ -like 'HUSHTHREADS_*' -or $_ -eq 'BUILD_QUEUE_SCRIPT' }) {
        if (-not $before[$name]) {
            $value = [Environment]::GetEnvironmentVariable($name, 'User')
            if ($value) { [Environment]::SetEnvironmentVariable($name, $value, 'Process') }
        }
    }
    $env:BUILD_QUEUE_PRIORITY = 'release'

    switch ($Stage) {
        'prepare' {
            Assert-Clean
            Assert-OnMain
            if ((Get-LocalTag) -or (Get-RemoteRef "refs/tags/$tag")) { throw "$tag already exists, so $Version is past prepare." }
            $source = Get-BundleVersion -Root $root
            $prepared = $source -eq $Version -and (Test-Prepared)
            if ($prepared) {
                Step "$Version is prepared at HEAD already, so its edits are checked rather than made again"
            } elseif ($source -eq $Version) {
                throw "gradle.properties says $Version already, but CHANGELOG.md has no dated $Version heading. Put the version back and run -Stage prepare again."
            } else {
                Step "CHANGELOG cut and version strings, $source to $Version"
                $cut = @('cut', '--version', $Version)
                if ($Date) { $cut += @('--date', $Date) }
                Invoke-ReleaseText $cut
            }

            Step 'patch list'
            Invoke-Gradle @(':patches:generatePatchesList')
            if ($prepared) {
                $moved = @(Get-TreeChanges)
                if ($moved.Count -gt 0) {
                    throw (":patches:generatePatchesList changed the prepared tree ($($moved[0].Trim())), so the prep commit's " +
                        'patch list is stale. Fold the change into the prep commit and run -Stage prepare again.')
                }
            } else {
                Step 'README latest-release line'
                Invoke-ReleaseText @('readme', '--version', $Version)
            }

            Invoke-FactsPrecheck
            if ($prepared) {
                Step "$Version is prepared. Run -Stage preflight."
            } else {
                Step ("Review the diff, README prose that names the previous release included, commit it as " +
                    "'chore(release): prepare $tag', then run -Stage preflight")
            }
        }
        'preflight' {
            Assert-Clean
            Assert-Prepared
            $started = Get-Date

            # The contract tests hold the release fixture's comparator to the verified one in
            # build/advisory-tool, and the pre-push gate prepares it before them for the same reason.
            Step 'verified advisory comparator'
            Invoke-Gradle @('prepareAdvisoryTool')

            Step 'script contract tests'
            $global:LASTEXITCODE = 0
            & (Get-Process -Id $PID).Path -NoProfile -File (Join-Path $root 'scripts/test-script-contracts.ps1') -Root $root
            if ($LASTEXITCODE -ne 0) { throw "The script contract tests did not pass (exit $LASTEXITCODE)." }

            Step 'release text tests'
            Invoke-Python -Arguments @('-m', 'unittest', 'discover', '-s', $PSScriptRoot, '-p', 'test_release_text.py') `
                -What 'The release text tests'

            # One Gradle run: the patch tests without the fixture partition and its selection check,
            # the extension tests a release's text depends on, and both lints. The pre-push gate's
            # quick pass is the same patch partition, so this is what fails first there too.
            Step 'quick patch tests, translation and release-check tests, both lints'
            Invoke-Gradle @(
                ':patches:test', '-x', ':patches:fixtureTest', '-x', ':patches:verifyPatchTestSelection',
                ':extensions:threads:testDebugUnitTest', '--tests', '*L10nTest', '--tests', '*L10nCatalogTest',
                '--tests', '*ReleaseCheckTest',
                ':extensions:shared:library:lint', ':extensions:threads:lint')

            Invoke-FactsPrecheck

            $minutes = ((Get-Date) - $started).TotalMinutes
            if ($minutes -gt 5) {
                Write-Warning (("Preflight took {0:N1} minutes, past its five-minute budget. A quick check that " +
                    'got slow belongs in the gate, not here.') -f $minutes)
            }
            Step ("preflight passed in {0:N1} minutes" -f $minutes)

            $head = Get-GitLine @('rev-parse', 'HEAD') 'HEAD'
            if ((Get-RemoteRef 'refs/heads/main') -eq $head) {
                Step "origin's main is $head already, so there's nothing to push. Run -Stage build"
            } else {
                Step "pushing $head to main at release priority, so the pre-push gate runs everything on it"
                Push-Main -What "the prep commit $head"
                Step 'pushed through the gate. Run -Stage build'
            }
        }
        'build' {
            Assert-Prepared
            $head = Assert-PushedHead
            $remoteTag = Get-RemoteRef "refs/tags/$tag"
            if ($remoteTag -and $remoteTag -ne $head) { throw "origin's $tag names $remoteTag, not $head." }
            $localTag = Get-LocalTag
            if ($localTag -and $localTag -ne $head) { throw "$tag names $localTag here, not $head." }
            # The fixture tests read the folder too, and a skipped one leaves no count a release can quote.
            if (-not $env:HUSHTHREADS_FIXTURE_DIR -or -not (Test-Path -LiteralPath $env:HUSHTHREADS_FIXTURE_DIR -PathType Container)) {
                throw 'HUSHTHREADS_FIXTURE_DIR has to name the folder that holds the declared Threads builds.'
            }
            $desktopJar = Resolve-DesktopCli -Root $root -Required
            $catalog = Get-Content -LiteralPath (Join-Path $root 'patches-list.json') -Raw | ConvertFrom-Json
            $fixtures = @(Get-ReleaseFixtures -Target (Get-PatchTarget -PatchList $catalog))

            Step 'clearing patches/build/release'
            $releaseFolder = Join-Path $root 'patches/build/release'
            if (Test-Path -LiteralPath $releaseFolder) { Remove-Item -LiteralPath $releaseFolder -Recurse -Force }

            # Named with --rerun: Gradle calls a run of the same inputs up to date, and the facts
            # check holds the results to the sources' dates. The aggregate :extensions:threads:test
            # --rerun reruns only itself, not testDebugUnitTest.
            Step "runtime and patch tests again from $head, both lints"
            Invoke-Gradle @(':extensions:threads:testDebugUnitTest', '--rerun', ':patches:test', '--rerun',
                ':extensions:shared:library:lint', ':extensions:threads:lint')

            Step 'patch list'
            Invoke-Gradle @(':patches:generatePatchesList')
            $moved = @(Get-TreeChanges)
            if ($moved.Count -gt 0) {
                throw (":patches:generatePatchesList changed the pushed tree ($($moved[0].Trim())), so the prep commit's " +
                    'patch list is stale. Nothing was built or tagged.')
            }

            Step 'bundle'
            Invoke-Gradle @(':patches:buildAndroid')
            $bundle = Join-Path $releaseFolder $bundleName
            Assert-BuiltBundle -Bundle $bundle -Commit $head

            $applied = Join-Path $root 'patches/build/fixture-apply'
            $work = Join-Path ([IO.Path]::GetTempPath()) ("hushthreads-release-$Version-" + [guid]::NewGuid().ToString('N'))
            New-Item -ItemType Directory -Force -Path $work | Out-Null
            try {
                foreach ($fixturePath in $fixtures) {
                    $fixtureName = Split-Path -Leaf $fixturePath
                    Step "patching $fixtureName once, kept for the receipt"
                    Invoke-HeavyJob -Label "release verify $fixtureName" -ScriptBlock {
                        & (Join-Path $root 'scripts/verify-all-patches.ps1') -Apk $fixturePath -DesktopJar $desktopJar `
                            -WorkDir (Join-Path $work 'verify') -KeepIn (Join-Path $applied $fixtureName)
                    }
                    if ($LASTEXITCODE -ne 0) { throw "verify-all-patches.ps1 did not pass on $fixtureName (exit $LASTEXITCODE)." }
                }
                Step 'release receipt, read from the kept runs'
                Invoke-HeavyJob -Label 'release receipt' -ScriptBlock {
                    & (Join-Path $root 'scripts/build-release-receipt.ps1') -Fixture $fixtures -WorkDir (Join-Path $work 'receipt') `
                        -AppliedDir $applied -DesktopJar $desktopJar
                }
                if ($LASTEXITCODE -ne 0) { throw "build-release-receipt.ps1 did not pass (exit $LASTEXITCODE)." }
            } finally {
                Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue
            }
            $receiptPath = Join-Path $root $receiptName
            if (-not (Test-Path -LiteralPath $receiptPath -PathType Leaf)) { throw "build-release-receipt.ps1 wrote no $receiptName." }
            $receiptCommit = [string](Get-Content -LiteralPath $receiptPath -Raw | ConvertFrom-Json).release.commit
            if ($receiptCommit -ne $head) { throw "$receiptName names $receiptCommit, not $head." }

            Step "assets in $assets"
            if (Test-Path -LiteralPath $assets) { Remove-Item -LiteralPath $assets -Recurse -Force }
            New-Item -ItemType Directory -Force -Path $assets | Out-Null
            Copy-Item -LiteralPath $bundle, (Join-Path $releaseFolder $sbomName), $receiptPath -Destination $assets
            $sums = foreach ($name in $bundleName, $sbomName, $receiptName) { '{0}  {1}' -f (Get-Sha256 (Join-Path $assets $name)), $name }
            [IO.File]::WriteAllText((Join-Path $assets 'SHA256SUMS.txt'), (($sums -join "`n") + "`n"), (New-Object Text.UTF8Encoding($false)))
            $sums | ForEach-Object { Step $_ }

            # Tagged last, so a stage that stops above leaves no tag on a commit that may need to change.
            if (-not $localTag) {
                Invoke-Git @('tag', $tag, $head) | Out-Host
                if ($LASTEXITCODE -ne 0) { throw "git could not tag $head as $tag." }
            }
            if (-not $remoteTag) {
                Step "pushing $tag, a tag of the commit the gate already passed"
                Invoke-Git @('push', 'origin', "refs/tags/${tag}:refs/tags/$tag") | Out-Host
                if ($LASTEXITCODE -ne 0) { throw "The push of $tag did not pass (exit $LASTEXITCODE)." }
            }
            Step "$tag is $head. Write the notes' opening paragraphs and Update steps, then run -Stage publish"
        }
        'publish' {
            Assert-Prepared
            $head = Assert-PushedHead
            if ((Get-RemoteRef "refs/tags/$tag") -ne $head) { throw "origin has no $tag on $head. Run -Stage build first, which tags it last." }
            foreach ($name in $assetNames) {
                if (-not (Test-Path -LiteralPath (Join-Path $assets $name) -PathType Leaf)) { throw "No $name in $assets. Run -Stage build first." }
            }
            Assert-AssetSums
            $receiptCommit = [string](Get-Content -LiteralPath (Join-Path $assets $receiptName) -Raw | ConvertFrom-Json).release.commit
            if ($receiptCommit -ne $head) { throw "The receipt in $assets names $receiptCommit, not $head. Run -Stage build again." }
            $repository = Get-RepositorySlug

            $existing = Invoke-Gh -What 'gh release view' -Arguments @('release', 'view', $tag, '-R', $repository, '--json', 'tagName', '--jq', '.tagName') -Probe
            if ([string]($existing | Select-Object -First 1) -eq $tag) {
                Step "$tag is on $repository already, so its assets are checked again"
            } else {
                if (-not $Intro -or -not $Update) { throw '-Intro and -Update name the files that hold the notes'' opening paragraphs and Update steps.' }
                $notes = Join-Path $assets 'notes.md'
                Invoke-ReleaseText @('notes', '--version', $Version, '--intro', (Resolve-Path -LiteralPath $Intro).Path,
                    '--update', (Resolve-Path -LiteralPath $Update).Path, '--out', $notes)
                Step "publishing $tag on $repository"
                Invoke-Gh -What 'gh release create' -Arguments (@('release', 'create', $tag, '-R', $repository, '--verify-tag',
                        '--title', $tag, '--notes-file', $notes) + @($bundleName, $sbomName, $receiptName, 'SHA256SUMS.txt' |
                            ForEach-Object { Join-Path $assets $_ })) | Out-Host
            }

            $check = Join-Path ([IO.Path]::GetTempPath()) ("hushthreads-published-$Version-" + [guid]::NewGuid().ToString('N'))
            try {
                Invoke-Gh -What 'gh release download' -Arguments @('release', 'download', $tag, '-R', $repository, '-D', $check) | Out-Host
                $hosted = @(Get-ChildItem -LiteralPath $check -File -ErrorAction SilentlyContinue | ForEach-Object Name | Sort-Object)
                $wanted = @($assetNames | Sort-Object)
                if (($hosted -join '|') -ne ($wanted -join '|')) { throw "$tag carries $($hosted -join ', '), not $($wanted -join ', ')." }
                foreach ($name in $assetNames) {
                    if ((Get-Sha256 (Join-Path $check $name)) -ne (Get-Sha256 (Join-Path $assets $name))) {
                        throw "The hosted $name differs from the one in $assets."
                    }
                    Step "$name matches the hosted copy"
                }
            } finally {
                Remove-Item -LiteralPath $check -Recurse -Force -ErrorAction SilentlyContinue
            }

            # Last, so a release that failed above leaves the description on the one that's out.
            $current = Join-Path $assets 'description-current.txt'
            $next = Join-Path $assets 'description.txt'
            $said = @(Invoke-Gh -What 'gh repo view' -Arguments @('repo', 'view', $repository, '--json', 'description', '--jq', '.description'))
            [IO.File]::WriteAllText($current, (($said -join "`n").Trim() + "`n"), (New-Object Text.UTF8Encoding($false)))
            Invoke-ReleaseText @('description', '--version', $Version, '--current', $current, '--out', $next)
            $wantedDescription = [IO.File]::ReadAllText($next, [Text.Encoding]::UTF8).Trim()
            if ($wantedDescription -ne ($said -join "`n").Trim()) {
                Invoke-Gh -What 'gh repo edit' -Arguments @('repo', 'edit', $repository, '--description', $wantedDescription) | Out-Host
            }
            Step "published. Write the summary Morphe Manager shows, then run -Stage index"
        }
        'index' {
            Assert-Prepared
            $others = @(Get-TreeChanges | Where-Object { $indexFiles -notcontains "$_".Substring(3).Trim('"') })
            if ($others.Count -gt 0) { throw "The working tree has changes beyond the index's own files: $($others[0])" }
            $repository = Get-RepositorySlug
            # Interpolated, not cast: [string] of an empty pipeline is $null, which has no Trim().
            $published = "$(Invoke-Gh -What 'gh release view' -Arguments @('release', 'view', $tag, '-R', $repository,
                    '--json', 'publishedAt', '--jq', '.publishedAt') -Probe | Select-Object -First 1)"
            if (-not $published.Trim()) { throw "$tag isn't published on $repository. Run -Stage publish first." }
            $tagCommit = Get-RemoteRef "refs/tags/$tag"
            $head = Get-GitLine @('rev-parse', 'HEAD') 'HEAD'
            $originMain = Get-RemoteRef 'refs/heads/main'

            # The index push is checked against the bundle, receipt and test results built here.
            $bundle = Join-Path $root "patches/build/release/$bundleName"
            $receiptPath = Join-Path $root $receiptName
            foreach ($path in $bundle, $receiptPath) {
                if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
                    throw "No $(Split-Path -Leaf $path) in this checkout. Run every stage in the checkout -Stage build ran in."
                }
            }
            if ([string](Get-Content -LiteralPath $receiptPath -Raw | ConvertFrom-Json).release.commit -ne $tagCommit) {
                throw "$receiptName isn't the receipt of $tag ($tagCommit)."
            }
            if ((Test-Path -LiteralPath (Join-Path $assets $bundleName) -PathType Leaf) -and
                    (Get-Sha256 $bundle) -ne (Get-Sha256 (Join-Path $assets $bundleName))) {
                throw "patches/build/release/$bundleName isn't the bundle $tag published."
            }

            $committed = @(Invoke-Git @('show', 'HEAD:patches-bundle.json'))
            if ($LASTEXITCODE -ne 0) { throw 'git could not read patches-bundle.json at HEAD.' }
            $indexedAtHead = [string](($committed -join "`n") | ConvertFrom-Json).version -eq $Version
            if ($indexedAtHead -and $head -eq $originMain) {
                Step "origin's main points the index at $tag already"
                break
            }
            if ($indexedAtHead) {
                $subject = Get-GitLine @('log', '-1', '--format=%s', 'HEAD') 'the HEAD commit'
                $parent = Get-GitLine @('rev-parse', 'HEAD^') "HEAD's parent"
                if ($subject -ne $indexSubject -or $parent -ne $originMain) {
                    throw "HEAD $head points the index at $tag but isn't the index commit on origin's main ($originMain)."
                }
                Assert-Clean
                Step 'the index commit is made, so it is checked and pushed again'
            } else {
                if ($head -ne $originMain) { throw "HEAD $head isn't origin's main ($originMain). The index commit goes on top of it." }
                Invoke-Git @('merge-base', '--is-ancestor', $tagCommit, $head) | Out-Null
                if ($LASTEXITCODE -ne 0) { throw "$tag ($tagCommit) isn't part of HEAD $head." }
                Assert-OnMain
                if (-not $Summary) { throw '-Summary names the file that holds what''s new, for the description Morphe Manager shows.' }
                if (@(Get-TreeChanges).Count -gt 0) {
                    Step 'putting back the index files an earlier run wrote, to write them again'
                    Invoke-Git (@('checkout', '--') + $indexFiles) | Out-Host
                    if ($LASTEXITCODE -ne 0) { throw 'git could not put the index files back.' }
                }
                $created = [DateTimeOffset]::Parse($published.Trim(), [Globalization.CultureInfo]::InvariantCulture).UtcDateTime.ToString(
                    "yyyy-MM-dd'T'HH:mm:ss", [Globalization.CultureInfo]::InvariantCulture)
                Step "index for $tag, published $created UTC"
                Invoke-ReleaseText @('index', '--version', $Version, '--created', $created, '--summary', (Resolve-Path -LiteralPath $Summary).Path)
            }

            Step 'release facts against the published assets'
            Invoke-FactsCheck -Arguments @{ VerifyPublishedAsset = $true; ArtifactPath = $bundle; Receipt = $receiptPath } `
                -What 'The published release facts check'

            if (-not $indexedAtHead) {
                $catalog = Get-Content -LiteralPath (Join-Path $root 'patches-list.json') -Raw | ConvertFrom-Json
                $target = Get-PatchTarget -PatchList $catalog
                $body = ("Morphe Manager now offers the $tag bundle with $(@($catalog.patches).Count) patches for Threads " +
                    "$($target.PackageVersion). The bug report form names $Version.")
                Invoke-Git (@('add', '--') + $indexFiles) | Out-Host
                if ($LASTEXITCODE -ne 0) { throw 'git could not stage the index files.' }
                Invoke-Git @('commit', '--quiet', '-m', $indexSubject, '-m', $body) | Out-Host
                if ($LASTEXITCODE -ne 0) { throw 'git could not commit the index.' }
            }
            Step 'pushing the index commit; the pre-push gate checks it against the published release'
            Push-Main -What 'the index commit'
            Step "the index points at $tag"
        }
    }
} finally {
    foreach ($name in $touched) { [Environment]::SetEnvironmentVariable($name, $before[$name], 'Process') }
}
