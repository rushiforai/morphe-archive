<#
.SYNOPSIS
    Exercise DexDiff.java against dex files that break one check each.

.DESCRIPTION
    BadDexFixture.java writes a clean host, a patched build of it that passes every check, and one
    patched build per check that breaks that check and nothing else: a branch into an instruction,
    a branch to itself, a switch case into an instruction, a switch pointed at the other kind of
    table, a branch or switch case onto a payload (a packed or sparse switch's, or
    fill-array-data's) or a move-result, flow that falls into a payload, starts at one or runs off
    the end of the code, an invoke with too few registers, a wide argument split across two
    registers, the static off-by-one, the upper half of a wide parameter read as an object, a
    narrow constant read as a long and the reverse (the Facebook sibling's AMOLED sweep bug on its
    580), either half of a live long overwritten and the other half still read, a broken pair or a
    narrow constant on one arm of a branch or on a loop's back edge, either half of a pair broken
    on one arm moved where the arms meet, a zero on one arm read as a long, a conflict (an object on one arm, an
    int on the other) read by each instruction and in each register that takes a value, or read
    through a copy, a wide move of a conflict, a long and a lone upper half tested against zero,
    an int and an object tested for equality in either order, a move-result the patch separated
    from its invoke, bad try ranges and handlers (a handler at a switch or array payload among
    them), and a move-exception the method's entry reaches. A register out of range fails as its
    own finding: named by a helper added to a host class, as the upper half of a long read from
    the last register, as a long an extension method writes there, and in a guard the patch put
    in a host method. Each of the five ShortcutManager calls the settings patch sends to the
    extension is left in the app's code by a build of its own, which has to fail that call's
    no-call rule and no other. The contract file may hold no no-call rule without such a build,
    and no rule of any other kind, since nothing here builds bad fixtures for one; a malformed
    line of every kind the grammar knows is refused.
    The good build carries the joins, copies and reads ART accepts, a zero tested against
    an object among them, so a check made stricter still has to pass them. Each bad build has to
    fail with findings of its own category only, so a check that fires for the wrong reason fails
    here too. Removed methods and DEX entries, the removal allowlist, and the device tally
    comparison are held to what they did before. DexDeltaFixture.java's builds hold the dex delta:
    what the patches changed beyond the contracts is named line by line, the allowlist's sections
    apply for the patches a run selects, and the bundle's extension classes are held to the bundle.
    verify-injected-registers.ps1 also runs end to end with stand-in tools, and its wiring is read
    through the parser (script-wiring.ps1), with the wiring checks themselves tried on copies that
    drop the calls but keep their text, at least one for each rule of what a script can't reach.
#>
[CmdletBinding()]
param(
    [string]$Root,
    [string]$Java,
    [string]$DesktopJar
)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')
. (Join-Path $PSScriptRoot 'injected-register-contracts.ps1')
. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'script-wiring.ps1')

function Assert-True {
    param([bool]$Condition, [string]$Message)
    if (-not $Condition) { throw $Message }
}

# Native calls run with Continue: Windows PowerShell 5.1, which the push hook uses when pwsh isn't
# on git's PATH, turns any line a program writes to stderr into a terminating error under Stop,
# and several cases here are meant to make a program fail. The exit code is what gets judged.
function Invoke-Checked {
    param([string]$Program, [string[]]$Arguments, [string]$Description)
    $ErrorActionPreference = 'Continue'
    $output = @(& $Program @Arguments 2>&1 | ForEach-Object { "$_" })
    if ($LASTEXITCODE -ne 0) {
        throw "$Description exited $LASTEXITCODE.`n$($output -join "`n")"
    }
}

function New-DexApk {
    param([string]$Name, [System.Collections.IDictionary]$Entries)
    $path = Join-Path $caseRoot "$Name.apk"
    $archive = [System.IO.Compression.ZipFile]::Open(
        $path, [System.IO.Compression.ZipArchiveMode]::Create)
    try {
        foreach ($entry in $Entries.GetEnumerator()) {
            [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
                $archive, $entry.Value, $entry.Key,
                [System.IO.Compression.CompressionLevel]::Optimal) | Out-Null
        }
    } finally {
        $archive.Dispose()
    }
    return $path
}

function Invoke-DexDiff {
    param([string]$Clean, [string]$Patched, [string]$Allowlist, [string]$Name, [string]$Contracts, [string]$Base, [string]$Selected,
        [string]$Bundle, [string]$DeltaAllowlist)
    $report = Join-Path $caseRoot "$Name-report.txt"
    $arguments = @('-Xmx1g', '-cp', $classPath, 'DexDiff', $Clean, $Patched, $report, $Allowlist)
    if ($Contracts) { $arguments += $Contracts }
    if ($Base) { $arguments += $Base } elseif ($Selected -or $Bundle) { $arguments += '-' }
    if ($Selected) { $arguments += $Selected } elseif ($Bundle) { $arguments += '-' }
    if ($Bundle) { $arguments += $Bundle, $DeltaAllowlist }
    $ErrorActionPreference = 'Continue'
    $global:LASTEXITCODE = 0
    $output = @(& $Java @arguments 2>&1 | ForEach-Object { "$_" })
    [pscustomobject]@{ ExitCode = $LASTEXITCODE; Output = $output; Report = $report }
}

# The category of every finding line, and every FAIL line at all, so a fixture that fails for a
# second reason is caught as well as one that fails for none.
function Get-Findings {
    param($Result)
    $fails = @($Result.Output | Where-Object { $_ -like '`[diff`] FAIL*' })
    $categories = @($fails | ForEach-Object {
        if ($_ -match '^\[diff\] FAIL: (register|branch|invoke|parameter|width|try|result|contract): ') { $Matches[1] } else { '?' }
    })
    [pscustomobject]@{ Fails = $fails; Categories = $categories }
}

$equal = Compare-VerifierTallies -Clean @{ lock = 2; class = 1 } -Patched @{ class = 1; lock = 2 }
Assert-True $equal.Valid 'Equal verifier message multisets were rejected.'
$extra = Compare-VerifierTallies -Clean @{ lock = 2 } -Patched @{ lock = 2; verify = 1 }
Assert-True (-not $extra.Valid -and $extra.Deltas.Count -eq 1 -and `
    $extra.Deltas[0].Kind -eq 'extra') 'An extra verifier message was accepted.'
$missing = Compare-VerifierTallies -Clean @{ lock = 2; verify = 1 } -Patched @{ lock = 2 }
Assert-True (-not $missing.Valid -and $missing.Deltas.Count -eq 1 -and `
    $missing.Deltas[0].Kind -eq 'missing') 'A missing verifier message was accepted.'
$reduced = Compare-VerifierTallies -Clean @{ lock = 3 } -Patched @{ lock = 1 }
Assert-True (-not $reduced.Valid -and $reduced.Deltas[0].Difference -eq 2 -and `
    $reduced.Deltas[0].Kind -eq 'missing') 'A reduced verifier message count was accepted.'
$caseChanged = Compare-VerifierTallies -Clean @{ VerifyError = 1 } -Patched @{ verifyerror = 1 }
Assert-True (-not $caseChanged.Valid -and $caseChanged.Deltas.Count -eq 2) `
    'A case-changed verifier message was treated as the same message.'
# The Facebook sibling's 580 raised no verifier message on the emulator, and a patched build that
# adds none is the pass. The device helper proves each run read its file, so the tallies don't have to.
$bothEmpty = Compare-VerifierTallies -Clean @{} -Patched @{}
Assert-True ($bothEmpty.Valid -and $bothEmpty.Deltas.Count -eq 0) 'Two empty verifier tallies were rejected.'
$newError = Compare-VerifierTallies -Clean @{} -Patched @{ 'Verification error in void fixture.Host.<clinit>()' = 1 }
Assert-True (-not $newError.Valid -and $newError.Deltas[0].Kind -eq 'extra') `
    'A verifier error the clean build does not raise was accepted.'

# The calls themselves, as the scripts run them (script-wiring.ps1). Help text, comments, log
# lines, functions nothing calls and dead branches can all name these files too.
$verifier = Join-Path $PSScriptRoot 'verify-injected-registers.ps1'
$allPatches = Join-Path $PSScriptRoot 'verify-all-patches.ps1'
$prePush = Join-Path $PSScriptRoot 'pre-push.ps1'
Assert-True ((Test-DotSourcesFile $verifier 'injected-register-contracts.ps1') -and (Test-TalliesBothSides $verifier)) `
    'The device verifier does not use the exact tally comparison contract.'
Assert-True (Test-RunsDexDiffWithContracts $verifier) 'The verifier does not hold the patched APK to the mutation contracts.'
Assert-True (Test-VerifiesWhatItPatched $allPatches) `
    'verify-all-patches.ps1 does not run the structural checks on the APK it patched.'
Assert-True (Test-PushGateRunsSuite $prePush 'scripts/test-injected-registers.ps1') `
    'The push gate does not run the injected-register fixture test.'
Assert-True ((Get-Content -LiteralPath $prePush -Raw) -notmatch 'so it has nothing to run there') `
    'The push gate still skips a suite it expects when the file is missing.'

# The checks themselves, on copies of those scripts with the wiring taken out in the ways that
# leave its text behind. Each copy has to fail the check it was made for, and an untouched copy
# has to pass it, so a check can't pass here by failing everything.
$wiringCopies = [System.IO.Path]::GetFullPath((Join-Path ([System.IO.Path]::GetTempPath()) `
    ("hushtumblr-wiring-" + [guid]::NewGuid().ToString('N'))))
try {
    New-Item -ItemType Directory -Path $wiringCopies | Out-Null
    $verifierText = [System.IO.File]::ReadAllText($verifier)
    $allPatchesText = [System.IO.File]::ReadAllText($allPatches)
    $prePushSource = [System.IO.File]::ReadAllText($prePush)
    $runsDexDiff = { param($Path) Test-RunsDexDiffWithContracts $Path }
    $dotSourcesContracts = { param($Path) Test-DotSourcesFile $Path 'injected-register-contracts.ps1' }
    $talliesBothSides = { param($Path) Test-TalliesBothSides $Path }
    $verifiesPatched = { param($Path) Test-VerifiesWhatItPatched $Path }
    $gateRunsSuite = { param($Path) Test-PushGateRunsSuite $Path 'scripts/test-injected-registers.ps1' }
    # The nodes the copies take the wiring out around: the & $Java DexDiff call in Invoke-DexDiff,
    # the call to Invoke-DexDiff, the contracts helper's dot-source, verify-all-patches' verifier
    # call, and the pre-push line that runs this suite.
    $dexDiffCall = { param($Node)
        $Node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
        $Node.Extent.Text -like '*DexDiff.java*' }
    $dexDiffRun = { param($Node)
        $Node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
        $Node.Extent.Text -eq '$diff = Invoke-DexDiff' }
    $contractsDotSource = { param($Node)
        $Node -is [System.Management.Automation.Language.CommandAst] -and
        $Node.InvocationOperator -eq [System.Management.Automation.Language.TokenKind]::Dot -and
        $Node.Extent.Text -like '*injected-register-contracts.ps1*' }
    $verifierCall = { param($Node)
        $Node -is [System.Management.Automation.Language.CommandAst] -and
        $Node.Extent.Text -like '*verify-injected-registers.ps1*' }
    $suiteLine = { param($Node)
        $Node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
        $Node.Left.Extent.Text -eq '$suites' -and
        $Node.Extent.Text -like "*'scripts/test-injected-registers.ps1'*" }
    $dexDiffFunction = { param($Node)
        $Node -is [System.Management.Automation.Language.FunctionDefinitionAst] -and $Node.Name -eq 'Invoke-DexDiff' }
    $contractsArgument = "(Join-Path `$PSScriptRoot 'injected-mutation-contracts.txt')"
    # The DexDiff call without the contracts, and the old call kept after it between -Open and
    # -Close: code that can't run for the copies expected to fail, code that can for the rest.
    $parkOldCall = { param([string]$Open, [string]$Close)
        # A local copy, so GetNewClosure takes it along with the two parameters.
        $contracts = $contractsArgument
        Edit-ScriptNode $verifierText $dexDiffCall { param($Text)
            $Text.Replace($contracts, '') + "`n    $Open`n    $Text`n    $Close" }.GetNewClosure() }
    $wiringCases = @(
        @{ Name = 'the untouched verifier'; Check = $runsDexDiff; Expect = $true; Text = $verifierText }
        @{ Name = 'the untouched verifier'; Check = $dotSourcesContracts; Expect = $true; Text = $verifierText }
        @{ Name = 'the untouched verifier'; Check = $talliesBothSides; Expect = $true; Text = $verifierText }
        @{ Name = 'the untouched verify-all-patches.ps1'; Check = $verifiesPatched; Expect = $true; Text = $allPatchesText }
        @{ Name = 'the untouched pre-push.ps1'; Check = $gateRunsSuite; Expect = $true; Text = $prePushSource }
        @{ Name = 'the contracts dropped from the DexDiff call and named in a log line'; Check = $runsDexDiff
            Text = (Edit-ScriptNode $verifierText { param($Node)
                $Node -is [System.Management.Automation.Language.ParenExpressionAst] -and
                $Node.Extent.Text -like '*injected-mutation-contracts.txt*' } { param($Text) '' }) +
                "`nWrite-Host '[registers] DexDiff.java runs without injected-mutation-contracts.txt now'`n" }
        # The bundle and the dex delta allowlist ride on the same call: dropped, swapped for the
        # unheld path, or swapped for another allowlist, the call holds nothing to them.
        @{ Name = 'the bundle and the dex delta allowlist dropped from the DexDiff call'; Check = $runsDexDiff
            Text = Edit-ScriptNode $verifierText $dexDiffCall { param($Text)
                $Text.Replace("`$bundlePath (Join-Path `$PSScriptRoot 'dex-delta-allowlist.txt') ", '') } }
        @{ Name = 'the unheld bundle path handed to DexDiff'; Check = $runsDexDiff
            Text = Edit-ScriptNode $verifierText $dexDiffCall { param($Text) $Text.Replace('$bundlePath', '$Bundle') } }
        @{ Name = 'the resource allowlist handed to DexDiff for the dex delta one'; Check = $runsDexDiff
            Text = Edit-ScriptNode $verifierText $dexDiffCall { param($Text)
                $Text.Replace("'dex-delta-allowlist.txt'", "'resource-delta-allowlist.txt'") } }
        @{ Name = 'the DexDiff function left uncalled'; Check = $runsDexDiff
            Text = Edit-ScriptNode $verifierText { param($Node)
                $Node -is [System.Management.Automation.Language.CommandAst] -and $Node.GetCommandName() -eq 'Invoke-DexDiff'
            } { param($Text) '[pscustomobject]@{ ExitCode = 0; Output = @() }' } }
        @{ Name = 'the DexDiff call behind a return'; Check = $runsDexDiff
            Text = Edit-ScriptNode $verifierText $dexDiffCall { param($Text) "return`n    $Text" } }
        @{ Name = 'the contracts helper dot-sourced in a dead branch'; Check = $dotSourcesContracts
            Text = Edit-ScriptNode $verifierText $contractsDotSource { param($Text) "if (`$false) { $Text }" } }
        @{ Name = 'the patched tally compared with itself'; Check = $talliesBothSides
            Text = Edit-ScriptNode $verifierText { param($Node)
                $Node -is [System.Management.Automation.Language.CommandAst] -and
                $Node.GetCommandName() -eq 'Compare-VerifierTallies'
            } { param($Text) 'Compare-VerifierTallies -Clean $patchedTally -Patched $patchedTally' } }
        @{ Name = 'a second clean-base extraction before static checks'; Check = $talliesBothSides
            Text = Edit-ScriptNode $verifierText { param($Node)
                $Node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
                $Node.Left.Extent.Text -eq '$cleanBase'
            } { param($Text) "$Text`nif (`$signedBundle) { $Text }" } }
        @{ Name = 'the clean APK replaced with the patched APK after static checks'; Check = $talliesBothSides
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text)
                "$Text`n`$cleanBase = `$PatchedApk" } }
        @{ Name = 'the patched APK replaced with the clean APK after static checks'; Check = $talliesBothSides
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text)
                "$Text`n`$PatchedApk = `$cleanBase" } }
        @{ Name = 'the verifier call replaced by a log line naming it'; Check = $verifiesPatched
            Text = Edit-ScriptNode $allPatchesText $verifierCall { param($Text)
                "Write-Host '[verify] skipped verify-injected-registers.ps1 -PatchedApk `$out'" } }
        @{ Name = 'the verifier run on the stock APK'; Check = $verifiesPatched
            Text = Edit-ScriptNode $allPatchesText $verifierCall { param($Text)
                $Text.Replace('-PatchedApk $out', '-PatchedApk $stockApk') } }
        @{ Name = 'the suite line in a block comment'; Check = $gateRunsSuite
            Text = Edit-ScriptNode $prePushSource $suiteLine { param($Text) "<#`n$Text`n#>" } }
        # One copy for each rule of what a script can't reach, each taking the wiring out by that
        # rule alone, so none of them can be dropped without a copy here passing its check.
        @{ Name = 'the contracts helper dot-sourced in a while ($false) body'; Check = $dotSourcesContracts
            Text = Edit-ScriptNode $verifierText $contractsDotSource { param($Text) "while (`$false) { $Text }" } }
        @{ Name = 'the contracts helper dot-sourced in the else of if ($true)'; Check = $dotSourcesContracts
            Text = Edit-ScriptNode $verifierText $contractsDotSource { param($Text) "if (`$true) { } else { $Text }" } }
        @{ Name = 'the contracts helper dot-sourced behind if (-not $true)'; Check = $dotSourcesContracts
            Text = Edit-ScriptNode $verifierText $contractsDotSource { param($Text) "if (-not `$true) { $Text }" } }
        @{ Name = 'the contracts helper dot-sourced behind if (0)'; Check = $dotSourcesContracts
            Text = Edit-ScriptNode $verifierText $contractsDotSource { param($Text) "if (0) { $Text }" } }
        @{ Name = 'the contracts helper dot-sourced inside a function the script calls'; Check = $dotSourcesContracts
            Text = Edit-ScriptNode $verifierText $contractsDotSource { param($Text)
                "function Import-Contracts { $Text }`nImport-Contracts" } }
        # A script block run with & has a scope of its own too, even around a . { } block, while
        # . { } and ForEach-Object run in the script's.
        @{ Name = 'the contracts helper dot-sourced inside & { }'; Check = $dotSourcesContracts
            Text = Edit-ScriptNode $verifierText $contractsDotSource { param($Text) "& { $Text }" } }
        @{ Name = 'the contracts helper dot-sourced inside . { } inside & { }'; Check = $dotSourcesContracts
            Text = Edit-ScriptNode $verifierText $contractsDotSource { param($Text) "& { . { $Text } }" } }
        @{ Name = 'the contracts helper dot-sourced inside & { } inside . { }'; Check = $dotSourcesContracts
            Text = Edit-ScriptNode $verifierText $contractsDotSource { param($Text) ". { & { $Text } }" } }
        @{ Name = 'the contracts helper dot-sourced behind if ($false) inside . { }'; Check = $dotSourcesContracts
            Text = Edit-ScriptNode $verifierText $contractsDotSource { param($Text) ". { if (`$false) { $Text } }" } }
        @{ Name = 'the contracts helper dot-sourced inside . { }'; Check = $dotSourcesContracts; Expect = $true
            Text = Edit-ScriptNode $verifierText $contractsDotSource { param($Text) ". { $Text }" } }
        @{ Name = 'the contracts helper dot-sourced inside ForEach-Object { }'; Check = $dotSourcesContracts; Expect = $true
            Text = Edit-ScriptNode $verifierText $contractsDotSource { param($Text) "1 | ForEach-Object { $Text }" } }
        @{ Name = 'the DexDiff call behind exit'; Check = $runsDexDiff
            Text = Edit-ScriptNode $verifierText $dexDiffCall { param($Text) "exit 0`n    $Text" } }
        @{ Name = 'the DexDiff call behind throw'; Check = $runsDexDiff
            Text = Edit-ScriptNode $verifierText $dexDiffCall { param($Text) "throw 'stopped'`n    $Text" } }
        @{ Name = 'the DexDiff call behind break'; Check = $runsDexDiff
            Text = Edit-ScriptNode $verifierText $dexDiffCall { param($Text) "break`n    $Text" } }
        @{ Name = 'the DexDiff call behind continue'; Check = $runsDexDiff
            Text = Edit-ScriptNode $verifierText $dexDiffCall { param($Text) "continue`n    $Text" } }
        @{ Name = 'the DexDiff function called only in a dead branch'; Check = $runsDexDiff
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text)
                "if (`$false) { $Text }`n`$diff = [pscustomobject]@{ ExitCode = 0; Output = @() }" } }
        @{ Name = 'the patched APK moved off its place in the DexDiff call'; Check = $runsDexDiff
            Text = Edit-ScriptNode $verifierText $dexDiffCall { param($Text)
                $Text.Replace('$CleanMerged $PatchedApk', '$PatchedApk $CleanMerged') } }
        @{ Name = 'the verifier run on the stock APK, which follows -o only in a dead branch'; Check = $verifiesPatched
            Text = Edit-ScriptNode (Edit-ScriptNode $allPatchesText $verifierCall { param($Text)
                $Text.Replace('-PatchedApk $out', '-PatchedApk $stockApk') }) { param($Node)
                $Node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
                $Node.Extent.Text -like "`$arguments = @('patch'*" } { param($Text)
                "$Text`nif (`$false) { `$arguments = @('-o', `$stockApk) }" } }
        @{ Name = 'the suite line behind if ($false)'; Check = $gateRunsSuite
            Text = Edit-ScriptNode $prePushSource $suiteLine { param($Text) "if (`$false) { $Text }" } }
        @{ Name = 'the suite line in an elseif after if ($true)'; Check = $gateRunsSuite
            Text = Edit-ScriptNode $prePushSource { param($Node)
                $Node -is [System.Management.Automation.Language.IfStatementAst] -and
                $Node.Clauses[0].Item1.Extent.Text -eq '$touchesInjectedRegisterVerifier' } { param($Text)
                "if (`$true) { } else$Text" } }
        # Code that never runs though no constant or return right before it says so: a script block
        # nothing runs, an exit in a function that never returns or in an if or a loop that always
        # reaches it, and a condition that compares two constants. The copies expected to pass keep
        # those rules off code that does run: a block run by & or by ForEach-Object, a function
        # that can return, and a loop a break leaves.
        @{ Name = 'the DexDiff call without the contracts, and the old one kept in a script block nothing runs'
            Check = $runsDexDiff
            Text = Edit-ScriptNode $verifierText $dexDiffCall { param($Text)
                $Text.Replace("(Join-Path `$PSScriptRoot 'injected-mutation-contracts.txt')", '') +
                "`n    `$previous = { $Text }" } }
        @{ Name = 'the DexDiff function run through & { }'; Check = $runsDexDiff; Expect = $true
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text) '$diff = & { Invoke-DexDiff }' } }
        @{ Name = 'the DexDiff function run through ForEach-Object'; Check = $runsDexDiff; Expect = $true
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text) '$diff = @(1) | ForEach-Object { Invoke-DexDiff }' } }
        @{ Name = 'the DexDiff call after a function that ends in one that exits'; Check = $runsDexDiff
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text)
                "function Stop-Early { Stop-Now }`nfunction Stop-Now { exit 0 }`n`$stopped = Stop-Early`n$Text" } }
        @{ Name = 'the DexDiff call after a function that can return before its exit'; Check = $runsDexDiff; Expect = $true
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text)
                "function Stop-Early { if (`$Serial) { return }`n    exit 0 }`nStop-Early`n$Text" } }
        @{ Name = 'the DexDiff call after an exit behind if ($true)'; Check = $runsDexDiff
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text) "if (`$true) { exit 0 }`n$Text" } }
        @{ Name = 'the DexDiff call after an exit on every arm that can run'; Check = $runsDexDiff
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text)
                "if (`$false) { } elseif (`$Serial) { exit 1 } else { exit 0 }`n$Text" } }
        @{ Name = 'the DexDiff call after while ($true) { exit 0 }'; Check = $runsDexDiff
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text) "while (`$true) { exit 0 }`n$Text" } }
        @{ Name = 'the DexDiff call after a while ($true) a break leaves'; Check = $runsDexDiff; Expect = $true
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text) "while (`$true) { break }`n$Text" } }
        @{ Name = 'the contracts helper dot-sourced behind if (1 -gt 2)'; Check = $dotSourcesContracts
            Text = Edit-ScriptNode $verifierText $contractsDotSource { param($Text) "if (1 -gt 2) { $Text }" } }
        @{ Name = 'the suite line behind if (0 -eq 1)'; Check = $gateRunsSuite
            Text = Edit-ScriptNode $prePushSource $suiteLine { param($Text) "if (0 -eq 1) { $Text }" } }
        # The old call kept where a constant settles that it can't run: an -and or -or one side
        # settles, the right of an -and or -or the left side settles, a switch clause that can't
        # match or a default a clause always takes, a foreach over nothing, a catch of a try that
        # can't throw, and a function defined a second time, whose first body never runs.
        @{ Name = 'the old DexDiff call kept behind if ($false -and $Serial)'; Check = $runsDexDiff
            Text = & $parkOldCall 'if ($false -and $Serial) {' '}' }
        @{ Name = 'the old DexDiff call kept behind if ($Serial -and $false)'; Check = $runsDexDiff
            Text = & $parkOldCall 'if ($Serial -and $false) {' '}' }
        @{ Name = 'the old DexDiff call kept behind if (-not ($Serial -or $true))'; Check = $runsDexDiff
            Text = & $parkOldCall 'if (-not ($Serial -or $true)) {' '}' }
        @{ Name = 'the old DexDiff call kept behind if ($true -xor $true)'; Check = $runsDexDiff
            Text = & $parkOldCall 'if ($true -xor $true) {' '}' }
        @{ Name = 'the old DexDiff call kept behind if (-not ($true -and $true))'; Check = $runsDexDiff
            Text = & $parkOldCall 'if (-not ($true -and $true)) {' '}' }
        @{ Name = 'the old DexDiff call kept behind if ($false -or $false)'; Check = $runsDexDiff
            Text = & $parkOldCall 'if ($false -or $false) {' '}' }
        @{ Name = 'the old DexDiff call kept on the right of $false -and'; Check = $runsDexDiff
            Text = & $parkOldCall '$null = $false -and $(' ')' }
        @{ Name = 'the old DexDiff call kept on the right of $true -or'; Check = $runsDexDiff
            Text = & $parkOldCall '$null = $true -or $(' ')' }
        @{ Name = "the old DexDiff call kept in switch ('current') { 'previous' { } }"; Check = $runsDexDiff
            Text = & $parkOldCall "switch ('current') { 'previous' {" '} }' }
        @{ Name = 'the old DexDiff call kept in the default of switch (1) { 1 { } }'; Check = $runsDexDiff
            Text = & $parkOldCall 'switch (1) { 1 { } default {' '} }' }
        @{ Name = 'the old DexDiff call kept in the default of a switch over @()'; Check = $runsDexDiff
            Text = & $parkOldCall 'switch (@()) { default {' '} }' }
        @{ Name = 'the old DexDiff call kept in a foreach over @()'; Check = $runsDexDiff
            Text = & $parkOldCall 'foreach ($unused in @()) {' '}' }
        @{ Name = 'the old DexDiff call kept in a foreach over $null'; Check = $runsDexDiff
            Text = & $parkOldCall 'foreach ($unused in $null) {' '}' }
        @{ Name = 'the old DexDiff call kept in the catch of an empty try'; Check = $runsDexDiff
            Text = & $parkOldCall 'try { } catch {' '}' }
        @{ Name = 'the old DexDiff call kept in the catch of try { return }'; Check = $runsDexDiff
            Text = & $parkOldCall 'try { return } catch {' '}' }
        @{ Name = 'Invoke-DexDiff defined again below it, without the contracts'; Check = $runsDexDiff
            Text = Edit-ScriptNode $verifierText $dexDiffFunction { param($Text) "$Text`n`n" + $Text.Replace($contractsArgument, '') } }
        @{ Name = 'Invoke-DexDiff defined again below it as script:Invoke-DexDiff, without the contracts'; Check = $runsDexDiff
            Text = Edit-ScriptNode $verifierText $dexDiffFunction { param($Text)
                "$Text`n`n" + $Text.Replace($contractsArgument, '').Replace('function Invoke-DexDiff', 'function script:Invoke-DexDiff') } }
        @{ Name = 'Invoke-DexDiff set again through ${function:}, without the contracts'; Check = $runsDexDiff
            Text = Edit-ScriptNode $verifierText $dexDiffFunction { param($Text)
                "$Text`n`n" + $Text.Replace($contractsArgument, '').Replace('function Invoke-DexDiff {', '${function:Invoke-DexDiff} = {') } }
        @{ Name = 'the DexDiff call after a call to function script:Stop-Now { exit 0 }'; Check = $runsDexDiff
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text) "function script:Stop-Now { exit 0 }`nStop-Now`n$Text" } }
        # And where it still runs, so none of those rules reaches code that does.
        @{ Name = 'the old DexDiff call kept behind if ($true -and $Serial)'; Check = $runsDexDiff; Expect = $true
            Text = & $parkOldCall 'if ($true -and $Serial) {' '}' }
        @{ Name = 'the old DexDiff call kept behind if ($false -or $Serial)'; Check = $runsDexDiff; Expect = $true
            Text = & $parkOldCall 'if ($false -or $Serial) {' '}' }
        @{ Name = 'the old DexDiff call kept on the right of $Serial -and'; Check = $runsDexDiff; Expect = $true
            Text = & $parkOldCall '$null = $Serial -and $(' ')' }
        @{ Name = "the old DexDiff call kept in switch ('current') { 'current' { } }"; Check = $runsDexDiff; Expect = $true
            Text = & $parkOldCall "switch ('current') { 'current' {" '} }' }
        @{ Name = 'the old DexDiff call kept in the default of switch (1) { 2 { } }'; Check = $runsDexDiff; Expect = $true
            Text = & $parkOldCall 'switch (1) { 2 { } default {' '} }' }
        @{ Name = "the old DexDiff call kept in switch (`$Serial) { 'previous' { } }"; Check = $runsDexDiff; Expect = $true
            Text = & $parkOldCall "switch (`$Serial) { 'previous' {" '} }' }
        @{ Name = 'the old DexDiff call kept in a foreach over @(1)'; Check = $runsDexDiff; Expect = $true
            Text = & $parkOldCall 'foreach ($once in @(1)) {' '}' }
        @{ Name = 'the old DexDiff call kept in the catch of a try that can throw'; Check = $runsDexDiff; Expect = $true
            Text = & $parkOldCall 'try { Get-Item -LiteralPath $PatchedApk | Out-Null } catch {' '}' }
        @{ Name = 'Invoke-DexDiff defined once, as script:Invoke-DexDiff'; Check = $runsDexDiff; Expect = $true
            Text = Edit-ScriptNode $verifierText $dexDiffFunction { param($Text)
                $Text.Replace('function Invoke-DexDiff', 'function script:Invoke-DexDiff') } }
        # The rules the copies above leave untried: every comparison the parser folds, $null as a
        # constant, an ending call past the first element of a pipeline, a for with no condition
        # at all, and the other ways ForEach-Object and Where-Object get written. The copies
        # expected to pass keep a loop and an if to ending only when they certainly do.
        foreach ($condition in '1 -ne 1', '0 -ge 1', '2 -lt 1', '1 -le 0', "'a' -ceq 'A'", "'a' -cne 'a'",
                "'a' -cgt 'b'", "'a' -cge 'b'", "'b' -clt 'a'", "'b' -cle 'a'", '$null') {
            @{ Name = "the contracts helper dot-sourced behind if ($condition)"; Check = $dotSourcesContracts
                Text = Edit-ScriptNode $verifierText $contractsDotSource { param($Text) "if ($condition) { $Text }" } }
        }
        @{ Name = 'the DexDiff call after $null | Stop-Now, a function that exits'; Check = $runsDexDiff
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text) "function Stop-Now { exit 0 }`n`$null | Stop-Now`n$Text" } }
        @{ Name = 'the DexDiff call after for (;;) { exit 0 }'; Check = $runsDexDiff
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text) "for (;;) { exit 0 }`n$Text" } }
        # ForEach-Object and Where-Object run only the blocks they're given to run, and only for
        # an item: a block handed to -ArgumentList is a value, and @() gives them nothing.
        @{ Name = 'the old DexDiff call kept in a block handed to ForEach-Object -ArgumentList'; Check = $runsDexDiff
            Text = & $parkOldCall '$null = @(1) | ForEach-Object -ArgumentList {' '} -Process { }' }
        @{ Name = 'the old DexDiff call kept in ForEach-Object over @()'; Check = $runsDexDiff
            Text = & $parkOldCall '$null = @() | ForEach-Object {' '}' }
        @{ Name = 'the old DexDiff call kept in Where-Object over @()'; Check = $runsDexDiff
            Text = & $parkOldCall '$null = @() | Where-Object {' '}' }
        @{ Name = 'the DexDiff function run through ForEach-Object -Process { }'; Check = $runsDexDiff; Expect = $true
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text) '$diff = @(1) | ForEach-Object -Process { Invoke-DexDiff }' } }
        @{ Name = 'the DexDiff function run through ForEach-Object -Begin { }'; Check = $runsDexDiff; Expect = $true
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text) '$diff = @(1) | ForEach-Object -Begin { Invoke-DexDiff } -Process { }' } }
        @{ Name = 'the DexDiff function run through ForEach-Object -End { }'; Check = $runsDexDiff; Expect = $true
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text) '$diff = @(1) | ForEach-Object -Process { } -End { Invoke-DexDiff }' } }
        @{ Name = 'the DexDiff function run through Where-Object -FilterScript { }'; Check = $runsDexDiff; Expect = $true
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text) '$diff = @(1) | Where-Object -FilterScript { Invoke-DexDiff }' } }
        @{ Name = 'the DexDiff function run through ForEach-Object over $null, which is one item'; Check = $runsDexDiff; Expect = $true
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text) '$diff = $null | ForEach-Object { Invoke-DexDiff }' } }
        @{ Name = 'the DexDiff function run through ForEach-Object -Process:{ }'; Check = $runsDexDiff; Expect = $true
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text) '$diff = @(1) | ForEach-Object -Process:{ Invoke-DexDiff }' } }
        @{ Name = 'the DexDiff function run through Where-Object'; Check = $runsDexDiff; Expect = $true
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text) '$diff = @(1) | Where-Object { Invoke-DexDiff }' } }
        @{ Name = 'the DexDiff function run through %'; Check = $runsDexDiff; Expect = $true
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text) '$diff = @(1) | % { Invoke-DexDiff }' } }
        @{ Name = 'the DexDiff call after while ($Serial) { exit 0 }'; Check = $runsDexDiff; Expect = $true
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text) "while (`$Serial) { exit 0 }`n$Text" } }
        @{ Name = "the DexDiff call after if (`$Serial) { 'x' } else { exit 0 }"; Check = $runsDexDiff; Expect = $true
            Text = Edit-ScriptNode $verifierText $dexDiffRun { param($Text) "if (`$Serial) { 'x' } else { exit 0 }`n$Text" } }
    )
    $wiringFailures = @()
    $copy = Join-Path $wiringCopies 'copy.ps1'
    foreach ($case in $wiringCases) {
        [System.IO.File]::WriteAllText($copy, $case.Text)
        $expect = $case.ContainsKey('Expect') -and $case.Expect
        if ((& $case.Check $copy) -ne $expect) {
            $wiringFailures += "$($case.Name): the check said $(-not $expect)"
        }
    }
    if ($wiringFailures.Count -ne 0) { throw ("The wiring checks misjudged:`n" + ($wiringFailures -join "`n")) }
} finally {
    Remove-Item -LiteralPath $wiringCopies -Recurse -Force -ErrorAction SilentlyContinue
}

# The verifier run end to end, with stand-ins for the tools it starts: a java that answers the
# version probe and plays DexDiff with the given exit code, an aapt2 that describes Tumblr
# 46.5.0.109, and an apksigner that reports a Tumblr signer from patches-list.json. With
# -JavaGone the apksigner also deletes that java, which leaves it unable to start by the time
# DexDiff runs, as a JDK replaced mid-run would. A Continue preference around the DexDiff call
# once turned exactly that into '[registers] success.'.
$standIns = [System.IO.Path]::GetFullPath((Join-Path ([System.IO.Path]::GetTempPath()) `
    ("hushtumblr-verifier-standins-" + [guid]::NewGuid().ToString('N'))))
$standInPackage = 'com.tumblr'
$metaSigner = @((Get-Content -LiteralPath (Join-Path (Split-Path -Parent $PSScriptRoot) 'patches-list.json') -Raw |
    ConvertFrom-Json).patches | ForEach-Object { $_.compatibility } |
    Where-Object { $_.packageName -eq $standInPackage } | ForEach-Object { $_.signatures } |
    Sort-Object -Unique | Select-Object -First 1)
Assert-True ($metaSigner.Count -eq 1) "patches-list.json declares no $standInPackage signer for the stand-in apksigner."

function Write-StandIn {
    param([string]$Path, [string]$Text)
    [System.IO.File]::WriteAllText($Path, (($Text -replace "`r`n", "`n") -replace "`n", "`r`n"),
        [System.Text.Encoding]::ASCII)
}

# Every APK the verifier reads is checked with apksigner, and a marker in the file says how this one
# is signed: stand-in-unsigned doesn't verify, stand-in-foreign is signed by another certificate
# alone, stand-in-second-signer by another one beside Tumblr's, and stand-in-stamp carries a Source
# Stamp beside Tumblr's, which doesn't count. Without a marker the answer is Tumblr's signer.
$foreignSigner = '0123456789abcdef' * 4

# -CleanMarker marks the clean APK. -Bundle makes the clean side clean.apkm, a base.apk and a
# config.arm64_v8a split, with -SplitMarker on the split; the java plays the merger by copying the
# base and printing the digest of what it wrote, as MergeSplits.java does, and logs each tool it was
# started for in java.log. -Merged hands the verifier a merge of its own with -CleanMerged: the
# bytes the clean side merges to here (Handed), which for a plain APK are its own and for the bundle
# its base.apk, other bytes with no record beside them (OtherBytes), or other bytes with a record
# beside them that says everything a true one would (Forged).
function Invoke-VerifierWithStandIns {
    param([string]$Name, [int]$DexDiffExit, [switch]$JavaGone, [string]$CleanMarker, [switch]$Bundle,
        [string]$SplitMarker, [string]$Merged = 'None', [switch]$NoPatchBundle)
    $case = Join-Path $standIns $Name
    New-Item -ItemType Directory -Path $case -Force | Out-Null
    # The patch bundle the verifier hands DexDiff, held for the run. -NoPatchBundle leaves it out.
    $patchBundle = Join-Path $case 'patches.mpp'
    if (-not $NoPatchBundle) { [System.IO.File]::WriteAllText($patchBundle, 'stand-in') }
    $javaStandIn = Join-Path $case 'java.cmd'
    Write-StandIn $javaStandIn @"
@echo off
if "%~1"=="-version" (
  echo openjdk version "21.0.0"
  exit /b 0
)
>>"%~dp0java.log" echo %~nx4
if /i "%~nx4"=="MergeSplits.java" goto merge
echo [diff] structural findings: 0
exit /b $DexDiffExit
:merge
copy /y "%~5\base.apk" "%~6" >nul || exit /b 7
set "DIGEST="
for /f "skip=1 delims=" %%H in ('certutil -hashfile "%~6" SHA256') do if not defined DIGEST set "DIGEST=%%H"
echo [merge] sha256 %DIGEST%
exit /b 0
"@
    # The last argument is the APK. One that holds a manifest of its own (a split) is printed as it
    # is; any other gets Tumblr 46.5.0.109's.
    Write-StandIn (Join-Path $case 'aapt2.cmd') @"
@echo off
setlocal EnableExtensions DisableDelayedExpansion
set "APK="
:next
if "%~1"=="" goto run
set "APK=%~1"
shift
goto next
:run
findstr /l /c:"E: manifest" "%APK%" >nul 2>&1 && (type "%APK%"& exit /b 0)
echo   E: manifest (line=2)
echo     A: http://schemas.android.com/apk/res/android:versionCode(0x0101021b)=1460500109
echo     A: http://schemas.android.com/apk/res/android:versionName(0x0101021c)="46.5.0.109" (Raw: "46.5.0.109")
echo     A: package="$standInPackage" (Raw: "$standInPackage")
exit /b 0
"@
    $delete = if ($JavaGone) { "del /f /q `"$javaStandIn`" 2>nul" } else { 'rem' }
    Write-StandIn (Join-Path $case 'apksigner.bat') @"
@echo off
setlocal EnableExtensions DisableDelayedExpansion
$delete
set "APK="
:next
if "%~1"=="" goto verify
set "APK=%~1"
shift
goto next
:verify
findstr /l /c:"stand-in-unsigned" "%APK%" >nul 2>&1 && (echo DOES NOT VERIFY& echo ERROR: Missing META-INF/MANIFEST.MF& exit /b 1)
findstr /l /c:"stand-in-foreign" "%APK%" >nul 2>&1 && (echo Signer #1 certificate SHA-256 digest: $foreignSigner& exit /b 0)
echo Signer #1 certificate SHA-256 digest: $($metaSigner[0])
findstr /l /c:"stand-in-second-signer" "%APK%" >nul 2>&1 && echo Signer #2 certificate SHA-256 digest: $foreignSigner
findstr /l /c:"stand-in-stamp" "%APK%" >nul 2>&1 && echo Source Stamp Signer certificate SHA-256 digest: $foreignSigner
exit /b 0
"@
    foreach ($file in 'patched.apk', 'desktop.jar', 'android.jar', 'api-versions.xml') {
        [System.IO.File]::WriteAllText((Join-Path $case $file), 'stand-in')
    }
    $cleanText = if ($CleanMarker) { "stand-in`nN: $CleanMarker`n" } else { 'stand-in' }
    [System.IO.File]::WriteAllText((Join-Path $case 'clean.apk'), $cleanText)
    $cleanApk = Join-Path $case 'clean.apk'
    if ($Bundle) {
        Add-Type -AssemblyName System.IO.Compression
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        $cleanApk = Join-Path $case 'clean.apkm'
        $splitLines = @('N: android=http://schemas.android.com/apk/res/android (line=1)', '  E: manifest (line=1)',
            '    A: http://schemas.android.com/apk/res/android:versionCode(0x0101021b)=1460500109',
            "    A: package=`"$standInPackage`" (Raw: `"$standInPackage`")",
            '    A: split="config.arm64_v8a" (Raw: "config.arm64_v8a")', '      E: application (line=4)')
        if ($SplitMarker) { $splitLines = @("N: $SplitMarker") + $splitLines }
        $entries = [ordered]@{ 'base.apk' = $cleanText; 'config.arm64_v8a.apk' = (($splitLines -join "`n") + "`n") }
        $archive = [System.IO.Compression.ZipFile]::Open($cleanApk, [System.IO.Compression.ZipArchiveMode]::Create)
        try {
            foreach ($entryName in $entries.Keys) {
                $writer = New-Object System.IO.StreamWriter($archive.CreateEntry($entryName).Open())
                try { $writer.Write($entries[$entryName]) } finally { $writer.Dispose() }
            }
        } finally { $archive.Dispose() }
    }
    # An array, not a hashtable: splatted to a native command, a hashtable becomes -Name:value.
    $mergedArgument = @()
    if ($Merged -ne 'None') {
        $mergedApk = Join-Path $case 'merged.apk'
        [System.IO.File]::WriteAllText($mergedApk, $(if ($Merged -eq 'Handed') { $cleanText } else { 'stand-in merge' }))
        if ($Merged -eq 'Forged') {
            # What Get-MergedApk writes beside a merge, with this file's own digest and the true base's.
            $mergedSha = (Get-FileHash -LiteralPath $mergedApk -Algorithm SHA256).Hash.ToLowerInvariant()
            $baseSha = (Get-FileHash -LiteralPath (Join-Path $case 'clean.apk') -Algorithm SHA256).Hash.ToLowerInvariant()
            [System.IO.File]::WriteAllText("$mergedApk.authentic.json", ([ordered]@{ input = $cleanApk
                package = $standInPackage; versionCode = '1460500109'; signers = @($metaSigner[0]); signedForm = $null
                baseSha256 = $baseSha; mergedSha256 = $mergedSha; apks = @() } | ConvertTo-Json -Depth 5))
        }
        $mergedArgument = @('-CleanMerged', $mergedApk)
    }
    $ErrorActionPreference = 'Continue'
    $global:LASTEXITCODE = 0
    $output = @(& (Get-Process -Id $PID).Path -NoProfile -NonInteractive -ExecutionPolicy Bypass -File $verifier `
        -CleanApk $cleanApk -PatchedApk (Join-Path $case 'patched.apk') `
        -ReportPath (Join-Path $case 'report.txt') -Java $javaStandIn -DesktopJar (Join-Path $case 'desktop.jar') `
        -Aapt2 (Join-Path $case 'aapt2.cmd') -AndroidJar (Join-Path $case 'android.jar') `
        -ApiVersions (Join-Path $case 'api-versions.xml') -Bundle $patchBundle @mergedArgument 2>&1 | ForEach-Object { "$_" })
    $javaRuns = @(if (Test-Path -LiteralPath (Join-Path $case 'java.log')) { Get-Content -LiteralPath (Join-Path $case 'java.log') })
    [pscustomobject]@{ ExitCode = $LASTEXITCODE; Output = $output; Text = $output -join "`n"; JavaRuns = $javaRuns }
}

# The verifier's two 8 GB checks each wait for a slot in the machine's build queue. Here a stand-in
# queue takes the real one's place: it lets each job straight through and writes down what took a
# slot and what gave one back, a java that never started included.
$savedQueueScript = $env:BUILD_QUEUE_SCRIPT
$savedQueuePriority = $env:BUILD_QUEUE_PRIORITY
try {
    New-Item -ItemType Directory -Path $standIns | Out-Null
    $queueLog = Join-Path $standIns 'queue.log'
    $quotedLog = "'" + $queueLog.Replace("'", "''") + "'"
    $fakeQueue = Join-Path $standIns 'build-queue.ps1'
    Set-Content -LiteralPath $fakeQueue -Encoding ASCII -Value @(
        'param([switch]$Status, [string]$Label, [string]$Priority, [string]$Run)',
        'function Enter-BuildQueue {',
        '    param([string]$Label = ''build'', [string]$Priority)',
        "    Add-Content -LiteralPath $quotedLog -Value ""enter `$Label""",
        '    return [pscustomobject]@{ slot = 0; label = $Label }',
        '}',
        'function Exit-BuildQueue { param($Ticket) ' + "Add-Content -LiteralPath $quotedLog -Value ""exit `$(`$Ticket.label)"" }",
        'function Get-BuildQueueMask { param([int]$Slot) [System.Diagnostics.Process]::GetCurrentProcess().ProcessorAffinity }')
    $env:BUILD_QUEUE_SCRIPT = $fakeQueue
    $env:BUILD_QUEUE_PRIORITY = $null
    # Each run has to reach the DexDiff call, or a stand-in that broke early would pass the checks below.
    $reached = '(?m)^\[registers\] patched '
    $passed = Invoke-VerifierWithStandIns -Name 'passed' -DexDiffExit 0
    Assert-True ($passed.ExitCode -eq 0 -and $passed.Text -match $reached -and
        $passed.Output -contains '[registers] success.') `
        "The verifier did not pass a comparison DexDiff passed.`n$($passed.Text)"
    $queued = @(Get-Content -LiteralPath $queueLog) -join '|'
    Assert-True ($queued -ceq ('enter hushtumblr dex diff|exit hushtumblr dex diff|' +
        'enter hushtumblr host references|exit hushtumblr host references')) `
        "The verifier did not run each check in a build queue slot of its own: $queued"
    Remove-Item -LiteralPath $queueLog -Force
    $refused = Invoke-VerifierWithStandIns -Name 'refused' -DexDiffExit 1
    Assert-True ($refused.ExitCode -eq 1 -and $refused.Text -match $reached -and
        $refused.Text -match 'FAIL: the dex comparison exited 1' -and
        $refused.Output -notcontains '[registers] success.') `
        "The verifier did not fail a comparison DexDiff failed.`n$($refused.Text)"
    Remove-Item -LiteralPath $queueLog -Force -ErrorAction SilentlyContinue
    $gone = Invoke-VerifierWithStandIns -Name 'java-gone' -DexDiffExit 0 -JavaGone
    Assert-True ($gone.ExitCode -ne 0 -and $gone.Text -match $reached -and
        $gone.Output -notcontains '[registers] success.' -and $gone.Text -notmatch '\[registers\] static: ') `
        "The verifier passed a run whose java could not start for DexDiff (exit $($gone.ExitCode)).`n$($gone.Text)"
    $queued = @(Get-Content -LiteralPath $queueLog) -join '|'
    Assert-True ($queued -ceq 'enter hushtumblr dex diff|exit hushtumblr dex diff') `
        "A DexDiff whose java could not start kept its build queue slot: $queued"

    # A patch bundle that isn't there to hold, a clean side that isn't Tumblr's alone, a merge handed
    # over that isn't the bytes the clean side merges to here, and a bundle with a split that doesn't
    # verify are each refused before DexDiff starts: no comparison. A record beside a handed merge is nobody's evidence, since whoever
    # wrote the merge could write it, so a merge of other bytes with a record that says everything
    # a true one would is refused like one with none. Nothing but the merger runs for a refusal, and
    # the merger only where the clean side is a bundle that has to be merged to hold the handed
    # merge to: there it takes its build queue slot and gives it back. (A handed merge beside a
    # base APK other than the one its signer was checked on is refused in
    # test-resource-table-check.ps1, where one process can hold both; a run of the verifier takes
    # both from the one -CleanApk.) The refusal is the child's error record, which both hosts wrap
    # to the console width (and PowerShell 7 may color), so it is matched with every space, color
    # code and gutter bar taken out of both sides.
    $squeeze = { param([string]$Text) ($Text -replace '\x1b\[[0-9;?]*[A-Za-z]', '') -replace '[\s|]', '' }
    $refusals = @(
        @{ Name = 'patch-bundle-missing'; Arguments = @{ NoPatchBundle = $true }
            Says = "The bundle at*patches.mpp can't be opened so that nothing else can write to it" }
        @{ Name = 'clean-unsigned';Arguments = @{ CleanMarker = 'stand-in-unsigned' }; Says = 'apksigner could not verify*DOES NOT VERIFY' }
        @{ Name = 'clean-foreign'; Arguments = @{ CleanMarker = 'stand-in-foreign' }; Says = "is signed by $foreignSigner, not by Tumblr alone" }
        @{ Name = 'clean-second-signer'; Arguments = @{ CleanMarker = 'stand-in-second-signer' }; Says = 'not by Tumblr alone' }
        @{ Name = 'merged-other-bytes'; Arguments = @{ Merged = 'OtherBytes' }; Says = 'merged.apk is not the merge of clean.apk: read through a handle' }
        @{ Name = 'merged-forged-pair'; Arguments = @{ Merged = 'Forged' }
            Says = 'merged.apk is not the merge of clean.apk: read through a handle*A record beside it is not evidence' }
        @{ Name = 'bundle-merged-forged-pair'; Arguments = @{ Bundle = $true; Merged = 'Forged' }; Java = 'MergeSplits.java'
            Says = 'merged.apk is not the merge of clean.apkm: read through a handle*A record beside it is not evidence' }
        @{ Name = 'bundle-unsigned-split'; Arguments = @{ Bundle = $true; SplitMarker = 'stand-in-unsigned' }
            Says = 'Refusing clean.apkm: config.arm64_v8a.apk does not verify*Nothing was merged or patched' }
        @{ Name = 'bundle-foreign-split'; Arguments = @{ Bundle = $true; SplitMarker = 'stand-in-foreign' }
            Says = "Refusing clean.apkm: config.arm64_v8a.apk is signed by $foreignSigner, which isn't*" })
    foreach ($refusal in $refusals) {
        Remove-Item -LiteralPath $queueLog -Force -ErrorAction SilentlyContinue
        $arguments = $refusal.Arguments
        $run = Invoke-VerifierWithStandIns -Name $refusal.Name -DexDiffExit 0 @arguments
        $queued = @(if (Test-Path -LiteralPath $queueLog) { Get-Content -LiteralPath $queueLog }) -join '|'
        $expectedQueue = if ($refusal.Java) { 'enter hushtumblr merge|exit hushtumblr merge' } else { '' }
        Assert-True ($run.ExitCode -ne 0 -and (& $squeeze $run.Text) -like ('*' + ($refusal.Says -replace '\s', '') + '*') -and
            $run.Text -notmatch $reached -and
            $run.Output -notcontains '[registers] success.' -and ($run.JavaRuns -join '|') -ceq [string]$refusal.Java -and
            $queued -ceq $expectedQueue) `
            "The verifier did not refuse $($refusal.Name) before comparing (exit $($run.ExitCode), java: $($run.JavaRuns -join ', '), queue: $queued).`n$($run.Text)"
    }

    # And what passes: a Source Stamp beside Tumblr's signer, a bundle whose APKs are all Tumblr's,
    # merged once before the comparison, and a merge handed over that is the clean side's own, with
    # no record beside it: a plain APK's bytes, and for the bundle the bytes it merges to, which
    # takes the one more run of the merger that makes them.
    $passes = @(
        @{ Name = 'clean-stamp'; Arguments = @{ CleanMarker = 'stand-in-stamp' }; Java = 'DexDiff.java|HostReferences.java' }
        @{ Name = 'merged-handed'; Arguments = @{ Merged = 'Handed' }; Java = 'DexDiff.java|HostReferences.java' }
        @{ Name = 'bundle-merged-handed'; Arguments = @{ Bundle = $true; Merged = 'Handed' }
            Java = 'MergeSplits.java|DexDiff.java|HostReferences.java' }
        @{ Name = 'bundle-signed'; Arguments = @{ Bundle = $true; SplitMarker = 'stand-in-stamp' }
            Java = 'MergeSplits.java|DexDiff.java|HostReferences.java' })
    foreach ($pass in $passes) {
        $arguments = $pass.Arguments
        $run = Invoke-VerifierWithStandIns -Name $pass.Name -DexDiffExit 0 @arguments
        Assert-True ($run.ExitCode -eq 0 -and $run.Text -match $reached -and $run.Output -contains '[registers] success.' -and
            ($run.JavaRuns -join '|') -ceq $pass.Java) `
            "The verifier did not pass $($pass.Name) (exit $($run.ExitCode), java: $($run.JavaRuns -join ', ')).`n$($run.Text)"
    }
} finally {
    $env:BUILD_QUEUE_SCRIPT = $savedQueueScript
    $env:BUILD_QUEUE_PRIORITY = $savedQueuePriority
    Remove-Item -LiteralPath $standIns -Recurse -Force -ErrorAction SilentlyContinue
}

$Java = Resolve-Java -Explicit $Java
$DesktopJar = Resolve-DesktopCli -Explicit $DesktopJar -Root $Root -Required
$javac = Join-Path (Split-Path -Parent $Java) 'javac.exe'
if (-not (Test-Path -LiteralPath $javac -PathType Leaf)) { throw "Required tool not found: $javac" }
$contracts = Join-Path $PSScriptRoot 'injected-mutation-contracts.txt'
$featureContracts = $contracts

$tempBase = [System.IO.Path]::GetFullPath([System.IO.Path]::GetTempPath())
$caseRoot = [System.IO.Path]::GetFullPath((Join-Path $tempBase `
    ("hushtumblr-register-test-" + [guid]::NewGuid().ToString('N'))))
$requiredPrefix = $tempBase.TrimEnd([System.IO.Path]::DirectorySeparatorChar) + `
    [System.IO.Path]::DirectorySeparatorChar
if (-not $caseRoot.StartsWith($requiredPrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Refusing to create test files outside the temporary directory: $caseRoot"
}

Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem
try {
    New-Item -ItemType Directory -Path $caseRoot | Out-Null
    # Compiled once rather than launched from source per case: the same code, a fraction of the time.
    $classes = Join-Path $caseRoot 'classes'
    Invoke-Checked -Program $javac -Arguments @('-encoding', 'UTF-8', '-cp', $DesktopJar, '-d', $classes,
        (Join-Path $PSScriptRoot 'DexDiff.java'), (Join-Path $PSScriptRoot 'BadDexFixture.java'),
        (Join-Path $PSScriptRoot 'FeatureDexFixture.java'), (Join-Path $PSScriptRoot 'SelectorDexFixture.java'),
        (Join-Path $PSScriptRoot 'AccountDexFixture.java'), (Join-Path $PSScriptRoot 'MatureDexFixture.java'),
        (Join-Path $PSScriptRoot 'RootMuteDexFixture.java'),
        (Join-Path $PSScriptRoot 'MutualDexFixture.java'), (Join-Path $PSScriptRoot 'DexDeltaFixture.java'),
        (Join-Path $PSScriptRoot 'ControlFlowFixture.java')) `
        -Description 'javac for DexDiff and its fixtures'
    $classPath = $DesktopJar + [System.IO.Path]::PathSeparator + $classes
    Invoke-Checked -Program $Java -Arguments @('-Xmx256m', '-cp', $classPath, 'ControlFlowFixture') `
        -Description 'ControlFlowFixture object and wide disabled paths'
    $dexDir = Join-Path $caseRoot 'dex'
    Invoke-Checked -Program $Java -Arguments @('-cp', $classPath, 'BadDexFixture', $dexDir) `
        -Description 'BadDexFixture'
    function Get-Dex([string]$Name) { Join-Path $dexDir "$Name.dex" }

    $emptyAllowlist = Join-Path $caseRoot 'empty-allowlist.txt'
    [System.IO.File]::WriteAllText($emptyAllowlist, "# nothing reviewed`n")
    # Neutral instruction fixtures carry no Tumblr status class. Use the legacy grammar for
    # those cases; production feature contracts must reject a missing status class, not skip it.
    $contracts = Join-Path $caseRoot 'legacy-contracts.txt'
    [IO.File]::WriteAllLines($contracts, [string[]]@(Get-Content -LiteralPath $featureContracts |
        Where-Object { $_ -match '^\s*no-call\s' }), [Text.UTF8Encoding]::new($false))
    $cleanApk = New-DexApk -Name 'clean' -Entries ([ordered]@{ 'classes.dex' = (Get-Dex 'clean') })

    $good = Invoke-DexDiff -Clean $cleanApk -Patched (New-DexApk -Name 'good' -Entries ([ordered]@{
        'classes.dex' = (Get-Dex 'good') })) -Allowlist $emptyAllowlist -Name 'good' -Contracts $contracts
    Assert-True ($good.ExitCode -eq 0) "The patched build that breaks nothing failed.`n$($good.Output -join "`n")"
    Assert-True ((Get-Findings $good).Fails.Count -eq 0) "The good build printed a FAIL line.`n$($good.Output -join "`n")"
    Assert-True (($good.Output -join "`n") -match 'structural findings: 0') `
        "The good build did not report its structural count.`n$($good.Output -join "`n")"
    # The settings patch sends each of these ShortcutManager calls to SettingsEntry, and the fixture's
    # publisher makes each one from a method of its own (Caller). Every no-call rule in the contract
    # file has to be one of them, or a rule with no bad build below would pass on "0 call sites".
    $shortcutCalls = @(
        [pscustomobject]@{ Case = 'push'; Call = 'pushDynamicShortcut'; Takes = 'Landroid/content/pm/ShortcutInfo;'; Answers = 'V'; Caller = 'push' }
        [pscustomobject]@{ Case = 'add'; Call = 'addDynamicShortcuts'; Takes = 'Ljava/util/List;'; Answers = 'Z'; Caller = 'add' }
        [pscustomobject]@{ Case = 'set'; Call = 'setDynamicShortcuts'; Takes = 'Ljava/util/List;'; Answers = 'Z'; Caller = 'set' }
        [pscustomobject]@{ Case = 'update'; Call = 'updateShortcuts'; Takes = 'Ljava/util/List;'; Answers = 'Z'; Caller = 'update' }
        [pscustomobject]@{ Case = 'remove-all'; Call = 'removeAllDynamicShortcuts'; Takes = ''; Answers = 'V'; Caller = 'removeAll' }
    )
    foreach ($shortcut in $shortcutCalls) {
        $shortcut | Add-Member -NotePropertyName Callee -NotePropertyValue (
            "Landroid/content/pm/ShortcutManager;->$($shortcut.Call)($($shortcut.Takes))$($shortcut.Answers)")
        $shortcut | Add-Member -NotePropertyName Site -NotePropertyValue (
            "Lfixture/Shortcuts;->$($shortcut.Caller)(Landroid/content/pm/ShortcutManager;$($shortcut.Takes))$($shortcut.Answers)")
    }
    $noCallRules = @(Get-Content -LiteralPath $contracts | Where-Object { $_ -match '^\s*no-call\s' } |
        ForEach-Object { ($_.Trim() -split '\s+')[1] } | Sort-Object)
    $shortcutCallees = @($shortcutCalls | ForEach-Object { $_.Callee } | Sort-Object)
    Assert-True (($noCallRules -join "`n") -ceq ($shortcutCallees -join "`n")) `
        ("The contract file's no-call rules and this suite's shortcut builds name different calls.`n" +
        "Contract file:`n$($noCallRules -join "`n")`nThis suite:`n$($shortcutCallees -join "`n")")
    foreach ($shortcut in $shortcutCalls) {
        Assert-True (($good.Output -join "`n") -match [regex]::Escape(
            "no-call $($shortcut.Callee) outside Lapp/hushtumblr/extension/: 0 call sites")) `
            ("The good build's $($shortcut.Call), sent to the stand-in whose own call is inside the extension, " +
            "was not reported clean.`n$($good.Output -join "`n")")
    }
    # Family fixtures exercise final flags and actual bytecode. Every declared capability needs a
    # mutation rule, and every production flag needs a declared owner, so new rules cannot pass unused.
    $otherRules = @(Get-Content -LiteralPath $featureContracts | ForEach-Object { $_.Trim() } |
        Where-Object { $_ -and -not $_.StartsWith('#') -and $_ -notmatch '^(no-call\s|family\||mutation\|)' })
    Assert-True ($otherRules.Count -eq 0) `
        ("The contract file holds rules this suite builds no bad fixtures for:`n$($otherRules -join "`n")")
    $families = @(Get-Content -LiteralPath $featureContracts | Where-Object { $_.StartsWith('family|') } |
        ForEach-Object { $values = $_ -split '\|'; [pscustomobject]@{ Flag = $values[1]; Name = $values[2]; Caps = @($values[3] -split ',' | Where-Object { $_ }) } })
    # Every public patch but the settings one is a family, read from the bundle's patch list.
    $publicNames = @((Get-Content -LiteralPath (Join-Path $Root 'patches-list.json') -Raw | ConvertFrom-Json).patches |
        ForEach-Object { $_.name } | Where-Object { $_ -ne 'HushTumblr settings' } | Sort-Object)
    $familyNames = @($families | ForEach-Object { $_.Name } | Sort-Object)
    Assert-True (($familyNames -join "`n") -ceq ($publicNames -join "`n")) `
        "The contract file's families and the public patches differ.`nContracts:`n$($familyNames -join "`n")`nPatches:`n$($publicNames -join "`n")"
    # Each family's capabilities are the ones its patch turns on next to its installed flag, so a
    # manifest-only family (no capability) is one whose patch turns none on.
    $sourceCaps = @{}
    foreach ($file in Get-ChildItem -LiteralPath (Join-Path $Root 'patches/src/main/kotlin') -Recurse -Filter '*.kt') {
        $text = [IO.File]::ReadAllText($file.FullName)
        $status = [regex]::Match($text, 'enableStatus\("([A-Za-z0-9]+)"\)')
        if (-not $status.Success) { continue }
        Assert-True (-not $sourceCaps.ContainsKey($status.Groups[1].Value)) "Two patch sources turn on $($status.Groups[1].Value)."
        $sourceCaps[$status.Groups[1].Value] = @([regex]::Matches($text, 'enableCapability\("([A-Za-z0-9]+)"\)') |
            ForEach-Object { $_.Groups[1].Value } | Sort-Object)
    }
    foreach ($family in $families) {
        Assert-True $sourceCaps.ContainsKey($family.Flag) "No patch source turns on the installed flag $($family.Flag)."
        Assert-True ((@($family.Caps | Sort-Object) -join ',') -ceq ($sourceCaps[$family.Flag] -join ',')) `
            "$($family.Name) declares capabilities $($family.Caps -join ',') but its patch turns on $($sourceCaps[$family.Flag] -join ',')."
    }
    Assert-True ($sourceCaps.Count -eq $families.Count) 'A patch source turns on an installed flag the contract file has no family for.'
    $declaredFlags = @($families | ForEach-Object { $_.Flag; $_.Caps } | Sort-Object)
    $statusSource = Join-Path $Root 'extensions/tumblr/src/main/java/app/hushtumblr/extension/tumblr/settings/SettingsStatus.java'
    $sourceFlags = @([regex]::Matches([IO.File]::ReadAllText($statusSource), 'public static boolean ([A-Za-z0-9]+)\(\)') |
        ForEach-Object { $_.Groups[1].Value } | Sort-Object)
    Assert-True (($declaredFlags -join "`n") -ceq ($sourceFlags -join "`n")) 'Compiled contracts and production installed/capability flags differ.'
    $mutationCaps = @(Get-Content -LiteralPath $featureContracts | Where-Object { $_.StartsWith('mutation|') } |
        ForEach-Object { ($_ -split '\|')[1] -split ',' } | Where-Object { $_ -ne 'settings' } | Sort-Object)
    $familyCaps = @($families | ForEach-Object { $_.Caps } | Sort-Object)
    Assert-True (($mutationCaps -join "`n") -ceq ($familyCaps -join "`n")) 'A capability has no mutation rule or has duplicated ownership.'
    Invoke-Checked -Program $Java -Arguments @('-cp', $classPath, 'FeatureDexFixture', $dexDir, $featureContracts) `
        -Description 'FeatureDexFixture'
    Invoke-Checked -Program $Java -Arguments @('-cp', $classPath, 'SelectorDexFixture', $dexDir, $featureContracts) `
        -Description 'SelectorDexFixture'
    Invoke-Checked -Program $Java -Arguments @('-Xmx256m', '-cp', $classPath, 'MatureDexFixture', $dexDir, $featureContracts) `
        -Description 'MatureDexFixture'
    Invoke-Checked -Program $Java -Arguments @('-Xmx256m', '-cp', $classPath, 'RootMuteDexFixture', $dexDir, $featureContracts) `
        -Description 'RootMuteDexFixture'
    Invoke-Checked -Program $Java -Arguments @('-Xmx256m', '-cp', $classPath, 'MutualDexFixture', $dexDir, $featureContracts) `
        -Description 'MutualDexFixture'
    $featureApks = @{}
    function Get-FeatureApk([string]$Name) {
        if (-not $featureApks.ContainsKey($Name)) { $featureApks[$Name] = New-DexApk -Name $Name -Entries ([ordered]@{ 'classes.dex' = (Get-Dex $Name) }) }
        $featureApks[$Name]
    }
    $featureCases = [ordered]@{
        'feature-unselected' = $true
        'feature-internal-dependencies' = $true
        'feature-unknown-public' = $false
        'feature-no-status' = $false
        'feature-nonboolean-status' = $false
        'feature-answers-good' = $true
        'feature-answers-missing' = $false
        'feature-answers-duplicate' = $false
        'feature-answers-misrouted' = $false
        'feature-answers-wrong-register' = $false
        'feature-answers-changed-original' = $false
        'feature-answers-false-capability' = $false
        'feature-answers-unselected-call' = $false
        'feature-answers-missing-callee' = $false
        'feature-answers-unreachable-control' = $false
        'feature-firebase-good' = $true
        'feature-firebase-missing' = $false
        'feature-firebase-early' = $false
        'feature-firebase-wrong-value' = $false
        'feature-firebase-false-capability' = $false
        'feature-shortcuts-branch-good' = $true
        'feature-paid-post-good' = $true
        'feature-paid-post-missing' = $false
        'feature-paid-post-wrong-header' = $false
        'feature-paid-post-wrong-icon' = $false
        'feature-paid-post-wrong-null-target' = $false
        'feature-paid-post-wrong-null-value' = $false
        'feature-paid-post-false-capability' = $false
        'feature-post-bridge-good' = $true
        'feature-post-bridge-missing' = $false
        'feature-post-bridge-wrong-getter' = $false
        'feature-post-bridge-missing-trail' = $false
        'feature-switch-good' = $true
        'feature-switch-missing' = $false
        'feature-switch-wrong-value' = $false
        'feature-review-good' = $true
        'feature-blog-reminder-good' = $true
        'feature-blog-reminder-missing' = $false
        'feature-blog-reminder-wrong-return' = $false
        'feature-gift-popup-good' = $true
        'feature-gift-popup-missing' = $false
        'feature-gift-popup-wrong-key' = $false
        'feature-gift-popup-wrong-argument' = $false
        'feature-gift-popup-wrong-branch' = $false
        'feature-post-line-good' = $true
        'feature-post-line-missing' = $false
        'feature-post-line-wrong-register' = $false
        'feature-post-line-wrong-paint' = $false
        'feature-font-choice-good' = $true
        'feature-font-choice-missing' = $false
        'feature-font-choice-wrong-register' = $false
        'feature-font-choice-wrong-return' = $false
        'feature-font-choice-missing-row' = $false
        'feature-font-choice-wrong-row' = $false
        'feature-review-missing' = $false
        'feature-review-jump-to-injected-return' = $false
        'feature-activity-good' = $true
        'feature-activity-missing-hook' = $false
        'feature-activity-wrong-list' = $false
        'feature-activity-push-hook' = $false
        'feature-activity-missing-bridge' = $false
        'feature-activity-wrong-getter' = $false
        'feature-activity-wrong-null-target' = $false
    }
    foreach ($family in $families) {
        if ($family.Caps.Count -eq 0) {
            $featureCases["feature-installed-only-$($family.Flag)"] = $true
            $featureCases["feature-installed-unselected-$($family.Flag)"] = $false
        } else {
            $featureCases["feature-installed-missing-$($family.Flag)"] = $false
        }
        $featureCases["feature-selected-missing-$($family.Flag)"] = $false
    }
    foreach ($shortcut in $shortcutCalls) { $featureCases["feature-shortcuts-unreachable-$($shortcut.Call)"] = $false }
    $selectorReasons = @{}
    foreach ($manifest in 'selector-cases.txt', 'small-selector-cases.txt', 'mature-cases.txt', 'root-mute-cases.txt', 'mutual-cases.txt') {
        foreach ($line in Get-Content -LiteralPath (Join-Path $dexDir $manifest)) {
            $values = $line -split '\|', 3
            Assert-True ($values.Count -eq 3 -and $values[1] -in 'true', 'false') "Invalid selector fixture manifest line $line."
            Assert-True (-not $featureCases.Contains($values[0])) "Duplicate selector fixture $($values[0])."
            $featureCases[$values[0]] = $values[1] -eq 'true'
            if ($values[2]) { $selectorReasons[$values[0]] = $values[2] }
        }
    }
    $compiledCases = @(Get-ChildItem -LiteralPath $dexDir -Filter '*.selected' | ForEach-Object { $_.BaseName } | Sort-Object)
    $coveredCases = @($featureCases.Keys | Sort-Object)
    Assert-True (($compiledCases -join "`n") -ceq ($coveredCases -join "`n")) 'A compiled family fixture has no result assertion.'
    foreach ($entry in $featureCases.GetEnumerator()) {
        $name = $entry.Key
        $cleanName = if ($name.StartsWith('feature-selector-')) { 'selector-clean' }
            elseif ($name.StartsWith('feature-mature-')) { 'mature-clean' }
            elseif ($name.StartsWith('feature-root-mute-')) { 'root-mute-clean' }
            elseif ($name.StartsWith('feature-mutual-')) { 'mutual-clean' }
            else { 'feature-clean' }
        $result = Invoke-DexDiff -Clean (Get-FeatureApk $cleanName) -Patched (Get-FeatureApk $name) `
            -Allowlist $emptyAllowlist -Name $name -Contracts $featureContracts -Selected (Join-Path $dexDir "$name.selected")
        $findings = Get-Findings $result
        $text = $result.Output -join "`n"
        if ($entry.Value) {
            Assert-True ($result.ExitCode -eq 0 -and $findings.Fails.Count -eq 0) "Valid family fixture $name failed.`n$text"
        } else {
            Assert-True ($result.ExitCode -ne 0 -and $findings.Categories.Count -gt 0 -and
                @($findings.Categories | Where-Object { $_ -ne 'contract' }).Count -eq 0) "Unsafe family fixture $name was not refused for contracts alone.`n$text"
        }
        if ($name -like 'feature-selected-missing-*' -or $name -like 'feature-installed-unselected-*') {
            Assert-True ($text.Contains('installed flag disagrees with selected patches')) "Selected failed family $name was not distinguished from an intentionally unselected family.`n$text"
        }
        if ($name -eq 'feature-unknown-public') {
            Assert-True ($text.Contains('unknown selected patch Hide imaginary posts')) "An unknown public patch selection was accepted.`n$text"
        }
        if ($name -like 'feature-shortcuts-unreachable-*') {
            Assert-True ($text.Contains('no reachable original framework call fallback')) "A disconnected original framework call in $name passed as a fallback.`n$text"
        }
        if ($name -like '*unreachable-control') {
            Assert-True ($text.Contains('unreachable required family control')) "An early return disconnected the family control in $name without detection.`n$text"
        }
        # Each unsafe hook fixture has to be refused for its own fault, not for another one it happens to carry.
        $hookReason = switch ($name) {
            'feature-answers-missing' { 'id(Ljava/lang/String;)Ljava/lang/String; has 0 calls' }
            'feature-answers-duplicate' { 'id(Ljava/lang/String;)Ljava/lang/String; has 2 calls' }
            'feature-answers-misrouted' { 'misrouted call' }
            'feature-answers-wrong-register' { 'does not filter the answer before every return' }
            'feature-answers-changed-original' { 'beyond its validated mutations' }
            'feature-answers-false-capability' { 'advertisingId flag is false, clean target requires true' }
            'feature-answers-unselected-call' { 'misrouted call' }
            'feature-answers-missing-callee' { 'missing or duplicated compiled method' }
            'feature-firebase-missing' { 'certificateHeader(Ljava/net/URLConnection;Ljava/lang/String;)Ljava/lang/String; has 0 calls' }
            'feature-firebase-early' { "doesn't take the certificate header's fingerprint between its answer and its write" }
            'feature-firebase-wrong-value' { "doesn't take the certificate header's fingerprint between its answer and its write" }
            'feature-firebase-false-capability' { 'firebaseCertificate flag is false, clean target requires true' }
            'feature-paid-post-missing' { 'missing or duplicated compiled method' }
            'feature-paid-post-wrong-header' { "doesn't return its structured header icon with a null fallback" }
            'feature-paid-post-wrong-icon' { "doesn't return its structured header icon with a null fallback" }
            'feature-paid-post-wrong-null-target' { "doesn't return its structured header icon with a null fallback" }
            'feature-paid-post-wrong-null-value' { "doesn't return its structured header icon with a null fallback" }
            'feature-paid-post-false-capability' { 'paidPostHeader flag is false, clean target requires true' }
            'feature-post-bridge-missing' { 'missing or duplicated compiled method' }
            'feature-post-bridge-wrong-getter' { "doesn't hand back" }
            'feature-post-bridge-missing-trail' { "doesn't implement" }
            'feature-switch-missing' { 'has 0 calls' }
            'feature-switch-wrong-value' { "doesn't take what its rule hands it" }
            'feature-review-missing' { 'has 0 calls' }
            'feature-blog-reminder-missing' { 'has 0 calls' }
            'feature-blog-reminder-wrong-return' { "isn't asked first thing" }
            'feature-gift-popup-missing' { 'has 0 calls' }
            'feature-gift-popup-wrong-key' { "doesn't receive the native instance key" }
            'feature-gift-popup-wrong-argument' { "doesn't receive the native instance key" }
            'feature-gift-popup-wrong-branch' { "doesn't receive the native instance key" }
            'feature-post-line-missing' { 'has 0 calls' }
            'feature-post-line-wrong-register' { "don't take the debug answer" }
            'feature-post-line-wrong-paint' { 'has 0 calls' }
            'feature-font-choice-missing' { 'has 0 calls' }
            'feature-font-choice-wrong-register' { "doesn't answer with the chosen font first" }
            'feature-font-choice-wrong-return' { "don't take the Roboto answers" }
            'feature-font-choice-missing-row' { 'has 0 calls' }
            'feature-font-choice-wrong-row' { "doesn't go through the font hook" }
            'feature-review-jump-to-injected-return' { 'routes an original branch or handler into the middle of an injected block' }
            'feature-activity-missing-hook' { 'has 0 calls' }
            'feature-activity-wrong-list' { "doesn't take what its rule hands it" }
            'feature-activity-push-hook' { 'changed on the excluded push-notification path' }
            'feature-activity-missing-bridge' { "doesn't extend the activity-notification type bridge" }
            'feature-activity-wrong-getter' { "doesn't return its activity type name with a null fallback" }
            'feature-activity-wrong-null-target' { "doesn't return its activity type name with a null fallback" }
        }
        if ($selectorReasons.ContainsKey($name)) { $hookReason = $selectorReasons[$name] }
        if ($hookReason) {
            Assert-True ($text.Contains($hookReason)) "The hook fixture $name wasn't refused for its own fault ($hookReason).`n$text"
        }
    }
    $duplicateFlags = Invoke-DexDiff -Clean (Get-FeatureApk 'feature-clean') -Patched (New-DexApk -Name 'feature-duplicate-flags' -Entries ([ordered]@{
        'classes.dex' = (Get-Dex 'feature-unselected'); 'classes2.dex' = (Get-Dex 'feature-status-copy') })) `
        -Allowlist $emptyAllowlist -Name 'feature-duplicate-flags' -Contracts $featureContracts -Selected (Join-Path $dexDir 'feature-unselected.selected')
    Assert-True ($duplicateFlags.ExitCode -ne 0 -and ($duplicateFlags.Output -join "`n").Contains('duplicated compiled method')) `
        "Duplicated installed flags were accepted.`n$($duplicateFlags.Output -join "`n")"

    # The dex delta (DexDeltaFixture.java): each change no contract validates, and each class the
    # patch added that isn't the bundle's own, has to be a line of the allowlist under a patch the
    # run selected. The first run, with no sections, has to name exactly what the two fixture
    # patches changed. The allowlist made from those lines then passes the build of both, every
    # section when no selection is given, and the build of one alone, and fails each build that
    # changes one thing more, naming it. Other patch's lines sit under a header that also names a
    # patch with no section of its own, since a run with no selection applies every header. A line
    # a selected section lists for code the run didn't change fails it, while a line of another
    # selection's variant doesn't.
    Invoke-Checked -Program $Java -Arguments @('-Xmx256m', '-cp', $classPath, 'DexDeltaFixture', $dexDir) -Description 'DexDeltaFixture'
    function New-PatchBundle {
        param([string]$Name, [System.Collections.IDictionary]$Extensions, [string]$Version = '9.9.9')
        $path = Join-Path $caseRoot "$Name.mpp"
        $archive = [System.IO.Compression.ZipFile]::Open($path, [System.IO.Compression.ZipArchiveMode]::Create)
        try {
            $writer = New-Object System.IO.StreamWriter($archive.CreateEntry('META-INF/MANIFEST.MF').Open())
            try { $writer.Write("Manifest-Version: 1.0`r`n" + $(if ($Version) { "Version: $Version`r`n" } else { '' }) + "`r`n") } finally { $writer.Dispose() }
            foreach ($entry in $Extensions.GetEnumerator()) {
                [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($archive, $entry.Value, $entry.Key,
                    [System.IO.Compression.CompressionLevel]::Optimal) | Out-Null
            }
        } finally { $archive.Dispose() }
        return $path
    }
    function New-Selection([string]$Name, [string[]]$Patches) {
        $path = Join-Path $caseRoot "$Name.selected"
        [IO.File]::WriteAllLines($path, $Patches, [Text.UTF8Encoding]::new($false))
        return $path
    }
    $own = 'Lapp/hushtumblr/extension/'
    $face = "${own}tumblr/fixture/FixtureFace;"
    $plain = "${own}tumblr/fixture/Plain;"
    $deltaContracts = Join-Path $caseRoot 'delta-contracts.txt'
    [IO.File]::WriteAllLines($deltaContracts, [string[]]@('family|fixtureFamily|Fixture patch|', 'family|otherFamily|Other patch|'),
        [Text.UTF8Encoding]::new($false))
    $noSections = Join-Path $caseRoot 'delta-none.txt'
    [System.IO.File]::WriteAllText($noSections, "# nothing reviewed`n")
    $bothExtensions = [ordered]@{ 'extensions/shared.mpe' = (Join-Path $dexDir 'delta-shared.mpe'); 'extensions/tumblr.mpe' = (Join-Path $dexDir 'delta-tumblr.mpe') }
    $deltaBundle = New-PatchBundle -Name 'delta' -Extensions $bothExtensions
    $deltaClean = New-DexApk -Name 'delta-clean' -Entries ([ordered]@{ 'classes.dex' = (Get-Dex 'delta-clean') })
    $deltaGood = New-DexApk -Name 'delta-good' -Entries ([ordered]@{ 'classes.dex' = (Get-Dex 'delta-good') })
    $bothSelected = New-Selection 'delta-both' @('Fixture patch', 'Other patch')
    $fixtureSelected = New-Selection 'delta-fixture' @('Fixture patch')
    $unlisted = '[diff] FAIL: dex delta: no compiled contract validates this and no selected section of the dex delta allowlist lists it: '
    $deltaLines = { param($Result) @($Result.Output | Where-Object { $_.StartsWith($unlisted) } | ForEach-Object { $_.Substring($unlisted.Length) }) }
    $deltaFails = { param($Result) @($Result.Output | Where-Object { $_ -like '`[diff`] FAIL*' }) }
    $onlyDelta = { param($Result) $fails = & $deltaFails $Result
        $fails.Count -gt 0 -and @($fails | Where-Object { -not $_.StartsWith('[diff] FAIL: dex delta: ') }).Count -eq 0 }
    $deltaSummary = { param($Result) @($Result.Output | Where-Object { $_ -like '`[diff`] dex delta: *' }) -join "`n" }
    $summaryOf = { param([int]$Validated, [int]$Needed, [int]$Answered)
        "[diff] dex delta: $Validated Tumblr methods validated by their contracts, 1 only re-encoded, $Needed changes the allowlist has to name, " +
            "2 extension classes as the bundle has them, $Answered answering ahead of the bundle's body" }
    $first = Invoke-DexDiff -Clean $deltaClean -Patched $deltaGood -Allowlist $emptyAllowlist -Name 'delta-first' -Contracts $deltaContracts `
        -Selected $bothSelected -Bundle $deltaBundle -DeltaAllowlist $noSections
    $firstLines = & $deltaLines $first
    $expectedKeys = @("field Lcom/fixture/Host;->hushFlag:Z", "implements Lcom/fixture/Model; $face",
        "method ${own}tumblr/fixture/FixtureBridge;->fill()V", 'method Lcom/fixture/Host;->answer()Z', 'method Lcom/fixture/Host;->hushHelper()V')
    $firstKeys = @($firstLines | ForEach-Object { $_ -replace ' [0-9a-f]{64}\z', '' })
    Assert-True ($first.ExitCode -ne 0 -and (& $onlyDelta $first) -and (& $deltaFails $first).Count -eq $expectedKeys.Count -and
        (@($firstKeys | Sort-Object) -join "`n") -ceq (@($expectedKeys | Sort-Object) -join "`n") -and
        (& $deltaSummary $first) -ceq (& $summaryOf 0 5 3)) `
        "The dex delta did not name exactly what the two fixture patches changed.`n$($first.Output -join "`n")"
    $pick = { param([string]$Key) @($firstLines | Where-Object { $_ -ceq $Key -or $_.StartsWith("$Key ") }) }
    # Written with a byte order mark, which the reader takes off.
    $allowLines = @('# The two fixture patches.', '[Fixture patch]') + (& $pick 'method Lcom/fixture/Host;->answer()Z') +
        (& $pick "method ${own}tumblr/fixture/FixtureBridge;->fill()V") + @('', '[Fixture patch | Other patch]') +
        (& $pick "implements Lcom/fixture/Model; $face") + @('[Other patch | Third patch]') + (& $pick 'method Lcom/fixture/Host;->hushHelper()V') +
        (& $pick 'field Lcom/fixture/Host;->hushFlag:Z')
    $deltaAllowlist = Join-Path $caseRoot 'delta-allowlist.txt'
    [IO.File]::WriteAllLines($deltaAllowlist, [string[]]$allowLines, [Text.UTF8Encoding]::new($true))
    $staleLine = 'method Lcom/fixture/Host;->gone()V ' + ('0' * 64)
    $staleAllowlist = Join-Path $caseRoot 'delta-allowlist-stale.txt'
    [IO.File]::WriteAllLines($staleAllowlist, [string[]]($allowLines + $staleLine), [Text.UTF8Encoding]::new($false))
    $everySection = '  sections Fixture patch, Fixture patch | Other patch, Other patch | Third patch'
    $deltaSubset = New-DexApk -Name 'delta-subset' -Entries ([ordered]@{ 'classes.dex' = (Get-Dex 'delta-subset') })
    $deltaPasses = @(
        @{ Name = 'delta-good'; Patched = $deltaGood; Selected = $bothSelected; Allow = $deltaAllowlist; Summary = (& $summaryOf 0 5 3); Sections = $everySection }
        @{ Name = 'delta-good-every-section'; Patched = $deltaGood; Selected = ''; Allow = $deltaAllowlist; Summary = (& $summaryOf 0 5 3); Sections = $everySection }
        @{ Name = 'delta-subset'; Patched = $deltaSubset; Selected = $fixtureSelected; Allow = $deltaAllowlist; Summary = (& $summaryOf 0 3 3)
            Sections = '  sections Fixture patch, Fixture patch | Other patch' }
        # A stale line is only reported when no selection is named, and a section the run didn't select doesn't count.
        @{ Name = 'delta-good-stale-every-section'; Patched = $deltaGood; Selected = ''; Allow = $staleAllowlist; Summary = (& $summaryOf 0 5 3)
            Sections = $everySection; Unseen = "  [Other patch | Third patch] $staleLine" }
        @{ Name = 'delta-subset-stale'; Patched = $deltaSubset; Selected = $fixtureSelected; Allow = $staleAllowlist; Summary = (& $summaryOf 0 3 3)
            Sections = '  sections Fixture patch, Fixture patch | Other patch' })
    foreach ($pass in $deltaPasses) {
        $run = Invoke-DexDiff -Clean $deltaClean -Patched $pass.Patched -Allowlist $emptyAllowlist -Name $pass.Name -Contracts $deltaContracts `
            -Selected $pass.Selected -Bundle $deltaBundle -DeltaAllowlist $pass.Allow
        $report = @(Get-Content -LiteralPath $run.Report)
        $unseenAt = [array]::IndexOf($report, "Listed in the sections this run applied, for code it didn't change:")
        $unseen = @(if ($unseenAt -ge 0) { $report[($unseenAt + 1)..($report.Count - 1)] | Where-Object { $_ -like '  `[*' } })
        Assert-True ($run.ExitCode -eq 0 -and (& $deltaFails $run).Count -eq 0 -and (& $deltaSummary $run) -ceq $pass.Summary -and
            $report -ccontains $pass.Sections -and ($unseen -join "`n") -ceq [string]$pass.Unseen -and
            $report -ccontains "  allowed [Fixture patch | Other patch] implements Lcom/fixture/Model; $face") `
            "The dex delta did not pass $($pass.Name) on the allowlist made for it.`n$($run.Output -join "`n")`n$($report -join "`n")"
    }
    $stale = Invoke-DexDiff -Clean $deltaClean -Patched $deltaGood -Allowlist $emptyAllowlist -Name 'delta-good-stale' -Contracts $deltaContracts `
        -Selected $bothSelected -Bundle $deltaBundle -DeltaAllowlist $staleAllowlist
    Assert-True ($stale.ExitCode -ne 0 -and (& $onlyDelta $stale) -and (& $deltaFails $stale).Count -eq 1 -and
        ($stale.Output -join "`n").Contains("dex delta: the selected section [Other patch | Third patch] lists what this run didn't change: $staleLine")) `
        "A stale line in a selected section of the dex delta allowlist passed.`n$($stale.Output -join "`n")"
    # A line in effect that the run didn't need is stale, an out-of-date hash beside the current one
    # included: the old one would let those bytes back in.
    $oldHashLine = 'method Lcom/fixture/Host;->hushHelper()V ' + ('0' * 64)
    $oldHashAllowlist = Join-Path $caseRoot 'delta-allowlist-old-hash.txt'
    [IO.File]::WriteAllLines($oldHashAllowlist, [string[]]($allowLines + $oldHashLine), [Text.UTF8Encoding]::new($false))
    $oldHash = Invoke-DexDiff -Clean $deltaClean -Patched $deltaGood -Allowlist $emptyAllowlist -Name 'delta-good-old-hash' -Contracts $deltaContracts `
        -Selected $bothSelected -Bundle $deltaBundle -DeltaAllowlist $oldHashAllowlist
    Assert-True ($oldHash.ExitCode -ne 0 -and (& $onlyDelta $oldHash) -and (& $deltaFails $oldHash).Count -eq 1 -and
        ($oldHash.Output -join "`n").Contains("dex delta: the selected section [Other patch | Third patch] lists what this run didn't change: $oldHashLine")) `
        "An out-of-date hash listed beside a method's current one passed.`n$($oldHash.Output -join "`n")"
    # A class one patch reshapes and another adds to: its whole-class line hashes one way for
    # Fixture patch alone and another for both, and covers Model's implements line in each. The one
    # for both goes under a header that needs both, and stands in for Fixture patch's own line when
    # both are selected. Each build passes, and a build that doesn't reshape Model fails on the line
    # in effect. A run of Fixture patch alone over a build with Other patch's mark in Model fails:
    # the line for both doesn't apply to it.
    $modelLineOf = { param([string]$Name, [string]$Selected)
        $run = Invoke-DexDiff -Clean $deltaClean -Patched (New-DexApk -Name $Name -Entries ([ordered]@{ 'classes.dex' = (Get-Dex $Name) })) `
            -Allowlist $emptyAllowlist -Name "$Name-first" -Contracts $deltaContracts -Selected $Selected -Bundle $deltaBundle -DeltaAllowlist $deltaAllowlist
        $lines = @(& $deltaLines $run)
        Assert-True ($run.ExitCode -ne 0 -and (& $deltaFails $run).Count -eq 1 -and $lines.Count -eq 1 -and $lines[0].StartsWith('class Lcom/fixture/Model; ')) `
            "The dex delta did not ask $Name for Model's whole-class line alone.`n$($run.Output -join "`n")"
        $lines[0] }
    $variantLines = @((& $modelLineOf 'delta-variant-subset' $fixtureSelected), (& $modelLineOf 'delta-variant-good' $bothSelected))
    Assert-True ($variantLines[0] -cne $variantLines[1]) "Model's whole-class line hashed the same for both selections: $($variantLines[0])"
    $variantAllowlist = Join-Path $caseRoot 'delta-allowlist-variant.txt'
    [IO.File]::WriteAllLines($variantAllowlist, [string[]]($allowLines + '[Fixture patch | Fourth patch]' + $variantLines[0] +
        '[Fixture patch + Other patch]' + $variantLines[1]), [Text.UTF8Encoding]::new($false))
    foreach ($variant in @(@{ Name = 'delta-variant-subset'; Selected = $fixtureSelected }, @{ Name = 'delta-variant-good'; Selected = $bothSelected })) {
        $run = Invoke-DexDiff -Clean $deltaClean -Patched (Join-Path $caseRoot "$($variant.Name).apk") -Allowlist $emptyAllowlist -Name "$($variant.Name)-listed" `
            -Contracts $deltaContracts -Selected $variant.Selected -Bundle $deltaBundle -DeltaAllowlist $variantAllowlist
        Assert-True ($run.ExitCode -eq 0 -and (& $deltaFails $run).Count -eq 0) `
            "The dex delta failed $($variant.Name) with both of Model's whole-class lines listed.`n$($run.Output -join "`n")"
    }
    $unshaped = Invoke-DexDiff -Clean $deltaClean -Patched $deltaGood -Allowlist $emptyAllowlist -Name 'delta-variant-unshaped' -Contracts $deltaContracts `
        -Selected $bothSelected -Bundle $deltaBundle -DeltaAllowlist $variantAllowlist
    $unshapedFails = & $deltaFails $unshaped
    Assert-True ($unshaped.ExitCode -ne 0 -and (& $onlyDelta $unshaped) -and $unshapedFails.Count -eq 1 -and
        $unshapedFails -ccontains "[diff] FAIL: dex delta: the selected section [Fixture patch + Other patch] lists what this run didn't change: $($variantLines[1])") `
        "A build that doesn't reshape Model passed with Model's whole-class line for both patches in effect.`n$($unshaped.Output -join "`n")"
    $mixed = Invoke-DexDiff -Clean $deltaClean -Patched (New-DexApk -Name 'delta-variant-mixed' -Entries ([ordered]@{ 'classes.dex' = (Get-Dex 'delta-variant-mixed') })) `
        -Allowlist $emptyAllowlist -Name 'delta-variant-mixed' -Contracts $deltaContracts -Selected $fixtureSelected -Bundle $deltaBundle -DeltaAllowlist $variantAllowlist
    $mixedFails = & $deltaFails $mixed
    Assert-True ($mixed.ExitCode -ne 0 -and (& $onlyDelta $mixed) -and $mixedFails.Count -eq 2 -and
        $mixedFails -ccontains "$unlisted$($variantLines[1])" -and
        $mixedFails -ccontains "[diff] FAIL: dex delta: the selected section [Fixture patch | Fourth patch] lists what this run didn't change: $($variantLines[0])") `
        "A run of Fixture patch alone passed with Other patch's mark in Model.`n$($mixed.Output -join "`n")"
    # A section stands in for another's line only when its patches take in all of the other's. Under
    # a run of three (the settings patch, which every contract set knows, as the third),
    # [Fixture patch + HushTumblr settings] names more patches than [Other patch | Third patch] but
    # not Other patch, so both of hushHelper's lines stay in effect: the current one passes and the
    # out-of-date one is stale, rather than hiding the current one.
    $threeSelected = New-Selection 'delta-three' @('Fixture patch', 'Other patch', 'HushTumblr settings')
    $overlapAllowlist = Join-Path $caseRoot 'delta-allowlist-overlap.txt'
    [IO.File]::WriteAllLines($overlapAllowlist, [string[]]($allowLines + '[Fixture patch + HushTumblr settings]' + $oldHashLine), [Text.UTF8Encoding]::new($false))
    $overlap = Invoke-DexDiff -Clean $deltaClean -Patched $deltaGood -Allowlist $emptyAllowlist -Name 'delta-overlap' -Contracts $deltaContracts `
        -Selected $threeSelected -Bundle $deltaBundle -DeltaAllowlist $overlapAllowlist
    $overlapFails = & $deltaFails $overlap
    Assert-True ($overlap.ExitCode -ne 0 -and (& $onlyDelta $overlap) -and $overlapFails.Count -eq 1 -and
        $overlapFails -ccontains "[diff] FAIL: dex delta: the selected section [Fixture patch + HushTumblr settings] lists what this run didn't change: $oldHashLine") `
        "A section naming more patches, but not all of another's, hid that one's line.`n$($overlap.Output -join "`n")"
    # A bridge's joined variant written per alternative, [A + C | B + C], stands in for the bridge
    # [A | B] when all three run, though no one alternative of it takes in both of the bridge's.
    $bridgeAllowlist = Join-Path $caseRoot 'delta-allowlist-bridge.txt'
    [IO.File]::WriteAllLines($bridgeAllowlist, [string[]]($allowLines + '[Other patch | Fixture patch]' + $variantLines[0] +
        '[Other patch + HushTumblr settings | Fixture patch + HushTumblr settings]' + $variantLines[1]), [Text.UTF8Encoding]::new($false))
    $bridge = Invoke-DexDiff -Clean $deltaClean -Patched (Join-Path $caseRoot 'delta-variant-good.apk') -Allowlist $emptyAllowlist -Name 'delta-bridge' `
        -Contracts $deltaContracts -Selected $threeSelected -Bundle $deltaBundle -DeltaAllowlist $bridgeAllowlist
    Assert-True ($bridge.ExitCode -eq 0 -and (& $deltaFails $bridge).Count -eq 0) `
        "A bridge's joined variant didn't stand in for the bridge's own line.`n$($bridge.Output -join "`n")"
    # Two that don't stand in, each with Model's good line under one section and its subset line
    # under the other, so the subset line is stale: [Fixture patch + HushTumblr settings] takes in
    # one alternative of the bridge [Other patch | Fixture patch] but not the other, and two
    # spellings of the same bridge take in neither. A rule that let either one stand in would hide
    # the good line too, and fail on it as unlisted.
    $notCovering = @(
        @{ Name = 'delta-part-of-bridge'; Selected = $threeSelected; Good = '[Other patch | Fixture patch]'; Subset = '[Fixture patch + HushTumblr settings]' }
        @{ Name = 'delta-bridge-respelled'; Selected = $bothSelected; Good = '[Other patch | Fixture patch]'; Subset = '[Fixture patch | Fourth patch | Other patch]' })
    foreach ($case in $notCovering) {
        $caseAllowlist = Join-Path $caseRoot "$($case.Name).txt"
        [IO.File]::WriteAllLines($caseAllowlist, [string[]]($allowLines + $case.Good + $variantLines[1] + $case.Subset + $variantLines[0]),
            [Text.UTF8Encoding]::new($false))
        $run = Invoke-DexDiff -Clean $deltaClean -Patched (Join-Path $caseRoot 'delta-variant-good.apk') -Allowlist $emptyAllowlist -Name $case.Name `
            -Contracts $deltaContracts -Selected $case.Selected -Bundle $deltaBundle -DeltaAllowlist $caseAllowlist
        $fails = & $deltaFails $run
        Assert-True ($run.ExitCode -ne 0 -and (& $onlyDelta $run) -and $fails.Count -eq 1 -and
            $fails -ccontains "[diff] FAIL: dex delta: the selected section $($case.Subset) lists what this run didn't change: $($variantLines[0])") `
            "$($case.Name): a section that doesn't take in another's stood in for it, or the line it left in effect wasn't stale.`n$($run.Output -join "`n")"
    }
    # Tumblr classes with copies in another dex entry: held to every copy, methods and all, in any
    # order. The same copies on both sides pass. A copy the patched APK adds fails however the first
    # one reads, with a selection or without, and so do a copy it drops and a copy whose method
    # changed its flags alone.
    $baseTwiceClean = New-DexApk -Name 'delta-clean-base-twice' -Entries ([ordered]@{
        'classes.dex' = (Get-Dex 'delta-clean'); 'classes2.dex' = (Get-Dex 'delta-base-copy') })
    $baseTwice = Invoke-DexDiff -Clean $baseTwiceClean `
        -Patched (New-DexApk -Name 'delta-base-twice' -Entries ([ordered]@{ 'classes.dex' = (Get-Dex 'delta-good'); 'classes2.dex' = (Get-Dex 'delta-base-copy') })) `
        -Allowlist $emptyAllowlist -Name 'delta-base-twice' -Contracts $deltaContracts -Selected $bothSelected -Bundle $deltaBundle -DeltaAllowlist $deltaAllowlist
    Assert-True ($baseTwice.ExitCode -eq 0 -and (& $deltaFails $baseTwice).Count -eq 0) `
        "A Tumblr class copied alike on both sides failed the dex delta.`n$($baseTwice.Output -join "`n")"
    $modelTwiceApk = New-DexApk -Name 'delta-model-twice' -Entries ([ordered]@{ 'classes.dex' = (Get-Dex 'delta-good'); 'classes2.dex' = (Get-Dex 'delta-model-copy') })
    $twiceCases = @(
        @{ Name = 'delta-model-twice'; Clean = $deltaClean; Patched = $modelTwiceApk; Selected = ''; Type = 'Lcom/fixture/Model;' }
        # Model's implements line goes with the refusal rather than standing as stale.
        @{ Name = 'delta-model-twice-selected'; Clean = $deltaClean; Patched = $modelTwiceApk; Selected = $bothSelected; Type = 'Lcom/fixture/Model;' }
        # The clean side's classes2.dex adds a copy of Model to Base's, the patched side's has Base's alone.
        @{ Name = 'delta-model-clean-twice'; Selected = $bothSelected; Type = 'Lcom/fixture/Model;'
            Clean = (New-DexApk -Name 'delta-clean-model-twice' -Entries ([ordered]@{ 'classes.dex' = (Get-Dex 'delta-clean'); 'classes2.dex' = (Get-Dex 'delta-model-base-copy') }))
            Patched = (New-DexApk -Name 'delta-good-base-copy' -Entries ([ordered]@{ 'classes.dex' = (Get-Dex 'delta-good'); 'classes2.dex' = (Get-Dex 'delta-base-copy') })) }
        @{ Name = 'delta-base-final'; Clean = $baseTwiceClean; Selected = $bothSelected; Type = 'Lcom/fixture/Base;'
            Patched = (New-DexApk -Name 'delta-base-final' -Entries ([ordered]@{ 'classes.dex' = (Get-Dex 'delta-good'); 'classes2.dex' = (Get-Dex 'delta-base-copy-final') })) })
    foreach ($case in $twiceCases) {
        $run = Invoke-DexDiff -Clean $case.Clean -Patched $case.Patched -Allowlist $emptyAllowlist -Name $case.Name -Contracts $deltaContracts `
            -Selected $case.Selected -Bundle $deltaBundle -DeltaAllowlist $deltaAllowlist
        Assert-True ($run.ExitCode -ne 0 -and (& $onlyDelta $run) -and (& $deltaFails $run).Count -eq 1 -and
            ($run.Output -join "`n").Contains("dex delta: $($case.Type) is defined more than once, so it can't be held one definition at a time")) `
            "The dex delta didn't refuse $($case.Name) for its copies of $($case.Type) alone.`n$($run.Output -join "`n")"
    }
    foreach ($caseLine in Get-Content -LiteralPath (Join-Path $dexDir 'delta-cases.txt')) {
        $values = $caseLine -split '\|', 4
        $selection = if ($values[1] -ceq 'Fixture patch') { $fixtureSelected } else { $bothSelected }
        $run = Invoke-DexDiff -Clean $deltaClean -Patched (New-DexApk -Name $values[0] -Entries ([ordered]@{ 'classes.dex' = (Get-Dex $values[0]) })) `
            -Allowlist $emptyAllowlist -Name $values[0] -Contracts $deltaContracts -Selected $selection -Bundle $deltaBundle -DeltaAllowlist $deltaAllowlist
        $fails = & $deltaFails $run
        # One fault each, so none of them reads as a build patched from another bundle.
        Assert-True ($run.ExitCode -ne 0 -and (& $onlyDelta $run) -and $fails.Count -eq [int]$values[2] -and
            @($fails | Where-Object { $_.StartsWith("[diff] FAIL: $($values[3])") }).Count -eq 1 -and
            -not ($run.Output -join "`n").Contains('Hand that one over with -Bundle.')) `
            "The dex delta did not refuse $($values[0]) for what it changed ($($values[3])), or blamed the bundle for it.`n$($run.Output -join "`n")"
    }
    # A bundle main moved on from since the APK was patched: each Tumblr extension class has a
    # method the build lacks. Each is a finding, and one line more says the bundle may be the wrong one.
    $movedBundle = New-PatchBundle -Name 'delta-moved' -Extensions ([ordered]@{ 'extensions/shared.mpe' = $bothExtensions['extensions/shared.mpe']
        'extensions/tumblr.mpe' = (Join-Path $dexDir 'delta-tumblr-moved.mpe') })
    $moved = Invoke-DexDiff -Clean $deltaClean -Patched $deltaGood -Allowlist $emptyAllowlist -Name 'delta-moved' -Contracts $deltaContracts `
        -Selected $bothSelected -Bundle $movedBundle -DeltaAllowlist $deltaAllowlist
    Assert-True ($moved.ExitCode -ne 0 -and (& $onlyDelta $moved) -and (& $deltaFails $moved).Count -eq 3 -and
        $moved.Output -ccontains ("[diff] dex delta: 3 of the bundle's 5 extension classes differ between it and the patched APK, so the APK may have " +
            'been patched from another build of the bundle than delta-moved.mpp. Hand that one over with -Bundle.')) `
        "A bundle that moved on from the patched APK wasn't named as maybe the wrong one.`n$($moved.Output -join "`n")"
    # The bundle itself: no extensions, no Version, a class two of its extensions define two ways,
    # another Version than the build answers, and a patched APK carrying one of its classes twice.
    $deltaBundles = @(
        @{ Name = 'delta-bundle-no-extensions'; Extensions = [ordered]@{}; Version = '9.9.9'
            Says = 'dex delta: the bundle delta-bundle-no-extensions.mpp carries no extensions/*.mpe' }
        @{ Name = 'delta-bundle-no-version'; Extensions = $bothExtensions; Version = ''; Says = 'dex delta: the bundle delta-bundle-no-version.mpp names no Version' }
        @{ Name = 'delta-bundle-conflict'; Version = '9.9.9'; Says = "dex delta: the bundle's extensions define $plain twice, differently"
            Extensions = [ordered]@{ 'extensions/shared.mpe' = $bothExtensions['extensions/shared.mpe']; 'extensions/tumblr.mpe' = $bothExtensions['extensions/tumblr.mpe']
                'extensions/zconflict.mpe' = (Join-Path $dexDir 'delta-conflict.mpe') } }
        @{ Name = 'delta-bundle-other-version'; Extensions = $bothExtensions; Version = '9.9.8'
            Says = "dex delta: no compiled contract validates this and no selected section of the dex delta allowlist lists it: method ${own}shared/Utils;->getPatchesReleaseVersion()Ljava/lang/String; " })
    foreach ($case in $deltaBundles) {
        $caseBundle = New-PatchBundle -Name $case.Name -Extensions $case.Extensions -Version $case.Version
        $run = Invoke-DexDiff -Clean $deltaClean -Patched $deltaGood -Allowlist $emptyAllowlist -Name $case.Name -Contracts $deltaContracts `
            -Selected $bothSelected -Bundle $caseBundle -DeltaAllowlist $deltaAllowlist
        Assert-True ($run.ExitCode -ne 0 -and (& $onlyDelta $run) -and @((& $deltaFails $run) | Where-Object { $_.StartsWith("[diff] FAIL: $($case.Says)") }).Count -eq 1) `
            "The dex delta did not refuse $($case.Name).`n$($run.Output -join "`n")"
    }
    $twice = Invoke-DexDiff -Clean $deltaClean -Patched (New-DexApk -Name 'delta-plain-twice' -Entries ([ordered]@{
        'classes.dex' = (Get-Dex 'delta-good'); 'classes2.dex' = (Get-Dex 'delta-plain') })) -Allowlist $emptyAllowlist -Name 'delta-plain-twice' `
        -Contracts $deltaContracts -Selected $bothSelected -Bundle $deltaBundle -DeltaAllowlist $deltaAllowlist
    Assert-True ($twice.ExitCode -ne 0 -and (& $onlyDelta $twice) -and (& $deltaFails $twice).Count -eq 1 -and
        ($twice.Output -join "`n").Contains("dex delta: $plain is defined more than once in the patched APK")) `
        "A patched APK carrying an extension class twice passed the dex delta.`n$($twice.Output -join "`n")"
    # An allowlist line the report doesn't print, or one out of place, stops the run before anything is read.
    $hash = '0' * 64
    $malformed = @(
        @{ Name = 'before-section'; Lines = @("method Lcom/fixture/Host;->answer()Z $hash"); Line = 1 }
        @{ Name = 'unknown-kind'; Lines = @('[Fixture patch]', "methods Lcom/fixture/Host;->answer()Z $hash"); Line = 2 }
        @{ Name = 'short-hash'; Lines = @('[Fixture patch]', 'method Lcom/fixture/Host;->answer()Z 0123'); Line = 2 }
        @{ Name = 'upper-hash'; Lines = @('[Fixture patch]', "method Lcom/fixture/Host;->answer()Z $('A' * 64)"); Line = 2 }
        @{ Name = 'implements-no-type'; Lines = @('[Fixture patch]', 'implements Lcom/fixture/Model; FixtureFace'); Line = 2 }
        @{ Name = 'line-twice'; Lines = @('[Fixture patch]', "field Lcom/fixture/Host;->hushFlag:Z $hash", "field Lcom/fixture/Host;->hushFlag:Z $hash"); Line = 3 }
        @{ Name = 'section-twice'; Lines = @('[Fixture patch]', '# again', '[Fixture patch]'); Line = 3 }
        @{ Name = 'section-unnamed'; Lines = @('[]'); Line = 1 }
        @{ Name = 'section-padded'; Lines = @('[ Fixture patch]'); Line = 1 }
        @{ Name = 'method-no-owner'; Lines = @('[Fixture patch]', "method answer()Z $hash"); Line = 2 }
        @{ Name = 'field-no-owner'; Lines = @('[Fixture patch]', "field hushFlag:Z $hash"); Line = 2 }
        @{ Name = 'section-half-joined'; Lines = @('[Fixture patch + ]'); Line = 1 }
        @{ Name = 'section-empty-alternative'; Lines = @('[Fixture patch |  | Other patch]'); Line = 1 }
        @{ Name = 'section-empty-joined'; Lines = @('[Fixture patch +  + Other patch]'); Line = 1 }
        @{ Name = 'section-joined-to-itself'; Lines = @('[Other patch | Fixture patch + Fixture patch]'); Line = 1 })
    foreach ($case in $malformed) {
        $file = Join-Path $caseRoot "delta-malformed-$($case.Name).txt"
        [IO.File]::WriteAllLines($file, [string[]]$case.Lines, [Text.UTF8Encoding]::new($false))
        $run = Invoke-DexDiff -Clean $deltaClean -Patched $deltaGood -Allowlist $emptyAllowlist -Name "delta-malformed-$($case.Name)" `
            -Contracts $deltaContracts -Selected $bothSelected -Bundle $deltaBundle -DeltaAllowlist $file
        Assert-True ($run.ExitCode -ne 0 -and ($run.Output -join "`n").Contains("delta-malformed-$($case.Name).txt line $($case.Line): ") -and
            -not (Test-Path -LiteralPath $run.Report)) "The malformed dex delta allowlist $($case.Name) was read.`n$($run.Output -join "`n")"
    }
    foreach ($case in @(@{ Name = 'delta-no-bundle'; Bundle = (Join-Path $caseRoot 'no-such.mpp'); Allow = $deltaAllowlist; Says = 'Bundle not found: ' }
            @{ Name = 'delta-no-allowlist'; Bundle = $deltaBundle; Allow = (Join-Path $caseRoot 'no-such.txt'); Says = 'Dex delta allowlist not found: ' })) {
        $run = Invoke-DexDiff -Clean $deltaClean -Patched $deltaGood -Allowlist $emptyAllowlist -Name $case.Name -Contracts $deltaContracts `
            -Selected $bothSelected -Bundle $case.Bundle -DeltaAllowlist $case.Allow
        Assert-True ($run.ExitCode -ne 0 -and ($run.Output -join "`n").Contains($case.Says) -and -not (Test-Path -LiteralPath $run.Report)) `
            "DexDiff ran $($case.Name) without what it holds the delta to.`n$($run.Output -join "`n")"
    }
    # A Tumblr method a compiled contract validated needs no line: the root mute family's build,
    # with its own extension classes as the bundle. What else it changed is listed under its patch,
    # and the same lines under another patch's section don't count.
    $rootMuteMpe = Join-Path $caseRoot 'root-mute.mpe'
    Invoke-Checked -Program $Java -Arguments @('-Xmx256m', '-cp', $classPath, 'DexDeltaFixture', 'extract', (Get-Dex 'feature-root-mute-good'), $rootMuteMpe) `
        -Description 'DexDeltaFixture extract'
    $rootMuteDelta = @{ Clean = (Get-FeatureApk 'root-mute-clean'); Patched = (Get-FeatureApk 'feature-root-mute-good'); Allowlist = $emptyAllowlist
        Contracts = $featureContracts; Selected = (Join-Path $dexDir 'feature-root-mute-good.selected')
        Bundle = (New-PatchBundle -Name 'root-mute' -Extensions ([ordered]@{ 'extensions/tumblr.mpe' = $rootMuteMpe })) }
    $rootMuteFirst = Invoke-DexDiff @rootMuteDelta -Name 'root-mute-delta-first' -DeltaAllowlist $noSections
    $rootMuteLines = & $deltaLines $rootMuteFirst
    $rootMuteValidated = if ((& $deltaSummary $rootMuteFirst) -match '^\[diff\] dex delta: (\d+) Tumblr methods validated') { [int]$Matches[1] } else { 0 }
    Assert-True ($rootMuteFirst.ExitCode -ne 0 -and (& $onlyDelta $rootMuteFirst) -and $rootMuteValidated -gt 0 -and
        $rootMuteLines.Count -eq (& $deltaFails $rootMuteFirst).Count) `
        "The root mute build's validated methods weren't counted, or it failed for more than its unlisted changes.`n$($rootMuteFirst.Output -join "`n")"
    foreach ($section in 'Mute posts locally', 'Hide ads') {
        $file = Join-Path $caseRoot "root-mute-delta-$($section -replace ' ', '-').txt"
        [IO.File]::WriteAllLines($file, [string[]](@("[$section]") + $rootMuteLines), [Text.UTF8Encoding]::new($false))
        $run = Invoke-DexDiff @rootMuteDelta -Name "root-mute-delta-$($section -replace ' ', '-')" -DeltaAllowlist $file
        $listedPasses = $section -ceq 'Mute posts locally'
        Assert-True ($(if ($listedPasses) { $run.ExitCode -eq 0 -and (& $deltaFails $run).Count -eq 0 -and
                    (& $deltaSummary $run) -match "^\[diff\] dex delta: $rootMuteValidated Tumblr methods validated" }
                else { $run.ExitCode -ne 0 -and (& $onlyDelta $run) -and (& $deltaLines $run).Count -eq $rootMuteLines.Count })) `
            "The root mute build's changes listed under [$section] were judged wrong.`n$($run.Output -join "`n")"
    }

    $bad = [ordered]@{
        'bad-branch' = 'branch'
        'bad-branch-self' = 'branch'
        'bad-switch-case' = 'branch'
        'bad-switch-to-payload' = 'branch'
        'bad-switch-to-result' = 'branch'
        'bad-goto-to-payload' = 'branch'
        'bad-goto-to-array-payload' = 'branch'
        'bad-switch-to-array-payload' = 'branch'
        'bad-sparse-case-to-payload' = 'branch'
        'bad-packed-switch-sparse-table' = 'branch'
        'bad-sparse-switch-packed-table' = 'branch'
        'bad-fallthrough-into-payload' = 'branch'
        'bad-payload-at-entry' = 'branch'
        'bad-branch-to-result' = 'branch'
        'bad-walk-off-end' = 'branch'
        'bad-goto-to-handler' = 'branch'
        'bad-fallthrough-handler' = 'try'
        'bad-move-exception-entry' = 'try'
        'bad-wide-high-clobber' = 'width'
        'bad-wide-high-clobber-branch' = 'width'
        'bad-wide-high-clobber-loop' = 'width'
        'bad-wide-low-clobber' = 'width'
        'bad-wide-below-pair' = 'width'
        'bad-invoke-count' = 'invoke'
        'bad-wide-split' = 'invoke'
        'bad-static-parameter' = 'parameter'
        'bad-wide-parameter' = 'parameter'
        'bad-narrow-for-wide' = 'width'
        'bad-narrow-for-wide-branch' = 'width'
        'bad-narrow-shift' = 'width'
        'bad-wide-for-narrow' = 'width'
        'bad-conflict-if-eqz' = 'width'
        'bad-conflict-if-ne' = 'width'
        'bad-conflict-if-lt' = 'width'
        'bad-conflict-switch' = 'width'
        'bad-conflict-monitor-enter' = 'width'
        'bad-conflict-throw' = 'width'
        'bad-conflict-check-cast' = 'width'
        'bad-conflict-instance-of' = 'width'
        'bad-conflict-array-length' = 'width'
        'bad-conflict-new-array' = 'width'
        'bad-conflict-filled-new-array' = 'width'
        'bad-conflict-fill-array-data' = 'width'
        'bad-conflict-if-nez' = 'width'
        'bad-conflict-if-eq' = 'width'
        'bad-conflict-if-eq-second' = 'width'
        'bad-conflict-if-gez' = 'width'
        'bad-conflict-if-lt-second' = 'width'
        'bad-conflict-sparse-switch' = 'width'
        'bad-conflict-monitor-exit' = 'width'
        'bad-conflict-filled-new-array-range' = 'width'
        'bad-broken-high-if-eqz' = 'width'
        'bad-if-eq-int-object' = 'width'
        'bad-if-ne-object-int' = 'width'
        'bad-wide-if-eqz' = 'width'
        'bad-broken-low-move' = 'width'
        'bad-broken-high-move' = 'width'
        'bad-conflict-object-copy' = 'width'
        'bad-conflict-plain-copy' = 'width'
        'bad-zero-for-wide-branch' = 'width'
        'bad-move-wide-conflict' = 'width'
        'bad-move-result' = 'result'
        'bad-try-range' = 'try'
        'bad-try-handler' = 'try'
        'bad-try-handler-result' = 'try'
        'bad-try-handler-payload' = 'try'
        'bad-try-handler-array-payload' = 'try'
        'bad-register-added-helper' = 'register'
        'bad-register-wide-source' = 'register'
        'bad-register-own-wide' = 'register'
        'bad-register-changed' = 'register'
    }
    foreach ($shortcut in $shortcutCalls) { $bad["bad-shortcut-$($shortcut.Case)-left"] = 'contract' }
    $failures = @()
    $badResults = @{}
    foreach ($case in $bad.GetEnumerator()) {
        $apk = New-DexApk -Name $case.Key -Entries ([ordered]@{ 'classes.dex' = (Get-Dex $case.Key) })
        $result = Invoke-DexDiff -Clean $cleanApk -Patched $apk -Allowlist $emptyAllowlist `
            -Name $case.Key -Contracts $contracts
        $badResults[$case.Key] = $result
        $findings = Get-Findings $result
        $others = @($findings.Categories | Where-Object { $_ -ne $case.Value })
        if ($result.ExitCode -eq 0) {
            $failures += "$($case.Key) was accepted"
        } elseif ($findings.Categories.Count -eq 0) {
            $failures += "$($case.Key) failed without a $($case.Value) finding: $($result.Output -join ' | ')"
        } elseif ($others.Count -ne 0) {
            $failures += "$($case.Key) failed for more than $($case.Value): $($findings.Fails -join ' | ')"
        } elseif ((Get-Content -LiteralPath $result.Report -Raw) -notmatch "FAIL  $($case.Value): ") {
            $failures += "$($case.Key)'s report did not list its finding"
        }
    }
    if ($failures.Count -ne 0) { throw ($failures -join "`n") }

    # Each shortcut build fails on its own call's no-call rule alone, naming the one method that still
    # makes the call, so a rule that fires for another call, or for every call, fails here too.
    foreach ($shortcut in $shortcutCalls) {
        $name = "bad-shortcut-$($shortcut.Case)-left"
        $fails = @((Get-Findings $badResults[$name]).Fails)
        $expected = "[diff] FAIL: contract: $($shortcut.Callee) is still called outside Lapp/hushtumblr/extension/, in $($shortcut.Site)"
        Assert-True ($fails.Count -eq 1 -and $fails[0] -ceq $expected) `
            "$name did not fail with its own no-call finding alone.`nExpected: $expected`nGot:`n$($fails -join "`n")"
        foreach ($other in $shortcutCalls) {
            $count = if ($other.Call -eq $shortcut.Call) { '1 call site, in ' } else { '0 call sites' }
            Assert-True (($badResults[$name].Output -join "`n") -match [regex]::Escape(
                "no-call $($other.Callee) outside Lapp/hushtumblr/extension/: $count")) `
                "$name reported $($other.Call) wrong: expected '$count'.`n$($badResults[$name].Output -join "`n")"
        }
    }

    # A register out of range names the instruction, the register it reaches and the count, in the
    # method it sits in. Each FAIL line has to be one of these.
    $registerFindings = [ordered]@{
        'bad-register-added-helper' = @('*register: const/4 at 0 reaches v1, and the method declares 1 register  in Lfixture/Host;->helper()V')
        'bad-register-wide-source' = @('*register: move-wide at 0 reaches v2, and the method declares 2 registers  in Lfixture/Host;->copyWide()V')
        'bad-register-own-wide' = @(('*register: const-wide/16 at 0 reaches v2, and the method declares 2 registers  in ' +
            'Lapp/hushtumblr/extension/tumblr/fixture/Pack;->pack()V'))
        'bad-register-changed' = @(
            '*register: move-result at 3 reaches v4, and the method declares 4 registers  in Lfixture/Host;->addItem(*',
            '*register: if-eqz at 4 reaches v4, and the method declares 4 registers  in Lfixture/Host;->addItem(*')
    }
    foreach ($case in $registerFindings.GetEnumerator()) {
        $fails = @((Get-Findings $badResults[$case.Key]).Fails)
        $unmatched = @($fails | Where-Object { $line = $_; @($case.Value | Where-Object { $line -like $_ }).Count -eq 0 })
        $missing = @($case.Value | Where-Object { $pattern = $_; @($fails | Where-Object { $_ -like $pattern }).Count -eq 0 })
        Assert-True ($fails.Count -eq $case.Value.Count -and $unmatched.Count -eq 0 -and $missing.Count -eq 0) `
            "$($case.Key) did not fail with the findings expected.`nExpected:`n$($case.Value -join "`n")`nGot:`n$($fails -join "`n")"
    }
    # The added helper is read against its own count in the report too, beside the extension's
    # methods, which were the only added ones read there before.
    $helperReport = Get-Content -LiteralPath $badResults['bad-register-added-helper'].Report -Raw
    Assert-True ($helperReport -match '(?m)^==== added Lfixture/Host;->helper\(\)V\r?$' -and
        $helperReport -match 'const/4 v1, #0 \|maxreg=1   <<< REGISTER >= registerCount') `
        "The report did not hold the helper added to a host class to its register count.`n$helperReport"
    Assert-True (($badResults['bad-register-added-helper'].Output -join "`n") -match 'injected lines naming an out-of-range register: 1') `
        "The helper added to a host class was not counted among the out-of-range lines.`n$($badResults['bad-register-added-helper'].Output -join "`n")"

    # Without a contract file the structural checks still run; only the call-site rules are off.
    $noContract = Invoke-DexDiff -Clean $cleanApk -Patched (Join-Path $caseRoot 'bad-shortcut-push-left.apk') `
        -Allowlist $emptyAllowlist -Name 'no-contract-file'
    Assert-True ($noContract.ExitCode -eq 0) `
        "A build with a shortcut call left in the app's code failed with no contract to hold it to.`n$($noContract.Output -join "`n")"
    $noContractBranch = Invoke-DexDiff -Clean $cleanApk -Patched (Join-Path $caseRoot 'bad-branch.apk') `
        -Allowlist $emptyAllowlist -Name 'no-contract-branch'
    Assert-True ($noContractBranch.ExitCode -ne 0) 'A bad branch passed when no contract file was given.'

    $badContract = Join-Path $caseRoot 'bad-contract.txt'
    [System.IO.File]::WriteAllText($badContract, "single-call hide`n")
    $unreadable = Invoke-DexDiff -Clean $cleanApk -Patched (Join-Path $caseRoot 'good.apk') `
        -Allowlist $emptyAllowlist -Name 'bad-contract' -Contracts $badContract
    Assert-True ($unreadable.ExitCode -ne 0 -and ($unreadable.Output -join "`n") -match 'Invalid contract line 1') `
        "A malformed contract line was accepted.`n$($unreadable.Output -join "`n")"
    # A malformed line of every kind the grammar knows, each broken one way. The method references
    # are neutral: what's tried is the parser, which DexDiff keeps for every kind.
    $stubRef = 'Lapp/hushtumblr/extension/tumblr/fixture/Stub;->fill(Ljava/lang/Object;)Ljava/lang/Object;'
    $hookRef = 'Lapp/hushtumblr/extension/tumblr/fixture/Hook;->ask(I)Z'
    $standInRef = 'Lapp/hushtumblr/extension/tumblr/fixture/Hook;->standIn(Landroid/view/View;)V'
    $afterRef = 'Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V'
    $shapeRef = '(Landroid/content/Context;Lfixture/Host;)V'
    $sendRef = 'Lapp/hushtumblr/extension/tumblr/fixture/Hook;->send(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V'
    $executeRef = 'Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V'
    foreach ($line in @(
            # first-call needs its method, "on" and a class descriptor.
            "first-call $stubRef on Host",
            "first-call $stubRef in Lfixture/Host;",
            'first-call fill on Lfixture/Host;',
            "start-call $hookRef in addItem",
            'start-call ask holding alpha',
            "start-call $hookRef holding",
            "start-call $hookRef holding alpha alpha",
            "start-call $hookRef in static holding alpha",
            "start-call $hookRef in (I)Z",
            "start-call $hookRef in static (I)Z holding",
            "start-call $hookRef in sometimes (I)Z holding alpha",
            "start-call $hookRef in static I)Z holding alpha",
            "start-call $hookRef alpha holding alpha",
            "first-call $stubRef on-type-named Lfixture/Host;",
            "first-call $stubRef on-type-named",
            'first-call fill on-type-named HostUnit',
            "first-call $stubRef outside Lapp/hushtumblr/extension",
            'first-call fill outside Lapp/hushtumblr/extension/',
            "first-call $stubRef outside",
            'no-call Landroid/content/pm/ShortcutManager;->pushDynamicShortcut(Landroid/content/pm/ShortcutInfo;)V in Lapp/hushtumblr/extension/',
            'no-call pushDynamicShortcut outside Lapp/hushtumblr/extension/',
            'no-call Landroid/content/pm/ShortcutManager;->pushDynamicShortcut(Landroid/content/pm/ShortcutInfo;)V outside',
            'no-call Landroid/content/pm/ShortcutManager;->pushDynamicShortcut(Landroid/content/pm/ShortcutInfo;)V outside Lapp/hushtumblr/extension',
            "next-call $standInRef after setOnClickListener holding alpha",
            "next-call standIn after $afterRef holding alpha",
            "next-call $standInRef after $afterRef in addItem",
            "next-call $standInRef before $afterRef holding alpha",
            "next-call $standInRef after $afterRef holding",
            "next-call $standInRef holding alpha",
            "next-call $standInRef after $afterRef holding alpha alpha",
            "next-call $standInRef after $afterRef in static holding alpha",
            "next-call $standInRef after $afterRef in static $shapeRef",
            "next-call $standInRef after $afterRef in sometimes $shapeRef holding alpha",
            "next-call $standInRef after $afterRef in static Landroid/content/Context;)V holding alpha",
            "next-call $standInRef after $afterRef alpha holding alpha",
            "sole-call $sendRef holding alpha beta",
            "sole-call $sendRef replacing execute holding alpha beta",
            "sole-call send replacing $executeRef holding alpha beta",
            "sole-call $sendRef after $executeRef holding alpha beta",
            "sole-call $sendRef replacing $executeRef holding",
            "sole-call $sendRef replacing $executeRef holding beta beta",
            "sole-call $sendRef replacing $executeRef in instance holding beta",
            "sole-call $sendRef replacing $executeRef in instance ()V",
            'once-call ask holding alpha beta',
            "once-call $hookRef holding",
            "once-call $hookRef holding alpha alpha",
            "once-call $hookRef after $executeRef holding alpha",
            "once-call $hookRef in instance ()V",
            "once-call $hookRef in sometimes ()V holding alpha",
            "once-call $hookRef in instance holding alpha",
            # A family may leave only its capability column empty, and only all of it.
            'family|hideAds|Hide ads',
            'family||Hide ads|feedAds',
            'family|hideAds||feedAds',
            'family|hideAds|Hide ads|feedAds,',
            'family|hideAds|Hide ads|,',
            'family|hideAds|Hide ads| feedAds',
            'family|hideAds|Hide ads||')) {
        [System.IO.File]::WriteAllText($badContract, "# a comment line first`n$line`n")
        $unreadableFirstCall = Invoke-DexDiff -Clean $cleanApk -Patched (Join-Path $caseRoot 'good.apk') `
            -Allowlist $emptyAllowlist -Name 'bad-first-call-contract' -Contracts $badContract
        Assert-True ($unreadableFirstCall.ExitCode -ne 0 -and ($unreadableFirstCall.Output -join "`n") -match 'Invalid contract line 2') `
            "A malformed contract line was accepted: $line`n$($unreadableFirstCall.Output -join "`n")"
    }

    $removedMethodApk = New-DexApk -Name 'removed-method' -Entries ([ordered]@{ 'classes.dex' = (Get-Dex 'removed-method') })
    $methodResult = Invoke-DexDiff -Clean $cleanApk -Patched $removedMethodApk `
        -Allowlist $emptyAllowlist -Name 'removed-method' -Contracts $contracts
    Assert-True ($methodResult.ExitCode -ne 0) 'A removed host method was accepted.'
    Assert-True (($methodResult.Output -join "`n") -match 'Lfixture/Host;->removable\(\)V') `
        'The removed-method failure did not name the method.'

    $methodAllowlist = Join-Path $caseRoot 'method-allowlist.txt'
    [System.IO.File]::WriteAllText($methodAllowlist, "method Lfixture/Host;->removable()V`n")
    $methodAllowed = Invoke-DexDiff -Clean $cleanApk -Patched $removedMethodApk `
        -Allowlist $methodAllowlist -Name 'allowed-method' -Contracts $contracts
    Assert-True ($methodAllowed.ExitCode -eq 0) "An exact reviewed method removal was rejected.`n$($methodAllowed.Output -join "`n")"

    $staleAllowlist = Join-Path $caseRoot 'stale-allowlist.txt'
    [System.IO.File]::WriteAllText($staleAllowlist, "method Lfixture/Host;->notRemoved()V`n")
    $staleResult = Invoke-DexDiff -Clean $cleanApk -Patched $removedMethodApk `
        -Allowlist $staleAllowlist -Name 'stale-allowlist' -Contracts $contracts
    Assert-True ($staleResult.ExitCode -ne 0) 'A stale removal allowlist entry was accepted.'
    Assert-True (($staleResult.Output -join "`n") -match 'notRemoved') `
        'The stale allowlist failure did not name the stale entry.'
    Assert-True ((Get-Content -LiteralPath $staleResult.Report -Raw) -match 'notRemoved') `
        'The stale allowlist report did not name the stale entry.'

    $dexCleanApk = New-DexApk -Name 'dex-clean' -Entries ([ordered]@{
        'classes.dex' = (Get-Dex 'clean')
        'classes2.dex' = (Get-Dex 'secondary')
    })
    $dexPatchedApk = New-DexApk -Name 'dex-patched' -Entries ([ordered]@{
        'classes.dex' = (Get-Dex 'good-with-secondary')
    })
    $dexResult = Invoke-DexDiff -Clean $dexCleanApk -Patched $dexPatchedApk `
        -Allowlist $emptyAllowlist -Name 'removed-dex' -Contracts $contracts
    Assert-True ($dexResult.ExitCode -ne 0) 'A removed DEX was accepted.'
    Assert-True (($dexResult.Output -join "`n") -match 'classes2\.dex') `
        'The removed-DEX failure did not name the DEX.'
    $dexAllowlist = Join-Path $caseRoot 'dex-allowlist.txt'
    [System.IO.File]::WriteAllText($dexAllowlist, "dex classes2.dex`n")
    $dexAllowed = Invoke-DexDiff -Clean $dexCleanApk -Patched $dexPatchedApk `
        -Allowlist $dexAllowlist -Name 'allowed-dex' -Contracts $contracts
    Assert-True ($dexAllowed.ExitCode -eq 0) "An exact reviewed DEX removal was rejected.`n$($dexAllowed.Output -join "`n")"

    # A signature defined in two dex entries, the way the Facebook sibling's 580 merged bundle
    # defined its browser's methods: the host class again in a later entry, as it ships, on both sides. The
    # patch's definition in classes.dex is the one held to the checks, so the good build passes
    # with the same host changes as on its own, and the guard's answer put out of range fails as a
    # register finding and nothing else. Read one body per signature, the copy would stand for both.
    $copyEntry = 'lib/arm64-v8a/libcopy.dex.so'
    $twiceClean = New-DexApk -Name 'twice-clean' -Entries ([ordered]@{
        'classes.dex' = (Get-Dex 'clean'); $copyEntry = (Get-Dex 'host-copy') })
    $twiceBad = Invoke-DexDiff -Clean $twiceClean -Patched (New-DexApk -Name 'twice-bad' -Entries ([ordered]@{
        'classes.dex' = (Get-Dex 'bad-register-changed'); $copyEntry = (Get-Dex 'host-copy') })) `
        -Allowlist $emptyAllowlist -Name 'twice-bad' -Contracts $contracts
    $twiceBadFindings = Get-Findings $twiceBad
    Assert-True ($twiceBad.ExitCode -ne 0 -and $twiceBadFindings.Categories.Count -ne 0 -and
        @($twiceBadFindings.Categories | Where-Object { $_ -ne 'register' }).Count -eq 0) `
        "An out-of-range register in classes.dex, with an untouched copy of its method in another entry, wasn't refused as a register finding alone.`n$($twiceBad.Output -join "`n")"
    $twiceGood = Invoke-DexDiff -Clean $twiceClean -Patched (New-DexApk -Name 'twice-good' -Entries ([ordered]@{
        'classes.dex' = (Get-Dex 'good'); $copyEntry = (Get-Dex 'host-copy') })) `
        -Allowlist $emptyAllowlist -Name 'twice-good' -Contracts $contracts -Base $cleanApk
    $twiceGoodText = $twiceGood.Output -join "`n"
    Assert-True ($twiceGood.ExitCode -eq 0 -and (Get-Findings $twiceGood).Fails.Count -eq 0) `
        "The good build with a second copy of the host class failed.`n$twiceGoodText"
    Assert-True ($twiceGoodText -match "the clean APK carries clean\.apk's classes\*\.dex byte for byte") `
        "A merge carrying its base's classes.dex and a split's dex under another name wasn't matched to the base.`n$twiceGoodText"
    Assert-True ($twiceGoodText -match 'signatures defined in more than one dex entry: clean 6, patched 6') `
        "The host class's six methods were not counted as defined twice.`n$twiceGoodText"
    $changedAlone = [regex]::Match(($good.Output -join "`n"), 'host methods changed: (\d+)').Groups[1].Value
    Assert-True ($changedAlone -and $twiceGoodText -match "host methods changed: $changedAlone\b") `
        "The good build with a second copy of the host class didn't change the $changedAlone host methods it changes alone.`n$twiceGoodText"

    # A clean side carrying the bundle's own code is a patched build, whatever else differs.
    $patchedClean = Invoke-DexDiff -Clean (Join-Path $caseRoot 'good.apk') -Patched (Join-Path $caseRoot 'bad-branch.apk') `
        -Allowlist $emptyAllowlist -Name 'patched-clean' -Contracts $contracts
    Assert-True ($patchedClean.ExitCode -ne 0 -and ($patchedClean.Output -join "`n") -match
        'the clean APK carries \d+ methods under Lapp/hushtumblr/extension/ .*so it is a patched build') `
        "A clean side holding the bundle's code was accepted.`n$($patchedClean.Output -join "`n")"

    # Handed the signed base.apk, DexDiff holds the merge it reads to base.apk's classes*.dex as they
    # are, and no other classes*.dex; a split's dex under another name is what a merge adds. The
    # base itself as the clean side passes.
    $asBase = Invoke-DexDiff -Clean $cleanApk -Patched (Join-Path $caseRoot 'good.apk') `
        -Allowlist $emptyAllowlist -Name 'merge-is-base' -Contracts $contracts -Base $cleanApk
    Assert-True ($asBase.ExitCode -eq 0) "A clean APK held to itself as its base was refused.`n$($asBase.Output -join "`n")"
    $changedClean = New-DexApk -Name 'clean-changed' -Entries ([ordered]@{ 'classes.dex' = (Get-Dex 'clean-changed') })
    foreach ($case in @(
            @{ Name = 'merge-changes'; Clean = $changedClean; Base = $cleanApk; Says = 'changes classes.dex' },
            @{ Name = 'merge-adds'; Clean = $dexCleanApk; Base = $cleanApk; Says = 'adds classes2.dex' },
            @{ Name = 'merge-lacks'; Clean = $cleanApk; Base = $dexCleanApk; Says = 'lacks classes2.dex' })) {
        $refused = Invoke-DexDiff -Clean $case.Clean -Patched (Join-Path $caseRoot 'good.apk') `
            -Allowlist $emptyAllowlist -Name $case.Name -Contracts $contracts -Base $case.Base
        $expected = "[diff] FAIL: the clean APK $(Split-Path -Leaf $case.Clean) doesn't carry " +
            "$(Split-Path -Leaf $case.Base)'s code as it is: it $($case.Says)."
        Assert-True ($refused.ExitCode -ne 0 -and @($refused.Output | Where-Object { $_.StartsWith($expected) }).Count -eq 1) `
            "A merge that $($case.Says) was not refused for it.`n$($refused.Output -join "`n")"
    }

    $same = Invoke-DexDiff -Clean $cleanApk -Patched $cleanApk -Allowlist $emptyAllowlist `
        -Name 'same-file' -Contracts $contracts
    Assert-True ($same.ExitCode -ne 0 -and ($same.Output -join "`n") -match 'no host method differs') `
        'One APK compared with itself was accepted.'
} finally {
    if ($caseRoot.StartsWith($requiredPrefix, [System.StringComparison]::OrdinalIgnoreCase) -and `
        (Test-Path -LiteralPath $caseRoot)) {
        Remove-Item -LiteralPath $caseRoot -Recurse -Force
    }
}

& (Join-Path $PSScriptRoot 'test-host-references.ps1') -Root $Root -Java $Java -DesktopJar $DesktopJar
if ($LASTEXITCODE -ne 0) { throw 'Host reference fixture contracts failed.' }
$global:LASTEXITCODE = 0
Write-Host "[scripts] injected-register and mutation contracts passed ($($bad.Count) structural bad fixtures, $($featureCases.Count) compiled family cases)"
