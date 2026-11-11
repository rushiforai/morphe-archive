param(
    [Parameter(Mandatory = $true)][string]$Owner,
    [Parameter(Mandatory = $true)][string]$Repo,
    [string]$Branch = 'main',
    [string]$Version = '1.2.4'
)

$ErrorActionPreference = 'Stop'

$cred = "protocol=https`nhost=github.com`n`n" | git credential fill
$token = ($cred -split "`n" | Where-Object { $_ -like 'password=*' }) -replace '^password=', ''
if (-not $token) { throw 'No GitHub token available from git credential fill.' }

$headers = @{
    Authorization = "Bearer $token"
    'User-Agent'  = 'opencode'
    Accept        = 'application/vnd.github+json'
}

function Get-RemoteSha([string]$Path) {
    try {
        $uri = "https://api.github.com/repos/$Owner/$Repo/contents/$Path" + "?ref=$Branch"
        $res = Invoke-RestMethod -Uri $uri -Headers $headers -Method Get
        return $res.sha
    } catch {
        if ($_.Exception.Response.StatusCode.value__ -eq 404) { return $null }
        throw
    }
}

$remoteDir = Join-Path $PSScriptRoot '..\remote'
$files = @(
    @{ Path = 'patches-list.json'; Source = Join-Path $remoteDir 'patches-list.json'; Message = "Update patch list to $Version" },
    @{ Path = 'patches-bundle.json'; Source = Join-Path $remoteDir 'patches-bundle.json'; Message = "Update bundle manifest to $Version" },
    @{ Path = "SeyMorphe-$Version.mpp"; Source = Join-Path $remoteDir "SeyMorphe-$Version.mpp"; Message = "Add $Version patch bundle" },
    @{ Path = 'patches-bundle.png'; Source = Join-Path $remoteDir 'patches-bundle.png'; Message = 'Add bundle icon' },
    @{ Path = 'CHANGELOG.md'; Source = Join-Path $PSScriptRoot '..\CHANGELOG.md'; Message = "Document $Version changes" },
    @{ Path = 'README.md'; Source = Join-Path $PSScriptRoot '..\README.md'; Message = 'Document Sey Morphe patches and source' }
)

foreach ($file in $files) {
    $bytes = [System.IO.File]::ReadAllBytes($file.Source)
    $body = @{
        message = $file.Message
        branch  = $Branch
        content = [Convert]::ToBase64String($bytes)
    }
    $sha = Get-RemoteSha $file.Path
    if ($sha) { $body.sha = $sha }

    $json = $body | ConvertTo-Json -Compress
    $uri = "https://api.github.com/repos/$Owner/$Repo/contents/$($file.Path)"
    $res = Invoke-RestMethod -Uri $uri -Headers $headers -Method Put -Body ([System.Text.Encoding]::UTF8.GetBytes($json)) -ContentType 'application/json'
    Write-Output ("{0} -> {1} ({2} bytes)" -f $file.Path, $res.commit.sha.Substring(0, 10), $bytes.Length)
}
