<#
.SYNOPSIS
    Check that the patches-bundle.json GitHub serves from main points at the newest release.

.DESCRIPTION
    Morphe Manager hears about a release only through patches-bundle.json on main. 0.0.5 went up
    on GitHub at 1:15 AM on 2026-10-07, but the commit that moved the index to it stayed on this
    machine until 11 PM, so for most of a day Manager kept telling people on 0.0.4 that they were
    up to date (#3). Nothing after gh release create looked at GitHub, and the pre-push gate can't
    see a push that never happens. Run this as the last release step, after the index push:

        ./scripts/verify-published-index.ps1

    Both answers come from GitHub's API, the latest release and the index on the branch, because
    the raw.githubusercontent.com copy Manager fetches can trail a push by a few minutes. It fails
    when the index names another version than the latest release, when that release has no
    patches-X.Y.Z.mpp asset, or when the index downloads anything but that asset. On a failure it
    also lists the commits in this checkout that change patches-bundle.json and haven't reached
    the branch on GitHub, which is what was missing for 0.0.5.

    Dot-sourcing it defines the functions alone, for the offline contracts in
    test-published-index.ps1.
#>
[CmdletBinding()]
param(
    # owner/name on GitHub. Read from the origin remote when not given.
    [string]$Repository,
    [string]$Branch = 'main',
    [string]$Root
)

function Get-PublishedIndexProblems {
    <#
    .SYNOPSIS
        What disagrees between GitHub's latest release and the index the branch serves, one
        sentence each, or nothing when they agree.
    .DESCRIPTION
        $Release is the releases/latest answer (tag_name, assets with name and
        browser_download_url) and $Index is patches-bundle.json as read from the branch. The
        download address is compared only when the versions agree; a version that lags already
        says everything a wrong address would.
    #>
    param(
        [Parameter(Mandatory = $true)]$Release,
        [Parameter(Mandatory = $true)]$Index
    )

    $problems = New-Object System.Collections.Generic.List[string]
    $tag = [string]$Release.tag_name
    $tagMatch = [regex]::Match($tag, '^v(\d+\.\d+\.\d+)$')
    if (-not $tagMatch.Success) {
        $problems.Add("The latest release's tag [$tag] isn't vX.Y.Z, so there's no version to hold the index to.")
        return $problems.ToArray()
    }
    $releaseVersion = $tagMatch.Groups[1].Value
    $indexVersion = [string]$Index.version
    if ($indexVersion -cne $releaseVersion) {
        $problems.Add(("patches-bundle.json on the branch names [$indexVersion], but the latest release is $tag. " +
            "Morphe Manager won't offer $tag until the index names it."))
    }

    $assetName = "patches-$releaseVersion.mpp"
    $assets = @($Release.assets | Where-Object { [string]$_.name -ceq $assetName })
    if ($assets.Count -ne 1) {
        $problems.Add("Release $tag has no $assetName asset for Morphe Manager to download.")
    } elseif ($indexVersion -ceq $releaseVersion -and
            [string]$Index.download_url -cne [string]$assets[0].browser_download_url) {
        $problems.Add(("patches-bundle.json downloads [$([string]$Index.download_url)], not $tag's own " +
            "$assetName at [$([string]$assets[0].browser_download_url)]."))
    }
    return $problems.ToArray()
}

function Get-UnpushedIndexCommits {
    <#
    .SYNOPSIS
        The commits on HEAD past GitHub's branch head that change patches-bundle.json, as
        "hash subject" lines. $null when this checkout doesn't have that head and so can't tell.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Root,
        [Parameter(Mandatory = $true)][string]$RemoteHead
    )

    # Continue in this function alone: Windows PowerShell 5.1 turns git's stderr into a
    # terminating error under Stop, and the exit code is what decides here.
    $ErrorActionPreference = 'Continue'
    & git -C $Root cat-file -e "$($RemoteHead)^{commit}" 2>$null
    if ($LASTEXITCODE -ne 0) { return $null }
    $lines = @(& git -C $Root log --format='%h %s' "$RemoteHead..HEAD" -- patches-bundle.json 2>$null)
    if ($LASTEXITCODE -ne 0) { return $null }
    return , $lines
}

function Get-GitHubRepositorySlug {
    <#
    .SYNOPSIS
        owner/name from a GitHub remote address, https or ssh, or $null for anything else.
    #>
    param([string]$RemoteUrl)

    $match = [regex]::Match([string]$RemoteUrl, '^(?:https://github\.com/|git@github\.com:|ssh://git@github\.com/)([^/\s]+/[^/\s]+?)(?:\.git)?/?$')
    if (-not $match.Success) { return $null }
    return $match.Groups[1].Value
}

function Invoke-GhApiJson {
    param([Parameter(Mandatory = $true)][string]$Path)

    $ErrorActionPreference = 'Continue'
    $text = @(& gh api $Path 2>$null)
    if ($LASTEXITCODE -ne 0) {
        throw "GitHub didn't answer gh api $Path. Run gh auth status, then try again."
    }
    return ($text -join "`n") | ConvertFrom-Json
}

# Dot-sourcing exposes the functions for the offline contracts.
if ($MyInvocation.InvocationName -eq '.') { return }
$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    throw 'The gh CLI is needed to ask GitHub for the latest release and the published index.'
}
if (-not $Repository) {
    $remote = (& git -C $Root remote get-url origin 2>$null)
    $Repository = Get-GitHubRepositorySlug -RemoteUrl $remote
    if (-not $Repository) {
        throw "The origin remote [$remote] isn't a GitHub repository. Pass -Repository owner/name."
    }
}

$release = Invoke-GhApiJson "repos/$Repository/releases/latest"
$content = Invoke-GhApiJson "repos/$Repository/contents/patches-bundle.json?ref=$Branch"
$indexText = [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String(([string]$content.content -replace '\s', '')))
$index = $indexText | ConvertFrom-Json

$problems = @(Get-PublishedIndexProblems -Release $release -Index $index)
if ($problems.Count -eq 0) {
    Write-Host ("[index] $Repository $Branch serves patches-bundle.json $($index.version), the latest release " +
        "$($release.tag_name), and it downloads that release's own bundle")
    exit 0
}

$report = New-Object System.Collections.Generic.List[string]
$report.Add("Morphe Manager isn't being offered the latest release of $Repository.")
foreach ($problem in $problems) { $report.Add("  $problem") }
$remoteHead = [string](Invoke-GhApiJson "repos/$Repository/branches/$Branch").commit.sha
$unpushed = Get-UnpushedIndexCommits -Root $Root -RemoteHead $remoteHead
if ($null -eq $unpushed) {
    $report.Add("This checkout doesn't have $Branch's head on GitHub ($remoteHead). Fetch, then look for an index commit that never went up.")
} elseif ($unpushed.Count -gt 0) {
    $report.Add("These commits change patches-bundle.json and aren't on GitHub's $Branch yet. Push them:")
    foreach ($line in $unpushed) { $report.Add("  $line") }
}
throw ($report -join [Environment]::NewLine)
