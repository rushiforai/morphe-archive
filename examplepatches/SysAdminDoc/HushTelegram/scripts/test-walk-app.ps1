<#
.SYNOPSIS
    Contract tests for walk-app.ps1: the result a walk earns, what it reads off the device, the
    lease it holds, and the receipts publish will and won't honor.

.DESCRIPTION
    walk-app.ps1 decides a walk's result with Resolve-WalkOutcome and writes it with New-WalkReceipt.
    These dot-source walk-app.ps1 (its main body is skipped when the script is dot-sourced) and drive
    it with no device: a crash earns FAIL, a skipped part earns PARTIAL, and only a whole clean walk
    earns PASS. The crash filter has to keep a crash of the walked Telegram build and drop the other
    build's, another app's or an older one. The dump reader has to find a settings row by its exact
    text only, tell the home list from a page, and tell an open section from a closed one. The lease has to
    carry what the installer checks, never take a live lease from another task, and stop the walk
    once it isn't the walk's any more. Then the receipts those results produce are held to
    Test-WalkReceipt, the same gate release/publish-release.ps1 uses, so a FAIL or PARTIAL walk
    can't back a release and a PASS walk of a different bundle can't either.
    test-script-contracts.ps1 runs this suite.
#>
[CmdletBinding()]
param([string]$Root)

$ErrorActionPreference = 'Stop'
$scratch = [IO.Path]::GetFullPath((Join-Path ([IO.Path]::GetTempPath()) ('hushtelegram-walk-app-' + [guid]::NewGuid().ToString('N'))))
$passed = 0

function Assert-True([bool]$Condition, [string]$Message) {
    if (-not $Condition) { throw $Message }
    $script:passed++
}

. (Join-Path $PSScriptRoot 'walk-app.ps1')

try {
    New-Item -ItemType Directory -Force -Path $scratch | Out-Null

    # Resolve-WalkOutcome: the result a walk earns.
    Assert-True ((Resolve-WalkOutcome -Screens 22 -Crashes 1 -Problems @() -Full $true) -ceq 'FAIL') `
        'A crash during a full walk should earn FAIL.'
    Assert-True ((Resolve-WalkOutcome -Screens 22 -Crashes 0 -Problems @('tg://settings/themes would not open') -Full $true) -ceq 'FAIL') `
        'A screen that would not open should earn FAIL.'
    Assert-True ((Resolve-WalkOutcome -Screens 6 -Crashes 0 -Problems @() -Full $false) -ceq 'PARTIAL') `
        'A walk that skipped the settings pages should earn PARTIAL.'
    Assert-True ((Resolve-WalkOutcome -Screens 0 -Crashes 0 -Problems @() -Full $true) -ceq 'PARTIAL') `
        'A walk that opened no screen should earn PARTIAL.'
    Assert-True ((Resolve-WalkOutcome -Screens 22 -Crashes 0 -Problems @() -Full $true) -ceq 'PASS') `
        'A whole clean walk should earn PASS.'
    Assert-True ((Resolve-WalkOutcome -Screens 6 -Crashes 2 -Problems @() -Full $false) -ceq 'FAIL') `
        'A crash should outrank an incomplete walk.'

    # Get-WalkCrashLines: only a crash of the walked build at or after the walk's start counts.
    $crashBuffer = @(
        '--------- beginning of crash',
        '1792000000.120  1234  1234 E AndroidRuntime: FATAL EXCEPTION: main',
        '1792000000.120  1234  1234 E AndroidRuntime: Process: org.telegram.messenger.web, PID: 1234',
        '1792000500.400  2222  2222 E AndroidRuntime: FATAL EXCEPTION: main',
        '1792000500.400  2222  2222 E AndroidRuntime: Process: org.telegram.messenger, PID: 2222',
        '1792000501.000  2300  2300 E AndroidRuntime: Process: com.android.systemui, PID: 2300',
        '1792000502.000  2301  2301 F DEBUG   : pid: 2301, tid: 2301, name: Thread-9  >>> org.telegram.messenger.web:push <<<',
        '1792000503.000  2400  2400 E AndroidRuntime: FATAL EXCEPTION: main',
        '1792000503.000  2400  2400 E AndroidRuntime: Process: org.telegram.messenger.web, PID: 2400',
        '1792000504.000  2401  2401 F DEBUG   : pid: 2401, tid: 2401, name: RenderThread  >>> org.telegram.messenger.web <<<',
        '1792000505.000  2500  2500 F DEBUG   : pid: 2500, tid: 2500, name: main  >>> org.telegram.messenger.webview <<<'
    )
    $walkCrashes = @(Get-WalkCrashLines -Lines $crashBuffer -Since 1792000400 -Package 'org.telegram.messenger.web')
    Assert-True ($walkCrashes.Count -eq 3) "The crash filter kept $($walkCrashes.Count) lines, not the walk's three web build crashes."
    Assert-True ($walkCrashes[0] -like '*>>> org.telegram.messenger.web:push <<<' -and $walkCrashes[1] -like '*PID: 2400' -and
        $walkCrashes[2] -like '*>>> org.telegram.messenger.web <<<') 'The crash filter kept the wrong lines.'
    $playCrashes = @(Get-WalkCrashLines -Lines $crashBuffer -Since 1792000400 -Package 'org.telegram.messenger')
    Assert-True ($playCrashes.Count -eq 1 -and $playCrashes[0] -like '*PID: 2222') `
        "A walk of the Play build counted the web build's crashes, or missed its own."
    Assert-True (@(Get-WalkCrashLines -Lines $crashBuffer[0..2] -Since 1792000400 -Package 'org.telegram.messenger.web').Count -eq 0) `
        'A Telegram crash from before the walk was counted against it.'

    # ConvertFrom-WalkDump and Find-WalkRow: a row is found by its exact text in Telegram only.
    $package = 'org.telegram.messenger.web'
    $homeDump = @'
<?xml version='1.0' encoding='UTF-8' standalone='yes' ?><hierarchy rotation="0">
<node text="" package="org.telegram.messenger.web" bounds="[0,0][720,1600]">
<node text="HushTelegram" package="org.telegram.messenger.web" bounds="[32,100][500,160]" />
<node text="Pause" package="org.telegram.messenger.web" bounds="[540,100][688,160]" />
<node text="Search settings" package="org.telegram.messenger.web" bounds="[32,180][688,240]" />
<node text="Ads" package="org.telegram.messenger.web" bounds="[32,300][688,380]" />
<node text="Hide sponsored messages" package="org.telegram.messenger.web" bounds="[32,400][688,480]" />
<node text="Chat list" package="org.telegram.messenger.web" bounds="[32,500][688,580]" />
<node text="Pause" package="org.telegram.messenger.web" bounds="[32,600][688,680]" />
<node text="Pause" package="org.telegram.messenger.web" bounds="[32,700][688,760]" />
<node text="Privacy" package="org.telegram.messenger.web" bounds="[32,800][688,880]" />
<node text="Changed switches" package="org.telegram.messenger.web" bounds="[32,900][688,980]" />
<node text="Notifications" package="com.android.systemui" bounds="[0,0][720,40]" />
</node></hierarchy>
'@
    $homeNodes = @(ConvertFrom-WalkDump $homeDump)
    $ads = Find-WalkRow $homeNodes 'Ads' $package
    Assert-True ($null -ne $ads -and $ads.X -eq 360 -and $ads.Y -eq 340) 'The Ads row was not found at the centre of its bounds.'
    Assert-True ($null -eq (Find-WalkRow $homeNodes 'ads' $package)) 'A row was matched by text of another case.'
    Assert-True ($null -eq (Find-WalkRow $homeNodes 'Notifications' $package)) 'A row from another app was taken for a settings row.'
    Assert-True ($null -eq (Find-WalkRow $homeNodes 'Pause' $package)) 'Two rows with the same text were taken for one.'
    Assert-True ($null -eq (Find-WalkRow $homeNodes 'Ads' 'org.telegram.messenger')) 'A row of the web build was taken for the Play build.'
    Assert-True (@(ConvertFrom-WalkDump 'ERROR: could not get idle state.').Count -eq 0) 'A failed dump read as a screen.'

    # Test-WalkSettingsHome and Test-WalkSettingsPage: the home list and a page.
    Assert-True (Test-WalkSettingsHome $homeNodes $package) 'The settings home list was not recognized.'
    $titleOnly = @($homeNodes | Where-Object { $_.Text -cne 'Search settings' })
    Assert-True (Test-WalkSettingsHome $titleOnly $package) 'The home list scrolled under its search box was not recognized by its title.'
    Assert-True (-not (Test-WalkSettingsPage $homeNodes 'Ads' $package)) 'The home list was taken for the Ads page because its row shows.'
    $adsPage = @(ConvertFrom-WalkDump @'
<hierarchy rotation="0"><node text="Ads" package="org.telegram.messenger.web" bounds="[32,100][688,160]" />
<node text="Hide sponsored messages" package="org.telegram.messenger.web" bounds="[32,200][688,280]" /></hierarchy>
'@)
    Assert-True (-not (Test-WalkSettingsHome $adsPage $package)) 'A page was taken for the home list.'
    Assert-True (Test-WalkSettingsPage $adsPage 'Ads' $package) 'The Ads page was not recognized by its title.'
    Assert-True (-not (Test-WalkSettingsPage $adsPage 'Chat list' $package)) 'The Ads page was taken for another page.'

    # Find-WalkHeading and Get-WalkSectionState: a section opens in place on the home list.
    $headings = @('Ads', 'Chat list', 'Pause', 'Privacy')
    $pauseHeading = Find-WalkHeading $homeNodes 'Pause' $package
    Assert-True ($null -ne $pauseHeading -and $pauseHeading.Y -eq 640) `
        "The Pause heading was taken from the toolbar's Pause button or the Pause row under it."
    Assert-True ((Get-WalkSectionState $homeNodes 'Ads' $headings $package) -ceq 'open') 'The open Ads section read as closed.'
    Assert-True ((Get-WalkSectionState $homeNodes 'Chat list' $headings $package) -ceq 'closed') `
        'A section with another heading right under it read as open.'
    Assert-True ((Get-WalkSectionState $homeNodes 'Pause' $headings $package) -ceq 'open') `
        'The Pause section read as closed because its first row shares its name.'
    Assert-True ((Get-WalkSectionState $homeNodes 'Privacy' $headings $package) -ceq 'closed') `
        'The last section, with Changed switches under it, read as open.'
    Assert-True ($null -eq (Get-WalkSectionState $homeNodes 'Updates' $headings $package)) 'A heading not on screen read as a state.'
    Assert-True ($null -eq (Find-WalkHeading $adsPage 'Ads' $package)) 'A page title was taken for a home list heading.'

    # ConvertTo-WalkArgument: adb gets each argument back whole.
    Assert-True ((ConvertTo-WalkArgument "'tg://resolve?domain=telegram'") -ceq "'tg://resolve?domain=telegram'") `
        'A deep link with no space was quoted for Windows, and the device shell would see the quotes.'
    Assert-True ((ConvertTo-WalkArgument 'a b') -ceq '"a b"') 'An argument with a space was not quoted.'
    Assert-True ((ConvertTo-WalkArgument 'C:\x y\') -ceq '"C:\x y\\"') 'A trailing backslash would have escaped the closing quote.'
    Assert-True ((ConvertTo-WalkArgument '') -ceq '""') 'An empty argument was dropped.'

    # Enter-WalkLease, Update-WalkLease and Exit-WalkLease: the walk's hold on the device.
    $leases = Join-Path $scratch 'leases'
    New-Item -ItemType Directory -Force -Path $leases | Out-Null
    $lease = Enter-WalkLease -Directory $leases -Serial 'emulator-5554' -ChatIdentity 'walk-contract'
    $written = Get-Content -LiteralPath (Join-Path $leases 'emulator-5554.json') -Raw | ConvertFrom-Json
    $expires = [DateTimeOffset]$written.expiresUtc
    Assert-True ($written.schemaVersion -is [long] -or $written.schemaVersion -is [int]) 'The lease schema version is not a number.'
    Assert-True ($written.schemaVersion -eq 1 -and $written.serial -ceq 'emulator-5554' -and $written.project -ceq 'HushTelegram' -and
        $written.chatIdentity -ceq 'walk-contract' -and $written.ownershipToken -ceq $lease.Token -and
        $expires -gt [DateTimeOffset]::UtcNow.AddMinutes(25)) 'The lease lacks what the installer checks before every adb call.'
    $refused = $false
    try { [void](Enter-WalkLease -Directory $leases -Serial 'emulator-5554' -ChatIdentity 'another-walk') } catch { $refused = $_.Exception.Message -like '*leased by HushTelegram*' }
    Assert-True $refused 'A second walk took a device the first one holds.'
    Update-WalkLease $lease
    [IO.File]::WriteAllText($lease.Path, (([ordered]@{ schemaVersion = 1; serial = 'emulator-5554'; project = 'Hushfeed'
                chatIdentity = 'other'; ownershipToken = 'theirs'; acquiredUtc = [DateTimeOffset]::UtcNow.ToString('o')
                expiresUtc = [DateTimeOffset]::UtcNow.AddMinutes(20).ToString('o') }) | ConvertTo-Json))
    $stopped = $false
    try { Update-WalkLease $lease } catch { $stopped = $true }
    Assert-True $stopped 'The walk kept driving a device after another task took its lease.'
    Exit-WalkLease $lease
    Assert-True (Test-Path -LiteralPath $lease.Path) "Ending the walk removed another task's lease."
    [IO.File]::WriteAllText($lease.Path, (([ordered]@{ schemaVersion = 1; serial = 'emulator-5554'; project = 'Hushfeed'
                chatIdentity = 'other'; ownershipToken = 'theirs'; acquiredUtc = [DateTimeOffset]::UtcNow.AddHours(-2).ToString('o')
                expiresUtc = [DateTimeOffset]::UtcNow.AddHours(-1).ToString('o') }) | ConvertTo-Json))
    $taken = Enter-WalkLease -Directory $leases -Serial 'emulator-5554' -ChatIdentity 'walk-contract'
    Assert-True ((Get-Content -LiteralPath $taken.Path -Raw | ConvertFrom-Json).ownershipToken -ceq $taken.Token) `
        'A lease that ran out an hour ago kept the device from being walked.'
    Exit-WalkLease $taken
    Assert-True (-not (Test-Path -LiteralPath $taken.Path)) 'The walk left its own lease behind.'
    $unsafe = $false
    try { [void](Enter-WalkLease -Directory $leases -Serial '..' -ChatIdentity 'walk-contract') } catch { $unsafe = $true }
    Assert-True $unsafe 'A serial that is not a safe file name was used as one.'

    # The receipts those results produce, held to the publish gate.
    $bundle = Join-Path $scratch 'patches-0.0.0.mpp'
    [IO.File]::WriteAllText($bundle, 'walk-app contract fixture bundle')
    $bundleSha256 = (Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash.ToLowerInvariant()
    $started = [DateTimeOffset]::Parse('2026-10-23T00:00:00Z')
    $finished = $started.AddMinutes(6)

    $catalogPath = Join-Path (Split-Path -Parent $PSScriptRoot) 'patches-list.json'
    $catalog = Get-Content -LiteralPath $catalogPath -Raw | ConvertFrom-Json
    $target = Get-PatchTarget -PatchList $catalog -PackageName 'org.telegram.messenger.web'
    $versionCode = [string]@($target.PackageVersionCodes[$target.PackageVersion])[0]
    $allPatches = [string[]]@($catalog.patches | ForEach-Object { $_.name })
    $smokeScenarios = [string[]]@(Get-WalkRequiredScenarios -Scenarios @(Read-WalkScenarios) -Patches $allPatches -Account 'signed out')
    function New-WalkReceiptFile([string]$Name, [string]$Result, [bool]$Full, [int]$Screens, [int]$Crashes, [string]$Sha, [string[]]$Problems) {
        $artifact = New-WalkArtifact -ApkSha256 ('0' * 64) -Package 'org.telegram.messenger.web' -PackageVersion $target.PackageVersion `
            -VersionCode $versionCode -SignerSha256 ('2' * 64) -FixtureName "telegram-web-$($target.PackageVersion)-$versionCode.apk" `
            -FixtureSha256 ('1' * 64) -BundleVersion '0.0.0' `
            -BundleSha256 $Sha -Patches $allPatches -Created $started.AddMinutes(-1)
        $receipt = New-WalkReceipt -Result $Result -Full $Full -Serial 'emulator-5554' -Device 'sdk_gphone64_x86_64' `
            -Package 'org.telegram.messenger.web' -AppVersion $target.PackageVersion -BundleSha256 $Sha -InstalledApkSha256 ('0' * 64) `
            -Artifact $artifact -Account 'signed out' -Scenarios $smokeScenarios `
            -Started $started -Finished $finished -Screens $Screens -Crashes $Crashes -Problems $Problems
        $path = Join-Path $scratch $Name
        [IO.File]::WriteAllText($path, (ConvertTo-Json -InputObject $receipt -Depth 5) + "`n")
        return $path
    }
    function Test-Walk([string]$Path) { Test-WalkReceipt -Path $Path -BundlePath $bundle -PatchListPath $catalogPath }

    $passWalk = New-WalkReceiptFile 'pass.json' 'PASS' $true 22 0 $bundleSha256 @()
    Assert-True (Test-Walk $passWalk).Valid `
        'A whole clean walk of this bundle should back a release.'

    $crashWalk = New-WalkReceiptFile 'crash.json' 'FAIL' $false 9 1 $bundleSha256 @('Telegram crashed during the walk: ...')
    Assert-True (-not (Test-Walk $crashWalk).Valid) `
        'A walk that recorded a crash must not back a release.'

    $skipWalk = New-WalkReceiptFile 'skip.json' 'PARTIAL' $false 6 0 $bundleSha256 @()
    Assert-True (-not (Test-Walk $skipWalk).Valid) `
        'A walk that skipped part of the app must not back a release.'

    $otherWalk = New-WalkReceiptFile 'other-bundle.json' 'PASS' $true 22 0 ('a' * 64) @()
    Assert-True (-not (Test-Walk $otherWalk).Valid) `
        'A clean walk of a different bundle must not back this one.'

    # The page lists walk-app.ps1 walks by default are the manifest's, so the defaults can't drift
    # from what publish asks for.
    $walkText = [IO.File]::ReadAllText((Join-Path $PSScriptRoot 'walk-app.ps1'))
    foreach ($listed in @('Visit', 'SettingsPages', 'Sections')) {
        Assert-True ($walkText -cmatch "(?m)^\s*\[string\[\]\]\`$$listed,\s*$" -and
            $walkText.Contains("if (-not `$PSBoundParameters.ContainsKey('$listed'))")) `
            "walk-app.ps1's -$listed has a default of its own instead of walk-scenarios.json's."
    }
    # The screen and scenario tally is made before the first screen counts into it. Lost once in a
    # rewrite, every walk died at launch on "The property 'Screens' cannot be found".
    $walkAst = [Management.Automation.Language.Parser]::ParseInput($walkText, [ref]$null, [ref]$null)
    $invoke = $walkAst.Find({ param($node) $node -is [Management.Automation.Language.FunctionDefinitionAst] -and $node.Name -ceq 'Invoke-WalkApp' }, $true)
    $seenUses = @($invoke.FindAll({ param($node) $node -is [Management.Automation.Language.VariableExpressionAst] -and $node.VariablePath.UserPath -ceq 'seen' }, $true) |
        Sort-Object { $_.Extent.StartOffset })
    $seenMade = $seenUses.Count -gt 0 -and $seenUses[0].Parent -is [Management.Automation.Language.AssignmentStatementAst] -and
        $seenUses[0].Parent.Right.Extent.Text -cmatch 'Screens = 0; Scenarios = \[Collections\.Generic\.List\[string\]\]::new\(\)'
    Assert-True $seenMade 'Invoke-WalkApp counts screens into $seen before it makes it with Screens and Scenarios.'

    Write-Host "[walk-app] $passed checks passed"
} finally {
    $temp = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
    if (-not $scratch.StartsWith($temp, [StringComparison]::OrdinalIgnoreCase)) { throw 'Unsafe walk-app fixture cleanup path.' }
    if (Test-Path -LiteralPath $scratch) { Remove-Item -LiteralPath $scratch -Recurse -Force }
}
