<#
.SYNOPSIS
    Publishes a built HushTumblr release and points Morphe Manager at it.

.DESCRIPTION
    The last release stage, which release.ps1 -Stage publish runs. It starts from the pushed
    prepare commit and the assets -Stage build signed. Before anything reaches GitHub, -Walk has
    to name the walk-receipt.json of a whole-app walk of the signed bundle on a release phone or
    an emulator (walk-receipt.ps1). Then it goes in this order:

      1. The notes: every bullet of the released CHANGELOG section, between -Intro and -Tail.
      2. gh release create vX.Y.Z at the prepare commit with the five assets. GitHub's tag is
         fetched and held to that commit, and each hosted asset is downloaded and compared.
      3. The index: patches-bundle.json, the README sentence, the bug form and the GitHub
         description, held to the hosted bundle by validate-release-facts.ps1
         -VerifyPublishedAsset before anything is committed. A failure puts the files back.
         The first release writes patches-bundle.json new. The README sentence ("The latest
         release is [vX.Y.Z](...), with N patches.") and the add-source link have to be in the
         README already: the index rewrites the sentence and the check requires both.
      4. The commit "release: publish the X.Y.Z index to Morphe Manager", pushed right away
         through the pre-push hook. 0.0.5's sat on this machine for most of a day (#3).
      5. verify-published-index.ps1, which asks GitHub what Manager is offered now.

    A step that already happened is checked instead of done again, so a run that stopped part
    way carries on from where it stopped.

.EXAMPLE
    scripts/release/publish-release.ps1 -Version 0.0.7 -Intro intro.txt -Tail tail.txt -Summary summary.txt `
        -TrustedFingerprint <hex> -TrustedPublicKeyPath <key.asc> -Walk <walk folder>/walk-receipt.json
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][ValidatePattern('^\d+\.\d+\.\d+$')][string]$Version,
    [string]$Root,
    # Text files: the notes above and below the CHANGELOG bullets, and Manager's sentence or two.
    [string]$Intro,
    [string]$Tail,
    [string]$Summary,
    # The pinned key the checksums were signed for. The HUSHTUMBLR_RELEASE_* variables stand in.
    [string]$TrustedFingerprint,
    [string]$TrustedPublicKeyPath,
    [string]$Gpg = 'gpg',
    # The walk-receipt.json a whole-app walk of this exact bundle left.
    [string]$Walk,
    [string]$Repository = 'SysAdminDoc/HushTumblr'
)

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'release-common.ps1')
. (Join-Path (Split-Path -Parent $PSScriptRoot) 'walk-receipt.ps1')
$Root = Resolve-ReleaseRoot $Root
Import-ReleaseEnvironment
$tag = "v$Version"
$assets = Join-Path $Root "build/release-assets/$Version"
$uploads = @(Get-ReleaseUploadNames $Version) + @('SHA256SUMS.txt', 'SHA256SUMS.txt.asc')
$indexFiles = @('patches-bundle.json', 'README.md', '.github/ISSUE_TEMPLATE/bug_report.yml')

function Get-PublishedRelease {
    <# What GitHub holds for the tag: draft or not, when it was published and its asset names. $null when there's none. #>
    # No double quote in the filter: Windows PowerShell passes one to a native command unescaped.
    $lines = @(Invoke-ReleaseQuiet {
        & gh release view $tag -R $Repository --json isDraft,publishedAt,assets --jq '(.isDraft | tostring), (.publishedAt | tostring), (.assets[].name)'
    })
    if ($LASTEXITCODE -ne 0 -or $lines.Count -lt 2) { return $null }
    return [pscustomobject]@{
        IsDraft     = $lines[0] -ceq 'true'
        PublishedAt = $(if ($lines[1] -ceq 'null') { '' } else { [string]$lines[1] })
        Assets      = @($lines | Select-Object -Skip 2)
    }
}

Assert-ReleaseClean $Root
$source = Get-PrepareCommit -Root $Root -Version $Version -AllowIndex
if (-not $source) {
    throw ("HEAD is neither '$($script:PrepareSubject -f $Version)' nor its index commit. Run release.ps1 " +
        '-Stage prepare, preflight, gate and build first.')
}
$head = Get-ReleaseGitText -Root $Root -Arguments @('rev-parse', 'HEAD')
$indexed = $head -cne $source
$signing = Get-SigningInputs -Fingerprint $TrustedFingerprint -PublicKey $TrustedPublicKeyPath -NoKeyring
$built = Test-ReleaseAssets -Root $Root -Version $Version -Commit $source -TrustedPublicKeyPath $signing.PublicKey `
    -TrustedFingerprint $signing.Fingerprint -Gpg $Gpg
if ($built -ne $true) { throw "The assets aren't ready: $built. Run release.ps1 -Stage build first." }
# Nothing goes public until the whole app has been walked with this exact bundle.
if (-not $Walk) { throw '-Walk names the walk-receipt.json a whole-app walk of this bundle left on a release phone or an emulator.' }
$walked = Test-WalkReceipt -Path $Walk -BundlePath (Join-Path $assets "patches-$Version.mpp") `
    -CatalogPath (Join-Path $Root 'patches-list.json') -ReleaseReceiptPath (Join-Path $assets "release-receipt-$Version.json")
if (-not $walked.Valid) {
    throw ("The whole-app walk doesn't back patches-$Version.mpp, so nothing was published: $($walked.Reason). " +
        'Patch an APK from this bundle, walk the whole app on a release phone or an emulator, and pass its walk-receipt.json as -Walk.')
}
Write-ReleaseStep "walked on $($walked.Receipt.device): $($walked.Receipt.screens) screens, no crash"
$remote = Get-RemoteMain $Root
if ($remote -cne $source -and $remote -cne $head) {
    throw "origin's main is at $remote, which is neither the prepare commit $source nor HEAD. A release publishes the commit its gate passed."
}

# 1 and 2: the release, made once.
$release = Get-PublishedRelease
if ($release) {
    Write-ReleaseStep "$tag is already on GitHub (published $($release.PublishedAt)), so it's checked, not made again"
} else {
    if (-not $Intro -or -not $Tail) { throw '-Intro and -Tail name the files with the notes above and below the CHANGELOG bullets.' }
    $notes = Join-Path $assets 'notes.txt'
    Invoke-ReleaseText -Root $Root -What 'The release notes' -Arguments @('notes', '--version', $Version, '--intro', $Intro, '--tail', $Tail, '--out', $notes)
    $files = @($uploads | ForEach-Object { Join-Path $assets $_ })
    Write-ReleaseStep "publishing $tag at $source"
    Invoke-ReleaseNative 'gh release create' {
        & gh release create $tag -R $Repository --target $source --title $tag --notes-file $notes @files
    }
    $release = Get-PublishedRelease
    if (-not $release) { throw "gh release create finished, but GitHub doesn't show $tag." }
}
if ($release.IsDraft -or -not $release.PublishedAt) { throw "$tag is a draft on GitHub. Publish it there, or delete it and run this again." }
$hostedNames = @($release.Assets | Sort-Object)
$wantedNames = @($uploads | Sort-Object)
if (($hostedNames -join '|') -cne ($wantedNames -join '|')) {
    throw "$tag holds $($hostedNames -join ', '), not $($wantedNames -join ', ')."
}
Invoke-ReleaseNative 'Fetching the tag' { & git -C $Root fetch --quiet origin "refs/tags/${tag}:refs/tags/$tag" }
$tagged = Get-ReleaseGitText -Root $Root -Arguments @('rev-parse', "$tag^{commit}")
if ($tagged -cne $source) { throw "GitHub's $tag points at $tagged, not the prepare commit $source." }
$check = Join-Path ([IO.Path]::GetTempPath()) ('hushtumblr-published-' + [guid]::NewGuid().ToString('N'))
try {
    Invoke-ReleaseNative 'gh release download' { & gh release download $tag -R $Repository -D $check }
    foreach ($name in $uploads) {
        $local = (Get-FileHash -LiteralPath (Join-Path $assets $name) -Algorithm SHA256).Hash
        $hosted = (Get-FileHash -LiteralPath (Join-Path $check $name) -Algorithm SHA256).Hash
        if ($local -cne $hosted) { throw "The hosted $name isn't the one built here ($hosted, local $local)." }
    }
    Write-ReleaseStep "all $($uploads.Count) hosted assets match the ones built here byte for byte"
} finally {
    if (Test-Path -LiteralPath $check) { Remove-Item -LiteralPath $check -Recurse -Force -ErrorAction SilentlyContinue }
}

# 3: the index, written and checked against the hosted release before it's committed.
if ($indexed) {
    Write-ReleaseStep "HEAD is already the $Version index commit"
} else {
    if (-not $Summary) { throw "-Summary names the file with the release's sentence or two for Morphe Manager." }
    $created = [DateTimeOffset]::Parse($release.PublishedAt, [Globalization.CultureInfo]::InvariantCulture).UtcDateTime.ToString(
        'yyyy-MM-ddTHH:mm:ss', [Globalization.CultureInfo]::InvariantCulture)
    # The release gate wrote these in this checkout, and the index push holds the description to them.
    $runtime = Get-ReleaseTestCount -Root $Root -Folders @('extensions/tumblr/build/test-results/testDebugUnitTest')
    $patch = Get-ReleaseTestCount -Root $Root -Folders @('patches/build/test-results/test', 'patches/build/test-results/fixtureTest')
    # No release before this one: there's no patches-bundle.json to update, so the index writes it.
    $firstIndex = Test-FirstRelease -Root $Root -Except $tag
    # The README's Verify a download example quotes the bundle just matched to the hosted one.
    $bundleHash = (Get-FileHash -LiteralPath (Join-Path $assets "patches-$Version.mpp") -Algorithm SHA256).Hash.ToLowerInvariant()
    $indexArguments = @('index', '--version', $Version, '--created', $created,
        '--summary', $Summary, '--runtime', [string]$runtime, '--patch', [string]$patch, '--sha256', $bundleHash)
    if ($firstIndex) {
        Write-ReleaseStep "nothing was released before $tag, so this writes the first patches-bundle.json"
        $indexArguments += '--first'
    }
    try {
        Invoke-ReleaseText -Root $Root -What 'The index' -Arguments $indexArguments
        $description = [string](Get-Content -LiteralPath (Join-Path $Root 'patches-bundle.json') -Raw | ConvertFrom-Json).description
        $facts = [regex]::Match($description, '^HushTumblr v\d+\.\d+\.\d+: (\d+) patches for Tumblr (\d+(?:\.\d+)+),')
        if (-not $facts.Success) { throw "The new index description doesn't start the way release_text.py writes it: $description" }
        $current = (@(Invoke-ReleaseQuiet { & gh repo view $Repository --json description --jq .description }) -join "`n").Trim()
        if ($LASTEXITCODE -ne 0) { throw "gh couldn't read the description of $Repository." }
        $updated = $current -replace 'HushTumblr v\d+\.\d+\.\d+', "HushTumblr $tag" `
            -replace '(?<![\d.])\d+ patches\b', "$($facts.Groups[1].Value) patches" `
            -replace 'Tumblr \d+(?:\.\d+)+', "Tumblr $($facts.Groups[2].Value)"
        if ($updated -cne $current) {
            Invoke-ReleaseNative 'gh repo edit' { & gh repo edit $Repository --description $updated }
            Write-ReleaseStep "the GitHub description reads: $updated"
        } elseif (-not (Test-RepoDescriptionNamesFacts -Description $current)) {
            Write-ReleaseStep 'the GitHub description names no version, count or build, so it stays as written'
        }
        Copy-Item -LiteralPath (Join-Path $assets "release-receipt-$Version.json") -Destination (Join-Path $Root "release-receipt-$Version.json") -Force
        Invoke-ReleaseNative 'The published release check' {
            & (Join-Path $Root 'scripts/validate-release-facts.ps1') -Root $Root -VerifyPublishedAsset `
                -ArtifactPath (Join-Path $assets "patches-$Version.mpp") -TrustedPublicKeyPath $signing.PublicKey `
                -TrustedFingerprint $signing.Fingerprint
        }
        $changed = @(& git -C $Root status --porcelain --untracked-files=all | ForEach-Object { $_.Substring(3) })
        $unexpected = @($changed | Where-Object { $indexFiles -notcontains $_ })
        if ($unexpected.Count -gt 0) { throw "Writing the index also changed $($unexpected -join ', '), which an index commit doesn't carry." }
        Invoke-ReleaseNative 'git add' { & git -C $Root add -- @indexFiles }
        Invoke-ReleaseNative 'The index commit' { & git -C $Root commit --quiet -m ($script:IndexSubject -f $Version) }
    } catch {
        Write-ReleaseStep 'putting patches-bundle.json, the README and the bug form back'
        & git -C $Root reset --quiet -- @indexFiles
        # The first index has no earlier patches-bundle.json to go back to, and git checkout
        # refuses every path when one of them isn't in HEAD, so the new file is removed instead.
        $restore = @($indexFiles | Where-Object { -not ($firstIndex -and $_ -ceq 'patches-bundle.json') })
        & git -C $Root checkout --quiet HEAD -- @restore
        if ($firstIndex) { Remove-Item -LiteralPath (Join-Path $Root 'patches-bundle.json') -Force -ErrorAction SilentlyContinue }
        throw
    }
    $head = Get-ReleaseGitText -Root $Root -Arguments @('rev-parse', 'HEAD')
    Write-ReleaseStep "committed the index as $head ($runtime runtime tests, $patch patch tests)"
}

# 4: pushed at once. The hook compares the hosted bundle with the one built here byte for byte.
if ((Get-RemoteMain $Root) -cne $head) {
    Write-ReleaseStep "pushing the index commit $head"
    Invoke-ReleasePush -Root $Root -Environment @{
        HUSHTUMBLR_RELEASE_PUBLIC_KEY  = $signing.PublicKey
        HUSHTUMBLR_RELEASE_FINGERPRINT = $signing.Fingerprint
    }
    if ((Get-RemoteMain $Root) -cne $head) { throw "The push finished, but origin's main isn't $head." }
} else {
    Write-ReleaseStep "origin's main is already the index commit $head"
}

# 5: what Manager is offered now, asked of GitHub. Always last.
Invoke-ReleaseNative 'verify-published-index.ps1' {
    & (Join-Path $Root 'scripts/verify-published-index.ps1') -Repository $Repository -Root $Root
}
Write-ReleaseStep "$tag is published and Morphe Manager is offered it"
