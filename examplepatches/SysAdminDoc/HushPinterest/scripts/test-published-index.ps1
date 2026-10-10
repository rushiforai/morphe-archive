<# Offline contracts for verify-published-index.ps1, from recorded GitHub answers and a scratch repository. #>
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'verify-published-index.ps1')

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

# The missing-head probe leaves git's failure behind, and the suite that runs this reads the exit code.
$global:LASTEXITCODE = 0
Write-Host '[scripts] published index contracts passed'
