<#
.SYNOPSIS
    Hold the Facebook-family source ledger and its audit to their rules, with no network.

.DESCRIPTION
    The checked-in ledger has to keep every rule of scripts/facebook-sources.ps1, and
    docs/sources.md can't link a source the ledger doesn't know or call a behavior-only source
    portable. Then each rule is broken once on a copy, and each has to be refused by name: an
    adopted source missing its pinned commit, compatible licence, NOTICE entry, provenance rule or
    two-fixture evidence, an unlicensed or contaminated source that isn't behavior-only, a
    provenance rule crediting a source the ledger doesn't allow, an index with no listing record.
    The census is held to its 14 days on both sides of the line.

    scripts/audit-facebook-sources.ps1 then runs against a stand-in for every forge and index it
    reads, so nothing here touches the network: a request the stand-in doesn't know fails the case.
    A clean run stamps only dates and collapses a byte-for-byte copy into its lineage; an addition
    from an index or code search, a removed licence, a moved branch head, a new branch with
    Facebook-family work, an unseen fork, a repository that's gone and a changed listing each exit
    1 with the ledger untouched. Through all of it the audit writes nothing but its report and the
    ledger's dates, and a parse of its source finds nothing that clones, downloads to disk or
    copies files, with a copy that does each of those as the proof the parse can see them.

    The pre-push hook runs this for the audit, its rules, the ledger, provenance.json and NOTICE.
#>
[CmdletBinding()]
param([string]$Root)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $PSScriptRoot 'facebook-sources.ps1')

function Assert-True {
    param([bool]$Condition, [string]$Message)
    if (-not $Condition) { throw $Message }
}

function Assert-Throws {
    param([scriptblock]$Action, [string]$Pattern, [string]$Message)
    try {
        & $Action
    } catch {
        if ($_.Exception.Message -like $Pattern) { return }
        throw "$Message Unexpected error: $($_.Exception.Message)"
    }
    throw "$Message No error was raised."
}

function Copy-Json {
    param($Value)
    return ($Value | ConvertTo-Json -Depth 20 | ConvertFrom-Json)
}

function Get-Sha256Text {
    param([string]$Text)
    $hasher = [Security.Cryptography.SHA256]::Create()
    try {
        return -join ($hasher.ComputeHash([Text.Encoding]::UTF8.GetBytes($Text)) | ForEach-Object { $_.ToString('x2') })
    } finally { $hasher.Dispose() }
}

$caseRoot = Join-Path ([IO.Path]::GetTempPath()) ("hushfacebook-sources-" + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $caseRoot -Force | Out-Null
$savedGitLabToken = $env:GITLAB_TOKEN
# A maintainer's own token never reaches the stand-ins; the cases that need one set their own.
$env:GITLAB_TOKEN = $null
try {

# --- the checked-in ledger ------------------------------------------------------------------------

$ledgerPath = Get-SourceLedgerPath -Root $Root
$ledger = Read-SourceLedger -Path $ledgerPath
$checkedIn = Test-SourceLedger -Ledger $ledger -Root $Root
Assert-True $checkedIn.Valid ("The checked-in ledger breaks its rules: " + ($checkedIn.Problems -join ' | '))
$entries = @($ledger.entries)
$availabilityCounts = Get-SourceAvailabilityCounts $entries
Assert-True ((Get-SourceAvailability ('{"availability":{"status":"retired"}}' | ConvertFrom-Json)) -eq 'retired' -and
    (Get-SourceAvailability ('{"availability":{"status":"unavailable"}}' | ConvertFrom-Json)) -eq 'unavailable' -and
    (Get-SourceAvailability ('{}' | ConvertFrom-Json)) -eq 'active' -and
    (Get-SourceAvailability ('{"availability":null}' | ConvertFrom-Json)) -eq '') `
    'Parsed JSON records lost their explicit availability or a null record became active.'
Assert-True ($availabilityCounts.activeSources + $availabilityCounts.historicalSources -eq $entries.Count -and
    $availabilityCounts.retiredSources + $availabilityCounts.unavailableSources -eq $availabilityCounts.historicalSources) `
    'The availability counts dropped or counted a source twice.'
$mben = @($entries | Where-Object { $_.id -eq 'froggo-mben' })[0]
Assert-True ((Get-SourceAvailability $mben) -eq 'retired' -and $mben.disposition -eq 'candidate' -and -not $mben.archived -and
    @($mben.branches | Where-Object { $_.commit -ne '4b5ce29fdbabc7417ed5f4c2108cdf24692896b0' }).Count -eq 0 -and
    @($mben.targetVersions.'com.facebook.katana') -contains '573.0.0.37.74') `
    'The retired mben25 source lost its reachable Facebook 573 history, or retirement changed its licence disposition or archive flag.'
Assert-True (@($entries | Where-Object { $_.disposition -eq 'adopted' }).Count -ge 1) `
    'The checked-in ledger adopts nothing, so the adopted gates below would test an empty set.'
foreach ($package in Get-SourcePackages) {
    Assert-True (@($entries | Where-Object { @($_.packages) -contains $package }).Count -gt 0) "The checked-in ledger has no $package source."
}

# docs/sources.md is the readable version of the ledger. A source it links has to be one the
# ledger knows, and a behavior-only source can never be described as portable: the line that
# said NexAlloy's Facebook code could be ported with credit is what this item started from.
$known = @{}
foreach ($entry in $entries) {
    $known[(ConvertTo-SourceKey $entry.repository)] = $entry
    foreach ($mirror in @($entry.mirrors | Where-Object { $_ })) { $known[(ConvertTo-SourceKey $mirror.repository)] = $entry }
    if ($entry.upstream) { $known[(ConvertTo-SourceKey $entry.upstream)] = $entry }
}
foreach ($item in @($ledger.outOfScope | Where-Object { $_ })) { $known[(ConvertTo-SourceKey $item.repository)] = $item }
$known[(ConvertTo-SourceKey $ledger.self.repository)] = $ledger.self
$known[(ConvertTo-SourceKey $ledger.officialBundle.repository)] = $ledger.officialBundle
foreach ($index in @($ledger.indexes)) {
    foreach ($address in @($index.url, $index.hushfacebook.url)) {
        $indexKey = ConvertTo-SourceKey $address
        if ($indexKey) { $known[$indexKey] = $index }
    }
}
function Test-SourcesDoc {
    param([string]$Text)
    $problems = New-Object System.Collections.Generic.List[string]
    foreach ($match in [regex]::Matches($Text, 'https://(?:github\.com|gitlab\.com)/[A-Za-z0-9_.\-/]+')) {
        $key = ConvertTo-SourceKey ($match.Value.TrimEnd('.', ')'))
        if ($key -and -not $known.ContainsKey($key)) { $problems.Add("docs/sources.md links $key, which the ledger doesn't know.") }
    }
    $portable = '(?i)\b(can be ported|ported with credit|port(ed)? it with credit|can be copied|copy its code)\b'
    foreach ($line in ($Text -split "`r?`n")) {
        if ($line -notmatch $portable) { continue }
        foreach ($entry in $entries | Where-Object { $_.disposition -eq 'behavior-only' }) {
            if ($line.IndexOf([string]$entry.repository, [StringComparison]::OrdinalIgnoreCase) -ge 0) {
                $problems.Add("docs/sources.md calls $($entry.repository) portable, and the ledger says behavior-only: $line")
            }
        }
    }
    return $problems.ToArray()
}
$sourcesDoc = [IO.File]::ReadAllText((Join-Path $Root 'docs/sources.md'))
$lineageCount = @($entries.lineage | Sort-Object -Unique).Count
Assert-True ($sourcesDoc -like "*retains $($entries.Count) source records in $lineageCount lineages*" -and
    $sourcesDoc -like "*$($availabilityCounts.activeSources) active records and $($availabilityCounts.retiredSources) retired record*") `
    'docs/sources.md does not distinguish the ledger total from active and retired records.'
$docProblems = @(Test-SourcesDoc $sourcesDoc)
Assert-True ($docProblems.Count -eq 0) ($docProblems -join ' | ')
$nexalloy = @($entries | Where-Object { $_.id -eq 'nexalloy' })[0]
Assert-True ($null -ne $nexalloy -and $nexalloy.disposition -eq 'behavior-only' -and $null -ne $nexalloy.contaminatedBy) `
    'The ledger no longer holds NexAlloy as contaminated and behavior-only.'
$oldLine = "- [gnadgnaoh/NexAlloy-XES]($($nexalloy.repository)) (GPL-3.0) ports those hooks. Its code can be ported with credit."
Assert-True (@(@(Test-SourcesDoc ($sourcesDoc + "`n" + $oldLine)) -like '*calls*portable*').Count -gt 0) `
    'A docs line calling NexAlloy''s code portable passed the check.'
Assert-True (@(@(Test-SourcesDoc ($sourcesDoc + "`nSee https://github.com/unknown-owner/new-facebook-patches.")) -like '*unknown-owner*').Count -gt 0) `
    'A docs link to a source the ledger doesn''t know passed the check.'

Write-Host '[sources] the checked-in ledger and docs/sources.md keep their rules'

# --- each rule, broken once -------------------------------------------------------------------------

$rulesRoot = Join-Path $caseRoot 'rules'
New-Item -ItemType Directory -Path $rulesRoot -Force | Out-Null
foreach ($name in @('NOTICE', 'provenance.json', 'patches-list.json')) {
    Copy-Item -LiteralPath (Join-Path $Root $name) -Destination (Join-Path $rulesRoot $name)
}
$today = [datetime]::UtcNow.Date.ToString('yyyy-MM-dd')
function Test-Broken {
    param([scriptblock]$Break, [string]$Pattern, [string]$Message, [scriptblock]$BreakRoot)
    $copy = Copy-Json $ledger
    & $Break $copy
    $savedNotice = [IO.File]::ReadAllText((Join-Path $rulesRoot 'NOTICE'))
    $savedProvenance = [IO.File]::ReadAllText((Join-Path $rulesRoot 'provenance.json'))
    try {
        if ($BreakRoot) { & $BreakRoot }
        $result = Test-SourceLedger -Ledger $copy -Root $rulesRoot -Today $today
    } finally {
        [IO.File]::WriteAllText((Join-Path $rulesRoot 'NOTICE'), $savedNotice)
        [IO.File]::WriteAllText((Join-Path $rulesRoot 'provenance.json'), $savedProvenance)
    }
    Assert-True (-not $result.Valid) "$Message The ledger was accepted."
    Assert-True (@($result.Problems | Where-Object { $_ -like $Pattern }).Count -gt 0) `
        "$Message It was refused, but not for that: $($result.Problems -join ' | ')"
}
function Get-Entry { param($Copy, [string]$Id) return @($Copy.entries | Where-Object { $_.id -eq $Id })[0] }
$adoptedId = [string]@($entries | Where-Object { $_.disposition -eq 'adopted' })[0].id
$adoptedRepository = [string](Get-Entry $ledger $adoptedId).repository

$control = Test-SourceLedger -Ledger (Copy-Json $ledger) -Root $rulesRoot -Today $today
Assert-True $control.Valid ("The unchanged copy was refused, so the cases below would prove nothing: " + ($control.Problems -join ' | '))

# The five things an adopted source needs.
Test-Broken { param($c) (Get-Entry $c $adoptedId).adopted.commit = $null } '*no pinned commit its code was taken from*' `
    'An adopted source with no pinned commit'
Test-Broken { param($c) (Get-Entry $c $adoptedId).license.spdx = 'NOASSERTION' } '*has no licence compatible with GPL-3.0*' `
    'An adopted source with no compatible licence'
Test-Broken { param($c) } '*is not in NOTICE*' 'An adopted source missing from NOTICE' {
    $path = Join-Path $rulesRoot 'NOTICE'
    [IO.File]::WriteAllText($path, ([IO.File]::ReadAllText($path).Replace($adoptedRepository, 'https://example.invalid/elsewhere')))
}
Test-Broken { param($c) (Get-Entry $c $adoptedId).adopted.commit = ('f' * 40) } '*has no provenance rule*' `
    'An adopted source whose commit no provenance rule names'
Test-Broken { param($c) $e = Get-Entry $c $adoptedId; $e.adopted.fixtures.builds = @($e.adopted.fixtures.builds[0]) } '*lacks two-fixture evidence*' `
    'An adopted source proved on one fixture'
Test-Broken { param($c) (Get-Entry $c $adoptedId).adopted.fixtures.receipt = 'https://example.com/receipt.json' } '*names no release receipt*' `
    'An adopted source with no release receipt'

# Unlicensed or contaminated sources stay behavior-only.
$unlicensed = [string]@($entries | Where-Object { $null -eq $_.license })[0].id
Test-Broken { param($c) (Get-Entry $c $unlicensed).disposition = 'candidate' } '*has no licence, so it is behavior-only*' `
    'An unlicensed source marked candidate'
Test-Broken { param($c) (Get-Entry $c 'nexalloy').disposition = 'candidate' } '*carries code from*behavior-only*' `
    'A contaminated source marked candidate'
$licensedCandidate = [string]@($entries | Where-Object { $_.disposition -eq 'candidate' -and $null -ne $_.license })[0].id
Test-Broken { param($c) (Get-Entry $c $licensedCandidate).license.spdx = 'CC-BY-NC-4.0' } '*can''t be combined with GPL-3.0*' `
    'A candidate whose licence can''t be combined with GPL-3.0'
Test-Broken { param($c) (Get-Entry $c $unlicensed).disposition = 'adopted' } '*has no licence*' 'An unlicensed source marked adopted'

# provenance.json can't credit what the ledger doesn't allow, and can't port from what isn't adopted.
$behaviorOnly = [string]@($entries | Where-Object { $_.disposition -eq 'behavior-only' })[0].repository
Test-Broken { param($c) } '*credits*but the ledger lists it as behavior-only*' 'A provenance rule crediting a behavior-only source' {
    $path = Join-Path $rulesRoot 'provenance.json'
    $document = [IO.File]::ReadAllText($path) | ConvertFrom-Json
    $rule = @($document.rules | Where-Object { $_.origin -eq 'ported' })[0]
    $rule.via = @(@($rule.via) + $behaviorOnly)
    [IO.File]::WriteAllText($path, ($document | ConvertTo-Json -Depth 10))
}
Test-Broken { param($c) $e = Get-Entry $c $adoptedId; $e.disposition = 'candidate'; $e.PSObject.Properties.Remove('adopted') } '*ports files from*not adopted*' `
    'A ported provenance rule from a source that isn''t adopted'
# A recorded fork or mirror carries its entry's code, so it's held to that entry's disposition and
# is never a porting source of its own.
$forkedEntry = @($entries | Where-Object { $_.disposition -eq 'behavior-only' -and @($_.forks | Where-Object { $_ }).Count -gt 0 })[0]
$behaviorOnlyFork = 'https://' + (ConvertTo-SourceKey $forkedEntry.repository).Split('/')[0] + '/' + @($forkedEntry.forks)[0]
$recordedMirror = [string]@(@($entries | Where-Object { @($_.mirrors | Where-Object { $_ }).Count -gt 0 })[0].mirrors)[0].repository
function Set-FirstPortedRule {
    param([string]$Property, [string]$Value)
    $path = Join-Path $rulesRoot 'provenance.json'
    $document = [IO.File]::ReadAllText($path) | ConvertFrom-Json
    $rule = @($document.rules | Where-Object { $_.origin -eq 'ported' })[0]
    $rule.$Property = if ($Property -eq 'via') { @(@($rule.via) + $Value) } else { $Value }
    [IO.File]::WriteAllText($path, ($document | ConvertTo-Json -Depth 10))
}
Test-Broken { param($c) } '*credits*as a fork of*behavior-only*' 'A provenance rule crediting a fork of a behavior-only source' {
    Set-FirstPortedRule 'via' $behaviorOnlyFork }
Test-Broken { param($c) } '*ports files from*only as a fork of*' 'A ported provenance rule from a fork of a behavior-only source' {
    Set-FirstPortedRule 'upstream' $behaviorOnlyFork }
Test-Broken { param($c) } '*ports files from*only as a mirror of*' 'A ported provenance rule from a recorded mirror' {
    Set-FirstPortedRule 'upstream' $recordedMirror }

# The records themselves.
Test-Broken { param($c) $c.indexes[0].hushfacebook.status = '' } '*records no Hushfacebook listing*' 'An index with no listing record'
Test-Broken { param($c) $i = @($c.indexes | Where-Object { $_.hushfacebook.status -eq 'listed' })[0]; $i.hushfacebook.url = $null } `
    '*listed but records no https listing url*' 'A listing with no URL'
Test-Broken { param($c) $c.indexes[0].hushfacebook = [pscustomobject]@{ status = 'submitted'; url = 'https://example.com/issue/1' } } `
    '*submission date is not a yyyy-MM-dd date*' 'A submission with no date'
Test-Broken { param($c) $c.indexes = @($c.indexes | Select-Object -Skip 1) } '*has no record of index*' 'A ledger missing an index'
Test-Broken { param($c) $c.entries[1].repository = $c.entries[0].repository } '*which Entry*already names*' 'A repository listed twice'
Test-Broken { param($c) $c.entries[0].branches[0].commit = 'main' } '*has no pinned commit (40 hex characters)*' 'A branch with no pinned commit'
Test-Broken { param($c) $c.entries[0].lastChecked = '25/09/2026' } '*lastChecked is not a yyyy-MM-dd date*' 'A lastChecked that isn''t ISO'
Test-Broken { param($c) $c.entries[0].lastChecked = '2999-01-01' } '*lastChecked is 2999-01-01, after today*' 'A lastChecked in the future'
Test-Broken { param($c) $c.entries[0].features = @() } '*names no features*' 'A source with no features'
Test-Broken { param($c) $c.entries[0].targetVersions = [pscustomobject]@{} } '*records no declared target versions*' 'A source with no target versions'
Test-Broken { param($c) $c.entries[0].packages = @('com.instagram.android') } '*not a Facebook-family package*' 'A source for another app'
Test-Broken { param($c) $c.entries[0].license = [pscustomobject]@{ spdx = 'GPL-3.0'; url = 'https://example.com/LICENSE'; sha256 = 'abc' } } `
    '*licence has no sha256*' 'A licence with no hash'
Test-Broken { param($c) $c.entries[0].lineage = '' } '*names no lineage*' 'A source with no lineage'
Test-Broken { param($c) (Get-Entry $c 'froggo-mben').availability.status = 'deleted' } '*availability must be active, retired or unavailable*' `
    'An unknown availability status'
Test-Broken { param($c) (Get-Entry $c 'froggo-mben').availability.reason = '' } '*retired availability gives no reason*' `
    'A retired source with no reason'
Test-Broken { param($c) (Get-Entry $c 'froggo-mben').availability.evidence = 'https://github.com/mben25/morphe-patches/tree/main' } `
    '*availability needs immutable evidence in its own repository*' 'A retired source supported only by a movable branch'
Test-Broken { param($c) (Get-Entry $c 'froggo-mben').availability.evidence = "https://github.com/other/source/commit/$('a' * 40)" } `
    '*availability needs immutable evidence in its own repository*' 'A retired source supported by another repository'
Test-Broken { param($c) (Get-Entry $c 'froggo-mben').watchPaths = @() } '*retired availability needs a watch path*' `
    'A retired source whose return could not be detected'
Test-Broken { param($c) (Get-Entry $c 'froggo-mben').license = $null } '*has no licence, so it is behavior-only*' `
    'Retirement cannot allow unlicensed code to remain a candidate'

Write-Host '[sources] every ledger rule refuses the copy that breaks it'

# --- the census and the listings a release is held to ----------------------------------------------

$census = Copy-Json $ledger
$census.census.checkedAt = '2026-09-25'
Assert-True (Test-SourceCensus -Ledger $census -Today '2026-10-09').Valid 'A census 14 days old was refused.'
$stale = Test-SourceCensus -Ledger $census -Today '2026-10-10'
Assert-True (-not $stale.Valid -and $stale.Reason -like '*15 days old*') "A census 15 days old was accepted: $($stale.Reason)"
Assert-True (-not (Test-SourceCensus -Ledger $census -Today '2026-09-24').Valid) 'A census dated after today was accepted.'
$census.census.checkedAt = 'yesterday'
Assert-True (-not (Test-SourceCensus -Ledger $census -Today '2026-10-01').Valid) 'A census with no date was accepted.'

$listings = Copy-Json $ledger
foreach ($index in $listings.indexes) { $index.hushfacebook = [pscustomobject]@{ status = 'listed'; url = 'https://example.com/listing'; checked = '2026-09-25' } }
Assert-True (Test-SourceListings -Ledger $listings).Valid 'Every index listing Hushfacebook was refused.'
$listings.indexes[0].hushfacebook = [pscustomobject]@{ status = 'submitted'; url = 'https://example.com/issue/1'; submitted = '2026-09-25' }
Assert-True (Test-SourceListings -Ledger $listings).Valid 'A dated submission was not accepted in place of a listing.'
$listings.indexes[1].hushfacebook = [pscustomobject]@{ status = 'not-listed'; checked = '2026-09-25' }
$pending = Test-SourceListings -Ledger $listings
Assert-True (-not $pending.Valid -and $pending.Pending -contains [string]$listings.indexes[1].name) `
    'An index with neither a listing nor a submission was accepted.'

# Test-SourceReleaseGate reads the ledger where the release does, so it gets a root of its own.
$gateRoot = Join-Path $caseRoot 'gate'
New-Item -ItemType Directory -Path (Join-Path $gateRoot 'sources') -Force | Out-Null
foreach ($name in @('NOTICE', 'provenance.json', 'patches-list.json')) {
    Copy-Item -LiteralPath (Join-Path $Root $name) -Destination (Join-Path $gateRoot $name)
}
function Save-GateLedger {
    param([string]$CheckedAt, [switch]$Pending)
    $copy = Copy-Json $ledger
    $copy.census.checkedAt = $CheckedAt
    foreach ($index in $copy.indexes) {
        $index.hushfacebook = if ($Pending) { [pscustomobject]@{ status = 'not-listed'; checked = $CheckedAt } } else {
            [pscustomobject]@{ status = 'listed'; url = 'https://example.com/listing'; checked = $CheckedAt } }
    }
    # Every date the audit's clean run stamps is set here, or a ledger stamped after these fixed
    # days would put a record after the gate's today and fail the case for the wrong reason.
    foreach ($entry in $copy.entries) { $entry.lastChecked = $CheckedAt }
    foreach ($item in @($copy.outOfScope)) { $item.lastChecked = $CheckedAt }
    [IO.File]::WriteAllText((Get-SourceLedgerPath -Root $gateRoot), ($copy | ConvertTo-Json -Depth 20))
}
Save-GateLedger -CheckedAt '2026-09-25'
$gate = Test-SourceReleaseGate -Root $gateRoot -Today '2026-10-09'
Assert-True $gate.Valid "The release gate refused a census 14 days old: $($gate.Reason)"
Assert-True ($gate.Summary -like '*14 day(s) old*') "The release gate did not say how old the census is: $($gate.Summary)"
Assert-True ($gate.Summary -like "*$($availabilityCounts.activeSources) active, $($availabilityCounts.retiredSources) retired, $($availabilityCounts.unavailableSources) unavailable*") `
    'The release gate counted historical records as active sources.'
$gate = Test-SourceReleaseGate -Root $gateRoot -Today '2026-10-10'
Assert-True (-not $gate.Valid -and $gate.Reason -like '*15 days old*audit-facebook-sources.ps1*') "The release gate accepted a stale census: $($gate.Reason)"
Save-GateLedger -CheckedAt '2026-09-25' -Pending
$gate = Test-SourceReleaseGate -Root $gateRoot -Today '2026-09-26'
# An index that doesn't list Hushfacebook yet is named, not refused: a submission is a public
# request on someone else's project, so a release can't be made to wait on it.
Assert-True ($gate.Valid -and $gate.Summary -like '*Hushfacebook is not listed on *yet and has no submission recorded there*') "The release gate didn't name the indexes that don't list Hushfacebook: $($gate.Summary) $($gate.Reason)"
Remove-Item -LiteralPath (Get-SourceLedgerPath -Root $gateRoot)
$gate = Test-SourceReleaseGate -Root $gateRoot -Today '2026-09-26'
Assert-True (-not $gate.Valid -and $gate.Reason -like '*ledger is missing*') "The release gate accepted a missing ledger: $($gate.Reason)"

Write-Host '[sources] the census holds to 14 days and every index needs a listing or a dated submission'

# --- the audit, against stand-ins for every forge and index -----------------------------------------

$auditScript = Join-Path $PSScriptRoot 'audit-facebook-sources.ps1'
$fixtureRoot = Join-Path $caseRoot 'audit'
New-Item -ItemType Directory -Path (Join-Path $fixtureRoot 'sources'), (Join-Path $fixtureRoot 'patches'), (Join-Path $fixtureRoot 'extensions') -Force | Out-Null
# The fixture's alpha source is adopted, so its root carries the NOTICE entry and the provenance
# rule an adopted source needs, and the catalog whose two builds its receipt has to prove.
Copy-Item -LiteralPath (Join-Path $Root 'patches-list.json') -Destination (Join-Path $fixtureRoot 'patches-list.json')
$adoptedCommit = 'ad' * 20
$declaredBuilds = @((Get-PatchTarget -PatchList ([IO.File]::ReadAllText((Join-Path $Root 'patches-list.json')) | ConvertFrom-Json)).PackageVersions)
Assert-True ($declaredBuilds.Count -ge 2) "The catalog declares $($declaredBuilds.Count) build(s), so the receipt cases would prove nothing."
[IO.File]::WriteAllText((Join-Path $fixtureRoot 'NOTICE'), "Fixture NOTICE`n  alpha  https://github.com/fixture-owner/alpha-patches`n")
[IO.File]::WriteAllText((Join-Path $fixtureRoot 'provenance.json'), (@{ rules = @(@{ paths = @('patches/**'); origin = 'ported'
    upstream = 'https://github.com/fixture-owner/alpha-patches'; commit = $adoptedCommit; license = 'GPL-3.0'; via = @() }) } | ConvertTo-Json -Depth 6))
Set-Content -LiteralPath (Join-Path $fixtureRoot 'patches/Keep.kt') -Value 'class Keep' -Encoding ASCII
$receiptUrl = 'https://github.com/SysAdminDoc/Hushfacebook/releases/download/v9.9.9/release-receipt-9.9.9.json'
$fixtureLedgerPath = Get-SourceLedgerPath -Root $fixtureRoot
$fakeToken = 'fixture-token-' + [guid]::NewGuid().ToString('N')
$fakeGitLabToken = 'fixture-gitlab-' + [guid]::NewGuid().ToString('N')
$licenseText = "GNU GENERAL PUBLIC LICENSE`nVersion 3, 29 June 2007`n"
$licenseHash = Get-Sha256Text $licenseText
$licenseBase64 = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($licenseText))
$commitA1 = 'a1' * 20
$commitB1 = 'b1' * 20
$commitG1 = 'c1' * 20
$blobKnown = '1b' * 20
$blobMirror = '2b' * 20
$fixtureLedger = [ordered]@{
    schemaVersion = 1
    census = [ordered]@{ checkedAt = '2026-09-01'; skipped = @() }
    self = [ordered]@{ repository = 'https://github.com/SysAdminDoc/Hushfacebook' }
    officialBundle = [ordered]@{ repository = 'https://github.com/MorpheApp/morphe-patches'; branch = 'main'; list = 'patches-list.json'; packages = @() }
    indexes = @(
        [ordered]@{ id = 'morphe-directory'; name = 'Morphe community directory'; url = 'https://morphe-patches.software'
            hushfacebook = [ordered]@{ status = 'not-listed'; checked = '2026-09-01' } }
        [ordered]@{ id = 'awesome-morphe'; name = 'Awesome Morphe'; url = 'https://github.com/nvbangg/awesome-morphe'
            hushfacebook = [ordered]@{ status = 'submitted'; url = 'https://github.com/nvbangg/awesome-morphe/issues/1'; submitted = '2026-09-01' } }
        [ordered]@{ id = 'morphe-patch-tracker'; name = 'Morphe Patch Tracker'; url = 'https://drnx64.github.io/morphe-track-patches/'
            hushfacebook = [ordered]@{ status = 'listed'; url = 'https://drnx64.github.io/morphe-track-patches/#/bundle/sysadmindoc'; checked = '2026-09-01' } }
        [ordered]@{ id = 'jman-bundles'; name = 'Jman''s ReVanced Patch Bundles'; url = 'https://github.com/Jman-Github/ReVanced-Patch-Bundles'
            hushfacebook = [ordered]@{ status = 'not-listed'; checked = '2026-09-01' } }
        [ordered]@{ id = 'morphe-archive'; name = 'Morphe Archive'; url = 'https://rushiforai.github.io/morphe-archive/'
            hushfacebook = [ordered]@{ status = 'listed'; url = 'https://github.com/rushiforai/morphe-archive'; checked = '2026-09-01' } }
    )
    entries = @(
        [ordered]@{ id = 'alpha'; repository = 'https://github.com/fixture-owner/alpha-patches'; lineage = 'alpha'; upstream = $null
            kind = 'morphe-patches'; packages = @('com.facebook.katana'); targetVersions = [ordered]@{ 'com.facebook.katana' = @('580.0.0.51.74') }
            features = @('Hide ads'); branches = @([ordered]@{ name = 'main'; commit = $commitA1 }); watchPaths = @()
            license = [ordered]@{ spdx = 'GPL-3.0'; url = "https://github.com/fixture-owner/alpha-patches/blob/$commitA1/LICENSE"; sha256 = $licenseHash }
            contaminatedBy = $null; disposition = 'adopted'; reason = 'A fixture source.'; archived = $false
            adopted = [ordered]@{ commit = $adoptedCommit; fixtures = [ordered]@{ receipt = $receiptUrl; builds = $declaredBuilds } }
            forks = @('someone/alpha-patches'); contentHashes = @($blobKnown)
            mirrors = @([ordered]@{ repository = 'https://github.com/copier/alpha-copy'; reason = 'A fixture copy.'; blobs = @($blobMirror) })
            lastChecked = '2026-09-01' }
        [ordered]@{ id = 'beta'; repository = 'https://github.com/fixture-owner/beta-module'; lineage = 'beta'; upstream = $null
            kind = 'xposed-module'; packages = @('com.facebook.orca'); targetVersions = [ordered]@{ 'com.facebook.orca' = @() }
            features = @('Hide inbox ads'); branches = @([ordered]@{ name = 'main'; commit = $commitB1 }); watchPaths = @('app/messenger')
            license = $null; contaminatedBy = $null; disposition = 'behavior-only'; reason = 'A fixture module with no licence.'; archived = $false
            forks = @(); contentHashes = @(); mirrors = @(); lastChecked = '2026-09-01' }
        [ordered]@{ id = 'gamma'; repository = 'https://gitlab.com/fixture-group/gamma-patches'; lineage = 'gamma'; upstream = $null
            kind = 'revanced-patches'; packages = @('com.facebook.lite'); targetVersions = [ordered]@{ 'com.facebook.lite' = @() }
            features = @('Open links outside'); branches = @([ordered]@{ name = 'main'; commit = $commitG1 }); watchPaths = @()
            license = [ordered]@{ spdx = 'GPL-3.0'; url = "https://gitlab.com/fixture-group/gamma-patches/-/blob/$commitG1/LICENSE"; sha256 = $licenseHash }
            contaminatedBy = $null; disposition = 'candidate'; reason = 'A fixture GitLab source.'; archived = $false
            forks = @(); contentHashes = @(); mirrors = @(); lastChecked = '2026-09-01' }
    )
    outOfScope = @([ordered]@{ repository = 'https://github.com/noise/mentions-facebook'; reason = 'Names the package in a list.'; lastChecked = '2026-09-01' })
}
$fixtureLedgerText = ($fixtureLedger | ConvertTo-Json -Depth 20) -replace "`r`n", "`n"
function Reset-FixtureLedger { [IO.File]::WriteAllText($fixtureLedgerPath, $fixtureLedgerText, (New-Object Text.UTF8Encoding $false)) }
Reset-FixtureLedger
Assert-True (Test-SourceLedger -Ledger ($fixtureLedgerText | ConvertFrom-Json) -Root $fixtureRoot -Today '2026-09-25').Valid `
    'The audit fixture ledger breaks the rules, so the audit would stop before any case below.'

# What each forge and index answers. A case changes one answer and puts it back.
function New-FakeAnswers {
    $tick = [string][char]96 * 3
    $answers = [ordered]@{
        official = @{ Status = 200; Content = '{"patches":[{"name":"Example","compatiblePackages":{"com.google.android.youtube":["20.1"]}}]}' }
        directory = @{ Status = 200; Content = (@{
            bundles = @(@{ source = 'github'; repo = 'fixture-owner/alpha-patches'; name = 'Alpha'; targetApps = @('com.facebook.katana')
                patches = @(@{ name = 'Hide ads'; compatiblePackagesKey = 0 }) })
            compatibilities = @(@{ packageName = 'com.facebook.katana'; targets = @(@{ version = '580.0.0.51.74' }) }) } | ConvertTo-Json -Depth 8) }
        awesome = @{ Status = 200; Content = '{"fixture-owner/alpha-patches":{"com.facebook.katana":"0123"},"SysAdminDoc/hushfeed":{"com.zhiliaoapp.musically":"4567"}}' }
        tracker = @{ Status = 200; Content = (@{
            'sysadmindoc:stable' = @{ repo_url = 'https://github.com/SysAdminDoc/Hushfacebook'; apps = @(@{ package = 'com.facebook.katana'; patches = @(@{ name = 'Hide sponsored posts' }) }) }
            'alpha:stable' = @{ repo_url = 'https://github.com/fixture-owner/alpha-patches'; apps = @(@{ package = 'com.facebook.katana'; patches = @(@{ name = 'Hide ads' }) }) }
        } | ConvertTo-Json -Depth 8) }
        jmanSources = @{ Status = 200; Content = '{"alpha-stable":{"patches":"https://api.github.com/repos/fixture-owner/alpha-patches"},"gamma-stable":{"patches":"https://gitlab.com/api/v4/projects/fixture-group%2Fgamma-patches"}}' }
        jmanCatalog = @{ Status = 200; Content = ("# Catalog`n| [Alpha](#alpha) | 1 | 1 | Generated |`n### X Alpha Bundle Patch List:`n" +
            "| **Name** | **Description** | **Compatible Apps** | **Compatible Versions** |`n|---|---|---|---|`n" +
            "| ${tick}Hide ads${tick} | ${tick}Removes ads.${tick} | ${tick}Facebook${tick} | ${tick}580.0.0.51.74${tick} |`n" +
            "### X Gamma Bundle Patch List:`n| ${tick}Open links outside${tick} | ${tick}d${tick} | ${tick}Facebook Lite${tick} | ${tick}Any${tick} |`n") }
        archive = @{ Status = 200; Content = '{"name":"patches-list.json"}' }
        searchHits = @(
            @{ repository = @{ full_name = 'fixture-owner/alpha-patches' }; path = 'patches/Alpha.kt'; sha = $blobKnown }
            @{ repository = @{ full_name = 'copier/alpha-copy' }; path = 'patches/Alpha.kt'; sha = $blobMirror }
            @{ repository = @{ full_name = 'clone/alpha-clone' }; path = 'src/Alpha.kt'; sha = $blobKnown }
            @{ repository = @{ full_name = 'rushiforai/morphe-archive' }; path = 'examplepatches/fixture-owner/alpha-patches/patches-list.json'; sha = ('3b' * 20) }
            @{ repository = @{ full_name = 'rushiforai/morphe-archive' }; path = 'examplepatches/Jman-Github/ReVanced-Patch-Bundles/patch-bundles/x/y-patches-list.json'; sha = ('4b' * 20) }
            @{ repository = @{ full_name = 'noise/mentions-facebook' }; path = 'list.txt'; sha = ('5b' * 20) }
            @{ repository = @{ full_name = 'SysAdminDoc/Hushfacebook' }; path = 'patches-list.json'; sha = ('6b' * 20) }
            # The archive keeps a recorded fork's patch list for its entry's own package, which is no bundle of its own.
            @{ repository = @{ full_name = 'rushiforai/morphe-archive' }; path = 'examplepatches/someone/alpha-patches/patches-list.json'; sha = ('7b' * 20) }
        )
        orcaListHits = @()
        alphaRepo = @{ Status = 200; Content = '{"full_name":"fixture-owner/alpha-patches","archived":false,"default_branch":"main"}' }
        alphaLicense = @{ Status = 200; Content = (@{ path = 'LICENSE'; content = $licenseBase64; license = @{ spdx_id = 'GPL-3.0' } } | ConvertTo-Json) }
        alphaBranches = @{ Status = 200; Content = "[{`"name`":`"main`",`"commit`":{`"sha`":`"$commitA1`"}}]" }
        alphaForks = @{ Status = 200; Content = '[{"full_name":"someone/alpha-patches"}]' }
        compare = @{}
        betaRepo = @{ Status = 200; Content = '{"full_name":"fixture-owner/beta-module","archived":false,"default_branch":"main"}' }
        betaLicense = @{ Status = 404; Content = $null }
        betaBranches = @{ Status = 200; Content = "[{`"name`":`"main`",`"commit`":{`"sha`":`"$('b9' * 20)`"}}]" }
        betaWatch = @{ Status = 200; Content = "[{`"sha`":`"$commitB1`",`"commit`":{`"committer`":{`"date`":`"2026-09-01T10:00:00Z`"}}}]" }
        betaTree = @{ Status = 200; Content = '{"tree":[{"path":"app/messenger","type":"tree"}],"truncated":false}' }
        betaHistoryTree = @{ Status = 200; Content = '{"tree":[{"path":"app/messenger","type":"tree"}],"truncated":false}' }
        betaForks = @{ Status = 200; Content = '[]' }
        gammaProject = @{ Status = 200; Content = '{"path_with_namespace":"fixture-group/gamma-patches","archived":false,"default_branch":"main"}' }
        gammaTree = @{ Status = 200; Content = '[{"type":"blob","name":"LICENSE","path":"LICENSE"},{"type":"tree","name":"patches","path":"patches"}]' }
        gammaSourceTree = @{ Status = 200; Content = '[{"type":"tree","name":"patches","path":"patches"}]' }
        gammaWatch = @{ Status = 200; Content = "[{`"id`":`"$commitG1`",`"committed_date`":`"2026-09-01T10:00:00Z`"}]" }
        gammaLicense = @{ Status = 200; Content = (@{ file_name = 'LICENSE'; content = $licenseBase64 } | ConvertTo-Json) }
        gammaBranches = @{ Status = 200; Content = "[{`"name`":`"main`",`"commit`":{`"id`":`"$commitG1`"}}]" }
        gammaForks = @{ Status = 200; Content = '[]' }
        gitlabSearch = @{ Status = 200; Content = '[{"project_id":303,"path":"patches/Lite.kt"}]' }
        gitlabSearchProject = @{ Status = 200; Content = '{"path_with_namespace":"fixture-group/gamma-patches"}' }
        repoMeta = @{ Status = 200; Content = '{"full_name":"newcomer/fb-patches","license":{"spdx_id":"MIT"},"fork":false,"archived":false,"pushed_at":"2026-09-20T00:00:00Z","description":"Facebook patches"}' }
        oldNameMeta = @{ Status = 200; Content = '{"full_name":"fixture-owner/alpha-patches","fork":false,"archived":false}' }
        receipt = @{ Status = 200; Content = (@{ targets = @($declaredBuilds | ForEach-Object {
            @{ source = @{ versionName = $_; forced = $false }; patches = @(@{ name = 'Hide ads'; applied = $true }) } }) } | ConvertTo-Json -Depth 8) }
    }
    return $answers
}
$fakeForge = @{ Answers = (New-FakeAnswers); Requests = (New-Object System.Collections.Generic.List[object]) }

& {
    # Stands in for every request the audit makes, so no case needs the network. A request it
    # doesn't recognize fails the case that made it.
    function Invoke-WebRequest {
        param($Uri, $Headers, $UserAgent, [switch]$UseBasicParsing, $TimeoutSec, $Method, $OutFile, $MaximumRedirection, [switch]$PassThru)
        $url = [string]$Uri
        $authorization = if ($Headers -and $Headers.ContainsKey('Authorization')) { [string]$Headers['Authorization'] } else { $null }
        $privateToken = if ($Headers -and $Headers.ContainsKey('PRIVATE-TOKEN')) { [string]$Headers['PRIVATE-TOKEN'] } else { $null }
        $fakeForge.Requests.Add([pscustomobject]@{ Uri = $url; Authorization = $authorization; PrivateToken = $privateToken })
        $a = $fakeForge.Answers
        $answer = $null
        switch -Regex ($url) {
            '^https://raw\.githubusercontent\.com/MorpheApp/morphe-patches/main/patches-list\.json$' { $answer = $a.official; break }
            '^https://morphe-patches\.software/data/bundles\.json$' { $answer = $a.directory; break }
            '^https://raw\.githubusercontent\.com/nvbangg/awesome-morphe/main/data/hashes\.json$' { $answer = $a.awesome; break }
            '^https://raw\.githubusercontent\.com/drnx64/morphe-track-patches/main/data/bundles\.json$' { $answer = $a.tracker; break }
            '^https://raw\.githubusercontent\.com/Jman-Github/ReVanced-Patch-Bundles/bundles/patch-bundles/bundle-sources\.json$' { $answer = $a.jmanSources; break }
            '^https://raw\.githubusercontent\.com/Jman-Github/ReVanced-Patch-Bundles/bundles/patch-bundles/PATCH-LIST-CATALOG\.md$' { $answer = $a.jmanCatalog; break }
            '^https://api\.github\.com/repos/rushiforai/morphe-archive/contents/examplepatches/SysAdminDoc/Hushfacebook/patches-list\.json$' { $answer = $a.archive; break }
            '^https://api\.github\.com/search/code\?q=([^&]+)&per_page=100&page=1$' {
                $query = [Uri]::UnescapeDataString($Matches[1])
                $items = if ($query -eq '"com.facebook.katana" bytecodePatch') { @($a.searchHits) }
                    elseif ($query -eq '"com.facebook.orca" filename:patches-list.json') { @($a.orcaListHits) } else { @() }
                $answer = @{ Status = 200; Content = (@{ total_count = $items.Count; incomplete_results = $false; items = $items } | ConvertTo-Json -Depth 8) }
                break
            }
            '^https://api\.github\.com/repos/fixture-owner/alpha-patches$' { $answer = $a.alphaRepo; break }
            '^https://api\.github\.com/repos/fixture-owner/alpha-patches/license$' { $answer = $a.alphaLicense; break }
            '^https://api\.github\.com/repos/fixture-owner/alpha-patches/branches\?per_page=100&page=1$' { $answer = $a.alphaBranches; break }
            '^https://api\.github\.com/repos/fixture-owner/alpha-patches/forks\?per_page=100&page=1$' { $answer = $a.alphaForks; break }
            '^https://api\.github\.com/repos/fixture-owner/alpha-patches/compare/([0-9a-f]{40})\.\.\.([0-9a-f]{40})$' {
                $status = $a.compare[$Matches[2]]
                if ($status) { $answer = @{ Status = 200; Content = "{`"status`":`"$status`"}" } }
                break
            }
            '^https://api\.github\.com/repos/fixture-owner/beta-module$' { $answer = $a.betaRepo; break }
            '^https://api\.github\.com/repos/fixture-owner/beta-module/license$' { $answer = $a.betaLicense; break }
            '^https://api\.github\.com/repos/fixture-owner/beta-module/branches\?per_page=100&page=1$' { $answer = $a.betaBranches; break }
            '^https://api\.github\.com/repos/fixture-owner/beta-module/commits\?sha=main&path=app%2Fmessenger&per_page=1$' { $answer = $a.betaWatch; break }
            '^https://api\.github\.com/repos/fixture-owner/beta-module/git/trees/([0-9a-f]{40})\?recursive=1$' {
                $answer = if ($Matches[1] -eq $commitB1) { $a.betaHistoryTree } else { $a.betaTree }
                break
            }
            '^https://api\.github\.com/repos/fixture-owner/beta-module/forks\?per_page=100&page=1$' { $answer = $a.betaForks; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches$' { $answer = $a.gammaProject; break }
            '^https://gitlab\.com/api/v4/search\?scope=blobs&search=([^&]+)&per_page=100&page=1$' {
                $package = [Uri]::UnescapeDataString($Matches[1])
                $answer = if ($package -eq '"com.facebook.lite"') { $a.gitlabSearch } else { @{ Status = 200; Content = '[]' } }
                break
            }
            '^https://gitlab\.com/api/v4/projects/303$' { $answer = $a.gitlabSearchProject; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches/repository/tree\?ref=main&per_page=100&page=1$' { $answer = $a.gammaTree; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches/repository/tree\?ref=[0-9a-f]{40}&per_page=100&page=1$' { $answer = $a.gammaSourceTree; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches/repository/commits\?ref_name=main&path=patches&per_page=1$' { $answer = $a.gammaWatch; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches/repository/files/LICENSE\?ref=main$' { $answer = $a.gammaLicense; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches/repository/branches\?per_page=100&page=1$' { $answer = $a.gammaBranches; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches/forks\?per_page=100&page=1$' { $answer = $a.gammaForks; break }
            '^https://api\.github\.com/repos/(newcomer/fb-patches|clone/alpha-clone)$' { $answer = $a.repoMeta; break }
            '^https://api\.github\.com/repos/fixture-owner/alpha-old$' { $answer = $a.oldNameMeta; break }
            '^https://github\.com/SysAdminDoc/Hushfacebook/releases/download/v9\.9\.9/release-receipt-9\.9\.9\.json$' { $answer = $a.receipt; break }
        }
        if ($null -eq $answer) { throw "The audit made a request no stand-in answers: $url" }
        if ($answer.Status -ne 200) {
            $failure = New-Object System.Exception "Response status code does not indicate success: $($answer.Status)."
            Add-Member -InputObject $failure -NotePropertyName Response -NotePropertyValue ([pscustomobject]@{ StatusCode = $answer.Status })
            throw $failure
        }
        return [pscustomobject]@{ StatusCode = 200; Content = [string]$answer.Content }
    }

    function Invoke-Audit {
        param([hashtable]$Extra = @{})
        $report = Join-Path $caseRoot ('report-' + [guid]::NewGuid().ToString('N') + '.json')
        $fakeForge.Requests.Clear()
        $arguments = @{ Root = $fixtureRoot; GitHubToken = $fakeToken; GitLabToken = $fakeGitLabToken; SearchDelaySeconds = 0
            RateLimitWaitSeconds = 0; Today = '2026-09-25'; ReportPath = $report }
        foreach ($key in $Extra.Keys) { $arguments[$key] = $Extra[$key] }
        $global:LASTEXITCODE = 0
        $said = @(& $auditScript @arguments 6>&1 | ForEach-Object { "$_" }) -join "`n"
        $code = $LASTEXITCODE
        $document = if (Test-Path -LiteralPath $report) { [IO.File]::ReadAllText($report) | ConvertFrom-Json } else { $null }
        return [pscustomobject]@{ ExitCode = $code; Said = $said; Report = $document; ReportText = $(if ($document) { [IO.File]::ReadAllText($report) } else { '' }) }
    }

    function Get-TreeState {
        # Every file under the fixture root with its hash, the ledger included.
        return @(Get-ChildItem -LiteralPath $fixtureRoot -Recurse -File | Sort-Object FullName | ForEach-Object {
            $_.FullName.Substring($fixtureRoot.Length) + ' ' + (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash })
    }

    function Assert-Drift {
        param([string]$Kind, [string]$Detail, [string]$Case)
        $beforeLedger = [IO.File]::ReadAllText($fixtureLedgerPath)
        $result = Invoke-Audit
        $found = @($result.Report.findings | Where-Object { $_.kind -eq $Kind -and "$($_.repository) $($_.detail)" -like $Detail })
        Assert-True ($result.ExitCode -eq 1) "$Case exited $($result.ExitCode), not 1: $($result.Said)"
        Assert-True ($found.Count -gt 0) "$Case was not reported as $Kind ($Detail): $(@($result.Report.findings | ForEach-Object { "$($_.kind): $($_.repository) $($_.detail)" }) -join ' | ')"
        Assert-True ([IO.File]::ReadAllText($fixtureLedgerPath) -ceq $beforeLedger) "$Case changed the ledger although the audit found drift."
    }

    function Assert-Incomplete {
        param([hashtable]$Extra, [string]$Kind, [string]$Detail, [string]$Case)
        $beforeLedger = [IO.File]::ReadAllText($fixtureLedgerPath)
        $result = Invoke-Audit $Extra
        Assert-True ($result.ExitCode -eq 1 -and $null -ne $result.Report -and -not $result.Report.clean) `
            "$Case was accepted as a clean audit: $($result.Said)"
        $found = @($result.Report.findings | Where-Object { $_.kind -eq $Kind -and $_.detail -like $Detail })
        Assert-True ($found.Count -eq 1 -and $found[0].evidence.index -eq 'gitlab-code-search' -and
            $found[0].evidence.documentation -contains 'https://docs.gitlab.com/user/search/advanced_search/' -and
            $found[0].evidence.documentation -contains 'https://docs.gitlab.com/user/search/exact_code_search/') `
            "$Case did not retain the unavailable global-index evidence."
        Assert-True (@($result.Report.sources | Where-Object { $_.source -eq 'https://gitlab.com/fixture-group/gamma-patches' -and $_.status -eq 'read' }).Count -eq 1) `
            "$Case stopped the remaining GitLab ledger reads."
        Assert-True ([IO.File]::ReadAllText($fixtureLedgerPath) -ceq $beforeLedger) "$Case stamped or otherwise changed the ledger."
    }

    # The control: nothing moved. Only dates change in the ledger, nothing else under the root
    # changes, and the copy with the lineage's own blob counts as that lineage.
    $before = Get-TreeState
    $clean = Invoke-Audit
    Assert-True ($clean.ExitCode -eq 0) ("The audit refused a fixture where nothing moved: " +
        (@($clean.Report.findings | ForEach-Object { "$($_.kind): $($_.repository) $($_.detail)" }) -join ' | ') + "`n$($clean.Said)")
    Assert-True ($clean.Report.clean -and @($clean.Report.sources | Where-Object { $_.status -ne 'read' }).Count -eq 0 -and
        @($fakeForge.Requests | Where-Object { $_.Uri -like 'https://gitlab.com/api/v4/search*' }).Count -eq 3 -and
        @($clean.Report.knownHits | Where-Object { $_.repository -eq 'https://gitlab.com/fixture-group/gamma-patches' }).Count -eq 1) `
        'The control stamped its census without searching every Facebook-family package on GitLab and resolving its hit.'
    $stamped = [IO.File]::ReadAllText($fixtureLedgerPath)
    Assert-True (($stamped -replace '\d{4}-\d{2}-\d{2}', 'DATE') -ceq ($fixtureLedgerText -replace '\d{4}-\d{2}-\d{2}', 'DATE')) `
        'The clean audit changed more of the ledger than its dates.'
    $stampedLedger = $stamped | ConvertFrom-Json
    Assert-True ($stampedLedger.census.checkedAt -eq '2026-09-25' -and @($stampedLedger.entries | Where-Object { $_.lastChecked -ne '2026-09-25' }).Count -eq 0 -and
        $stampedLedger.indexes[2].hushfacebook.checked -eq '2026-09-25' -and $stampedLedger.indexes[1].hushfacebook.submitted -eq '2026-09-01') `
        'The clean audit did not stamp the census and every checked record with today, or it moved a submission date.'
    $after = Get-TreeState
    $changed = @(Compare-Object $before $after | ForEach-Object { ($_.InputObject -split ' ')[0] } | Sort-Object -Unique)
    Assert-True ($changed.Count -eq 1 -and $changed[0] -like '*facebook-sources.json') `
        "The audit wrote more than the ledger's dates under the root: $($changed -join ', ')"
    Assert-True ($clean.Report.counts.lineages -eq 3 -and $clean.Report.counts.mirrorsCollapsed -eq 1) `
        "The clean audit did not count three lineages with one copy collapsed: $($clean.Report.counts | ConvertTo-Json -Compress)"
    Assert-True ($clean.Report.counts.sources -eq 3 -and $clean.Report.counts.activeSources -eq 3 -and
        $clean.Report.counts.historicalSources -eq 0) 'Existing entries without an availability record stopped counting as active.'
    Assert-True (@($clean.Report.notes | Where-Object { $_ -like '*clone/alpha-clone is a byte-for-byte copy*alpha lineage*' }).Count -eq 1) `
        "The copy of the alpha lineage's file was not collapsed into it: $($clean.Report.notes -join ' | ')"
    Assert-True (@($clean.Report.lineages | Where-Object { $_.lineage -eq 'alpha' })[0].mirrors -contains 'https://github.com/clone/alpha-clone') `
        'The collapsed copy was not listed under its lineage.'
    $leaked = @($fakeForge.Requests | Where-Object { $_.Authorization -and $_.Uri -notlike 'https://api.github.com/*' })
    Assert-True ($leaked.Count -eq 0) "The GitHub token went to another host: $($leaked[0].Uri)"
    Assert-True (@($fakeForge.Requests | Where-Object { $_.Uri -like 'https://api.github.com/*' -and $_.Authorization -ne "Bearer $fakeToken" }).Count -eq 0) `
        'A GitHub API request went out without the token.'
    Assert-True ($clean.ReportText.IndexOf($fakeToken) -lt 0 -and $stamped.IndexOf($fakeToken) -lt 0) 'The token was written to the report or the ledger.'
    Assert-True (@($fakeForge.Requests | Where-Object { $_.PrivateToken -and $_.Uri -notlike 'https://gitlab.com/*' }).Count -eq 0 -and
        @($fakeForge.Requests | Where-Object { $_.Uri -like 'https://gitlab.com/api/*' -and $_.PrivateToken -ne $fakeGitLabToken }).Count -eq 0 -and
        $clean.ReportText.IndexOf($fakeGitLabToken) -lt 0 -and $stamped.IndexOf($fakeGitLabToken) -lt 0) `
        'The GitLab token leaked or a GitLab request lacked its private-token header.'
    Reset-FixtureLedger

    # Neither an explicit skip nor a missing token can certify a complete census. Its existing
    # skip and every date survive, even with -NoStamp or a token in the environment.
    $skippedLedger = $fixtureLedgerText | ConvertFrom-Json
    $skippedLedger.census.skipped = @('gitlab-code-search')
    $skippedLedgerText = $skippedLedger | ConvertTo-Json -Depth 20
    [IO.File]::WriteAllText($fixtureLedgerPath, $skippedLedgerText)
    foreach ($extra in @(@{ SkipGitLabCodeSearch = $true; GitLabToken = '' },
            @{ SkipGitLabCodeSearch = $true; GitLabToken = ''; NoStamp = $true }, @{ GitLabToken = '' })) {
        Assert-Incomplete $extra 'source-skipped' '*GitLab.com*global code search*' 'A skipped or unauthenticated global GitLab search'
        Assert-True (@($fakeForge.Requests | Where-Object { $_.Uri -like 'https://gitlab.com/api/v4/search*' }).Count -eq 0) `
            'GitLab code search ran although it was skipped or no token was present.'
    }
    $env:GITLAB_TOKEN = 'fixture-gitlab-' + [guid]::NewGuid().ToString('N')
    try {
        Assert-Incomplete @{ SkipGitLabCodeSearch = $true; GitLabToken = '' } 'source-skipped' '*GitLab.com*global code search*' `
            'An explicit global GitLab skip with a token in the environment'
    } finally { $env:GITLAB_TOKEN = $null }
    Assert-True (@($fakeForge.Requests | Where-Object { $_.Uri -like 'https://gitlab.com/api/v4/search*' }).Count -eq 0) `
        'GitLab code search ran although -SkipGitLabCodeSearch was passed.'
    Assert-True (@(([IO.File]::ReadAllText($fixtureLedgerPath) | ConvertFrom-Json).census.skipped) -contains 'gitlab-code-search') `
        'The census stopped recording the GitLab skip because a token was set.'
    Reset-FixtureLedger

    $fakeForge.Answers.gitlabSearch = @{ Status = 403; Content = $null }
    Assert-Incomplete @{} 'source-failed' '*GitLab code search*HTTP 403*global code search*' 'A denied global GitLab search'
    $fakeForge.Answers = New-FakeAnswers
    $fakeForge.Answers.gitlabSearchProject = @{ Status = 403; Content = $null }
    Assert-Incomplete @{} 'source-failed' '*GitLab project 303*HTTP 403*' 'A GitLab search hit whose project cannot be read'
    $fakeForge.Answers = New-FakeAnswers
    $fakeForge.Answers.gitlabSearch.Content = '[{"path":"patches/Lite.kt"}]'
    Assert-Incomplete @{} 'source-failed' '*hit without a project ID or path*' 'A GitLab search hit with incomplete metadata'
    $fakeForge.Answers = New-FakeAnswers
    $fakeForge.Answers.gitlabSearchProject.Content = '{}'
    Assert-Incomplete @{} 'source-failed' '*GitLab project 303*no repository path*' 'An unresolved GitLab repository path'
    $fakeForge.Answers = New-FakeAnswers

    # -ValidateOnly and an invalid ledger never reach the network.
    $validate = Invoke-Audit @{ ValidateOnly = $true }
    Assert-True ($validate.ExitCode -eq 0 -and $fakeForge.Requests.Count -eq 0 -and $validate.Said -like '*3 sources in 3 lineages*') `
        "-ValidateOnly made $($fakeForge.Requests.Count) requests or refused the fixture: $($validate.Said)"
    $broken = $fixtureLedgerText | ConvertFrom-Json
    $broken.entries[1].disposition = 'candidate'
    [IO.File]::WriteAllText($fixtureLedgerPath, ($broken | ConvertTo-Json -Depth 20))
    $invalid = Invoke-Audit
    Assert-True ($invalid.ExitCode -eq 1 -and $fakeForge.Requests.Count -eq 0 -and
        @($invalid.Report.findings | Where-Object { $_.kind -eq 'ledger-invalid' }).Count -gt 0) `
        "An invalid ledger was audited ($($fakeForge.Requests.Count) requests, exit $($invalid.ExitCode))."
    Reset-FixtureLedger

    # Each way a source can move, one at a time, each put back after.
    $fakeForge.Answers.directory.Content = $fakeForge.Answers.directory.Content.Replace('"repo":  "fixture-owner/alpha-patches"', '"repo":  "newcomer/fb-patches"').Replace(
        '"repo": "fixture-owner/alpha-patches"', '"repo": "newcomer/fb-patches"')
    Assert-True ($fakeForge.Answers.directory.Content -like '*newcomer/fb-patches*') 'The directory answer was not edited, so the addition case would prove nothing.'
    Assert-Drift 'addition' '*github.com/newcomer/fb-patches*Morphe directory*' 'A bundle only the directory knows'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.searchHits[2].sha = ('9b' * 20)
    Assert-Drift 'addition' '*github.com/clone/alpha-clone*GitHub code search*' 'A code search hit whose file no lineage holds'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.alphaLicense = @{ Status = 404; Content = $null }
    Assert-Drift 'license-removed' '*alpha-patches*licence*gone*' 'A source whose licence was removed'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.gammaLicense.Content = (@{ content = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('All rights reserved.')) } | ConvertTo-Json)
    Assert-Drift 'license-changed' '*gamma-patches*licence text changed*' 'A GitLab source whose licence text changed'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.alphaBranches.Content = $fakeForge.Answers.alphaBranches.Content.Replace($commitA1, ('a2' * 20))
    Assert-Drift 'changed-head' "*alpha-patches*branch main moved from $commitA1 to $('a2' * 20)*" 'A pinned branch that moved'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.betaWatch.Content = $fakeForge.Answers.betaWatch.Content.Replace($commitB1, ('b2' * 20))
    Assert-Drift 'changed-head' '*beta-module*branch main moved*' 'A watched path that moved under a branch whose head the ledger never pinned'
    $fakeForge.Answers = New-FakeAnswers

    # The last commit of a deleted path can equal its pin. Tree metadata, not that commit alone,
    # establishes whether the branch still holds the source. An incomplete tree proves no absence.
    $fakeForge.Answers.betaTree.Content = '{"tree":[],"truncated":false}'
    Assert-Drift 'changed-head' '*beta-module*to no Facebook-family code*' 'A deleted watched path whose last commit still equals its pin'
    $fakeForge.Answers.betaTree.Content = '{"tree":[],"truncated":true}'
    Assert-Drift 'source-failed' '*beta-module*truncated*' 'A truncated tree that could not prove the watched source absent'
    $fakeForge.Answers.betaTree.Content = '{"tree":[{"path":"app/Messenger","type":"tree"}],"truncated":false}'
    Assert-Drift 'changed-head' '*beta-module*to no Facebook-family code*' 'A watched path renamed with different case'
    $fakeForge.Answers.betaTree.Content = '{}'
    Assert-Drift 'source-failed' '*beta-module*no paths or truncation flag*' 'An invalid tree answer that could not prove source availability'
    $fakeForge.Answers = New-FakeAnswers

    # Retirement preserves the historical pin, the package/target record and licence disposition.
    # Current branches can keep moving through unrelated work without replacing that history.
    $historical = $fixtureLedgerText | ConvertFrom-Json
    $historical.entries[1] | Add-Member -NotePropertyName availability -NotePropertyValue ([pscustomobject]@{
        status = 'retired'; reason = 'The Messenger source was removed.'
        evidence = "https://github.com/fixture-owner/beta-module/commit/$('b9' * 20)" })
    $historicalText = $historical | ConvertTo-Json -Depth 20
    [IO.File]::WriteAllText($fixtureLedgerPath, $historicalText)
    $fakeForge.Answers.betaTree.Content = '{"tree":[],"truncated":false}'
    $retired = Invoke-Audit @{ NoStamp = $true }
    Assert-True ($retired.ExitCode -eq 0 -and $retired.Report.counts.sources -eq 3 -and
        $retired.Report.counts.activeSources -eq 2 -and $retired.Report.counts.retiredSources -eq 1 -and
        $retired.Report.counts.unavailableSources -eq 0 -and $retired.Report.counts.historicalSources -eq 1 -and
        [IO.File]::ReadAllText($fixtureLedgerPath) -ceq $historicalText) `
        "A retired source with reachable history did not preserve the census total and ledger: $($retired.Said)"
    $retiredSource = @($retired.Report.lineages | Where-Object { $_.lineage -eq 'beta' })[0].sources[0]
    Assert-True ($retiredSource.availability -eq 'retired' -and $retiredSource.disposition -eq 'behavior-only' -and
        $null -ne $retiredSource.targetVersions.PSObject.Properties['com.facebook.orca']) `
        'The report lost the retired source target record or conflated availability with its licence disposition.'
    $fakeForge.Answers.betaHistoryTree = @{ Status = 404; Content = $null }
    Assert-Drift 'historical-pin-unavailable' '*beta-module*retired source pin*unavailable*' 'A retired source whose historical path disappeared'
    $fakeForge.Answers = New-FakeAnswers
    Assert-Drift 'source-reactivated' '*beta-module*retired source*main again*' 'A retired source that returned on a current branch'

    $historical.entries[1].availability.status = 'unavailable'
    $unavailableText = $historical | ConvertTo-Json -Depth 20
    [IO.File]::WriteAllText($fixtureLedgerPath, $unavailableText)
    $fakeForge.Answers.betaTree.Content = '{"tree":[],"truncated":false}'
    $fakeForge.Answers.betaHistoryTree = @{ Status = 404; Content = $null }
    $unavailable = Invoke-Audit @{ NoStamp = $true }
    Assert-True ($unavailable.ExitCode -eq 0 -and $unavailable.Report.counts.sources -eq 3 -and
        $unavailable.Report.counts.activeSources -eq 2 -and $unavailable.Report.counts.unavailableSources -eq 1 -and
        $unavailable.Report.counts.historicalSources -eq 1 -and [IO.File]::ReadAllText($fixtureLedgerPath) -ceq $unavailableText) `
        "An explicitly unavailable history was not counted or preserved: $($unavailable.Said)"
    $fakeForge.Answers.betaHistoryTree = (New-FakeAnswers).betaHistoryTree
    Assert-Drift 'historical-pin-restored' '*beta-module*unavailable source pin*reachable again*' 'An unavailable historical source that became reachable'
    $fakeForge.Answers.betaHistoryTree = @{ Status = 404; Content = $null }
    $fakeForge.Answers.betaRepo = @{ Status = 404; Content = $null }
    $gone = Invoke-Audit @{ NoStamp = $true }
    Assert-True ($gone.ExitCode -eq 0) "A repository and history explicitly recorded as unavailable were refused: $($gone.Said)"
    $fakeForge.Answers.betaRepo = @{ Status = 500; Content = $null }
    Assert-Drift 'repository-gone' '*beta-module*HTTP 500*' 'An unavailable source with a transient server error'
    Reset-FixtureLedger
    $fakeForge.Answers = New-FakeAnswers

    # GitLab checks the same distinction through metadata, without fetching any source file.
    $gitlabWatched = $fixtureLedgerText | ConvertFrom-Json
    $gitlabWatched.entries[2].watchPaths = @('patches')
    [IO.File]::WriteAllText($fixtureLedgerPath, ($gitlabWatched | ConvertTo-Json -Depth 20))
    $gitlabControl = Invoke-Audit @{ NoStamp = $true }
    Assert-True ($gitlabControl.ExitCode -eq 0) "A watched GitLab source was refused: $($gitlabControl.Said)"
    $fakeForge.Answers.gammaSourceTree.Content = '[]'
    Assert-Drift 'changed-head' '*gamma-patches*to no Facebook-family code*' 'A deleted GitLab watched path whose last commit still equals its pin'
    Reset-FixtureLedger
    $fakeForge.Answers = New-FakeAnswers

    # A branch cut from main before its Facebook code last moved carries nothing new; one ahead of it does.
    $fakeForge.Answers.alphaBranches.Content = "[{`"name`":`"main`",`"commit`":{`"sha`":`"$commitA1`"}},{`"name`":`"old`",`"commit`":{`"sha`":`"$('a3' * 20)`"}}]"
    $fakeForge.Answers.compare[('a3' * 20)] = 'behind'
    $contained = Invoke-Audit
    Assert-True ($contained.ExitCode -eq 0) ("A branch behind a pinned one was reported: " +
        (@($contained.Report.findings | ForEach-Object { "$($_.kind): $($_.detail)" }) -join ' | '))
    Reset-FixtureLedger
    $fakeForge.Answers.compare[('a3' * 20)] = 'ahead'
    Assert-Drift 'new-branch' '*alpha-patches*branch old carries Facebook-family work*' 'A branch with work of its own'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.alphaForks.Content = '[{"full_name":"someone/alpha-patches"},{"full_name":"stranger/alpha-patches"}]'
    Assert-Drift 'unseen-fork' '*alpha-patches*fork stranger/alpha-patches*' 'A fork the ledger has not seen'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.gammaProject = @{ Status = 404; Content = $null }
    Assert-Drift 'repository-gone' '*gamma-patches*HTTP 404*' 'A GitLab source that is gone'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.alphaRepo.Content = $fakeForge.Answers.alphaRepo.Content.Replace('"archived":false', '"archived":true')
    Assert-Drift 'archived-changed' '*alpha-patches*archived*' 'A source that was archived'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.tracker.Content = $fakeForge.Answers.tracker.Content.Replace('SysAdminDoc/Hushfacebook', 'SysAdminDoc/hushfeed')
    Assert-Drift 'listing-changed' '*Morphe Patch Tracker no longer lists Hushfacebook*' 'A listing that disappeared'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.official.Content = '{"patches":[{"name":"Hide ads","compatiblePackages":[{"packageName":"com.facebook.orca"}]}]}'
    Assert-Drift 'official-bundle-changed' '*official bundle now patches*com.facebook.orca*' 'The official bundle taking on Messenger'
    $fakeForge.Answers = New-FakeAnswers

    # An adopted source's receipt has to prove every declared build, unforced.
    $fakeForge.Answers.receipt.Content = $fakeForge.Answers.receipt.Content -replace '"forced":\s*false', '"forced": true'
    Assert-Drift 'fixture-evidence' "*alpha-patches*no unforced run of Facebook $($declaredBuilds[0])*" 'An adopted source whose receipt forced a build'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.alphaRepo.Content = $fakeForge.Answers.alphaRepo.Content.Replace('"fixture-owner/alpha-patches"', '"fixture-owner/alpha-renamed"')
    Assert-Drift 'renamed' '*alpha-patches*now https://github.com/fixture-owner/alpha-renamed*' 'A source that was renamed'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.directory.Content = $fakeForge.Answers.directory.Content -replace '"com\.facebook\.katana"(\s*)\]', '"com.facebook.katana", "com.facebook.orca"$1]'
    Assert-True ($fakeForge.Answers.directory.Content -like '*com.facebook.orca*') 'The directory answer was not edited, so the packages case would prove nothing.'
    Assert-Drift 'packages-changed' '*alpha-patches*now targets com.facebook.orca*' 'A source an index says now targets Messenger'
    $fakeForge.Answers = New-FakeAnswers

    # A recorded fork or an out-of-scope repository that an index lists as a bundle of its own. The
    # control's archived copy of the fork's list, for alpha's own package, stayed quiet.
    foreach ($listed in @('someone/alpha-patches', 'noise/mentions-facebook')) {
        $fakeForge.Answers.directory.Content = $fakeForge.Answers.directory.Content.Replace('"repo":  "fixture-owner/alpha-patches"', "`"repo`":  `"$listed`"").Replace(
            '"repo": "fixture-owner/alpha-patches"', "`"repo`": `"$listed`"")
        Assert-True ($fakeForge.Answers.directory.Content -like "*$listed*") "The directory answer was not edited, so the $listed case would prove nothing."
        $expected = if ($listed -like 'someone/*') { "*github.com/$listed*recorded fork of alpha*Morphe directory*" } else { "*$listed*out of scope*Morphe directory*" }
        Assert-Drift 'listed-as-bundle' $expected "The directory listing $listed as a bundle"
        $fakeForge.Answers = New-FakeAnswers
    }
    $fakeForge.Answers.orcaListHits = @(@{ repository = @{ full_name = 'rushiforai/morphe-archive' }
        path = 'examplepatches/someone/alpha-patches/patches-list.json'; sha = ('7c' * 20) })
    Assert-Drift 'listed-as-bundle' '*someone/alpha-patches*com.facebook.orca*' 'A recorded fork whose archived patch list takes on Messenger'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.searchHits[1].sha = ('8b' * 20)
    Assert-Drift 'mirror-changed' '*copier/alpha-copy*' 'A recorded copy whose file changed'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.alphaBranches.Content = "[{`"name`":`"trunk`",`"commit`":{`"sha`":`"$commitA1`"}}]"
    Assert-Drift 'branch-removed' '*alpha-patches*branch main is gone*' 'A pinned branch that was deleted'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.betaLicense = @{ Status = 200; Content = (@{ path = 'LICENSE'; content = $licenseBase64; license = @{ spdx_id = 'MIT' } } | ConvertTo-Json) }
    Assert-Drift 'license-added' '*beta-module*now has a licence (MIT*' 'An unlicensed source that gained a licence'
    $fakeForge.Answers = New-FakeAnswers

    $tick = [string][char]96 * 3
    $fakeForge.Answers.jmanCatalog.Content += "### X Delta Bundle Patch List:`n| ${tick}Hide reels${tick} | ${tick}d${tick} | ${tick}Facebook${tick} | ${tick}Any${tick} |`n"
    Assert-Drift 'index-unresolved' "*Jman's catalog lists Facebook-family patches under 'Delta'*" 'A Jman section no repository stands behind'
    $fakeForge.Answers = New-FakeAnswers

    # An index still spelling a source by its old name is that source, not an addition.
    $fakeForge.Answers.directory.Content = $fakeForge.Answers.directory.Content -replace '"fixture-owner/alpha-patches"', '"fixture-owner/alpha-old"'
    $oldName = Invoke-Audit
    Assert-True ($oldName.ExitCode -eq 0 -and @($oldName.Report.notes | Where-Object { $_ -like '*alpha-old is an old name of*alpha-patches*' }).Count -eq 1) `
        ("An index spelling a source by its old name was not read as that source: " +
            (@($oldName.Report.findings | ForEach-Object { "$($_.kind): $($_.repository)" }) -join ' | '))
    Reset-FixtureLedger
    $fakeForge.Answers = New-FakeAnswers

    # An old name gets the checks the current name gets: here it's the recorded fork's old name,
    # listed as a bundle of its own.
    $fakeForge.Answers.directory.Content = $fakeForge.Answers.directory.Content -replace '"fixture-owner/alpha-patches"', '"fixture-owner/alpha-old"'
    $fakeForge.Answers.oldNameMeta.Content = '{"full_name":"someone/alpha-patches","fork":true,"archived":false}'
    Assert-Drift 'listed-as-bundle' '*github.com/someone/alpha-patches*recorded fork of alpha*' 'A recorded fork an index lists by its old name'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.awesome = @{ Status = 500; Content = $null }
    Assert-Drift 'source-failed' '*Awesome Morphe could not be read*' 'An index that could not be read'
    $fakeForge.Answers = New-FakeAnswers

    # A missing token is a reportable coverage gap, not a failure before the report is written.
    $env:GITLAB_TOKEN = $null
    Assert-Incomplete @{ GitLabToken = '' } 'source-skipped' '*GITLAB_TOKEN*' 'A global GitLab search without a token'
    Assert-Throws { Invoke-Audit @{ ReportPath = (Join-Path $fixtureRoot 'patches/report.json') } } '*under patches/*' `
        'The audit wrote its report among the patch sources.'
    Assert-True ([IO.File]::ReadAllText($fixtureLedgerPath) -ceq $fixtureLedgerText) 'A refused run changed the ledger.'
}

Write-Host '[sources] the audit reports every kind of drift, collapses copies by content and stamps only a clean census'

# --- the audit never imports code ----------------------------------------------------------------

# What the two files can do, read through the parser: no git, no archive or download tool, no
# -OutFile, nothing that copies or writes files except the audit's two WriteAllText calls, one for
# the report and one for the ledger's dates. Each forbidden shape is added to a copy, and the copy
# has to be caught, so the check can't pass by seeing nothing.
function Get-ImportProblems {
    param([string]$Text, [string]$Name)
    $tokens = $null
    $errors = $null
    $ast = [System.Management.Automation.Language.Parser]::ParseInput($Text, [ref]$tokens, [ref]$errors)
    if ($errors.Count -gt 0) { return @("$Name does not parse: $($errors[0].Message)") }
    $problems = New-Object System.Collections.Generic.List[string]
    $forbidden = @('git', 'git.exe', 'gh', 'curl', 'curl.exe', 'wget', 'Expand-Archive', 'Start-BitsTransfer', 'Copy-Item', 'Move-Item',
        'Set-Content', 'Add-Content', 'Out-File', 'Invoke-RestMethod', 'Export-Csv')
    foreach ($command in $ast.FindAll({ param($node) $node -is [System.Management.Automation.Language.CommandAst] }, $true)) {
        $commandName = $command.GetCommandName()
        if ($commandName -and ($forbidden -contains $commandName)) {
            # The token lookup for GitHub is the one gh call allowed: it prints a token, nothing more.
            if ($commandName -eq 'gh' -and $command.Extent.Text -match '^&\s*gh\s+auth\s+token\b') { continue }
            $problems.Add("$Name runs $commandName`: $($command.Extent.Text)")
        }
        foreach ($element in $command.CommandElements) {
            if ($element -is [System.Management.Automation.Language.CommandParameterAst] -and $element.ParameterName -eq 'OutFile') {
                $problems.Add("$Name downloads to a file: $($command.Extent.Text)")
            }
        }
    }
    $writes = 0
    foreach ($member in $ast.FindAll({ param($node) $node -is [System.Management.Automation.Language.InvokeMemberExpressionAst] }, $true)) {
        $memberName = [string]$member.Member.Extent.Text
        if ($memberName -in @('WriteAllBytes', 'Copy', 'Move', 'ExtractToDirectory', 'CreateFromDirectory', 'DownloadFile', 'AppendAllText')) {
            $problems.Add("$Name calls $memberName`: $($member.Extent.Text)")
        }
        if ($memberName -eq 'WriteAllText') { $writes++ }
    }
    $allowed = if ($Name -like 'audit*') { 2 } else { 0 }
    if ($writes -gt $allowed) { $problems.Add("$Name writes $writes files with WriteAllText, and only the report and the ledger stamp may.") }
    return $problems.ToArray()
}
$auditText = [IO.File]::ReadAllText($auditScript)
$libraryText = [IO.File]::ReadAllText((Join-Path $PSScriptRoot 'facebook-sources.ps1'))
foreach ($pair in @(@('audit-facebook-sources.ps1', $auditText), @('facebook-sources.ps1', $libraryText))) {
    $found = @(Get-ImportProblems -Text $pair[1] -Name $pair[0])
    Assert-True ($found.Count -eq 0) ($found -join ' | ')
}
foreach ($bad in @(
        @{ Line = '& git clone https://github.com/example/patches.git $env:TEMP'; Pattern = '*runs git*' }
        @{ Line = 'Invoke-WebRequest -Uri $uri -OutFile (Join-Path $rootPath ''patches/x.kt'')'; Pattern = '*downloads to a file*' }
        @{ Line = 'Copy-Item -LiteralPath $source -Destination $rootPath'; Pattern = '*runs Copy-Item*' }
        @{ Line = '[IO.Compression.ZipFile]::ExtractToDirectory($zip, $rootPath)'; Pattern = '*calls ExtractToDirectory*' }
        @{ Line = '[IO.File]::WriteAllText((Join-Path $rootPath ''patches/Ported.kt''), $code)'; Pattern = '*writes 3 files with WriteAllText*' }
        @{ Line = '& gh repo clone example/patches'; Pattern = '*runs gh*' })) {
    $found = @(Get-ImportProblems -Text ($auditText + "`n" + $bad.Line + "`n") -Name 'audit-facebook-sources.ps1 (copy)')
    Assert-True (@($found | Where-Object { $_ -like $bad.Pattern }).Count -gt 0) "The import check missed: $($bad.Line)"
}

Write-Host '[sources] the audit and its rules hold nothing that clones, downloads to disk or copies code'
Write-Host '[sources] source ledger contracts passed'
} finally {
    $env:GITLAB_TOKEN = $savedGitLabToken
    Remove-Item -LiteralPath $caseRoot -Recurse -Force -ErrorAction SilentlyContinue
}
