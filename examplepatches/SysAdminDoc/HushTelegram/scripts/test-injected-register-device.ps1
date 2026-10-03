<#
.SYNOPSIS
    Exercise ADB failure cleanup for injected-register verification.

.DESCRIPTION
    Every stage of a device verify can fail, and each failure has to be named and still remove
    what was pushed. Two of them are about evidence rather than errors: a clean telegram.org build can raise
    no verifier message at all, so a tally only counts once dex2oat has read a file of the pushed size, and
    dex2oat exits 0 while logging that the file it was given doesn't exist. The phones are shared, so the
    log buffer is never cleared: the fake ADB throws on a clear, and another run's lines sit ahead of
    this run's marker where only a verifier that ignores them can pass.
#>
[CmdletBinding()]
param([string]$Root)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $PSScriptRoot 'injected-register-device.ps1')
. (Join-Path $PSScriptRoot 'script-wiring.ps1')

function Assert-True {
    param([bool]$Condition, [string]$Message)
    if (-not $Condition) { throw $Message }
}

# The helper reads the local file's size, so the fixture is a real file.
$fixture = Join-Path ([System.IO.Path]::GetTempPath()) ("hushtelegram-device-fixture-" + [guid]::NewGuid().ToString('N') + '.apk')
[System.IO.File]::WriteAllBytes($fixture, [byte[]](1..200 | ForEach-Object { $_ % 256 }))
$fixtureSize = (Get-Item -LiteralPath $fixture).Length
try {
    function New-FakeAdb {
        param(
            [string]$FailureStage,
            [int]$CleanupFailureNumber = 0,
            [int]$CleanupThrowNumber = 0,
            # A parameter, so GetNewClosure captures it: the closure sees this function's own
            # variables, not the script's, once the suite runs nested inside the push gate.
            [long]$Size = $fixtureSize
        )

        $state = [pscustomobject]@{
            Calls = [System.Collections.Generic.List[string]]::new()
            RemotePaths = [System.Collections.Generic.HashSet[string]]::new(
                [System.StringComparer]::Ordinal)
            CleanupCalls = 0
            Marker = $null
        }
        $invoker = {
            param([string]$Executable, [string[]]$Arguments)
            $line = $Arguments -join ' '
            [void]$state.Calls.Add($line)
            $exitCode = 0
            $output = @()
            $operation = $Arguments[2]

            if ($operation -eq 'push') {
                [void]$state.RemotePaths.Add($Arguments[4])
                if ($FailureStage -eq 'push') { $exitCode = 11 }
            } elseif ($operation -eq 'shell' -and $Arguments[3] -like '*&& mkdir -p*') {
                $directory = ($Arguments[3] -split 'mkdir -p ', 2)[1]
                [void]$state.RemotePaths.Add($directory)
                if ($FailureStage -eq 'setup') { $exitCode = 12 }
            } elseif ($operation -eq 'shell' -and $Arguments[3] -like 'log -p w -t HushTelegramVerify *') {
                $state.Marker = ($Arguments[3] -split ' ')[-1]
                if ($FailureStage -eq 'mark') { $exitCode = 13 }
            } elseif ($operation -eq 'logcat' -and $Arguments -contains '-c') {
                throw 'The verifier cleared the log buffer of a shared phone.'
            } elseif ($operation -eq 'shell' -and $Arguments[3] -like 'dex2oat64*') {
                $read = if ($FailureStage -eq 'short-read') { 5 } else { $Size }
                $output = if ($FailureStage -eq 'dex2oat') { @('exit=14', "size=$read") } else { @('exit=0', "size=$read") }
            } elseif ($operation -eq 'logcat' -and $Arguments[3] -eq '-d') {
                # Another session's run of the same label, still in the buffer ahead of this one.
                # Counted, its verifier line changes the tally and its missing file fails the run.
                $earlier = @(
                    'W HushTelegramVerify: hushtelegram-verify-case-0123456789abcdef0123456789abcdef',
                    'I dex2oat64: Verification error in Lfixture/Host;',
                    'I dex2oat64: Verification error in Lfixture/Stale;',
                    "W dex2oat64: Skipping non-existent dex file '/data/local/tmp/hushtelegram-verify-case.apk'"
                )
                $markLine = "W HushTelegramVerify: $($state.Marker)"
                if ($FailureStage -eq 'log-read-throw') {
                    throw 'fake ADB threw while reading logcat'
                } elseif ($FailureStage -eq 'log-read') {
                    $exitCode = 15
                } elseif ($FailureStage -eq 'rotated') {
                    # The marker and everything before it have rotated out of a busy buffer.
                    $output = @('I dex2oat64: Verification error in Lfixture/Host;')
                } elseif ($FailureStage -eq 'unread') {
                    $output = $earlier + $markLine +
                        @("W dex2oat64: Skipping non-existent dex file '/data/local/tmp/hushtelegram-verify-case.apk'")
                } else {
                    $output = $earlier + $markLine + @(
                        'I dex2oat64: Verification error in Lfixture/Host;',
                        'I dex2oat64: Verification error in Lfixture/Host;',
                        'W dex2oat: VerifyError in Lfixture/Other;'
                    )
                }
            } elseif ($operation -eq 'shell' -and $Arguments[3] -like 'rm -rf *') {
                $state.CleanupCalls++
                $path = $Arguments[3].Substring('rm -rf '.Length)
                if ($CleanupThrowNumber -eq $state.CleanupCalls) {
                    throw "fake ADB threw while removing $path"
                } elseif ($CleanupFailureNumber -eq $state.CleanupCalls) {
                    $exitCode = 91
                } else {
                    [void]$state.RemotePaths.Remove($path)
                }
            } else {
                throw "Unexpected fake ADB call through ${Executable}: $line"
            }
            [pscustomobject]@{ ExitCode = $exitCode; Output = $output }
        }.GetNewClosure()
        [pscustomobject]@{ State = $state; Invoker = $invoker }
    }

    function Assert-BothCleanupCalls {
        param($State, [string]$Context)
        $expected = @(
            '-s SERIAL shell rm -rf /data/local/tmp/hushtelegram-verify-case',
            '-s SERIAL shell rm -rf /data/local/tmp/hushtelegram-verify-case.apk'
        )
        foreach ($call in $expected) {
            Assert-True (@($State.Calls | Where-Object { $_ -eq $call }).Count -eq 1) `
                "$Context did not attempt cleanup exactly once: $call"
        }
    }

    $failures = [ordered]@{
        push = 'Could not push case to SERIAL (ADB exit 11).'
        setup = 'Could not prepare the verifier output directory for case on SERIAL (ADB exit 12).'
        mark = 'Could not mark logcat on SERIAL before verifying case (ADB exit 13).'
        dex2oat = 'dex2oat on case exited 14.'
        'log-read' = 'Could not read logcat on SERIAL after verifying case (ADB exit 15).'
        rotated = "The log on SERIAL doesn't hold the start of the case run, so its verifier messages can't be counted. A busy log may have dropped it, or the phone may filter warnings out of its log. Retry when the phone is quieter."
        'short-read' = "dex2oat on case read a file of 5 bytes on SERIAL, not the $fixtureSize bytes pushed."
        unread = "dex2oat did not read case on SERIAL: Skipping non-existent dex file '/data/local/tmp/hushtelegram-verify-case.apk'"
    }
    foreach ($stage in $failures.Keys) {
        $fake = New-FakeAdb -FailureStage $stage
        $caught = $null
        try {
            [void](Invoke-AndroidVerifierTally -Adb 'fake-adb' -Serial 'SERIAL' `
                -Local $fixture -Label 'case' -AdbInvoker $fake.Invoker)
        } catch {
            $caught = $_
        }
        Assert-True ($null -ne $caught) "$stage failure was accepted."
        Assert-True ($caught.Exception.Message -eq $failures[$stage]) `
            "$stage returned a different failure: $($caught.Exception.Message)"
        Assert-BothCleanupCalls -State $fake.State -Context $stage
        Assert-True ($fake.State.RemotePaths.Count -eq 0) "$stage left fake remote files behind."
    }

    $thrownFailure = New-FakeAdb -FailureStage 'log-read-throw'
    $caught = $null
    try {
        [void](Invoke-AndroidVerifierTally -Adb 'fake-adb' -Serial 'SERIAL' `
            -Local $fixture -Label 'case' -AdbInvoker $thrownFailure.Invoker)
    } catch {
        $caught = $_
    }
    Assert-True ($caught.Exception.Message -eq 'fake ADB threw while reading logcat') `
        'A thrown ADB error was replaced or accepted.'
    Assert-BothCleanupCalls -State $thrownFailure.State -Context 'thrown log retrieval failure'
    Assert-True ($thrownFailure.State.RemotePaths.Count -eq 0) `
        'A thrown ADB error left fake remote files behind.'

    $primaryWithCleanupFailure = New-FakeAdb -FailureStage 'mark' -CleanupThrowNumber 1
    $warnings = @()
    $caught = $null
    try {
        [void](Invoke-AndroidVerifierTally -Adb 'fake-adb' -Serial 'SERIAL' `
            -Local $fixture -Label 'case' -AdbInvoker $primaryWithCleanupFailure.Invoker `
            -WarningVariable warnings)
    } catch {
        $caught = $_
    }
    Assert-True ($caught.Exception.Message -eq $failures.mark) `
        'A cleanup failure replaced the original verification failure.'
    Assert-BothCleanupCalls -State $primaryWithCleanupFailure.State -Context 'secondary cleanup failure'
    Assert-True (($warnings | ForEach-Object { "$_" }) -join "`n" -match 'cleanup also failed') `
        'A cleanup failure beside a primary failure produced no secondary diagnostic.'

    $success = New-FakeAdb
    $tally = Invoke-AndroidVerifierTally -Adb 'fake-adb' -Serial 'SERIAL' `
        -Local $fixture -Label 'case' -AdbInvoker $success.Invoker
    Assert-True ($tally.Count -eq 2 -and $tally['Verification error in Lfixture/Host;'] -eq 2 -and
        $tally['VerifyError in Lfixture/Other;'] -eq 1) 'The successful fake verifier tally was wrong.'
    Assert-True ($success.State.Marker -match '^hushtelegram-verify-case-[0-9a-f]{32}$') `
        "The verifier marked its run with $($success.State.Marker), not a unique marker of its own."
    $again = New-FakeAdb
    [void](Invoke-AndroidVerifierTally -Adb 'fake-adb' -Serial 'SERIAL' -Local $fixture -Label 'case' -AdbInvoker $again.Invoker)
    Assert-True ($again.State.Marker -ne $success.State.Marker) 'Two runs of one label used the same log marker.'
    Assert-BothCleanupCalls -State $success.State -Context 'success'
    Assert-True ($success.State.RemotePaths.Count -eq 0) 'The successful run left fake remote files behind.'

    $successWithCleanupFailure = New-FakeAdb -CleanupFailureNumber 1
    $caught = $null
    try {
        [void](Invoke-AndroidVerifierTally -Adb 'fake-adb' -Serial 'SERIAL' `
            -Local $fixture -Label 'case' -AdbInvoker $successWithCleanupFailure.Invoker)
    } catch {
        $caught = $_
    }
    Assert-True ($null -ne $caught -and $caught.Exception.Message -like 'Verifier cleanup failed.*') `
        'A cleanup failure after successful verification was accepted.'
    Assert-BothCleanupCalls -State $successWithCleanupFailure.State -Context 'success cleanup failure'

    # Nothing else may clear a shared phone's log either, test scripts that drive a phone included.
    # Only this suite's fake ADB, which refuses the call, names it. Read as tokens, so comments
    # don't count and an argument array split over lines does: a logcat word, then a clear flag in
    # the same array or command, or both inside one shell string. A name held in a variable is
    # out of reach here, which is why the fake ADB refuses the call as well.
    $clearFlag = '^(--clear|-[A-Za-z]*c[A-Za-z]*)$'
    $clearInString = '(?<![\w-])logcat\b[^;|&\r\n]*?\s(--clear|-[A-Za-z]*c[A-Za-z]*)(?![\w-])'
    function Find-LogBufferClear {
        param([string]$Path)
        $tokens = $null
        $parseErrors = $null
        [void][System.Management.Automation.Language.Parser]::ParseFile($Path, [ref]$tokens, [ref]$parseErrors)
        $kinds = [System.Management.Automation.Language.TokenKind]
        $value = { param($Token) if ($Token -is [System.Management.Automation.Language.StringToken]) { $Token.Value } else { $Token.Text } }
        $opens = @($kinds::LParen, $kinds::AtParen, $kinds::DollarParen, $kinds::LCurly, $kinds::AtCurly, $kinds::LBracket)
        $closes = @($kinds::RParen, $kinds::RCurly, $kinds::RBracket)
        $hits = [System.Collections.Generic.List[string]]::new()
        $depth = 0
        for ($i = 0; $i -lt $tokens.Count; $i++) {
            $token = $tokens[$i]
            if ($token.Kind -in $opens) { $depth++ } elseif ($token.Kind -in $closes) { $depth-- }
            if ($token.Kind -eq $kinds::Comment) { continue }
            $text = "$(& $value $token)"
            if ($text -cmatch $clearInString) { $hits.Add("$($token.Extent.StartLineNumber)"); continue }
            if ($text -cnotmatch '(?<![\w-])logcat(?![\w-])') { continue }
            # The rest of this array, or of this command when the word is bare.
            $level = 0
            for ($j = $i + 1; $j -lt $tokens.Count; $j++) {
                $next = $tokens[$j]
                if ($next.Kind -in $opens) { $level++; continue }
                if ($next.Kind -in $closes) { if ($level-- -eq 0) { break } else { continue } }
                if ($level -eq 0 -and $depth -eq 0 -and $next.Kind -in @($kinds::NewLine, $kinds::Semi, $kinds::Pipe, $kinds::EndOfInput)) { break }
                if ($next.Kind -eq $kinds::Comment) { continue }
                if ("$(& $value $next)" -cmatch $clearFlag) { $hits.Add("$($next.Extent.StartLineNumber)"); break }
            }
        }
        return $hits
    }
    $clearing = @(Get-ChildItem -LiteralPath $PSScriptRoot -Recurse -Include '*.ps1', '*.psm1' |
        Where-Object { $_.FullName -ne $PSCommandPath } |
        ForEach-Object { $file = $_; Find-LogBufferClear $file.FullName | ForEach-Object { "$($file.Name):$_" } })
    Assert-True ($clearing.Count -eq 0) "Scripts clear the log buffer of a shared phone: $($clearing -join ', ')"

    # The scan itself, on spellings it has to catch and calls it has to leave alone.
    $scanCopy = Join-Path ([System.IO.Path]::GetTempPath()) ("hushtelegram-clear-scan-" + [guid]::NewGuid().ToString('N') + '.ps1')
    try {
        $scanCases = @(
            @{ Name = 'a bare adb call'; Clears = $true; Text = '& $adb -s $serial logcat -c' }
            @{ Name = 'a buffer named first'; Clears = $true; Text = '& $adb -s $serial logcat -b all -c' }
            @{ Name = 'the long flag'; Clears = $true; Text = 'adb logcat --clear' }
            @{ Name = 'flags run together'; Clears = $true; Text = "Invoke-Thing -Arguments @('-s', `$s, 'logcat', '-cb', 'main')" }
            @{ Name = 'an argument array'; Clears = $true; Text = "Invoke-Thing -Arguments @('-s', `$s, 'logcat', '-c')" }
            @{ Name = 'an argument array split over lines'; Clears = $true; Text = "Invoke-Thing -Arguments @('-s', `$s, 'logcat',`n    '-c') -Description 'x'" }
            @{ Name = 'a shell string'; Clears = $true; Text = "& `$adb -s `$s shell 'logcat -b main -c'" }
            @{ Name = 'the dump read'; Clears = $false; Text = "Invoke-Thing -Arguments @('-s', `$s, 'logcat', '-d') -Description 'Could not clear'" }
            @{ Name = 'a dump with a format'; Clears = $false; Text = '& $adb logcat -d -v color' }
            @{ Name = 'a comment'; Clears = $false; Text = '# never run logcat -c on a shared phone' }
            @{ Name = 'a clear on the next command'; Clears = $false; Text = "& `$adb logcat -d`n& `$tool -c" }
        )
        $scanFailures = @()
        foreach ($case in $scanCases) {
            [System.IO.File]::WriteAllText($scanCopy, $case.Text)
            $found = @(Find-LogBufferClear $scanCopy).Count -gt 0
            if ($found -ne $case.Clears) { $scanFailures += "$($case.Name): the scan said $found" }
        }
        if ($scanFailures.Count -ne 0) { throw ("The log clear scan misjudged:`n" + ($scanFailures -join "`n")) }
    } finally {
        [System.IO.File]::Delete($scanCopy)
    }

    # As the verifier runs them (script-wiring.ps1), so help text, log lines, functions nothing
    # calls and dead branches can't stand in for the calls: the helper dot-sourced, and a tally of
    # the clean APK and one of the patched APK, compared with each other.
    $verifier = Join-Path $PSScriptRoot 'verify-injected-registers.ps1'
    $prePush = Join-Path $PSScriptRoot 'pre-push.ps1'
    Assert-True ((Test-DotSourcesFile $verifier 'injected-register-device.ps1') -and (Test-TalliesBothSides $verifier)) `
        'The device verifier does not use the cleanup helper for both sides.'
    # The line that adds the suite to the run, not the path list that only decides when to run it.
    Assert-True (Test-PushGateRunsSuite $prePush 'scripts/test-injected-register-device.ps1') `
        'The push gate does not run the verifier cleanup fixtures.'

    # The checks themselves, on copies with the wiring taken out in ways that leave its text
    # behind. Each copy has to fail the check it was made for, and an untouched copy has to pass.
    $wiringCopy = Join-Path ([System.IO.Path]::GetTempPath()) `
        ("hushtelegram-device-wiring-" + [guid]::NewGuid().ToString('N') + '.ps1')
    try {
        $verifierText = [System.IO.File]::ReadAllText($verifier)
        $prePushSource = [System.IO.File]::ReadAllText($prePush)
        $dotSourcesDevice = { param($Path) Test-DotSourcesFile $Path 'injected-register-device.ps1' }
        $talliesBothSides = { param($Path) Test-TalliesBothSides $Path }
        $gateRunsSuite = { param($Path) Test-PushGateRunsSuite $Path 'scripts/test-injected-register-device.ps1' }
        $deviceDotSource = { param($Node)
            $Node -is [System.Management.Automation.Language.CommandAst] -and
            $Node.InvocationOperator -eq [System.Management.Automation.Language.TokenKind]::Dot -and
            $Node.Extent.Text -like '*injected-register-device.ps1*' }
        # The device half's first statement, which the copies below put a statement in front of.
        $deviceHalfStart = { param($Node)
            $Node -is [System.Management.Automation.Language.CommandAst] -and
            $Node.Extent.Text -like '*running the device verifier on*' }
        $beforeDeviceHalf = { param([string]$Statement)
            Edit-ScriptNode $verifierText $deviceHalfStart { param($Text) "$Statement`n    $Text" }.GetNewClosure() }
        # And the other places the tally copies put a statement: before the compare, and after
        # the helpers are dot-sourced.
        $compareStatement = { param($Node)
            $Node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
            $Node.Extent.Text -like '$comparison = Compare-VerifierTallies*' }
        $beforeCompare = { param([string]$Statement)
            Edit-ScriptNode $verifierText $compareStatement { param($Text) "$Statement`n    $Text" }.GetNewClosure() }
        $afterHelpers = { param([string]$Statement)
            Edit-ScriptNode $verifierText $deviceDotSource { param($Text) "$Text`n$Statement" }.GetNewClosure() }
        $approveAll = '[pscustomobject]@{ Valid = $true; CleanTotal = 0; PatchedTotal = 0; Deltas = @() }'
        $wiringCases = @(
            @{ Name = 'the untouched verifier'; Check = $dotSourcesDevice; Expect = $true; Text = $verifierText }
            @{ Name = 'the untouched verifier'; Check = $talliesBothSides; Expect = $true; Text = $verifierText }
            @{ Name = 'the untouched pre-push.ps1'; Check = $gateRunsSuite; Expect = $true; Text = $prePushSource }
            @{ Name = 'both tallies taken of the patched APK'; Check = $talliesBothSides
                Text = Edit-ScriptNode $verifierText { param($Node)
                    $Node -is [System.Management.Automation.Language.CommandAst] -and
                    $Node.GetCommandName() -eq 'Invoke-AndroidVerifierTally' -and $Node.Extent.Text -like '*$cleanBase*'
                } { param($Text) $Text.Replace('$cleanBase', '$PatchedApk') } }
            @{ Name = 'both tallies taken into one variable'; Check = $talliesBothSides
                Text = Edit-ScriptNode $verifierText { param($Node)
                    $Node -is [System.Management.Automation.Language.IfStatementAst] -and
                    $Node.Clauses[0].Item1.Extent.Text -eq '$Serial' } { param($Text)
                    $Text.Replace('$cleanTally', '$tally').Replace('$patchedTally', '$tally') } }
            @{ Name = 'the clean tally written over with the patched one before the compare'; Check = $talliesBothSides
                Text = Edit-ScriptNode $verifierText { param($Node)
                    $Node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
                    $Node.Extent.Text -like '$comparison = Compare-VerifierTallies*' } { param($Text)
                    "`$cleanTally = `$patchedTally`n    $Text" } }
            @{ Name = 'Compare-VerifierTallies defined in the verifier itself'; Check = $talliesBothSides
                Text = Edit-ScriptNode $verifierText $deviceDotSource { param($Text)
                    "$Text`nfunction Compare-VerifierTallies { param(`$Clean, `$Patched)`n" +
                    "    [pscustomobject]@{ Valid = `$true; CleanTotal = 0; PatchedTotal = 0; Deltas = @() } }" } }
            @{ Name = 'Invoke-AndroidVerifierTally defined in the verifier itself'; Check = $talliesBothSides
                Text = Edit-ScriptNode $verifierText $deviceDotSource { param($Text)
                    "$Text`nfunction Invoke-AndroidVerifierTally { @{} }" } }
            @{ Name = 'the device half in a function nothing calls'; Check = $talliesBothSides
                Text = Edit-ScriptNode $verifierText { param($Node)
                    $Node -is [System.Management.Automation.Language.IfStatementAst] -and
                    $Node.Clauses[0].Item1.Extent.Text -eq '$Serial' } { param($Text) "function Invoke-DeviceHalf {`n$Text`n}" } }
            @{ Name = 'the device helper dot-sourced in a dead branch'; Check = $dotSourcesDevice
                Text = Edit-ScriptNode $verifierText $deviceDotSource { param($Text) "if (`$false) { $Text }" } }
            # Statements that end their block with the exit nested inside them. First in the device
            # half, each leaves every -Serial run passing with no tally taken. The copies expected
            # to pass keep those rules off statements that can still carry on: a catch that
            # finishes, a clause that matches and finishes, a break out of the do, and a return
            # out of the script block.
            @{ Name = 'the device half after try { exit 0 } finally { }'; Check = $talliesBothSides
                Text = & $beforeDeviceHalf 'try { exit 0 } finally { }' }
            @{ Name = 'the device half after try { exit 0 } catch { }'; Check = $talliesBothSides
                Text = & $beforeDeviceHalf 'try { exit 0 } catch { }' }
            @{ Name = "the device half after try { throw 'skip' } catch { exit 0 }"; Check = $talliesBothSides
                Text = & $beforeDeviceHalf "try { throw 'skip' } catch { exit 0 }" }
            @{ Name = 'the device half after try { } finally { exit 0 }'; Check = $talliesBothSides
                Text = & $beforeDeviceHalf 'try { } finally { exit 0 }' }
            @{ Name = "the device half after try { throw 'skip' } catch { }"; Check = $talliesBothSides; Expect = $true
                Text = & $beforeDeviceHalf "try { throw 'skip' } catch { }" }
            @{ Name = 'the device half after switch (1) { default { exit 0 } }'; Check = $talliesBothSides
                Text = & $beforeDeviceHalf 'switch (1) { default { exit 0 } }' }
            @{ Name = 'the device half after switch (1) { 1 { exit 0 } }'; Check = $talliesBothSides
                Text = & $beforeDeviceHalf 'switch (1) { 1 { exit 0 } }' }
            @{ Name = "the device half after switch (2) { 1 { 'one' } default { exit 0 } }"; Check = $talliesBothSides
                Text = & $beforeDeviceHalf "switch (2) { 1 { 'one' } default { exit 0 } }" }
            @{ Name = "the device half after switch (1) { 1 { 'one' } default { exit 0 } }"; Check = $talliesBothSides; Expect = $true
                Text = & $beforeDeviceHalf "switch (1) { 1 { 'one' } default { exit 0 } }" }
            @{ Name = 'the device half after a switch with no default'; Check = $talliesBothSides; Expect = $true
                Text = & $beforeDeviceHalf 'switch (1) { 2 { exit 0 } }' }
            @{ Name = 'the device half after a switch a break can leave'; Check = $talliesBothSides; Expect = $true
                Text = & $beforeDeviceHalf 'switch (1) { default { if ($Serial) { break }; exit 0 } }' }
            @{ Name = 'the device half after a switch over @()'; Check = $talliesBothSides; Expect = $true
                Text = & $beforeDeviceHalf 'switch (@()) { default { exit 0 } }' }
            @{ Name = 'the device half after do { exit 0 } while ($false)'; Check = $talliesBothSides
                Text = & $beforeDeviceHalf 'do { exit 0 } while ($false)' }
            @{ Name = 'the device half after do { exit 0 } until ($true)'; Check = $talliesBothSides
                Text = & $beforeDeviceHalf 'do { exit 0 } until ($true)' }
            @{ Name = 'the device half after a do a break can leave'; Check = $talliesBothSides; Expect = $true
                Text = & $beforeDeviceHalf 'do { if ($Serial) { break }; exit 0 } while ($false)' }
            @{ Name = 'the device half after & { exit 0 }'; Check = $talliesBothSides
                Text = & $beforeDeviceHalf '& { exit 0 }' }
            @{ Name = "the device half after . { throw 'skip' }"; Check = $talliesBothSides
                Text = & $beforeDeviceHalf ". { throw 'skip' }" }
            @{ Name = 'the device half after & { begin { exit 0 } }'; Check = $talliesBothSides
                Text = & $beforeDeviceHalf '& { begin { exit 0 } }' }
            @{ Name = 'the device half after & { process { exit 0 } }'; Check = $talliesBothSides
                Text = & $beforeDeviceHalf '& { process { exit 0 } }' }
            @{ Name = 'the device half after @() | & { process { exit 0 } }, which runs no process block'
                Check = $talliesBothSides; Expect = $true
                Text = & $beforeDeviceHalf '@() | & { process { exit 0 } }' }
            @{ Name = 'the device half after a script block a return can leave'; Check = $talliesBothSides; Expect = $true
                Text = & $beforeDeviceHalf '& { if ($Serial) { return }; exit 0 }' }
            # A tally input or a tally written in a way that isn't an assignment to the tally
            # variable, or a helper replaced without a function statement. Each leaves every
            # -Serial run comparing a build with itself, or not comparing at all. The copies
            # expected to pass write other names the same ways.
            @{ Name = 'the clean input set to the patched APK in the device half'; Check = $talliesBothSides
                Text = & $beforeDeviceHalf '$cleanBase = $PatchedApk' }
            @{ Name = 'the patched input set to the clean one in the device half'; Check = $talliesBothSides
                Text = & $beforeDeviceHalf '$PatchedApk = $cleanBase' }
            @{ Name = 'the clean input taken from the patched APK instead of Get-BaseApk'; Check = $talliesBothSides
                Text = Edit-ScriptNode $verifierText { param($Node)
                    $Node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
                    $Node.Extent.Text -like '$cleanBase = Get-BaseApk*' } { param($Text) '$cleanBase = $PatchedApk' } }
            @{ Name = 'the clean input taken again, from the patched APK, before the DexDiff run'; Check = $talliesBothSides
                Text = Edit-ScriptNode $verifierText { param($Node)
                    $Node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
                    $Node.Extent.Text -eq '$diff = Invoke-DexDiff' } { param($Text)
                    "`$cleanBase = Get-BaseApk -Apk `$PatchedApk -Destination (Join-Path `$work 'again.apk')`n$Text" } }
            @{ Name = 'the clean input taken from a command other than Get-BaseApk'; Check = $talliesBothSides
                Text = Edit-ScriptNode $verifierText { param($Node)
                    $Node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
                    $Node.Extent.Text -like '$cleanBase = Get-BaseApk*' } { param($Text) '$cleanBase = Write-Output $PatchedApk' } }
            @{ Name = 'the patched input set to the clean one by a function the device half calls'; Check = $talliesBothSides
                Text = Edit-ScriptNode (& $afterHelpers 'function Reset-Input { $script:PatchedApk = $script:cleanBase }') `
                    $deviceHalfStart { param($Text) "Reset-Input`n    $Text" } }
            @{ Name = 'the clean input written with -OutVariable in the device half'; Check = $talliesBothSides
                Text = & $beforeDeviceHalf 'Write-Output $PatchedApk -OutVariable cleanBase | Out-Null' }
            @{ Name = 'the clean tally written over with Set-Variable'; Check = $talliesBothSides
                Text = & $beforeCompare 'Set-Variable -Name cleanTally -Value $patchedTally' }
            @{ Name = 'the clean tally written over with sv'; Check = $talliesBothSides
                Text = & $beforeCompare 'sv cleanTally $patchedTally' }
            @{ Name = 'the clean tally written over with Microsoft.PowerShell.Utility\Set-Variable'; Check = $talliesBothSides
                Text = & $beforeCompare 'Microsoft.PowerShell.Utility\Set-Variable -Name cleanTally -Value $patchedTally' }
            @{ Name = 'the clean tally written over with New-Variable -Force'; Check = $talliesBothSides
                Text = & $beforeCompare 'New-Variable -Name cleanTally -Value $patchedTally -Force' }
            @{ Name = 'the clean tally emptied with Clear-Variable'; Check = $talliesBothSides
                Text = & $beforeCompare 'Clear-Variable -Name cleanTally' }
            @{ Name = 'the clean tally written over through the variable: drive'; Check = $talliesBothSides
                Text = & $beforeCompare 'Set-Item -Path variable:cleanTally -Value $patchedTally' }
            @{ Name = 'the clean tally written over by a foreach over the patched one'; Check = $talliesBothSides
                Text = & $beforeCompare 'foreach ($cleanTally in @($patchedTally)) { }' }
            @{ Name = 'a tally written over with Set-Variable of a name built at run time'; Check = $talliesBothSides
                Text = & $beforeCompare "Set-Variable -Name ('clean' + 'Tally') -Value `$patchedTally" }
            @{ Name = 'Compare-VerifierTallies replaced through ${function:}'; Check = $talliesBothSides
                Text = & $afterHelpers "`${function:Compare-VerifierTallies} = { param(`$Clean, `$Patched) $approveAll }" }
            @{ Name = 'Compare-VerifierTallies replaced with Set-Item function:'; Check = $talliesBothSides
                Text = & $afterHelpers "Set-Item -Path function:Compare-VerifierTallies -Value { param(`$Clean, `$Patched) $approveAll }" }
            @{ Name = 'Invoke-AndroidVerifierTally replaced with New-Item function:'; Check = $talliesBothSides
                Text = & $afterHelpers 'New-Item -Path function: -Name Invoke-AndroidVerifierTally -Value { @{} } -Force | Out-Null' }
            @{ Name = 'Compare-VerifierTallies defined in the verifier as script:Compare-VerifierTallies'; Check = $talliesBothSides
                Text = & $afterHelpers "function script:Compare-VerifierTallies { param(`$Clean, `$Patched) $approveAll }" }
            @{ Name = 'the clean tally written over through $script:cleanTally'; Check = $talliesBothSides
                Text = & $beforeCompare '$script:cleanTally = $patchedTally' }
            @{ Name = 'Compare-VerifierTallies made an alias of a function of the script'; Check = $talliesBothSides
                Text = & $afterHelpers "function Approve-Tallies { param(`$Clean, `$Patched) $approveAll }`nSet-Alias -Name Compare-VerifierTallies -Value Approve-Tallies" }
            @{ Name = 'another variable set with Set-Variable before the compare'; Check = $talliesBothSides; Expect = $true
                Text = & $beforeCompare 'Set-Variable -Name note -Value $patchedTally' }
            @{ Name = 'another function set up through the function: drive'; Check = $talliesBothSides; Expect = $true
                Text = & $afterHelpers "Set-Item -Path function:Show-Note -Value { 'note' }" }
            @{ Name = 'an alias of another name'; Check = $talliesBothSides; Expect = $true
                Text = & $afterHelpers 'Set-Alias -Name Show-Note -Value Write-Host' }
            @{ Name = 'the suite line in a block comment'; Check = $gateRunsSuite
                Text = Edit-ScriptNode $prePushSource { param($Node)
                    $Node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
                    $Node.Left.Extent.Text -eq '$suites' -and
                    $Node.Extent.Text -like "*'scripts/test-injected-register-device.ps1'*" } { param($Text) "<#`n$Text`n#>" } }
        )
        $wiringFailures = @()
        foreach ($case in $wiringCases) {
            [System.IO.File]::WriteAllText($wiringCopy, $case.Text)
            $expect = $case.ContainsKey('Expect') -and $case.Expect
            if ((& $case.Check $wiringCopy) -ne $expect) {
                $wiringFailures += "$($case.Name): the check said $(-not $expect)"
            }
        }
        if ($wiringFailures.Count -ne 0) { throw ("The wiring checks misjudged:`n" + ($wiringFailures -join "`n")) }
    } finally {
        [System.IO.File]::Delete($wiringCopy)
    }

} finally {
    [System.IO.File]::Delete($fixture)
}

$global:LASTEXITCODE = 0
Write-Host '[scripts] injected-register device cleanup contracts passed'
