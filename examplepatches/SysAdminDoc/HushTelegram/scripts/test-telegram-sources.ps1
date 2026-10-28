<#
.SYNOPSIS
    Hold the Telegram source ledger and its audit to their rules, with no network.

.DESCRIPTION
    The checked-in ledger has to keep every rule of scripts/telegram-sources.ps1, and
    docs/sources.md can't link a source the ledger doesn't know or call a behavior-only source
    portable. Then each rule is broken once on a copy, and each has to be refused by name: an
    adopted source missing its pinned commit, compatible licence, NOTICE entry, provenance rule or
    two-fixture evidence, an unlicensed or contaminated source that isn't behavior-only, a
    provenance rule crediting a source the ledger doesn't allow, an index with no listing record.
    The checked-in ledger adopts nothing and holds no behavior-only source, so the copy gets an
    adopted, an unlicensed and a contaminated fixture source for those rules to bite on. The census
    is held to its 14 days on both sides of the line.

    scripts/audit-telegram-sources.ps1 then runs against a stand-in for every forge and index it
    reads, so nothing here touches the network: a request the stand-in doesn't know fails the case.
    A clean run stamps only dates and collapses a byte-for-byte copy into its lineage; an addition
    from an index or code search, a removed licence, a moved branch head, a new branch with
    Telegram work, an unseen fork, a repository that's gone and a changed listing each exit
    1 with the ledger untouched. Through all of it the audit writes nothing but its report and the
    ledger's dates, and a parse of its source finds nothing that clones, downloads to disk or
    copies files, with a copy that does each of those as the proof the parse can see them.

    The pre-push hook runs this for the audit, its rules, the ledger, provenance.json and NOTICE.
#>
[CmdletBinding()]
param([string]$Root)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $PSScriptRoot 'telegram-sources.ps1')

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

$caseRoot = Join-Path ([IO.Path]::GetTempPath()) ("hushtelegram-sources-" + [guid]::NewGuid().ToString('N'))
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
# These pinned research facts distinguish a feature union, a camera candidate and an archived
# reference. None changes a source's adoption status or the commit in an adopted provenance rule.
$rush = @($entries | Where-Object { $_.id -eq 'rushiranpise' })[0]
Assert-True ($rush.branches[0].name -eq 'main' -and $rush.branches[0].commit -eq '0c30eb2a471f2d847e334722d1e03040b7266039' -and
    $rush.patchCounts.'org.telegram.messenger' -eq 14 -and $rush.patchCounts.'org.telegram.messenger.web' -eq 14 -and
    $rush.patchCounts.'org.telegram.plus' -eq 15 -and @($rush.features).Count -eq 15) `
    'Rush must keep its pinned union separate from the 14 standard/web and 15 Plus patches.'
$neo = @($entries | Where-Object { $_.id -eq 'killergram-neo' })[0]
Assert-True ($neo.branches[0].name -eq 'master' -and $neo.branches[0].commit -eq '663dc422920ebcc838b48a05ccd69234d908541c' -and
    $neo.features -contains 'Lazy attachment-camera preview construction' -and $neo.reason -like '*camera and UI hooks*' -and
    $neo.disposition -eq 'candidate') `
    'KillergramNeo must retain the pinned camera candidate without claiming it was adopted.'
$nagramRepository = 'https://github.com/risin42/NagramX'
$nagram = @($ledger.outOfScope | Where-Object { $_.repository -eq $nagramRepository })[0]
Assert-True ($nagram.reference.kind -eq 'historical' -and $nagram.reference.branch -eq 'dev' -and
    $nagram.reference.commit -eq '2db685af00a4352c877ecf96474cbf0494284715' -and $nagram.reference.archived -eq $true -and
    $nagram.reference.verifiedAt -eq '2026-10-01' -and $null -eq $nagram.reference.archivedAt) `
    'NagramX must remain a pinned historical reference with an unknown archive date.'

# Fixture sources for the rules the checked-in ledger has nothing to test with: it adopts nothing
# and holds no unlicensed or contaminated source. The rule cases below add them to a copy, with the
# NOTICE line and provenance rule the adopted one needs.
$catalogTargets = @(Get-PatchTargets -PatchList (
    [IO.File]::ReadAllText((Join-Path $Root 'patches-list.json')) | ConvertFrom-Json))
$catalogWebVersion = ($catalogTargets | Where-Object { $_.PackageName -ceq 'org.telegram.messenger.web' }).PackageVersion
$catalogBuilds = @(foreach ($target in $catalogTargets) {
    foreach ($version in @($target.PackageVersions)) {
        foreach ($code in @($target.PackageVersionCodes[$version])) { "$($target.PackageName) $version ($code)" }
    }
})
Assert-True ($catalogBuilds.Count -ge 1) 'The catalog declares no Telegram build, so the two-fixture cases would prove nothing.'
# The stand-in also names an older build to exercise evidence beyond the declared distribution set.
$olderBuild = 'org.telegram.messenger.web 12.10.5 (71077)'
Assert-True ($catalogBuilds -notcontains $olderBuild) "The catalog declares $olderBuild, so the fixture's second build is no second build."
$fixtureLicenseHash = 'a' * 64
$fixtureAdoptedRepository = 'https://github.com/fixture-owner/adopted-patches'
$fixtureAdoptedCommit = 'ad' * 20
$fixtureUnlicensedRepository = 'https://github.com/fixture-owner/unlicensed-module'
function New-RuleFixtureEntry {
    param([string]$Id, [string]$Repository, [string]$Kind, $License, [string]$Disposition, $ContaminatedBy, [string[]]$Forks)
    return [pscustomobject][ordered]@{ id = $Id; repository = $Repository; lineage = $Id; upstream = $null; kind = $Kind
        packages = @('org.telegram.messenger.web'); targetVersions = [pscustomobject]@{ 'org.telegram.messenger.web' = @($catalogWebVersion) }
        features = @('Hide ads'); branches = @([pscustomobject]@{ name = 'main'; commit = ('0f' * 20) }); watchPaths = @()
        license = $License; contaminatedBy = $ContaminatedBy; disposition = $Disposition; reason = 'A fixture source.'; archived = $false
        forks = @($Forks); contentHashes = @(); mirrors = @(); lastChecked = '2026-09-01' }
}
function Add-RuleFixtures {
    param($Copy)
    $adopted = New-RuleFixtureEntry 'fixture-adopted' $fixtureAdoptedRepository 'morphe-patches' `
        ([pscustomobject]@{ spdx = 'GPL-3.0'; url = "$fixtureAdoptedRepository/blob/main/LICENSE"; sha256 = $fixtureLicenseHash }) 'adopted' $null @()
    $adopted | Add-Member -NotePropertyName adopted -NotePropertyValue ([pscustomobject]@{ commit = $fixtureAdoptedCommit
        fixtures = [pscustomobject]@{ receipt = 'https://github.com/SysAdminDoc/HushTelegram/releases/download/v9.9.9/release-receipt-9.9.9.json'
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
    foreach ($address in @($index.url, $index.hushtelegram.url)) {
        $indexKey = ConvertTo-SourceKey $address
        if ($indexKey) { $known[$indexKey] = $index }
    }
}
# The family repositories HushTelegram was built from aren't ledger entries. provenance.json names
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
    Assert-True ($sourcesDoc.Contains('14 patches for standard and web Telegram 12.10.1, and 15 for Plus Messenger') -and
        $sourcesDoc.Contains($rush.branches[0].commit) -and $sourcesDoc.Contains($neo.branches[0].commit) -and
        $sourcesDoc.Contains($nagram.reference.commit) -and $sourcesDoc.Contains('verified archived on 2026-10-01') -and
        $sourcesDoc.Contains("Its archive date wasn't established.")) 'The source document lost a pinned classification or package count.'
} else {
    Write-Host '[sources] docs/sources.md is local and this checkout has none, so only the page check''s own controls run here'
}
$staleClaims = '(?i)Adds nothing Killergram|frequent feature drops|fifteen Telegram patches for 12\.10\.1, on both packages|sending (?:users.? )?phone numbers to its developer|documented doing harmful things'
Assert-True (([IO.File]::ReadAllText($ledgerPath) + $sourcesDoc) -notmatch $staleClaims) `
    'The source ledger or its document restored a stale classification or unsupported client allegation.'
$docEntries = @((Add-RuleFixtures (Copy-Json $ledger)).entries)
$contaminated = @($docEntries | Where-Object { $_.id -eq 'fixture-contaminated' })[0]
$oldLine = "- [fixture-owner/contaminated-patches]($($contaminated.repository)) (GPL-3.0) ports those hooks. Its code can be ported with credit."
Assert-True (@(@(Test-SourcesDoc ($sourcesDoc + "`n" + $oldLine) $docEntries) -like '*calls*portable*').Count -gt 0) `
    'A docs line calling a contaminated source''s code portable passed the check.'
Assert-True (@(@(Test-SourcesDoc ($sourcesDoc + "`nSee https://github.com/unknown-owner/new-telegram-patches.")) -like '*unknown-owner*').Count -gt 0) `
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
Test-Broken { param($c) $c.indexes[0].hushtelegram.status = '' } '*records no HushTelegram listing*' 'An index with no listing record'
# No index lists HushTelegram before its first release, so the listing is made here.
Test-Broken { param($c) $c.indexes[0].hushtelegram = [pscustomobject]@{ status = 'listed'; url = $null; checked = '2026-09-25' } } `
    '*listed but records no https listing url*' 'A listing with no URL'
Test-Broken { param($c) $c.indexes[0].hushtelegram = [pscustomobject]@{ status = 'submitted'; url = 'https://example.com/issue/1' } } `
    '*submission date is not a yyyy-MM-dd date*' 'A submission with no date'
Test-Broken { param($c) $c.indexes = @($c.indexes | Select-Object -Skip 1) } '*has no record of index*' 'A ledger missing an index'
Test-Broken { param($c) $c.entries[1].repository = $c.entries[0].repository } '*which Entry*already names*' 'A repository listed twice'
Test-Broken { param($c) $c.entries[0].branches[0].commit = 'main' } '*has no pinned commit (40 hex characters)*' 'A branch with no pinned commit'
Test-Broken { param($c) $c.entries[0].lastChecked = '25/09/2026' } '*lastChecked is not a yyyy-MM-dd date*' 'A lastChecked that isn''t ISO'
Test-Broken { param($c) $c.entries[0].lastChecked = '2999-01-01' } '*lastChecked is 2999-01-01, after today*' 'A lastChecked in the future'
Test-Broken { param($c) $c.entries[0].features = @() } '*names no features*' 'A source with no features'
Test-Broken { param($c) $c.entries[0].targetVersions = [pscustomobject]@{} } '*records no declared target versions*' 'A source with no target versions'
Test-Broken { param($c) $c.entries[0].packages = @('org.telegram.plus') } '*names no Telegram package*outOfScope*' 'A fork-only source'
Test-Broken { param($c) $c.entries[0].packages = @('org.telegram.messenger.web', 'com.whatsapp') } '*neither Telegram nor a fork this ledger allows beside it*' `
    'A source for another app'
Test-Broken { param($c) $e = @($c.entries | Where-Object { @($_.packages) -contains 'org.telegram.messenger' -and @($_.packages) -contains 'org.telegram.messenger.web' })[0]
    $e.targetVersions = [pscustomobject]@{ 'org.telegram.messenger' = @('12.10.1') } } '*records no declared target versions for org.telegram.messenger.web*' `
    'A source for two packages that records only one package''s builds'
Test-Broken { param($c) $c.entries[0].license = [pscustomobject]@{ spdx = 'GPL-3.0'; url = 'https://example.com/LICENSE'; sha256 = 'abc' } } `
    '*licence has no sha256*' 'A licence with no hash'
Test-Broken { param($c) $c.entries[0].lineage = '' } '*names no lineage*' 'A source with no lineage'

# Optional per-package counts must be complete and typed, without turning the feature union into
# a per-package count. Reference pins and archive verification have their own meaning and date.
Test-Broken { param($c) (Get-Entry $c 'rushiranpise').patchCounts = @() } '*patchCounts must be an object*' `
    'Per-package patch counts recorded as an array'
Test-Broken { param($c) $e = Get-Entry $c 'rushiranpise'; $e.patchCounts = @($e.patchCounts) } '*patchCounts must be an object*' `
    'Per-package patch counts hidden inside a one-item array'
Test-Broken { param($c) (Get-Entry $c 'rushiranpise').patchCounts.PSObject.Properties.Remove('org.telegram.plus') } `
    '*patchCounts records no count for org.telegram.plus*' 'Per-package counts omitting a declared fork'
Test-Broken { param($c) (Get-Entry $c 'rushiranpise').patchCounts | Add-Member -NotePropertyName 'com.whatsapp' -NotePropertyValue 14 } `
    '*patchCounts names undeclared package*' 'A count for an undeclared package'
foreach ($invalidCount in @('14', 14.5, 0, -1, $null)) {
    Test-Broken { param($c) (Get-Entry $c 'rushiranpise').patchCounts.'org.telegram.messenger.web' = $invalidCount } `
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
Test-Broken { param($c) (Get-NagramReference $c).kind = 'maintained' } '*is archived, so its kind must be historical*' `
    'An archived reference classified as maintained'

# A source on a forge the audit can't read.
Assert-True (@($ruleLedger.elsewhere).Count -gt 0) 'The ledger records no source elsewhere, so the cases below would prove nothing.'
Test-Broken { param($c) $c.elsewhere[0].repository = 'https://github.com/someone/patches' } '*is on GitHub or GitLab, so it belongs in entries or outOfScope*' `
    'A GitHub source filed under elsewhere'
Test-Broken { param($c) $c.elsewhere[0].repository = 'git.example.org/someone/patches' } '*is not an https repository address*' 'An elsewhere source with no address'
Test-Broken { param($c) $c.elsewhere[0].version = '' } '*records no version*' 'An elsewhere source with no version'
Test-Broken { param($c) $c.elsewhere[0].packages = @('org.example.client') } "*names 'org.example.client'*" 'An elsewhere source naming a package outside the census'
Test-Broken { param($c) $c.elsewhere[0].packages = @() } '*elsewhere*names no Telegram package*' 'An elsewhere source naming no package'
Test-Broken { param($c) $c.elsewhere[0].reason = ' ' } '*elsewhere*gives no reason*' 'An elsewhere source with no reason'
Test-Broken { param($c) $c.elsewhere = @($c.elsewhere[0], (Copy-Json $c.elsewhere[0])) } '*elsewhere*is listed twice*' 'An elsewhere source listed twice'
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
Test-Broken { param($c) (Get-NagramReference $c).archivedAt = @('2026-10-01') } '*reference archivedAt must be a date string or null*' `
    'An array used for the archive date'
Test-Broken { param($c) (Get-NagramReference $c).archivedAt = '2026-10-02' } '*reference archivedAt is after verifiedAt*' `
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
foreach ($index in $listings.indexes) { $index.hushtelegram = [pscustomobject]@{ status = 'listed'; url = 'https://example.com/listing'; checked = '2026-09-25' } }
Assert-True (Test-SourceListings -Ledger $listings).Valid 'Every index listing HushTelegram was refused.'
$listings.indexes[0].hushtelegram = [pscustomobject]@{ status = 'submitted'; url = 'https://example.com/issue/1'; submitted = '2026-09-25' }
Assert-True (Test-SourceListings -Ledger $listings).Valid 'A dated submission was not accepted in place of a listing.'
$listings.indexes[1].hushtelegram = [pscustomobject]@{ status = 'not-listed'; checked = '2026-09-25' }
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
        $index.hushtelegram = if ($Pending) { [pscustomobject]@{ status = 'not-listed'; checked = $CheckedAt } } else {
            [pscustomobject]@{ status = 'listed'; url = 'https://example.com/listing'; checked = $CheckedAt } }
    }
    # Every date the audit's clean run stamps is set here, or a ledger stamped after these fixed
    # days would put a record after the gate's today and fail the case for the wrong reason.
    foreach ($entry in $copy.entries) { $entry.lastChecked = $CheckedAt }
    foreach ($item in @($copy.elsewhere | Where-Object { $_ })) { $item.lastChecked = $CheckedAt }
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
Assert-True (-not $gate.Valid -and $gate.Reason -like '*15 days old*audit-telegram-sources.ps1*') "The release gate accepted a stale census: $($gate.Reason)"
Save-GateLedger -CheckedAt '2026-09-25' -Pending
$gate = Test-SourceReleaseGate -Root $gateRoot -Today '2026-09-26'
# An index that doesn't list HushTelegram yet is named, not refused: a submission is a public
# request on someone else's project, so a release can't be made to wait on it.
Assert-True ($gate.Valid -and $gate.Summary -like '*HushTelegram is not listed on *yet and has no submission recorded there*') "The release gate didn't name the indexes that don't list HushTelegram: $($gate.Summary) $($gate.Reason)"
Remove-Item -LiteralPath (Get-SourceLedgerPath -Root $gateRoot)
$gate = Test-SourceReleaseGate -Root $gateRoot -Today '2026-09-26'
Assert-True (-not $gate.Valid -and $gate.Reason -like '*ledger is missing*') "The release gate accepted a missing ledger: $($gate.Reason)"

Write-Host '[sources] the census holds to 14 days and every index needs a listing or a dated submission'

# --- the audit, against stand-ins for every forge and index -----------------------------------------

$auditScript = Join-Path $PSScriptRoot 'audit-telegram-sources.ps1'
$fixtureRoot = Join-Path $caseRoot 'audit'
New-Item -ItemType Directory -Path (Join-Path $fixtureRoot 'sources'), (Join-Path $fixtureRoot 'patches'), (Join-Path $fixtureRoot 'extensions') -Force | Out-Null
# The fixture's alpha source is adopted, so its root carries the NOTICE entry and the provenance
# rule an adopted source needs, and the catalog whose two builds its receipt has to prove.
Copy-Item -LiteralPath (Join-Path $Root 'patches-list.json') -Destination (Join-Path $fixtureRoot 'patches-list.json')
$adoptedCommit = 'ad' * 20
$declaredBuilds = $catalogBuilds
# The adopted source's two fixtures: every declared build, and the one before when Telegram declares one.
$adoptedBuilds = @($catalogBuilds + $olderBuild)
[IO.File]::WriteAllText((Join-Path $fixtureRoot 'NOTICE'), "Fixture NOTICE`n  alpha  https://github.com/fixture-owner/alpha-patches`n")
[IO.File]::WriteAllText((Join-Path $fixtureRoot 'provenance.json'), (@{ rules = @(@{ paths = @('patches/**'); origin = 'ported'
    upstream = 'https://github.com/fixture-owner/alpha-patches'; commit = $adoptedCommit; license = 'GPL-3.0'; via = @() }) } | ConvertTo-Json -Depth 6))
Set-Content -LiteralPath (Join-Path $fixtureRoot 'patches/Keep.kt') -Value 'class Keep' -Encoding ASCII
$receiptUrl = 'https://github.com/SysAdminDoc/HushTelegram/releases/download/v9.9.9/release-receipt-9.9.9.json'
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
# Bundle ids in Jman's registry: alpha's stable and dev bundles, gamma's, an old bundle from a
# repository the ledger doesn't know, another app's bundle, and one no repository stands behind.
$jmanAlpha = 'a1' * 12
$jmanAlphaDev = 'a2' * 12
$jmanGamma = 'c1' * 12
$jmanOld = 'e1' * 12
$jmanOther = 'f1' * 12
$jmanDelta = 'd1' * 12
function Get-JmanImport {
    param([string]$Repository, [string]$Channel)
    return 'https://patch-bundles.api.jmancentral.com/api/v3/bundle?source_url=' + [Uri]::EscapeDataString($Repository) + "&version=latest&channel=$Channel"
}
$fixtureLedger = [ordered]@{
    schemaVersion = 1
    census = [ordered]@{ checkedAt = '2026-09-01'; skipped = @('gitlab-code-search') }
    self = [ordered]@{ repository = 'https://github.com/SysAdminDoc/HushTelegram' }
    officialBundle = [ordered]@{ repository = 'https://github.com/MorpheApp/morphe-patches'; branch = 'main'; list = 'patches-list.json'; packages = @() }
    indexes = @(
        [ordered]@{ id = 'morphe-directory'; name = 'Morphe community directory'; url = 'https://morphe-patches.software'
            hushtelegram = [ordered]@{ status = 'not-listed'; checked = '2026-09-01' } }
        [ordered]@{ id = 'awesome-morphe'; name = 'Awesome Morphe'; url = 'https://github.com/nvbangg/awesome-morphe'
            hushtelegram = [ordered]@{ status = 'submitted'; url = 'https://github.com/nvbangg/awesome-morphe/issues/1'; submitted = '2026-09-01' } }
        [ordered]@{ id = 'morphe-patch-tracker'; name = 'Morphe Patch Tracker'; url = 'https://drnx64.github.io/morphe-track-patches/'
            hushtelegram = [ordered]@{ status = 'listed'; url = 'https://drnx64.github.io/morphe-track-patches/#/bundle/sysadmindoc'; checked = '2026-09-01' } }
        [ordered]@{ id = 'jman-bundles'; name = 'Jman''s Patch Bundle Registry'; url = 'https://github.com/Jman-Github/Patch-Bundle-Registry'
            hushtelegram = [ordered]@{ status = 'not-listed'; checked = '2026-09-01' } }
        [ordered]@{ id = 'morphe-archive'; name = 'Morphe Archive'; url = 'https://rushiforai.github.io/morphe-archive/'
            hushtelegram = [ordered]@{ status = 'listed'; url = 'https://github.com/rushiforai/morphe-archive'; checked = '2026-09-01' } }
    )
    entries = @(
        [ordered]@{ id = 'alpha'; repository = 'https://github.com/fixture-owner/alpha-patches'; lineage = 'alpha'; upstream = $null
            kind = 'morphe-patches'; packages = @('org.telegram.messenger.web'); targetVersions = [ordered]@{ 'org.telegram.messenger.web' = @('12.10.6') }
            patchCounts = [ordered]@{ 'org.telegram.messenger.web' = 1 }
            features = @('Hide ads'); branches = @([ordered]@{ name = 'main'; commit = $commitA1 }); watchPaths = @()
            license = [ordered]@{ spdx = 'GPL-3.0'; url = "https://github.com/fixture-owner/alpha-patches/blob/$commitA1/LICENSE"; sha256 = $licenseHash }
            contaminatedBy = $null; disposition = 'adopted'; reason = 'A fixture source.'; archived = $false
            adopted = [ordered]@{ commit = $adoptedCommit; fixtures = [ordered]@{ receipt = $receiptUrl; builds = $adoptedBuilds } }
            forks = @('someone/alpha-patches'); contentHashes = @($blobKnown)
            mirrors = @([ordered]@{ repository = 'https://github.com/copier/alpha-copy'; reason = 'A fixture copy.'; blobs = @($blobMirror) })
            lastChecked = '2026-09-01' }
        [ordered]@{ id = 'beta'; repository = 'https://github.com/fixture-owner/beta-module'; lineage = 'beta'; upstream = $null
            kind = 'xposed-module'; packages = @('org.telegram.messenger.web', 'org.telegram.plus'); targetVersions = [ordered]@{ 'org.telegram.messenger.web' = @() }
            features = @('Hide sponsored messages'); branches = @([ordered]@{ name = 'main'; commit = $commitB1 }); watchPaths = @('app/telegram')
            license = $null; contaminatedBy = $null; disposition = 'behavior-only'; reason = 'A fixture module with no licence.'; archived = $false
            forks = @(); contentHashes = @(); mirrors = @(); lastChecked = '2026-09-01' }
        [ordered]@{ id = 'gamma'; repository = 'https://gitlab.com/fixture-group/gamma-patches'; lineage = 'gamma'; upstream = $null
            kind = 'revanced-patches'; packages = @('org.telegram.messenger.web'); targetVersions = [ordered]@{ 'org.telegram.messenger.web' = @() }
            features = @('Open links outside'); branches = @([ordered]@{ name = 'main'; commit = $commitG1 }); watchPaths = @()
            license = [ordered]@{ spdx = 'GPL-3.0'; url = "https://gitlab.com/fixture-group/gamma-patches/-/blob/$commitG1/LICENSE"; sha256 = $licenseHash }
            contaminatedBy = $null; disposition = 'candidate'; reason = 'A fixture GitLab source.'; archived = $false
            forks = @(); contentHashes = @(); mirrors = @(); lastChecked = '2026-09-01' }
    )
    outOfScope = @([ordered]@{ repository = 'https://github.com/noise/mentions-telegram'; reason = 'A historical client reference.'
        reference = [ordered]@{ kind = 'historical'; branch = 'dev'; commit = ('d1' * 20); archived = $true; verifiedAt = '2026-08-27'; archivedAt = $null }
        lastChecked = '2026-09-01' })
    elsewhere = @([ordered]@{ repository = 'https://git.example.net/recorded/patches'; packages = @('org.telegram.messenger.web'); version = 'v2.0.0'
        reason = 'A fixture source on another forge.'; lastChecked = '2026-09-01' })
}
$fixtureLedgerText = ($fixtureLedger | ConvertTo-Json -Depth 20) -replace "`r`n", "`n"
function Reset-FixtureLedger { [IO.File]::WriteAllText($fixtureLedgerPath, $fixtureLedgerText, (New-Object Text.UTF8Encoding $false)) }
Reset-FixtureLedger
Assert-True (Test-SourceLedger -Ledger ($fixtureLedgerText | ConvertFrom-Json) -Root $fixtureRoot -Today '2026-09-25').Valid `
    'The audit fixture ledger breaks the rules, so the audit would stop before any case below.'

# What each forge and index answers. A case changes one answer and puts it back.
function New-FakeAnswers {
    $answers = [ordered]@{
        official = @{ Status = 200; Content = '{"patches":[{"name":"Example","compatiblePackages":{"com.google.android.youtube":["20.1"]}}]}' }
        directory = @{ Status = 200; Content = (@{
            bundles = @(@{ source = 'github'; repo = 'fixture-owner/alpha-patches'; name = 'Alpha'; targetApps = @('org.telegram.messenger.web')
                patches = @(@{ name = 'Hide ads'; compatiblePackagesKey = 0 }) })
            compatibilities = @(@{ packageName = 'org.telegram.messenger.web'; targets = @(@{ version = '12.10.6' }) }) } | ConvertTo-Json -Depth 8) }
        awesome = @{ Status = 200; Content = '{"fixture-owner/alpha-patches":{"org.telegram.messenger.web":"0123"},"SysAdminDoc/hushfeed":{"com.zhiliaoapp.musically":"4567"}}' }
        tracker = @{ Status = 200; Content = (@{
            'sysadmindoc:stable' = @{ repo_url = 'https://github.com/SysAdminDoc/HushTelegram'; apps = @(@{ package = 'org.telegram.messenger.web'; patches = @(@{ name = 'Hide ads' }) }) }
            'alpha:stable' = @{ repo_url = 'https://github.com/fixture-owner/alpha-patches'; apps = @(@{ package = 'org.telegram.messenger.web'; patches = @(@{ name = 'Hide ads' }) }) }
        } | ConvertTo-Json -Depth 8) }
        # Jman's registry: its bundles and their patches, which the catalog API answers are built
        # from per request. jmanBundlesUnread is how many more latest bundles the API says it has
        # past the first page.
        jmanBundlesUnread = 0
        jmanBundles = @(
            [ordered]@{ id = $jmanAlpha; version = 'v1.0.0'; is_latest = $true; packages = @('org.telegram.messenger.web'); source_id = 'alpha'
                import_urls = [ordered]@{ latest = (Get-JmanImport 'https://github.com/fixture-owner/alpha-patches' 'any')
                    stable = (Get-JmanImport 'https://github.com/fixture-owner/alpha-patches' 'stable') }
                download_url = 'https://github.com/fixture-owner/alpha-patches/releases/download/v1.0.0/patches-1.0.0.mpp' }
            # The same source's dev bundle is latest too, and with no import link its release download names the repository.
            [ordered]@{ id = $jmanAlphaDev; version = 'v1.1.0-dev.1'; is_latest = $true; packages = @('org.telegram.messenger.web'); source_id = 'alpha'
                import_urls = $null; download_url = 'https://github.com/fixture-owner/alpha-patches/releases/download/v1.1.0-dev.1/patches-1.1.0-dev.1.mpp' }
            [ordered]@{ id = $jmanGamma; version = 'v2.0.0'; is_latest = $true; packages = @('org.telegram.messenger.web'); source_id = 'gamma'
                import_urls = [ordered]@{ latest = (Get-JmanImport 'https://gitlab.com/fixture-group/gamma-patches' 'any') }
                download_url = 'https://gitlab.com/fixture-group/gamma-patches/-/releases/v2.0.0/downloads/patches-2.0.0.mpp' }
            # Only latest bundles are read for sources, so an old one from a repository the ledger doesn't know stays quiet.
            [ordered]@{ id = $jmanOld; version = 'v0.1.0'; is_latest = $false; packages = @('org.telegram.messenger.web'); source_id = 'newcomer'
                import_urls = $null; download_url = 'https://github.com/newcomer/telegram-patches/releases/download/v0.1.0/patches-0.1.0.mpp' }
            [ordered]@{ id = $jmanOther; version = 'v5.0.0'; is_latest = $true; packages = @('com.google.android.youtube'); source_id = 'other'
                import_urls = [ordered]@{ stable = (Get-JmanImport 'https://github.com/someone-else/youtube-patches' 'stable') }
                download_url = 'https://github.com/someone-else/youtube-patches/releases/download/v5.0.0/patches-5.0.0.mpp' }
        )
        # The API lists a patch's packages as {name, versions} records, and older records map each
        # package to its versions. A patch for any app names no package, and one for a fork names no
        # census package.
        jmanPatches = @(
            [ordered]@{ bundle_id = $jmanAlpha; name = 'Hide ads'; compatiblePackages = @([ordered]@{ name = 'org.telegram.messenger.web'; versions = @('12.10.6') }) }
            [ordered]@{ bundle_id = $jmanAlpha; name = 'Disable typing status'; compatiblePackages = [ordered]@{ 'org.telegram.messenger.web' = $null } }
            [ordered]@{ bundle_id = $jmanAlpha; name = 'Spoof signature'; compatiblePackages = $null }
            [ordered]@{ bundle_id = $jmanOld; name = 'Hide replies'; compatiblePackages = @([ordered]@{ name = 'org.telegram.messenger.web'; versions = $null }) }
            [ordered]@{ bundle_id = $jmanGamma; name = 'Open links outside'; compatiblePackages = @([ordered]@{ name = 'org.telegram.messenger.web'; versions = $null }) }
            [ordered]@{ bundle_id = $jmanAlphaDev; name = 'Hide stories'; compatiblePackages = @([ordered]@{ name = 'org.telegram.messenger.web'; versions = @('12.10.7') }) }
            [ordered]@{ bundle_id = $jmanGamma; name = 'Plus only'; compatiblePackages = @([ordered]@{ name = 'org.telegram.plus'; versions = $null }) }
        )
        archive = @{ Status = 200; Content = '{"name":"patches-list.json"}' }
        searchHits = @(
            @{ repository = @{ full_name = 'fixture-owner/alpha-patches' }; path = 'patches/Alpha.kt'; sha = $blobKnown }
            @{ repository = @{ full_name = 'copier/alpha-copy' }; path = 'patches/Alpha.kt'; sha = $blobMirror }
            @{ repository = @{ full_name = 'clone/alpha-clone' }; path = 'src/Alpha.kt'; sha = $blobKnown }
            @{ repository = @{ full_name = 'rushiforai/morphe-archive' }; path = 'examplepatches/fixture-owner/alpha-patches/patches-list.json'; sha = ('3b' * 20) }
            @{ repository = @{ full_name = 'rushiforai/morphe-archive' }; path = 'examplepatches/Jman-Github/ReVanced-Patch-Bundles/patch-bundles/x/y-patches-list.json'; sha = ('4b' * 20) }
            @{ repository = @{ full_name = 'noise/mentions-telegram' }; path = 'list.txt'; sha = ('5b' * 20) }
            @{ repository = @{ full_name = 'SysAdminDoc/HushTelegram' }; path = 'patches-list.json'; sha = ('6b' * 20) }
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
        repoMeta = @{ Status = 200; Content = '{"full_name":"newcomer/telegram-patches","license":{"spdx_id":"MIT"},"fork":false,"archived":false,"pushed_at":"2026-09-20T00:00:00Z","description":"Telegram patches"}' }
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
        $fakeForge.Requests.Add([pscustomobject]@{ Uri = $url; Authorization = $authorization; MaximumRedirection = $MaximumRedirection })
        $a = $fakeForge.Answers
        $answer = $null
        switch -Regex ($url) {
            '^https://raw\.githubusercontent\.com/MorpheApp/morphe-patches/main/patches-list\.json$' { $answer = $a.official; break }
            '^https://morphe-patches\.software/data/bundles\.json$' { $answer = $a.directory; break }
            '^https://raw\.githubusercontent\.com/nvbangg/awesome-morphe/main/data/hashes\.json$' { $answer = $a.awesome; break }
            '^https://raw\.githubusercontent\.com/drnx64/morphe-track-patches/main/data/bundles\.json$' { $answer = $a.tracker; break }
            '^https://patch-bundles\.api\.jmancentral\.com/bundles\?limit=1&source_url=([^&]+)$' {
                # Any bundle the repository stands behind, by its import link or its release download.
                $repository = [Uri]::UnescapeDataString($Matches[1])
                $theirs = @($a.jmanBundles | Where-Object {
                    ([string]$_.download_url).StartsWith("$repository/releases/") -or
                        ($_.import_urls -and @($_.import_urls.Values | Where-Object { $_ -like "*source_url=$([Uri]::EscapeDataString($repository))&*" }).Count -gt 0) })
                $answer = @{ Status = 200; Content = (ConvertTo-Json -Depth 8 -InputObject ([ordered]@{
                    data = @($theirs | Select-Object -First 1); total = $theirs.Count; limit = 1; offset = 0 })) }
                break
            }
            '^https://patch-bundles\.api\.jmancentral\.com/apps/([^/?]+)/bundles\?release=latest&include_unverified=true&limit=100$' {
                # The API filters to latest bundles. Its answer here keeps an old one in, so the audit's own check is what skips it.
                $app = [Uri]::UnescapeDataString($Matches[1])
                $forApp = @($a.jmanBundles | Where-Object { @($_.packages) -contains $app })
                $answer = @{ Status = 200; Content = (ConvertTo-Json -Depth 8 -InputObject ([ordered]@{
                    data = $forApp; total = ($forApp.Count + $a.jmanBundlesUnread); limit = 100; offset = 0 })) }
                break
            }
            '^https://patch-bundles\.api\.jmancentral\.com/bundles/([0-9a-f]+)/patches\?include_unverified=true&limit=100&offset=(\d+)$' {
                $bundleId = $Matches[1]
                $ofBundle = @($a.jmanPatches | Where-Object { $_.bundle_id -eq $bundleId })
                $answer = @{ Status = 200; Content = (ConvertTo-Json -Depth 8 -InputObject ([ordered]@{
                    data = @($ofBundle | Select-Object -Skip ([int]$Matches[2])); total = $ofBundle.Count; limit = 100
                    offset = [int]$Matches[2]; next_cursor = $null })) }
                break
            }
            '^https://api\.github\.com/repos/rushiforai/morphe-archive/contents/examplepatches/SysAdminDoc/HushTelegram/patches-list\.json$' { $answer = $a.archive; break }
            '^https://api\.github\.com/search/code\?q=([^&]+)&per_page=100&page=1$' {
                $query = [Uri]::UnescapeDataString($Matches[1])
                $items = if ($query -eq '"org.telegram.messenger.web" bytecodePatch') { @($a.searchHits) } else { @() }
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
            '^https://api\.github\.com/repos/fixture-owner/beta-module/commits\?sha=main&path=app%2Ftelegram&per_page=1$' { $answer = $a.betaWatch; break }
            '^https://api\.github\.com/repos/fixture-owner/beta-module/forks\?per_page=100&page=1$' { $answer = $a.betaForks; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches$' { $answer = $a.gammaProject; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches/repository/tree\?ref=main&per_page=100&page=1$' { $answer = $a.gammaTree; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches/repository/files/LICENSE\?ref=main$' { $answer = $a.gammaLicense; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches/repository/branches\?per_page=100&page=1$' { $answer = $a.gammaBranches; break }
            '^https://gitlab\.com/api/v4/projects/fixture-group%2Fgamma-patches/forks\?per_page=100&page=1$' { $answer = $a.gammaForks; break }
            '^https://api\.github\.com/repos/(newcomer/telegram-patches|clone/alpha-clone)$' { $answer = $a.repoMeta; break }
            '^https://api\.github\.com/repos/fixture-owner/alpha-old$' { $answer = $a.oldNameMeta; break }
            '^https://github\.com/SysAdminDoc/HushTelegram/releases/download/v9\.9\.9/release-receipt-9\.9\.9\.json$' { $answer = $a.receipt; break }
            '^https://api\.github\.com/repos/fixture-owner/moved-same$' { $answer = @{ Status = 301; Location = '/repos/fixture-owner/alpha-patches' }; break }
            '^https://api\.github\.com/repos/fixture-owner/moved-away$' { $answer = @{ Status = 302; Location = 'https://elsewhere.example/steal' }; break }
            '^https://api\.github\.com/repos/fixture-owner/moved-down$' { $answer = @{ Status = 302; Location = 'http://api.github.com/repos/fixture-owner/alpha-patches' }; break }
        }
        if ($null -eq $answer) { throw "The audit made a request no stand-in answers: $url" }
        if ($answer.Status -ne 200) {
            $failure = New-Object System.Exception "Response status code does not indicate success: $($answer.Status)."
            Add-Member -InputObject $failure -NotePropertyName Response -NotePropertyValue ([pscustomobject]@{
                StatusCode = $answer.Status; Headers = @{ Location = $answer.Location } })
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
        $stampedLedger.indexes[2].hushtelegram.checked -eq '2026-09-25' -and $stampedLedger.indexes[1].hushtelegram.submitted -eq '2026-09-01') `
        'The clean audit did not stamp the census and every checked record with today, or it moved a submission date.'
    Assert-True ($stampedLedger.outOfScope[0].reference.verifiedAt -eq '2026-08-27' -and
        $null -eq $stampedLedger.outOfScope[0].reference.archivedAt -and $stampedLedger.outOfScope[0].reference.commit -eq ('d1' * 20) -and
        $stampedLedger.entries[0].patchCounts.'org.telegram.messenger.web' -eq 1 -and $stampedLedger.entries[0].adopted.commit -eq $adoptedCommit) `
        'The census stamp moved historical verification, invented an archive date, or changed patch counts or adoption pins.'
    $after = Get-TreeState
    $changed = @(Compare-Object $before $after | ForEach-Object { ($_.InputObject -split ' ')[0] } | Sort-Object -Unique)
    Assert-True ($changed.Count -eq 1 -and $changed[0] -like '*telegram-sources.json') `
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
    # Jman's registry: alpha (its stable and dev bundles) and gamma are its Telegram sources. Each
    # of their patch lists is read once, and neither the old bundle's nor another app's is read.
    Assert-True ($clean.Said -like "*Jman's bundle index: 2 Telegram bundles; HushTelegram not listed*") "Jman's registry was not read for alpha and gamma: $($clean.Said)"
    $patchReads = @($fakeForge.Requests | Where-Object { $_.Uri -like 'https://patch-bundles.api.jmancentral.com/bundles/*/patches?*' } |
        ForEach-Object { ($_.Uri -split '/')[4] })
    Assert-True ((($patchReads | Sort-Object) -join ',') -eq ((@($jmanAlpha, $jmanAlphaDev, $jmanGamma) | Sort-Object) -join ',')) `
        "Jman's patch lists were read for the wrong bundles, or one more than once: $($patchReads -join ', ')"
    Reset-FixtureLedger

    # A request that carries a token follows a redirect itself, to the same host over https and
    # nowhere else; one that carries none is left to the client.
    $auditAst = [System.Management.Automation.Language.Parser]::ParseFile($auditScript, [ref]$null, [ref]$null)
    foreach ($name in @('Get-RedirectTarget', 'Invoke-SourceRequest', 'ConvertTo-SourceJsonObject', 'ConvertFrom-SourceJson')) {
        $found = @($auditAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.FunctionDefinitionAst] -and
            $node.Name -eq $name }, $true))
        Assert-True ($found.Count -eq 1) "audit-telegram-sources.ps1 no longer defines $name once."
        Invoke-Expression $found[0].Extent.Text
    }
    function Write-Step { param($Text) }
    $GitHubToken = $fakeToken
    $GitLabToken = $null
    $RateLimitWaitSeconds = 0
    $script:requestCount = 0
    $fakeForge.Requests.Clear()
    $followed = Invoke-SourceRequest -Uri 'https://api.github.com/repos/fixture-owner/moved-same' -Auth github
    Assert-True ($followed.Status -eq 200 -and $fakeForge.Requests.Count -eq 2 -and
        $fakeForge.Requests[1].Uri -eq 'https://api.github.com/repos/fixture-owner/alpha-patches' -and
        $fakeForge.Requests[0].MaximumRedirection -eq 0 -and $fakeForge.Requests[1].Authorization -eq "Bearer $fakeToken") `
        'A same-host redirect on a token request was not followed by hand with the token kept.'
    foreach ($away in @('moved-away', 'moved-down')) {
        $fakeForge.Requests.Clear()
        Assert-Throws { Invoke-SourceRequest -Uri "https://api.github.com/repos/fixture-owner/$away" -Auth github } '*Refused a redirect*' `
            "A redirect ($away) on a token request was followed."
        Assert-True (@($fakeForge.Requests | Where-Object { $_.Uri -notlike 'https://api.github.com/*' }).Count -eq 0) `
            "The token request went on to another address after the $away redirect."
    }
    $fakeForge.Requests.Clear()
    [void](Invoke-SourceRequest -Uri 'https://morphe-patches.software/data/bundles.json')
    Assert-True ($null -eq $fakeForge.Requests[0].MaximumRedirection) 'A request with no token had its redirects switched off.'

    # Keys that differ only in case can't both be properties, so that JSON is read case-sensitively,
    # in order, with arrays kept as arrays and the later key renamed. Broken JSON fails as before.
    $cased = ConvertFrom-SourceJson -Text '{"b":1,"a":{"K":[1],"k":[]},"B":2}' -What 'the stand-in'
    Assert-True ((@($cased.PSObject.Properties | ForEach-Object { $_.Name }) -join ',') -ceq 'b,a,B#2' -and $cased.b -eq 1 -and $cased.'B#2' -eq 2 -and
        $cased.a.K -is [array] -and @($cased.a.K).Count -eq 1 -and $cased.a.'k#2' -is [array] -and @($cased.a.'k#2').Count -eq 0) `
        "JSON with keys that differ only in case was misread: $($cased | ConvertTo-Json -Compress -Depth 4)"
    Assert-Throws { ConvertFrom-SourceJson -Text '{"a":' -What 'the stand-in' } 'the stand-in did not answer JSON: *' 'Broken JSON was not refused.'

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
    $fakeForge.Answers.directory.Content = $fakeForge.Answers.directory.Content.Replace('"repo":  "fixture-owner/alpha-patches"', '"repo":  "newcomer/telegram-patches"').Replace(
        '"repo": "fixture-owner/alpha-patches"', '"repo": "newcomer/telegram-patches"')
    Assert-True ($fakeForge.Answers.directory.Content -like '*newcomer/telegram-patches*') 'The directory answer was not edited, so the addition case would prove nothing.'
    Assert-Drift 'addition' '*github.com/newcomer/telegram-patches*Morphe directory*' 'A bundle only the directory knows'
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

    # A branch cut from main before its Telegram code last moved carries nothing new; one ahead of it does.
    $fakeForge.Answers.alphaBranches.Content = "[{`"name`":`"main`",`"commit`":{`"sha`":`"$commitA1`"}},{`"name`":`"old`",`"commit`":{`"sha`":`"$('a3' * 20)`"}}]"
    $fakeForge.Answers.compare[('a3' * 20)] = 'behind'
    $contained = Invoke-Audit
    Assert-True ($contained.ExitCode -eq 0) ("A branch behind a pinned one was reported: " +
        (@($contained.Report.findings | ForEach-Object { "$($_.kind): $($_.detail)" }) -join ' | '))
    Reset-FixtureLedger
    $fakeForge.Answers.compare[('a3' * 20)] = 'ahead'
    Assert-Drift 'new-branch' '*alpha-patches*branch old carries Telegram work*' 'A branch with work of its own'
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

    $fakeForge.Answers.tracker.Content = $fakeForge.Answers.tracker.Content.Replace('SysAdminDoc/HushTelegram', 'SysAdminDoc/hushfeed')
    Assert-Drift 'listing-changed' '*Morphe Patch Tracker no longer lists HushTelegram*' 'A listing that disappeared'
    $fakeForge.Answers = New-FakeAnswers

    # The tracker writes bundle keys that differ only in case (ImmortalZeus:dev and immortalzeus:dev).
    # Both are read: the second names a repository the ledger doesn't know.
    $trackerApps = '"apps":[{"package":"org.telegram.messenger.web","patches":[{"name":"Hide ads"}]}]'
    $fakeForge.Answers.tracker.Content = ('{"sysadmindoc:stable":{"repo_url":"https://github.com/SysAdminDoc/HushTelegram",' + $trackerApps + '},' +
        '"alpha:stable":{"repo_url":"https://github.com/fixture-owner/alpha-patches",' + $trackerApps + '},' +
        '"ALPHA:stable":{"repo_url":"https://github.com/newcomer/telegram-patches",' + $trackerApps + '}}')
    $casedTracker = Invoke-Audit
    Assert-True (@($casedTracker.Report.findings | Where-Object { $_.kind -eq 'source-failed' }).Count -eq 0) `
        ("A tracker answer with keys that differ only in case failed a source: " +
            (@($casedTracker.Report.findings | ForEach-Object { "$($_.kind): $($_.detail)" }) -join ' | '))
    Assert-True ($casedTracker.ExitCode -eq 1 -and $casedTracker.Said -like '*Morphe Patch Tracker: 3 Telegram bundles; HushTelegram listed*' -and
        @($casedTracker.Report.findings | Where-Object { $_.kind -eq 'addition' -and $_.repository -eq 'https://github.com/newcomer/telegram-patches' -and
            $_.detail -like '*Morphe Patch Tracker*' }).Count -eq 1) "The tracker's second, case-differing bundle was not read: $($casedTracker.Said)"
    Assert-True ([IO.File]::ReadAllText($fixtureLedgerPath) -ceq $fixtureLedgerText) 'The case-differing tracker case changed the ledger.'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.official.Content = '{"patches":[{"name":"Hide ads","compatiblePackages":[{"packageName":"org.telegram.messenger.web"}]}]}'
    Assert-Drift 'official-bundle-changed' '*official bundle now patches*org.telegram.messenger.web*' 'The official bundle taking on Telegram'
    $fakeForge.Answers = New-FakeAnswers

    # An adopted source's receipt has to prove every declared build, unforced.
    $fakeForge.Answers.receipt.Content = $fakeForge.Answers.receipt.Content -replace '"forced":\s*false', '"forced": true'
    Assert-Drift 'fixture-evidence' "*alpha-patches*no unforced run of Telegram $($declaredBuilds[0])*" 'An adopted source whose receipt forced a build'
    $fakeForge.Answers = New-FakeAnswers

    $fakeForge.Answers.alphaRepo.Content = $fakeForge.Answers.alphaRepo.Content.Replace('"fixture-owner/alpha-patches"', '"fixture-owner/alpha-renamed"')
    Assert-Drift 'renamed' '*alpha-patches*now https://github.com/fixture-owner/alpha-renamed*' 'A source that was renamed'
    $fakeForge.Answers = New-FakeAnswers

    # A recorded fork or an out-of-scope repository that an index lists as a bundle of its own. The
    # control's archived copy of the fork's list, for alpha's own package, stayed quiet.
    foreach ($listed in @('someone/alpha-patches', 'noise/mentions-telegram')) {
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

    # A latest Telegram bundle in Jman's registry that no repository stands behind: a source on
    # another forge, or no import link and a download from somewhere that isn't a GitHub release.
    foreach ($unresolved in @(
            @{ Import = [ordered]@{ latest = 'https://patch-bundles.api.jmancentral.com/api/reseam/bundle?source_url=https%3A%2F%2Fgit.example.org%2Fsomeone%2Fpatches&version=latest&channel=any' }
                Download = 'https://git.example.org/someone/patches/releases/download/v1.0.0/patches.mpp'
                Detail = '*its source https://git.example.org/someone/patches is not a GitHub or GitLab repository*' }
            @{ Import = $null; Download = 'https://downloads.example.org/delta/patches-1.0.0.mpp'; Detail = '*it names no source repository*' })) {
        $fakeForge.Answers.jmanBundles = @($fakeForge.Answers.jmanBundles) + , ([ordered]@{ id = $jmanDelta; version = 'v1.0.0'; is_latest = $true
            packages = @('org.telegram.messenger.web'); source_id = 'delta'; import_urls = $unresolved.Import; download_url = $unresolved.Download })
        Assert-Drift 'index-unresolved' "*Jman's registry lists bundle $jmanDelta (v1.0.0) for org.telegram.messenger.web*$($unresolved.Detail)" `
            'A latest Telegram bundle no repository stands behind'
        $fakeForge.Answers = New-FakeAnswers
    }

    # The same kind of bundle from a source the ledger records elsewhere: quiet at the recorded
    # version, a finding once the registry shows another.
    foreach ($shown in @('v2.0.0', 'v2.1.0')) {
        $fakeForge.Answers.jmanBundles = @($fakeForge.Answers.jmanBundles) + , ([ordered]@{ id = $jmanDelta; version = $shown; is_latest = $true
            packages = @('org.telegram.messenger.web'); source_id = 'delta'
            import_urls = [ordered]@{ latest = 'https://patch-bundles.api.jmancentral.com/api/reseam/bundle?source_url=https%3A%2F%2Fgit.example.net%2Frecorded%2Fpatches.git&version=latest&channel=any' }
            download_url = "https://git.example.net/recorded/patches/releases/download/$shown/patches.reseam" })
        if ($shown -eq 'v2.0.0') {
            $quiet = Invoke-Audit
            Assert-True ($quiet.ExitCode -eq 0 -and @($quiet.Report.findings).Count -eq 0) ("A recorded source elsewhere at its recorded version was reported: " +
                (@($quiet.Report.findings | ForEach-Object { "$($_.kind): $($_.repository) $($_.detail)" }) -join ' | '))
            Reset-FixtureLedger
        } else {
            Assert-Drift 'elsewhere-changed' '*git.example.net/recorded/patches*now lists v2.1.0, the ledger records v2.0.0*' 'A recorded source elsewhere with a new release'
        }
        $fakeForge.Answers = New-FakeAnswers
    }

    # What the registry's latest bundles patch reaches the ledger's checks: alpha's stable and dev
    # bundles merge on GitHub, gamma is read on GitLab, and only each bundle's own Telegram patches count.
    foreach ($bundle in $fakeForge.Answers.jmanBundles) {
        if (@($jmanAlpha, $jmanAlphaDev, $jmanGamma) -contains $bundle.id) { $bundle.packages = @(@($bundle.packages) + 'org.telegram.messenger.beta') }
    }
    $reached = Invoke-Audit
    $alphaReached = @($reached.Report.findings | Where-Object { $_.kind -eq 'packages-changed' -and $_.repository -eq 'https://github.com/fixture-owner/alpha-patches' })
    $gammaReached = @($reached.Report.findings | Where-Object { $_.kind -eq 'packages-changed' -and $_.repository -eq 'https://gitlab.com/fixture-group/gamma-patches' })
    Assert-True ($reached.ExitCode -eq 1 -and $alphaReached.Count -eq 1 -and $gammaReached.Count -eq 1) `
        ("Jman's latest alpha and gamma bundles naming a new package were not both reported: " +
            (@($reached.Report.findings | ForEach-Object { "$($_.kind): $($_.repository) $($_.detail)" }) -join ' | '))
    $alphaFeatures = @($alphaReached[0].evidence.features)
    Assert-True (@($alphaReached[0].evidence.sources) -contains 'Jman''s bundle index' -and $alphaFeatures -contains 'Disable typing status' -and
        $alphaFeatures -contains 'Hide stories' -and $alphaFeatures -notcontains 'Spoof signature' -and $alphaFeatures -notcontains 'Hide replies') `
        "Alpha's stable and dev bundles in Jman's registry were not read for their own Telegram patches: $($alphaFeatures -join ', ')"
    Assert-True ((@($gammaReached[0].evidence.sources) -join ',') -eq 'Jman''s bundle index' -and (@($gammaReached[0].evidence.features) -join ',') -eq 'Open links outside') `
        "Gamma's GitLab bundle in Jman's registry was not read for its Telegram patches: $($gammaReached[0].evidence | ConvertTo-Json -Compress -Depth 4)"
    Assert-True ([IO.File]::ReadAllText($fixtureLedgerPath) -ceq $fixtureLedgerText) 'The registry packages case changed the ledger.'
    $fakeForge.Answers = New-FakeAnswers

    # Any bundle of HushTelegram's own in the registry, latest or not, is a listing.
    $fakeForge.Answers.jmanBundles = @($fakeForge.Answers.jmanBundles) + , ([ordered]@{ id = ('5d' * 12); version = 'v0.0.1'; is_latest = $false
        packages = @('org.telegram.messenger.web'); source_id = 'self'; import_urls = $null
        download_url = 'https://github.com/SysAdminDoc/HushTelegram/releases/download/v0.0.1/patches-0.0.1.mpp' })
    Assert-Drift 'listing-changed' "*Jman's Patch Bundle Registry lists HushTelegram now*" 'A registry bundle of HushTelegram''s own'
    $fakeForge.Answers = New-FakeAnswers

    # Latest bundles past the one page the audit reads fail the source rather than leaving some
    # unread, and no patch list is read from a bundle list known to be short.
    $fakeForge.Answers.jmanBundlesUnread = 1
    Assert-Drift 'source-failed' "*Jman's bundle index could not be read*more than one page*" 'A second page of latest bundles'
    Assert-True (@($fakeForge.Requests | Where-Object { $_.Uri -like 'https://patch-bundles.api.jmancentral.com/bundles/*/patches?*' }).Count -eq 0) `
        'Patch lists were read from a short bundle list.'
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
$libraryText = [IO.File]::ReadAllText((Join-Path $PSScriptRoot 'telegram-sources.ps1'))
foreach ($pair in @(@('audit-telegram-sources.ps1', $auditText), @('telegram-sources.ps1', $libraryText))) {
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
    $found = @(Get-ImportProblems -Text ($auditText + "`n" + $bad.Line + "`n") -Name 'audit-telegram-sources.ps1 (copy)')
    Assert-True (@($found | Where-Object { $_ -like $bad.Pattern }).Count -gt 0) "The import check missed: $($bad.Line)"
}

Write-Host '[sources] the audit and its rules hold nothing that clones, downloads to disk or copies code'
Write-Host '[sources] source ledger contracts passed'
} finally {
    $env:GITLAB_TOKEN = $savedGitLabToken
    Remove-Item -LiteralPath $caseRoot -Recurse -Force -ErrorAction SilentlyContinue
}
