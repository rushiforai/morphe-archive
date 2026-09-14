<#
.SYNOPSIS
    Exercise ADB failure cleanup for injected-register verification.
#>
[CmdletBinding()]
param([string]$Root)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $PSScriptRoot 'injected-register-device.ps1')

function Assert-True {
    param([bool]$Condition, [string]$Message)
    if (-not $Condition) { throw $Message }
}

function New-FakeAdb {
    param(
        [string]$FailureStage,
        [int]$CleanupFailureNumber = 0,
        [int]$CleanupThrowNumber = 0
    )

    $state = [pscustomobject]@{
        Calls = [System.Collections.Generic.List[string]]::new()
        RemotePaths = [System.Collections.Generic.HashSet[string]]::new(
            [System.StringComparer]::Ordinal)
        CleanupCalls = 0
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
        } elseif ($operation -eq 'logcat' -and $Arguments[3] -eq '-c') {
            if ($FailureStage -eq 'clear') { $exitCode = 13 }
        } elseif ($operation -eq 'shell' -and $Arguments[3] -like 'dex2oat64*') {
            $output = if ($FailureStage -eq 'dex2oat') { @('exit=14') } else { @('exit=0') }
        } elseif ($operation -eq 'logcat' -and $Arguments[3] -eq '-d') {
            if ($FailureStage -eq 'log-read-throw') {
                throw 'fake ADB threw while reading logcat'
            } elseif ($FailureStage -eq 'log-read') {
                $exitCode = 15
            } else {
                $output = @(
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
        '-s SERIAL shell rm -rf /data/local/tmp/hushfeed-verify-case',
        '-s SERIAL shell rm -rf /data/local/tmp/hushfeed-verify-case.apk'
    )
    foreach ($call in $expected) {
        Assert-True (@($State.Calls | Where-Object { $_ -eq $call }).Count -eq 1) `
            "$Context did not attempt cleanup exactly once: $call"
    }
}

$failures = [ordered]@{
    push = 'Could not push case to SERIAL (ADB exit 11).'
    setup = 'Could not prepare the verifier output directory for case on SERIAL (ADB exit 12).'
    clear = 'Could not clear logcat on SERIAL before verifying case (ADB exit 13).'
    dex2oat = 'dex2oat on case exited 14.'
    'log-read' = 'Could not read logcat on SERIAL after verifying case (ADB exit 15).'
}
foreach ($stage in $failures.Keys) {
    $fake = New-FakeAdb -FailureStage $stage
    $caught = $null
    try {
        [void](Invoke-AndroidVerifierTally -Adb 'fake-adb' -Serial 'SERIAL' `
            -Local 'C:/fixture.apk' -Label 'case' -AdbInvoker $fake.Invoker)
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
        -Local 'C:/fixture.apk' -Label 'case' -AdbInvoker $thrownFailure.Invoker)
} catch {
    $caught = $_
}
Assert-True ($caught.Exception.Message -eq 'fake ADB threw while reading logcat') `
    'A thrown ADB error was replaced or accepted.'
Assert-BothCleanupCalls -State $thrownFailure.State -Context 'thrown log retrieval failure'
Assert-True ($thrownFailure.State.RemotePaths.Count -eq 0) `
    'A thrown ADB error left fake remote files behind.'

$primaryWithCleanupFailure = New-FakeAdb -FailureStage 'clear' -CleanupThrowNumber 1
$warnings = @()
$caught = $null
try {
    [void](Invoke-AndroidVerifierTally -Adb 'fake-adb' -Serial 'SERIAL' `
        -Local 'C:/fixture.apk' -Label 'case' -AdbInvoker $primaryWithCleanupFailure.Invoker `
        -WarningVariable warnings)
} catch {
    $caught = $_
}
Assert-True ($caught.Exception.Message -eq $failures.clear) `
    'A cleanup failure replaced the original verification failure.'
Assert-BothCleanupCalls -State $primaryWithCleanupFailure.State -Context 'secondary cleanup failure'
Assert-True (($warnings | ForEach-Object { "$_" }) -join "`n" -match 'cleanup also failed') `
    'A cleanup failure beside a primary failure produced no secondary diagnostic.'

$success = New-FakeAdb
$tally = Invoke-AndroidVerifierTally -Adb 'fake-adb' -Serial 'SERIAL' `
    -Local 'C:/fixture.apk' -Label 'case' -AdbInvoker $success.Invoker
Assert-True ($tally.Count -eq 2 -and $tally['Verification error in Lfixture/Host;'] -eq 2 -and
    $tally['VerifyError in Lfixture/Other;'] -eq 1) 'The successful fake verifier tally was wrong.'
Assert-BothCleanupCalls -State $success.State -Context 'success'
Assert-True ($success.State.RemotePaths.Count -eq 0) 'The successful run left fake remote files behind.'

$successWithCleanupFailure = New-FakeAdb -CleanupFailureNumber 1
$caught = $null
try {
    [void](Invoke-AndroidVerifierTally -Adb 'fake-adb' -Serial 'SERIAL' `
        -Local 'C:/fixture.apk' -Label 'case' -AdbInvoker $successWithCleanupFailure.Invoker)
} catch {
    $caught = $_
}
Assert-True ($null -ne $caught -and $caught.Exception.Message -like 'Verifier cleanup failed.*') `
    'A cleanup failure after successful verification was accepted.'
Assert-BothCleanupCalls -State $successWithCleanupFailure.State -Context 'success cleanup failure'

$verifierText = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'verify-injected-registers.ps1') -Raw
Assert-True ($verifierText -match 'injected-register-device\.ps1' -and
    $verifierText -match 'Invoke-AndroidVerifierTally') `
    'The device verifier does not use the cleanup helper.'
$prePushText = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'pre-push.ps1') -Raw
Assert-True ($prePushText -match 'scripts/test-injected-register-device\.ps1') `
    'The push gate does not run the verifier cleanup fixtures.'

$global:LASTEXITCODE = 0
Write-Host '[scripts] injected-register device cleanup contracts passed'
