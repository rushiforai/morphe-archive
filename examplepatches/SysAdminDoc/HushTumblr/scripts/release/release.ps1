<#
.SYNOPSIS
    Cuts a HushTumblr release in stages: prepare, preflight, gate, build, publish.

.DESCRIPTION
    One command per stage, run in this order. Each stage checks what the one before it left and
    refuses to start otherwise, and a stage that already finished for this commit says so and
    changes nothing, so any of them can be run again after a fix.

      prepare    Holds the Unreleased section to what a release can carry (one-line Tumblr and
                 Tooling bullets only, naming any other bullet it finds) and the source census to
                 its 14 days (Test-SourceReleaseGate), cuts the section as the release,
                 bumps gradle.properties and the README badge, regenerates patches-list.json and
                 runs the release facts check. Then commits "release: prepare X.Y.Z". A failure
                 puts the four files back. Before the first release (no patches-bundle.json and
                 no v* tag here or on origin) the version may already be the one asked for, and
                 the facts check, which needs the index, is skipped here and in preflight;
                 publish writes the first index and checks it.
      preflight  The quick checks the release gate would otherwise reach late: the release text
                 tests, every tracked PowerShell file parsing, what the later stages need (the
                 declared fixtures, the desktop CLI, the signing inputs, gh, the hook), the facts
                 check, then the gate's quick Gradle pass, without the fixture suite. About five
                 minutes. It writes how long it took.
      gate       Pushes the prepare commit with HUSHTUMBLR_RELEASE_GATE=1, so the pre-push gate
                 runs in full, builds the bundle and patches every declared fixture with it,
                 keeping each passing run for patch-for-device.ps1.
      build      From the pushed prepare commit: the bundle (timestamp pinned to the commit,
                 classes.dex present), the receipt over every declared fixture, each patched and
                 checked again here rather than read from the gate's kept runs
                 (build-release-receipt.ps1, run in this process), and the signed
                 SHA256SUMS.txt, all in build/release-assets/X.Y.Z.
      publish    publish-release.ps1: first -Walk, the receipt of a whole-app walk of the
                 signed bundle on a release phone or an emulator, and the source census, then
                 the notes, gh release create with the five assets, each downloaded back and
                 compared, the index commit, pushed at once, and verify-published-index.ps1
                 last. A census refreshed after the cut is committed on top of the prepare
                 commit, and so is a fix to these scripts.

    Heavy steps go through HUSHTUMBLR_BUILD_WRAPPER, or the build queue BUILD_QUEUE_SCRIPT
    names, at release priority. The signing inputs are parameters (or the HUSHTUMBLR_RELEASE_*
    variables) and never written in a tracked file.

.EXAMPLE
    scripts/release/release.ps1 -Stage prepare -Version 0.0.7
    scripts/release/release.ps1 -Stage preflight -Version 0.0.7 -GpgHome <keyring> -SigningFingerprint <hex> -TrustedPublicKeyPath <key.asc>
    scripts/release/release.ps1 -Stage gate -Version 0.0.7
    scripts/release/release.ps1 -Stage build -Version 0.0.7 -GpgHome <keyring> -SigningFingerprint <hex> -TrustedPublicKeyPath <key.asc>
    scripts/release/release.ps1 -Stage publish -Version 0.0.7 -Intro intro.txt -Tail tail.txt -Summary summary.txt -SigningFingerprint <hex> -TrustedPublicKeyPath <key.asc> -Walk <walk folder>/walk-receipt.json
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][ValidateSet('prepare', 'preflight', 'gate', 'build', 'publish')][string]$Stage,
    [Parameter(Mandatory = $true)][ValidatePattern('^\d+\.\d+\.\d+$')][string]$Version,
    [string]$Root,
    # The release date for the CHANGELOG heading, today in UTC when left out.
    [ValidatePattern('^\d{4}-\d{2}-\d{2}$')][string]$Date,
    # The keyring folder that holds the signing key. Its passphrase goes through GPG's pinentry.
    [string]$GpgHome,
    [string]$SigningFingerprint,
    # The public key pinned for the fingerprint, read from a trusted copy, never the asset folder.
    [string]$TrustedPublicKeyPath,
    [string]$Gpg = 'gpg',
    # publish: the notes above and below the CHANGELOG bullets, and Manager's summary sentence.
    [string]$Intro,
    [string]$Tail,
    [string]$Summary,
    # publish: the walk-receipt.json a whole-app walk of the signed bundle left (walk-receipt.ps1).
    [string]$Walk,
    [string]$Repository = 'SysAdminDoc/HushTumblr'
)

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'release-common.ps1')
$Root = Resolve-ReleaseRoot $Root
Import-ReleaseEnvironment
$tag = "v$Version"
$started = Get-Date
$changedByPrepare = @('CHANGELOG.md', 'gradle.properties', 'README.md', 'patches-list.json')

function Assert-Prepared {
    $commit = Get-PrepareCommit -Root $Root -Version $Version
    if (-not $commit) {
        throw "HEAD isn't the commit '$($script:PrepareSubject -f $Version)'. Run -Stage prepare first."
    }
    return $commit
}

switch ($Stage) {
    'prepare' {
        Assert-ReleaseClean $Root
        $head = Get-ReleaseGitText -Root $Root -Arguments @('rev-parse', 'HEAD')
        $prepared = Get-PrepareCommit -Root $Root -Version $Version
        if ($prepared) {
            Write-ReleaseStep "$Version is already prepared at $prepared. Run -Stage preflight next."
            return
        }
        $branch = Get-ReleaseGitText -Root $Root -Arguments @('rev-parse', '--abbrev-ref', 'HEAD')
        if ($branch -cne 'main') { throw "Releases are cut on main, and this checkout is on $branch." }
        $current = Get-BundleVersion -Root $Root
        if ($current -eq $Version) {
            # The first release ships the version the project started at, so there's nothing to bump.
            # Once any release exists (Test-FirstRelease), the same version is refused as before.
            if (-not (Test-FirstRelease -Root $Root)) {
                throw "gradle.properties already says $Version, but HEAD $head isn't its prepare commit. Put it back to the last release first."
            }
            Write-ReleaseStep ("gradle.properties already says $Version and nothing has been released yet (no patches-bundle.json " +
                'and no v* tag here or on origin), so this first release keeps the version and still cuts the CHANGELOG')
        } elseif ([version]$Version -le [version]$current) {
            throw "$Version isn't newer than $current, the version in gradle.properties."
        }
        if (Get-ReleaseGitText -Root $Root -Arguments @('tag', '--list', $tag)) { throw "The tag $tag already exists here." }
        $global:LASTEXITCODE = 0
        $remoteTag = @(& git -C $Root ls-remote --tags origin "refs/tags/$tag")
        if ($LASTEXITCODE -ne 0) { throw "git couldn't ask origin for its tags (exit $LASTEXITCODE)." }
        if ($remoteTag.Count -gt 0) { throw "origin already has the tag $tag." }

        # Before anything is written: a bullet a release can't carry is named here, and nothing changes.
        Invoke-ReleaseText -Root $Root -What 'The Unreleased check' -Arguments @('check', '--unreleased')
        # The source census publish holds the release to. Asked here, a stale one is refreshed and
        # committed before the cut, not found after the gate, the build and the walk.
        . (Join-Path $Root 'scripts/tumblr-sources.ps1')
        $census = Test-SourceReleaseGate -Root $Root
        if (-not $census.Valid) { throw "Nothing was prepared, since the release can't go out on this source census: $($census.Reason)" }
        Write-ReleaseStep $census.Summary
        $utf8 = New-Object Text.UTF8Encoding $false
        try {
            $releaseDate = if ($Date) { $Date } else { (Get-Date).ToUniversalTime().ToString('yyyy-MM-dd') }
            Invoke-ReleaseText -Root $Root -What 'The CHANGELOG cut' -Arguments @('cut', '--version', $Version, '--date', $releaseDate)

            Write-ReleaseStep "version $Version in gradle.properties and the README badge"
            $properties = Join-Path $Root 'gradle.properties'
            $text = [IO.File]::ReadAllText($properties)
            $pattern = '(?m)^version\s*=\s*\d+\.\d+\.\d+(?=\r?$)'
            if ([regex]::Matches($text, $pattern).Count -ne 1) { throw 'gradle.properties has no single version line to bump.' }
            [IO.File]::WriteAllText($properties, ([regex]::Replace($text, $pattern, "version = $Version")), $utf8)
            $readme = Join-Path $Root 'README.md'
            $text = [IO.File]::ReadAllText($readme)
            foreach ($badge in @(@('badge/version-\d+\.\d+\.\d+-', "badge/version-$Version-"), @('alt="Version \d+\.\d+\.\d+"', "alt=`"Version $Version`""))) {
                if ([regex]::Matches($text, $badge[0]).Count -ne 1) { throw "The README has no single version badge matching $($badge[0])." }
                $text = [regex]::Replace($text, $badge[0], $badge[1])
            }
            [IO.File]::WriteAllText($readme, $text, $utf8)

            Invoke-ReleaseGradle -Root $Root -Tasks @(':patches:generatePatchesList') -Job 'release patch list'
            $catalogVersion = [string](Get-Content -LiteralPath (Join-Path $Root 'patches-list.json') -Raw | ConvertFrom-Json).version
            if ($catalogVersion -cne $tag) { throw "patches-list.json says $catalogVersion after the patch list was generated, not $tag." }
            Invoke-ReleaseFactsPrecheck -Root $Root

            $changed = @(& git -C $Root status --porcelain --untracked-files=all | ForEach-Object { $_.Substring(3) })
            $unexpected = @($changed | Where-Object { $changedByPrepare -notcontains $_ })
            if ($unexpected.Count -gt 0) { throw "Preparing the release also changed $($unexpected -join ', '), which a prepare commit doesn't carry." }
            Invoke-ReleaseNative 'git add' { & git -C $Root add -- @changedByPrepare }
            Invoke-ReleaseNative 'The prepare commit' { & git -C $Root commit --quiet -m ($script:PrepareSubject -f $Version) }
        } catch {
            Write-ReleaseStep 'putting the CHANGELOG, gradle.properties, the README and patches-list.json back'
            & git -C $Root reset --quiet -- @changedByPrepare
            & git -C $Root checkout --quiet HEAD -- @changedByPrepare
            throw
        }
        $commit = Get-ReleaseGitText -Root $Root -Arguments @('rev-parse', 'HEAD')
        Write-ReleaseStep "prepared $Version as $commit. Read it over (git show), then run -Stage preflight."
    }

    'preflight' {
        Assert-ReleaseClean $Root
        $commit = Assert-Prepared
        $done = Get-ReleaseStageMarker $Root $Version 'preflight' $commit
        if ($done) {
            Write-ReleaseStep "the preflight already passed for $commit at $($done.finishedAt), in $($done.minutes) min. Run -Stage gate next."
            return
        }
        $python = Resolve-ReleasePython
        $prefix = @($python | Select-Object -Skip 1)
        Invoke-ReleaseNative 'The release text tests' {
            & $python[0] @prefix -m unittest discover -s $PSScriptRoot -p 'test_*.py'
        }
        Invoke-ReleaseText -Root $Root -What 'The released section check' -Arguments @('check', '--version', $Version)

        . (Join-Path $Root 'scripts/script-wiring.ps1')
        $tracked = @(& git -C $Root ls-files -- '*.ps1')
        $unparsed = @(foreach ($file in $tracked) {
            try { [void](Get-ScriptAst -Path (Join-Path $Root $file)) } catch { $_.Exception.Message }
        })
        if ($unparsed.Count -gt 0) { throw "These tracked scripts don't parse: $($unparsed -join '; ')" }
        Write-ReleaseStep "all $($tracked.Count) tracked PowerShell files parse"

        # What the later stages need, so a missing one stops the release now and not after the gate.
        $fixtures = Get-DeclaredFixtures -Root $Root
        Write-ReleaseStep "$($fixtures.Count) declared fixture(s) found"
        if (-not $env:HUSHTUMBLR_DESKTOP_JAR -or -not (Test-Path -LiteralPath $env:HUSHTUMBLR_DESKTOP_JAR -PathType Leaf)) {
            throw 'Set HUSHTUMBLR_DESKTOP_JAR to the Morphe desktop CLI. The gate and the receipt patch with it.'
        }
        if ([string]::IsNullOrWhiteSpace([Environment]::GetEnvironmentVariable('HUSHTUMBLR_BUNDLE_SIGNING_KEY', 'User'))) {
            throw 'Set the User variable HUSHTUMBLR_BUNDLE_SIGNING_KEY to the bundle signing key. The gate and the build sign the bundle with it.'
        }
        $signing = Get-SigningInputs -GpgHome $GpgHome -Fingerprint $SigningFingerprint -PublicKey $TrustedPublicKeyPath
        $gpgVersion = @(Invoke-ReleaseQuiet { & $Gpg --version })
        if ($LASTEXITCODE -ne 0 -or $gpgVersion.Count -eq 0) { throw "$Gpg doesn't run, and the build stage signs the checksums with it. Pass -Gpg." }
        Write-ReleaseStep $gpgVersion[0]
        Invoke-ReleaseNative 'gh auth status' { & gh auth status }
        $hookPath = Get-ReleaseGitText -Root $Root -Arguments @('rev-parse', '--git-path', 'hooks/pre-push')
        if (-not [IO.Path]::IsPathRooted($hookPath)) { $hookPath = Join-Path $Root $hookPath }
        if (-not (Test-Path -LiteralPath $hookPath -PathType Leaf)) { throw 'The pre-push hook is not installed. Run scripts/install-hooks.ps1 first.' }
        Write-ReleaseStep "signing with $($signing.Fingerprint) from $($signing.GpgHome)"

        Invoke-ReleaseFactsPrecheck -Root $Root
        # The gate's quick pass (pre-push.ps1): everything but the fixture suite and the bundle.
        Invoke-ReleaseGradle -Root $Root -Job 'release preflight' -Tasks @(
            ':patches:buildDependencyReport', ':extensions:tumblr:test', ':patches:test',
            ':extensions:shared:library:lint', ':extensions:tumblr:lint')
        Assert-ReleaseClean $Root
        $minutes = ((Get-Date) - $started).TotalMinutes
        Set-ReleaseStageMarker $Root $Version 'preflight' $commit $minutes
        Write-ReleaseStep ("the preflight passed in {0:N1} min. Run -Stage gate next." -f $minutes)
    }

    'gate' {
        Assert-ReleaseClean $Root
        $commit = Assert-Prepared
        if (-not (Get-ReleaseStageMarker $Root $Version 'preflight' $commit)) {
            throw "The preflight hasn't passed for $commit. Run -Stage preflight first."
        }
        $done = Get-ReleaseStageMarker $Root $Version 'gate' $commit
        $remote = Get-RemoteMain $Root
        if ($done -and $remote -ceq $commit) {
            Write-ReleaseStep "$commit already went out through the release gate at $($done.finishedAt). Run -Stage build next."
            return
        }
        if ($remote -ceq $commit) {
            throw ("origin's main is already at $commit, but not through -Stage gate, so the release gate never " +
                'built its bundle or patched the fixtures with it. Undo the prepare commit (git reset --keep HEAD~1 after ' +
                'reverting it on origin), then prepare again.')
        }
        if ($remote) {
            Invoke-ReleaseQuiet { & git -C $Root merge-base --is-ancestor $remote $commit } | Out-Null
            if ($LASTEXITCODE -ne 0) {
                throw "origin's main ($remote) has commits HEAD doesn't. Undo the prepare commit with git reset --keep HEAD~1, pull, then prepare again."
            }
        }
        Write-ReleaseStep "pushing $commit through the release gate: the full suite, the bundle and every declared fixture patched with it"
        try {
            Invoke-ReleasePush -Root $Root -ReleaseGate
        } catch {
            throw ("The release gate refused $commit. Read its output above. Fix the cause in a commit of its own: " +
                'undo the prepare commit with git reset --keep HEAD~1, commit the fix, then prepare again.')
        }
        if ((Get-RemoteMain $Root) -cne $commit) { throw "The push finished, but origin's main isn't $commit." }
        Set-ReleaseStageMarker $Root $Version 'gate' $commit ((Get-Date) - $started).TotalMinutes
        Write-ReleaseStep ("$commit passed the release gate in {0:N0} min. Run -Stage build next." -f ((Get-Date) - $started).TotalMinutes)
    }

    'build' {
        Assert-ReleaseClean $Root
        $commit = Assert-Prepared
        if (-not (Get-ReleaseStageMarker $Root $Version 'gate' $commit)) {
            throw "$commit hasn't gone out through the release gate. Run -Stage gate first."
        }
        $signing = Get-SigningInputs -GpgHome $GpgHome -Fingerprint $SigningFingerprint -PublicKey $TrustedPublicKeyPath
        if ((Get-RemoteMain $Root) -cne $commit) { throw "origin's main isn't $commit any more. A release is built from the commit the gate passed." }
        $assets = Join-Path $Root "build/release-assets/$Version"
        $built = Test-ReleaseAssets -Root $Root -Version $Version -Commit $commit -TrustedPublicKeyPath $signing.PublicKey `
            -TrustedFingerprint $signing.Fingerprint -Gpg $Gpg
        if ($built -eq $true) {
            Write-ReleaseStep "the assets in $assets are already built and signed for $commit. Run -Stage publish next."
            return
        }
        Invoke-ReleaseQuiet { & gh release view $tag -R $Repository --json tagName } | Out-Null
        if ($LASTEXITCODE -eq 0) { throw "$tag is already on GitHub, and the assets here don't match it ($built). Nothing was rebuilt." }

        # The build signs the bundle (MorpheSig1) with this key. It lives in a User environment
        # variable on the release machine, never in the repo; morphe-signing.pub is its public half.
        # It's in the environment for this build only, so the shell that ran the stage, and what it
        # starts next, never inherits the private key.
        $hadSigningKey = Test-Path Env:\MORPHE_SIGNING_KEY
        $callerSigningKey = $env:MORPHE_SIGNING_KEY
        try {
            if ([string]::IsNullOrWhiteSpace($env:MORPHE_SIGNING_KEY)) {
                $env:MORPHE_SIGNING_KEY = [Environment]::GetEnvironmentVariable('HUSHTUMBLR_BUNDLE_SIGNING_KEY', 'User')
            }
            if ([string]::IsNullOrWhiteSpace($env:MORPHE_SIGNING_KEY)) {
                throw 'HUSHTUMBLR_BUNDLE_SIGNING_KEY is not set. Morphe Manager pins the first key a source signs with, so a release bundle is never built unsigned.'
            }
            Invoke-ReleaseGradle -Root $Root -Tasks @(':patches:buildAndroid') -Job 'release bundle'
        } finally {
            if ($hadSigningKey) { $env:MORPHE_SIGNING_KEY = $callerSigningKey }
            elseif (Test-Path Env:\MORPHE_SIGNING_KEY) { Remove-Item -LiteralPath Env:\MORPHE_SIGNING_KEY }
        }
        $bundle = Get-ReleaseBundlePath -Root $Root -Version $Version
        $sbom = [IO.Path]::ChangeExtension($bundle, '.cdx.json')
        foreach ($file in $bundle, $sbom) { if (-not (Test-Path -LiteralPath $file -PathType Leaf)) { throw ":patches:buildAndroid left no $file." } }
        . (Join-Path $Root 'scripts/release-receipt.ps1')
        $stamp = (Get-BundleManifestFacts -BundlePath $bundle).timestamp
        $seconds = [long](Get-ReleaseGitText -Root $Root -Arguments @('log', '-1', '--format=%ct', $commit))
        if ($stamp -ne $seconds * 1000) { throw "The bundle's Timestamp $stamp isn't pinned to $commit ($($seconds * 1000)), so it isn't a build of that commit." }
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        $zip = [IO.Compression.ZipFile]::OpenRead($bundle)
        try { $hasDex = @($zip.Entries | Where-Object { $_.FullName -ceq 'classes.dex' }).Count -eq 1 } finally { $zip.Dispose() }
        if (-not $hasDex) { throw 'The bundle has no classes.dex, so Manager would load no patches from it.' }
        $signature = Get-BundleSignature -Path $bundle
        if ($null -eq $signature) { throw 'A signing key was set, but the bundle came out unsigned.' }
        if ($signature.PublicKey -cne (Get-BundlePublicKey -Root $Root)) { throw 'The bundle is signed by a key other than morphe-signing.pub.' }
        Write-ReleaseStep "bundle $(Split-Path -Leaf $bundle) is pinned to $commit, carries its dex and is signed by $($signature.PublicKey)"

        $fixtures = Get-DeclaredFixtures -Root $Root
        $work = Join-Path ([IO.Path]::GetTempPath()) ('hushtumblr-receipt-' + [guid]::NewGuid().ToString('N'))
        try {
            # Every fixture is patched again here. A kept gate run is a record and an APK any program
            # of this user could have written together, so it can't show this bundle made the APK.
            Invoke-ReleaseNative 'The release receipt' {
                & (Join-Path $Root 'scripts/build-release-receipt.ps1') -Root $Root -Fixture $fixtures -WorkDir $work `
                    -Bundle $bundle -Sbom $sbom
            }
        } finally {
            if (Test-Path -LiteralPath $work) { Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue }
        }
        $receiptPath = Join-Path $Root "release-receipt-$Version.json"
        $receipt = Get-Content -LiteralPath $receiptPath -Raw | ConvertFrom-Json
        if ([string]$receipt.release.commit -cne $commit) { throw "The receipt names $($receipt.release.commit), not $commit." }
        if ([string]$receipt.bundle.sha256 -ne (Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash) {
            throw 'The receipt describes another bundle than the one just built.'
        }

        if (Test-Path -LiteralPath $assets) { Remove-Item -LiteralPath $assets -Recurse -Force }
        New-Item -ItemType Directory -Force -Path $assets | Out-Null
        Copy-Item -LiteralPath $bundle, $sbom, $receiptPath -Destination $assets
        $names = Get-ReleaseUploadNames $Version
        & (Join-Path $Root 'scripts/sign-release-checksums.ps1') -AssetDirectory $assets -AssetNames $names `
            -GpgHome $signing.GpgHome -SigningFingerprint $signing.Fingerprint -TrustedPublicKeyPath $signing.PublicKey -Gpg $Gpg
        $built = Test-ReleaseAssets -Root $Root -Version $Version -Commit $commit -TrustedPublicKeyPath $signing.PublicKey `
            -TrustedFingerprint $signing.Fingerprint -Gpg $Gpg
        if ($built -ne $true) { throw "The assets just signed don't verify: $built." }
        foreach ($name in $names) {
            Write-ReleaseStep ('{0}  {1}' -f (Get-FileHash -LiteralPath (Join-Path $assets $name) -Algorithm SHA256).Hash.ToLowerInvariant(), $name)
        }
        Write-ReleaseStep "assets signed in $assets. Write the notes intro, tail and Manager summary, then run -Stage publish."
    }

    'publish' {
        $publish = @{
            Version = $Version; Root = $Root; Intro = $Intro; Tail = $Tail; Summary = $Summary
            TrustedFingerprint = $SigningFingerprint; TrustedPublicKeyPath = $TrustedPublicKeyPath; Gpg = $Gpg
            Walk = $Walk; Repository = $Repository
        }
        & (Join-Path $PSScriptRoot 'publish-release.ps1') @publish
    }
}
