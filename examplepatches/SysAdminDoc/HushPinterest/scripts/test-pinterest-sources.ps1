<#
.SYNOPSIS
    Hold the Pinterest source ledger and its audit to their rules, with no network.

.DESCRIPTION
    The checked-in ledger has to keep every rule of scripts/pinterest-sources.ps1, and
    docs/sources.md can't link a source the ledger doesn't know or call a behavior-only source
    portable. Then each rule is broken once on a copy, and each has to be refused by name: an
    adopted source missing its pinned commit, compatible licence, NOTICE entry, provenance rule or
    two-fixture evidence, an unlicensed or contaminated source that isn't behavior-only, a
    provenance rule crediting a source the ledger doesn't allow, an index with no listing record.
    The checked-in ledger adopts nothing and holds no behavior-only source, so the copy gets an
    adopted, an unlicensed and a contaminated fixture source for those rules to bite on. The census
    is held to its 14 days on both sides of the line.

    scripts/audit-pinterest-sources.ps1 then runs against a stand-in for every forge and index it
    reads, so nothing here touches the network: a request the stand-in doesn't know fails the case.
    A clean run stamps only dates and collapses a byte-for-byte copy into its lineage; an addition
    from an index or code search, a removed licence, a moved branch head, a new branch with
    Pinterest work, an unseen fork, a repository that's gone and a changed listing each exit
    1 with the ledger untouched. Through all of it the audit writes nothing but its report and the
    ledger's dates, and a parse of its source finds nothing that clones, downloads to disk or
    copies files, with a copy that does each of those as the proof the parse can see them.

    The pre-push hook runs this for the audit, its rules, the ledger, provenance.json and NOTICE.
#>
[CmdletBinding()]
param([string]$Root)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $PSScriptRoot 'pinterest-sources.ps1')

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

$caseRoot = Join-Path ([IO.Path]::GetTempPath()) ("hushpinterest-sources-" + [guid]::NewGuid().ToString('N'))
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
# These pinned research facts distinguish a candidate with a pack count, a dev-branch-only
# candidate and a historical reference. None changes a source's adoption status or the commit in
# an adopted provenance rule.
$browz = @($entries | Where-Object { $_.id -eq 'browzomje' })[0]
Assert-True ($browz.branches[0].name -eq 'main' -and $browz.branches[0].commit -eq '9dd5c671148f8849966c6369e2a009d5ffb92d45' -and
    $browz.patchCounts.'com.pinterest' -eq 28 -and @($browz.features).Count -eq 24 -and $browz.disposition -eq 'candidate') `
    'browzomje must keep its pinned main commit and its 28 Pinterest patches, as a candidate and not an adopted source.'
$oyasumi = @($entries | Where-Object { $_.id -eq 'oyasumi' })[0]
Assert-True ($oyasumi.branches.Count -eq 1 -and $oyasumi.branches[0].name -eq 'dev' -and
    $oyasumi.branches[0].commit -eq '4d6329b9c8a0dcbf7f00cc97cf2e8601224e8dba' -and $oyasumi.patchCounts.'com.pinterest' -eq 13 -and
    $oyasumi.targetVersions.'com.pinterest' -contains '14.38.0' -and $oyasumi.reason -like '*dev branch only*' -and
    $oyasumi.reason -like '*v0.6.0-dev.24*' -and $oyasumi.reason -like '*Stable v0.5.3*' -and
    $oyasumi.watchPaths -contains 'extensions/extension/src/main/java/app/oyasumi/extension' -and
    $oyasumi.disposition -eq 'candidate') `
    'oyasumi must distinguish thirteen dev Pinterest patches from stable v0.5.3, without claiming adoption.'
$mubelotix = @($entries | Where-Object { $_.id -eq 'mubelotix' })[0]
Assert-True ($mubelotix.repository -ceq 'https://github.com/Mubelotix/my-morphe-patches' -and
    $mubelotix.branches[0].commit -eq '8b6f75e226634c6a0b4031bba6cda1de7db146a0' -and
    $mubelotix.license.url -like '*8b6f75e226634c6a0b4031bba6cda1de7db146a0/LICENSE' -and
    $mubelotix.license.sha256 -eq '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986' -and
    $mubelotix.patchCounts.'com.pinterest' -eq 2 -and $mubelotix.features -contains 'Remove GMA ads' -and
    $mubelotix.features -contains 'Remove promoted content' -and $mubelotix.targetVersions.'com.pinterest'.Count -eq 1 -and
    $mubelotix.targetVersions.'com.pinterest'[0] -eq '14.23.0' -and $mubelotix.disposition -eq 'candidate' -and
    $mubelotix.reason -like '*Mubelotix/my-revanced-patches*') `
    'Mubelotix must keep its canonical name, reviewed commit and license, and two 14.23.0 candidate patches.'
$stale = @($entries | Where-Object { $_.id -in @('binarymend', 'satanmerde') })
Assert-True ($stale.Count -eq 2 -and @($stale | Where-Object { $_.disposition -ne 'rejected' }).Count -eq 0) `
    'binarymend and satanmerde have no usable anchors and must stay rejected.'
$nagramRepository = 'https://github.com/authorisation/xterest'
$nagram = @($ledger.outOfScope | Where-Object { $_.repository -eq $nagramRepository })[0]
Assert-True ($nagram.reference.kind -eq 'historical' -and $nagram.reference.branch -eq 'main' -and
    $nagram.reference.commit -eq 'dc294079d77db4ef61accc442897ef263da26e13' -and $nagram.reference.archived -eq $false -and
    $nagram.reference.verifiedAt -eq '2026-10-02' -and $null -eq $nagram.reference.archivedAt) `
    'xterest must remain a pinned historical reference with an unknown archive date.'

# Fixture sources for the rules the checked-in ledger has nothing to test with: it adopts nothing
# and holds no unlicensed or contaminated source. The rule cases below add them to a copy, with the
# NOTICE line and provenance rule the adopted one needs.
$catalogBuilds = @((Get-PatchTarget -PatchList ([IO.File]::ReadAllText((Join-Path $Root 'patches-list.json')) | ConvertFrom-Json)).PackageVersions)
Assert-True ($catalogBuilds.Count -ge 1) 'The catalog declares no Pinterest build, so the two-fixture cases would prove nothing.'
Assert-True ($catalogBuilds -notcontains '14.23.0' -and @($entries | Where-Object { $_.disposition -eq 'adopted' }).Count -eq 0) `
    'Reviewing native sources must not adopt their code or add 14.23.0 support.'
# Two-fixture evidence is two builds, every declared one among them. Pinterest declares one, so the
# fixture adds the build before it.
$olderBuild = '14.24.0'
Assert-True ($catalogBuilds -notcontains $olderBuild) "The catalog declares $olderBuild, so the fixture's second build is no second build."
$fixtureLicenseHash = 'a' * 64
$fixtureAdoptedRepository = 'https://github.com/fixture-owner/adopted-patches'
$fixtureAdoptedCommit = 'ad' * 20
$fixtureUnlicensedRepository = 'https://github.com/fixture-owner/unlicensed-module'
function New-RuleFixtureEntry {
    param([string]$Id, [string]$Repository, [string]$Kind, $License, [string]$Disposition, $ContaminatedBy, [string[]]$Forks)
    return [pscustomobject][ordered]@{ id = $Id; repository = $Repository; lineage = $Id; upstream = $null; kind = $Kind
        packages = @('com.pinterest'); targetVersions = [pscustomobject]@{ 'com.pinterest' = @($catalogBuilds[0]) }
        features = @('Hide ads'); branches = @([pscustomobject]@{ name = 'main'; commit = ('0f' * 20) }); watchPaths = @()
        license = $License; contaminatedBy = $ContaminatedBy; disposition = $Disposition; reason = 'A fixture source.'; archived = $false
        forks = @($Forks); contentHashes = @(); mirrors = @(); lastChecked = '2026-09-01' }
}
function Add-RuleFixtures {
    param($Copy)
    $adopted = New-RuleFixtureEntry 'fixture-adopted' $fixtureAdoptedRepository 'morphe-patches' `
        ([pscustomobject]@{ spdx = 'GPL-3.0'; url = "$fixtureAdoptedRepository/blob/main/LICENSE"; sha256 = $fixtureLicenseHash }) 'adopted' $null @()
    $adopted | Add-Member -NotePropertyName adopted -NotePropertyValue ([pscustomobject]@{ commit = $fixtureAdoptedCommit
        fixtures = [pscustomobject]@{ receipt = 'https://github.com/SysAdminDoc/HushPinterest/releases/download/v9.9.9/release-receipt-9.9.9.json'
            builds = @($catalogBuilds + $olderBuild) } })
    $unlicensed = New-RuleFixtureEntry 'fixture-unlicensed' $fixtureUnlicensedRepository 'xposed-module' $null 'behavior-only' $null @('someone/unlicensed-module')
    $contaminated = New-RuleFixtureEntry 'fixture-contaminated' 'https://github.com/fixture-owner/contaminated-patches' 'morphe-patches' `
        ([pscustomobject]@{ spdx = 'GPL-3.0'; url = 'https://github.com/fixture-owner/contaminated-patches/blob/main/LICENSE'; sha256 = $fixtureLicenseHash }) `
        'behavior-only' ([pscustomobject]@{ source = $fixtureUnlicensedRepository; evidence = 'https://github.com/fixture-owner/contaminated-patches/issues/1' }) @()
    $Copy.entries = @(@($Copy.entries) + $adopted + $unlicensed + $contaminated)
    return $Copy
}

# docs/sources.md is the readable version of the ledger. A source it links has to be one the
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
    foreach ($address in @($index.url, $index.hushpinterest.url)) {
        $indexKey = ConvertTo-SourceKey $address
        if ($indexKey) { $known[$indexKey] = $index }
    }
}
# The family repositories HushPinterest was built from aren't ledger entries. provenance.json names
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
    foreach ($match in [regex]::Matches($Text, 'https://(?:github\.com|gitlab\.com)/[A-Za-z0-9_.\-/]+')) {
        $key = ConvertTo-SourceKey ($match.Value.TrimEnd('.', ')'))
        if ($key -and -not $known.ContainsKey($key)) { $problems.Add("docs/sources.md links $key, which the ledger doesn't know.") }
    }
    $portable = '(?i)\b(can be ported|ported with credit|port(ed)? it with credit|can be copied|copy its code)\b'
    foreach ($line in ($Text -split "`r?`n")) {
        if ($line -notmatch $portable) { continue }
        foreach ($entry in $Entries | Where-Object { $_.disposition -eq 'behavior-only' }) {
            if ($line.IndexOf([string]$entry.repository, [StringComparison]::OrdinalIgnoreCase) -ge 0) {
                $problems.Add("docs/sources.md calls $($entry.repository) portable, and the ledger says behavior-only: $line")
            }
        }
    }
    return $problems.ToArray()
}
# docs/sources.md is local operator documentation that git ignores. The pre-push hook copies it
# into the clean worktree it checks a pushed commit in, so the page is held to the ledger in both
# modes. Only a checkout that never had the page, such as a fresh clone, runs the check's own
# controls alone, and only while git still ignores the page.
$sourcesDocPath = Join-Path $Root 'docs/sources.md'
$haveSourcesDoc = Test-Path -LiteralPath $sourcesDocPath
if (-not $haveSourcesDoc) {
    & git -C $Root check-ignore -q -- 'docs/sources.md' 2>$null
    Assert-True ($LASTEXITCODE -eq 0) 'docs/sources.md is missing but git no longer ignores it, so it should be in this tree.'
}
$sourcesDoc = if ($haveSourcesDoc) { [IO.File]::ReadAllText($sourcesDocPath) } else { '' }
if ($haveSourcesDoc) {
    $docProblems = @(Test-SourcesDoc $sourcesDoc)
    Assert-True ($docProblems.Count -eq 0) ($docProblems -join ' | ')
    Assert-True ($sourcesDoc.Contains('28 Pinterest patches') -and
        $sourcesDoc.Contains($browz.branches[0].commit.Substring(0, 7)) -and $sourcesDoc.Contains($oyasumi.branches[0].commit.Substring(0, 7)) -and
        $sourcesDoc.Contains($mubelotix.branches[0].commit.Substring(0, 7)) -and
        $sourcesDoc.Contains($nagram.reference.commit.Substring(0, 7)) -and $sourcesDoc.Contains('dev branch only') -and
        $sourcesDoc.Contains('pinterest org:Xposed-Modules-Repo') -and $sourcesDoc.Contains('incomplete_results=false')) `
        'The source document lost a pin, release distinction or bounded search evidence.'
} else {
    Write-Host '[sources] docs/sources.md is local and this checkout has none, so only the page check''s own controls run here'
}
$staleClaims = '(?i)ReVanced (?:has|ships) no Pinterest patch|Pinterest patches? (?:are|is) undetectable|will not get your account banned|documented doing harmful things'
Assert-True (([IO.File]::ReadAllText($ledgerPath) + $sourcesDoc) -notmatch $staleClaims) `
    'The source ledger or its document restored a stale classification or unsupported client allegation.'
$docEntries = @((Add-RuleFixtures (Copy-Json $ledger)).entries)
$contaminated = @($docEntries | Where-Object { $_.id -eq 'fixture-contaminated' })[0]
$oldLine = "- [fixture-owner/contaminated-patches]($($contaminated.repository)) (GPL-3.0) ports those hooks. Its code can be ported with credit."
Assert-True (@(@(Test-SourcesDoc ($sourcesDoc + "`n" + $oldLine) $docEntries) -like '*calls*portable*').Count -gt 0) `
    'A docs line calling a contaminated source''s code portable passed the check.'
Assert-True (@(@(Test-SourcesDoc ($sourcesDoc + "`nSee https://github.com/unknown-owner/new-pinterest-patches.")) -like '*unknown-owner*').Count -gt 0) `
    'A docs link to a source the ledger doesn''t know passed the check.'

Write-Host $(if ($haveSourcesDoc) { '[sources] the checked-in ledger and docs/sources.md keep their rules' } else { '[sources] the checked-in ledger keeps its rules' })

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
Test-Broken { param($c) $c.indexes[0].hushpinterest.status = '' } '*records no HushPinterest listing*' 'An index with no listing record'
# No index lists HushPinterest before its first release, so the listing is made here.
Test-Broken { param($c) $c.indexes[0].hushpinterest = [pscustomobject]@{ status = 'listed'; url = $null; checked = '2026-09-25' } } `
    '*listed but records no https listing url*' 'A listing with no URL'
Test-Broken { param($c) $c.indexes[0].hushpinterest = [pscustomobject]@{ status = 'submitted'; url = 'https://example.com/issue/1' } } `
    '*submission date is not a yyyy-MM-dd date*' 'A submission with no date'
Test-Broken { param($c) $c.indexes = @($c.indexes | Select-Object -Skip 1) } '*has no record of index*' 'A ledger missing an index'
Test-Broken { param($c) $c.entries[1].repository = $c.entries[0].repository } '*which Entry*already names*' 'A repository listed twice'
Test-Broken { param($c) $c.entries[0].branches[0].commit = 'main' } '*has no pinned commit (40 hex characters)*' 'A branch with no pinned commit'
Test-Broken { param($c) $c.entries[0].lastChecked = '25/09/2026' } '*lastChecked is not a yyyy-MM-dd date*' 'A lastChecked that isn''t ISO'
Test-Broken { param($c) $c.entries[0].lastChecked = '2999-01-01' } '*lastChecked is 2999-01-01, after today*' 'A lastChecked in the future'
Test-Broken { param($c) $c.schemaVersion = 2 } '*schema*' 'An unsupported source ledger schema'
Test-Broken { param($c) $c.census.checkedAt = '2026-02-30' } '*census.checkedAt*date*' 'An impossible calendar date'
Test-Broken { param($c) $c.entries[0].features = @() } '*names no features*' 'A source with no features'
Test-Broken { param($c) $c.entries[0].targetVersions = [pscustomobject]@{} } '*records no declared target versions*' 'A source with no target versions'
Test-Broken { param($c) $c.entries[0].packages = @('org.example.otherapp') } '*names no Pinterest package*outOfScope*' 'A fork-only source'
Test-Broken { param($c) $c.entries[0].packages = @('com.pinterest', 'com.whatsapp') } '*neither Pinterest nor a package this ledger allows beside it*' `
    'A source for another app'
Test-Broken { param($c) $c.entries[0].targetVersions = [pscustomobject]@{ 'org.example.otherapp' = @('1.0.0') } } '*records no declared target versions for com.pinterest*' `
    'A source that records only another package''s builds'
Test-Broken { param($c) $c.entries[0].license = [pscustomobject]@{ spdx = 'GPL-3.0'; url = 'https://example.com/LICENSE'; sha256 = 'abc' } } `
    '*licence has no sha256*' 'A licence with no hash'
Test-Broken { param($c) $c.entries[0].lineage = '' } '*names no lineage*' 'A source with no lineage'

# Optional per-package counts must be complete and typed, without turning the feature union into
# a per-package count. Reference pins and archive verification have their own meaning and date.
Test-Broken { param($c) (Get-Entry $c 'browzomje').patchCounts = @() } '*patchCounts must be an object*' `
    'Per-package patch counts recorded as an array'
Test-Broken { param($c) $e = Get-Entry $c 'browzomje'; $e.patchCounts = @($e.patchCounts) } '*patchCounts must be an object*' `
    'Per-package patch counts hidden inside a one-item array'
Test-Broken { param($c) (Get-Entry $c 'browzomje').patchCounts.PSObject.Properties.Remove('com.pinterest') } `
    '*patchCounts records no count for com.pinterest*' 'Per-package counts omitting a declared package'
Test-Broken { param($c) (Get-Entry $c 'browzomje').patchCounts | Add-Member -NotePropertyName 'com.whatsapp' -NotePropertyValue 14 } `
    '*patchCounts names undeclared package*' 'A count for an undeclared package'
foreach ($invalidCount in @('14', 14.5, 0, -1, $null)) {
    Test-Broken { param($c) (Get-Entry $c 'browzomje').patchCounts.'com.pinterest' = $invalidCount } `
        '*patchCounts*must be a positive integer*' "An invalid per-package count '$invalidCount'"
}
function Get-NagramReference { param($Copy) return @($Copy.outOfScope | Where-Object { $_.repository -eq $nagramRepository })[0].reference }
Test-Broken { param($c) $item = @($c.outOfScope | Where-Object { $_.repository -eq $nagramRepository })[0]; $item.reference = @($item.reference) } `
    '*reference must be an object*' 'A reference hidden inside a one-item array'
Test-Broken { param($c) (Get-NagramReference $c).commit = 'dev' } '*reference needs a branch and pinned commit*' `
    'A historical reference with a moving branch instead of a commit'
Test-Broken { param($c) (Get-NagramReference $c).branch = '' } '*reference needs a branch and pinned commit*' `
    'A historical reference with no branch'
Test-Broken { param($c) (Get-NagramReference $c).kind = 'dependency' } '*reference kind must be historical or maintained*' `
    'Research recorded as a dependency'
Test-Broken { param($c) $r = Get-NagramReference $c; $r.archived = $true; $r.kind = 'maintained' } '*is archived, so its kind must be historical*' `
    'An archived reference classified as maintained'
Test-Broken { param($c) (Get-NagramReference $c).archived = 'true' } '*reference must say whether it is archived*' `
    'A string used for archive status'
Test-Broken { param($c) (Get-NagramReference $c).archived = @($true) } '*reference must say whether it is archived*' `
    'An array used for archive status'
Test-Broken { param($c) (Get-NagramReference $c).verifiedAt = @('2026-10-01') } '*reference verifiedAt must be a string*' `
    'An array used for the verification date'
Test-Broken { param($c) (Get-NagramReference $c).verifiedAt = $null } '*reference verifiedAt is not a yyyy-MM-dd date*' `
    'Archive status with no verification date'
Test-Broken { param($c) (Get-NagramReference $c).verifiedAt = '2999-01-01' } '*reference verifiedAt is 2999-01-01, after today*' `
    'Archive status verified in the future'
Test-Broken { param($c) (Get-NagramReference $c).PSObject.Properties.Remove('archivedAt') } '*must record archivedAt as a date or null*' `
    'An unknown archive date omitted instead of recorded as null'
Test-Broken { param($c) (Get-NagramReference $c).archivedAt = @('2026-09-30') } '*reference archivedAt must be a date string or null*' `
    'An array used for the archive date'
Test-Broken { param($c) $r = Get-NagramReference $c; $r.archived = $true; $r.verifiedAt = '2026-09-30'; $r.archivedAt = '2026-10-01' } '*reference archivedAt is after verifiedAt*' `
    'An archive date after its verification'
Test-Broken { param($c) $r = Get-NagramReference $c; $r.archived = $false; $r.archivedAt = '2026-09-01' } `
    '*records archivedAt but is not archived*' 'An unarchived reference with an archive date'

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
foreach ($index in $listings.indexes) { $index.hushpinterest = [pscustomobject]@{ status = 'listed'; url = 'https://example.com/listing'; checked = '2026-09-25' } }
Assert-True (Test-SourceListings -Ledger $listings).Valid 'Every index listing HushPinterest was refused.'
$listings.indexes[0].hushpinterest = [pscustomobject]@{ status = 'submitted'; url = 'https://example.com/issue/1'; submitted = '2026-09-25' }
Assert-True (Test-SourceListings -Ledger $listings).Valid 'A dated submission was not accepted in place of a listing.'
$listings.indexes[1].hushpinterest = [pscustomobject]@{ status = 'not-listed'; checked = '2026-09-25' }
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
        $index.hushpinterest = if ($Pending) { [pscustomobject]@{ status = 'not-listed'; checked = $CheckedAt } } else {
            [pscustomobject]@{ status = 'listed'; url = 'https://example.com/listing'; checked = $CheckedAt } }
    }
    # Every date the audit's clean run stamps is set here, or a ledger stamped after these fixed
    # days would put a record after the gate's today and fail the case for the wrong reason.
    foreach ($entry in $copy.entries) { $entry.lastChecked = $CheckedAt }
    foreach ($item in @($copy.outOfScope)) {
        $item.lastChecked = $CheckedAt
        # This synthetic gate runs in September. Its reference verification must also be in that
        # fictional period; the audit case below proves a real census leaves verifiedAt alone.
        $reference = Get-SourceProperty $item 'reference'
        if ($null -ne $reference) { $reference.verifiedAt = $CheckedAt }
    }
    [IO.File]::WriteAllText((Get-SourceLedgerPath -Root $gateRoot), ($copy | ConvertTo-Json -Depth 20))
}
Save-GateLedger -CheckedAt '2026-09-25'
$gate = Test-SourceReleaseGate -Root $gateRoot -Today '2026-10-09'
Assert-True $gate.Valid "The release gate refused a census 14 days old: $($gate.Reason)"
Assert-True ($gate.Summary -like '*14 day(s) old*') "The release gate did not say how old the census is: $($gate.Summary)"
$gate = Test-SourceReleaseGate -Root $gateRoot -Today '2026-10-10'
Assert-True (-not $gate.Valid -and $gate.Reason -like '*15 days old*audit-pinterest-sources.ps1*') "The release gate accepted a stale census: $($gate.Reason)"
Save-GateLedger -CheckedAt '2026-09-25' -Pending
$gate = Test-SourceReleaseGate -Root $gateRoot -Today '2026-09-26'
# An index that doesn't list HushPinterest yet is named, not refused: a submission is a public
# request on someone else's project, so a release can't be made to wait on it.
Assert-True ($gate.Valid -and $gate.Summary -like '*HushPinterest is not listed on *yet and has no submission recorded there*') "The release gate didn't name the indexes that don't list HushPinterest: $($gate.Summary) $($gate.Reason)"
Remove-Item -LiteralPath (Get-SourceLedgerPath -Root $gateRoot)
$gate = Test-SourceReleaseGate -Root $gateRoot -Today '2026-09-26'
Assert-True (-not $gate.Valid -and $gate.Reason -like '*ledger is missing*') "The release gate accepted a missing ledger: $($gate.Reason)"

Write-Host '[sources] the census holds to 14 days and every index needs a listing or a dated submission'

# --- the audit, against stand-ins for every forge and index -----------------------------------------

$auditScript = Join-Path $PSScriptRoot 'audit-pinterest-sources.ps1'
$fixtureRoot = Join-Path $caseRoot 'audit'
New-Item -ItemType Directory -Path (Join-Path $fixtureRoot 'sources'), (Join-Path $fixtureRoot 'patches'), (Join-Path $fixtureRoot 'extensions') -Force | Out-Null
# The fixture's alpha source is adopted, so its root carries the NOTICE entry and the provenance
# rule an adopted source needs, and the catalog whose two builds its receipt has to prove.
Copy-Item -LiteralPath (Join-Path $Root 'patches-list.json') -Destination (Join-Path $fixtureRoot 'patches-list.json')
$adoptedCommit = 'ad' * 20
$declaredBuilds = $catalogBuilds
# The adopted source's two fixtures: every declared build, and the one before when Pinterest declares one.
$adoptedBuilds = @($catalogBuilds + $olderBuild)
[IO.File]::WriteAllText((Join-Path $fixtureRoot 'NOTICE'), "Fixture NOTICE`n  alpha  https://github.com/fixture-owner/alpha-patches`n")
[IO.File]::WriteAllText((Join-Path $fixtureRoot 'provenance.json'), (@{ rules = @(@{ paths = @('patches/**'); origin = 'ported'
    upstream = 'https://github.com/fixture-owner/alpha-patches'; commit = $adoptedCommit; license = 'GPL-3.0'; via = @() }) } | ConvertTo-Json -Depth 6))
Set-Content -LiteralPath (Join-Path $fixtureRoot 'patches/Keep.kt') -Value 'class Keep' -Encoding ASCII
$receiptUrl = 'https://github.com/SysAdminDoc/HushPinterest/releases/download/v9.9.9/release-receipt-9.9.9.json'
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
    self = [ordered]@{ repository = 'https://github.com/SysAdminDoc/HushPinterest' }
    officialBundle = [ordered]@{ repository = 'https://github.com/MorpheApp/morphe-patches'; branch = 'main'; list = 'patches-list.json'; packages = @() }
    indexes = @(
        [ordered]@{ id = 'morphe-directory'; name = 'Morphe community directory'; url = 'https://morphe-patches.software'
            hushpinterest = [ordered]@{ status = 'not-listed'; checked = '2026-09-01' } }
        [ordered]@{ id = 'awesome-morphe'; name = 'Awesome Morphe'; url = 'https://github.com/nvbangg/awesome-morphe'
            hushpinterest = [ordered]@{ status = 'submitted'; url = 'https://github.com/nvbangg/awesome-morphe/issues/1'; submitted = '2026-09-01' } }
        [ordered]@{ id = 'morphe-patch-tracker'; name = 'Morphe Patch Tracker'; url = 'https://drnx64.github.io/morphe-track-patches/'
            hushpinterest = [ordered]@{ status = 'listed'; url = 'https://drnx64.github.io/morphe-track-patches/#/bundle/sysadmindoc'; checked = '2026-09-01' } }
        [ordered]@{ id = 'jman-bundles'; name = 'Jman''s ReVanced Patch Bundles'; url = 'https://github.com/Jman-Github/ReVanced-Patch-Bundles'
            hushpinterest = [ordered]@{ status = 'not-listed'; checked = '2026-09-01' } }
        [ordered]@{ id = 'morphe-archive'; name = 'Morphe Archive'; url = 'https://rushiforai.github.io/morphe-archive/'
            hushpinterest = [ordered]@{ status = 'listed'; url = 'https://github.com/rushiforai/morphe-archive'; checked = '2026-09-01' } }
    )
    entries = @(
        [ordered]@{ id = 'alpha'; repository = 'https://github.com/fixture-owner/alpha-patches'; lineage = 'alpha'; upstream = $null
            kind = 'morphe-patches'; packages = @('com.pinterest'); targetVersions = [ordered]@{ 'com.pinterest' = @('14.25.0') }
            patchCounts = [ordered]@{ 'com.pinterest' = 1 }
            features = @('Hide ads'); branches = @([ordered]@{ name = 'main'; commit = $commitA1 }); watchPaths = @()
            license = [ordered]@{ spdx = 'GPL-3.0'; url = "https://github.com/fixture-owner/alpha-patches/blob/$commitA1/LICENSE"; sha256 = $licenseHash }
            contaminatedBy = $null; disposition = 'adopted'; reason = 'A fixture source.'; archived = $false
            adopted = [ordered]@{ commit = $adoptedCommit; fixtures = [ordered]@{ receipt = $receiptUrl; builds = $adoptedBuilds } }
            forks = @('someone/alpha-patches'); contentHashes = @($blobKnown)
            mirrors = @([ordered]@{ repository = 'https://github.com/copier/alpha-copy'; reason = 'A fixture copy.'; blobs = @($blobMirror) })
            lastChecked = '2026-09-01' }
        [ordered]@{ id = 'beta'; repository = 'https://github.com/fixture-owner/beta-module'; lineage = 'beta'; upstream = $null
            kind = 'xposed-module'; packages = @('com.pinterest'); targetVersions = [ordered]@{ 'com.pinterest' = @() }
            features = @('Hide sponsored pins'); branches = @([ordered]@{ name = 'main'; commit = $commitB1 }); watchPaths = @('app/pinterest')
            license = $null; contaminatedBy = $null; disposition = 'behavior-only'; reason = 'A fixture module with no licence.'; archived = $false
            forks = @(); contentHashes = @(); mirrors = @(); lastChecked = '2026-09-01' }
        [ordered]@{ id = 'gamma'; repository = 'https://gitlab.com/fixture-group/gamma-patches'; lineage = 'gamma'; upstream = $null
            kind = 'revanced-patches'; packages = @('com.pinterest'); targetVersions = [ordered]@{ 'com.pinterest' = @() }
            features = @('Open links outside'); branches = @([ordered]@{ name = 'main'; commit = $commitG1 }); watchPaths = @()
            license = [ordered]@{ spdx = 'GPL-3.0'; url = "https://gitlab.com/fixture-group/gamma-patches/-/blob/$commitG1/LICENSE"; sha256 = $licenseHash }
            contaminatedBy = $null; disposition = 'candidate'; reason = 'A fixture GitLab source.'; archived = $false
            forks = @(); contentHashes = @(); mirrors = @(); lastChecked = '2026-09-01' }
    )
    outOfScope = @([ordered]@{ repository = 'https://github.com/noise/mentions-pinterest'; reason = 'A historical client reference.'
        reference = [ordered]@{ kind = 'historical'; branch = 'dev'; commit = ('d1' * 20); archived = $true; verifiedAt = '2026-08-27'; archivedAt = $null }
        lastChecked = '2026-09-01' })
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
            bundles = @(@{ source = 'github'; repo = 'fixture-owner/alpha-patches'; name = 'Alpha'; targetApps = @('com.pinterest')
                patches = @(@{ name = 'Hide ads'; compatiblePackagesKey = 0 }) })
            compatibilities = @(@{ packageName = 'com.pinterest'; targets = @(@{ version = '14.25.0' }) }) } | ConvertTo-Json -Depth 8) }
        awesome = @{ Status = 200; Content = '{"fixture-owner/alpha-patches":{"com.pinterest":"0123"},"SysAdminDoc/hushfeed":{"com.zhiliaoapp.musically":"4567"}}' }
        tracker = @{ Status = 200; Content = (@{
            'sysadmindoc:stable' = @{ repo_url = 'https://github.com/SysAdminDoc/HushPinterest'; apps = @(@{ package = 'com.pinterest'; patches = @(@{ name = 'Hide ads' }) }) }
            'alpha:stable' = @{ repo_url = 'https://github.com/fixture-owner/alpha-patches'; apps = @(@{ package = 'com.pinterest'; patches = @(@{ name = 'Hide ads' }) }) }
        } | ConvertTo-Json -Depth 8) }
        jmanSources = @{ Status = 200; Content = '{"alpha-stable":{"patches":"https://api.github.com/repos/fixture-owner/alpha-patches"},"gamma-stable":{"patches":"https://gitlab.com/api/v4/projects/fixture-group%2Fgamma-patches"}}' }
        jmanCatalog = @{ Status = 200; Content = ("# Catalog`n| [Alpha](#alpha) | 1 | 1 | Generated |`n### X Alpha Bundle Patch List:`n" +
            "| **Name** | **Description** | **Compatible Apps** | **Compatible Versions** |`n|---|---|---|---|`n" +
            "| ${tick}Hide ads${tick} | ${tick}Removes ads.${tick} | ${tick}Pinterest${tick} | ${tick}14.25.0${tick} |`n" +
            "### X Gamma Bundle Patch List:`n| ${tick}Open links outside${tick} | ${tick}d${tick} | ${tick}Pinterest${tick} | ${tick}Any${tick} |`n") }
        archive = @{ Status = 200; Content = '{"name":"patches-list.json"}' }
        searchHits = @(
            @{ repository = @{ full_name = 'fixture-owner/alpha-patches' }; path = 'patches/Alpha.kt'; sha = $blobKnown }
            @{ repository = @{ full_name = 'copier/alpha-copy' }; path = 'patches/Alpha.kt'; sha = $blobMirror }
            @{ repository = @{ full_name = 'clone/alpha-clone' }; path = 'src/Alpha.kt'; sha = $blobKnown }
            @{ repository = @{ full_name = 'rushiforai/morphe-archive' }; path = 'examplepatches/fixture-owner/alpha-patches/patches-list.json'; sha = ('3b' * 20) }
            @{ repository = @{ full_name = 'rushiforai/morphe-archive' }; path = 'examplepatches/Jman-Github/ReVanced-Patch-Bundles/patch-bundles/x/y-patches-list.json'; sha = ('4b' * 20) }
            @{ repository = @{ full_name = 'noise/mentions-pinterest' }; path = 'list.txt'; sha = ('5b' * 20) }
            @{ repository = @{ full_name = 'SysAdminDoc/HushPinterest' }; path = 'patches-list.json'; sha = ('6b' * 20) }
            # The archive keeps a recorded fork's patch list for its entry's own package, which is no bundle of its own.
            @{ repository = @{ full_name = 'rushiforai/morphe-archive' }; path = 'examplepatches/someone/alpha-patches/patches-list.json'; sha = ('7b' * 20) }
        )
        searchOverride = $null
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
        repoMeta = @{ Status = 200; Content = '{"full_name":"newcomer/pinterest-patches","license":{"spdx_id":"MIT"},"fork":false,"archived":false,"pushed_at":"2026-09-20T00:00:00Z","description":"Pinterest patches"}' }
        oldNameMeta = @{ Status = 200; Content = '{"full_name":"fixture-owner/alpha-patches","fork":false,"archived":false}' }
        receipt = @{ Status = 200; Content = (@{ targets = @($adoptedBuilds | ForEach-Object {
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
        $fakeForge.Requests.Add([pscustomobject]@{ Uri = $url; Authorization = $authorization })
        $a = $fakeForge.Answers
        $answer = $null
        switch -Regex ($url) {
            '^https://raw\.githubusercontent\.com/MorpheApp/morphe-patches/main/patches-list\.json$' { $answer = $a.official; break }
            '^https://morphe-patches\.software/data/bundles\.json$' { $answer = $a.directory; break }
            '^https://raw\.githubusercontent\.com/nvbangg/awesome-morphe/main/data/hashes\.json$' { $answer = $a.awesome; break }
            '^https://raw\.githubusercontent\.com/drnx64/morphe-track-patches/main/data/bundles\.json$' { $answer = $a.tracker; break }
            '^https://raw\.githubusercontent\.com/Jman-Github/ReVanced-Patch-Bundles/bundles/patch-bundles/bundle-sources\.json$' { $answer = $a.jmanSources; break }
            '^https://raw\.githubusercontent\.com/Jman-Github/ReVanced-Patch-Bundles/bundles/patch-bundles/PATCH-LIST-CATALOG\.md$' { $answer = $a.jmanCatalog; break }
            '^https://api\.github\.com/repos/rushiforai/morphe-archive/contents/examplepatches/SysAdminDoc/HushPinterest/patches-list\.json$' { $answer = $a.archive; break }
            '^https://api\.github\.com/search/code\?q=([^&]+)&per_page=100&page=1$' {
                $query = [Uri]::UnescapeDataString($Matches[1])
                $items = if ($query -eq '"com.pinterest" bytecodePatch') { @($a.searchHits) } else { @() }
                $answer = @{ Status = 200; Content = (@{ total_count = $items.Count; incomplete_results = $false; items = $items } | ConvertTo-Json -Depth 8) }
                if ($null -ne $a.searchOverride -and $query -eq '"com.pinterest" bytecodePatch') {
                    $answer.Content = $a.searchOverride
                }
                break
            }
            '^https://api\.github\.com/repos/fixture-owner/alpha-patches$' { $answer = $a.alphaRepo; break }
            '^https://api\.github\.com/repos/fixture-owner/alpha-patches/license$' { $answer = $a.alphaLicense; break }
            '^https://api\.github\.com/repos/fixture-owner/alpha-patches/branches\?per_page=100&page=1$' { $answer = $a.alphaBranches; break }
            '^https://api\.github\.com/repos/fixture-owner/alpha-patches/forks\?per_page=100&page=1$' { $answer = $a.alphaForks; break }
            '^https://api\.github\.com/repos/fixture-owner/alpha-patches/compare/([0-9a-f]{40})\.\.\.([0-9a-f]{40})$' {
                $status = $a.compare[$Matches[2]]
                if (-not $status) { $status = 'diverged' }
                $answer = @{ Status = 200; Content = "{`"status`":`"$status`"}" }
                break
            }
            '^https://api\.github\.com/repos/fixture-owner/beta-module/compare/([0-9a-f]{40})\.\.\.([0-9a-f]{40})$' {
                $status = $a.compare[$Matches[2]]
                if (-not $status) { $status = 'diverged' }
                $answer = @{ Status = 200; Content = "{`"status`":`"$status`"}" }
                break
            }
            '^https://api\.github\.com/repos/fixture-owner/beta-module$' { $answer = $a.betaRepo; break }
            '^https://api\.github\.com/repos/fixture-owner/beta-module/license$' { $answer = $a.betaLicense; break }
            '^https://api\.github\.com/repos/fixture-owner/beta-module/branches\?per_page=100&page=1$' { $answer = $a.betaBranches; break }
            '^https://api\.github\.com/repos/fixture-owner/beta-module/commits\?sha=main&path=app%2Fpinterest&per_page=1$' { $answer = $a.betaWatch; break }
            '^https://api\.github\.com/repos/fixture-owner/beta-module/forks\?per_page=100&page=1$' { $answer = $a.betaForks; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches$' { $answer = $a.gammaProject; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches/repository/tree\?ref=main&per_page=100&page=1$' { $answer = $a.gammaTree; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches/repository/files/LICENSE\?ref=main$' { $answer = $a.gammaLicense; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches/repository/branches\?per_page=100&page=1$' { $answer = $a.gammaBranches; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches/forks\?per_page=100&page=1$' { $answer = $a.gammaForks; break }
            '^https://api\.github\.com/repos/(newcomer/pinterest-patches|clone/alpha-clone)$' { $answer = $a.repoMeta; break }
            '^https://api\.github\.com/repos/fixture-owner/alpha-old$' { $answer = $a.oldNameMeta; break }
            '^https://github\.com/SysAdminDoc/HushPinterest/releases/download/v9\.9\.9/release-receipt-9\.9\.9\.json$' { $answer = $a.receipt; break }
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
        $stampedLedger.indexes[2].hushpinterest.checked -eq '2026-09-25' -and $stampedLedger.indexes[1].hushpinterest.submitted -eq '2026-09-01') `
        'The clean audit did not stamp the census and every checked record with today, or it moved a submission date.'
    Assert-True ($stampedLedger.outOfScope[0].reference.verifiedAt -eq '2026-08-27' -and
        $null -eq $stampedLedger.outOfScope[0].reference.archivedAt -and $stampedLedger.outOfScope[0].reference.commit -eq ('d1' * 20) -and
        $stampedLedger.entries[0].patchCounts.'com.pinterest' -eq 1 -and $stampedLedger.entries[0].adopted.commit -eq $adoptedCommit) `
        'The census stamp moved historical verification, invented an archive date, or changed patch counts or adoption pins.'
    $after = Get-TreeState
    $changed = @(Compare-Object $before $after | ForEach-Object { ($_.InputObject -split ' ')[0] } | Sort-Object -Unique)
    Assert-True ($changed.Count -eq 1 -and $changed[0] -like '*pinterest-sources.json') `
        "The audit wrote more than the ledger's dates under the root: $($changed -join ', ')"
    Assert-True ($clean.Report.counts.lineages -eq 3 -and $clean.Report.counts.mirrorsCollapsed -eq 1) `
        "The clean audit did not count three lineages with one copy collapsed: $($clean.Report.counts | ConvertTo-Json -Compress)"
    Assert-True (@($clean.Report.notes | Where-Object { $_ -like '*clone/alpha-clone is a byte-for-byte copy*alpha lineage*' }).Count -eq 1) `
        "The copy of the alpha lineage's file was not collapsed into it: $($clean.Report.notes -join ' | ')"
    Assert-True (@($clean.Report.lineages | Where-Object { $_.lineage -eq 'alpha' })[0].mirrors -contains 'https://github.com/clone/alpha-clone') `
        'The collapsed copy was not listed under its lineage.'
    $leaked = @($fakeForge.Requests | Where-Object { $_.Authorization -and $_.Uri -notlike 'https://api.github.com/*' })
    Assert-True ($leaked.Count -eq 0) "The GitHub token went to another host: $($leaked[0].Uri)"
    Assert-True (@($fakeForge.Requests | Where-Object { $_.Uri -like 'https://api.github.com/*' -and $_.Authorization -ne "Bearer $fakeToken" }).Count -eq 0) `
        'A GitHub API request went out without the token.'
    Assert-True ($clean.ReportText.IndexOf($fakeToken) -lt 0 -and $stamped.IndexOf($fakeToken) -lt 0) 'The token was written to the report or the ledger.'
    Reset-FixtureLedger

    Assert-True ($clean.Report.searches.Count -eq 5 -and
        @($clean.Report.searches | Where-Object { -not $_.complete -or $_.verifiedAt -ne '2026-09-25' }).Count -eq 0 -and
        @($clean.Report.searches | Where-Object { $_.query -eq '"com.pinterest" bytecodePatch' -and $_.totalCount -eq 8 -and $_.returnedCount -eq 8 }).Count -eq 1) `
        'The clean report must retain each exact GitHub query, date, indexed scope and result count.'

    # Schema/date failures must stop the actual audit before the stand-in receives a request.
    foreach ($invalid in @(
        @{ Json = $fixtureLedgerText.Replace('"schemaVersion": 1', '"schemaVersion": 2'); Detail = '*schema*'; Name = 'unsupported schema' },
        @{ Json = $fixtureLedgerText.Replace('"checkedAt": "2026-09-01"', '"checkedAt": "2026-02-30"'); Detail = '*census.checkedAt*date*'; Name = 'impossible census date' },
        @{ Json = $fixtureLedgerText.Replace('"lastChecked": "2026-09-01"', '"lastChecked": "2026-09-26"'); Detail = '*lastChecked*after today*'; Name = 'future source verification' }
    )) {
        Assert-True ($invalid.Json -cne $fixtureLedgerText) "The $($invalid.Name) case did not change its input."
        [IO.File]::WriteAllText($fixtureLedgerPath, $invalid.Json)
        $refused = Invoke-Audit -Extra @{ ValidateOnly = $true }
        Assert-True ($refused.ExitCode -eq 1 -and @($refused.Report.findings | Where-Object {
            $_.kind -eq 'ledger-invalid' -and $_.detail -like $invalid.Detail }).Count -gt 0 -and $fakeForge.Requests.Count -eq 0) `
            "The audit did not refuse $($invalid.Name) before network: $($refused.Said)"
        Assert-True ([IO.File]::ReadAllText($fixtureLedgerPath) -ceq $invalid.Json) 'Refusing invalid metadata changed the ledger.'
        Reset-FixtureLedger
    }

    # A query can return HTTP 200 without providing complete evidence. None may stamp the census.
    foreach ($partial in @(
        @{ Body = '{"total_count":0,"incomplete_results":true,"items":[]}'; Kind = 'search-incomplete'; Detail = '*bytecodePatch*incomplete*' },
        @{ Body = '{"total_count":1001,"incomplete_results":false,"items":[]}'; Kind = 'search-limited'; Detail = '*bytecodePatch*1,000-result cap*' },
        @{ Body = '{"total_count":1,"incomplete_results":false,"items":[]}'; Kind = 'search-incomplete'; Detail = '*bytecodePatch*0 of 1*' },
        @{ Body = '{"total_count":0,"items":[]}'; Kind = 'source-failed'; Detail = '*bytecodePatch*boolean incomplete_results*' }
    )) {
        $fakeForge.Answers.searchOverride = $partial.Body
        Assert-Drift $partial.Kind $partial.Detail 'A partial GitHub search response'
        $fakeForge.Answers = New-FakeAnswers
    }

    # A later reviewed release pin may contain earlier Pinterest work. Ahead/diverged edits still
    # fail, and no ancestry answer can turn a canonical repository rename into a clean run.
    $fakeForge.Answers.betaWatch.Content = $fakeForge.Answers.betaWatch.Content.Replace($commitB1, ('b0' * 20))
    $fakeForge.Answers.compare[('b0' * 20)] = 'behind'
    $fakeForge.Answers.compare[$commitB1] = 'behind'
    $reviewed = Invoke-Audit
    Assert-True ($reviewed.ExitCode -eq 0) "A watched commit already contained in the reviewed pin was refused: $($reviewed.Said)"
    Reset-FixtureLedger
    $fakeForge.Answers.compare[('b0' * 20)] = 'ahead'
    Assert-Drift 'changed-head' '*beta-module*branch main moved*' 'Watched code beyond the reviewed pin'
    $fakeForge.Answers.compare[('b0' * 20)] = 'behind'
    $fakeForge.Answers.compare[$commitB1] = 'ahead'
    $fakeForge.Answers.betaBranches.Content = $fakeForge.Answers.betaBranches.Content.Replace(('b9' * 20), ('b0' * 20))
    Assert-Drift 'changed-head' '*beta-module*branch main moved*' 'A branch rolled back before its reviewed pin'
    $fakeForge.Answers = New-FakeAnswers

    # -SkipGitLabCodeSearch holds with GITLAB_TOKEN set, as the audit's help tells a maintainer to
    # set it: no GitLab search goes out and the census keeps recording the skip.
    $env:GITLAB_TOKEN = 'fixture-gitlab-' + [guid]::NewGuid().ToString('N')
    try { $withToken = Invoke-Audit } finally { $env:GITLAB_TOKEN = $null }
    Assert-True ($withToken.ExitCode -eq 0) "The audit refused a clean fixture once GITLAB_TOKEN was set with -SkipGitLabCodeSearch: $($withToken.Said)"
    Assert-True (@($fakeForge.Requests | Where-Object { $_.Uri -like 'https://gitlab.com/api/v4/search*' }).Count -eq 0) `
        'GitLab code search ran although -SkipGitLabCodeSearch was passed.'
    Assert-True (@(([IO.File]::ReadAllText($fixtureLedgerPath) | ConvertFrom-Json).census.skipped) -contains 'gitlab-code-search') `
        'The census stopped recording the GitLab skip because a token was set.'
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
    $fakeForge.Answers.directory.Content = $fakeForge.Answers.directory.Content.Replace('"repo":  "fixture-owner/alpha-patches"', '"repo":  "newcomer/pinterest-patches"').Replace(
        '"repo": "fixture-owner/alpha-patches"', '"repo": "newcomer/pinterest-patches"')
    Assert-True ($fakeForge.Answers.directory.Content -like '*newcomer/pinterest-patches*') 'The directory answer was not edited, so the addition case would prove nothing.'
    Assert-Drift 'addition' '*github.com/newcomer/pinterest-patches*Morphe directory*' 'A bundle only the directory knows'
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

    # A branch cut from main before its Pinterest code last moved carries nothing new; one ahead of it does.
    $fakeForge.Answers.alphaBranches.Content = "[{`"name`":`"main`",`"commit`":{`"sha`":`"$commitA1`"}},{`"name`":`"old`",`"commit`":{`"sha`":`"$('a3' * 20)`"}}]"
    $fakeForge.Answers.compare[('a3' * 20)] = 'behind'
    $contained = Invoke-Audit
    Assert-True ($contained.ExitCode -eq 0) ("A branch behind a pinned one was reported: " +
        (@($contained.Report.findings | ForEach-Object { "$($_.kind): $($_.detail)" }) -join ' | '))
    Reset-FixtureLedger
    $fakeForge.Answers.compare[('a3' * 20)] = 'ahead'
    Assert-Drift 'new-branch' '*alpha-patches*branch old carries Pinterest work*' 'A branch with work of its own'
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

    $fakeForge.Answers.tracker.Content = $fakeForge.Answers.tracker.Content.Replace('SysAdminDoc/HushPinterest', 'SysAdminDoc/hushfeed')
    Assert-Drift 'listing-changed' '*Morphe Patch Tracker no longer lists HushPinterest*' 'A listing that disappeared'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.official.Content = '{"patches":[{"name":"Hide ads","compatiblePackages":[{"packageName":"com.pinterest"}]}]}'
    Assert-Drift 'official-bundle-changed' '*official bundle now patches*com.pinterest*' 'The official bundle taking on Pinterest'
    $fakeForge.Answers = New-FakeAnswers

    # An adopted source's receipt has to prove every declared build, unforced.
    $fakeForge.Answers.receipt.Content = $fakeForge.Answers.receipt.Content -replace '"forced":\s*false', '"forced": true'
    Assert-Drift 'fixture-evidence' "*alpha-patches*no unforced run of Pinterest $($declaredBuilds[0])*" 'An adopted source whose receipt forced a build'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.alphaRepo.Content = $fakeForge.Answers.alphaRepo.Content.Replace('"fixture-owner/alpha-patches"', '"fixture-owner/alpha-renamed"')
    Assert-Drift 'renamed' '*alpha-patches*now https://github.com/fixture-owner/alpha-renamed*' 'A source that was renamed'
    $fakeForge.Answers = New-FakeAnswers

    # A recorded fork or an out-of-scope repository that an index lists as a bundle of its own. The
    # control's archived copy of the fork's list, for alpha's own package, stayed quiet.
    foreach ($listed in @('someone/alpha-patches', 'noise/mentions-pinterest')) {
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

    $fakeForge.Answers.alphaBranches.Content = "[{`"name`":`"trunk`",`"commit`":{`"sha`":`"$commitA1`"}}]"
    Assert-Drift 'branch-removed' '*alpha-patches*branch main is gone*' 'A pinned branch that was deleted'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.betaLicense = @{ Status = 200; Content = (@{ path = 'LICENSE'; content = $licenseBase64; license = @{ spdx_id = 'MIT' } } | ConvertTo-Json) }
    Assert-Drift 'license-added' '*beta-module*now has a licence (MIT*' 'An unlicensed source that gained a licence'
    $fakeForge.Answers = New-FakeAnswers

    $tick = [string][char]96 * 3
    $fakeForge.Answers.jmanCatalog.Content += "### X Delta Bundle Patch List:`n| ${tick}Hide replies${tick} | ${tick}d${tick} | ${tick}Pinterest${tick} | ${tick}Any${tick} |`n"
    Assert-Drift 'index-unresolved' "*Jman's catalog lists Pinterest patches under 'Delta'*" 'A Jman section no repository stands behind'
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
$libraryText = [IO.File]::ReadAllText((Join-Path $PSScriptRoot 'pinterest-sources.ps1'))
foreach ($pair in @(@('audit-pinterest-sources.ps1', $auditText), @('pinterest-sources.ps1', $libraryText))) {
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
    $found = @(Get-ImportProblems -Text ($auditText + "`n" + $bad.Line + "`n") -Name 'audit-pinterest-sources.ps1 (copy)')
    Assert-True (@($found | Where-Object { $_ -like $bad.Pattern }).Count -gt 0) "The import check missed: $($bad.Line)"
}

Write-Host '[sources] the audit and its rules hold nothing that clones, downloads to disk or copies code'
Write-Host '[sources] source ledger contracts passed'
} finally {
    $env:GITLAB_TOKEN = $savedGitLabToken
    Remove-Item -LiteralPath $caseRoot -Recurse -Force -ErrorAction SilentlyContinue
}
