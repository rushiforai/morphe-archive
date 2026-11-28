<#
.SYNOPSIS
    Refuse missing or substituted license evidence for carried artifacts.
.NOTES
    Copyright 2026 HushGram contributors. GPL-3.0-only.
    https://github.com/SysAdminDoc/HushGram
#>
[CmdletBinding()]
param([string]$Root)
$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'release-receipt.ps1')
$ledgerPath = Join-Path $Root 'sources/carried-library-licenses.json'
$ledger = Get-Content -LiteralPath $ledgerPath -Raw | ConvertFrom-Json
$work = Join-Path ([IO.Path]::GetTempPath()) ('hushgram-licenses-' + [guid]::NewGuid().ToString('N'))
$null = New-Item -ItemType Directory -Path $work
$path = Join-Path $work 'patches-9.9.9.cdx.json'
$passed = 0
function New-LicenseFixture {
    $components = foreach ($record in $ledger.artifacts) {
        $parts = [regex]::Match($record.purl, '^pkg:maven/([^/]+)/([^@]+)@(.+)$')
        [ordered]@{ type = 'library'; 'bom-ref' = $record.purl; purl = $record.purl
            group = $parts.Groups[1].Value; name = $parts.Groups[2].Value; version = $parts.Groups[3].Value
            hashes = @(@{alg = 'SHA-256'; content = $record.sha256})
            licenses = @(@{license = $record.license})
            properties = @(@{name = 'hushgram:artifact'; value = "$($record.file) sha256:$($record.sha256)"},
                @{name = 'hushgram:license-evidence'; value = ($record | ConvertTo-Json -Depth 8 -Compress)}) }
    }
    [ordered]@{ bomFormat = 'CycloneDX'; specVersion = '1.6'; version = 1
        metadata = @{timestamp = '2023-11-14T22:13:20Z'
            component = @{name = 'patches-9.9.9.mpp'; version = '9.9.9'; hashes = @(@{alg = 'SHA-256'; content = ('1' * 64)})}
            properties = @(@{name = 'hushgram:license-policy'; value = 'reviewed-artifacts-v1'},
                @{name = 'hushgram:license-ledger'; value = (Get-FileHash -LiteralPath $ledgerPath).Hash.ToLowerInvariant()})}
        components = @($components); dependencies = @() }
}
function Save-Fixture($Document) { $Document | ConvertTo-Json -Depth 12 | Set-Content -LiteralPath $path -Encoding utf8 }
function Must-Refuse([scriptblock]$Read, [string]$Name) {
    try { $null = & $Read } catch {
        if ($_.Exception.Message -notmatch 'license|licensed') { throw "$Name failed for another reason: $($_.Exception.Message)" }
        $script:passed++
        return
    }
    throw "Accepted $Name without reviewed license evidence."
}
try {
    $mutations = @(
        @{Name = 'missing component licenses'; Apply = {param($d) $d.components[0].Remove('licenses')}},
        @{Name = 'wrong license'; Apply = {param($d) $d.components[0].licenses[0].license = @{id = 'MIT'}}},
        @{Name = 'missing evidence'; Apply = {param($d) $d.components[0].properties = @($d.components[0].properties[0])}},
        @{Name = 'evidence for another artifact'; Apply = {param($d) $r = $d.components[0].properties[1].value | ConvertFrom-Json; $r.sha256 = ('0' * 64); $d.components[0].properties[1].value = $r | ConvertTo-Json -Depth 8 -Compress}},
        @{Name = 'duplicate evidence'; Apply = {param($d) $d.components[0].properties += $d.components[0].properties[1]}},
        @{Name = 'unbound publisher URL'; Apply = {param($d) $r = $d.components[0].properties[1].value | ConvertFrom-Json; $r.evidence.url = 'https://example.com/license'; $d.components[0].properties[1].value = $r | ConvertTo-Json -Depth 8 -Compress}}
    )
    foreach ($case in $mutations) {
        $document = New-LicenseFixture
        & $case.Apply $document
        Save-Fixture $document
        Must-Refuse { Read-ReleaseSbom -Path $path } $case.Name
    }
    $document = New-LicenseFixture
    Save-Fixture $document
    $null = Read-ReleaseSbom -Path $path -RequireReviewedLicenses -LicenseLedger $ledgerPath
    $passed++
    foreach ($missing in @($ledger.artifacts)) {
        $document = New-LicenseFixture
        $document.components = @($document.components | Where-Object { $_.purl -cne $missing.purl })
        Save-Fixture $document
        Must-Refuse { Read-ReleaseSbom -Path $path -RequireReviewedLicenses -LicenseLedger $ledgerPath } "an omitted carried library $($missing.purl)"
    }
    $document = New-LicenseFixture
    $document.components = @(@{ type = 'file'; 'bom-ref' = 'extensions/instagram.mpe'
        name = 'extensions/instagram.mpe'; hashes = @(@{alg = 'SHA-256'; content = ('1' * 64)}) })
    Save-Fixture $document
    Must-Refuse { Read-ReleaseSbom -Path $path -RequireReviewedLicenses -LicenseLedger $ledgerPath } 'an empty carried-library inventory'
    $document = New-LicenseFixture
    $document.components[0].type = 'file'
    Save-Fixture $document
    Must-Refuse { Read-ReleaseSbom -Path $path -RequireReviewedLicenses -LicenseLedger $ledgerPath } 'a carried library disguised as a file'
    foreach ($field in @('sha256', 'declaredLicense')) {
        $document = New-LicenseFixture
        $record = $document.components[0].properties[1].value | ConvertFrom-Json
        $record.evidence.$field = if ($field -eq 'sha256') { '0' * 64 } else { 'unreviewed declaration' }
        $document.components[0].properties[1].value = $record | ConvertTo-Json -Depth 8 -Compress
        Save-Fixture $document
        Must-Refuse { Read-ReleaseSbom -Path $path -RequireReviewedLicenses -LicenseLedger $ledgerPath } "substituted publisher $field"
    }
    $document = New-LicenseFixture
    $document.components[0].hashes[0].content = ('0' * 64)
    Save-Fixture $document
    Must-Refuse { Read-ReleaseSbom -Path $path } 'a licensed component with another binary hash'
    $document = New-LicenseFixture
    $document.metadata.properties[1].value = ('0' * 64)
    Save-Fixture $document
    Must-Refuse { Read-ReleaseSbom -Path $path -RequireReviewedLicenses -LicenseLedger $ledgerPath } 'a substituted ledger'
    $document = New-LicenseFixture
    $document.metadata.properties = @()
    foreach ($component in $document.components) { $component.Remove('licenses'); $component.properties = @($component.properties[0]) }
    Save-Fixture $document
    $null = Read-ReleaseSbom -Path $path
    $passed++
    Must-Refuse { Read-ReleaseSbom -Path $path -RequireReviewedLicenses -LicenseLedger $ledgerPath } 'a downgraded current SBOM'
    Write-Host "[licenses] $passed checks passed; historical SBOM reading preserved."
} finally {
    $resolved = [IO.Path]::GetFullPath($work)
    if (-not $resolved.StartsWith([IO.Path]::GetFullPath([IO.Path]::GetTempPath()), [StringComparison]::OrdinalIgnoreCase)) { throw 'Unexpected license fixture directory.' }
    Remove-Item -LiteralPath $resolved -Recurse -Force
}
