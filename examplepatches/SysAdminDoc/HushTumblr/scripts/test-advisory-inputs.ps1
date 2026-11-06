<#
.SYNOPSIS
    Exercise both advisory gates with malformed and package-specific recorded OSV results.
.DESCRIPTION
    No request reaches the network. Existing advisory fixtures cover normal records, ratings and
    exceptions; these cases hold response types and unreadable scores to the same refusal policy.
#>
[CmdletBinding()]
param([string]$Root)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $Root 'scripts/build-advisories.ps1') -Root $Root
$temp = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\', '/')
$testRoot = [IO.Path]::GetFullPath((Join-Path $temp ('hushtumblr-advisory-inputs-' + [guid]::NewGuid().ToString('N'))))
if ([IO.Path]::GetDirectoryName($testRoot) -ine $temp) { throw 'The advisory fixture is outside the temporary directory.' }
$exceptionsPath = Join-Path $testRoot 'exceptions.txt'
$purl = 'pkg:maven/com.example/advisory-fixture@1.2.3'
$library = [pscustomobject]@{ Group = 'com.example'; Name = 'advisory-fixture'; Version = '1.2.3'; Purl = $purl }
$report = [pscustomobject]@{ Path = 'recorded.cdx.json'; GradleVersion = '9.8.2'; Libraries = @($library) }
$asked = New-Object Collections.Generic.List[string]
$responses = @{}
$cases = 0

function Invoke-RestMethod {
    param($Uri, $Method, $ContentType, $Body, $TimeoutSec)
    if ($Uri -cne 'https://api.osv.dev/v1/query' -or $Method -cne 'Post' -or $ContentType -cne 'application/json') {
        throw 'An unexpected request reached the recorded OSV transport.'
    }
    $query = $Body | ConvertFrom-Json
    $key = [string]$query.package.purl
    if ($query.page_token) { $key += ' page ' + $query.page_token }
    $asked.Add($key)
    if (-not $responses.ContainsKey($key)) { throw "No recorded OSV response for $key." }
    $json = $responses[$key]
    # Invoke-RestMethod keeps a root JSON array as one pipeline value. ConvertFrom-Json alone
    # enumerates it, concealing a singleton array as a perfectly ordinary result object.
    if ($json.TrimStart().StartsWith('[')) {
        Write-Output -NoEnumerate @($json | ConvertFrom-Json)
    } else {
        $json | ConvertFrom-Json
    }
}

function Invoke-RecordedGate([string]$Gate) {
    if ($Gate -ceq 'build') {
        Invoke-BuildAdvisoryGate -Root $testRoot -Report $report -ExceptionsPath $exceptionsPath
    } else {
        Invoke-ReleaseAdvisoryGate -Sbom $report -ExceptionsPath $exceptionsPath
    }
}

function Test-RecordedCase([string]$Name, [hashtable]$Answers, [string]$Failure, [string]$Says, [int]$Requests = 1) {
    foreach ($gate in @('build', 'bundle')) {
        $script:responses = $Answers
        $asked.Clear()
        $caught = $null
        $output = @()
        try { $output = @(& { Invoke-RecordedGate $gate } 6>&1) }
        catch { $caught = $_.Exception.Message }
        if ($Failure) {
            if (-not $caught -or $caught -notlike $Failure) {
                throw "$gate accepted or misreported $Name. Expected [$Failure], got [$caught]."
            }
        } elseif ($caught -or ($Says -and ($output -join ' ') -notlike $Says)) {
            throw "$gate refused or misreported $Name. Error [$caught], output [$($output -join ' ')]."
        }
        if ($asked.Count -ne $Requests -or $asked[0] -cne $purl -or
                ($Requests -eq 2 -and $asked[1] -cne ($purl + ' page p2'))) {
            throw "$gate made the wrong recorded requests for $Name [$($asked -join ', ')]."
        }
        $script:cases++
    }
}

function New-RecordedAdvisory($Mutate) {
    $record = [ordered]@{ id = 'GHSA-recorded-input'; database_specific = @{ severity = 'LOW' } }
    if ($Mutate) { & $Mutate $record }
    return (@{ vulns = @($record) } | ConvertTo-Json -Depth 12 -Compress)
}

function New-PackageRating([string]$Name, [string]$Type, [string]$Vector) {
    return [ordered]@{ package = @{ ecosystem = 'Maven'; name = $Name }; severity = @(@{ type = $Type; score = $Vector }) }
}

try {
    $wrapper = Join-Path $testRoot 'gradle/wrapper'
    New-Item -ItemType Directory -Path $wrapper -Force | Out-Null
    foreach ($fileName in @('gradle-wrapper.properties', 'gradle-wrapper.jar')) {
        Copy-Item -LiteralPath (Join-Path $Root ('gradle/wrapper/' + $fileName)) -Destination (Join-Path $wrapper $fileName)
    }
    Set-Content -LiteralPath $exceptionsPath -Value '# no accepted advisories' -Encoding ASCII

    foreach ($valid in @('{}', '{"vulns":[]}', '{"next_page_token":""}')) {
        Test-RecordedCase 'an empty result object' @{ $purl = $valid } -Says '*OSV has no advisory*'
    }
    foreach ($first in @('{"next_page_token":"p2"}', '{"vulns":[],"next_page_token":"p2"}')) {
        Test-RecordedCase 'an empty first page with a token' @{ $purl = $first; ($purl + ' page p2') = '{}' } `
            -Says '*OSV has no advisory*' -Requests 2
    }
    foreach ($odd in @(
            @{ Name = 'an error envelope'; Json = '{"code":3,"message":"recorded failure"}'; Pattern = '*unknown query result field*' },
            @{ Name = 'an error beside an empty list'; Json = '{"vulns":[],"error":"recorded failure"}'; Pattern = '*unknown query result field*' },
            @{ Name = 'a differently cased field'; Json = '{"Vulns":[]}'; Pattern = '*unknown query result field*' },
            @{ Name = 'a root empty array'; Json = '[]'; Pattern = '*isn''t a query result*' },
            @{ Name = 'a root singleton array'; Json = '[{}]'; Pattern = '*isn''t a query result*' },
            @{ Name = 'a root array'; Json = '[{},{}]'; Pattern = '*isn''t a query result*' },
            @{ Name = 'a null root'; Json = 'null'; Pattern = '*isn''t a query result*' },
            @{ Name = 'a scalar root'; Json = 'false'; Pattern = '*isn''t a query result*' })) {
        Test-RecordedCase $odd.Name @{ $purl = $odd.Json } -Failure $odd.Pattern
    }
    foreach ($value in @('null', 'false', '0', '"no list"', '{}')) {
        Test-RecordedCase 'vulns with the wrong type' @{ $purl = ('{"vulns":' + $value + '}') } -Failure '*vulns that isn''t an array*'
    }
    foreach ($value in @('null', 'false', '0', '"no record"', '[]')) {
        Test-RecordedCase 'a vulnerability with the wrong type' @{ $purl = ('{"vulns":[' + $value + ']}') } `
            -Failure '*vulnerability that isn''t an object*'
    }
    foreach ($value in @('null', 'false', '0', '[]', '{}', '" "')) {
        Test-RecordedCase 'an invalid advisory identity' @{ $purl = ('{"vulns":[{"id":' + $value + '}]}') } -Failure '*has no id*'
    }
    foreach ($value in @('null', 'false', '0', '[]', '{}', '" "')) {
        Test-RecordedCase 'an invalid page token' @{ $purl = ('{"next_page_token":' + $value + '}') } -Failure '*invalid next_page_token*'
    }
    foreach ($value in @('null', 'false', '1', '[]', '{}', '""', '"false"', '"2026-10-01"',
            '"2026-02-30T00:00:00Z"', '"2026-10-01T00:00:00+05:00"', '"2026-10-01T00:00:00"',
            '"2026-10-01T25:00:00Z"', '"2026-10-01T12:00:60Z"', '"2026-10-01T00:00:00.Z"')) {
        Test-RecordedCase 'an invalid withdrawal' @{ $purl = ('{"vulns":[{"id":"GHSA-recorded-input","withdrawn":' +
            $value + ',"database_specific":{"severity":"HIGH"}}]}') } -Failure '*invalid withdrawn timestamp*'
    }
    foreach ($stamp in @('2026-10-01T00:00:00Z', '2026-10-01T00:00:00.123456789Z', '2016-12-31T23:59:60Z')) {
        Test-RecordedCase 'a withdrawn high finding' @{ $purl = ('{"vulns":[{"id":"GHSA-recorded-input","withdrawn":"' +
            $stamp + '","database_specific":{"severity":"HIGH"}}]}') } -Says '*OSV has no advisory*'
    }

    $critical = 'CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H'
    $moderate = 'CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:H/I:N/A:N'
    $low = 'CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N'
    $vectorFour = 'CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:H/VI:H/VA:H/SC:N/SI:N/SA:N'
    $json = New-RecordedAdvisory { param($record) $record.affected = @(New-PackageRating 'com.example:advisory-fixture' 'CVSS_V3' $critical) }
    Test-RecordedCase 'a matching package critical score beside LOW' @{ $purl = $json } -Failure '*GHSA-recorded-input (CRITICAL*'
    $json = New-RecordedAdvisory { param($record)
        $record.affected = @((New-PackageRating 'com.example:other' 'CVSS_V3' $critical),
            (New-PackageRating 'com.example:advisory-fixture' 'CVSS_V3' $moderate))
    }
    Test-RecordedCase 'a different package critical score' @{ $purl = $json } -Says '*below high, let through*MODERATE*'
    $json = New-RecordedAdvisory { param($record)
        $record.affected = @((New-PackageRating 'com.example:other' 'CVSS_V4' $vectorFour),
            (New-PackageRating 'com.example:advisory-fixture' 'CVSS_V3' $low))
    }
    Test-RecordedCase 'a different package unsupported score' @{ $purl = $json } -Says '*below high, let through*LOW*'
    $json = New-RecordedAdvisory { param($record)
        $record.affected = @((New-PackageRating 'com.example:advisory-fixture' 'CVSS_V3' $low),
            (New-PackageRating 'com.example:advisory-fixture' 'CVSS_V3' $critical))
    }
    Test-RecordedCase 'the strongest matching package score' @{ $purl = $json } -Failure '*GHSA-recorded-input (CRITICAL*'
    $json = New-RecordedAdvisory { param($record)
        $record.affected = @(New-PackageRating 'com.example:advisory-fixture' 'CVSS_V4' $vectorFour)
    }
    Test-RecordedCase 'a matching package unscorable vector beside LOW' @{ $purl = $json } -Failure '*GHSA-recorded-input (UNRATED*'
    foreach ($vector in @($vectorFour, 'not a vector', ($critical + '/C:N'), ($critical + '/BOGUS:X'),
            ($critical + '/E:Z'), $critical.Replace('/A:H', ''))) {
        $json = New-RecordedAdvisory { param($record) $record.severity = @(@{ type = 'CVSS_V3'; score = $vector }) }
        Test-RecordedCase 'an unscorable vector beside LOW' @{ $purl = $json } -Failure '*GHSA-recorded-input (UNRATED*'
    }
    $json = New-RecordedAdvisory { param($record) $record.severity = @(@{ type = 'CVSS_V4'; score = $vectorFour }) }
    Test-RecordedCase 'CVSS 4 beside LOW' @{ $purl = $json } -Failure '*GHSA-recorded-input (UNRATED*'
    foreach ($malformed in @($null, @{}, @($null), @(@{ type = @('CVSS_V3'); score = $low }), @(@{ type = 'CVSS_V3'; score = 0 }))) {
        $json = New-RecordedAdvisory { param($record) $record.severity = $malformed }
        Test-RecordedCase 'malformed supplied severity beside LOW' @{ $purl = $json } -Failure '*GHSA-recorded-input (UNRATED*'
    }
    foreach ($malformed in @($null, @{}, @($null), @(@{ severity = @(@{ type = 'CVSS_V3'; score = $critical }) }),
            @(@{ package = @{ ecosystem = 'Maven'; name = '' }; severity = @(@{ type = 'CVSS_V3'; score = $critical }) }))) {
        $json = New-RecordedAdvisory { param($record) $record.affected = $malformed }
        Test-RecordedCase 'unidentifiable package severity beside LOW' @{ $purl = $json } -Failure '*GHSA-recorded-input (UNRATED*'
    }
    $json = New-RecordedAdvisory { param($record)
        $record.database_specific.severity = 'HIGH'
        $record.severity = @(@{ type = 'CVSS_V3'; score = $low })
    }
    Test-RecordedCase 'a stronger database label' @{ $purl = $json } -Failure '*GHSA-recorded-input (HIGH*'
    $json = New-RecordedAdvisory { param($record) $record.severity = @(@{ type = 'CVSS_V3'; score = $critical }) }
    Test-RecordedCase 'a serious second page after a token-only page' @{ $purl = '{"next_page_token":"p2"}'; ($purl + ' page p2') = $json } `
        -Failure '*GHSA-recorded-input (CRITICAL*' -Requests 2
} finally {
    if (Test-Path -LiteralPath $testRoot) { Remove-Item -LiteralPath $testRoot -Recurse -Force }
}

Write-Host "[scripts] recorded advisory response and severity contracts passed ($cases cases across both gates)"
