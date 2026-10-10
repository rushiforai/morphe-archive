<#
.SYNOPSIS
    Cuts a HushTelegram release in five stages: prepare, preflight, build, publish, index.

.DESCRIPTION
    One command per stage, run in this order. Each stage records that it finished, and on which
    commit, under build/release-assets/<version>/stages. A stage won't start until the one before it
    has finished, on the commit it's about to work from when that matters, so an out-of-order run
    stops before it does anything. Any stage can be run again: one whose work is already done
    checks it and says so, and one that stopped part way does its work again, leaving alone what's
    already in place (the dated CHANGELOG heading, the tag, the GitHub release).

      prepare    The CHANGELOG's Unreleased section becomes "## X.Y.Z (date)", gradle.properties and
                 the README badge take the version, :patches:generatePatchesList runs and the
                 release facts are checked the way a preparation push checks them. Then write the
                 README's latest release lines and the section's intro, and commit it all as
                 "chore(release): prepare X.Y.Z for publication".
      preflight  What a release gate would otherwise only reach late, in about five minutes: every
                 tracked PowerShell script parses, the release text and stage order tests, the facts
                 check, the patch tests without the fixture suite, and the translation tests. Then
                 push with BUILD_QUEUE_PRIORITY=release, so the full pre-push gate runs ahead of
                 everyday builds.
      build      From the pushed, clean release commit: the full test and lint run with every fixture
                 required, the patch list and bundle (classes.dex in it, its Timestamp the commit's
                 time), verify-all-patches.ps1 on every declared Telegram build (one target per
                 channel, telegram.org's web build and the beta) with each clean run kept, and the
                 receipt, which reads those kept runs instead of patching each build again. The
                 bundle, SBOM, receipt and SHA256SUMS.txt go to build/release-assets/<version>.
      publish    Release notes from -Intro, -Install and -Validation around every bullet of the
                 version's CHANGELOG section, a lightweight tag on the release commit, the GitHub
                 release with the four assets, each downloaded back and compared, and the published
                 notes held to the section.
      index      patches-bundle.json from -Description and the release's publish time, the bug form's
                 version placeholder and the repository description, then validate-release-facts
                 -VerifyPublishedAsset. Then commit "chore(release): point Manager to the verified
                 X.Y.Z bundle" and push.

    Everything this starts runs at release priority in the machine build queue BUILD_QUEUE_SCRIPT
    names. Gradle goes through HUSHTELEGRAM_BUILD_WRAPPER, as the pre-push gate's does, or
    gradlew.bat inside a queue slot when no wrapper is set.

.EXAMPLE
    scripts/release/release.ps1 -Stage prepare -Version 0.0.12
    scripts/release/release.ps1 -Stage publish -Version 0.0.12 -Intro intro.md -Install install.md -Validation validation.md
    scripts/release/release.ps1 -Stage index -Version 0.0.12 -Description manager.txt
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][ValidateSet('prepare', 'preflight', 'build', 'publish', 'index')][string]$Stage,
    [Parameter(Mandatory = $true)][ValidatePattern('^\d+\.\d+\.\d+$')][string]$Version,
    # prepare: the CHANGELOG heading's date. Today by default.
    [string]$Date,
    # publish: files holding the notes' opening paragraph, the install steps and what was validated.
    [string]$Intro,
    [string]$Install,
    [string]$Validation,
    # index: a file holding the text Morphe Manager shows for the bundle.
    [string]$Description,
    [string]$Repository = 'SysAdminDoc/HushTelegram',
    # The checkout to release. This script's own by default; the stage order tests point it at a
    # scratch repository.
    [string]$Root
)

$ErrorActionPreference = 'Stop'
# Not parameter defaults: Windows PowerShell leaves $PSScriptRoot empty while it evaluates them.
$releaseScripts = $PSScriptRoot
$scripts = Split-Path -Parent $releaseScripts
if (-not $Root) { $Root = Split-Path -Parent $scripts }
$Root = (Resolve-Path -LiteralPath $Root).Path

. (Join-Path $scripts 'common.ps1')
. (Join-Path $scripts 'patch-target.ps1')
. (Join-Path $scripts 'release-receipt.ps1')
. (Join-Path $releaseScripts 'release-text.ps1')

Import-UserEnvironment -Name @('HUSHTELEGRAM_DESKTOP_JAR', 'HUSHTELEGRAM_FIXTURE_DIR', 'HUSHTELEGRAM_BUILD_WRAPPER',
    'HUSHTELEGRAM_JAVA')
# Every queued job this starts, Gradle through the wrapper included, goes ahead of everyday builds.
$env:BUILD_QUEUE_PRIORITY = 'release'

$tag = "v$Version"
$assets = Join-Path $Root "build/release-assets/$Version"
$stages = Join-Path $assets 'stages'
$bundleName = "patches-$Version.mpp"
$sbomName = "patches-$Version.cdx.json"
$receiptName = "release-receipt-$Version.json"

function Write-Step([string]$Text) { Write-Host "[release] $Text" }

function Invoke-Step {
    # A native command or script that answers with its exit code; a throw from it carries on up.
    param([string]$What, [scriptblock]$Command)
    $global:LASTEXITCODE = 0
    & $Command | Out-Host
    if ($LASTEXITCODE -ne 0) { throw "$What failed (exit $LASTEXITCODE)." }
}

function Get-Head { return "$(git -C $Root rev-parse HEAD)".Trim() }

function Get-ShortCommit([string]$Commit) {
    if ($Commit.Length -gt 8) { return $Commit.Substring(0, 8) }
    return $Commit
}

function Get-StageRecord([string]$Name) {
    $path = Join-Path $stages "$Name.json"
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { return $null }
    return (Get-Content -LiteralPath $path -Raw | ConvertFrom-Json)
}

function Save-StageRecord {
    param([string]$Name, [System.Collections.IDictionary]$Facts = @{})
    New-Item -ItemType Directory -Force -Path $stages | Out-Null
    $record = [ordered]@{ stage = $Name; version = $Version; commit = (Get-Head)
        finishedUtc = (Get-Date).ToUniversalTime().ToString('yyyy-MM-dd HH:mm:ss') }
    foreach ($key in $Facts.Keys) { $record[$key] = $Facts[$key] }
    Write-ReleaseText -Path (Join-Path $stages "$Name.json") -Text (($record | ConvertTo-Json) + "`n")
}

function Assert-StageFinished {
    # The stage before this one has finished, on -Commit when one is given.
    param([string]$Name, [string]$Commit)
    $record = Get-StageRecord $Name
    if (-not $record) { throw "-Stage $Name hasn't finished for $Version. Run it before -Stage $Stage." }
    if ($Commit -and [string]$record.commit -ne $Commit) {
        throw ("-Stage $Name finished on $(Get-ShortCommit ([string]$record.commit)), and HEAD is " +
            "$(Get-ShortCommit $Commit). Run -Stage $Name again on HEAD before -Stage $Stage.")
    }
    return $record
}

function Assert-NotPublished {
    if (Get-StageRecord 'publish') {
        throw "$tag is published, so its assets are final and -Stage $Stage doesn't run for it again. Release a new version."
    }
}

function Get-TreeChanges { return @(git -C $Root status --porcelain --untracked-files=all | Where-Object { $_ }) }

function Assert-OnlyChanged {
    # The working tree's changes are all in -Paths, the files the stage itself writes.
    param([string[]]$Paths = @())
    $other = @(Get-TreeChanges | Where-Object { $Paths -notcontains $_.Substring(3).Trim('"') })
    if ($other.Count -gt 0) {
        throw "The working tree has changes -Stage $Stage doesn't make, $($other[0].Trim()) first. Commit or move them."
    }
}

function Assert-PushedHead {
    Assert-OnlyChanged
    $head = Get-Head
    $remote = (("$(@(git -C $Root ls-remote origin refs/heads/main) | Select-Object -First 1)") -split '\s+')[0]
    if ($head -ne $remote) { throw "HEAD $head isn't origin's main ($remote). Push the release commit first." }
    return $head
}

function Assert-SourceVersion {
    $source = Get-BundleVersion -Root $Root
    if ($source -ne $Version) { throw "gradle.properties says $source, not $Version. Run -Stage prepare first." }
    $entry = Test-ChangelogManagerEntry -Current (Read-ReleaseText -Path (Join-Path $Root 'CHANGELOG.md')) -ExpectedVersion $Version
    if (-not $entry.Valid) { throw "The CHANGELOG isn't ready for ${Version}: $($entry.Reason)" }
}

function Invoke-ReleaseGradle {
    param([string[]]$Tasks)
    $wrapper = $env:HUSHTELEGRAM_BUILD_WRAPPER
    if ($wrapper -and -not (Test-Path -LiteralPath $wrapper -PathType Leaf)) {
        throw "HUSHTELEGRAM_BUILD_WRAPPER names $wrapper, which is not there."
    }
    Write-Step "Gradle $($Tasks -join ' ')"
    $global:LASTEXITCODE = 0
    Push-Location -LiteralPath $Root
    try {
        if ($wrapper) {
            & $wrapper -ProjectDir $Root -Tasks $Tasks | Out-Host
            $code = $LASTEXITCODE
        } else {
            # Names the queue's own functions don't use (see Invoke-InHushTelegramQueue).
            $gradlew = Join-Path $Root 'gradlew.bat'
            $gradleRoot = $Root
            $gradleTasks = $Tasks
            $code = Invoke-InHushTelegramQueue -Job 'release gradle' -ScriptBlock { & $gradlew -p $gradleRoot @gradleTasks }
        }
    } finally {
        Pop-Location
    }
    if ($code -ne 0) { throw "Gradle $($Tasks -join ' ') failed (exit $code)." }
}

function Get-UnparsedScripts {
    # Every tracked .ps1 that doesn't parse, read as UTF-8 so both editions see the same text.
    foreach ($name in @(git -C $Root ls-files -- '*.ps1')) {
        $tokens = $null
        $errors = $null
        $text = [IO.File]::ReadAllText((Join-Path $Root $name), [Text.Encoding]::UTF8)
        [void][Management.Automation.Language.Parser]::ParseInput($text, [ref]$tokens, [ref]$errors)
        if ($errors.Count -gt 0) { "${name}:$($errors[0].Extent.StartLineNumber): $($errors[0].Message)" }
    }
}

function Get-Catalog { return (Get-Content -LiteralPath (Join-Path $Root 'patches-list.json') -Raw | ConvertFrom-Json) }

function Get-DeclaredFixtures {
    # Every declared build of every target, one target per channel, from HUSHTELEGRAM_FIXTURE_DIR.
    $directory = $env:HUSHTELEGRAM_FIXTURE_DIR
    if ([string]::IsNullOrWhiteSpace($directory) -or -not (Test-Path -LiteralPath $directory -PathType Container)) {
        throw 'HUSHTELEGRAM_FIXTURE_DIR names no folder. The release patches every declared Telegram build from there.'
    }
    $found = @()
    $missing = @()
    foreach ($target in @(Get-PatchTargets -PatchList (Get-Catalog))) {
        foreach ($build in @($target.PackageVersions)) {
            foreach ($code in @($target.PackageVersionCodes[$build] | Where-Object { $_ })) {
                $name = Get-VendorFixtureName -Target $target -VersionName $build -VersionCode $code
                $file = Join-Path $directory $name
                if (Test-Path -LiteralPath $file -PathType Leaf) { $found += (Resolve-Path -LiteralPath $file).Path } else { $missing += $name }
            }
        }
    }
    if ($missing.Count -gt 0) { throw "HUSHTELEGRAM_FIXTURE_DIR lacks the declared build(s) $($missing -join ', ')." }
    if ($found.Count -eq 0) { throw 'patches-list.json declares no Telegram build.' }
    return $found
}

function Get-WebTelegramVersion {
    # The Telegram version the bug form and repository description name: telegram.org's web build.
    $targets = @(Get-PatchTargets -PatchList (Get-Catalog))
    $web = @(@($targets | Where-Object { $_.PackageName -eq 'org.telegram.messenger.web' }) + $targets)[0]
    return [string]$web.PackageVersion
}

function Assert-BundlePinned {
    param([string]$Bundle, [string]$Commit)
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $zip = [IO.Compression.ZipFile]::OpenRead($Bundle)
    try {
        $entry = $zip.GetEntry('META-INF/MANIFEST.MF')
        if (-not $entry) { throw "$Bundle has no META-INF/MANIFEST.MF." }
        $reader = New-Object IO.StreamReader($entry.Open())
        try { $manifest = $reader.ReadToEnd() } finally { $reader.Dispose() }
        $hasDex = $null -ne $zip.GetEntry('classes.dex')
    } finally {
        $zip.Dispose()
    }
    if (-not $hasDex) { throw "$Bundle has no classes.dex, so Morphe Manager would load no patches from it." }
    $stamp = [regex]::Match($manifest, '(?m)^Timestamp: (\d+)').Groups[1].Value
    $seconds = "$(git -C $Root log -1 --format=%ct $Commit)".Trim()
    if ($stamp -ne "${seconds}000") {
        throw "The bundle's Timestamp $stamp isn't the release commit's time ($seconds). Build it again from a clean checkout."
    }
    Write-Step 'the bundle carries classes.dex and the release commit''s time'
}

function Test-Assets {
    # The bundle's hash when every asset is there and matches SHA256SUMS.txt, otherwise $null.
    $sums = Join-Path $assets 'SHA256SUMS.txt'
    if (-not (Test-Path -LiteralPath $sums -PathType Leaf)) { return $null }
    $listed = @{}
    foreach ($line in @(Get-Content -LiteralPath $sums)) {
        if ($line -match '^([0-9a-f]{64})  (\S+)$') { $listed[$Matches[2]] = $Matches[1] }
    }
    foreach ($name in @($bundleName, $sbomName, $receiptName)) {
        $path = Join-Path $assets $name
        if (-not $listed.ContainsKey($name) -or -not (Test-Path -LiteralPath $path -PathType Leaf)) { return $null }
        if ((Get-Sha256Hex -Path $path).ToLowerInvariant() -ne $listed[$name]) { return $null }
    }
    return $listed[$bundleName]
}

function Test-ReleaseOnGitHub {
    $preference = $ErrorActionPreference
    try {
        # gh says "release not found" on standard error, which Windows PowerShell turns into a
        # terminating error under Stop. The exit code is the answer.
        $ErrorActionPreference = 'Continue'
        $global:LASTEXITCODE = 0
        gh release view $tag -R $Repository --json tagName 2>&1 | Out-Null
        return ($LASTEXITCODE -eq 0)
    } finally {
        $ErrorActionPreference = $preference
    }
}

switch ($Stage) {
    'prepare' {
        Assert-NotPublished
        if ("$(git -C $Root rev-parse --abbrev-ref HEAD)".Trim() -ne 'main') { throw 'Releases are cut on main.' }
        if ("$(git -C $Root tag --list $tag)".Trim()) { throw "$tag already exists. Release a new version." }
        Assert-OnlyChanged @('CHANGELOG.md', 'gradle.properties', 'README.md', 'patches-list.json')
        if (-not $Date) { $Date = (Get-Date).ToString('yyyy-MM-dd') }
        Write-Step (Invoke-ChangelogCut -Path (Join-Path $Root 'CHANGELOG.md') -Version $Version -Date $Date)
        $properties = Join-Path $Root 'gradle.properties'
        $text = Read-ReleaseText -Path $properties
        if ($text -notmatch '(?m)^version = \d+\.\d+\.\d+$') { throw 'gradle.properties has no "version = X.Y.Z" line.' }
        Write-ReleaseText -Path $properties -Text ($text -replace '(?m)^version = \d+\.\d+\.\d+$', "version = $Version")
        $readme = Join-Path $Root 'README.md'
        $text = Read-ReleaseText -Path $readme
        if ($text -notmatch 'badge/version-\d+\.\d+\.\d+-') { throw 'README.md has no version badge.' }
        Write-ReleaseText -Path $readme -Text ($text -replace 'badge/version-\d+\.\d+\.\d+-', "badge/version-$Version-" `
            -replace 'alt="Version \d+\.\d+\.\d+"', "alt=""Version $Version""")
        Write-Step "gradle.properties and the README badge say $Version"
        Invoke-ReleaseGradle @(':patches:generatePatchesList')
        Invoke-Step 'The release facts precheck' {
            & (Join-Path $scripts 'validate-release-facts.ps1') -Root $Root -SkipDescriptionTestCount -AllowPublishedIndexLag -SkipTestResults
        }
        Save-StageRecord 'prepare'
        Write-Step ("Write the README's latest release lines and the section's intro, review the diff, commit it as " +
            "'chore(release): prepare $Version for publication', then run -Stage preflight.")
    }
    'preflight' {
        Assert-NotPublished
        Assert-StageFinished 'prepare' | Out-Null
        Assert-OnlyChanged
        Assert-SourceVersion
        $clock = [Diagnostics.Stopwatch]::StartNew()
        $unparsed = @(Get-UnparsedScripts)
        if ($unparsed.Count -gt 0) { throw "Tracked scripts that don't parse: $($unparsed -join '; ')" }
        Write-Step 'every tracked PowerShell script parses'
        Invoke-Step 'The release text and stage order tests' { & (Join-Path $releaseScripts 'test-release-text.ps1') -Root $Root }
        Invoke-Step 'The release facts precheck' {
            & (Join-Path $scripts 'validate-release-facts.ps1') -Root $Root -SkipDescriptionTestCount -AllowPublishedIndexLag -SkipTestResults
        }
        # --tests binds to the task before it, and --continue keeps one task's failure from hiding the other's.
        Invoke-ReleaseGradle @(':patches:test', '-x', ':patches:fixtureTest',
            ':extensions:telegram:testDebugUnitTest', '--tests', '*L10n*', '--continue')
        $minutes = [math]::Round($clock.Elapsed.TotalMinutes, 1)
        if ($minutes -gt 5) {
            Write-Warning "preflight took $minutes minutes, over its five-minute budget. Look for a slow step before the next release."
        }
        Save-StageRecord 'preflight' @{ minutes = $minutes }
        Write-Step ("preflight passed in $minutes minutes. Push with BUILD_QUEUE_PRIORITY=release so the full gate runs " +
            'at release priority, then run -Stage build.')
    }
    'build' {
        Assert-NotPublished
        Assert-StageFinished 'preflight' -Commit (Get-Head) | Out-Null
        $head = Assert-PushedHead
        Assert-SourceVersion
        $built = Get-StageRecord 'build'
        $builtHash = Test-Assets
        if ($built -and [string]$built.commit -eq $head -and $builtHash -and $builtHash -eq [string]$built.bundleSha256) {
            Write-Step "$Version is already built from $(Get-ShortCommit $head) and its assets match SHA256SUMS.txt. Run -Stage publish."
            return
        }
        $fixtures = @(Get-DeclaredFixtures)
        $desktopJar = Resolve-DesktopCli -Root $Root -Required
        $requireFixtures = $env:HUSHTELEGRAM_REQUIRE_FIXTURES
        $env:HUSHTELEGRAM_REQUIRE_FIXTURES = '1'
        try {
            Invoke-ReleaseGradle @(':patches:test', ':extensions:telegram:test', ':extensions:shared:library:lint',
                ':extensions:telegram:lint', '--continue')
        } finally {
            $env:HUSHTELEGRAM_REQUIRE_FIXTURES = $requireFixtures
        }
        Invoke-ReleaseGradle @(':patches:generatePatchesList', ':patches:buildAndroid')
        # A catalog the build rewrote is a tree that isn't the commit, and the bundle says so.
        Assert-OnlyChanged
        $bundle = Get-ReleaseBundlePath -Root $Root -Version $Version
        $sbom = Join-Path (Split-Path -Parent $bundle) $sbomName
        foreach ($path in @($bundle, $sbom)) {
            if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { throw ":patches:buildAndroid left no $path." }
        }
        Assert-BundlePinned -Bundle $bundle -Commit $head
        $bundleHash = (Get-Sha256Hex -Path $bundle).ToLowerInvariant()

        # Each clean verify-all-patches.ps1 run is kept, stamped with this commit and the hashes of
        # the bundle, fixture, patch list and CLI, and the receipt reads it instead of patching the
        # build a second time. Runs from an earlier build go first.
        $applied = Join-Path $Root 'patches/build/release-apply'
        if (Test-Path -LiteralPath $applied) { Remove-Item -LiteralPath $applied -Recurse -Force }
        $work = Join-Path ([IO.Path]::GetTempPath()) ("hushtelegram-release-$Version-" + [guid]::NewGuid().ToString('N'))
        try {
            foreach ($fixture in $fixtures) {
                $label = Split-Path -Leaf $fixture
                Write-Step "applying every patch to $label"
                Invoke-Step "verify-all-patches.ps1 on $label" {
                    & (Join-Path $scripts 'verify-all-patches.ps1') -Apk $fixture -DesktopJar $desktopJar -Root $Root `
                        -WorkDir (Join-Path $work 'verify') -Bundle $bundle -KeepIn $applied
                }
            }
            # In this process: pwsh -File would hand the receipt the fixture list as one string.
            Invoke-Step 'The release receipt' {
                & (Join-Path $scripts 'build-release-receipt.ps1') -Root $Root -Fixture $fixtures -WorkDir (Join-Path $work 'receipt') `
                    -Bundle $bundle -DesktopJar $desktopJar -AppliedDir $applied
            }
        } finally {
            Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue
        }
        $receiptPath = Join-Path $Root $receiptName
        $receipt = Get-Content -LiteralPath $receiptPath -Raw | ConvertFrom-Json
        if ([string]$receipt.release.commit -ne $head -or ([string]$receipt.bundle.sha256).ToLowerInvariant() -ne $bundleHash) {
            throw "The receipt names commit $($receipt.release.commit) and bundle $($receipt.bundle.sha256), not $head and $bundleHash."
        }

        New-Item -ItemType Directory -Force -Path $assets | Out-Null
        Get-ChildItem -LiteralPath $assets -File | Remove-Item -Force
        Copy-Item -LiteralPath $bundle, $sbom, $receiptPath -Destination $assets
        $sums = @(foreach ($name in @($bundleName, $sbomName, $receiptName)) {
            '{0}  {1}' -f (Get-Sha256Hex -Path (Join-Path $assets $name)).ToLowerInvariant(), $name
        })
        Write-ReleaseText -Path (Join-Path $assets 'SHA256SUMS.txt') -Text (($sums -join "`n") + "`n")
        Save-StageRecord 'build' @{ bundleSha256 = $bundleHash; fixtures = @($fixtures | ForEach-Object { Split-Path -Leaf $_ }) }
        foreach ($line in $sums) { Write-Step $line }
        Write-Step "The assets are in $assets. Write the notes' intro, install steps and validation, then run -Stage publish."
    }
    'publish' {
        $built = Assert-StageFinished 'build' -Commit (Get-Head)
        $head = Assert-PushedHead
        $bundleHash = Test-Assets
        if (-not $bundleHash -or $bundleHash -ne [string]$built.bundleSha256) {
            throw "The assets in $assets don't match SHA256SUMS.txt and the build that wrote them. Run -Stage build again."
        }
        foreach ($part in @(@('-Intro', $Intro), @('-Install', $Install), @('-Validation', $Validation))) {
            if (-not $part[1] -or -not (Test-Path -LiteralPath $part[1] -PathType Leaf)) {
                throw "$($part[0]) names the file holding that part of the release notes."
            }
        }
        $changelog = Read-ReleaseText -Path (Join-Path $Root 'CHANGELOG.md')
        $notes = New-ReleaseNotes -Changelog $changelog -Version $Version -Intro (Read-ReleaseText -Path $Intro) `
            -Install (Read-ReleaseText -Path $Install) -Validation (Read-ReleaseText -Path $Validation)
        New-Item -ItemType Directory -Force -Path $stages | Out-Null
        $notesPath = Join-Path $stages 'notes.md'
        Write-ReleaseText -Path $notesPath -Text $notes

        if (-not "$(git -C $Root tag --list $tag)".Trim()) { Invoke-Step "Tagging $tag" { git -C $Root tag $tag $head } }
        $tagged = "$(git -C $Root rev-parse "$tag^{commit}")".Trim()
        if ($tagged -ne $head) { throw "$tag points at $tagged, not the release commit $head." }
        $remoteTag = "$(@(git -C $Root ls-remote origin "refs/tags/$tag") | Select-Object -First 1)"
        if (-not $remoteTag) {
            Invoke-Step "Pushing $tag" { git -C $Root push origin "refs/tags/$tag" }
        } elseif (($remoteTag -split '\s+')[0] -ne $head) {
            throw "origin's $tag isn't $head."
        }

        if (Test-ReleaseOnGitHub) {
            Write-Step "$tag is already on GitHub, checking what it serves"
        } else {
            Write-Step "publishing $tag"
            Invoke-Step 'gh release create' {
                gh release create $tag -R $Repository --verify-tag --title $tag --notes-file $notesPath `
                    (Join-Path $assets $bundleName) (Join-Path $assets $sbomName) (Join-Path $assets $receiptName) `
                    (Join-Path $assets 'SHA256SUMS.txt')
            }
        }
        $hostedCopy = Join-Path ([IO.Path]::GetTempPath()) ("hushtelegram-published-$Version-" + [guid]::NewGuid().ToString('N'))
        try {
            Invoke-Step "Downloading $tag back" { gh release download $tag -R $Repository -D $hostedCopy }
            foreach ($name in @($bundleName, $sbomName, $receiptName, 'SHA256SUMS.txt')) {
                $hosted = Join-Path $hostedCopy $name
                if (-not (Test-Path -LiteralPath $hosted -PathType Leaf)) { throw "$tag has no $name." }
                if ((Get-Sha256Hex -Path $hosted) -ne (Get-Sha256Hex -Path (Join-Path $assets $name))) {
                    throw "The $name $tag serves differs from the one built."
                }
                Write-Step "$name matches the hosted copy"
            }
        } finally {
            Remove-Item -LiteralPath $hostedCopy -Recurse -Force -ErrorAction SilentlyContinue
        }
        $body = @(gh release view $tag -R $Repository --json body --jq .body) -join "`n"
        $missing = @(Get-MissingChangelogBullets -Changelog $changelog -Version $Version -Notes $body)
        if ($missing.Count -gt 0) {
            throw "The published notes leave out $($missing.Count) of the $Version bullets, starting with: $($missing[0])"
        }
        Write-Step "the published notes carry every bullet of the $Version section"
        Save-StageRecord 'publish' @{ tag = $tag }
        Write-Step 'Published. Write the text Morphe Manager shows for the bundle, then run -Stage index.'
    }
    'index' {
        $published = Assert-StageFinished 'publish'
        $head = Get-Head
        if ($head -ne [string]$published.commit) {
            throw ("HEAD is $(Get-ShortCommit $head), not the published release commit " +
                "$(Get-ShortCommit ([string]$published.commit)). The index commit goes on top of the release commit.")
        }
        Assert-OnlyChanged @('patches-bundle.json', '.github/ISSUE_TEMPLATE/bug_report.yml')
        if (-not $Description -or -not (Test-Path -LiteralPath $Description -PathType Leaf)) {
            throw '-Description names the file holding the text Morphe Manager shows for the bundle.'
        }
        $publishedAt = "$(gh release view $tag -R $Repository --json publishedAt --jq .publishedAt)".Trim()
        if (-not $publishedAt) { throw "$tag isn't published on GitHub. Run -Stage publish first." }
        $invariant = [Globalization.CultureInfo]::InvariantCulture
        $created = [DateTimeOffset]::Parse($publishedAt, $invariant).UtcDateTime.ToString('yyyy-MM-ddTHH:mm:ss', $invariant)
        Set-ManagerIndex -Path (Join-Path $Root 'patches-bundle.json') -Version $Version -CreatedAt $created `
            -Description (Read-ReleaseText -Path $Description) -Repository $Repository
        $telegram = Get-WebTelegramVersion
        Set-BugFormVersion -Path (Join-Path $Root '.github/ISSUE_TEMPLATE/bug_report.yml') -Version $Version -TelegramVersion $telegram
        Write-Step "patches-bundle.json points at $tag (created_at $created), and the bug form reads HushTelegram $Version on Telegram $telegram"
        $count = @((Get-Catalog).patches).Count
        $current = "$(gh repo view $Repository --json description --jq .description)".Trim()
        $updated = Get-UpdatedRepoDescription -Description $current -Version $Version -Count $count -TelegramVersion $telegram
        if ($updated -cne $current) {
            Invoke-Step 'Updating the repository description' { gh repo edit $Repository --description $updated }
            Write-Step "the repository description reads: $updated"
        }
        Invoke-Step 'The published asset check' { & (Join-Path $scripts 'validate-release-facts.ps1') -Root $Root -VerifyPublishedAsset }
        Save-StageRecord 'index' @{ createdAt = $created }
        Write-Step ("Commit patches-bundle.json and the bug form as 'chore(release): point Manager to the verified $Version " +
            "bundle' and push.")
    }
}
