<# Offline contracts for walk-app.ps1: the result a walk earns, and the receipts publish will and won't take. #>
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
# Dot-sourcing walk-app.ps1 runs its param block in this scope, so nothing here may share a name with
# one of its parameters. Its main body is skipped when it's dot-sourced.
$contractScripts = $PSScriptRoot
. (Join-Path $contractScripts 'walk-app.ps1')
. (Join-Path $contractScripts 'walk-fixture.ps1')

$checks = 0
function Assert-WalkApp([bool]$Condition, [string]$Message) {
    if (-not $Condition) { throw $Message }
    $script:checks++
}

$work = Join-Path ([IO.Path]::GetTempPath()) ('hushmessenger-walk-app-' + [guid]::NewGuid().ToString('N'))
[void][IO.Directory]::CreateDirectory($work)
try {
    # The result a walk earns.
    Assert-WalkApp ((Resolve-WalkOutcome -Screens 12 -Crashes 1 -Problems @() -Full $true) -ceq 'FAIL') 'A crash during a full walk should earn FAIL.'
    Assert-WalkApp ((Resolve-WalkOutcome -Screens 12 -Crashes 0 -Problems @('fb-messenger://settings/montage would not open') -Full $true) -ceq 'FAIL') `
        'A screen that would not open should earn FAIL.'
    Assert-WalkApp ((Resolve-WalkOutcome -Screens 9 -Crashes 0 -Problems @() -Full $false) -ceq 'PARTIAL') 'A skipped screen should earn PARTIAL.'
    Assert-WalkApp ((Resolve-WalkOutcome -Screens 0 -Crashes 0 -Problems @() -Full $true) -ceq 'PARTIAL') 'A walk that opened no screen should earn PARTIAL.'
    Assert-WalkApp ((Resolve-WalkOutcome -Screens 10 -Crashes 0 -Problems @() -Full $true) -ceq 'PASS') 'A whole clean walk should earn PASS.'
    Assert-WalkApp ((Resolve-WalkOutcome -Screens 4 -Crashes 2 -Problems @() -Full $false) -ceq 'FAIL') 'A crash should outrank a skipped screen.'

    # What counts as skipped: the settings pages, the chat, or any default screen.
    Assert-WalkApp (@(Get-WalkSkips -SkipSettings $false -Thread '100000000000001' -Visit $WalkDefaultScreens).Count -eq 0) `
        'The default walk with a chat should leave nothing out.'
    $leftOut = @(Get-WalkSkips -SkipSettings $false -Thread '100000000000001' -Visit @($WalkDefaultScreens | Where-Object { $_ -ne 'fb-messenger://settings/montage' }))
    Assert-WalkApp ($leftOut.Count -eq 1 -and $leftOut[0] -ceq 'fb-messenger://settings/montage') 'Dropping a default screen should count as a skip.'
    Assert-WalkApp (@(Get-WalkSkips -SkipSettings $false -Thread '' -Visit $WalkDefaultScreens) -contains 'a chat (no -Thread)') 'A walk with no chat should count as a skip.'
    Assert-WalkApp (@(Get-WalkSkips -SkipSettings $true -Thread '1' -Visit $WalkDefaultScreens) -contains 'the Hush settings pages') 'Skipping settings should count as a skip.'
    Assert-WalkApp (@(Get-WalkSkips -SkipSettings $false -Thread '1' -Visit ($WalkDefaultScreens + 'fb-messenger://quicksnap')).Count -eq 0) `
        'An extra screen on top of the defaults should not count as a skip.'
    $unproven = @(Get-WalkSkips -SkipSettings $false -Thread '1' -Visit $WalkDefaultScreens -Unproven $true)
    Assert-WalkApp ($unproven.Count -eq 1 -and $unproven[0] -like 'proof the installed app was patched from -Bundle*') `
        'A -SkipPatch walk with no patch record of its bundle should count as a skip.'

    # The steps a walk opens: every required step for a full walk, asked from a caller whose own
    # $walkSteps would shadow the table if the functions read it by plain name (the first S22-ready walk planned nothing).
    function Get-ShadowedPlan {
        $walkSteps = @()
        return [pscustomobject]@{
            Plan = @(Get-WalkPlan -SkipSettings $false -Thread '100000000000001' -Visit $WalkDefaultScreens -AppliedPatches $WalkFixturePatches | ForEach-Object { $_.Id })
            Required = @(Get-WalkRequiredSteps -AppliedPatches $WalkFixturePatches)
            Chat = Get-WalkStepDefinition 'chat'
            Local = $walkSteps.Count
        }
    }
    $shadowed = Get-ShadowedPlan
    Assert-WalkApp ($shadowed.Plan.Count -eq 9 -and ($shadowed.Plan -join ' ') -ceq ($shadowed.Required -join ' ')) `
        "A full walk should plan every required step, in order (planned: $($shadowed.Plan -join ' '); required: $($shadowed.Required -join ' '))."
    Assert-WalkApp ($null -ne $shadowed.Chat -and $shadowed.Local -eq 0) "A caller's own `$walkSteps should neither hide the table nor be touched."
    $trimmed = @(Get-WalkPlan -SkipSettings $true -Thread '' -Visit @('fb-messenger://settings/montage', 'fb-messenger://quicksnap') -AppliedPatches $WalkFixturePatches)
    Assert-WalkApp ((@($trimmed | ForEach-Object { "$($_.Id):$($_.Kind)" }) -join ' ') -ceq 'inbox:inbox story-settings:link fb-messenger://quicksnap:extra') `
        "Skipping settings and the chat with one default link and one extra should plan the inbox and just those ($(@($trimmed | ForEach-Object { $_.Id }) -join ' '))."
    $noSheets = @(Get-WalkPlan -SkipSettings $false -Thread '1' -Visit $WalkDefaultScreens -AppliedPatches @('Hide Meta AI') | ForEach-Object { $_.Id })
    Assert-WalkApp ($noSheets.Count -eq 7 -and $noSheets -cnotcontains 'auto-reply') 'Without the sheet patches the sheets should not be planned.'
    # Settings sections start closed, so each sheet step opens the one its button sits in, by the id SettingsActivity uses.
    $settingsSource = Get-Content -Raw (Join-Path $PSScriptRoot '..\extensions\messenger\src\main\java\app\hushmessenger\extension\SettingsActivity.java')
    Assert-WalkApp ($settingsSource -match 'OPEN_EXTRA = "app\.hushmessenger\.open"' -and $WalkSectionExtra -ceq 'app.hushmessenger.open') `
        'The walk should open sections through the extra SettingsActivity reads.'
    foreach ($sheet in @($WalkSteps | Where-Object { $_.Kind -ceq 'sheet' })) {
        $key = @{ 'message-log' = 'message_log'; 'auto-reply' = 'auto_reply' }[$sheet.Id]
        Assert-WalkApp ($settingsSource -match ('\{"' + $key + '",[^\r\n]*"' + $sheet.Section + '"\},')) `
            "The $($sheet.Id) step should open the section holding $key, not '$($sheet.Section)'."
    }

    # A screenshot counts only as a PNG.
    $pngFile = Join-Path $work 'shot.png'
    [IO.File]::WriteAllBytes($pngFile, [byte[]](0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, 0x00))
    Assert-WalkApp (Test-WalkPng $pngFile) 'A PNG should count as a screenshot.'
    [IO.File]::WriteAllText($pngFile, 'screencap: error')
    Assert-WalkApp (-not (Test-WalkPng $pngFile)) 'An error message pulled as a screenshot should not count.'
    [IO.File]::WriteAllBytes($pngFile, [byte[]]@())
    Assert-WalkApp (-not (Test-WalkPng $pngFile) -and -not (Test-WalkPng (Join-Path $work 'none.png'))) 'An empty or missing screenshot should not count.'

    # Whether the APK the device ran is the one patched from the bundle.
    $patchedHash = 'c' * 64
    Assert-WalkApp ($null -eq (Get-WalkApkProblem -Installed $patchedHash -Patched $patchedHash)) 'The patched APK on the device should raise nothing.'
    Assert-WalkApp ((Get-WalkApkProblem -Installed ('d' * 64) -Patched $patchedHash) -like "the installed APK (dddd*) isn't the one patched*") `
        'Another APK on the device should be a problem.'
    foreach ($unread in @('', '/system/bin/sh: sha256sum: not found', ('C' * 64), ($patchedHash + "`n"))) {
        Assert-WalkApp ((Get-WalkApkProblem -Installed $unread -Patched $patchedHash) -like "couldn't read the installed APK's SHA-256*") `
            "An installed hash of '$unread' should read as unreadable."
    }
    Assert-WalkApp ($null -eq (Get-WalkApkProblem -Installed '' -Patched '')) 'With no patched APK to hold it to, the skip covers it, not a problem.'

    # The Desktop CLI's step list: 1.18.1 wrote patchingSteps, 1.19.0 writes stepResults.
    $goodSteps = @([pscustomobject]@{ step = 'PATCHING'; success = $true }, [pscustomobject]@{ step = 'REBUILDING'; success = $true })
    $badSteps = @([pscustomobject]@{ step = 'PATCHING'; success = $true }, [pscustomobject]@{ step = 'REBUILDING'; success = $false })
    Assert-WalkApp (Test-WalkPatchSteps -Report ([pscustomobject]@{ patchingSteps = $goodSteps })) 'A 1.18 result with good steps should pass.'
    Assert-WalkApp (Test-WalkPatchSteps -Report ([pscustomobject]@{ success = $true; stepResults = $goodSteps })) 'A 1.19 result with good steps should pass.'
    Assert-WalkApp (-not (Test-WalkPatchSteps -Report ([pscustomobject]@{ patchingSteps = $badSteps }))) 'A 1.18 result with a failed step should not pass.'
    Assert-WalkApp (-not (Test-WalkPatchSteps -Report ([pscustomobject]@{ success = $true; stepResults = $badSteps }))) 'A 1.19 result with a failed step should not pass.'
    Assert-WalkApp (-not (Test-WalkPatchSteps -Report ([pscustomobject]@{ success = $true }))) 'A result with no step list should not pass.'
    Assert-WalkApp (-not (Test-WalkPatchSteps -Report ([pscustomobject]@{ success = $true; stepResults = @() }))) 'A result with an empty step list should not pass.'

    # Reading the hash off sha256sum's output.
    $hashOut = "$patchedHash  /data/app/~~x==/com.facebook.orca-y==/base.apk"
    Assert-WalkApp ((Read-WalkSha256 @($hashOut)) -ceq $patchedHash) 'The hash line should give its hash.'
    Assert-WalkApp ((Read-WalkSha256 @('WARNING: linker: something adb printed first', $hashOut)) -ceq $patchedHash) `
        'A line before the hash should not hide it.'
    foreach ($noHash in @(@(), @('/system/bin/sh: sha256sum: not found'), @(('C' * 64) + '  base.apk'))) {
        Assert-WalkApp ((Read-WalkSha256 $noHash) -ceq '') "Output without a lowercase hash line ($($noHash -join ' | ')) should give no hash."
    }

    # The exit code each result ends with.
    Assert-WalkApp ((Get-WalkExitCode 'PASS') -eq 0 -and (Get-WalkExitCode 'PARTIAL') -eq 2 -and (Get-WalkExitCode 'FAIL') -eq 1) `
        'PASS, PARTIAL and FAIL should exit 0, 2 and 1.'
    Assert-WalkApp ((Get-WalkExitCode '') -eq 1 -and (Get-WalkExitCode 'pass') -eq 1) 'Anything but an exact PASS or PARTIAL should exit 1.'

    # Which crash buffer lines are a Messenger crash during the walk.
    $buffer = @(
        '1729560000.100  4321  4321 E AndroidRuntime: Process: com.facebook.orca, PID: 4321',
        '1729570000.100  4400  4400 E AndroidRuntime: FATAL EXCEPTION: main',
        '1729570000.101  4400  4400 E AndroidRuntime: Process: com.facebook.orca, PID: 4400',
        '1729570001.200  4500  4510 F DEBUG   : pid: 4500, tid: 4510, name: RenderThread  >>> com.facebook.orca:videoplayer <<<',
        '1729570002.300  4600  4600 E AndroidRuntime: Process: com.facebook.katana, PID: 4600',
        '1729570003.400  4700  4700 E AndroidRuntime: Process: com.facebook.orca.clone, PID: 4700',
        '--------- beginning of crash'
    )
    $seen = @(Select-WalkCrashes -Lines $buffer -Package 'com.facebook.orca' -SinceEpoch 1729569999)
    Assert-WalkApp ($seen.Count -eq 2) "A Java crash and a native crash of Messenger during the walk should count, and nothing else ($($seen.Count) counted)."
    Assert-WalkApp ($seen[0] -match 'PID: 4400' -and $seen[1] -match 'videoplayer') 'The counted crashes should be the walk-time Java and native ones.'
    Assert-WalkApp (@(Select-WalkCrashes -Lines $buffer -Package 'com.facebook.orca' -SinceEpoch 1729580000).Count -eq 0) 'A crash before the walk started should not count.'

    # The receipts those results produce, held to the gate the publish stage uses.
    $walkedBundle = Join-Path $work 'patches-0.26.0.mpp'
    [IO.File]::WriteAllText($walkedBundle, 'walk-app contract bundle')
    $walkedSha256 = (Get-FileHash -LiteralPath $walkedBundle -Algorithm SHA256).Hash.ToLowerInvariant()
    function Write-ContractReceipt([string]$Name, [string]$Result, [bool]$Full, [int]$Crashes, [string]$Sha, [string[]]$Problems,
        [string]$PatchedSha = ('0' * 64)) {
        $folder = Join-Path $work $Name
        $receipt = New-WalkFixture -Folder $folder -BundleSha256 $Sha -ApkSha256 ('0' * 64)
        $receipt.result = $Result; $receipt.full = $Full; $receipt.crashes = $Crashes; $receipt.problems = @($Problems)
        $receipt.patchedApkSha256 = $PatchedSha
        $receiptFile = Join-Path $folder 'walk-receipt.json'
        [IO.File]::WriteAllText($receiptFile, (ConvertTo-Json -InputObject $receipt -Depth 6) + "`n")
        return $receiptFile
    }
    $clean = Write-ContractReceipt 'pass' (Resolve-WalkOutcome -Screens 12 -Crashes 0 -Full $true) $true 0 $walkedSha256 @()
    $verdict = Test-WalkReceipt -Path $clean -BundlePath $walkedBundle
    Assert-WalkApp $verdict.Valid "A whole clean walk of this bundle should back a release ($($verdict.Reason))."
    $crashed = Write-ContractReceipt 'crash' (Resolve-WalkOutcome -Screens 12 -Crashes 1 -Full $false) $false 1 $walkedSha256 @('Messenger crashed during the walk')
    $verdict = Test-WalkReceipt -Path $crashed -BundlePath $walkedBundle
    Assert-WalkApp (-not $verdict.Valid -and $verdict.Reason -match 'FAIL') "A walk with a crash must not back a release ($($verdict.Reason))."
    $partial = Write-ContractReceipt 'skip' (Resolve-WalkOutcome -Screens 11 -Crashes 0 -Full $false) $false 0 $walkedSha256 @()
    $verdict = Test-WalkReceipt -Path $partial -BundlePath $walkedBundle
    Assert-WalkApp (-not $verdict.Valid -and $verdict.Reason -match 'PARTIAL') "A walk that skipped a screen must not back a release ($($verdict.Reason))."
    $elsewhere = Write-ContractReceipt 'other' 'PASS' $true 0 ('a' * 64) @()
    Assert-WalkApp (-not (Test-WalkReceipt -Path $elsewhere -BundlePath $walkedBundle).Valid) 'A clean walk of a different bundle must not back this one.'
    $unprovenWalk = Write-ContractReceipt 'unproven' 'PASS' $true 0 $walkedSha256 @() ''
    Assert-WalkApp (-not (Test-WalkReceipt -Path $unprovenWalk -BundlePath $walkedBundle).Valid) `
        'A clean walk of an app nothing ties to this bundle must not back it.'
    $swapped = Write-ContractReceipt 'swapped' 'PASS' $true 0 $walkedSha256 @() ('e' * 64)
    Assert-WalkApp (-not (Test-WalkReceipt -Path $swapped -BundlePath $walkedBundle).Valid) `
        'A clean walk of an APK other than the one patched from this bundle must not back it.'

    # The patch names Desktop wrote: 1.19 plain names, 1.18.1 {name} objects.
    $resultFile = Join-Path $work 'patch-result.json'
    [IO.File]::WriteAllText($resultFile, '{"appliedPatches":["Auto reply","Keep a message log"],"failedPatches":[]}')
    Assert-WalkApp (((Read-WalkAppliedPatches $resultFile) -join '|') -ceq 'Auto reply|Keep a message log') 'Plain applied names should read.'
    [IO.File]::WriteAllText($resultFile, '{"appliedPatches":[{"name":"Auto reply"},{"name":""},{}]}')
    Assert-WalkApp (((Read-WalkAppliedPatches $resultFile) -join '|') -ceq 'Auto reply') 'Named objects should read, and nameless ones drop out.'
    [IO.File]::WriteAllText($resultFile, '{ not json')
    Assert-WalkApp (@(Read-WalkAppliedPatches $resultFile).Count -eq 0 -and @(Read-WalkAppliedPatches (Join-Path $work 'none.json')).Count -eq 0) `
        'An unreadable or missing result should give no patches.'

    # The component in front.
    $activities = @('  mResumedActivity: ActivityRecord{1a2b u0 com.android.launcher3/.Launcher t3}',
        '  topResumedActivity=ActivityRecord{9f8e u0 com.facebook.orca/.auth.StartScreenActivity t41}')
    Assert-WalkApp ((Read-WalkResumedComponent $activities) -ceq 'com.facebook.orca/.auth.StartScreenActivity') 'topResumedActivity should win.'
    Assert-WalkApp ((Read-WalkResumedComponent @('    ResumedActivity: ActivityRecord{77 u0 com.facebook.orca/app.hushmessenger.extension.SettingsActivity t9}')) -ceq `
        'com.facebook.orca/app.hushmessenger.extension.SettingsActivity') 'An older ResumedActivity line should read.'
    Assert-WalkApp ((Read-WalkResumedComponent @('no activity here')) -ceq '') 'Nothing in front should read as empty.'

    # Finding a button by its whole text.
    $sheetXml = '<hierarchy><node text="View log" class="android.widget.Button" enabled="true" bounds="[100,200][300,260]" />' +
        '<node text="View log later" enabled="true" bounds="[0,0][9,9]" /><node text="Close" enabled="false" bounds="[0,500][100,600]" /></hierarchy>'
    $center = Find-WalkNodeCenter -Xml $sheetXml -Text 'View log'
    Assert-WalkApp ($center[0] -eq 200 -and $center[1] -eq 230) "View log should be found at its center (got $($center -join ','))."
    Assert-WalkApp ($null -eq (Find-WalkNodeCenter -Xml $sheetXml -Text 'Close')) 'A disabled button should not be tapped.'
    Assert-WalkApp ($null -eq (Find-WalkNodeCenter -Xml $sheetXml -Text 'Edit replies') -and $null -eq (Find-WalkNodeCenter -Xml '' -Text 'View log')) `
        'A missing button or an empty dump should give nothing to tap.'

    # Messenger's chat restore prompt, as the S22 dumped it, and its icon-only Close.
    $restorePrompt = '<hierarchy><node text="" class="android.widget.Button" content-desc="Close" enabled="true" bounds="[11,87][146,222]" />' +
        '<node text="Restore now" class="android.widget.Button" content-desc="Restore now" enabled="true" bounds="[45,2023][1035,2158]" /></hierarchy>'
    Assert-WalkApp (Test-WalkRestorePrompt $restorePrompt) 'The restore prompt should read as the restore prompt.'
    Assert-WalkApp (-not (Test-WalkRestorePrompt (Get-WalkFixtureXml 'inbox')) -and -not (Test-WalkRestorePrompt '')) 'Other screens should not read as the restore prompt.'
    $close = Find-WalkNodeCenter -Xml $restorePrompt -Text 'Close' -Described
    Assert-WalkApp ($close[0] -eq 78 -and $close[1] -eq 154) "Close should be found by its description ($($close -join ','))."
    Assert-WalkApp ($null -eq (Find-WalkNodeCenter -Xml $restorePrompt -Text 'Close')) 'Close has no text, so a text lookup should not find it.'

    # The walk's own judgment of a step, the same one publish makes again.
    $controls = Get-WalkStepDefinition 'settings-controls'
    Assert-WalkApp ($null -eq (Test-WalkStepScreen -Definition $controls -Activity 'com.facebook.orca/app.hushmessenger.extension.SettingsActivity' -Xml (Get-WalkFixtureXml 'settings-controls'))) `
        'The Controls page should pass its own step.'
    Assert-WalkApp ((Test-WalkStepScreen -Definition $controls -Activity 'com.facebook.orca/app.hushmessenger.extension.SettingsActivity' -Xml (Get-WalkFixtureXml 'settings-app')) -like "*doesn't show what it should*") `
        'The App page should not pass for the Controls step.'

    # A patched APK is used again only for the same bundle, stock APK and key, and only while it's unchanged.
    $patchDir = Join-Path $work 'patched'
    [void][IO.Directory]::CreateDirectory($patchDir)
    $stockFile = Join-Path $work 'messenger-584-346814894.apk'
    [IO.File]::WriteAllText($stockFile, 'stock contract apk')
    $keyFile = Join-Path $work 'walk.keystore'
    [IO.File]::WriteAllText($keyFile, 'contract key')
    $patchedFile = Join-Path $patchDir 'hushmessenger-walk.apk'
    [IO.File]::WriteAllText($patchedFile, 'patched contract apk')
    $sameInputs = Get-WalkPatchInputs -BundlePath $walkedBundle -StockApk $stockFile -KeystorePath $keyFile -Alias 'Morphe'
    Assert-WalkApp ($null -eq (Find-WalkPatched -Destination $patchDir -Inputs $sameInputs)) 'An APK with no record of what made it should be patched again.'
    Save-WalkPatchInputs -Destination $patchDir -Inputs $sameInputs
    Assert-WalkApp (-not $sameInputs.Contains('apk')) 'Saving the record should leave the inputs it was given alone.'
    Assert-WalkApp ((Find-WalkPatched -Destination $patchDir -Inputs $sameInputs) -ceq $patchedFile) 'The APK patched from the same inputs should be used again.'
    $recordedApk = (Get-FileHash -LiteralPath $patchedFile -Algorithm SHA256).Hash.ToLowerInvariant()
    Assert-WalkApp ((Find-WalkPatchRecord -Destination $patchDir -BundleSha256 $walkedSha256) -ceq $recordedApk) `
        'A -SkipPatch walk should find the APK patched from its bundle.'
    Assert-WalkApp ((Find-WalkPatchRecord -Destination $patchDir -BundleSha256 ('a' * 64)) -ceq '') 'A -SkipPatch walk of another bundle should find no patch record.'
    Assert-WalkApp ((Find-WalkPatchRecord -Destination $work -BundleSha256 $walkedSha256) -ceq '') 'A folder with no patch record should give none.'
    $newlineDir = Join-Path $work 'newline-record'
    New-Item -ItemType Directory -Path $newlineDir | Out-Null
    [IO.File]::WriteAllText((Join-Path $newlineDir 'patch-inputs.json'), (@{ bundle = $walkedSha256; apk = $recordedApk + "`n" } | ConvertTo-Json))
    Assert-WalkApp ((Find-WalkPatchRecord -Destination $newlineDir -BundleSha256 $walkedSha256) -ceq '') 'A recorded APK hash with a newline after it should prove nothing.'
    $otherAlias = Get-WalkPatchInputs -BundlePath $walkedBundle -StockApk $stockFile -KeystorePath $keyFile -Alias 'Other'
    Assert-WalkApp ($null -eq (Find-WalkPatched -Destination $patchDir -Inputs $otherAlias)) 'Another key alias should patch again.'
    $otherBundle = Join-Path $work 'patches-0.26.1.mpp'
    [IO.File]::WriteAllText($otherBundle, 'another contract bundle')
    $otherInputs = Get-WalkPatchInputs -BundlePath $otherBundle -StockApk $stockFile -KeystorePath $keyFile -Alias 'Morphe'
    Assert-WalkApp ($null -eq (Find-WalkPatched -Destination $patchDir -Inputs $otherInputs)) 'Another bundle should patch again.'
    [IO.File]::WriteAllText($patchedFile, 'patched contract apk, changed')
    Assert-WalkApp ($null -eq (Find-WalkPatched -Destination $patchDir -Inputs $sameInputs)) 'An APK changed since its patch should be patched again.'
    [IO.File]::WriteAllText((Join-Path $patchDir 'patch-inputs.json'), '{ not json')
    Assert-WalkApp ($null -eq (Find-WalkPatched -Destination $patchDir -Inputs $sameInputs)) 'An unreadable record should patch again.'
    Assert-WalkApp ((Find-WalkPatchRecord -Destination $patchDir -BundleSha256 $walkedSha256) -ceq '') 'An unreadable record should prove nothing.'

    Write-Host "walk-app contracts passed ($checks checks)"
} finally {
    $temp = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
    if (-not ([IO.Path]::GetFullPath($work)).StartsWith($temp, [StringComparison]::OrdinalIgnoreCase)) { throw 'Unsafe walk-app fixture cleanup path.' }
    Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue
}
