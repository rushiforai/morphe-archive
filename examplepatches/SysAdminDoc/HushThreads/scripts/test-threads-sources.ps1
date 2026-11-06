<#
.SYNOPSIS
    Hold the Threads source ledger and its audit to their rules, with no network.

.DESCRIPTION
    The checked-in ledger has to keep every rule of scripts/threads-sources.ps1, and
    README.md's source section can't link a source the ledger doesn't know or call a
    behavior-only source portable. Then each rule is broken once on a copy, and each has to be refused by name: an
    adopted source missing its pinned commit, compatible licence, NOTICE entry, provenance rule or
    two-fixture evidence, an unlicensed or contaminated source that isn't behavior-only, a
    provenance rule crediting a source the ledger doesn't allow, an index with no listing record.
    The checked-in ledger adopts nothing. The copy gets adopted, unlicensed and contaminated
    fixture sources so each rule has a case that breaks it. The census
    is held to its 14 days on both sides of the line.

    scripts/audit-threads-sources.ps1 then runs against a stand-in for every forge and index it
    reads, so nothing here touches the network: a request the stand-in doesn't know fails the case.
    A clean run stamps only dates and collapses a byte-for-byte copy into its lineage; an addition
    from an index or code search, a removed licence, a moved branch head, a new branch with
    Threads work, an unseen fork, a repository that's gone and a changed listing each exit
    1 with the ledger untouched. Through all of it the audit writes nothing but its report and the
    ledger's dates, and a parse of its source finds nothing that clones, downloads to disk or
    copies files, with a copy that does each of those as the proof the parse can see them.

    The pre-push hook runs this for the audit, its rules, the ledger, README.md, provenance.json and NOTICE.
#>
[CmdletBinding()]
param([string]$Root)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $PSScriptRoot 'threads-sources.ps1')

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

$caseRoot = Join-Path ([IO.Path]::GetTempPath()) ("hushthreads-sources-" + [guid]::NewGuid().ToString('N'))
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
foreach ($package in Get-SourcePackages) {
    Assert-True (@($entries | Where-Object { @($_.packages) -contains $package }).Count -gt 0) "The checked-in ledger has no $package source."
}

# Fixture sources let adoption, missing licenses and contamination each be broken once. Add them
# to a copy, with the NOTICE line and provenance rule the adopted fixture needs.
$catalogBuilds = @((Get-PatchTarget -PatchList ([IO.File]::ReadAllText((Join-Path $Root 'patches-list.json')) | ConvertFrom-Json)).PackageVersions)
Assert-True ($catalogBuilds.Count -ge 1) 'The catalog declares no Threads build, so the two-fixture cases would prove nothing.'
# Two-fixture evidence includes every declared build. Only a single-build catalog needs a
# synthetic second build in these rule fixtures; no compatibility is claimed for that value.
$fixtureBuilds = @($catalogBuilds)
if ($fixtureBuilds.Count -lt 2) { $fixtureBuilds += '0.0.0.0.1' }
$fixtureLicenseHash = 'a' * 64
$fixtureAdoptedRepository = 'https://github.com/fixture-owner/adopted-patches'
$fixtureAdoptedCommit = 'ad' * 20
$fixtureUnlicensedRepository = 'https://github.com/fixture-owner/unlicensed-module'
function New-RuleFixtureEntry {
    param([string]$Id, [string]$Repository, [string]$Kind, $License, [string]$Disposition, $ContaminatedBy, [string[]]$Forks)
    return [pscustomobject][ordered]@{ id = $Id; repository = $Repository; lineage = $Id; upstream = $null; kind = $Kind
        packages = @('com.instagram.barcelona'); targetVersions = [pscustomobject]@{ 'com.instagram.barcelona' = @($catalogBuilds[0]) }
        features = @('Hide ads'); branches = @([pscustomobject]@{ name = 'main'; commit = ('0f' * 20) }); watchPaths = @()
        license = $License; contaminatedBy = $ContaminatedBy; disposition = $Disposition; reason = 'A fixture source.'; archived = $false
        forks = @($Forks); contentHashes = @(); mirrors = @(); lastChecked = '2026-09-01' }
}
function Add-RuleFixtures {
    param($Copy)
    $adopted = New-RuleFixtureEntry 'fixture-adopted' $fixtureAdoptedRepository 'morphe-patches' `
        ([pscustomobject]@{ spdx = 'GPL-3.0'; url = "$fixtureAdoptedRepository/blob/main/LICENSE"; sha256 = $fixtureLicenseHash }) 'adopted' $null @()
    $adopted | Add-Member -NotePropertyName adopted -NotePropertyValue ([pscustomobject]@{ commit = $fixtureAdoptedCommit
        fixtures = [pscustomobject]@{ receipt = 'https://github.com/SysAdminDoc/HushThreads/releases/download/v9.9.9/release-receipt-9.9.9.json'
            builds = @($fixtureBuilds) } })
    $unlicensed = New-RuleFixtureEntry 'fixture-unlicensed' $fixtureUnlicensedRepository 'xposed-module' $null 'behavior-only' $null @('someone/unlicensed-module')
    $contaminated = New-RuleFixtureEntry 'fixture-contaminated' 'https://github.com/fixture-owner/contaminated-patches' 'morphe-patches' `
        ([pscustomobject]@{ spdx = 'GPL-3.0'; url = 'https://github.com/fixture-owner/contaminated-patches/blob/main/LICENSE'; sha256 = $fixtureLicenseHash }) `
        'behavior-only' ([pscustomobject]@{ source = $fixtureUnlicensedRepository; evidence = 'https://github.com/fixture-owner/contaminated-patches/issues/1' }) @()
    $Copy.entries = @(@($Copy.entries) + $adopted + $unlicensed + $contaminated)
    return $Copy
}

# README.md's source section is the readable version of the ledger. A source it links has to be one the
# ledger knows, and a behavior-only source can never be described as portable, which prose alone
# can't stop: a sibling's docs once called a port of an unlicensed module portable with credit.
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
    foreach ($address in @($index.url, $index.hushthreads.url)) {
        $indexKey = ConvertTo-SourceKey $address
        if ($indexKey) { $known[$indexKey] = $index }
    }
}
# The family repositories HushThreads was built from aren't ledger entries. provenance.json names
# them as the upstream of the files taken from them, and that record is what lets the page link them.
foreach ($rule in @(([IO.File]::ReadAllText((Join-Path $Root 'provenance.json')) | ConvertFrom-Json).rules)) {
    foreach ($address in @(@($rule.upstream) + @($rule.via) | Where-Object { $_ })) {
        $ruleKey = ConvertTo-SourceKey $address
        if ($ruleKey) { $known[$ruleKey] = $rule }
    }
}
function Test-SourcesDoc {
    param([string]$Text, $Entries = $entries)
    $problems = New-Object System.Collections.Generic.List[string]
    $sections = @([regex]::Matches($Text,
        '(?ms)^##[ \t]+Where the patches come from[ \t]*\r?$(?<body>.*?)(?=^##[ \t]+|\z)'))
    if ($sections.Count -ne 1) {
        $problems.Add("README.md needs exactly one 'Where the patches come from' section. Found $($sections.Count).")
        return $problems.ToArray()
    }
    $Text = $sections[0].Groups['body'].Value
    if ([string]::IsNullOrWhiteSpace($Text)) {
        $problems.Add('README.md source section is empty.')
        return $problems.ToArray()
    }
    foreach ($match in [regex]::Matches($Text, 'https://(?:github\.com|gitlab\.com)/[A-Za-z0-9_.\-/]+')) {
        $key = ConvertTo-SourceKey ($match.Value.TrimEnd('.', ')'))
        if ($key -and -not $known.ContainsKey($key)) { $problems.Add("README.md source section links $key, which the ledger doesn't know.") }
    }
    $portable = '(?i)\b(can be ported|ported with credit|port(ed)? it with credit|can be copied|copy its code)\b'
    foreach ($line in ($Text -split "`r?`n")) {
        if ($line -notmatch $portable) { continue }
        foreach ($entry in $Entries | Where-Object { $_.disposition -eq 'behavior-only' }) {
            if ($line.IndexOf([string]$entry.repository, [StringComparison]::OrdinalIgnoreCase) -ge 0) {
                $problems.Add("README.md source section calls $($entry.repository) portable, and the ledger says behavior-only: $line")
            }
        }
    }
    return $problems.ToArray()
}
$sourcesDoc = [IO.File]::ReadAllText((Join-Path $Root 'README.md'))
$docProblems = @(Test-SourcesDoc $sourcesDoc)
Assert-True ($docProblems.Count -eq 0) ($docProblems -join ' | ')
$docEntries = @((Add-RuleFixtures (Copy-Json $ledger)).entries)
$contaminated = @($docEntries | Where-Object { $_.id -eq 'fixture-contaminated' })[0]
$sourceHeading = '## Where the patches come from'
$oldLine = "- [fixture-owner/contaminated-patches]($($contaminated.repository)) (GPL-3.0) ports those hooks. Its code can be ported with credit."
$contaminatedDoc = $sourcesDoc.Replace($sourceHeading, "$sourceHeading`n`n$oldLine")
Assert-True (@(@(Test-SourcesDoc $contaminatedDoc $docEntries) -like '*calls*portable*').Count -gt 0) `
    'A README source line calling a contaminated source''s code portable passed the check.'
$unknownLine = 'See https://github.com/unknown-owner/new-threads-patches.'
$unknownDoc = $sourcesDoc.Replace($sourceHeading, "$sourceHeading`n`n$unknownLine")
Assert-True (@(@(Test-SourcesDoc $unknownDoc) -like '*unknown-owner*').Count -gt 0) `
    'A README source link to a source the ledger doesn''t know passed the check.'

Assert-True (@(@(Test-SourcesDoc ($sourcesDoc.Replace($sourceHeading, '## Retired sources'))) -like '*exactly one*').Count -gt 0) `
    'A README without its source section passed the check.'
Assert-True (@(@(Test-SourcesDoc "$sourceHeading`n`n## Building and checking`nBuild instructions.") -like '*source section is empty*').Count -gt 0) `
    'An empty README source section passed the check.'
Assert-True (@(@(Test-SourcesDoc ($sourcesDoc + "`n$sourceHeading`nAnother source section.")) -like '*exactly one*').Count -gt 0) `
    'A README with two source sections passed the check.'
Assert-True (@(Test-SourcesDoc ($sourcesDoc + "`n$unknownLine`n$oldLine") $docEntries).Count -eq 0) `
    'Repository links or portability prose outside the README source section were treated as source intake.'

Write-Host '[sources] the checked-in ledger and README source section keep their rules'

# --- each rule, broken once -------------------------------------------------------------------------

$rulesRoot = Join-Path $caseRoot 'rules'
New-Item -ItemType Directory -Path $rulesRoot -Force | Out-Null
foreach ($name in @('NOTICE', 'provenance.json', 'patches-list.json')) {
    Copy-Item -LiteralPath (Join-Path $Root $name) -Destination (Join-Path $rulesRoot $name)
}
# What the fixture adopted source needs outside the ledger: its NOTICE line and its ported rule.
[IO.File]::AppendAllText((Join-Path $rulesRoot 'NOTICE'), "`n  fixture  $fixtureAdoptedRepository`n")
$rulesProvenance = [IO.File]::ReadAllText((Join-Path $rulesRoot 'provenance.json')) | ConvertFrom-Json
$rulesProvenance.rules = @(@($rulesProvenance.rules) + [pscustomobject]@{ paths = @('patches/fixture/**'); origin = 'ported'
    upstream = $fixtureAdoptedRepository; commit = $fixtureAdoptedCommit; license = 'GPL-3.0'; via = @() })
[IO.File]::WriteAllText((Join-Path $rulesRoot 'provenance.json'), ($rulesProvenance | ConvertTo-Json -Depth 10))
$ruleLedger = Add-RuleFixtures (Copy-Json $ledger)
$ruleEntries = @($ruleLedger.entries)
$today = [datetime]::UtcNow.Date.ToString('yyyy-MM-dd')
function Test-Broken {
    param([scriptblock]$Break, [string]$Pattern, [string]$Message, [scriptblock]$BreakRoot)
    $copy = Copy-Json $ruleLedger
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
$adoptedId = [string]@($ruleEntries | Where-Object { $_.disposition -eq 'adopted' })[0].id
$adoptedRepository = [string](Get-Entry $ruleLedger $adoptedId).repository

$control = Test-SourceLedger -Ledger (Copy-Json $ruleLedger) -Root $rulesRoot -Today $today
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
$unlicensed = [string]@($ruleEntries | Where-Object { $null -eq $_.license })[0].id
Test-Broken { param($c) (Get-Entry $c $unlicensed).disposition = 'candidate' } '*has no licence, so it is behavior-only*' `
    'An unlicensed source marked candidate'
Test-Broken { param($c) (Get-Entry $c 'fixture-contaminated').disposition = 'candidate' } '*carries code from*behavior-only*' `
    'A contaminated source marked candidate'
$licensedCandidate = [string]@($entries | Where-Object { $_.disposition -eq 'candidate' -and $null -ne $_.license })[0].id
Test-Broken { param($c) (Get-Entry $c $licensedCandidate).license.spdx = 'CC-BY-NC-4.0' } '*can''t be combined with GPL-3.0*' `
    'A candidate whose licence can''t be combined with GPL-3.0'
Test-Broken { param($c) (Get-Entry $c $unlicensed).disposition = 'adopted' } '*has no licence*' 'An unlicensed source marked adopted'

# provenance.json can't credit what the ledger doesn't allow, and can't port from what isn't adopted.
$behaviorOnly = [string]@($ruleEntries | Where-Object { $_.disposition -eq 'behavior-only' })[0].repository
Test-Broken { param($c) } '*credits*but the ledger lists it as behavior-only*' 'A provenance rule crediting a behavior-only source' {
    $path = Join-Path $rulesRoot 'provenance.json'
    $document = [IO.File]::ReadAllText($path) | ConvertFrom-Json
    $document.rules[0].via = @(@($document.rules[0].via) + $behaviorOnly)
    [IO.File]::WriteAllText($path, ($document | ConvertTo-Json -Depth 10))
}
Test-Broken { param($c) $e = Get-Entry $c $adoptedId; $e.disposition = 'candidate'; $e.PSObject.Properties.Remove('adopted') } '*ports files from*not adopted*' `
    'A ported provenance rule from a source that isn''t adopted'
# A recorded fork or mirror carries its entry's code, so it's held to that entry's disposition and
# is never a porting source of its own.
$forkedEntry = @($ruleEntries | Where-Object { $_.disposition -eq 'behavior-only' -and @($_.forks | Where-Object { $_ }).Count -gt 0 })[0]
$behaviorOnlyFork = 'https://' + (ConvertTo-SourceKey $forkedEntry.repository).Split('/')[0] + '/' + @($forkedEntry.forks)[0]
$recordedMirror = [string]@(@($entries | Where-Object { @($_.mirrors | Where-Object { $_ }).Count -gt 0 })[0].mirrors)[0].repository
function Set-FirstRule {
    param([string]$Property, [string]$Value)
    $path = Join-Path $rulesRoot 'provenance.json'
    $document = [IO.File]::ReadAllText($path) | ConvertFrom-Json
    $document.rules[0].$Property = if ($Property -eq 'via') { @(@($document.rules[0].via) + $Value) } else { $Value }
    [IO.File]::WriteAllText($path, ($document | ConvertTo-Json -Depth 10))
}
Test-Broken { param($c) } '*credits*as a fork of*behavior-only*' 'A provenance rule crediting a fork of a behavior-only source' {
    Set-FirstRule 'via' $behaviorOnlyFork }
Test-Broken { param($c) } '*ports files from*only as a fork of*' 'A ported provenance rule from a fork of a behavior-only source' {
    Set-FirstRule 'upstream' $behaviorOnlyFork }
Test-Broken { param($c) } '*ports files from*only as a mirror of*' 'A ported provenance rule from a recorded mirror' {
    Set-FirstRule 'upstream' $recordedMirror }

# The records themselves.
Test-Broken { param($c) $c.indexes[0].hushthreads.status = '' } '*records no HushThreads listing*' 'An index with no listing record'
# Supply an invalid listing independently of the ledger's actual directory records.
Test-Broken { param($c) $c.indexes[0].hushthreads = [pscustomobject]@{ status = 'listed'; url = $null; checked = '2026-09-25' } } `
    '*listed but records no https listing url*' 'A listing with no URL'
Test-Broken { param($c) $c.indexes[0].hushthreads = [pscustomobject]@{ status = 'submitted'; url = 'https://example.com/issue/1' } } `
    '*submission date is not a yyyy-MM-dd date*' 'A submission with no date'
Test-Broken { param($c) $c.indexes = @($c.indexes | Select-Object -Skip 1) } '*has no record of index*' 'A ledger missing an index'
Test-Broken { param($c) $c.entries[1].repository = $c.entries[0].repository } '*which Entry*already names*' 'A repository listed twice'
Test-Broken { param($c) $c.entries[0].branches[0].commit = 'main' } '*has no pinned commit (40 hex characters)*' 'A branch with no pinned commit'
Test-Broken { param($c) $c.entries[0].lastChecked = '25/09/2026' } '*lastChecked is not a yyyy-MM-dd date*' 'A lastChecked that isn''t ISO'
Test-Broken { param($c) $c.entries[0].lastChecked = '2999-01-01' } '*lastChecked is 2999-01-01, after today*' 'A lastChecked in the future'
Test-Broken { param($c) $c.entries[0].features = @() } '*names no features*' 'A source with no features'
Test-Broken { param($c) $c.entries[0].targetVersions = [pscustomobject]@{} } '*records no declared target versions*' 'A source with no target versions'
Test-Broken { param($c) $c.entries[0].packages = @('com.instagram.android') } '*names no Threads package*outOfScope*' 'An Instagram-only source'
Test-Broken { param($c) $c.entries[0].packages = @('com.instagram.barcelona', 'com.facebook.katana') } '*neither Threads nor Instagram*' `
    'A source for another app'
Test-Broken { param($c) $e = @($c.entries | Where-Object { @($_.packages) -contains 'com.instagram.android' })[0]
    $e.targetVersions = [pscustomobject]@{ 'com.instagram.android' = @('449.0.0.52.84') } } '*records no declared target versions for com.instagram.barcelona*' `
    'A source for both apps that records only Instagram''s builds'
Test-Broken { param($c) $c.entries[0].license = [pscustomobject]@{ spdx = 'GPL-3.0'; url = 'https://example.com/LICENSE'; sha256 = 'abc' } } `
    '*licence has no sha256*' 'A licence with no hash'
Test-Broken { param($c) $c.entries[0].lineage = '' } '*names no lineage*' 'A source with no lineage'

Write-Host '[sources] every ledger rule refuses the copy that breaks it'

# --- how old the census is ------------------------------------------------------------------------

$census = Copy-Json $ledger
$census.census.checkedAt = '2026-09-25'
Assert-True (Test-SourceCensus -Ledger $census -Today '2026-10-09').Valid 'A census 14 days old was refused.'
$stale = Test-SourceCensus -Ledger $census -Today '2026-10-10'
Assert-True (-not $stale.Valid -and $stale.Reason -like '*15 days old*') "A census 15 days old was accepted: $($stale.Reason)"
Assert-True (-not (Test-SourceCensus -Ledger $census -Today '2026-09-24').Valid) 'A census dated after today was accepted.'
$census.census.checkedAt = 'yesterday'
Assert-True (-not (Test-SourceCensus -Ledger $census -Today '2026-10-01').Valid) 'A census with no date was accepted.'

Write-Host '[sources] a census reads as current for 14 days'

# --- the audit, against stand-ins for every forge and index -----------------------------------------

$auditScript = Join-Path $PSScriptRoot 'audit-threads-sources.ps1'
$fixtureRoot = Join-Path $caseRoot 'audit'
New-Item -ItemType Directory -Path (Join-Path $fixtureRoot 'sources'), (Join-Path $fixtureRoot 'patches'), (Join-Path $fixtureRoot 'extensions') -Force | Out-Null
# The fixture's alpha source is adopted, so its root carries the NOTICE entry and the provenance
# rule an adopted source needs, and the catalog whose two builds its receipt has to prove.
Copy-Item -LiteralPath (Join-Path $Root 'patches-list.json') -Destination (Join-Path $fixtureRoot 'patches-list.json')
$adoptedCommit = 'ad' * 20
$declaredBuilds = $catalogBuilds
# Every declared build, with a synthetic second build only for a single-build catalog.
$adoptedBuilds = @($fixtureBuilds)
[IO.File]::WriteAllText((Join-Path $fixtureRoot 'NOTICE'), "Fixture NOTICE`n  alpha  https://github.com/fixture-owner/alpha-patches`n")
[IO.File]::WriteAllText((Join-Path $fixtureRoot 'provenance.json'), (@{ rules = @(@{ paths = @('patches/**'); origin = 'ported'
    upstream = 'https://github.com/fixture-owner/alpha-patches'; commit = $adoptedCommit; license = 'GPL-3.0'; via = @() }) } | ConvertTo-Json -Depth 6))
Set-Content -LiteralPath (Join-Path $fixtureRoot 'patches/Keep.kt') -Value 'class Keep' -Encoding ASCII
$receiptUrl = 'https://github.com/SysAdminDoc/HushThreads/releases/download/v9.9.9/release-receipt-9.9.9.json'
$fixtureLedgerPath = Get-SourceLedgerPath -Root $fixtureRoot
$fakeToken = 'fixture-token-' + [guid]::NewGuid().ToString('N')
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
    census = [ordered]@{ checkedAt = '2026-09-01'; skipped = @('gitlab-code-search') }
    self = [ordered]@{ repository = 'https://github.com/SysAdminDoc/HushThreads' }
    officialBundle = [ordered]@{ repository = 'https://github.com/MorpheApp/morphe-patches'; branch = 'main'; list = 'patches-list.json'; packages = @() }
    indexes = @(
        [ordered]@{ id = 'morphe-directory'; name = 'Morphe community directory'; url = 'https://morphe-patches.software'
            hushthreads = [ordered]@{ status = 'not-listed'; checked = '2026-09-01' } }
        [ordered]@{ id = 'awesome-morphe'; name = 'Awesome Morphe'; url = 'https://github.com/nvbangg/awesome-morphe'
            hushthreads = [ordered]@{ status = 'submitted'; url = 'https://github.com/nvbangg/awesome-morphe/issues/1'; submitted = '2026-09-01' } }
        [ordered]@{ id = 'morphe-patch-tracker'; name = 'Morphe Patch Tracker'; url = 'https://drnx64.github.io/morphe-track-patches/'
            hushthreads = [ordered]@{ status = 'listed'; url = 'https://drnx64.github.io/morphe-track-patches/#/bundle/sysadmindoc'; checked = '2026-09-01' } }
        [ordered]@{ id = 'jman-bundles'; name = 'Jman''s Patch Bundle Registry'; url = 'https://github.com/Jman-Github/Patch-Bundle-Registry'
            hushthreads = [ordered]@{ status = 'not-listed'; checked = '2026-09-01' } }
        [ordered]@{ id = 'morphe-archive'; name = 'Morphe Archive'; url = 'https://rushiforai.github.io/morphe-archive/'
            hushthreads = [ordered]@{ status = 'listed'; url = 'https://github.com/rushiforai/morphe-archive'; checked = '2026-09-01' } }
    )
    entries = @(
        [ordered]@{ id = 'alpha'; repository = 'https://github.com/fixture-owner/alpha-patches'; lineage = 'alpha'; upstream = $null
            kind = 'morphe-patches'; packages = @('com.instagram.barcelona'); targetVersions = [ordered]@{ 'com.instagram.barcelona' = @('449.0.0.54.82') }
            features = @('Hide ads'); branches = @([ordered]@{ name = 'main'; commit = $commitA1 }); watchPaths = @()
            license = [ordered]@{ spdx = 'GPL-3.0'; url = "https://github.com/fixture-owner/alpha-patches/blob/$commitA1/LICENSE"; sha256 = $licenseHash }
            contaminatedBy = $null; disposition = 'adopted'; reason = 'A fixture source.'; archived = $false
            adopted = [ordered]@{ commit = $adoptedCommit; fixtures = [ordered]@{ receipt = $receiptUrl; builds = $adoptedBuilds } }
            forks = @('someone/alpha-patches'); contentHashes = @($blobKnown)
            mirrors = @([ordered]@{ repository = 'https://github.com/copier/alpha-copy'; reason = 'A fixture copy.'; blobs = @($blobMirror) })
            lastChecked = '2026-09-01' }
        [ordered]@{ id = 'beta'; repository = 'https://github.com/fixture-owner/beta-module'; lineage = 'beta'; upstream = $null
            kind = 'xposed-module'; packages = @('com.instagram.barcelona', 'com.instagram.android'); targetVersions = [ordered]@{ 'com.instagram.barcelona' = @() }
            features = @('Hide feed ads'); branches = @([ordered]@{ name = 'main'; commit = $commitB1 }); watchPaths = @('app/threads')
            license = $null; contaminatedBy = $null; disposition = 'behavior-only'; reason = 'A fixture module with no licence.'; archived = $false
            forks = @(); contentHashes = @(); mirrors = @(); lastChecked = '2026-09-01' }
        [ordered]@{ id = 'gamma'; repository = 'https://gitlab.com/fixture-group/gamma-patches'; lineage = 'gamma'; upstream = $null
            kind = 'revanced-patches'; packages = @('com.instagram.barcelona'); targetVersions = [ordered]@{ 'com.instagram.barcelona' = @() }
            features = @('Open links outside'); branches = @([ordered]@{ name = 'main'; commit = $commitG1 }); watchPaths = @('patches/threads', 'extensions/threads')
            license = [ordered]@{ spdx = 'GPL-3.0'; url = "https://gitlab.com/fixture-group/gamma-patches/-/blob/$commitG1/LICENSE"; sha256 = $licenseHash }
            contaminatedBy = $null; disposition = 'candidate'; reason = 'A fixture GitLab source.'; archived = $false
            forks = @(); contentHashes = @(); mirrors = @(); lastChecked = '2026-09-01' }
    )
    outOfScope = @([ordered]@{ repository = 'https://github.com/noise/mentions-threads'; reason = 'Names the package in a list.'; lastChecked = '2026-09-01' })
}
$fixtureLedgerText = ($fixtureLedger | ConvertTo-Json -Depth 20) -replace "`r`n", "`n"
function Reset-FixtureLedger { [IO.File]::WriteAllText($fixtureLedgerPath, $fixtureLedgerText, (New-Object Text.UTF8Encoding $false)) }
Reset-FixtureLedger
Assert-True (Test-SourceLedger -Ledger ($fixtureLedgerText | ConvertFrom-Json) -Root $fixtureRoot -Today '2026-09-25').Valid `
    'The audit fixture ledger breaks the rules, so the audit would stop before any case below.'

# One bundle row as Jman's registry serves it (the fields the census reads), and a page of them.
function New-RegistryRow {
    param([string]$Id, [string]$Url, [string]$Version = 'v1.0.0', [bool]$Latest = $true, [string]$Status = 'verified',
        [bool]$Prerelease = $false, [string[]]$Channels = @('latest', 'stable'), [string]$Repo, [string]$Owner)
    $parts = ([Uri]$Url).AbsolutePath.Trim('/') -split '/'
    return [ordered]@{
        id = $Id; version = $Version; is_latest = $Latest; is_prerelease = $Prerelease; channels = @($Channels)
        metadata_status = $Status; packages = @('com.instagram.barcelona')
        source = [ordered]@{ url = $Url; host = ([Uri]$Url).Host; enabled = $true; unavailable_reason = $null
            source_metadatum = [ordered]@{ owner_name = $(if ($Owner) { $Owner } else { $parts[0] }); repo_name = $(if ($Repo) { $Repo } else { $parts[1] }) } }
    }
}
function New-RegistryPage {
    param($Rows, [int]$Total)
    return @{ Status = 200; Content = (@{ data = @($Rows); total = $Total; limit = 100; offset = 0 } | ConvertTo-Json -Depth 10) }
}
# The rows the control serves: a short first page (one of three rows left unread is not the end), a
# second page that repeats the first page's release, and an older alpha release that is history.
function New-RegistryPages {
    $alpha = 'https://github.com/fixture-owner/alpha-patches'
    $latest = New-RegistryRow -Id 'a-latest' -Url $alpha -Version 'v2.0.0'
    return @{
        '0' = New-RegistryPage -Rows @($latest) -Total 4
        '1' = New-RegistryPage -Rows @(
            (New-RegistryRow -Id 'a-old' -Url $alpha -Version 'v1.0.0' -Latest $false -Channels @())
            (New-RegistryRow -Id 'g-latest' -Url 'https://gitlab.com/fixture-group/gamma-patches' -Version 'v3.0.0')
            $latest) -Total 4
    }
}

# What each forge and index answers. A case changes one answer and puts it back.
function New-FakeAnswers {
    $answers = [ordered]@{
        official = @{ Status = 200; Content = '{"patches":[{"name":"Example","compatiblePackages":{"com.google.android.youtube":["20.1"]}}]}' }
        directory = @{ Status = 200; Content = (@{
            bundles = @(@{ source = 'github'; repo = 'fixture-owner/alpha-patches'; name = 'Alpha'; targetApps = @('com.instagram.barcelona')
                patches = @(@{ name = 'Hide ads'; compatiblePackagesKey = 0 }) })
            compatibilities = @(@{ packageName = 'com.instagram.barcelona'; targets = @(@{ version = '449.0.0.54.82' }) }) } | ConvertTo-Json -Depth 8) }
        awesome = @{ Status = 200; Content = '{"fixture-owner/alpha-patches":{"com.instagram.barcelona":"0123"},"SysAdminDoc/hushfeed":{"com.zhiliaoapp.musically":"4567"}}' }
        tracker = @{ Status = 200; Content = (@{
            'sysadmindoc:stable' = @{ repo_url = 'https://github.com/SysAdminDoc/HushThreads'; apps = @(@{ package = 'com.instagram.barcelona'; patches = @(@{ name = 'Hide ads' }) }) }
            'alpha:stable' = @{ repo_url = 'https://github.com/fixture-owner/alpha-patches'; apps = @(@{ package = 'com.instagram.barcelona'; patches = @(@{ name = 'Hide ads' }) }) }
        } | ConvertTo-Json -Depth 8) }
        jmanConfig = @{ Status = 200; Content = '{"alpha":{"patches":"https://github.com/fixture-owner/alpha-patches","integrations":false,"disabled":false},"gamma":{"patches":"https://gitlab.com/fixture-group/gamma-patches","integrations":false,"disabled":false}}' }
        jmanPages = (New-RegistryPages)
        archive = @{ Status = 200; Content = '{"name":"patches-list.json"}' }
        searchHits = @(
            @{ repository = @{ full_name = 'fixture-owner/alpha-patches' }; path = 'patches/Alpha.kt'; sha = $blobKnown }
            @{ repository = @{ full_name = 'copier/alpha-copy' }; path = 'patches/Alpha.kt'; sha = $blobMirror }
            @{ repository = @{ full_name = 'clone/alpha-clone' }; path = 'src/Alpha.kt'; sha = $blobKnown }
            @{ repository = @{ full_name = 'rushiforai/morphe-archive' }; path = 'examplepatches/fixture-owner/alpha-patches/patches-list.json'; sha = ('3b' * 20) }
            @{ repository = @{ full_name = 'rushiforai/morphe-archive' }; path = 'examplepatches/Jman-Github/ReVanced-Patch-Bundles/patch-bundles/x/y-patches-list.json'; sha = ('4b' * 20) }
            @{ repository = @{ full_name = 'noise/mentions-threads' }; path = 'list.txt'; sha = ('5b' * 20) }
            @{ repository = @{ full_name = 'SysAdminDoc/HushThreads' }; path = 'patches-list.json'; sha = ('6b' * 20) }
            # The archive keeps a recorded fork's patch list for its entry's own package, which is no bundle of its own.
            @{ repository = @{ full_name = 'rushiforai/morphe-archive' }; path = 'examplepatches/someone/alpha-patches/patches-list.json'; sha = ('7b' * 20) }
        )
        alphaRepo = @{ Status = 200; Content = '{"full_name":"fixture-owner/alpha-patches","archived":false,"default_branch":"main"}' }
        alphaLicense = @{ Status = 200; Content = (@{ path = 'LICENSE'; content = $licenseBase64; license = @{ spdx_id = 'GPL-3.0' } } | ConvertTo-Json) }
        alphaBranches = @{ Status = 200; Content = "[{`"name`":`"main`",`"commit`":{`"sha`":`"$commitA1`"}}]" }
        alphaForks = @{ Status = 200; Content = '[{"full_name":"someone/alpha-patches"}]' }
        compare = @{}
        betaRepo = @{ Status = 200; Content = '{"full_name":"fixture-owner/beta-module","archived":false,"default_branch":"main"}' }
        betaLicense = @{ Status = 404; Content = $null }
        betaBranches = @{ Status = 200; Content = "[{`"name`":`"main`",`"commit`":{`"sha`":`"$('b9' * 20)`"}}]" }
        betaWatch = @{ Status = 200; Content = "[{`"sha`":`"$commitB1`",`"commit`":{`"committer`":{`"date`":`"2026-09-01T10:00:00Z`"}}}]" }
        betaForks = @{ Status = 200; Content = '[]' }
        gammaProject = @{ Status = 200; Content = '{"path_with_namespace":"fixture-group/gamma-patches","archived":false,"default_branch":"main"}' }
        gammaTree = @{ Status = 200; Content = '[{"type":"blob","name":"LICENSE","path":"LICENSE"},{"type":"tree","name":"patches","path":"patches"}]' }
        gammaLicense = @{ Status = 200; Content = (@{ file_name = 'LICENSE'; content = $licenseBase64 } | ConvertTo-Json) }
        gammaBranches = @{ Status = 200; Content = "[{`"name`":`"main`",`"commit`":{`"id`":`"$commitG1`"}}]" }
        gammaForks = @{ Status = 200; Content = '[]' }
        # The newest commit GitLab's GraphQL answers for a branch and path; anything else has none. A
        # gammaGraphql answer stands in for the whole reply.
        gammaWatch = @{
            'main|patches/threads' = @{ sha = $commitG1; committedDate = '2026-09-01T12:00:00+02:00' }
            'old|patches/threads' = @{ sha = ('c3' * 20); committedDate = '2026-08-01T12:00:00+02:00' }
        }
        gammaGraphql = $null
        gammaCompare = @{}
        repoMeta =@{ Status = 200; Content = '{"full_name":"newcomer/threads-patches","license":{"spdx_id":"MIT"},"fork":false,"archived":false,"pushed_at":"2026-09-20T00:00:00Z","description":"Threads patches"}' }
        oldNameMeta = @{ Status = 200; Content = '{"full_name":"fixture-owner/alpha-patches","fork":false,"archived":false}' }
        receipt = @{ Status = 200; Content = (@{ targets = @($adoptedBuilds | ForEach-Object {
            @{ source = @{ versionName = $_; forced = $false }; patches = @(@{ name = 'Hide ads'; applied = $true }) } }) } | ConvertTo-Json -Depth 8) }
    }
    return $answers
}
$fakeForge = @{ Answers = (New-FakeAnswers); Requests = (New-Object System.Collections.Generic.List[object])
    Sleeps = (New-Object System.Collections.Generic.List[double]) }

& {
    # Stands in for every request the audit makes, so no case needs the network. A request it
    # doesn't recognize fails the case that made it.
    function Invoke-WebRequest {
        param($Uri, $Headers, $UserAgent, [switch]$UseBasicParsing, $TimeoutSec, $Method, $Body, $ContentType, $OutFile, $MaximumRedirection, [switch]$PassThru)
        $url = [string]$Uri
        $authorization = if ($Headers -and $Headers.ContainsKey('Authorization')) { [string]$Headers['Authorization'] } else { $null }
        $fakeForge.Requests.Add([pscustomobject]@{ Uri = $url; Authorization = $authorization; Method = $Method; Body = $Body })
        $a = $fakeForge.Answers
        $answer = $null
        switch -Regex ($url) {
            '^https://raw\.githubusercontent\.com/MorpheApp/morphe-patches/main/patches-list\.json$' { $answer = $a.official; break }
            '^https://morphe-patches\.software/data/bundles\.json$' { $answer = $a.directory; break }
            '^https://raw\.githubusercontent\.com/nvbangg/awesome-morphe/main/data/hashes\.json$' { $answer = $a.awesome; break }
            '^https://raw\.githubusercontent\.com/drnx64/morphe-track-patches/main/data/bundles\.json$' { $answer = $a.tracker; break }
            '^https://raw\.githubusercontent\.com/Jman-Github/Patch-Bundle-Registry/HEAD/config/sources\.json$' { $answer = $a.jmanConfig; break }
            '^https://patch-bundles\.api\.jmancentral\.com/apps/com\.instagram\.barcelona/bundles\?limit=100&offset=(\d+)$' { $answer = $a.jmanPages[$Matches[1]]; break }
            '^https://api\.github\.com/repos/rushiforai/morphe-archive/contents/examplepatches/SysAdminDoc/HushThreads/patches-list\.json$' { $answer = $a.archive; break }
            '^https://api\.github\.com/search/code\?q=([^&]+)&per_page=100&page=1$' {
                $query = [Uri]::UnescapeDataString($Matches[1])
                $items = if ($query -eq '"com.instagram.barcelona" bytecodePatch') { @($a.searchHits) } else { @() }
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
            '^https://api\.github\.com/repos/fixture-owner/beta-module/commits\?sha=main&path=app%2Fthreads&per_page=1$' { $answer = $a.betaWatch; break }
            '^https://api\.github\.com/repos/fixture-owner/beta-module/forks\?per_page=100&page=1$' { $answer = $a.betaForks; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches$' { $answer = $a.gammaProject; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches/repository/tree\?ref=main&per_page=100&page=1$' { $answer = $a.gammaTree; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches/repository/files/LICENSE\?ref=main$' { $answer = $a.gammaLicense; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches/repository/branches\?per_page=100&page=1$' { $answer = $a.gammaBranches; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches/forks\?per_page=100&page=1$' { $answer = $a.gammaForks; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches/repository/compare\?from=([0-9a-f]{40})&to=([0-9a-f]{40})$' {
                # GitLab lists the commits $to has past $from: none when it's behind or the same.
                $status = $a.gammaCompare[$Matches[2]]
                if ($status) { $answer = @{ Status = 200; Content = $(if ($status -eq 'ahead') { "{`"commits`":[{`"id`":`"$($Matches[2])`"}]}" } else { '{"commits":[]}' }) } }
                break
            }
            '^https://gitlab\.com/api/graphql$' {
                if ($null -ne $a.gammaGraphql) { $answer = $a.gammaGraphql; break }
                $query = [string](($Body | ConvertFrom-Json).query)
                if ($Method -ne 'Post' -or $query -notlike '*project(fullPath: "fixture-group/gamma-patches")*') { break }
                $commits = [ordered]@{}
                foreach ($asked in [regex]::Matches($query, '(q\d+): lastCommit\(ref: "([^"]+)", path: "([^"]+)", refType: HEADS\) \{ sha committedDate \}')) {
                    $commits[$asked.Groups[1].Value] = $a.gammaWatch["$($asked.Groups[2].Value)|$($asked.Groups[3].Value)"]
                }
                # A branch's own head comes from the branch list this stand-in hands out.
                $listedBranches = @(([string]$a.gammaBranches.Content | ConvertFrom-Json) | ForEach-Object { $_ })
                foreach ($asked in [regex]::Matches($query, '(h\d+): lastCommit\(ref: "([^"]+)", refType: HEADS\) \{ sha \}')) {
                    $listedBranch = @($listedBranches | Where-Object { [string]$_.name -ceq $asked.Groups[2].Value } | Select-Object -First 1)
                    $commits[$asked.Groups[1].Value] = if ($listedBranch.Count -gt 0) { @{ sha = [string]$listedBranch[0].commit.id } } else { $null }
                }
                $answer = @{ Status = 200; Content = (@{ data = @{ project = @{ repository = $commits } } } | ConvertTo-Json -Depth 6) }
                break
            }
            '^https://api\.github\.com/repos/(newcomer/threads-patches|clone/alpha-clone)$' { $answer = $a.repoMeta; break }
            '^https://api\.github\.com/repos/fixture-owner/alpha-old$' { $answer = $a.oldNameMeta; break }
            '^https://github\.com/SysAdminDoc/HushThreads/releases/download/v9\.9\.9/release-receipt-9\.9\.9\.json$' { $answer = $a.receipt; break }
        }
        if ($null -eq $answer) { throw "The audit made a request no stand-in answers: $url" }
        if ($answer.ContainsKey('Unreachable')) { throw 'The remote name could not be resolved' }
        # A queue of rate limits to answer first, each with the headers it carries.
        $status = $answer.Status
        $headers = @{}
        if ($answer.ContainsKey('LimitedFirst') -and $answer.LimitedFirst.Count -gt 0) {
            $status = 429
            $headers = $answer.LimitedFirst.Dequeue()
        }
        if ($status -ne 200) {
            $failure = New-Object System.Exception "Response status code does not indicate success: $status."
            Add-Member -InputObject $failure -NotePropertyName Response -NotePropertyValue ([pscustomobject]@{ StatusCode = $status; Headers = $headers })
            throw $failure
        }
        return [pscustomobject]@{ StatusCode = 200; Content = [string]$answer.Content }
    }

    # Records each wait instead of sleeping.
    function Start-Sleep {
        param([double]$Seconds, [int]$Milliseconds)
        $fakeForge.Sleeps.Add($(if ($PSBoundParameters.ContainsKey('Seconds')) { $Seconds } else { $Milliseconds / 1000 }))
    }

    function Invoke-Audit {
        param([hashtable]$Extra = @{})
        $report = Join-Path $caseRoot ('report-' + [guid]::NewGuid().ToString('N') + '.json')
        $fakeForge.Requests.Clear()
        $fakeForge.Sleeps.Clear()
        $arguments = @{ Root = $fixtureRoot; GitHubToken = $fakeToken; SkipGitLabCodeSearch = $true; SearchDelaySeconds = 0
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
        $result = Invoke-Audit
        $found = @($result.Report.findings | Where-Object { $_.kind -eq $Kind -and "$($_.repository) $($_.detail)" -like $Detail })
        Assert-True ($result.ExitCode -eq 1) "$Case exited $($result.ExitCode), not 1: $($result.Said)"
        Assert-True ($found.Count -gt 0) "$Case was not reported as $Kind ($Detail): $(@($result.Report.findings | ForEach-Object { "$($_.kind): $($_.repository) $($_.detail)" }) -join ' | ')"
        Assert-True ([IO.File]::ReadAllText($fixtureLedgerPath) -ceq $fixtureLedgerText) "$Case changed the ledger although the audit found drift."
    }

    # The control: nothing moved. Only dates change in the ledger, nothing else under the root
    # changes, and the copy with the lineage's own blob counts as that lineage.
    $before = Get-TreeState
    $clean = Invoke-Audit
    Assert-True ($clean.ExitCode -eq 0) ("The audit refused a fixture where nothing moved: " +
        (@($clean.Report.findings | ForEach-Object { "$($_.kind): $($_.repository) $($_.detail)" }) -join ' | ') + "`n$($clean.Said)")
    $stamped = [IO.File]::ReadAllText($fixtureLedgerPath)
    Assert-True (($stamped -replace '\d{4}-\d{2}-\d{2}', 'DATE') -ceq ($fixtureLedgerText -replace '\d{4}-\d{2}-\d{2}', 'DATE')) `
        'The clean audit changed more of the ledger than its dates.'
    $stampedLedger = $stamped | ConvertFrom-Json
    Assert-True ($stampedLedger.census.checkedAt -eq '2026-09-25' -and @($stampedLedger.entries | Where-Object { $_.lastChecked -ne '2026-09-25' }).Count -eq 0 -and
        $stampedLedger.indexes[2].hushthreads.checked -eq '2026-09-25' -and $stampedLedger.indexes[1].hushthreads.submitted -eq '2026-09-01') `
        'The clean audit did not stamp the census and every checked record with today, or it moved a submission date.'
    $after = Get-TreeState
    $changed = @(Compare-Object $before $after | ForEach-Object { ($_.InputObject -split ' ')[0] } | Sort-Object -Unique)
    Assert-True ($changed.Count -eq 1 -and $changed[0] -like '*threads-sources.json') `
        "The audit wrote more than the ledger's dates under the root: $($changed -join ', ')"
    Assert-True ($clean.Report.counts.lineages -eq 3 -and $clean.Report.counts.mirrorsCollapsed -eq 1) `
        "The clean audit did not count three lineages with one copy collapsed: $($clean.Report.counts | ConvertTo-Json -Compress)"
    Assert-True (@($clean.Report.notes | Where-Object { $_ -like '*clone/alpha-clone is a byte-for-byte copy*alpha lineage*' }).Count -eq 1) `
        "The copy of the alpha lineage's file was not collapsed into it: $($clean.Report.notes -join ' | ')"
    Assert-True (@($clean.Report.lineages | Where-Object { $_.lineage -eq 'alpha' })[0].mirrors -contains 'https://github.com/clone/alpha-clone') `
        'The collapsed copy was not listed under its lineage.'
    # Jman's registry is read from its paged Threads endpoint: the first page is short of the total,
    # so the offset moves by the rows it returned, and the release the second page repeats counts once.
    $registryOffsets = @($fakeForge.Requests | Where-Object { $_.Uri -like 'https://patch-bundles.api.jmancentral.com/*' } |
        ForEach-Object { ($_.Uri -split 'offset=')[1] })
    Assert-True (($registryOffsets -join ',') -eq '0,1') "The registry list was not followed past a short page: offsets $($registryOffsets -join ',')"
    Assert-True (@($clean.Report.notes | Where-Object { $_ -like "*registry returned 1 Threads bundle row(s) twice*" }).Count -eq 1) `
        "The repeated registry row was not counted once: $($clean.Report.notes -join ' | ')"
    Assert-True (@($fakeForge.Requests | Where-Object { $_.Uri -like '*ReVanced-Patch-Bundles*' }).Count -eq 0) `
        'The audit still asked for the retired Jman files.'
    $leaked = @($fakeForge.Requests | Where-Object { $_.Authorization -and $_.Uri -notlike 'https://api.github.com/*' })
    Assert-True ($leaked.Count -eq 0) "The GitHub token went to another host: $($leaked[0].Uri)"
    Assert-True (@($fakeForge.Requests | Where-Object { $_.Uri -like 'https://api.github.com/*' -and $_.Authorization -ne "Bearer $fakeToken" }).Count -eq 0) `
        'A GitHub API request went out without the token.'
    Assert-True ($clean.ReportText.IndexOf($fakeToken) -lt 0 -and $stamped.IndexOf($fakeToken) -lt 0) 'The token was written to the report or the ledger.'
    Reset-FixtureLedger

    # -SkipGitLabCodeSearch holds with GITLAB_TOKEN set, as the audit's help tells a maintainer to
    # set it: no GitLab search goes out and the census keeps recording the skip.
    $fakeGitLabToken = 'fixture-gitlab-' + [guid]::NewGuid().ToString('N')
    $env:GITLAB_TOKEN = $fakeGitLabToken
    try { $withToken = Invoke-Audit } finally { $env:GITLAB_TOKEN = $null }
    Assert-True ($withToken.ExitCode -eq 0) "The audit refused a clean fixture once GITLAB_TOKEN was set with -SkipGitLabCodeSearch: $($withToken.Said)"
    Assert-True (@($fakeForge.Requests | Where-Object { $_.Uri -like 'https://gitlab.com/api/v4/search*' }).Count -eq 0) `
        'GitLab code search ran although -SkipGitLabCodeSearch was passed.'
    Assert-True (@(([IO.File]::ReadAllText($fixtureLedgerPath) | ConvertFrom-Json).census.skipped) -contains 'gitlab-code-search') `
        'The census stopped recording the GitLab skip because a token was set.'
    # The run log says whether GitLab was read with a token, without printing it.
    Assert-True ($withToken.Said -like '*GitLab reads: with a GitLab token*' -and $withToken.Said.IndexOf($fakeGitLabToken) -lt 0) `
        "The run log did not say GitLab was read with a token, or it printed the token: $($withToken.Said)"
    Assert-True ($clean.Said -like '*GitLab reads: without a token*') "The run log did not say GitLab was read without a token: $($clean.Said)"
    Reset-FixtureLedger

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
    $fakeForge.Answers.directory.Content = $fakeForge.Answers.directory.Content.Replace('"repo":  "fixture-owner/alpha-patches"', '"repo":  "newcomer/threads-patches"').Replace(
        '"repo": "fixture-owner/alpha-patches"', '"repo": "newcomer/threads-patches"')
    Assert-True ($fakeForge.Answers.directory.Content -like '*newcomer/threads-patches*') 'The directory answer was not edited, so the addition case would prove nothing.'
    Assert-Drift 'addition' '*github.com/newcomer/threads-patches*Morphe directory*' 'A bundle only the directory knows'
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

    # A branch cut from main before its Threads code last moved carries nothing new; one ahead of it does.
    $fakeForge.Answers.alphaBranches.Content = "[{`"name`":`"main`",`"commit`":{`"sha`":`"$commitA1`"}},{`"name`":`"old`",`"commit`":{`"sha`":`"$('a3' * 20)`"}}]"
    $fakeForge.Answers.compare[('a3' * 20)] = 'behind'
    $contained = Invoke-Audit
    Assert-True ($contained.ExitCode -eq 0) ("A branch behind a pinned one was reported: " +
        (@($contained.Report.findings | ForEach-Object { "$($_.kind): $($_.detail)" }) -join ' | '))
    Reset-FixtureLedger
    $fakeForge.Answers.compare[('a3' * 20)] = 'ahead'
    Assert-Drift 'new-branch' '*alpha-patches*branch old carries Threads work*' 'A branch with work of its own'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.alphaForks.Content = '[{"full_name":"someone/alpha-patches"},{"full_name":"stranger/alpha-patches"}]'
    Assert-Drift 'unseen-fork' '*alpha-patches*fork stranger/alpha-patches*' 'A fork the ledger has not seen'
    $fakeForge.Answers = New-FakeAnswers

    # GitLab renames a fork waiting to be deleted after its own id, and a scanner keeps making and
    # deleting forks of ReVanced's mirror. One whose name ends in its own id isn't a fork to record;
    # one that only looks like it is.
    $fakeForge.Answers.gammaForks.Content = '[{"id":42,"path_with_namespace":"scanner/temp-deletion_scheduled-42"}]'
    $scheduled = Invoke-Audit
    Assert-True ($scheduled.ExitCode -eq 0) ("A fork GitLab is deleting was reported: " +
        (@($scheduled.Report.findings | ForEach-Object { "$($_.kind): $($_.detail)" }) -join ' | '))
    Reset-FixtureLedger
    $fakeForge.Answers.gammaForks.Content = '[{"id":41,"path_with_namespace":"scanner/temp-deletion_scheduled-42"}]'
    Assert-Drift 'unseen-fork' '*gamma-patches*fork scanner/temp-deletion_scheduled-42*' 'A fork named like a deleted one under another id'
    $fakeForge.Answers = New-FakeAnswers

    # GitLab's watched paths are read through GraphQL. gitlab.com's hourly REST limit can't hold a
    # request per branch and path: ReVanced's mirror needs 70 of those and an address gets about 60.
    $watchedClean = Invoke-Audit
    Assert-True ($watchedClean.ExitCode -eq 0) ("A GitLab source whose watched code stayed put was reported: " +
        (@($watchedClean.Report.findings | ForEach-Object { "$($_.kind): $($_.detail)" }) -join ' | '))
    $questions = @($fakeForge.Requests | Where-Object { $_.Uri -ceq 'https://gitlab.com/api/graphql' })
    Assert-True ($questions.Count -eq 1 -and $questions[0].Method -eq 'Post' -and $questions[0].Body -like '*patches/threads*' -and $questions[0].Body -like '*extensions/threads*') `
        "One GitLab branch and two watched paths weren't one question: $(@($questions | ForEach-Object { $_.Body }) -join ' | ')"
    Assert-True (@($fakeForge.Requests | Where-Object { $_.Uri -like 'https://gitlab.com/api/v4/*/repository/commits*' }).Count -eq 0) `
        'A GitLab watched path was still read through REST.'
    Reset-FixtureLedger

    # The newest of the watched paths is the branch's head, whichever way the zones fall: 13:00 at
    # +05:00 is before 12:00 at +02:00, though it reads later.
    $fakeForge.Answers.gammaWatch['main|extensions/threads'] = @{ sha = ('d1' * 20); committedDate = '2026-09-01T13:00:00+05:00' }
    $olderPath = Invoke-Audit
    Assert-True ($olderPath.ExitCode -eq 0) ("A watched path older than the pin moved the branch: " +
        (@($olderPath.Report.findings | ForEach-Object { "$($_.kind): $($_.detail)" }) -join ' | '))
    Reset-FixtureLedger
    $fakeForge.Answers.gammaWatch['main|extensions/threads'] = @{ sha = ('d1' * 20); committedDate = '2026-09-01T11:00:00+00:00' }
    Assert-Drift 'changed-head' "*gamma-patches*branch main moved from $commitG1 to $('d1' * 20)*" 'A GitLab branch whose second watched path moved'
    $fakeForge.Answers = New-FakeAnswers
    $fakeForge.Answers.gammaWatch = @{}
    Assert-Drift 'changed-head' "*gamma-patches*branch main moved from $commitG1 to no Threads code*" 'A GitLab branch that lost its watched code'
    $fakeForge.Answers = New-FakeAnswers

    # Forty branches and two paths are four questions (ten branches each, with their heads), and the last one is read: its branch holds
    # the only work the ledger hasn't pinned. A branch name with slashes reaches GitLab whole.
    $manyBranches = @('main') + @(1..39 | ForEach-Object { "github/fork/someone/b$_" })
    $fakeForge.Answers.gammaBranches.Content = ConvertTo-Json -Compress -Depth 4 -InputObject @($manyBranches | ForEach-Object { @{ name = $_; commit = @{ id = ('c4' * 20) } } })
    $fakeForge.Answers.gammaWatch['github/fork/someone/b39|extensions/threads'] = @{ sha = ('c4' * 20); committedDate = '2026-09-02T12:00:00+02:00' }
    $fakeForge.Answers.gammaCompare[('c4' * 20)] = 'ahead'
    $manyRun = Invoke-Audit
    $manyFindings = @($manyRun.Report.findings | ForEach-Object { "$($_.kind): $($_.detail)" }) -join ' | '
    $manyQuestions = @($fakeForge.Requests | Where-Object { $_.Uri -ceq 'https://gitlab.com/api/graphql' }).Count
    Assert-True ($manyQuestions -eq 4) "Forty branches and two paths weren't four questions: $manyQuestions"
    Assert-True (@($manyRun.Report.findings | Where-Object { $_.kind -eq 'new-branch' -and $_.detail -like '*branch github/fork/someone/b39 carries Threads work*' }).Count -eq 1) `
        "The last question's branch wasn't read: $manyFindings"
    $fakeForge.Answers = New-FakeAnswers
    Reset-FixtureLedger

    # Branches that share a head share one comparison, since each counts against that limit.
    $fakeForge.Answers.gammaBranches.Content = "[{`"name`":`"main`",`"commit`":{`"id`":`"$commitG1`"}},{`"name`":`"one`",`"commit`":{`"id`":`"$('c5' * 20)`"}},{`"name`":`"two`",`"commit`":{`"id`":`"$('c5' * 20)`"}}]"
    foreach ($sharing in 'one', 'two') { $fakeForge.Answers.gammaWatch["$sharing|patches/threads"] = @{ sha = ('c5' * 20); committedDate = '2026-08-01T12:00:00+02:00' } }
    $fakeForge.Answers.gammaCompare[('c5' * 20)] = 'behind'
    $sharedRun = Invoke-Audit
    Assert-True ($sharedRun.ExitCode -eq 0) ("Branches behind a pinned one were reported: " +
        (@($sharedRun.Report.findings | ForEach-Object { "$($_.kind): $($_.detail)" }) -join ' | '))
    Assert-True (@($fakeForge.Requests | Where-Object { $_.Uri -like 'https://gitlab.com/api/v4/*/repository/compare*' }).Count -eq 1) `
        'Two branches with one head were compared twice.'
    $fakeForge.Answers = New-FakeAnswers
    Reset-FixtureLedger

    # An answer that doesn't hold the commits leaves the source unread and the ledger alone. A
    # missing project mustn't read as a branch with no watched code.
    foreach ($broken in @(
            @{ Answer = @{ Status = 200; Content = '{"errors":[{"message":"Query has complexity of 300, which exceeds max complexity of 200"}]}' }; Said = '*gamma-patches could not be read*GitLab refused*exceeds max complexity*'; Case = 'A GraphQL refusal' }
            @{ Answer = @{ Status = 200; Content = '{"data":{"project":null}}' }; Said = '*gamma-patches could not be read*with no repository*'; Case = 'A GraphQL answer with no project' }
            @{ Answer = @{ Status = 429; Content = $null }; Said = '*gamma-patches could not be read: the commits under its watched paths answered HTTP 429*'; Case = 'A limit on GraphQL' }
            @{ Answer = @{ Status = 500; Content = $null }; Said = '*gamma-patches could not be read: the commits under its watched paths answered HTTP 500*'; Case = 'A server error on GraphQL' })) {
        $fakeForge.Answers.gammaGraphql = $broken.Answer
        $brokenRun = Invoke-Audit
        $brokenFindings = @($brokenRun.Report.findings | ForEach-Object { "$($_.kind): $($_.repository) $($_.detail)" }) -join ' | '
        Assert-True ($brokenRun.ExitCode -eq 1 -and @($brokenRun.Report.findings | Where-Object { $_.kind -eq 'source-failed' -and $_.detail -like $broken.Said }).Count -eq 1) `
            "$($broken.Case) didn't leave the source unread (exit $($brokenRun.ExitCode)): $brokenFindings"
        Assert-True (@($brokenRun.Report.findings | Where-Object { $_.kind -eq 'changed-head' -and $_.repository -like '*gamma-patches*' }).Count -eq 0) `
            "$($broken.Case) read as a moved branch: $brokenFindings"
        Assert-True ([IO.File]::ReadAllText($fixtureLedgerPath) -ceq $fixtureLedgerText) "$($broken.Case) changed the ledger."
    }
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.gammaProject = @{ Status = 404; Content = $null }
    Assert-Drift 'repository-gone' '*gamma-patches*HTTP 404*' 'A GitLab source that is gone'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.alphaRepo.Content = $fakeForge.Answers.alphaRepo.Content.Replace('"archived":false', '"archived":true')
    Assert-Drift 'archived-changed' '*alpha-patches*archived*' 'A source that was archived'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.tracker.Content = $fakeForge.Answers.tracker.Content.Replace('SysAdminDoc/HushThreads', 'SysAdminDoc/hushfeed')
    Assert-Drift 'listing-changed' '*Morphe Patch Tracker no longer lists HushThreads*' 'A listing that disappeared'
    $fakeForge.Answers = New-FakeAnswers

    # The tracker has listed one owner under keys that differ only in case (immortalzeus:dev and
    # ImmortalZeus:dev). The audit reads both and counts the repository once.
    $trackerApps = '"apps":[{"package":"com.instagram.barcelona","patches":[{"name":"Hide ads"}]}]'
    $fakeForge.Answers.tracker.Content = '{"sysadmindoc:stable":{"repo_url":"https://github.com/SysAdminDoc/HushThreads",' + $trackerApps + '},' +
        '"alpha:stable":{"repo_url":"https://github.com/fixture-owner/alpha-patches",' + $trackerApps + '},' +
        '"Alpha:stable":{"repo_url":"https://github.com/fixture-owner/alpha-patches",' + $trackerApps + '}}'
    $cased = Invoke-Audit
    Assert-True ($cased.ExitCode -eq 0 -and $cased.Said -like '*Morphe Patch Tracker: 2 Threads bundles; HushThreads listed*') `
        ("Tracker keys that differ only in case were not read: exit $($cased.ExitCode), " +
            (@($cased.Report.findings | ForEach-Object { "$($_.kind): $($_.repository) $($_.detail)" }) -join ' | '))
    Reset-FixtureLedger
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.official.Content = '{"patches":[{"name":"Hide ads","compatiblePackages":[{"packageName":"com.instagram.barcelona"}]}]}'
    Assert-Drift 'official-bundle-changed' '*official bundle now patches*com.instagram.barcelona*' 'The official bundle taking on Threads'
    $fakeForge.Answers = New-FakeAnswers

    # An adopted source's receipt has to prove every declared build, unforced.
    $fakeForge.Answers.receipt.Content = $fakeForge.Answers.receipt.Content -replace '"forced":\s*false', '"forced": true'
    Assert-Drift 'fixture-evidence' "*alpha-patches*no unforced run of Threads $($declaredBuilds[0])*" 'An adopted source whose receipt forced a build'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.alphaRepo.Content = $fakeForge.Answers.alphaRepo.Content.Replace('"fixture-owner/alpha-patches"', '"fixture-owner/alpha-renamed"')
    Assert-Drift 'renamed' '*alpha-patches*now https://github.com/fixture-owner/alpha-renamed*' 'A source that was renamed'
    $fakeForge.Answers = New-FakeAnswers

    # A recorded fork or an out-of-scope repository that an index lists as a bundle of its own. The
    # control's archived copy of the fork's list, for alpha's own package, stayed quiet.
    foreach ($listed in @('someone/alpha-patches', 'noise/mentions-threads')) {
        $fakeForge.Answers.directory.Content = $fakeForge.Answers.directory.Content.Replace('"repo":  "fixture-owner/alpha-patches"', "`"repo`":  `"$listed`"").Replace(
            '"repo": "fixture-owner/alpha-patches"', "`"repo`": `"$listed`"")
        Assert-True ($fakeForge.Answers.directory.Content -like "*$listed*") "The directory answer was not edited, so the $listed case would prove nothing."
        $expected = if ($listed -like 'someone/*') { "*github.com/$listed*recorded fork of alpha*Morphe directory*" } else { "*$listed*out of scope*Morphe directory*" }
        Assert-Drift 'listed-as-bundle' $expected "The directory listing $listed as a bundle"
        $fakeForge.Answers = New-FakeAnswers
    }

    $fakeForge.Answers.searchHits[1].sha = ('8b' * 20)
    Assert-Drift 'mirror-changed' '*copier/alpha-copy*' 'A recorded copy whose file changed'
    $fakeForge.Answers = New-FakeAnswers

    # A recorded fork whose Threads files code search finds and no lineage holds: no index lists
    # it, so only its files say it carries work of its own.
    $fakeForge.Answers.searchHits = @($fakeForge.Answers.searchHits) + @(
        @{ repository = @{ full_name = 'someone/alpha-patches' }; path = 'patches/Alpha.kt'; sha = $blobKnown }
        @{ repository = @{ full_name = 'someone/alpha-patches' }; path = 'patches/Novel.kt'; sha = ('8c' * 20) })
    Assert-Drift 'fork-changed' '*github.com/someone/alpha-patches*recorded fork of alpha holds 1 Threads file*' 'A recorded fork with a Threads file of its own'
    $forkResult = Invoke-Audit
    $forkFinding = @($forkResult.Report.findings | Where-Object { $_.kind -eq 'fork-changed' })
    Assert-True ($forkFinding.Count -eq 1 -and @($forkFinding[0].evidence.hits).Count -eq 1 -and $forkFinding[0].evidence.hits[0].path -eq 'patches/Novel.kt') `
        "The recorded fork's finding didn't name just its own file: $(ConvertTo-Json -Compress -Depth 6 -InputObject $forkFinding)"
    $fakeForge.Answers = New-FakeAnswers

    # Many such files make one finding that names 20 of them and counts the rest.
    $fakeForge.Answers.searchHits = @($fakeForge.Answers.searchHits) + @(for ($n = 0; $n -lt 25; $n++) {
        @{ repository = @{ full_name = 'someone/alpha-patches' }; path = "patches/Novel$n.kt"; sha = ('{0:x2}' -f (0xa0 + $n)) * 20 } })
    $manyResult = Invoke-Audit
    $manyFinding = @($manyResult.Report.findings | Where-Object { $_.kind -eq 'fork-changed' })
    Assert-True ($manyResult.ExitCode -eq 1 -and $manyFinding.Count -eq 1 -and @($manyFinding[0].evidence.hits).Count -eq 20 -and $manyFinding[0].evidence.more -eq 5) `
        "A recorded fork with 25 files of its own didn't make one finding naming 20 and counting 5: $(ConvertTo-Json -Compress -Depth 4 -InputObject $manyFinding)"
    Assert-True ([IO.File]::ReadAllText($fixtureLedgerPath) -ceq $fixtureLedgerText) 'An audit with a changed recorded fork changed the ledger.'
    $fakeForge.Answers = New-FakeAnswers

    # A recorded fork found under its old name gets the same check.
    $fakeForge.Answers.searchHits = @($fakeForge.Answers.searchHits) + @(
        @{ repository = @{ full_name = 'fixture-owner/alpha-old' }; path = 'patches/Novel.kt'; sha = ('8d' * 20) })
    $fakeForge.Answers.oldNameMeta.Content = '{"full_name":"someone/alpha-patches","fork":true,"archived":false}'
    Assert-Drift 'fork-changed' '*github.com/someone/alpha-patches*recorded fork of alpha*' 'A recorded fork found by its old name with a Threads file of its own'
    $fakeForge.Answers = New-FakeAnswers

    # A recorded fork holding only files its lineage or that lineage's copies hold stays quiet.
    $fakeForge.Answers.searchHits = @($fakeForge.Answers.searchHits) + @(
        @{ repository = @{ full_name = 'someone/alpha-patches' }; path = 'patches/Alpha.kt'; sha = $blobKnown }
        @{ repository = @{ full_name = 'someone/alpha-patches' }; path = 'patches/Copy.kt'; sha = $blobMirror })
    $sameFork = Invoke-Audit
    Assert-True ($sameFork.ExitCode -eq 0 -and @($sameFork.Report.findings | Where-Object { $_.kind -eq 'fork-changed' }).Count -eq 0) `
        ("A recorded fork holding only its lineage's files was reported: " +
            (@($sameFork.Report.findings | ForEach-Object { "$($_.kind): $($_.repository) $($_.detail)" }) -join ' | '))
    Reset-FixtureLedger
    $fakeForge.Answers = New-FakeAnswers

    # A file only another lineage holds is still news in a recorded fork or copy of this one.
    $blobBeta = '3b' * 20
    $crossLedger = $fixtureLedgerText | ConvertFrom-Json
    $crossLedger.entries[1].contentHashes = @($blobBeta)
    $crossLedgerText = ($crossLedger | ConvertTo-Json -Depth 20) -replace "`r`n", "`n"
    [IO.File]::WriteAllText($fixtureLedgerPath, $crossLedgerText, (New-Object Text.UTF8Encoding $false))
    $fakeForge.Answers.searchHits = @($fakeForge.Answers.searchHits) + @(
        @{ repository = @{ full_name = 'someone/alpha-patches' }; path = 'patches/Beta.kt'; sha = $blobBeta })
    $fakeForge.Answers.searchHits[1].sha = $blobBeta
    $cross = Invoke-Audit
    $crossFork = @($cross.Report.findings | Where-Object { $_.kind -eq 'fork-changed' -and $_.repository -like '*someone/alpha-patches' })
    $crossCopy = @($cross.Report.findings | Where-Object { $_.kind -eq 'mirror-changed' -and $_.repository -like '*copier/alpha-copy' })
    Assert-True ($cross.ExitCode -eq 1 -and $crossFork.Count -eq 1 -and @($crossFork[0].evidence.hits).Count -eq 1 -and
        $crossFork[0].evidence.hits[0].path -ceq 'patches/Beta.kt' -and $crossCopy.Count -eq 1) `
        ("A recorded fork and copy of alpha holding beta's file weren't both reported: " +
            (@($cross.Report.findings | ForEach-Object { "$($_.kind): $($_.repository) $($_.detail)" }) -join ' | '))
    Assert-True ([IO.File]::ReadAllText($fixtureLedgerPath) -ceq $crossLedgerText) 'An audit with a fork holding another lineage''s file changed the ledger.'
    Reset-FixtureLedger
    $fakeForge.Answers = New-FakeAnswers

    # Two paths that differ only by case are two files.
    $fakeForge.Answers.searchHits = @($fakeForge.Answers.searchHits) + @(
        @{ repository = @{ full_name = 'someone/alpha-patches' }; path = 'patches/Novel.kt'; sha = ('8e' * 20) }
        @{ repository = @{ full_name = 'someone/alpha-patches' }; path = 'patches/novel.kt'; sha = ('8f' * 20) })
    $caseResult = Invoke-Audit
    $caseFinding = @($caseResult.Report.findings | Where-Object { $_.kind -eq 'fork-changed' })
    Assert-True ($caseFinding.Count -eq 1 -and @($caseFinding[0].evidence.hits).Count -eq 2) `
        "A recorded fork's two files differing only by case weren't both named: $(ConvertTo-Json -Compress -Depth 6 -InputObject $caseFinding)"
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.alphaBranches.Content = "[{`"name`":`"trunk`",`"commit`":{`"sha`":`"$commitA1`"}}]"
    Assert-Drift 'branch-removed' '*alpha-patches*branch main is gone*' 'A pinned branch that was deleted'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.betaLicense = @{ Status = 200; Content = (@{ path = 'LICENSE'; content = $licenseBase64; license = @{ spdx_id = 'MIT' } } | ConvertTo-Json) }
    Assert-Drift 'license-added' '*beta-module*now has a licence (MIT*' 'An unlicensed source that gained a licence'
    $fakeForge.Answers = New-FakeAnswers

    # Jman's registry. A repository is a Threads bundle only through a current, verified release of an
    # enabled source; history, unverified metadata and a bare registration are not promoted to one.
    $newcomerUrl = 'https://github.com/newcomer/threads-patches'
    $selfUrl = 'https://github.com/SysAdminDoc/HushThreads'
    function Set-RegistryRows {
        param($Rows)
        $fakeForge.Answers.jmanPages = @{ '0' = New-RegistryPage -Rows @($Rows) -Total @($Rows).Count }
    }
    $alphaRow = New-RegistryRow -Id 'a-latest' -Url 'https://github.com/fixture-owner/alpha-patches'
    $gammaRow = New-RegistryRow -Id 'g-latest' -Url 'https://gitlab.com/fixture-group/gamma-patches'

    Set-RegistryRows @($alphaRow, $gammaRow, (New-RegistryRow -Id 'n-latest' -Url $newcomerUrl -Version 'v0.5.0-dev.1' -Prerelease $true -Channels @('dev')))
    $current = Invoke-Audit
    $addition = @($current.Report.findings | Where-Object { $_.kind -eq 'addition' -and $_.repository -like '*newcomer/threads-patches' })
    Assert-True ($current.ExitCode -eq 1 -and $addition.Count -eq 1 -and @($addition[0].evidence.packages) -contains 'com.instagram.barcelona' -and
        @($addition[0].evidence.registry[0].latest) -contains 'v0.5.0-dev.1 prerelease [dev]') `
        "A current prerelease the registry serves was not reported with its channel: $($current.Report.findings | ConvertTo-Json -Depth 8 -Compress)"
    Reset-FixtureLedger
    $fakeForge.Answers = New-FakeAnswers

    Set-RegistryRows @($alphaRow, $gammaRow, (New-RegistryRow -Id 'n-old' -Url $newcomerUrl -Latest $false -Channels @()))
    $history = Invoke-Audit
    $addition = @($history.Report.findings | Where-Object { $_.kind -eq 'addition' -and $_.repository -like '*newcomer/threads-patches' })
    Assert-True ($history.ExitCode -eq 1 -and $addition.Count -eq 1 -and @($addition[0].evidence.packages).Count -eq 0 -and
        @($addition[0].evidence.mentions) -contains 'com.instagram.barcelona' -and $addition[0].evidence.registry[0].historical -eq 1) `
        "A repository the registry holds only as history was promoted to a Threads bundle: $($history.Report.findings | ConvertTo-Json -Depth 8 -Compress)"
    Reset-FixtureLedger
    $fakeForge.Answers = New-FakeAnswers

    Set-RegistryRows @($alphaRow, $gammaRow, (New-RegistryRow -Id 'n-latest' -Url $newcomerUrl -Status 'unverified'))
    $incomplete = Invoke-Audit
    $addition = @($incomplete.Report.findings | Where-Object { $_.kind -eq 'addition' -and $_.repository -like '*newcomer/threads-patches' })
    Assert-True ($addition.Count -eq 1 -and @($addition[0].evidence.packages).Count -eq 0 -and $addition[0].evidence.registry[0].unverified -eq 1 -and
        @($addition[0].evidence.registry[0].latest) -contains 'v1.0.0 stable [latest,stable] unverified') `
        "A latest release with unverified metadata was promoted: $($incomplete.Report.findings | ConvertTo-Json -Depth 8 -Compress)"
    Reset-FixtureLedger
    $fakeForge.Answers = New-FakeAnswers

    # A renamed repository is read under its current name, and a recorded source listed there is not an addition.
    Set-RegistryRows @($gammaRow, (New-RegistryRow -Id 'a-latest' -Url 'https://github.com/fixture-owner/alpha-old' -Repo 'alpha-patches' -Owner 'fixture-owner'))
    $renamed = Invoke-Audit
    Assert-True ($renamed.ExitCode -eq 0 -and @($renamed.Report.notes | Where-Object { $_ -like "*registry lists https://github.com/fixture-owner/alpha-old under its current name https://github.com/fixture-owner/alpha-patches*" }).Count -eq 1) `
        "A renamed registry repository was not read under its current name: $($renamed.Report.findings | ConvertTo-Json -Depth 8 -Compress)"
    Reset-FixtureLedger
    $fakeForge.Answers = New-FakeAnswers

    # HushThreads' own listing needs registration and a current, verified release.
    $fakeForge.Answers.jmanConfig.Content = '{"alpha":{"patches":"https://github.com/fixture-owner/alpha-patches","disabled":false},"gamma":{"patches":"https://gitlab.com/fixture-group/gamma-patches","disabled":false},"hushthreads":{"patches":"https://github.com/SysAdminDoc/HushThreads","disabled":false}}'
    Set-RegistryRows @($alphaRow, $gammaRow, (New-RegistryRow -Id 'h-latest' -Url $selfUrl))
    Assert-Drift 'listing-changed' "*Jman's Patch Bundle Registry lists HushThreads now*" 'HushThreads registered and served as a current release'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.jmanConfig.Content = '{"alpha":{"patches":"https://github.com/fixture-owner/alpha-patches","disabled":false},"gamma":{"patches":"https://gitlab.com/fixture-group/gamma-patches","disabled":false},"hushthreads":{"patches":"https://github.com/SysAdminDoc/HushThreads","disabled":false}}'
    Set-RegistryRows @($alphaRow, $gammaRow, (New-RegistryRow -Id 'h-old' -Url $selfUrl -Latest $false -Channels @()))
    $selfHistory = Invoke-Audit
    Assert-True ($selfHistory.ExitCode -eq 0 -and @($selfHistory.Report.notes | Where-Object { $_ -like "*holds HushThreads only as history*" }).Count -eq 1) `
        "HushThreads held only as history was read as a current listing: $($selfHistory.Report.findings | ConvertTo-Json -Depth 8 -Compress)"
    Reset-FixtureLedger
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.jmanConfig.Content = '{"hushthreads":{"patches":"https://github.com/SysAdminDoC/HushThreads","disabled":true}}'
    Set-RegistryRows @($alphaRow, $gammaRow, (New-RegistryRow -Id 'h-latest' -Url $selfUrl))
    $selfDisabled = Invoke-Audit
    Assert-True ($selfDisabled.ExitCode -eq 0 -and @($selfDisabled.Report.notes | Where-Object { $_ -like "*holds HushThreads only as history*" }).Count -eq 1) `
        "HushThreads on a disabled registration was read as a current listing: $($selfDisabled.Report.notes -join ' | ')"
    Reset-FixtureLedger
    $fakeForge.Answers = New-FakeAnswers

    # A registered, verified current release still isn't a listing when the registry serves it from an
    # unavailable source, or from one a later row says is disabled.
    $selfRegistration = '{"hushthreads":{"patches":"https://github.com/SysAdminDoc/HushThreads","disabled":false}}'
    $selfUnavailable = New-RegistryRow -Id 'h-latest' -Url $selfUrl
    $selfUnavailable.source.unavailable_reason = 'repository archived'
    $selfOff = New-RegistryRow -Id 'h-latest' -Url $selfUrl
    $selfOff.source.enabled = $false
    foreach ($case in @(@{ Name = 'an unavailable source'; Rows = @($alphaRow, $gammaRow, $selfUnavailable) },
            @{ Name = 'a source a later row disables'; Rows = @($alphaRow, $gammaRow, (New-RegistryRow -Id 'h-old' -Url $selfUrl -Latest $false -Channels @()), $selfOff) })) {
        $fakeForge.Answers.jmanConfig.Content = $selfRegistration
        Set-RegistryRows $case.Rows
        $selfSource = Invoke-Audit
        Assert-True ($selfSource.ExitCode -eq 0 -and @($selfSource.Report.notes | Where-Object { $_ -like "*holds HushThreads only as history*" }).Count -eq 1) `
            "HushThreads served from $($case.Name) was read as a current listing: $($selfSource.Report.notes -join ' | ')"
        Reset-FixtureLedger
        $fakeForge.Answers = New-FakeAnswers
    }

    # Registered twice, once disabled and once not, is still registered, whichever comes last.
    $fakeForge.Answers.jmanConfig.Content = '{"alpha":{"patches":"https://github.com/fixture-owner/alpha-patches","disabled":false},"gamma":{"patches":"https://gitlab.com/fixture-group/gamma-patches","disabled":false},"hushthreads":{"patches":"https://github.com/SysAdminDoc/HushThreads","disabled":false},"hushthreads-old":{"patches":"https://github.com/SysAdminDoc/HushThreads","disabled":true}}'
    Set-RegistryRows @($alphaRow, $gammaRow, (New-RegistryRow -Id 'h-latest' -Url $selfUrl))
    Assert-Drift 'listing-changed' "*Jman's Patch Bundle Registry lists HushThreads now*" 'HushThreads registered twice with one registration disabled'
    $fakeForge.Answers = New-FakeAnswers

    # Rows the audit can't read are reported, and what it can't read of the list fails the source.
    $noSource = New-RegistryRow -Id 'broken' -Url 'https://github.com/x/y'
    $noSource.Remove('source')
    $noPackages = New-RegistryRow -Id 'no-packages' -Url 'https://github.com/x/z'
    $noPackages.Remove('packages')
    Set-RegistryRows @($alphaRow, $gammaRow, $noSource, $noPackages)
    Assert-Drift 'index-unresolved' "*Jman's registry returned 2 Threads bundle row(s) with no id, repository address or package list*" 'Registry rows with no repository or package list'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.jmanPages['0'].Content = $fakeForge.Answers.jmanPages['0'].Content -replace '"total":\s*4', '"total": "many"'
    Assert-Drift 'source-failed' "*Jman's bundle index could not be read*numeric total*" 'A registry page with no numeric total'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.jmanPages['1'] = New-RegistryPage -Rows @() -Total 4
    Assert-Drift 'source-failed' "*Jman's bundle index could not be read*empty page*" 'A registry list that ends before its total'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.jmanPages['1'] = @{ Status = 500; Content = $null }
    Assert-Drift 'source-failed' "*Jman's bundle index could not be read*HTTP 500*" 'A registry page that answers an error'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.jmanPages['0'] = @{ Unreachable = $true; Status = 0; Content = $null }
    Assert-Drift 'source-failed' "*Jman's bundle index could not be read*Could not reach*" 'A registry that can not be reached'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.jmanConfig = @{ Status = 404; Content = $null }
    Assert-Drift 'source-failed' "*Jman's bundle index could not be read*HTTP 404*" 'The registry registration moving away'
    $fakeForge.Answers = New-FakeAnswers

    foreach ($budget in @(@{ Name = 'requests'; Extra = @{ RegistryMaxRequests = 1 } }, @{ Name = 'rows'; Extra = @{ RegistryMaxRows = 1 } })) {
        $result = Invoke-Audit $budget.Extra
        Assert-True ($result.ExitCode -eq 1 -and @($result.Report.findings | Where-Object { $_.kind -eq 'source-failed' -and $_.detail -like "*Jman's bundle index could not be read*list is incomplete*budget*" }).Count -eq 1) `
            "A registry list longer than the $($budget.Name) budget was not reported as incomplete: $($result.Said)"
        Assert-True ([IO.File]::ReadAllText($fixtureLedgerPath) -ceq $fixtureLedgerText) "An audit with an exhausted registry $($budget.Name) budget changed the ledger."
    }
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

    # A rate limit is waited out until the reset the answer names: Retry-After in seconds or as a
    # date, or GitLab's RateLimit-Reset in seconds since 1970, one second past it. An answer naming
    # no reset waits RateLimitWaitSeconds, and a fourth limit is a failure.
    function Set-LimitedForks {
        param([object[]]$Headers)
        $queue = New-Object 'System.Collections.Generic.Queue[object]'
        foreach ($set in $Headers) { $queue.Enqueue($set) }
        $fakeForge.Answers.gammaForks.LimitedFirst = $queue
    }
    $limitCases = @(
        @{ Case = 'A Retry-After in seconds'; Headers = { @{ 'Retry-After' = '7' } }; Low = 8; High = 8; Named = $true }
        @{ Case = 'A Retry-After date'; Headers = { @{ 'Retry-After' = [DateTimeOffset]::UtcNow.AddSeconds(30).ToString('r') } }
            Low = 29; High = 32; Named = $true }
        @{ Case = "GitLab's RateLimit-Reset"; Headers = { @{ 'RateLimit-Reset' = [string]([DateTimeOffset]::UtcNow.ToUnixTimeSeconds() + 20) } }
            Low = 19; High = 22; Named = $true }
        @{ Case = "GitHub's X-RateLimit-Reset"; Headers = { @{ 'X-RateLimit-Reset' = [string]([DateTimeOffset]::UtcNow.ToUnixTimeSeconds() + 15) } }
            Low = 14; High = 17; Named = $true }
        @{ Case = 'A RateLimit-Reset in seconds from now'; Headers = { @{ 'RateLimit-Reset' = '12' } }; Low = 13; High = 13; Named = $true }
        @{ Case = 'An answer naming no reset'; Headers = { @{} }; Low = 5; High = 5; Named = $false; Extra = @{ RateLimitWaitSeconds = 5 } }
        # The header collections the two shells really hand over: Windows PowerShell's
        # WebHeaderCollection and PowerShell 7's HttpResponseHeaders. The comma keeps each whole.
        @{ Case = 'A WebHeaderCollection'; Headers = { $web = New-Object System.Net.WebHeaderCollection; $web.Add('Retry-After', '9'); , $web }
            Low = 10; High = 10; Named = $true }
        @{ Case = 'HttpResponseHeaders'; Headers = {
                # .NET Framework's HttpStatusCode has no 429, and the headers don't depend on the status.
                $http = ([System.Net.Http.HttpResponseMessage]::new()).Headers
                [void]$http.TryAddWithoutValidation('RateLimit-Reset', [string]([DateTimeOffset]::UtcNow.ToUnixTimeSeconds() + 25)); , $http }
            Low = 24; High = 27; Named = $true }
    )
    Add-Type -AssemblyName System.Net.Http
    foreach ($limit in $limitCases) {
        Set-LimitedForks @(& $limit.Headers)
        $limitArguments = if ($limit.Extra) { $limit.Extra } else { @{} }
        $result = Invoke-Audit $limitArguments
        $waits = @($fakeForge.Sleeps | Where-Object { $_ -gt 0 })
        Assert-True ($result.ExitCode -eq 0) "$($limit.Case) was not waited out: $($result.Said)"
        Assert-True ($waits.Count -eq 1 -and $waits[0] -ge $limit.Low -and $waits[0] -le $limit.High) `
            "$($limit.Case) waited $($waits -join ', ') s, not $($limit.Low) to $($limit.High) s."
        Assert-True (($result.Said -like '*rate limited on gitlab.com*for the reset it names*') -eq $limit.Named) `
            "$($limit.Case) did not say whether it waited for a named reset: $($result.Said)"
        Reset-FixtureLedger
        $fakeForge.Answers = New-FakeAnswers
    }
    # A reset further off than the cap isn't slept through, since GitLab's hourly window would keep
    # a run quiet for most of an hour. The source fails at once and the log says when it lifts.
    foreach ($far in @(@{ Case = 'A reset past the cap'; Headers = @{ 'Retry-After' = '100000' } },
            @{ Case = 'A Retry-After too big for a number of seconds'; Headers = @{ 'Retry-After' = [string][long]::MaxValue } })) {
        Set-LimitedForks @($far.Headers)
        $farRun = Invoke-Audit
        Assert-True ($farRun.ExitCode -eq 1 -and @($farRun.Report.findings | Where-Object { $_.kind -eq 'source-failed' -and $_.detail -like '*forks of fixture-group/gamma-patches answered HTTP 429*' }).Count -eq 1) `
            "$($far.Case) didn't fail its source (exit $($farRun.ExitCode)): $($farRun.Said)"
        Assert-True (@($fakeForge.Sleeps | Where-Object { $_ -gt 0 }).Count -eq 0) "$($far.Case) was slept through: $($fakeForge.Sleeps -join ', ') s."
        Assert-True ($farRun.Said -like '*rate limited on gitlab.com until about * UTC, past the 300 s cap, so not waiting*') `
            "$($far.Case) didn't say when the limit lifts: $($farRun.Said)"
        Assert-True ([IO.File]::ReadAllText($fixtureLedgerPath) -ceq $fixtureLedgerText) "$($far.Case) changed the ledger."
        $fakeForge.Answers = New-FakeAnswers
    }
    Set-LimitedForks @(@{ 'Retry-After' = '3' }, @{ 'Retry-After' = '3' }, @{ 'Retry-After' = '3' }, @{ 'Retry-After' = '3' })
    Assert-Drift 'source-failed' '*forks of fixture-group/gamma-patches answered HTTP 429*' 'A rate limit that outlasts three waits'
    Assert-True (@($fakeForge.Sleeps | Where-Object { $_ -gt 0 }).Count -eq 3) `
        "A rate limit that outlasts three waits was waited out $(@($fakeForge.Sleeps | Where-Object { $_ -gt 0 }).Count) time(s), not 3."
    $fakeForge.Answers = New-FakeAnswers

    # GitLab code search needs a token, or an explicit skip the census records.
    $env:GITLAB_TOKEN = $null
    Assert-Throws { Invoke-Audit @{ SkipGitLabCodeSearch = $false } } '*GITLAB_TOKEN*' 'The audit ran without GitLab code search and without saying so.'
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
$libraryText = [IO.File]::ReadAllText((Join-Path $PSScriptRoot 'threads-sources.ps1'))
foreach ($pair in @(@('audit-threads-sources.ps1', $auditText), @('threads-sources.ps1', $libraryText))) {
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
    $found = @(Get-ImportProblems -Text ($auditText + "`n" + $bad.Line + "`n") -Name 'audit-threads-sources.ps1 (copy)')
    Assert-True (@($found | Where-Object { $_ -like $bad.Pattern }).Count -gt 0) "The import check missed: $($bad.Line)"
}

Write-Host '[sources] the audit and its rules hold nothing that clones, downloads to disk or copies code'
Write-Host '[sources] source ledger contracts passed'
} finally {
    $env:GITLAB_TOKEN = $savedGitLabToken
    Remove-Item -LiteralPath $caseRoot -Recurse -Force -ErrorAction SilentlyContinue
}
