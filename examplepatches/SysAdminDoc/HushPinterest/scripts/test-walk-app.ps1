<#
.SYNOPSIS
    Contract tests for walk-app.ps1: the result a walk earns, what it reads off the device, and the
    receipts publish will and won't honor.

.DESCRIPTION
    walk-app.ps1 decides a walk's result with Resolve-WalkOutcome and writes it with New-WalkReceipt.
    These dot-source walk-app.ps1 (its main body is skipped when the script is dot-sourced) and drive
    it with no device: a crash earns FAIL, a skipped part earns PARTIAL, and only a whole clean walk
    earns PASS. The crash filter has to keep a Pinterest crash from the walk and drop another app's
    or an older one, and the dump reader has to find a settings row by its exact text only. Then the
    receipts those results produce are held to Test-WalkReceipt, the same gate
    release/publish-release.ps1 uses, so a FAIL or PARTIAL walk can't back a release and a PASS walk
    of a different bundle can't either. test-script-contracts.ps1 runs this suite, so the push gate
    runs it whenever a script changes.
#>
[CmdletBinding()]
param([string]$Root)

$ErrorActionPreference = 'Stop'
$scratch = [IO.Path]::GetFullPath((Join-Path ([IO.Path]::GetTempPath()) ('hushpinterest-walk-app-' + [guid]::NewGuid().ToString('N'))))
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
    Assert-True ((Resolve-WalkOutcome -Screens 17 -Crashes 0 -Problems @('pinterest://notifications/ would not open') -Full $true) -ceq 'FAIL') `
        'A screen that would not open should earn FAIL.'
    Assert-True ((Resolve-WalkOutcome -Screens 6 -Crashes 0 -Problems @() -Full $false) -ceq 'PARTIAL') `
        'A walk that skipped the settings pages should earn PARTIAL.'
    Assert-True ((Resolve-WalkOutcome -Screens 0 -Crashes 0 -Problems @() -Full $true) -ceq 'PARTIAL') `
        'A walk that opened no screen should earn PARTIAL.'
    Assert-True ((Resolve-WalkOutcome -Screens 17 -Crashes 0 -Problems @() -Full $true) -ceq 'PASS') `
        'A whole clean walk should earn PASS.'
    Assert-True ((Resolve-WalkOutcome -Screens 6 -Crashes 2 -Problems @() -Full $false) -ceq 'FAIL') `
        'A crash should outrank an incomplete walk.'

    # Get-WalkCrashLines: only a Pinterest crash at or after the walk's start counts.
    $crashBuffer = @(
        '--------- beginning of crash',
        '1792000000.120  1234  1234 E AndroidRuntime: FATAL EXCEPTION: main',
        '1792000000.120  1234  1234 E AndroidRuntime: Process: com.pinterest, PID: 1234',
        '1792000500.400  2222  2222 E AndroidRuntime: FATAL EXCEPTION: main',
        '1792000500.400  2222  2222 E AndroidRuntime: Process: com.pinterest.helper, PID: 2222',
        '1792000501.000  2300  2300 E AndroidRuntime: Process: com.android.systemui, PID: 2300',
        '1792000502.000  2301  2301 F DEBUG   : pid: 2301, tid: 2301, name: Thread-9  >>> com.pinterest:remote <<<',
        '1792000503.000  2400  2400 E AndroidRuntime: FATAL EXCEPTION: main',
        '1792000503.000  2400  2400 E AndroidRuntime: Process: com.pinterest, PID: 2400',
        '1792000504.000  2401  2401 F DEBUG   : pid: 2401, tid: 2401, name: RenderThread  >>> com.pinterest <<<'
    )
    $walkCrashes = @(Get-WalkCrashLines -Lines $crashBuffer -Since 1792000400 -Package 'com.pinterest')
    Assert-True ($walkCrashes.Count -eq 3) "The crash filter kept $($walkCrashes.Count) lines, not the walk's three Pinterest crashes."
    Assert-True ($walkCrashes[0] -like '*>>> com.pinterest:remote <<<' -and $walkCrashes[1] -like '*PID: 2400' -and
        $walkCrashes[2] -like '*>>> com.pinterest <<<') 'The crash filter kept the wrong lines.'
    Assert-True (@(Get-WalkCrashLines -Lines $crashBuffer[0..2] -Since 1792000400 -Package 'com.pinterest').Count -eq 0) `
        'A Pinterest crash from before the walk was counted against it.'

    # ConvertFrom-WalkDump and Find-WalkRow: a row is found by its exact text in Pinterest only.
    $dump = @'
<?xml version='1.0' encoding='UTF-8' standalone='yes' ?><hierarchy rotation="0">
<node text="" package="com.pinterest" bounds="[0,0][720,1600]">
<node text="Search settings" package="com.pinterest" bounds="[32,100][688,160]" />
<node text="BROWSE SETTINGS" package="com.pinterest" bounds="[32,180][688,240]" />
<node text="Feed" package="com.pinterest" bounds="[32,300][688,380]" />
<node text="Feed and search" package="com.pinterest" bounds="[32,400][688,480]" />
<node text="Pin actions" package="com.pinterest" bounds="[32,500][688,580]" />
<node text="Pin actions" package="com.pinterest" bounds="[32,600][688,680]" />
<node text="Privacy" package="com.android.systemui" bounds="[0,0][720,40]" />
</node></hierarchy>
'@
    $nodes = @(ConvertFrom-WalkDump $dump)
    $feed = Find-WalkRow $nodes 'Feed' 'com.pinterest'
    Assert-True ($null -ne $feed -and $feed.X -eq 360 -and $feed.Y -eq 340) 'The Feed row was not found at the centre of its bounds.'
    Assert-True ($null -eq (Find-WalkRow $nodes 'feed' 'com.pinterest')) 'A row was matched by text of another case.'
    Assert-True ($null -ne (Find-WalkRow $nodes $WalkSettingsHome 'com.pinterest')) `
        "The walk looks for the settings list's search box as '$WalkSettingsHome', not as the dump shows it."
    Assert-True ($null -eq (Find-WalkRow $nodes 'Privacy' 'com.pinterest')) 'A row from another app was taken for a settings row.'
    Assert-True ($null -eq (Find-WalkRow $nodes 'Pin actions' 'com.pinterest')) 'Two rows with the same text were taken for one.'
    Assert-True (@(ConvertFrom-WalkDump 'ERROR: could not get idle state.').Count -eq 0) 'A failed dump read as a screen.'

    # The receipts those results produce, held to the publish gate.
    $bundle = Join-Path $scratch 'patches-0.0.0.mpp'
    [IO.File]::WriteAllText($bundle, 'walk-app contract fixture bundle')
    $bundleSha256 = (Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash.ToLowerInvariant()
    $started = [DateTimeOffset]::Parse('2026-10-22T00:00:00Z')
    $finished = $started.AddMinutes(6)
    $catalogPath = if ($Root) { Join-Path $Root 'patches-list.json' } else { Join-Path (Split-Path -Parent $PSScriptRoot) 'patches-list.json' }
    $catalogHash = (Get-FileHash -LiteralPath $catalogPath -Algorithm SHA256).Hash.ToLowerInvariant()
    $firstPatch = (Get-Content -LiteralPath $catalogPath -Raw | ConvertFrom-Json).patches[0].name

    function New-WalkReceiptFile([string]$Name, [string]$Result, [bool]$Full, [int]$Screens, [int]$Crashes, [string]$Sha, [string[]]$Problems) {
        $build = [ordered]@{
            schema = 1; bundleSha256 = $Sha; fixtureSha256 = 'f' * 64; catalogSha256 = $catalogHash
            packageName = 'com.pinterest'; appVersion = '14.42.0'; appVersionCode = '14428010'
            selectedPatches = @($firstPatch); signedApkSha256 = '0' * 64
            completed = $started.AddMinutes(-1).UtcDateTime.ToString('o')
        }
        $receipt = New-WalkReceipt -Result $Result -Full $Full -Serial 'emulator-5554' -Device 'sdk_gphone64_x86_64' `
            -AppVersion '14.42.0' -AppVersionCode '14428010' -Build $build -BundleSha256 $Sha -InstalledApkSha256 ('0' * 64) `
            -Started $started -Finished $finished -Screens $Screens -Crashes $Crashes -Problems $Problems
        $path = Join-Path $scratch $Name
        [IO.File]::WriteAllText($path, (ConvertTo-Json -InputObject $receipt -Depth 8) + "`n")
        return $path
    }

    $passWalk = New-WalkReceiptFile 'pass.json' 'PASS' $true 17 0 $bundleSha256 @()
    Assert-True (Test-WalkReceipt -Path $passWalk -BundlePath $bundle).Valid `
        'A whole clean walk of this bundle should back a release.'

    $crashWalk = New-WalkReceiptFile 'crash.json' 'FAIL' $false 9 1 $bundleSha256 @('Pinterest crashed during the walk: ...')
    Assert-True (-not (Test-WalkReceipt -Path $crashWalk -BundlePath $bundle).Valid) `
        'A walk that recorded a crash must not back a release.'

    $skipWalk = New-WalkReceiptFile 'skip.json' 'PARTIAL' $false 6 0 $bundleSha256 @()
    Assert-True (-not (Test-WalkReceipt -Path $skipWalk -BundlePath $bundle).Valid) `
        'A walk that skipped part of the app must not back a release.'

    $otherWalk = New-WalkReceiptFile 'other-bundle.json' 'PASS' $true 17 0 ('a' * 64) @()
    Assert-True (-not (Test-WalkReceipt -Path $otherWalk -BundlePath $bundle).Valid) `
        'A clean walk of a different bundle must not back this one.'

    # The old positive fixture accepted unrelated installed APKs. Each mutation preserves the
    # passing bundle hash and changes one other fact publication must hold to the build chain.
    $mutations = [ordered]@{
        legacy = { param($r) $r.schema = 1 }
        unbound = { param($r) $r.build = $null }
        oldInstall = { param($r) $r.installedApkSha256 = 'a' * 64 }
        malformedHash = { param($r) $r.installedApkSha256 = 'not-an-apk-hash' }
        missingHash = { param($r) $r.build.fixtureSha256 = '' }
        newlineHash = { param($r) $r.build.fixtureSha256 = ('f' * 64) + "`n" }
        newlineInstall = { param($r) $r.installedApkSha256 = ('0' * 64) + "`n"; $r.build.signedApkSha256 = $r.installedApkSha256 }
        oldBuildBundle = { param($r) $r.build.bundleSha256 = 'a' * 64 }
        oldCatalog = { param($r) $r.build.catalogSha256 = 'a' * 64 }
        wrongVersion = { param($r) $r.appVersion = 'wrong-version' }
        wrongCode = { param($r) $r.appVersionCode = '14418011' }
        wrongBuildVersion = { param($r) $r.build.appVersion = '14.40.0' }
        wrongPackage = { param($r) $r.build.packageName = 'example.other' }
        noSelection = { param($r) $r.build.selectedPatches = @() }
        unknownSelection = { param($r) $r.build.selectedPatches = @('Not a patch') }
        duplicateSelection = { param($r) $r.build.selectedPatches = @($firstPatch, $firstPatch) }
        stringSchema = { param($r) $r.build.schema = '1' }
        badStart = { param($r) $r.started = 'invalid' }
        badFinish = { param($r) $r.finished = 'invalid' }
        noZone = { param($r) $r.started = '2026-10-22T00:00:00' }
        newlineTime = { param($r) $r.started = "2026-10-22T00:00:00Z`n" }
        ambiguousBuild = { param($r) $r.build.completed = '2026-10-21T23:59:00' }
        reversed = { param($r) $r.finished = '2026-10-21T00:00:00Z' }
        future = { param($r) $r.finished = [DateTimeOffset]::UtcNow.AddDays(1).ToString('o') }
        lateBuild = { param($r) $r.build.completed = '2026-10-23T00:00:00Z' }
        badBuildTime = { param($r) $r.build.completed = 'invalid' }
        problems = { param($r) $r.problems = @('wrong destination') }
        noProblemsList = { param($r) $r.problems = $null }
        stringProblems = { param($r) $r.problems = '' }
        bogusEmulator = { param($r) $r.serial = 'emulator-wrong' }
        newlineSerial = { param($r) $r.serial = "emulator-5554`n" }
        noDevice = { param($r) $r.device = '' }
    }
    foreach ($entry in $mutations.GetEnumerator()) {
        $changed = Get-Content -LiteralPath $passWalk -Raw | ConvertFrom-Json
        & $entry.Value $changed
        $changedPath = Join-Path $scratch ($entry.Key + '.json')
        [IO.File]::WriteAllText($changedPath, (ConvertTo-Json -InputObject $changed -Depth 8))
        $verdict = Test-WalkReceipt -Path $changedPath -BundlePath $bundle -PatchList $catalogPath
        Assert-True (-not $verdict.Valid) "The publish gate accepted $($entry.Key) evidence."
    }
    Assert-True (Test-WalkReceipt -Path $passWalk -BundlePath $bundle -PatchList $catalogPath).Valid `
        'Negative cases must not poison a valid matching build/install chain.'
    $preciseStart = $started.AddMilliseconds(900)
    $preciseBuild = Get-Content -LiteralPath $passWalk -Raw | ConvertFrom-Json
    $preciseBuild.build.completed = $started.AddMilliseconds(800).UtcDateTime.ToString('o')
    $preciseReceipt = New-WalkReceipt -Result 'PASS' -Full $true -Serial 'emulator-5554' -Device 'sdk_gphone64_x86_64' `
        -AppVersion '14.42.0' -AppVersionCode '14428010' -Build $preciseBuild.build -BundleSha256 $bundleSha256 `
        -InstalledApkSha256 ('0' * 64) -Started $preciseStart -Finished $finished -Screens 17 -Crashes 0
    $precisePath = Join-Path $scratch 'fractional.json'
    [IO.File]::WriteAllText($precisePath, (ConvertTo-Json -InputObject $preciseReceipt -Depth 8))
    Assert-True (Test-WalkReceipt -Path $precisePath -BundlePath $bundle -PatchList $catalogPath).Valid `
        'A build completed in the same second before the walk is a valid chain.'

    Write-Host "[walk-app] $passed checks passed"
} finally {
    $temp = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
    if (-not $scratch.StartsWith($temp, [StringComparison]::OrdinalIgnoreCase)) { throw 'Unsafe walk-app fixture cleanup path.' }
    if (Test-Path -LiteralPath $scratch) { Remove-Item -LiteralPath $scratch -Recurse -Force }
}
