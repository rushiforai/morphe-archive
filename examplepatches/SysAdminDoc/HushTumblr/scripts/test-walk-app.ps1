<#
.SYNOPSIS
    Contract tests for walk-app.ps1: the result a walk earns, what it reads off the device, and the
    receipts publish will and won't honor.

.DESCRIPTION
    walk-app.ps1 decides a walk's result with Resolve-WalkOutcome and writes it with New-WalkReceipt.
    These dot-source walk-app.ps1 (its main body is skipped when the script is dot-sourced) and drive
    it with no device: a crash earns FAIL, a skipped part earns PARTIAL, and only a whole clean walk
    earns PASS. The crash filter has to keep a Tumblr crash from the walk and drop another app's
    or an older one, and the dump reader has to find a settings row by its exact text only. Then the
    receipts those results produce are held to Test-WalkReceipt, the same gate
    release/publish-release.ps1 uses, so a FAIL or PARTIAL walk can't back a release and a PASS walk
    of a different bundle can't either. test-script-contracts.ps1 runs this suite, so the push gate
    runs it whenever a script changes.
#>
[CmdletBinding()]
param([string]$Root)

$ErrorActionPreference = 'Stop'
$scratch = [IO.Path]::GetFullPath((Join-Path ([IO.Path]::GetTempPath()) ('hushtumblr-walk-app-' + [guid]::NewGuid().ToString('N'))))
$passed = 0

function Assert-True([bool]$Condition, [string]$Message) {
    if (-not $Condition) { throw $Message }
    $script:passed++
}

. (Join-Path $PSScriptRoot 'walk-app.ps1')

try {
    New-Item -ItemType Directory -Force -Path $scratch | Out-Null

    # Resolve-WalkOutcome: the result a walk earns.
    Assert-True ((Resolve-WalkOutcome -Screens 17 -Crashes 1 -Problems @() -Full $true) -ceq 'FAIL') `
        'A crash during a full walk should earn FAIL.'
    Assert-True ((Resolve-WalkOutcome -Screens 17 -Crashes 0 -Problems @('https://www.tumblr.com/likes would not open') -Full $true) -ceq 'FAIL') `
        'A screen that would not open should earn FAIL.'
    Assert-True ((Resolve-WalkOutcome -Screens 6 -Crashes 0 -Problems @() -Full $false) -ceq 'PARTIAL') `
        'A walk that skipped the settings pages should earn PARTIAL.'
    Assert-True ((Resolve-WalkOutcome -Screens 0 -Crashes 0 -Problems @() -Full $true) -ceq 'PARTIAL') `
        'A walk that opened no screen should earn PARTIAL.'
    Assert-True ((Resolve-WalkOutcome -Screens 1 -Crashes 0 -Problems @() -Full $true) -cne 'PASS') `
        'A positive screen count without named route evidence passed.'
    Assert-True ((Resolve-WalkOutcome -Screens 6 -Crashes 2 -Problems @() -Full $false) -ceq 'FAIL') `
        'A crash should outrank an incomplete walk.'

    # Get-WalkCrashLines: only a Tumblr crash at or after the walk's start counts.
    $crashBuffer = @(
        '--------- beginning of crash',
        '1792000000.120  1234  1234 E AndroidRuntime: FATAL EXCEPTION: main',
        '1792000000.120  1234  1234 E AndroidRuntime: Process: com.tumblr, PID: 1234',
        '1792000500.400  2222  2222 E AndroidRuntime: FATAL EXCEPTION: main',
        '1792000500.400  2222  2222 E AndroidRuntime: Process: com.tumblr.helper, PID: 2222',
        '1792000501.000  2300  2300 E AndroidRuntime: Process: com.android.systemui, PID: 2300',
        '1792000502.000  2301  2301 F DEBUG   : pid: 2301, tid: 2301, name: Thread-9  >>> com.tumblr:remote <<<',
        '1792000503.000  2400  2400 E AndroidRuntime: FATAL EXCEPTION: main',
        '1792000503.000  2400  2400 E AndroidRuntime: Process: com.tumblr, PID: 2400',
        '1792000504.000  2401  2401 F DEBUG   : pid: 2401, tid: 2401, name: RenderThread  >>> com.tumblr <<<'
    )
    $walkCrashes = @(Get-WalkCrashLines -Lines $crashBuffer -Since 1792000400 -Package 'com.tumblr')
    Assert-True ($walkCrashes.Count -eq 3) "The crash filter kept $($walkCrashes.Count) lines, not the walk's three Tumblr crashes."
    Assert-True ($walkCrashes[0] -like '*>>> com.tumblr:remote <<<' -and $walkCrashes[1] -like '*PID: 2400' -and
        $walkCrashes[2] -like '*>>> com.tumblr <<<') 'The crash filter kept the wrong lines.'
    Assert-True (@(Get-WalkCrashLines -Lines $crashBuffer[0..2] -Since 1792000400 -Package 'com.tumblr').Count -eq 0) `
        'A Tumblr crash from before the walk was counted against it.'

    # ConvertFrom-WalkDump and Find-WalkRow: a row is found by its exact text in Tumblr only.
    $dump = @'
<?xml version='1.0' encoding='UTF-8' standalone='yes' ?><hierarchy rotation="0">
<node text="" package="com.tumblr" bounds="[0,0][720,1600]">
<node text="Search settings" package="com.tumblr" bounds="[32,100][688,160]" />
<node text="BROWSE SETTINGS" package="com.tumblr" bounds="[32,180][688,240]" />
<node text="Feed" package="com.tumblr" bounds="[32,300][688,380]" />
<node text="Feed and search" package="com.tumblr" bounds="[32,400][688,480]" />
<node text="Posts" package="com.tumblr" bounds="[32,500][688,580]" />
<node text="Posts" package="com.tumblr" bounds="[32,600][688,680]" />
<node text="Privacy" package="com.android.systemui" bounds="[0,0][720,40]" />
</node></hierarchy>
'@
    $nodes = @(ConvertFrom-WalkDump $dump)
    $feed = Find-WalkRow $nodes 'Feed' 'com.tumblr'
    Assert-True ($null -ne $feed -and $feed.X -eq 360 -and $feed.Y -eq 340) 'The Feed row was not found at the centre of its bounds.'
    Assert-True ($null -eq (Find-WalkRow $nodes 'feed' 'com.tumblr')) 'A row was matched by text of another case.'
    Assert-True ($null -ne (Find-WalkRow $nodes $WalkSettingsHome 'com.tumblr')) `
        "The walk looks for the settings list's search box as '$WalkSettingsHome', not as the dump shows it."
    Assert-True ($null -eq (Find-WalkRow $nodes 'Privacy' 'com.tumblr')) 'A row from another app was taken for a settings row.'
    Assert-True ($null -eq (Find-WalkRow $nodes 'Posts' 'com.tumblr')) 'Two rows with the same text were taken for one.'
    Assert-True (@(ConvertFrom-WalkDump 'ERROR: could not get idle state.').Count -eq 0) 'A failed dump read as a screen.'

    # A launch with Tumblr in front is insufficient: check the actual page and query.
    $searchRoute = @(Get-WalkPlan | Where-Object { $_.id -ceq 'native.search' })[0]
    $searchXml = @'
<hierarchy><node package="com.tumblr" resource-id="com.tumblr:id/search_activity_root_container" bounds="[0,0][1080,2000]">
<node package="com.tumblr" resource-id="com.tumblr:id/post_type_button" bounds="[0,100][200,200]"/>
<node package="com.tumblr" resource-id="com.tumblr:id/time_range_button" bounds="[200,100][400,200]"/>
<node package="com.tumblr" resource-id="com.tumblr:id/searchable_action_bar" text="art" bounds="[0,0][800,100]"/>
</node></hierarchy>
'@
    $searchNodes = @(ConvertFrom-WalkDump $searchXml)
    $observation = Get-WalkObservation $searchRoute $searchNodes 'com.tumblr/.ui.activity.SearchActivity'
    Assert-True (Test-WalkDestination $searchRoute $observation) 'The verified Posts search destination was refused.'
    $wrongQuery = Get-WalkObservation $searchRoute @(ConvertFrom-WalkDump ($searchXml.Replace('text="art"', 'text="private draft"'))) $searchRoute.activity
    Assert-True (-not (Test-WalkDestination $searchRoute $wrongQuery)) 'The wrong search query passed.'
    Assert-True (($wrongQuery | ConvertTo-Json) -cnotlike '*private draft*') 'A private draft entered route evidence.'
    $login = Get-WalkObservation $searchRoute $searchNodes 'com.tumblr/.ui.activity.LoginActivity'
    Assert-True (-not (Test-WalkDestination $searchRoute $login)) 'A login activity passed as search.'
    $missing = Get-WalkObservation $searchRoute @($searchNodes | Where-Object { $_.ResourceId -cne 'com.tumblr:id/time_range_button' }) $searchRoute.activity
    Assert-True (-not (Test-WalkDestination $searchRoute $missing)) 'A different search tab passed as Posts.'

    # Get-WalkListSwipe and Get-WalkScreenKey: the settings list moves in slow, short drags, below
    # the pinned header, and a dump that didn't move reads as the list's end.
    $down = @(Get-WalkListSwipe -Width 1080 -Height 2316 -Direction Down)
    $up = @(Get-WalkListSwipe -Width 1080 -Height 2316 -Direction Up)
    Assert-True ($down.Count -eq 5 -and ($down -join ' ') -ceq '540 1806 540 1343 1200') `
        "A drag down the list was '$($down -join ' ')', not a slow fifth-of-the-screen drag below the header."
    Assert-True (($up -join ' ') -ceq '540 1343 540 1806 1200') "A drag back up the list was '$($up -join ' ')'."
    $moved = @(ConvertFrom-WalkDump ($dump -replace 'bounds="\[32,300\]', 'bounds="[32,200]'))
    Assert-True ((Get-WalkScreenKey $nodes) -ceq (Get-WalkScreenKey @(ConvertFrom-WalkDump $dump))) `
        'Two dumps of the same screen gave different keys, so the walk would never see the list end.'
    Assert-True ((Get-WalkScreenKey $nodes) -cne (Get-WalkScreenKey $moved)) `
        'A list that moved gave the same key, so the walk would stop looking too soon.'

    # The receipts those results produce, held to the publish gate.
    $bundle = Join-Path $scratch 'patches-0.0.0.mpp'
    [IO.File]::WriteAllText($bundle, 'walk-app contract fixture bundle')
    $bundleSha256 = (Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash.ToLowerInvariant()
    $started = [DateTimeOffset]::Parse('2026-10-22T00:00:00Z')
    $finished = $started.AddMinutes(6)

    . (Join-Path $PSScriptRoot 'test-walk-data.ps1')
    $fixture = New-WalkTestData -Directory $scratch -BundlePath $bundle
    $proofArguments = $fixture.Arguments
    Assert-True ((Resolve-WalkOutcome -Screens $fixture.Routes.Count -Crashes 0 -Full $true `
        -Routes $fixture.Routes -PatchNames $fixture.Provenance.patches) -ceq 'PASS') 'A complete declared route plan did not pass.'
    $subset = @($fixture.Routes | Select-Object -First 2)
    Assert-True ((Resolve-WalkOutcome -Screens 2 -Crashes 0 -Full $true -Routes $subset `
        -PatchNames $fixture.Provenance.patches) -ceq 'PARTIAL') 'An intentional subset was not PARTIAL.'
    function New-WalkReceiptFile([string]$Name, [string]$Result, [bool]$Full, [int]$Screens, [int]$Crashes, [string]$Sha, [string[]]$Problems) {
        $runId = 'b' * 32
        $deviceProof = New-WalkTestVerifier -Fixture $fixture -Serial 'emulator-5554' -Model 'sdk_gphone64_x86_64' -RunId $runId
        $deviceProof.Verifier.started = '2026-10-21T15:58:00Z'
        $deviceProof.Verifier.finished = '2026-10-21T15:59:00Z'
        $receipt = New-WalkReceipt -Result $Result -Full $Full -Serial 'emulator-5554' -Device 'sdk_gphone64_x86_64' `
            -AppVersion $fixture.Output.versionName -BundleSha256 $Sha -InstalledApkSha256 $fixture.Output.sha256 `
            -Provenance $fixture.Provenance -InstalledBefore $fixture.Output -InstalledAfter $fixture.Output `
            -Routes $fixture.Routes `
            -RunId $runId -DeviceIdentity $deviceProof.Identity -Verifier $deviceProof.Verifier `
            -Started $started -Finished $finished -Screens $Screens -Crashes $Crashes -Problems $Problems
        $path = Join-Path $scratch $Name
        [IO.File]::WriteAllText($path, (ConvertTo-Json -InputObject $receipt -Depth 8) + "`n")
        return $path
    }

    $passWalk = New-WalkReceiptFile 'pass.json' 'PASS' $true $fixture.Routes.Count 0 $bundleSha256 @()
    Assert-True (Test-WalkReceipt -Path $passWalk -BundlePath $bundle @proofArguments).Valid `
        'A whole clean walk of this bundle should back a release.'

    $crashWalk = New-WalkReceiptFile 'crash.json' 'FAIL' $false 9 1 $bundleSha256 @('Tumblr crashed during the walk: ...')
    Assert-True (-not (Test-WalkReceipt -Path $crashWalk -BundlePath $bundle @proofArguments).Valid) `
        'A walk that recorded a crash must not back a release.'

    $skipWalk = New-WalkReceiptFile 'skip.json' 'PARTIAL' $false 6 0 $bundleSha256 @()
    Assert-True (-not (Test-WalkReceipt -Path $skipWalk -BundlePath $bundle @proofArguments).Valid) `
        'A walk that skipped part of the app must not back a release.'

    $otherWalk = New-WalkReceiptFile 'other-bundle.json' 'PASS' $true 17 0 ('a' * 64) @()
    Assert-True (-not (Test-WalkReceipt -Path $otherWalk -BundlePath $bundle @proofArguments).Valid) `
        'A clean walk of a different bundle must not back this one.'

    Write-Host "[walk-app] $passed checks passed"
} finally {
    $temp = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
    if (-not $scratch.StartsWith($temp, [StringComparison]::OrdinalIgnoreCase)) { throw 'Unsafe walk-app fixture cleanup path.' }
    if (Test-Path -LiteralPath $scratch) { Remove-Item -LiteralPath $scratch -Recurse -Force }
}
