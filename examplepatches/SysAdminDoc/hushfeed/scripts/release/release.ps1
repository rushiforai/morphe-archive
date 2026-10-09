<#
.SYNOPSIS
    Cuts a Hushfeed release in stages: prepare, preflight, build, publish, index.

.DESCRIPTION
    One command per stage, in this order. Each stage checks that the one before it finished and
    refuses to run otherwise, so a stage can be re-run after a fix without redoing the others.

      prepare    CHANGELOG cut, version bump, patch list, What's new, translation and facts checks.
                 Then review and commit "chore(release): prepare X.Y.Z for publication".
      preflight  The fast checks a release gate would otherwise reach late (about five minutes):
                 the patch test partition without the fixture-heavy tests, What's new and L10n
                 tests, lint, the notes generator's own tests and the facts check. Then push with
                 BUILD_QUEUE_PRIORITY=release so the full pre-push gate runs.
      build      From the pushed, clean release commit: the bundle (timestamp pinned, classes.dex
                 present), the receipt over every declared fixture and SHA256SUMS.txt, into
                 build/release-assets/<version>.
      publish    Notes from the whole CHANGELOG section, a lightweight tag, the GitHub release
                 with the three assets, each downloaded back and compared.
      index      patches-bundle.json, the README intro and counts, the bug form and the repository
                 description. Then commit "chore(release): point Manager to the verified X.Y.Z
                 bundle" and push (pre-push compares the hosted bundle byte for byte).

    Heavy steps run inside the machine build queue BUILD_QUEUE_SCRIPT names, at release
    priority; Gradle goes through HUSHFEED_BUILD_WRAPPER as the pre-push gate does.

.EXAMPLE
    scripts/release/release.ps1 -Stage prepare -Version 0.70.0
    scripts/release/release.ps1 -Stage publish -Version 0.70.0 -Intro intro.md -Checked checked.md
    scripts/release/release.ps1 -Stage index -Version 0.70.0 -ReadmeSummary readme.txt -BundleSummary bundle.txt -DeviceLine "..."
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][ValidateSet('prepare', 'preflight', 'build', 'publish', 'index')][string]$Stage,
    [Parameter(Mandatory = $true)][ValidatePattern('^\d+\.\d+\.\d+$')][string]$Version,
    [string]$Date,
    [string]$Intro,
    [string]$Checked,
    [string]$ReadmeSummary,
    [string]$BundleSummary,
    [string]$DeviceLine = '',
    [string]$Repository = 'SysAdminDoc/HushFeed'
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$tag = "v$Version"
$assets = Join-Path $root "build/release-assets/$Version"
$bundleName = "patches-$Version.mpp"
$receiptName = "release-receipt-$Version.json"

foreach ($name in 'HUSHFEED_FIXTURE_DIR', 'HUSHFEED_BUILD_WRAPPER', 'HUSHFEED_DEVICE_SERIAL', 'HUSHFEED_DESKTOP_JAR', 'BUILD_QUEUE_SCRIPT') {
    if (-not (Get-Item "env:$name" -ErrorAction SilentlyContinue)) {
        $value = [Environment]::GetEnvironmentVariable($name, 'User')
        if ($value) { Set-Item "env:$name" $value }
    }
}
# A machine that shares its cores between several builds names its queue script here; the
# script defines Invoke-InBuildQueue. Unset, the heavy steps run straight away.
$env:BUILD_QUEUE_PRIORITY = 'release'
if ($env:BUILD_QUEUE_SCRIPT -and (Test-Path -LiteralPath $env:BUILD_QUEUE_SCRIPT -PathType Leaf)) { . $env:BUILD_QUEUE_SCRIPT }

function Step([string]$Text) { Write-Host "[release] $Text" -ForegroundColor Cyan }

function Invoke-Native {
    param([string]$What, [scriptblock]$Command)
    & $Command
    if ($LASTEXITCODE -ne 0) { throw "$What failed (exit $LASTEXITCODE)" }
}

function Invoke-Gradle {
    param([string[]]$Tasks)
    if (-not $env:HUSHFEED_BUILD_WRAPPER) { throw 'HUSHFEED_BUILD_WRAPPER is not set; heavy builds go through the machine wrapper.' }
    # Set JAVA_HOME rather than putting a JDK first on PATH: Resolve-Java's contract case reads
    # a PATH java as a bare name, and a newer PATH java once failed the gate in seconds.
    if (-not $env:JAVA_HOME) { throw 'Set JAVA_HOME to a JDK 21 or newer (Android Studio''s jbr works).' }
    if (-not $env:GITHUB_TOKEN) {
        $env:GITHUB_ACTOR = (gh api user --jq .login)
        $env:GITHUB_TOKEN = (gh auth token)
    }
    Invoke-Native "Gradle $($Tasks -join ' ')" { & $env:HUSHFEED_BUILD_WRAPPER -ProjectDir $root -Tasks $Tasks }
}

function Invoke-Queued {
    param([string]$Label, [scriptblock]$Command)
    if (Get-Command Invoke-InBuildQueue -ErrorAction SilentlyContinue) {
        $code = Invoke-InBuildQueue -Label "hushfeed $Label" -Priority release -ScriptBlock $Command
        if ($code -ne 0) { throw "$Label failed (exit $code)" }
    } else {
        & $Command
    }
}

function Assert-Clean {
    if (git -C $root status --porcelain --untracked-files=all) { throw 'The working tree has changes. Commit or move them first.' }
}

function Assert-PushedHead {
    Assert-Clean
    $head = (git -C $root rev-parse HEAD).Trim()
    $remote = ((git -C $root ls-remote origin refs/heads/main) -split '\s+')[0]
    if ($head -ne $remote) { throw "HEAD $head isn't origin/main $remote. Push the release commit first." }
    return $head
}

function Get-SourceVersion { ((Get-Content -LiteralPath (Join-Path $root 'gradle.properties')) -match '^version\s*=' -replace '^version\s*=\s*', '').Trim() }

function Get-TestCount([string[]]$Directories) {
    $count = 0
    foreach ($directory in $Directories) {
        $files = @(Get-ChildItem -LiteralPath (Join-Path $root $directory) -Filter 'TEST-*.xml' -File -ErrorAction SilentlyContinue)
        if ($files.Count -eq 0) { throw "No test results in $directory. The release gate writes them; run it in this checkout." }
        foreach ($file in $files) { $count += @(([xml](Get-Content -LiteralPath $file.FullName -Raw)).testsuite.testcase).Count }
    }
    return $count
}

switch ($Stage) {
    'prepare' {
        Assert-Clean
        if ((git -C $root rev-parse --abbrev-ref HEAD).Trim() -ne 'main') { throw 'Releases are cut on main.' }
        if (git -C $root tag --list $tag) { throw "$tag already exists." }
        Step "cutting the CHANGELOG for $Version"
        $cutArgs = @('cut', '--version', $Version) + $(if ($Date) { @('--date', $Date) } else { @() })
        Invoke-Native 'CHANGELOG cut' { py -3.13 (Join-Path $root 'tools/release_text.py') @cutArgs }
        Step 'version in gradle.properties and the README badge'
        $properties = Join-Path $root 'gradle.properties'
        $text = [IO.File]::ReadAllText($properties) -replace '(?m)^version = \d+\.\d+\.\d+$', "version = $Version"
        [IO.File]::WriteAllText($properties, $text)
        $readme = Join-Path $root 'README.md'
        $text = [IO.File]::ReadAllText($readme) -replace 'badge/version-\d+\.\d+\.\d+-', "badge/version-$Version-"
        [IO.File]::WriteAllText($readme, $text)
        Step 'patch list and What''s new'
        Invoke-Gradle @(':patches:generatePatchesList')
        Invoke-Native 'What''s new' { py -3.13 (Join-Path $root 'tools/gen-release-notes.py') }
        Invoke-Native 'translation check' { py -3.13 (Join-Path $root 'tools/release_text.py') check-translations --version $Version }
        Invoke-Native 'facts precheck' {
            & (Join-Path $root 'scripts/validate-release-facts.ps1') -Root $root -SkipDescriptionTestCount -AllowPublishedIndexLag -SkipTestResults
        }
        Step "review the diff, commit it as 'chore(release): prepare $Version for publication', then run -Stage preflight"
    }
    'preflight' {
        Assert-Clean
        if ((Get-SourceVersion) -ne $Version) { throw "gradle.properties says $(Get-SourceVersion). Run -Stage prepare first." }
        $started = Get-Date
        Invoke-Native 'release text tests' { py -3.13 -m unittest discover -s (Join-Path $root 'tools') -p 'test_*.py' }
        Invoke-Native 'translation check' { py -3.13 (Join-Path $root 'tools/release_text.py') check-translations --version $Version }
        Invoke-Gradle @(':patches:test', '-x', ':patches:nativeTest', '-x', ':patches:documentationTest')
        Invoke-Gradle @(':extensions:tiktok:testDebugUnitTest', '--tests', '*ReleaseNotesTest', '--tests', '*SettingsL10nTest', '--tests', '*L10nQuantityTest', ':extensions:tiktok:lintDebug')
        Invoke-Native 'facts precheck' {
            & (Join-Path $root 'scripts/validate-release-facts.ps1') -Root $root -SkipDescriptionTestCount -AllowPublishedIndexLag -SkipTestResults
        }
        Step ("preflight passed in {0:N0} min. Push with BUILD_QUEUE_PRIORITY=release so the full gate runs, then -Stage build" -f ((Get-Date) - $started).TotalMinutes)
    }
    'build' {
        $head = Assert-PushedHead
        if ((Get-SourceVersion) -ne $Version) { throw "gradle.properties says $(Get-SourceVersion), not $Version." }
        Step "bundle from $head"
        Invoke-Gradle @(':patches:buildAndroid')
        $bundle = Join-Path $root "patches/build/release/$bundleName"
        if (-not (Test-Path -LiteralPath $bundle)) { throw "No bundle at $bundle." }
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        $zip = [IO.Compression.ZipFile]::OpenRead($bundle)
        try {
            $reader = [IO.StreamReader]::new($zip.GetEntry('META-INF/MANIFEST.MF').Open())
            $manifest = $reader.ReadToEnd(); $reader.Dispose()
            $hasDex = [bool]($zip.Entries | Where-Object FullName -EQ 'classes.dex')
        } finally { $zip.Dispose() }
        $stamp = [regex]::Match($manifest, 'Timestamp:\s*(\d+)').Groups[1].Value
        $seconds = (git -C $root log -1 --format=%ct).Trim()
        if ($stamp -ne "${seconds}000") { throw "The bundle's Timestamp $stamp isn't pinned to the release commit ($seconds)." }
        if (-not $hasDex) { throw 'The bundle has no classes.dex, so Manager would load no patches.' }
        Step 'receipt over every declared fixture'
        $declared = @((Get-Content -LiteralPath (Join-Path $root 'patches-list.json') -Raw | ConvertFrom-Json).patches |
            ForEach-Object { $_.compatibility.targets } | Where-Object { -not $_.experimental } |
            ForEach-Object { $_.version } | Sort-Object -Unique)
        $fixtures = foreach ($v in $declared) {
            $match = @(Get-ChildItem -LiteralPath $env:HUSHFEED_FIXTURE_DIR -Filter "com.zhiliaoapp.musically_$v-*.apk" -File)
            if ($match.Count -ne 1) { throw "Expected one $v APK in $env:HUSHFEED_FIXTURE_DIR, found $($match.Count)." }
            $match[0].FullName
        }
        $work = Join-Path ([IO.Path]::GetTempPath()) "hushfeed-receipt-$Version"
        New-Item -ItemType Directory -Force -Path $work | Out-Null
        try {
            # The release gate kept its fixture runs; the receipt reads any made with this bundle.
            Invoke-Queued 'receipt' {
                & (Join-Path $root 'scripts/build-release-receipt.ps1') -WorkDir $work -Fixture $fixtures -Bundle $bundle `
                    -AppliedDir (Join-Path $root 'patches/build/fixture-apply')
            }
        } finally { Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue }
        New-Item -ItemType Directory -Force -Path $assets | Out-Null
        Copy-Item -LiteralPath $bundle, (Join-Path $root $receiptName) -Destination $assets -Force
        $sums = foreach ($name in $bundleName, $receiptName) {
            '{0}  {1}' -f (Get-FileHash -Algorithm SHA256 -LiteralPath (Join-Path $assets $name)).Hash.ToLowerInvariant(), $name
        }
        [IO.File]::WriteAllText((Join-Path $assets 'SHA256SUMS.txt'), (($sums -join "`n") + "`n"), [Text.UTF8Encoding]::new($false))
        $sums | ForEach-Object { Step $_ }
        Step "assets in $assets. Write the intro and checked lists, then -Stage publish"
    }
    'publish' {
        $head = Assert-PushedHead
        if (-not $Intro -or -not $Checked) { throw '-Intro and -Checked are the notes paragraphs above and below the CHANGELOG bullets.' }
        foreach ($name in $bundleName, $receiptName, 'SHA256SUMS.txt') {
            if (-not (Test-Path -LiteralPath (Join-Path $assets $name))) { throw "No $name in $assets. Run -Stage build first." }
        }
        $receipt = Get-Content -LiteralPath (Join-Path $assets $receiptName) -Raw | ConvertFrom-Json
        if ($receipt.source.commit -and $receipt.source.commit -ne $head) { throw "The receipt is for $($receipt.source.commit), HEAD is $head." }
        $notes = Join-Path $assets 'notes.md'
        Invoke-Native 'release notes' { py -3.13 (Join-Path $root 'tools/release_text.py') github-notes --version $Version --intro $Intro --checked $Checked --out $notes }
        if (-not (git -C $root tag --list $tag)) { Invoke-Native 'tag' { git -C $root tag $tag $head } }
        if ((git -C $root rev-parse "$tag^{commit}").Trim() -ne $head) { throw "$tag doesn't point at $head." }
        Invoke-Native 'tag push' { git -C $root push origin $tag }
        Step "publishing $tag"
        Invoke-Native 'gh release create' {
            gh release create $tag -R $Repository --verify-tag --title $tag --notes-file $notes `
                (Join-Path $assets $bundleName) (Join-Path $assets $receiptName) (Join-Path $assets 'SHA256SUMS.txt')
        }
        $check = Join-Path ([IO.Path]::GetTempPath()) "hushfeed-published-$Version"
        Remove-Item -LiteralPath $check -Recurse -Force -ErrorAction SilentlyContinue
        Invoke-Native 'download back' { gh release download $tag -R $Repository -D $check }
        foreach ($name in $bundleName, $receiptName, 'SHA256SUMS.txt') {
            $local = (Get-FileHash -Algorithm SHA256 -LiteralPath (Join-Path $assets $name)).Hash
            $hosted = (Get-FileHash -Algorithm SHA256 -LiteralPath (Join-Path $check $name)).Hash
            if ($local -ne $hosted) { throw "The hosted $name differs from the local one." }
            Step "$name matches the hosted copy"
        }
        Remove-Item -LiteralPath $check -Recurse -Force
        Step 'published. Write the README and bundle summaries, then -Stage index'
    }
    'index' {
        Assert-PushedHead | Out-Null
        if (-not $ReadmeSummary -or -not $BundleSummary) { throw '-ReadmeSummary and -BundleSummary are the release''s README line and Manager text.' }
        $published = gh release view $tag -R $Repository --json publishedAt --jq .publishedAt
        if (-not $published) { throw "$tag isn't published. Run -Stage publish first." }
        $created = ([DateTime]::Parse($published).ToUniversalTime()).ToString('yyyy-MM-ddTHH:mm:ss')
        $runtime = Get-TestCount @('extensions/tiktok/build/test-results/testDebugUnitTest')
        $patch = Get-TestCount @('patches/build/test-results/test', 'patches/build/test-results/nativeTest', 'patches/build/test-results/documentationTest')
        Invoke-Native 'index' {
            py -3.13 (Join-Path $root 'tools/release_text.py') index --version $Version --created $created `
                --readme-summary $ReadmeSummary --bundle-summary $BundleSummary --device-line $DeviceLine --runtime $runtime --patch $patch
        }
        Copy-Item -LiteralPath (Join-Path $assets $receiptName) -Destination (Join-Path $root $receiptName) -Force
        $description = gh repo view $Repository --json description --jq .description
        $list = Get-Content -LiteralPath (Join-Path $root 'patches-list.json') -Raw | ConvertFrom-Json
        $count = @($list.patches).Count
        $updated = $description -replace 'Hushfeed v\d+\.\d+\.\d+', "Hushfeed v$Version" -replace '\b\d+ patches\b', "$count patches"
        if ($updated -ne $description) { Invoke-Native 'repository description' { gh repo edit $Repository --description $updated } }
        Step "index points at $tag ($runtime runtime tests, $patch patch tests). Commit it as 'chore(release): point Manager to the verified $Version bundle' and push"
    }
}
