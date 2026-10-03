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
    and only the five Threads feature rules with selection and corruption fixtures; a malformed
    line of every kind the grammar knows is refused.
    The good build carries the joins, copies and reads ART accepts, a zero tested against
    an object among them, so a check made stricter still has to pass them. Each bad build has to
    fail with findings of its own category only, so a check that fires for the wrong reason fails
    here too. Removed methods and DEX entries, the removal allowlist, and the device tally
    comparison are held to what they did before.
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
    param([string]$Clean, [string]$Patched, [string]$Allowlist, [string]$Name, [string]$Contracts, [string]$Base, [string]$Features)
    $report = Join-Path $caseRoot "$Name-report.txt"
    $arguments = @('-Xmx1g', '-cp', $classPath, 'DexDiff', $Clean, $Patched, $report, $Allowlist)
    if ($Contracts) { $arguments += $Contracts }
    if ($Base) { $arguments += $Base }
    if ($Features) {
        if (-not $Base) { $arguments += '-' }
        $arguments += $Features
    }
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
    ("hushthreads-wiring-" + [guid]::NewGuid().ToString('N'))))
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
# version probe and plays DexDiff with the given exit code, an aapt2 that describes Threads
# 449.0.0.54.82, and an apksigner that reports a Threads signer from patches-list.json. With
# -JavaGone the apksigner also deletes that java, which leaves it unable to start by the time
# DexDiff runs, as a JDK replaced mid-run would. A Continue preference around the DexDiff call
# once turned exactly that into '[registers] success.'.
$standIns = [System.IO.Path]::GetFullPath((Join-Path ([System.IO.Path]::GetTempPath()) `
    ("hushthreads-verifier-standins-" + [guid]::NewGuid().ToString('N'))))
$standInPackage = 'com.instagram.barcelona'
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

function Invoke-VerifierWithStandIns {
    param([string]$Name, [int]$DexDiffExit, [switch]$JavaGone, [string[]]$SelectedPatches)
    $case = Join-Path $standIns $Name
    New-Item -ItemType Directory -Path $case -Force | Out-Null
    $javaStandIn = Join-Path $case 'java.cmd'
    Write-StandIn $javaStandIn @"
@echo off
if "%~1"=="-version" (
  echo openjdk version "21.0.0"
  exit /b 0
)
shift
shift
shift
shift
shift
shift
shift
shift
shift
shift
set "standInFamilies=%~1"
if not "%~2"=="" set "standInFamilies=%standInFamilies%,%~2"
if not "%~3"=="" set "standInFamilies=%standInFamilies%,%~3"
if not "%~4"=="" set "standInFamilies=%standInFamilies%,%~4"
if not "%~5"=="" set "standInFamilies=%standInFamilies%,%~5"
if not "%~6"=="" set "standInFamilies=%standInFamilies%,%~6"
echo [diff] requested families: %standInFamilies%
echo [diff] structural findings: 0
exit /b $DexDiffExit
"@
    Write-StandIn (Join-Path $case 'aapt2.cmd') @"
@echo off
echo   E: manifest (line=2)
echo     A: http://schemas.android.com/apk/res/android:versionCode(0x0101021b)=511908382
echo     A: http://schemas.android.com/apk/res/android:versionName(0x0101021c)="449.0.0.54.82" (Raw: "449.0.0.54.82")
echo     A: package="$standInPackage" (Raw: "$standInPackage")
exit /b 0
"@
    $delete = if ($JavaGone) { "del /f /q `"$javaStandIn`"" } else { 'rem' }
    Write-StandIn (Join-Path $case 'apksigner.bat') @"
@echo off
$delete
echo Signer #1 certificate SHA-256 digest: $($metaSigner[0])
exit /b 0
"@
    foreach ($file in 'clean.apk', 'patched.apk', 'desktop.jar') {
        [System.IO.File]::WriteAllText((Join-Path $case $file), 'stand-in')
    }
    $ErrorActionPreference = 'Continue'
    $global:LASTEXITCODE = 0
    function Quote-StandInArgument([string]$Value) { "'" + $Value.Replace("'", "''") + "'" }
    $parameters = [ordered]@{
        CleanApk = (Join-Path $case 'clean.apk'); PatchedApk = (Join-Path $case 'patched.apk')
        ReportPath = (Join-Path $case 'report.txt'); Java = $javaStandIn
        DesktopJar = (Join-Path $case 'desktop.jar'); Aapt2 = (Join-Path $case 'aapt2.cmd')
    }
    $invocation = '& ' + (Quote-StandInArgument $verifier)
    foreach ($parameter in $parameters.GetEnumerator()) {
        $invocation += ' -' + $parameter.Key + ' ' + (Quote-StandInArgument $parameter.Value)
    }
    # Native -File binding expands a splatted string[] into repeated named parameters. The
    # encoded invocation preserves the actual array, with every value quoted as a PS literal.
    if ($null -ne $SelectedPatches) {
        $invocation += ' -SelectedPatches @(' + (($SelectedPatches | ForEach-Object { Quote-StandInArgument $_ }) -join ',') + ')'
    }
    $encoded = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($invocation))
    $output = @(& (Get-Process -Id $PID).Path -NoProfile -NonInteractive -OutputFormat Text -ExecutionPolicy Bypass -EncodedCommand $encoded 2>&1 | ForEach-Object { "$_" })
    [pscustomobject]@{ ExitCode = $LASTEXITCODE; Output = $output; Text = $output -join "`n" }
}

try {
    New-Item -ItemType Directory -Path $standIns | Out-Null
    # Each run has to reach the DexDiff call, or a stand-in that broke early would pass the checks below.
    $reached = '(?m)^\[registers\] patched '
    $passed = Invoke-VerifierWithStandIns -Name 'passed' -DexDiffExit 0
    Assert-True ($passed.ExitCode -eq 0 -and $passed.Text -match $reached -and
        $passed.Output -contains '[registers] success.') `
        "The verifier did not pass a comparison DexDiff passed.`n$($passed.Text)"
    $suggestions = Invoke-VerifierWithStandIns -Name 'selected-suggestions' -DexDiffExit 0 -SelectedPatches @('Hide suggested users')
    Assert-True ($suggestions.ExitCode -eq 0 -and $suggestions.Text -match '(?m)^\[registers\] \[diff\] requested families: hideSuggestedUsers$') `
        "The verifier did not forward independent Suggested Users selection to DexDiff.`n$($suggestions.Text)"
    $allFamilies = Invoke-VerifierWithStandIns -Name 'selected-all-families' -DexDiffExit 0 -SelectedPatches @(
        'Hide ads', 'Hide suggested users', 'Sanitize sharing links', 'Open links in browser', 'Disable analytics', 'Restore screens on re-signed builds')
    Assert-True ($allFamilies.ExitCode -eq 0 -and $allFamilies.Text -match '(?m)^\[registers\] \[diff\] requested families: hideAds,hideSuggestedUsers,sanitizeSharingLinks,openLinksExternally,disableAnalytics,restoreTrust$') `
        "The verifier did not forward all independently selected families to DexDiff.`n$($allFamilies.Text)"
    $refused = Invoke-VerifierWithStandIns -Name 'refused' -DexDiffExit 1
    Assert-True ($refused.ExitCode -eq 1 -and $refused.Text -match $reached -and
        $refused.Text -match 'FAIL: the dex comparison exited 1' -and
        $refused.Output -notcontains '[registers] success.') `
        "The verifier did not fail a comparison DexDiff failed.`n$($refused.Text)"
    $gone = Invoke-VerifierWithStandIns -Name 'java-gone' -DexDiffExit 0 -JavaGone
    Assert-True ($gone.ExitCode -ne 0 -and $gone.Text -match $reached -and
        $gone.Output -notcontains '[registers] success.' -and $gone.Text -notmatch '\[registers\] static: ') `
        "The verifier passed a run whose java could not start for DexDiff (exit $($gone.ExitCode)).`n$($gone.Text)"
} finally {
    Remove-Item -LiteralPath $standIns -Recurse -Force -ErrorAction SilentlyContinue
}

$Java = Resolve-Java -Explicit $Java
$DesktopJar = Resolve-DesktopCli -Explicit $DesktopJar -Root $Root -Required
$javac = Join-Path (Split-Path -Parent $Java) 'javac.exe'
if (-not (Test-Path -LiteralPath $javac -PathType Leaf)) { throw "Required tool not found: $javac" }
$contracts = Join-Path $PSScriptRoot 'injected-mutation-contracts.txt'

$tempBase = [System.IO.Path]::GetFullPath([System.IO.Path]::GetTempPath())
$caseRoot = [System.IO.Path]::GetFullPath((Join-Path $tempBase `
    ("hushthreads-register-test-" + [guid]::NewGuid().ToString('N'))))
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
        (Join-Path $PSScriptRoot 'DexDiff.java'), (Join-Path $PSScriptRoot 'BadDexFixture.java')) `
        -Description 'javac for DexDiff and its fixtures'
    $classPath = $DesktopJar + [System.IO.Path]::PathSeparator + $classes
    $dexDir = Join-Path $caseRoot 'dex'
    Invoke-Checked -Program $Java -Arguments @('-cp', $classPath, 'BadDexFixture', $dexDir) `
        -Description 'BadDexFixture'
    function Get-Dex([string]$Name) { Join-Path $dexDir "$Name.dex" }

    $emptyAllowlist = Join-Path $caseRoot 'empty-allowlist.txt'
    [System.IO.File]::WriteAllText($emptyAllowlist, "# nothing reviewed`n")
    $cleanApk = New-DexApk -Name 'clean' -Entries ([ordered]@{ 'classes.dex' = (Get-Dex 'clean') })

    $good = Invoke-DexDiff -Clean $cleanApk -Patched (New-DexApk -Name 'good' -Entries ([ordered]@{
        'classes.dex' = (Get-Dex 'good') })) -Allowlist $emptyAllowlist -Name 'good' -Contracts $contracts
    Assert-True ($good.ExitCode -eq 0) "The patched build that breaks nothing failed.`n$($good.Output -join "`n")"
    Assert-True ((Get-Findings $good).Fails.Count -eq 0) "The good build printed a FAIL line.`n$($good.Output -join "`n")"
    Assert-True (($good.Output -join "`n") -match 'structural findings: 0') `
        "The good build did not report its structural count.`n$($good.Output -join "`n")"
    $withoutPayload = Invoke-DexDiff -Clean $cleanApk -Patched (New-DexApk -Name 'good-explicit-none' -Entries ([ordered]@{
        'classes.dex' = (Get-Dex 'good') })) -Allowlist $emptyAllowlist -Name 'good-explicit-none' -Contracts $contracts -Features 'none'
    Assert-True ($withoutPayload.ExitCode -eq 0) 'An explicitly empty selection required absent unselected feature statuses.'
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
            "no-call $($shortcut.Callee) outside Lapp/morphe/extension/: 0 call sites")) `
            ("The good build's $($shortcut.Call), sent to the stand-in whose own call is inside the extension, " +
            "was not reported clean.`n$($good.Output -join "`n")")
    }
    # Every rule must have bad builds of its own. The feature fixtures below cover six families.
    $otherRules = @(Get-Content -LiteralPath $contracts | ForEach-Object { $_.Trim() } |
        Where-Object { $_ -and -not $_.StartsWith('#') -and $_ -notmatch '^no-call\s' })
    Assert-True ((($otherRules | Sort-Object) -join ',') -ceq 'threads-feature disableAnalytics,threads-feature hideAds,threads-feature hideSuggestedUsers,threads-feature openLinksExternally,threads-feature restoreTrust,threads-feature sanitizeSharingLinks') `
        ("The contract file holds rules this suite builds no bad fixtures for:`n$($otherRules -join "`n")")

    $featureClean = New-DexApk -Name 'features-clean' -Entries ([ordered]@{ 'classes.dex' = (Get-Dex 'features-clean') })
    $featureCases = [ordered]@{
        'features-good' = 'hideAds,hideSuggestedUsers,sanitizeSharingLinks,openLinksExternally,disableAnalytics,restoreTrust'
        'features-omitted' = 'none'
        'features-only-hideAds' = 'hideAds'
        'features-only-hideSuggestedUsers' = 'hideSuggestedUsers'
        'features-only-sanitizeSharingLinks' = 'sanitizeSharingLinks'
        'features-only-openLinksExternally' = 'openLinksExternally'
        'features-only-disableAnalytics' = 'disableAnalytics'
        'features-only-restoreTrust' = 'restoreTrust'
    }
    foreach ($mask in 1..7) { $featureCases["features-mask-$mask"] = 'disableAnalytics' }
    foreach ($case in $featureCases.GetEnumerator()) {
        $apk = New-DexApk -Name $case.Key -Entries ([ordered]@{ 'classes.dex' = (Get-Dex $case.Key) })
        $checked = Invoke-DexDiff -Clean $featureClean -Patched $apk -Allowlist $emptyAllowlist -Name $case.Key -Contracts $contracts -Features $case.Value
        Assert-True ($checked.ExitCode -eq 0 -and (Get-Findings $checked).Fails.Count -eq 0) ("Feature selection $($case.Key) failed. " + ($checked.Output -join [Environment]::NewLine))
        foreach ($feature in @('hideAds', 'hideSuggestedUsers', 'sanitizeSharingLinks', 'openLinksExternally', 'disableAnalytics', 'restoreTrust')) {
            $state = if ($feature -cin ($case.Value -split ',')) { 'verified' } else { 'omitted' }
            Assert-True (($checked.Output -join [Environment]::NewLine) -match [regex]::Escape("threads-feature ${feature}: $state")) "Feature $feature did not report $state."
        }
    }
    $discardedClean = New-DexApk -Name 'features-ad-discarded-clean' -Entries ([ordered]@{ 'classes.dex' = (Get-Dex 'features-ad-discarded-clean') })
    $featureFaults = @('feed-missing', 'feed-replaced', 'feed-register', 'feed-duplicate', 'item-stub', 'ad-target', 'ad-discarded', 'ad-body', 'ad-helper-body', 'getter-body', 'ad-helper-native', 'getter-static',
        'link-missing', 'link-replaced', 'link-register', 'post-link-missing', 'post-link-register', 'post-link-getter', 'post-link-bypass',
        'holder-link-missing', 'holder-link-receiver', 'holder-link-field', 'holder-post-link-register', 'holder-post-link-bypass',
        'resume-remember-missing', 'resume-remember-key', 'resume-recall-missing', 'resume-recall-key', 'resume-recall-cast',
        'resume-post-link-bypass', 'quick-remember-missing', 'quick-remember-post', 'quick-recall-key', 'quick-post-link-bypass',
        'browser-missing', 'browser-register', 'browser-bypass', 'browser-clobber',
        'pigeon-missing', 'pigeon-replaced', 'pigeon-bypass',
        'default-missing', 'mqtt-missing', 'trust-missing', 'trust-replaced', 'trust-fallback',
        'status-missing', 'status-false', 'zero-mask', 'unknown-mask')
    foreach ($fault in $featureFaults) {
        $case = "features-bad-$fault"
        $apk = New-DexApk -Name $case -Entries ([ordered]@{ 'classes.dex' = (Get-Dex $case) })
        $stock = if ($fault -ceq 'ad-discarded') { $discardedClean } else { $featureClean }
        $checked = Invoke-DexDiff -Clean $stock -Patched $apk -Allowlist $emptyAllowlist -Name $case -Contracts $contracts -Features $featureCases['features-good']
        $findings = Get-Findings $checked
        Assert-True ($checked.ExitCode -ne 0 -and $findings.Fails.Count -gt 0 -and
            @($findings.Categories | Where-Object { $_ -cne 'contract' }).Count -eq 0) "$fault was not rejected solely by a semantic contract."
        $structural = Invoke-DexDiff -Clean $stock -Patched $apk -Allowlist $emptyAllowlist -Name "$case-structural"
        Assert-True ($structural.ExitCode -eq 0 -and (Get-Findings $structural).Fails.Count -eq 0) "$fault was not structurally valid."
    }
    $suggestionFaults = @('suggestion-stub', 'suggestion-media-guard', 'suggestion-type-guard', 'suggestion-null-guard',
        'suggestion-item-missing', 'suggestion-media-missing', 'suggestion-type-missing', 'suggestion-null-missing',
        'suggestion-enum', 'suggestion-slot', 'suggestion-kickstart-slot', 'suggestion-raw', 'suggestion-wire', 'suggestion-kickstart-wire',
        'suggestion-register', 'suggestion-branch', 'suggestion-false', 'suggestion-extra-call', 'suggestion-active-slot', 'suggestion-owned-raw',
        'suggestion-wrapper-missing', 'suggestion-identity-missing', 'suggestion-identity-guard',
        'suggestion-capture-missing', 'suggestion-capture-register', 'suggestion-capture-field', 'suggestion-capture-duplicate',
        'suggestion-capture-bypass', 'suggestion-capture-flags', 'suggestion-capture-field-missing',
        'suggestion-parser-body', 'suggestion-parser-slot', 'suggestion-raw-parser-body', 'suggestion-model-body', 'suggestion-enum-body',
        'suggestion-wrapper-body', 'suggestion-wrapper-field', 'suggestion-kind-body', 'suggestion-kind-flags', 'suggestion-kind-coverage',
        'suggestion-model-field', 'suggestion-status-missing', 'suggestion-status-false', 'ambiguous-suggestion-slot', 'ambiguous-suggestion-raw', 'ambiguous-suggestion-overwrite',
        'ambiguous-suggestion-active', 'ambiguous-suggestion-capture-param',
        'ambiguous-suggestion-branch-constant', 'ambiguous-suggestion-branch-parameter', 'ambiguous-suggestion-catch',
        'ambiguous-suggestion-parser-constant', 'ambiguous-suggestion-parser-parameter', 'ambiguous-suggestion-parser-loop', 'ambiguous-suggestion-parser-catch',
        'ambiguous-suggestion-slot-source-new', 'ambiguous-suggestion-slot-source-other', 'ambiguous-suggestion-slot-source-catch',
        'ambiguous-suggestion-users-key-constant', 'ambiguous-suggestion-users-key-null', 'ambiguous-suggestion-kickstart-key-constant', 'ambiguous-suggestion-kickstart-key-null',
        'ambiguous-suggestion-raw-key-constant', 'ambiguous-suggestion-raw-key-null', 'ambiguous-suggestion-map-key-constant', 'ambiguous-suggestion-map-key-null',
        'ambiguous-suggestion-null-bypass-map-key-constant', 'ambiguous-suggestion-null-bypass-map-key-null',
        'ambiguous-suggestion-users-reader-bypass', 'ambiguous-suggestion-kickstart-reader-bypass', 'ambiguous-suggestion-raw-reader-bypass',
        'ambiguous-suggestion-raw-reader-catch-bypass', 'ambiguous-suggestion-users-reader-input-other', 'ambiguous-suggestion-users-reader-input-null',
        'ambiguous-suggestion-kickstart-reader-input-other', 'ambiguous-suggestion-kickstart-reader-input-null',
        'ambiguous-suggestion-raw-reader-input-other', 'ambiguous-suggestion-raw-reader-input-null',
        'suggestion-meta-class-annotation', 'suggestion-meta-source-file', 'suggestion-meta-field-annotation', 'suggestion-meta-field-hidden',
        'suggestion-meta-method-annotation', 'suggestion-meta-method-hidden', 'suggestion-meta-parameter-annotation', 'suggestion-meta-parameter-name',
        'suggestion-meta-parameter-signature', 'suggestion-meta-capture-annotation', 'suggestion-meta-capture-hidden', 'suggestion-meta-never-inline-removal')
    foreach ($fault in $suggestionFaults) {
        $case = "features-bad-$fault"
        $apk = New-DexApk -Name $case -Entries ([ordered]@{ 'classes.dex' = (Get-Dex $case) })
        $stock = if ($fault.StartsWith('ambiguous-')) {
            New-DexApk -Name "features-$fault-clean" -Entries ([ordered]@{ 'classes.dex' = (Get-Dex "features-$fault-clean") })
        } else { $featureClean }
        $checked = Invoke-DexDiff -Clean $stock -Patched $apk -Allowlist $emptyAllowlist -Name $case -Contracts $contracts -Features 'hideSuggestedUsers'
        $findings = Get-Findings $checked
        Assert-True ($checked.ExitCode -ne 0 -and $findings.Fails.Count -gt 0 -and
            @($findings.Categories | Where-Object { $_ -cne 'contract' }).Count -eq 0) "$fault was not rejected solely by the suggestion contract."
        Assert-True (($checked.Output -join [Environment]::NewLine) -match 'contract: hideSuggestedUsers:') "$fault failed outside its selected family."
        if ($fault.StartsWith('ambiguous-suggestion-parser-')) {
            Assert-True (($checked.Output -join [Environment]::NewLine) -match 'netego_type constructor argument does not preserve its exact parsed result or explicit null on every path') `
                "$fault did not exercise the raw-parser source proof."
        } elseif ($fault.StartsWith('ambiguous-suggestion-slot-source-')) {
            Assert-True (($checked.Output -join [Environment]::NewLine) -match 'JSON slot does not preserve its exact parsed result or explicit null on every path') `
                "$fault did not exercise the card-slot source proof."
        } elseif ($fault.Contains('-map-key-')) {
            Assert-True (($checked.Output -join [Environment]::NewLine) -match 'raw netego_type lookup does not preserve its original raw tag on every path') `
                "$fault did not exercise the wrapper map-key source proof."
        } elseif ($fault.Contains('-key-')) {
            $key = if ($fault.Contains('-raw-key-')) { 'netego_type' } elseif ($fault.Contains('-kickstart-key-')) {
                'text_app_suggested_users_kickstart_unit'
            } else { 'suggested_users' }
            Assert-True (($checked.Output -join [Environment]::NewLine) -match [regex]::Escape(
                "JSON key $key does not preserve its exact literal on every comparison path")) `
                "$fault did not exercise its exact JSON key proof."
        } elseif ($fault.Contains('-reader-')) {
            $key = if ($fault.Contains('-raw-reader-')) { 'netego_type' } elseif ($fault.Contains('-kickstart-reader-')) {
                'text_app_suggested_users_kickstart_unit'
            } else { 'suggested_users' }
            $failure = if ($fault.Contains('-reader-input-')) {
                "JSON key $key typed reader does not preserve the original JSON input on every path"
            } else { "JSON key $key true edge does not control its typed reader" }
            Assert-True (($checked.Output -join [Environment]::NewLine) -match [regex]::Escape($failure)) `
                "$fault did not exercise its exact reader control/input proof."
            $sourceStock = New-DexApk -Name "$case-source-stock" -Entries ([ordered]@{
                'classes.dex' = (Get-Dex "features-$fault-clean"); 'classes2.dex' = (Get-Dex 'features-structure-marker') })
            $stockStructure = Invoke-DexDiff -Clean $featureClean -Patched $sourceStock -Allowlist $emptyAllowlist -Name "$case-stock-structure"
            Assert-True ($stockStructure.ExitCode -eq 0 -and (Get-Findings $stockStructure).Fails.Count -eq 0) `
                ("$fault corrupted its stock parser structure. " + ($stockStructure.Output -join [Environment]::NewLine))
        }
        $structural = Invoke-DexDiff -Clean $stock -Patched $apk -Allowlist $emptyAllowlist -Name "$case-structural"
        Assert-True ($structural.ExitCode -eq 0 -and (Get-Findings $structural).Fails.Count -eq 0) "$fault was not structurally valid."
    }
    $sourceProofs = @('proven-suggestion-branch', 'proven-suggestion-catch', 'metadata',
        'proven-suggestion-parser-absent', 'proven-suggestion-parser-null', 'proven-suggestion-parser-copy',
        'proven-suggestion-parser-loop', 'proven-suggestion-parser-catch', 'proven-suggestion-slot-source-null',
        'proven-suggestion-slot-source-copy', 'proven-suggestion-slot-source-loop', 'proven-suggestion-slot-source-catch',
        'proven-suggestion-users-key-copy', 'proven-suggestion-users-key-branch', 'proven-suggestion-kickstart-key-copy', 'proven-suggestion-kickstart-key-branch',
        'proven-suggestion-raw-key-copy', 'proven-suggestion-raw-key-branch', 'proven-suggestion-map-key-copy', 'proven-suggestion-map-key-branch',
        'proven-suggestion-map-null-bypass', 'proven-suggestion-null-bypass-map-key-copy', 'proven-suggestion-null-bypass-map-key-branch',
        'proven-suggestion-users-reader-gated', 'proven-suggestion-kickstart-reader-gated', 'proven-suggestion-raw-reader-gated', 'proven-suggestion-raw-reader-catch-gated',
        'proven-suggestion-users-reader-input-copy', 'proven-suggestion-users-reader-input-branch',
        'proven-suggestion-kickstart-reader-input-copy', 'proven-suggestion-kickstart-reader-input-branch',
        'proven-suggestion-raw-reader-input-copy', 'proven-suggestion-raw-reader-input-branch')
    foreach ($proof in $sourceProofs) {
        $name = if ($proof -ceq 'metadata') { 'features-metadata-good' } else { "features-$proof" }
        $stockName = "features-$proof-clean"
        $stock = New-DexApk -Name $stockName -Entries ([ordered]@{ 'classes.dex' = (Get-Dex $stockName) })
        $apk = New-DexApk -Name $name -Entries ([ordered]@{ 'classes.dex' = (Get-Dex $name) })
        $checked = Invoke-DexDiff -Clean $stock -Patched $apk -Allowlist $emptyAllowlist -Name $name -Contracts $contracts -Features 'hideSuggestedUsers'
        Assert-True ($checked.ExitCode -eq 0 -and (Get-Findings $checked).Fails.Count -eq 0) `
            ("$proof rejected preserved provenance, explicit null or metadata. " + ($checked.Output -join [Environment]::NewLine))
        if ($proof.Contains('-reader-')) {
            $sourceStock = New-DexApk -Name "$name-source-stock" -Entries ([ordered]@{
                'classes.dex' = (Get-Dex $stockName); 'classes2.dex' = (Get-Dex 'features-structure-marker') })
            $stockStructure = Invoke-DexDiff -Clean $featureClean -Patched $sourceStock -Allowlist $emptyAllowlist -Name "$name-stock-structure"
            Assert-True ($stockStructure.ExitCode -eq 0 -and (Get-Findings $stockStructure).Fails.Count -eq 0) `
                ("$proof corrupted its stock parser structure. " + ($stockStructure.Output -join [Environment]::NewLine))
        }
    }
    $omittedFaults = [ordered]@{
        'omitted-hideAds' = @('hideAds', 'hideSuggestedUsers')
        'omitted-sanitizeSharingLinks' = @('sanitizeSharingLinks', 'hideSuggestedUsers')
        'omitted-openLinksExternally' = @('openLinksExternally', 'hideSuggestedUsers')
        'omitted-disableAnalytics' = @('disableAnalytics', 'hideSuggestedUsers')
        'omitted-restoreTrust' = @('restoreTrust', 'hideSuggestedUsers')
        'omitted-suggestion-predicate' = @('hideSuggestedUsers', 'hideAds')
        'omitted-suggestion-capture' = @('hideSuggestedUsers', 'hideAds')
        'omitted-suggestion-constructor' = @('hideSuggestedUsers', 'hideAds')
        'omitted-suggestion-parser' = @('hideSuggestedUsers', 'hideAds')
        'omitted-suggestion-missing-status-capture' = @('hideSuggestedUsers', 'hideAds')
        'omitted-feed-hook' = @('hideAds', 'none')
        'omitted-item-getter' = @('hideAds', 'none')
    }
    foreach ($fault in $omittedFaults.Keys) {
        $case = "features-bad-$fault"
        $apk = New-DexApk -Name $case -Entries ([ordered]@{ 'classes.dex' = (Get-Dex $case) })
        $checked = Invoke-DexDiff -Clean $featureClean -Patched $apk -Allowlist $emptyAllowlist -Name $case -Contracts $contracts -Features $omittedFaults[$fault][1]
        $findings = Get-Findings $checked
        Assert-True ($checked.ExitCode -ne 0 -and $findings.Fails.Count -gt 0 -and
            @($findings.Categories | Where-Object { $_ -cne 'contract' }).Count -eq 0 -and
            ($checked.Output -join [Environment]::NewLine) -match "contract: $($omittedFaults[$fault][0]):") "$fault did not reject its omitted family."
        $structural = Invoke-DexDiff -Clean $featureClean -Patched $apk -Allowlist $emptyAllowlist -Name "$case-structural"
        Assert-True ($structural.ExitCode -eq 0 -and (Get-Findings $structural).Fails.Count -eq 0) "$fault was not structurally valid."
    }
    $duplicateSuggestion = New-DexApk -Name 'features-suggestion-duplicate' -Entries ([ordered]@{
        'classes.dex' = (Get-Dex 'features-only-hideSuggestedUsers'); 'classes2.dex' = (Get-Dex 'features-suggestion-copy') })
    $duplicateChecked = Invoke-DexDiff -Clean $featureClean -Patched $duplicateSuggestion -Allowlist $emptyAllowlist `
        -Name 'features-suggestion-duplicate' -Contracts $contracts -Features 'hideSuggestedUsers'
    Assert-True ($duplicateChecked.ExitCode -ne 0 -and ($duplicateChecked.Output -join [Environment]::NewLine) -match 'contract: hideSuggestedUsers: expected one definition .*found 2') `
        'Duplicate suggestion accessor definitions were accepted.'
    $duplicateStructural = Invoke-DexDiff -Clean $featureClean -Patched $duplicateSuggestion -Allowlist $emptyAllowlist -Name 'features-suggestion-duplicate-structural'
    Assert-True ($duplicateStructural.ExitCode -eq 0 -and (Get-Findings $duplicateStructural).Fails.Count -eq 0) `
        'Duplicate suggestion definitions did not remain a structurally valid semantic rejection fixture.'
    $historical = New-DexApk -Name 'features-historical' -Entries ([ordered]@{ 'classes.dex' = (Get-Dex 'features-historical') })
    foreach ($selection in @($null, 'hideAds,sanitizeSharingLinks,disableAnalytics,restoreTrust')) {
        $checked = Invoke-DexDiff -Clean $featureClean -Patched $historical -Allowlist $emptyAllowlist -Name "historical-$selection" -Contracts $contracts -Features $selection
        $text = $checked.Output -join [Environment]::NewLine
        Assert-True ($checked.ExitCode -eq 0 -and $text -match 'threads-feature hideSuggestedUsers: omitted' -and $text -match 'threads-feature openLinksExternally: omitted') `
            'A historical bundle missing only the new statuses was refused.'
    }
    $legacyMissingAd = New-DexApk -Name 'features-historical-missing-ad-status' -Entries ([ordered]@{ 'classes.dex' = (Get-Dex 'features-historical-missing-ad-status') })
    $legacyChecked = Invoke-DexDiff -Clean $featureClean -Patched $legacyMissingAd -Allowlist $emptyAllowlist -Name 'historical-missing-ad-status' -Contracts $contracts
    Assert-True ($legacyChecked.ExitCode -ne 0 -and ($legacyChecked.Output -join [Environment]::NewLine) -match 'contract: hideAds:') `
        'Historical omission weakened the pre-existing ad status requirement.'
    $selectedHistorical = Invoke-DexDiff -Clean $featureClean -Patched $historical -Allowlist $emptyAllowlist `
        -Name 'historical-selected-suggestions' -Contracts $contracts -Features 'hideAds,hideSuggestedUsers,sanitizeSharingLinks,disableAnalytics,restoreTrust'
    Assert-True ($selectedHistorical.ExitCode -ne 0 -and ($selectedHistorical.Output -join [Environment]::NewLine) -notmatch 'contract: openLinksExternally:') `
        'An unselected Open links in browser was held to its status on a historical bundle.'
    $selectedBrowser = Invoke-DexDiff -Clean $featureClean -Patched $historical -Allowlist $emptyAllowlist `
        -Name 'historical-selected-browser' -Contracts $contracts -Features 'hideAds,sanitizeSharingLinks,openLinksExternally,disableAnalytics,restoreTrust'
    Assert-True ($selectedBrowser.ExitCode -ne 0 -and ($selectedBrowser.Output -join [Environment]::NewLine) -match 'contract: openLinksExternally:') `
        'Explicit browser selection accepted a historical bundle without the new status.'
    Assert-True ($selectedHistorical.ExitCode -ne 0 -and ($selectedHistorical.Output -join [Environment]::NewLine) -match 'contract: hideSuggestedUsers:') `
        'Explicit suggestion selection accepted a historical bundle without the new status.'
    $exceptionClean = New-DexApk -Name 'features-exception-clean' -Entries ([ordered]@{ 'classes.dex' = (Get-Dex 'features-exception-clean') })
    foreach ($case in @('features-exception-good', 'features-exception-bad-range', 'features-exception-bad-type', 'features-exception-bad-target', 'features-exception-bad-order')) {
        $apk = New-DexApk -Name $case -Entries ([ordered]@{ 'classes.dex' = (Get-Dex $case) })
        $checked = Invoke-DexDiff -Clean $exceptionClean -Patched $apk -Allowlist $emptyAllowlist -Name $case -Contracts $contracts -Features 'disableAnalytics'
        $findings = Get-Findings $checked
        if ($case -ceq 'features-exception-good') {
            Assert-True ($checked.ExitCode -eq 0) 'Correctly relocated typed/catch-all handlers failed.'
        } else {
            Assert-True ($checked.ExitCode -ne 0 -and $findings.Fails.Count -gt 0 -and
                @($findings.Categories | Where-Object { $_ -cne 'contract' }).Count -eq 0) "$case did not fail solely as a semantic contract."
            $structural = Invoke-DexDiff -Clean $exceptionClean -Patched $apk -Allowlist $emptyAllowlist -Name "$case-structural"
            Assert-True ($structural.ExitCode -eq 0) "$case was not structurally valid."
        }
    }
    $splitClean = New-DexApk -Name 'features-exception-split-clean' -Entries ([ordered]@{ 'classes.dex' = (Get-Dex 'features-exception-split-clean') })
    foreach ($case in @('features-exception-split-good', 'features-exception-split-gap')) {
        $apk = New-DexApk -Name $case -Entries ([ordered]@{ 'classes.dex' = (Get-Dex $case) })
        $checked = Invoke-DexDiff -Clean $splitClean -Patched $apk -Allowlist $emptyAllowlist -Name $case -Contracts $contracts -Features 'disableAnalytics'
        $findings = Get-Findings $checked
        if ($case -ceq 'features-exception-split-good') {
            Assert-True ($checked.ExitCode -eq 0 -and $findings.Fails.Count -eq 0) 'Correctly split relocation beyond 65,535 protected units failed.'
        } else {
            Assert-True ($checked.ExitCode -ne 0 -and $findings.Fails.Count -gt 0 -and
                @($findings.Categories | Where-Object { $_ -cne 'contract' }).Count -eq 0) 'A gap between relocated protected ranges passed.'
        }
        $structural = Invoke-DexDiff -Clean $splitClean -Patched $apk -Allowlist $emptyAllowlist -Name "$case-structural"
        Assert-True ($structural.ExitCode -eq 0 -and (Get-Findings $structural).Fails.Count -eq 0) "$case was not structurally valid."
    }
    $noDefaultClean = New-DexApk -Name 'features-no-default-clean' -Entries ([ordered]@{ 'classes.dex' = (Get-Dex 'features-no-default-clean') })
    foreach ($case in @('features-no-default-pigeon', 'features-bad-default-coverage')) {
        $apk = New-DexApk -Name $case -Entries ([ordered]@{ 'classes.dex' = (Get-Dex $case) })
        $checked = Invoke-DexDiff -Clean $noDefaultClean -Patched $apk -Allowlist $emptyAllowlist -Name $case -Contracts $contracts -Features 'disableAnalytics'
        if ($case -ceq 'features-no-default-pigeon') {
            Assert-True ($checked.ExitCode -eq 0) 'PIGEON-only coverage was refused when DEFAULT has no address-return site.'
        } else {
            Assert-True ($checked.ExitCode -ne 0 -and ($checked.Output -join [Environment]::NewLine) -match 'DEFAULT has no literal address answers') 'A claimed DEFAULT bit passed with only an unrelated URL literal in PIGEON.'
            $structural = Invoke-DexDiff -Clean $noDefaultClean -Patched $apk -Allowlist $emptyAllowlist -Name "$case-structural"
            Assert-True ($structural.ExitCode -eq 0) 'Missing DEFAULT coverage was not a structurally valid fixture.'
        }
    }
    $missingFeatureRule = Join-Path $caseRoot 'missing-feature-rule.txt'
    [System.IO.File]::WriteAllLines($missingFeatureRule, @(Get-Content -LiteralPath $contracts | Where-Object { $_.Trim() -cne 'threads-feature hideAds' }))
    $featureGood = New-DexApk -Name 'features-all-selected' -Entries ([ordered]@{ 'classes.dex' = (Get-Dex 'features-good') })
    $missing = Invoke-DexDiff -Clean $featureClean -Patched $featureGood -Allowlist $emptyAllowlist -Name 'missing-feature-rule' -Contracts $missingFeatureRule -Features $featureCases['features-good']
    Assert-True ($missing.ExitCode -ne 0 -and ($missing.Output -join [Environment]::NewLine) -match 'selected feature has no contract: hideAds') 'A selected family with no contract was silently skipped.'
    $missingSuggestionRule = Join-Path $caseRoot 'missing-suggestion-rule.txt'
    [System.IO.File]::WriteAllLines($missingSuggestionRule, @(Get-Content -LiteralPath $contracts | Where-Object { $_.Trim() -cne 'threads-feature hideSuggestedUsers' }))
    $missing = Invoke-DexDiff -Clean $featureClean -Patched $featureGood -Allowlist $emptyAllowlist -Name 'missing-suggestion-rule' -Contracts $missingSuggestionRule -Features $featureCases['features-good']
    Assert-True ($missing.ExitCode -ne 0 -and ($missing.Output -join [Environment]::NewLine) -match 'selected feature has no contract: hideSuggestedUsers') `
        'Selected Suggested Users without its contract was silently skipped.'
    Write-Host "[scripts] selected feature contracts passed ($($featureCases.Count + $sourceProofs.Count + 5) good selections, $($featureFaults.Count + $suggestionFaults.Count + $omittedFaults.Count + 6) structurally valid corruptions, duplicates and historical omissions checked)"

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
        $expected = "[diff] FAIL: contract: $($shortcut.Callee) is still called outside Lapp/morphe/extension/, in $($shortcut.Site)"
        Assert-True ($fails.Count -eq 1 -and $fails[0] -ceq $expected) `
            "$name did not fail with its own no-call finding alone.`nExpected: $expected`nGot:`n$($fails -join "`n")"
        foreach ($other in $shortcutCalls) {
            $count = if ($other.Call -eq $shortcut.Call) { '1 call site, in ' } else { '0 call sites' }
            Assert-True (($badResults[$name].Output -join "`n") -match [regex]::Escape(
                "no-call $($other.Callee) outside Lapp/morphe/extension/: $count")) `
                "$name reported $($other.Call) wrong: expected '$count'.`n$($badResults[$name].Output -join "`n")"
        }
    }

    # A register out of range names the instruction, the register it reaches and the count, in the
    # method it sits in. Each FAIL line has to be one of these.
    $registerFindings = [ordered]@{
        'bad-register-added-helper' = @('*register: const/4 at 0 reaches v1, and the method declares 1 register  in Lfixture/Host;->helper()V')
        'bad-register-wide-source' = @('*register: move-wide at 0 reaches v2, and the method declares 2 registers  in Lfixture/Host;->copyWide()V')
        'bad-register-own-wide' = @(('*register: const-wide/16 at 0 reaches v2, and the method declares 2 registers  in ' +
            'Lapp/morphe/extension/hushthreads/fixture/Pack;->pack()V'))
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
    $stubRef = 'Lapp/morphe/extension/hushthreads/fixture/Stub;->fill(Ljava/lang/Object;)Ljava/lang/Object;'
    $hookRef = 'Lapp/morphe/extension/hushthreads/fixture/Hook;->ask(I)Z'
    $standInRef = 'Lapp/morphe/extension/hushthreads/fixture/Hook;->standIn(Landroid/view/View;)V'
    $afterRef = 'Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V'
    $shapeRef = '(Landroid/content/Context;Lfixture/Host;)V'
    $sendRef = 'Lapp/morphe/extension/hushthreads/fixture/Hook;->send(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V'
    $executeRef = 'Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V'
    foreach ($line in @(
            'threads-feature',
            'threads-feature unknown',
            'threads-feature hideAds extra',
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
            "first-call $stubRef outside Lapp/morphe/extension",
            'first-call fill outside Lapp/morphe/extension/',
            "first-call $stubRef outside",
            'no-call Landroid/content/pm/ShortcutManager;->pushDynamicShortcut(Landroid/content/pm/ShortcutInfo;)V in Lapp/morphe/extension/',
            'no-call pushDynamicShortcut outside Lapp/morphe/extension/',
            'no-call Landroid/content/pm/ShortcutManager;->pushDynamicShortcut(Landroid/content/pm/ShortcutInfo;)V outside',
            'no-call Landroid/content/pm/ShortcutManager;->pushDynamicShortcut(Landroid/content/pm/ShortcutInfo;)V outside Lapp/morphe/extension',
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
            "once-call $hookRef in instance holding alpha")) {
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
        'the clean APK carries \d+ methods under Lapp/morphe/ .*so it is a patched build') `
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

$global:LASTEXITCODE = 0
Write-Host "[scripts] injected-register and mutation contracts passed ($($bad.Count) bad fixtures, each refused for its own check)"
