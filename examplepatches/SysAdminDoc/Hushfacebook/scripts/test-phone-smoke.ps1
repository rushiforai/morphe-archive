<# Exercise phone-smoke.ps1's report reading on hand-written reports, without a phone. #>
[CmdletBinding()]
# The push gate hands every suite -Root. These checks read only the reports written below.
param([string]$Root)
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'phone-smoke.ps1')

$failures = New-Object System.Collections.Generic.List[string]
function Assert-That([bool]$Condition, [string]$Message) {
    if (-not $Condition) { $failures.Add($Message) }
}

function New-Report([string[]]$Hooks, [string]$State = 'hushfacebook: running', [string[]]$Crash = @()) {
    $lines = @('MORPHE DIAGNOSTIC REPORT', 'schema: 1', 'app: com.facebook.katana 582.0.0.50.54 (2147483647)', $State,
        'debug_logging: off', '', '[APP STATE]', 'locale -> en-US')
    if ($Crash.Count -gt 0) { $lines += @('', '[LATEST JAVA CRASH]') + $Crash }
    if ($Hooks.Count -gt 0) { $lines += @('', '[HOOK STATUS]') + $Hooks }
    $lines += @('', '[PATCH OPTIONS]', 'Hide sponsored posts -> on')
    return ($lines -join "`n") + "`n"
}

$healthy = @(
    'Hide sponsored posts: invoked 237, 0 found, 0 missing',
    'Hide Meta upsells: invoked 5403, 3 found, 0 missing. Counted: Meta AI post button kept out 1740, Imagine entry kept out 348',
    'Open Messenger from the top bar: invoked 0, 1 found, 0 missing')
$read = Read-SmokeReport -Text (New-Report $healthy)
Assert-That ($read.Problems.Count -eq 0) "A healthy report reads as failing: $($read.Problems -join ' | ')"
Assert-That ($read.Families.Count -eq 3) "A healthy report gave $($read.Families.Count) families, not 3."
Assert-That ($read.Families[1].Invoked -eq 5403 -and $read.Families[1].Found -eq 3) 'Counts were read wrong.'
Assert-That ($read.Families[1].Detail -like 'Counted: Meta AI post button*') "Counted text was lost: $($read.Families[1].Detail)"
Assert-That ($read.Running) 'A running report reads as not running.'

$read = Read-SmokeReport -Text (New-Report @(
    'Hide sponsored posts: invoked 237, 0 found, 0 missing',
    "Tap to play: invoked 3, 1 found, 1 missing. First missing: a working 'tap' hook (it threw java.lang.NullPointerException)"))
Assert-That ($read.Problems.Count -eq 1 -and $read.Problems[0] -like 'Tap to play: 1 missing*NullPointerException*') `
    "A hook that threw wasn't the one problem: $($read.Problems -join ' | ')"

$read = Read-SmokeReport -Text (New-Report @('Hide tabs: invoked 12, 0 found, 2 ambiguous, 0 missing. First ambiguous: field LX/abc;->a'))
Assert-That ($read.Problems.Count -eq 1 -and $read.Families[0].Ambiguous -eq 2) 'An ambiguous lookup passed.'

$read = Read-SmokeReport -Text (New-Report @('Hide tabs: invoked 12, 0 found, 9 missing, and more it stopped counting'))
Assert-That ($read.Problems.Count -eq 1) 'A truncated family passed.'

$read = Read-SmokeReport -Text (New-Report $healthy -State 'hushfacebook: paused (user), every hook a setting controls takes Facebook''s own path')
Assert-That (-not $read.Running -and ($read.Problems -like '*paused*').Count -eq 1) 'A paused report passed.'

$read = Read-SmokeReport -Text (New-Report @('Masquer les publications: invoqué 3, 1 trouvé, 0 manquant'))
Assert-That ($read.Unread.Count -eq 1 -and ($read.Problems -like '*could not be read*').Count -eq 1) 'A translated line passed unread.'

$read = Read-SmokeReport -Text (New-Report @())
Assert-That (($read.Problems -like '*no `[HOOK STATUS`] table*').Count -eq 1) 'A report without the table passed.'

$read = Read-SmokeReport -Text (New-Report $healthy) -ExpectInvoked @('Open Messenger from the top bar', 'Comment sheet options')
Assert-That ($read.Problems.Count -eq 2) "Expected families didn't each fail once: $($read.Problems -join ' | ')"

$crash = @('schema: 1', 'timestamp_utc: 2026-10-07T21:13:05.931Z', 'exception: java.lang.IllegalStateException')
$walk = [DateTime]::SpecifyKind([DateTime]'2026-10-08T20:30:00', 'Utc')
$read = Read-SmokeReport -Text (New-Report $healthy -Crash $crash) -Since $walk
Assert-That ($read.Problems.Count -eq 0) "A crash from the day before failed the walk: $($read.Problems -join ' | ')"
$read = Read-SmokeReport -Text (New-Report $healthy -Crash $crash) -Since $walk.AddDays(-2)
Assert-That ($read.Problems.Count -eq 1 -and $read.Problems[0] -like '*IllegalStateException*') 'A crash during the walk passed.'
$read = Read-SmokeReport -Text (New-Report $healthy -Crash @('schema: 1', 'exception: java.lang.Error')) -Since $walk
Assert-That ($read.Problems.Count -eq 1) 'A crash with no time passed.'

$read = Read-SmokeReport -Text 'not a report'
Assert-That ($read.Problems.Count -ge 1) 'Text that is not a report passed.'

if ($failures.Count -gt 0) {
    $failures | ForEach-Object { Write-Host "[phone-smoke] FAIL $_" }
    throw "$($failures.Count) phone-smoke report check(s) failed."
}
Write-Host '[phone-smoke] report reading checks passed'
