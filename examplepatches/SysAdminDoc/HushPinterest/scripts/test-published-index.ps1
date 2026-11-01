<# Offline contracts for verify-published-index.ps1, from recorded GitHub answers and a scratch repository. #>
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'verify-published-index.ps1')
. (Join-Path $PSScriptRoot 'walk-receipt.ps1')

function Assert-IndexContract([bool]$Condition, [string]$Message) {
    if (-not $Condition) { throw $Message }
}
function New-RecordedRelease([string]$Tag, [string[]]$AssetNames) {
    return [pscustomobject]@{
        tag_name = $Tag
        assets = @($AssetNames | ForEach-Object {
            [pscustomobject]@{
                name = $_
                browser_download_url = "https://github.com/SysAdminDoc/HushPinterest/releases/download/$Tag/$_"
            }
        })
    }
}
function New-RecordedIndex([string]$Version) {
    return [pscustomobject]@{
        version = $Version
        download_url = "https://github.com/SysAdminDoc/HushPinterest/releases/download/v$Version/patches-$Version.mpp"
    }
}
function Get-ReleaseAssetNames([string]$Version) {
    return @("patches-$Version.mpp", "patches-$Version.cdx.json", "release-receipt-$Version.json",
        'SHA256SUMS.txt', 'SHA256SUMS.txt.asc')
}

$release = New-RecordedRelease 'v0.0.5' (Get-ReleaseAssetNames '0.0.5')
$agreeing = @(Get-PublishedIndexProblems -Release $release -Index (New-RecordedIndex '0.0.5'))
Assert-IndexContract ($agreeing.Count -eq 0) "An index that names the latest release and its bundle was refused: $($agreeing -join ' | ')"

# 2026-10-07: v0.0.5 was on GitHub while main still served the 0.0.4 index, so Manager offered nothing (#3).
$lagging = @(Get-PublishedIndexProblems -Release $release -Index (New-RecordedIndex '0.0.4'))
Assert-IndexContract ($lagging.Count -eq 1 -and $lagging[0] -like '*names `[0.0.4`]*latest release is v0.0.5*') `
    "An index left on 0.0.4 after v0.0.5 was published read as: $($lagging -join ' | ')"

# An index pushed ahead of its release names a bundle nobody can download yet.
$ahead = @(Get-PublishedIndexProblems -Release $release -Index (New-RecordedIndex '0.0.6'))
Assert-IndexContract ($ahead.Count -eq 1 -and $ahead[0] -like '*names `[0.0.6`]*') `
    "An index ahead of the latest release read as: $($ahead -join ' | ')"

# Matching versions can still point Manager somewhere else.
$elsewhere = New-RecordedIndex '0.0.5'
$elsewhere.download_url = 'https://github.com/SysAdminDoc/HushPinterest/releases/download/v0.0.4/patches-0.0.4.mpp'
$moved = @(Get-PublishedIndexProblems -Release $release -Index $elsewhere)
Assert-IndexContract ($moved.Count -eq 1 -and $moved[0] -like '*downloads `[*v0.0.4/patches-0.0.4.mpp`]*') `
    "An index downloading another release's bundle read as: $($moved -join ' | ')"
$elsewhere.download_url = $elsewhere.download_url -replace 'patches-0\.0\.4', 'PATCHES-0.0.5' -replace 'v0\.0\.4', 'v0.0.5'
Assert-IndexContract (@(Get-PublishedIndexProblems -Release $release -Index $elsewhere).Count -eq 1) `
    'A download address that differs from the asset only by case was accepted.'

$bare = New-RecordedRelease 'v0.0.5' @('patches-0.0.5.cdx.json', 'release-receipt-0.0.5.json')
$noBundle = @(Get-PublishedIndexProblems -Release $bare -Index (New-RecordedIndex '0.0.5'))
Assert-IndexContract ($noBundle.Count -eq 1 -and $noBundle[0] -like '*has no patches-0.0.5.mpp asset*') `
    "A release without its bundle read as: $($noBundle -join ' | ')"

$untagged = @(Get-PublishedIndexProblems -Release (New-RecordedRelease '0.0.5' (Get-ReleaseAssetNames '0.0.5')) `
    -Index (New-RecordedIndex '0.0.5'))
Assert-IndexContract ($untagged.Count -eq 1 -and $untagged[0] -like "*tag ``[0.0.5``] isn't vX.Y.Z*") `
    "A tag without its v read as: $($untagged -join ' | ')"

foreach ($case in @(
        @{ Url = 'https://github.com/SysAdminDoc/HushPinterest.git'; Slug = 'SysAdminDoc/HushPinterest' },
        @{ Url = 'https://github.com/SysAdminDoc/HushPinterest'; Slug = 'SysAdminDoc/HushPinterest' },
        @{ Url = 'git@github.com:SysAdminDoc/HushPinterest.git'; Slug = 'SysAdminDoc/HushPinterest' },
        @{ Url = 'ssh://git@github.com/SysAdminDoc/HushPinterest.git'; Slug = 'SysAdminDoc/HushPinterest' },
        @{ Url = 'https://gitlab.com/SysAdminDoc/HushPinterest.git'; Slug = $null },
        @{ Url = ''; Slug = $null })) {
    $slug = Get-GitHubRepositorySlug -RemoteUrl $case.Url
    Assert-IndexContract ($slug -ceq $case.Slug) "Remote [$($case.Url)] read as [$slug], not [$($case.Slug)]."
}

# The unpushed index commit is the thing to name, so it's found in a real history.
$work = Join-Path ([IO.Path]::GetTempPath()) ('hushpinterest-index-contract-' + [guid]::NewGuid().ToString('N'))
[void][IO.Directory]::CreateDirectory($work)
try {
    function Invoke-ContractGit([string[]]$Arguments) {
        # Windows PowerShell 5.1 turns git's stderr into a terminating error under Stop.
        $ErrorActionPreference = 'Continue'
        $output = @(& git -C $work -c user.name=contract -c user.email=contract@invalid -c commit.gpgsign=false @Arguments 2>&1)
        if ($LASTEXITCODE -ne 0) { throw "git $($Arguments -join ' ') failed: $($output -join ' ')" }
        return $output
    }
    Invoke-ContractGit @('init', '--quiet') | Out-Null
    Set-Content -LiteralPath (Join-Path $work 'patches-bundle.json') -Value '{"version":"0.0.4"}' -Encoding ASCII
    Invoke-ContractGit @('add', 'patches-bundle.json') | Out-Null
    Invoke-ContractGit @('commit', '--quiet', '-m', 'release: publish the 0.0.4 index') | Out-Null
    $pushed = [string](Invoke-ContractGit @('rev-parse', 'HEAD'))
    $level = Get-UnpushedIndexCommits -Root $work -RemoteHead $pushed
    Assert-IndexContract ($null -ne $level -and $level.Count -eq 0) `
        'A checkout level with GitHub reported unpushed index commits, or read as an unknown history.'

    Set-Content -LiteralPath (Join-Path $work 'notes.txt') -Value 'unrelated' -Encoding ASCII
    Invoke-ContractGit @('add', 'notes.txt') | Out-Null
    Invoke-ContractGit @('commit', '--quiet', '-m', 'docs: unrelated') | Out-Null
    Set-Content -LiteralPath (Join-Path $work 'patches-bundle.json') -Value '{"version":"0.0.5"}' -Encoding ASCII
    Invoke-ContractGit @('add', 'patches-bundle.json') | Out-Null
    Invoke-ContractGit @('commit', '--quiet', '-m', 'release: publish the 0.0.5 index') | Out-Null
    $unpushed = Get-UnpushedIndexCommits -Root $work -RemoteHead $pushed
    Assert-IndexContract ($null -ne $unpushed -and $unpushed.Count -eq 1 -and
        $unpushed[0] -like '* release: publish the 0.0.5 index') `
        "The unpushed 0.0.5 index commit read as: $(@($unpushed) -join ' | ')"

    $unknown = Get-UnpushedIndexCommits -Root $work -RemoteHead ('0' * 39 + '1')
    Assert-IndexContract ($null -eq $unknown) 'A branch head this checkout lacks read as a known history.'
} finally {
    Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue
}

# Retry the real publisher against a local bare origin. GitHub and the expensive release-facts
# checker are recorded answers; git history, asset hashes, the failed push and the retry are real.
$publishWork = Join-Path ([IO.Path]::GetTempPath()) ('hushpinterest-publish-contract-' + [guid]::NewGuid().ToString('N'))
$publisher = Join-Path $PSScriptRoot 'release/publish-release.ps1'
$savedContract = Get-Variable -Name PublishContract -Scope Global -ErrorAction SilentlyContinue
$global:PublishContract = @{
    Root = Join-Path $publishWork 'checkout'; Origin = Join-Path $publishWork 'origin.git'
    FactsRoot = Join-Path $publishWork 'facts'; FactsScript = Join-Path $PSScriptRoot 'validate-release-facts.ps1'
    Git = (Get-Command git -CommandType Application -TotalCount 1).Source; FailPush = $false; ReleaseExists = $true
}
function Add-PublishEvent([string]$Event) {
    [IO.File]::AppendAllText((Join-Path $global:PublishContract.Root 'build/events.txt'), "$Event`n")
}
function git {
    if ($args -contains 'push') {
        Add-PublishEvent 'push'
        if ($global:PublishContract.FailPush) { $global:LASTEXITCODE = 1; return }
    }
    & $global:PublishContract.Git @args
}
function gh {
    $global:LASTEXITCODE = 0
    if ($args[0] -ceq 'release' -and $args[1] -ceq 'view') {
        Add-PublishEvent 'release-view'
        if (-not $global:PublishContract.ReleaseExists) { $global:LASTEXITCODE = 1; return }
        'false'; '2026-10-11T00:18:19Z'; Get-ReleaseAssetNames '0.0.7'
    } elseif ($args[0] -ceq 'release' -and $args[1] -ceq 'download') {
        Add-PublishEvent 'download'
        $destination = $args[[Array]::IndexOf($args, '-D') + 1]
        [void][IO.Directory]::CreateDirectory($destination)
        Get-ChildItem -LiteralPath (Join-Path $global:PublishContract.Root 'build/hosted') -File |
            Copy-Item -Destination $destination
    } else {
        throw "A recovery attempted an unexpected GitHub operation: $($args -join ' ')"
    }
}
function Set-PublishFile([string]$Name, [string]$Text) {
    $path = Join-Path $global:PublishContract.Root $Name
    [void][IO.Directory]::CreateDirectory((Split-Path -Parent $path))
    [IO.File]::WriteAllText($path, $Text, (New-Object Text.UTF8Encoding $false))
}
function Invoke-PublishGit([string[]]$Arguments, [switch]$Bare) {
    # Windows PowerShell 5.1 turns successful native stderr (including autocrlf warnings) into an error under Stop.
    $ErrorActionPreference = 'Continue'
    $target = if ($Bare) { $global:PublishContract.Origin } else { $global:PublishContract.Root }
    $output = @(& $global:PublishContract.Git -C $target -c user.name=contract -c user.email=contract@invalid `
        -c commit.gpgsign=false @Arguments 2>&1)
    if ($LASTEXITCODE -ne 0) { throw "git $($Arguments -join ' ') failed in the publication fixture: $($output -join ' ')" }
    return ($output -join "`n").Trim()
}
function Save-PublishCommit([string]$Subject) {
    Invoke-PublishGit @('add', '--all') | Out-Null
    Invoke-PublishGit @('commit', '--quiet', '-m', $Subject) | Out-Null
    return Invoke-PublishGit @('rev-parse', 'HEAD')
}
function Invoke-PublishCase([string]$Walk = (Join-Path $global:PublishContract.Root 'build/walk-receipt.json')) {
    Set-PublishFile 'build/events.txt' ''
    $problem = $null
    try {
        & $publisher -Root $global:PublishContract.Root -Version '0.0.7' -Walk $Walk `
            -TrustedFingerprint ('A' * 40) -TrustedPublicKeyPath (Join-Path $global:PublishContract.Root 'build/pinned-key.asc')
    } catch { $problem = $_.Exception.Message }
    return [pscustomobject]@{ Problem = $problem; Events = @(Get-Content -LiteralPath (Join-Path $global:PublishContract.Root 'build/events.txt')) }
}
function Assert-PublishRefused($Result, [string]$Pattern) {
    Assert-IndexContract ($Result.Problem -like $Pattern) "Expected recovery refusal [$Pattern], got [$($Result.Problem)]."
    Assert-IndexContract (@($Result.Events | Where-Object { $_ -eq 'push' -or $_ -eq 'verify-index' }).Count -eq 0) `
        "An invalid recovery reached a push or final verification: $($Result.Events -join ', ')."
}
try {
    [void][IO.Directory]::CreateDirectory($global:PublishContract.Root)
    [void][IO.Directory]::CreateDirectory($global:PublishContract.Origin)
    Invoke-PublishGit @('init', '--quiet') | Out-Null
    Invoke-PublishGit @('symbolic-ref', 'HEAD', 'refs/heads/main') | Out-Null
    Invoke-PublishGit @('config', '--local', 'core.autocrlf', 'true') | Out-Null
    Invoke-PublishGit @('init', '--bare', '--quiet') -Bare | Out-Null
    Invoke-PublishGit @('remote', 'add', 'origin', $global:PublishContract.Origin) | Out-Null
    foreach ($name in @('common.ps1', 'patch-target.ps1', 'walk-receipt.ps1', 'release/release-common.ps1', 'release/publish-release.ps1', 'release/release.ps1')) {
        Set-PublishFile "scripts/$name" ([IO.File]::ReadAllText((Join-Path $PSScriptRoot $name)))
    }
    $publisher = Join-Path $global:PublishContract.Root 'scripts/release/publish-release.ps1'
    Set-PublishFile '.gitignore' "build/`nrelease-receipt-*.json`n"
    Set-PublishFile 'gradle.properties' "version = 0.0.6`n"
    $publishCatalog = Get-Content -LiteralPath (Join-Path (Split-Path -Parent $PSScriptRoot) 'patches-list.json') -Raw | ConvertFrom-Json
    $publishCatalog.version = 'v0.0.6'
    Set-PublishFile 'patches-list.json' ($publishCatalog | ConvertTo-Json -Depth 20)
    Set-PublishFile 'patches-bundle.json' '{"version":"0.0.6"}'
    Set-PublishFile 'README.md' "The latest release is v0.0.6.`n"
    Set-PublishFile '.github/ISSUE_TEMPLATE/bug_report.yml' "version: 0.0.6`n"
    Set-PublishFile 'extensions/source.txt' 'the prepared bundle source'
    Set-PublishFile 'scripts/test-script-contracts.ps1' '# the broken release check'
    # As release_text.py cuts it: the Unreleased heading goes with its notes.
    Set-PublishFile 'CHANGELOG.md' "# Changelog`n`n## 0.0.7 (2026-10-10)`n`n* **Tooling:** Original release notes.`n"
    Set-PublishFile 'scripts/verify-release-checksums.ps1' @'
param($AssetDirectory, $ChecksumsPath, $SignaturePath, $TrustedPublicKeyPath, $TrustedFingerprint, $ExpectedAssetNames, $Gpg)
if ((Get-Content -LiteralPath $SignaturePath -Raw) -cne 'recorded signature') { throw 'The recorded signature changed.' }
$sums = Get-Content -LiteralPath $ChecksumsPath
foreach ($name in $ExpectedAssetNames) {
    $wanted = (Get-FileHash -LiteralPath (Join-Path $AssetDirectory $name) -Algorithm SHA256).Hash + '  ' + $name
    if ($sums -cnotcontains $wanted) { throw "The recorded signed checksum doesn't match $name." }
}
'@
    Set-PublishFile 'scripts/validate-release-facts.ps1' @'
param($Root, [switch]$VerifyPublishedAsset, [switch]$SkipDescriptionTestCount, [switch]$SkipTestResults,
    $ArtifactPath, $TrustedPublicKeyPath, $TrustedFingerprint)
if (-not $VerifyPublishedAsset -or -not (Test-Path -LiteralPath $ArtifactPath)) { throw 'The hosted-asset check was omitted.' }
# Only hosted I/O is recorded. The real check reads the caller's switches and the real release
# metadata in an isolated tree, so missing or focused XML still exercises production behavior.
& $global:PublishContract.FactsScript -Root $global:PublishContract.FactsRoot -SkipUrlCheck `
    -SkipDescriptionTestCount:$SkipDescriptionTestCount -SkipTestResults:$SkipTestResults 6> $null
Add-PublishEvent 'facts'
'@
    Set-PublishFile 'scripts/verify-published-index.ps1' @'
param($Repository, $Root)
$index = (& $global:PublishContract.Git -C $global:PublishContract.Origin show main:patches-bundle.json) | ConvertFrom-Json
if ($LASTEXITCODE -ne 0 -or $index.version -cne '0.0.7') { throw 'The served index is still behind the release.' }
Add-PublishEvent 'verify-index'
'@
    $previous = Save-PublishCommit 'chore: the previous release'
    Set-PublishFile 'gradle.properties' "version = 0.0.7`n"
    $publishCatalog.version = 'v0.0.7'
    Set-PublishFile 'patches-list.json' ($publishCatalog | ConvertTo-Json -Depth 20)
    $prepared = Save-PublishCommit 'release: prepare 0.0.7'
    Invoke-PublishGit @('tag', 'v0.0.7', $prepared) | Out-Null
    Invoke-PublishGit @('push', '--quiet', 'origin', 'HEAD:refs/heads/main', 'refs/tags/v0.0.7') | Out-Null
    Set-PublishFile '.git/hooks/pre-push' "#!/bin/sh`n# hushpinterest-pre-push`nexit 0`n"
    Set-PublishFile 'patches-bundle.json' '{"version":"0.0.7","download_url":"https://github.com/SysAdminDoc/HushPinterest/releases/download/v0.0.7/patches-0.0.7.mpp"}'
    Set-PublishFile 'README.md' "The latest release is v0.0.7.`n"
    Set-PublishFile '.github/ISSUE_TEMPLATE/bug_report.yml' "version: 0.0.7`n"
    $indexed = Save-PublishCommit 'release: publish the 0.0.7 index to Morphe Manager'
    Set-PublishFile 'build/pinned-key.asc' 'recorded pinned key'
    $assets = Join-Path $global:PublishContract.Root 'build/release-assets/0.0.7'
    Set-PublishFile 'build/release-assets/0.0.7/patches-0.0.7.mpp' 'the original signed bundle'
    Set-PublishFile 'build/release-assets/0.0.7/patches-0.0.7.cdx.json' '{}'
    # The whole-app walk of that bundle, written the way the walk writes it. -Change bends one field.
    $walkPath = Join-Path $global:PublishContract.Root 'build/walk-receipt.json'
    function Write-PublishWalk([hashtable]$Change = @{}) {
        $build = [ordered]@{
            schema=1; bundleSha256=(Get-FileHash -LiteralPath (Join-Path $assets 'patches-0.0.7.mpp')).Hash.ToLowerInvariant()
            fixtureSha256='f' * 64
            catalogSha256=(Get-FileHash -LiteralPath (Join-Path $global:PublishContract.Root 'patches-list.json')).Hash.ToLowerInvariant()
            packageName='com.pinterest'; appVersion='14.42.0'; appVersionCode='14428010'
            selectedPatches=@($publishCatalog.patches[0].name); signedApkSha256='4' * 64
            completed='2026-10-21T15:59:00Z'
        }
        $walk = New-WalkReceipt -Result PASS -Full $true -Serial 'TESTPHONE01' -Device 'SM-S908U1' -AppVersion '14.42.0' `
            -AppVersionCode '14428010' -Build $build `
            -BundleSha256 (Get-FileHash -LiteralPath (Join-Path $assets 'patches-0.0.7.mpp')).Hash -InstalledApkSha256 ('4' * 64) `
            -Started '2026-10-21T16:00:00Z' -Finished '2026-10-21T16:30:00Z' -Screens 40 -Crashes 0
        foreach ($key in $Change.Keys) { $walk[$key] = $Change[$key] }
        Set-PublishFile 'build/walk-receipt.json' ($walk | ConvertTo-Json -Depth 8)
    }
    Write-PublishWalk
    $receipt = @{ release = @{ version = '0.0.7'; tag = 'v0.0.7'; commit = $prepared }
        bundle = @{ file = 'patches-0.0.7.mpp'; sha256 = (Get-FileHash -LiteralPath (Join-Path $assets 'patches-0.0.7.mpp')).Hash } }
    $receiptText = $receipt | ConvertTo-Json -Depth 4
    Set-PublishFile 'build/release-assets/0.0.7/release-receipt-0.0.7.json' $receiptText
    $sums = @(Get-ReleaseAssetNames '0.0.7' | Select-Object -First 3 | ForEach-Object {
        (Get-FileHash -LiteralPath (Join-Path $assets $_)).Hash + '  ' + $_
    }) -join "`n"
    Set-PublishFile 'build/release-assets/0.0.7/SHA256SUMS.txt' $sums
    Set-PublishFile 'build/release-assets/0.0.7/SHA256SUMS.txt.asc' 'recorded signature'
    [void][IO.Directory]::CreateDirectory((Join-Path $global:PublishContract.Root 'build/hosted'))
    Get-ChildItem -LiteralPath $assets -File | Copy-Item -Destination (Join-Path $global:PublishContract.Root 'build/hosted')

    # -Stage build after the upload, in a checkout that lost build/release-assets: a rebuild would sign
    # new bytes, so the signed assets come back from GitHub and are checked like local ones.
    $stager = Join-Path $global:PublishContract.Root 'scripts/release/release.ps1'
    function Invoke-BuildStageCase {
        Set-PublishFile 'build/events.txt' ''
        $problem = $null
        try {
            & $stager -Stage build -Version '0.0.7' -Root $global:PublishContract.Root -GpgHome (Join-Path $global:PublishContract.Root 'build') `
                -SigningFingerprint ('A' * 40) -TrustedPublicKeyPath (Join-Path $global:PublishContract.Root 'build/pinned-key.asc') 6> $null
        } catch { $problem = $_.Exception.Message }
        return [pscustomobject]@{ Problem = $problem; Events = @(Get-Content -LiteralPath (Join-Path $global:PublishContract.Root 'build/events.txt')) }
    }
    Invoke-PublishGit @('checkout', '--quiet', '--detach', $prepared) | Out-Null
    Set-PublishFile 'build/release-stages/0.0.7/gate.json' ('{"stage":"gate","version":"0.0.7","commit":"' + $prepared + '"}')
    $kept = "$assets-kept"
    Move-Item -LiteralPath $assets -Destination $kept
    $restored = Invoke-BuildStageCase
    Assert-IndexContract (-not $restored.Problem -and ($restored.Events -join ',') -ceq 'release-view,download') `
        "-Stage build didn't take the published assets back: $($restored.Problem); $($restored.Events -join ',')."
    foreach ($name in Get-ReleaseAssetNames '0.0.7') {
        Assert-IndexContract ((Get-FileHash -LiteralPath (Join-Path $assets $name)).Hash -ceq (Get-FileHash -LiteralPath (Join-Path $kept $name)).Hash) `
            "-Stage build restored a $name that isn't the published one."
    }
    Remove-Item -LiteralPath (Join-Path $assets 'SHA256SUMS.txt.asc')
    $partial = Invoke-BuildStageCase
    Assert-IndexContract ($partial.Problem -like "*already on GitHub, and the assets here don't match it*" -and
        ($partial.Events -join ',') -ceq 'release-view') "-Stage build replaced assets it had only part of: $($partial.Problem); $($partial.Events -join ',')."
    Remove-Item -LiteralPath $assets -Recurse -Force
    Set-PublishFile 'build/hosted/SHA256SUMS.txt.asc' 'another signature'
    $forged = Invoke-BuildStageCase
    Assert-IndexContract ($forged.Problem -like "*assets on GitHub don't verify*" -and -not (Test-Path -LiteralPath $assets)) `
        "-Stage build kept published assets that don't verify: $($forged.Problem)."
    Set-PublishFile 'build/hosted/SHA256SUMS.txt.asc' 'recorded signature'
    # gh only fails when no pattern matches, and a broken receipt throws inside the check: neither
    # may leave part of the assets behind, which every later run would refuse.
    $hostedSbom = Join-Path $global:PublishContract.Root 'build/hosted/patches-0.0.7.cdx.json'
    Move-Item -LiteralPath $hostedSbom -Destination "$kept.cdx.json"
    $short = Invoke-BuildStageCase
    Assert-IndexContract ($short.Problem -like '*has no patches-0.0.7.cdx.json*' -and -not (Test-Path -LiteralPath $assets)) `
        "-Stage build took a release missing an asset: $($short.Problem)."
    Move-Item -LiteralPath "$kept.cdx.json" -Destination $hostedSbom
    Set-PublishFile 'build/hosted/release-receipt-0.0.7.json' 'not a receipt'
    $broken = Invoke-BuildStageCase
    Assert-IndexContract ($broken.Problem -and -not (Test-Path -LiteralPath $assets)) `
        "-Stage build left assets behind after a receipt it couldn't read: $($broken.Problem)."
    Set-PublishFile 'build/hosted/release-receipt-0.0.7.json' $receiptText
    Move-Item -LiteralPath $kept -Destination $assets
    Remove-Item -LiteralPath (Join-Path $global:PublishContract.Root 'build/release-stages') -Recurse -Force
    Invoke-PublishGit @('checkout', '--quiet', 'main') | Out-Null

    $repositoryRoot = Split-Path -Parent $PSScriptRoot
    foreach ($name in @('patches-list.json', 'patches-bundle.json', 'gradle.properties', 'README.md', 'CHANGELOG.md',
            'gradle/libs.versions.toml', '.github/ISSUE_TEMPLATE/bug_report.yml')) {
        $path = Join-Path $global:PublishContract.FactsRoot $name
        [void][IO.Directory]::CreateDirectory((Split-Path -Parent $path))
        Copy-Item -LiteralPath (Join-Path $repositoryRoot $name) -Destination $path
    }
    # During a release hold main can list patches the published description and README's latest
    # release sentence don't count yet. The fixture publishes these files as a release, so both
    # count what its list holds.
    $listed = @((Get-Content -LiteralPath (Join-Path $global:PublishContract.FactsRoot 'patches-list.json') -Raw |
        ConvertFrom-Json).patches).Count
    $factsBundle = Join-Path $global:PublishContract.FactsRoot 'patches-bundle.json'
    [IO.File]::WriteAllText($factsBundle, ([IO.File]::ReadAllText($factsBundle) -replace '(?<![\d.])\d+ patches\b', "$listed patches"))
    $factsReadme = Join-Path $global:PublishContract.FactsRoot 'README.md'
    [IO.File]::WriteAllText($factsReadme, ([IO.File]::ReadAllText($factsReadme) -replace
        '(?i)(\blatest (?:published )?release is [^\r\n]*?, with )\d+( patches)', "`${1}$listed`$2"))
    # Between a release's prepare commit and its publish, the source names the new version while the
    # index, README's latest release sentence and the bug form still name the last one. Publishing
    # moves all three to the source version, so the fixture does too.
    $sourceVersion = [regex]::Match([IO.File]::ReadAllText((Join-Path $global:PublishContract.FactsRoot 'gradle.properties')),
        '(?m)^version\s*=\s*(\S+)').Groups[1].Value
    $publishedVersion = ([IO.File]::ReadAllText($factsBundle) | ConvertFrom-Json).version
    if ($sourceVersion -and $publishedVersion -and $sourceVersion -ne $publishedVersion) {
        $old = '(?<![\d.])' + [regex]::Escape($publishedVersion) + '(?!\.?\d)'
        [IO.File]::WriteAllText($factsBundle, ([IO.File]::ReadAllText($factsBundle) -replace $old, $sourceVersion))
        [IO.File]::WriteAllText($factsReadme, ([regex]::Replace([IO.File]::ReadAllText($factsReadme),
            '(?i)\blatest (?:published )?release is [^\r\n]*?, with \d+ patches', { param($m) $m.Value -replace $old, $sourceVersion })))
        $factsForm = Join-Path $global:PublishContract.FactsRoot '.github/ISSUE_TEMPLATE/bug_report.yml'
        [IO.File]::WriteAllText($factsForm, ([IO.File]::ReadAllText($factsForm) -replace
            ('(HushPinterest )' + [regex]::Escape($publishedVersion) + '(?!\.?\d)'), "`${1}$sourceVersion"))
    }
    # A release that moves to a newer Pinterest build also moves the index's build and both of the
    # bug form's build placeholders when it publishes, so the fixture moves them to the catalog's.
    $catalogTarget = @(@((Get-Content -LiteralPath (Join-Path $global:PublishContract.FactsRoot 'patches-list.json') -Raw |
        ConvertFrom-Json).patches)[0].compatibility[0].targets)[0]
    $publishedTarget = [regex]::Match(([IO.File]::ReadAllText($factsBundle) | ConvertFrom-Json).description,
        'Pinterest (\d+(?:\.\d+)+)').Groups[1].Value
    if ($catalogTarget -and $publishedTarget -and $catalogTarget.version -ne $publishedTarget) {
        $oldTarget = 'Pinterest ' + [regex]::Escape($publishedTarget) + '(?!\.?\d)'
        [IO.File]::WriteAllText($factsBundle, ([IO.File]::ReadAllText($factsBundle) -replace $oldTarget, "Pinterest $($catalogTarget.version)"))
        $targetCode = @($catalogTarget.versionCodes.PSObject.Properties.Value)[0]
        $factsForm = Join-Path $global:PublishContract.FactsRoot '.github/ISSUE_TEMPLATE/bug_report.yml'
        [IO.File]::WriteAllText($factsForm, (([IO.File]::ReadAllText($factsForm) -replace $oldTarget, "Pinterest $($catalogTarget.version)") -replace
            ('(APKMirror [^,\r\n]+, )' + [regex]::Escape($publishedTarget) + ' \(\d+\)'), "`${1}$($catalogTarget.version) ($targetCode)"))
    }
    function Assert-RealFactsRefused([string]$Pattern, [switch]$SkipCount) {
        $problem = $null
        try {
            & $global:PublishContract.FactsScript -Root $global:PublishContract.FactsRoot -SkipUrlCheck `
                -SkipDescriptionTestCount:$SkipCount 6> $null
        } catch { $problem = $_.Exception.Message }
        Assert-IndexContract ($problem -like $Pattern) "The real release-facts check expected [$Pattern], got [$problem]."
    }
    Assert-RealFactsRefused '*No runtime test results found*'

    # No walk, or one that doesn't back this bundle, stops publish before it asks GitHub anything.
    function Assert-WalkRefused($Result, [string]$Pattern) {
        Assert-IndexContract ($Result.Problem -like $Pattern -and @($Result.Events | Where-Object { $_ }).Count -eq 0) `
            "Expected the walk refusal [$Pattern] before any GitHub step, got [$($Result.Problem)]; $($Result.Events -join ',')."
    }
    Assert-WalkRefused (Invoke-PublishCase -Walk '') '*-Walk names the walk-receipt.json*'
    Assert-WalkRefused (Invoke-PublishCase -Walk (Join-Path $global:PublishContract.Root 'build/no-walk.json')) "*there's no walk receipt at*"
    foreach ($badWalk in @(
            @(@{ result = 'FAIL' }, '*the walk ended FAIL, not PASS*'),
            @(@{ result = 'PARTIAL'; full = $false }, '*the walk ended PARTIAL, not PASS*'),
            @(@{ full = $false }, '*was not the whole app*'),
            @(@{ screens = 0 }, "*doesn't say it opened any screen*"),
            @(@{ crashes = 1 }, '*recorded a Pinterest crash*'),
            @(@{ device = 'Pixel 9' }, "*Pixel 9 isn't one of the release walk phones*"),
            @(@{ device = 'Pixel 9'; emulator = $true }, "*Pixel 9 isn't one of the release walk phones*"),
            @(@{ bundleSha256 = ('5' * 64) }, '*patched with bundle*and this one is*'),
            @(@{ schema = 1 }, "*isn't schema 2*"),
            @(@{ build = $null }, '*no versioned patch/build evidence*'),
            @(@{ installedApkSha256 = 'not-an-apk-hash' }, '*malformed build/install hash*'),
            @(@{ installedApkSha256 = ('6' * 64) }, '*installed APK does not match*'),
            @(@{ appVersion = '14.40.0' }, '*app identity does not match*'),
            @(@{ started = 'invalid' }, '*invalid started time*'),
            @(@{ problems = @('wrong destination') }, '*walk has problems*'))) {
        Write-PublishWalk $badWalk[0]
        Assert-WalkRefused (Invoke-PublishCase) $badWalk[1]
    }
    Set-PublishFile 'build/walk-receipt.json' 'not json'
    Assert-WalkRefused (Invoke-PublishCase) "*walk receipt doesn't read as JSON*"
    # An emulator walks for a release as well as either phone.
    Write-PublishWalk @{ serial = 'emulator-5554'; device = 'sdk_gphone64_x86_64'; emulator = $true }

    $global:PublishContract.FailPush = $true
    $failed = Invoke-PublishCase
    Assert-IndexContract ($failed.Problem -like '*The push*failed*' -and
        @($failed.Events | Where-Object { $_ -eq 'push' }).Count -eq 1 -and
        @($failed.Events | Where-Object { $_ -eq 'verify-index' }).Count -eq 0) `
        "The uploaded release/index fixture didn't stop at its failed push: $($failed.Problem)."
    $global:PublishContract.FailPush = $false
    Set-PublishFile 'scripts/test-script-contracts.ps1' '# the corrected release check'
    Save-PublishCommit 'test(scripts): repair the release check' | Out-Null
    Set-PublishFile 'CHANGELOG.md' "# Changelog`n`n## Unreleased`n`n* **Tooling:** The release check was corrected.`n`n## 0.0.7 (2026-10-10)`n`n* **Tooling:** Original release notes.`n"
    $corrected = Save-PublishCommit 'docs(changelog): record the check repair'
    $retried = Invoke-PublishCase
    Assert-IndexContract (-not $retried.Problem -and
        ($retried.Events -join ',') -ceq 'release-view,download,facts,push,verify-index') `
        "Recovery didn't resume only the missing push and verification: $($retried.Problem); $($retried.Events -join ',')."
    Assert-IndexContract ((Invoke-PublishGit @('rev-parse', 'refs/heads/main') -Bare) -ceq $corrected) `
        'The recovery did not push the corrective descendant.'
    $focusedFolder = Join-Path $global:PublishContract.FactsRoot 'extensions/pinterest/build/test-results/testDebugUnitTest'
    [void][IO.Directory]::CreateDirectory($focusedFolder)
    $focusedPath = Join-Path $focusedFolder 'TEST-RuntimeTest.xml'
    $focusedXml = '<testsuite failures="0" errors="0" skipped="0">' +
        ((1..18 | ForEach-Object { '<testcase name="focused' + $_ + '" />' }) -join '') + '</testsuite>'
    [IO.File]::WriteAllText($focusedPath, $focusedXml)
    Assert-RealFactsRefused '*bundle description test count*'
    $missingClass = Join-Path $global:PublishContract.FactsRoot 'extensions/pinterest/src/test/MissingRuntimeTest.java'
    [void][IO.Directory]::CreateDirectory((Split-Path -Parent $missingClass))
    [IO.File]::WriteAllText($missingClass, 'class MissingRuntimeTest {}')
    [IO.File]::WriteAllText($focusedPath, $focusedXml)
    Assert-RealFactsRefused '*Runtime test results are missing*' -SkipCount
    $again = Invoke-PublishCase
    Assert-IndexContract (-not $again.Problem -and ($again.Events -join ',') -ceq 'release-view,download,facts,verify-index') `
        "Completed publication wasn't idempotent: $($again.Problem); $($again.Events -join ',')."
    Invoke-PublishGit @('update-ref', 'refs/heads/main', $indexed) -Bare | Out-Null
    $partway = Invoke-PublishCase
    Assert-IndexContract (-not $partway.Problem -and
        ($partway.Events -join ',') -ceq 'release-view,download,facts,push,verify-index') `
        "Recovery refused a remote already at the unchanged index: $($partway.Problem)."

    Set-PublishFile 'patches-bundle.json' '{"version":"0.0.7","download_url":"https://example.invalid/changed.mpp"}'
    Save-PublishCommit 'test: change the index address' | Out-Null
    Assert-PublishRefused (Invoke-PublishCase) '*changed source or index files: patches-bundle.json*'
    Invoke-PublishGit @('reset', '--hard', '--quiet', $corrected) | Out-Null
    Set-PublishFile 'extensions/source.txt' 'another bundle source'
    Save-PublishCommit 'test: change the bundle source' | Out-Null
    Assert-PublishRefused (Invoke-PublishCase) '*changed source or index files: extensions/source.txt*'
    Invoke-PublishGit @('reset', '--hard', '--quiet', $corrected) | Out-Null
    Set-PublishFile 'CHANGELOG.md' "# Changelog`n`n## 0.0.7 (2026-10-10)`n`n* **Tooling:** Changed published notes.`n"
    Save-PublishCommit 'test: rewrite the released notes' | Out-Null
    Assert-PublishRefused (Invoke-PublishCase) '*already released CHANGELOG sections*'
    Invoke-PublishGit @('reset', '--hard', '--quiet', $corrected) | Out-Null
    $tree = Invoke-PublishGit @('rev-parse', "$corrected`^{tree}")
    $merged = Invoke-PublishGit @('commit-tree', $tree, '-p', $corrected, '-p', $prepared, '-m', 'test: a merged recovery history')
    Invoke-PublishGit @('reset', '--hard', '--quiet', $merged) | Out-Null
    Assert-PublishRefused (Invoke-PublishCase) '*merged or unrelated history after the index*'
    Invoke-PublishGit @('reset', '--hard', '--quiet', $corrected) | Out-Null

    Set-PublishFile 'build/release-assets/0.0.7/patches-0.0.7.mpp' 'changed local bytes'
    Assert-PublishRefused (Invoke-PublishCase) "*receipt's bundle name or hash doesn't match*"
    Set-PublishFile 'build/release-assets/0.0.7/patches-0.0.7.mpp' 'the original signed bundle'
    Set-PublishFile 'build/release-assets/0.0.7/patches-0.0.7.cdx.json' 'changed local SBOM bytes'
    Assert-PublishRefused (Invoke-PublishCase) "*recorded signed checksum doesn't match patches-0.0.7.cdx.json*"
    Set-PublishFile 'build/release-assets/0.0.7/patches-0.0.7.cdx.json' '{}'
    $receipt.release.tag = 'v0.0.8'
    Set-PublishFile 'build/release-assets/0.0.7/release-receipt-0.0.7.json' ($receipt | ConvertTo-Json -Depth 4)
    Assert-PublishRefused (Invoke-PublishCase) "*receipt there doesn't name release v0.0.7*"
    Set-PublishFile 'build/release-assets/0.0.7/release-receipt-0.0.7.json' $receiptText
    Set-PublishFile 'build/hosted/patches-0.0.7.mpp' 'changed hosted bytes'
    Assert-PublishRefused (Invoke-PublishCase) "*hosted patches-0.0.7.mpp isn't the one built here*"
    Set-PublishFile 'build/hosted/patches-0.0.7.mpp' 'the original signed bundle'
    Invoke-PublishGit @('update-ref', 'refs/tags/v0.0.7', $indexed) -Bare | Out-Null
    Invoke-PublishGit @('tag', '-d', 'v0.0.7') | Out-Null
    Assert-PublishRefused (Invoke-PublishCase) "*GitHub's v0.0.7 points at*not the prepare commit*"
    Invoke-PublishGit @('update-ref', 'refs/tags/v0.0.7', $prepared) -Bare | Out-Null
    Invoke-PublishGit @('tag', '-f', 'v0.0.7', $prepared) | Out-Null
    Invoke-PublishGit @('update-ref', 'refs/heads/main', $previous) -Bare | Out-Null
    Assert-PublishRefused (Invoke-PublishCase) '*outside the prepared release and its publication recovery chain*'
    Invoke-PublishGit @('update-ref', 'refs/heads/main', $corrected) -Bare | Out-Null
    $global:PublishContract.ReleaseExists = $false
    Assert-PublishRefused (Invoke-PublishCase) '*Publication recovery never creates another release*'
    $global:PublishContract.ReleaseExists = $true
    Invoke-PublishGit @('checkout', '--quiet', '--detach', $previous) | Out-Null
    Set-PublishFile 'unrelated.txt' 'an unrelated history'
    Save-PublishCommit 'test: an unrelated history' | Out-Null
    Assert-PublishRefused (Invoke-PublishCase) '*Run release.ps1 -Stage prepare, preflight, gate and build first*'
    Write-Host '[scripts] publication recovery contracts passed'
} finally {
    if ($savedContract) { $global:PublishContract = $savedContract.Value } else { Remove-Variable -Name PublishContract -Scope Global }
    $resolvedWork = [IO.Path]::GetFullPath($publishWork)
    if (-not $resolvedWork.StartsWith([IO.Path]::GetFullPath([IO.Path]::GetTempPath()), [StringComparison]::OrdinalIgnoreCase)) {
        throw "Refusing to remove a publication fixture outside the temporary directory: $resolvedWork"
    }
    if (Test-Path -LiteralPath $resolvedWork) { Remove-Item -LiteralPath $resolvedWork -Recurse -Force }
}

# The missing-head probe leaves git's failure behind, and the suite that runs this reads the exit code.
$global:LASTEXITCODE = 0
Write-Host '[scripts] published index contracts passed'
