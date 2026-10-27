<# Offline contracts for walk-receipt.ps1: publish takes only a full, passing walk of the bundle it ships, with every required step's evidence. #>
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'walk-receipt.ps1')
. (Join-Path $PSScriptRoot 'walk-fixture.ps1')

function Assert-WalkContract([bool]$Condition, [string]$Message) {
    if (-not $Condition) { throw $Message }
}

$work = Join-Path ([IO.Path]::GetTempPath()) ('hushmessenger-walk-contract-' + [guid]::NewGuid().ToString('N'))
[void][IO.Directory]::CreateDirectory($work)
try {
    $bundle = Join-Path $work 'patches-0.27.0.mpp'
    [IO.File]::WriteAllText($bundle, 'the signed bundle')
    $bundleSha256 = (Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash.ToLowerInvariant()
    $case = 0
    # A fresh walk folder of that bundle. -Change bends top-level fields, -Bend gets the receipt and folder.
    function Write-Walk([hashtable]$Change = @{}, [scriptblock]$Bend, [string[]]$Applied = $WalkFixturePatches) {
        $script:case++
        $folder = Join-Path $work "walk-$($script:case)"
        $walk = New-WalkFixture -Folder $folder -BundleSha256 $bundleSha256 -AppliedPatches $Applied
        foreach ($key in $Change.Keys) { $walk[$key] = $Change[$key] }
        if ($Bend) { & $Bend $walk $folder }
        $path = Join-Path $folder 'walk-receipt.json'
        [IO.File]::WriteAllText($path, (ConvertTo-Json -InputObject $walk -Depth 6))
        return $path
    }
    function Step($Walk, [string]$Id) { return @($Walk.steps | Where-Object { $_.id -ceq $Id })[0] }

    # The required steps follow the patches: the sheets only when their patch was applied.
    $all = @(Get-WalkRequiredSteps -AppliedPatches $WalkFixturePatches)
    Assert-WalkContract (($all -join ' ') -ceq 'chat inbox settings-controls settings-app message-log auto-reply settings story-settings contact-settings') `
        "The required steps with both sheet patches read: $($all -join ' ')"
    $without = @(Get-WalkRequiredSteps -AppliedPatches @('Hide Meta AI'))
    Assert-WalkContract ($without -cnotcontains 'message-log' -and $without -cnotcontains 'auto-reply' -and $without.Count -eq 7) `
        "Without the log and reply patches the sheets should not be required: $($without -join ' ')"
    # Every Messenger step holds its screen to its own activity and marker, not just Messenger in front.
    foreach ($step in @($WalkSteps | Where-Object { $_.Kind -in 'chat', 'inbox', 'link' })) {
        Assert-WalkContract ($step.Activity -cne $WalkMessengerComponent -and $step.Marker -cne $WalkMessengerNodes) "$($step.Id) only asks for Messenger in front."
        $others = @($WalkSteps | Where-Object { $_.Id -cne $step.Id -and $_.Kind -in 'chat', 'inbox', 'link' })
        foreach ($other in $others) {
            Assert-WalkContract ((Get-WalkFixtureActivity $other.Id) -notmatch $step.Activity) "$($step.Id) would take $($other.Id)'s activity."
            Assert-WalkContract ((Get-WalkFixtureXml $other.Id) -notmatch $step.Marker) "$($step.Id) would take $($other.Id)'s screen."
        }
    }

    # The screen signature leaves out words and positions, and nothing else.
    $one = Get-WalkFixtureXml 'inbox'
    Assert-WalkContract ((Get-WalkScreenSignature $one) -ceq (Get-WalkScreenSignature ($one.Replace('content-desc="New message"', 'content-desc="New message, 3 new"').Replace('[0,100]', '[0,140]')))) `
        'A changed label or position should leave the screen signature alone.'
    Assert-WalkContract ((Get-WalkScreenSignature $one) -cne (Get-WalkScreenSignature (Get-WalkFixtureXml 'story-settings'))) 'Two different screens should sign differently.'
    Assert-WalkContract ((Get-WalkScreenSignature $one) -cne (Get-WalkScreenSignature ($one.Replace('</node></hierarchy>', '<node class="x" package="p" /></node></hierarchy>')))) `
        'An extra node should change the signature.'

    # Either release phone or an emulator walks for a release, with or without the sheet patches.
    foreach ($walker in @(@{}, @{ device = 'SM-S938B' }, @{ serial = 'emulator-5554'; device = 'sdk_gphone64_x86_64'; emulator = $true })) {
        $good = Test-WalkReceipt -Path (Write-Walk $walker) -BundlePath $bundle
        Assert-WalkContract ($good.Valid -and $good.Receipt.screens -eq 9) "A full PASS walk of the bundle was refused: $($good.Reason)"
    }
    $good = Test-WalkReceipt -Path (Write-Walk -Applied @('Hide Meta AI')) -BundlePath $bundle
    Assert-WalkContract ($good.Valid -and $good.Receipt.screens -eq 7) "A full walk of an APK without the sheet patches was refused: $($good.Reason)"

    # Below Android 13 the message log is FLAG_SECURE, so its window entry stands in for its screenshot.
    $oldEmulator = @{ serial = 'emulator-5596'; device = 'sdk_gphone64_x86_64'; emulator = $true; sdk = 32 }
    $secureLog = { param($w, $f) Set-WalkFixtureSecureShot $w $f 'message-log' }
    $good = Test-WalkReceipt -Path (Write-Walk $oldEmulator $secureLog) -BundlePath $bundle
    Assert-WalkContract ($good.Valid -and $good.Receipt.screens -eq 9) "A secure message log on Android 12 was refused: $($good.Reason)"
    $windowLines = $WalkFixtureSecureWindow -split "`n"
    Assert-WalkContract (Test-WalkSecureWindow (Get-WalkSettingsWindows $windowLines)) "The settings window's SECURE flag should read."
    Assert-WalkContract ((Get-WalkSettingsWindows $windowLines) -notmatch 'MainActivity') "Messenger's own window isn't a settings window."
    $notLog = $WalkFixtureSecureWindow.Replace('fl=DIM_BEHIND SECURE', 'fl=DIM_BEHIND')
    Assert-WalkContract ($notLog -cne $WalkFixtureSecureWindow) 'The fixture should carry the SECURE flag this test takes out.'
    $mainSecure = $notLog + ' SECURE'
    Assert-WalkContract (-not (Test-WalkSecureWindow $mainSecure)) "Messenger's window being secure says nothing about the log's."
    Assert-WalkContract (-not (Test-WalkSecureWindow (Get-WalkSettingsWindows ($mainSecure -split "`n")))) 'Only the settings entries should be kept.'
    $privateOnly = $notLog.Replace('pfl=USE_BLAST', 'pfl=SECURE USE_BLAST')
    Assert-WalkContract ($privateOnly -cne $notLog) 'The fixture should have the private flags line this test changes.'
    Assert-WalkContract (-not (Test-WalkSecureWindow $privateOnly)) 'A SECURE word among the private flags is not FLAG_SECURE.'

    $restore = '<node index="1" text="Restore your Facebook chats" resource-id="" class="android.widget.TextView" package="com.facebook.orca" content-desc="" enabled="true" selected="false" bounds="[0,300][1080,400]" />'
    $login = '<node index="1" text="Log in" resource-id="" class="android.widget.Button" package="com.facebook.orca" content-desc="" enabled="true" selected="false" bounds="[0,300][1080,400]" />'
    $restoreDesc = '<node index="1" text="" resource-id="" class="android.view.View" package="com.facebook.orca" content-desc="Restore your chats" enabled="true" selected="false" bounds="[0,300][1080,400]" />'
    $loginDesc = '<node index="1" text="" resource-id="" class="android.view.View" package="com.facebook.orca" content-desc="Log in" enabled="true" selected="false" bounds="[0,300][1080,400]" />'
    $restoreButton = '<node index="0" text="Restore now" resource-id="" class="android.widget.Button" package="com.facebook.orca" content-desc="Restore now" enabled="true" selected="false" bounds="[45,2023][1035,2158]" />'
    foreach ($badWalk in @(
            # The old count-only receipt.
            @(@{ schema = 1 }, $null, "*isn't schema 2*older receipt only counted screens*"),
            @(@{ schema = '2' }, $null, "*isn't schema 2*"),
            @(@{ result = 'FAIL' }, $null, '*the walk ended FAIL, not PASS*'),
            @(@{ result = 'PARTIAL'; full = $false }, $null, '*the walk ended PARTIAL, not PASS*'),
            @(@{ result = $null }, $null, '*ended with no result*'),
            @(@{ full = $false }, $null, '*was not the whole app*'),
            @(@{ crashes = 1 }, $null, '*recorded a Messenger crash*'),
            # PASS beside a problem contradicts itself.
            @(@{ problems = @('story-settings would not open') }, $null, '*recorded problems: story-settings would not open*'),
            @(@{ problems = 'one string' }, $null, "*problems aren't a list*"),
            @(@{ device = $null }, $null, "*doesn't say which device walked it*"),
            @(@{ device = 'Pixel 9' }, $null, "*Pixel 9 isn't one of the release walk phones*"),
            @(@{ device = 'Pixel 9'; emulator = $true }, $null, "*Pixel 9 isn't one of the release walk phones*"),
            @(@{ bundleSha256 = ('5' * 64) }, $null, '*patched with bundle*and this one is*'),
            @(@{ patchedApkSha256 = '' }, $null, "*doesn't name the APK patched from this bundle*"),
            @(@{ patchedApkSha256 = ('4' * 64) + "`n"; installedApkSha256 = ('4' * 64) + "`n" }, $null, "*doesn't name the APK patched from this bundle*"),
            @(@{ installedApkSha256 = ('6' * 64) }, $null, "*the walk ran APK '6666*', not '4444*', the one patched from this bundle*"),
            @(@{ installedApkSha256 = '/system/bin/sh: sha256sum: not found' }, $null, '*the walk ran APK*the one patched from this bundle*'),
            @(@{ appliedPatches = @() }, $null, "*doesn't list the patches*"),
            # A receipt that drops a step from its own required list.
            @(@{}, { param($w) $w.requiredSteps = @($w.requiredSteps | Where-Object { $_ -cne 'auto-reply' }) }, "*required steps*aren't the ones this APK needs*"),
            @(@{ screens = 40 }, $null, '*counts 40 screens but lists 9 steps*'),
            @(@{ steps = 'none' }, $null, "*doesn't list its steps*"),
            # An absent step.
            @(@{}, { param($w) $w.steps = @($w.steps | Where-Object { $_.id -cne 'story-settings' }); $w.screens = 8 }, '*the walk left out story-settings*'),
            @(@{}, { param($w) $w.steps = @($w.steps) + (Step $w 'chat'); $w.screens = 10 }, '*lists chat twice*'),
            @(@{}, { param($w) (Step $w 'chat').id = 'quicksnap' }, "*a step it doesn't know (quicksnap)*"),
            @(@{}, { param($w) (Step $w 'chat').id = '' }, '*a step with no id*'),
            @(@{}, { param($w) (Step $w 'contact-settings').opened = $false }, "*contact-settings didn't open*"),
            @(@{}, { param($w) (Step $w 'contact-settings').problem = 'contact-settings wouldn''t start' }, "*contact-settings didn't open: contact-settings wouldn't start*"),
            # A problem that isn't text can't be read as no problem.
            @(@{}, { param($w) (Step $w 'contact-settings').problem = @('contact-settings wouldn''t start') }, "*contact-settings's problem isn't a line of text*"),
            @(@{}, { param($w) (Step $w 'contact-settings').problem = $true }, "*contact-settings's problem isn't a line of text*"),
            @(@{}, { param($w) (Step $w 'contact-settings').problem = $null }, "*contact-settings's problem isn't a line of text*"),
            # The required steps as one joined string, in a list or bare, aren't the list.
            @(@{}, { param($w) $w.requiredSteps = @($w.requiredSteps -join ' ') }, "*required steps*aren't the ones this APK needs*"),
            @(@{}, { param($w) $w.requiredSteps = $w.requiredSteps -join ' ' }, "*required steps*aren't the ones this APK needs*"),
            # Evidence that's missing, moved or changed.
            @(@{}, { param($w, $f) Remove-Item -LiteralPath (Join-Path $f 'steps/inbox.png') }, "*inbox's screenshot isn't beside the receipt*"),
            @(@{}, { param($w, $f) [IO.File]::AppendAllText((Join-Path $f 'steps/inbox.xml'), ' ') }, "*inbox's uiDump changed after the walk*"),
            @(@{}, { param($w) (Step $w 'inbox').uiDump = '../inbox.xml' }, "*inbox doesn't name its uiDump*"),
            @(@{}, { param($w) (Step $w 'inbox').screenshotSha256 = '' }, "*inbox doesn't name its screenshot*"),
            @(@{}, { param($w, $f) (Step $w 'inbox').screenshotSha256 = Write-WalkFixtureFile (Join-Path $f 'steps/inbox.png') ([Text.Encoding]::ASCII.GetBytes('not a png')) },
                "*inbox's screenshot isn't a PNG*"),
            # A screen in the way of the one asked for.
            @(@{}, { param($w, $f) Set-WalkFixtureEvidence $w $f 'inbox' (Get-WalkFixtureXml 'inbox' $restore) }, '*inbox showed the "Restore your chats" prompt instead*'),
            @(@{}, { param($w, $f) Set-WalkFixtureEvidence $w $f 'chat' (Get-WalkFixtureXml 'chat' $login) }, '*chat showed the login screen instead*'),
            # The same prompts with their words only in content-desc, as Compose buttons draw them.
            @(@{}, { param($w, $f) Set-WalkFixtureEvidence $w $f 'story-settings' (Get-WalkFixtureXml 'story-settings' $restoreDesc) }, '*story-settings showed the "Restore your chats" prompt instead*'),
            @(@{}, { param($w, $f) Set-WalkFixtureEvidence $w $f 'contact-settings' (Get-WalkFixtureXml 'contact-settings' $loginDesc) }, '*contact-settings showed the login screen instead*'),
            # 584.1's restore prompt as the S22 dumped it: only its button and Close are in the tree.
            @(@{}, { param($w, $f) Set-WalkFixtureEvidence $w $f 'settings' (Get-WalkFixtureXml 'settings' $restoreButton) }, '*settings showed the "Restore your chats" prompt instead*'),
            @(@{}, { param($w) (Step $w 'contact-settings').activity = 'com.facebook.orca/com.facebook.messaging.neue.nux.NeueNuxActivity' },
                "*contact-settings showed one of Messenger's first-run screens instead*"),
            @(@{}, { param($w) (Step $w 'story-settings').activity = 'com.facebook.orca/com.facebook.messaging.accountlogin.AccountLoginActivity' }, '*story-settings showed the login screen instead*'),
            # The wrong screen, or the right activity without its page.
            @(@{}, { param($w) (Step $w 'settings-app').activity = 'com.facebook.orca/.auth.StartScreenActivity' }, "*settings-app reached com.facebook.orca/.auth.StartScreenActivity, not its own*"),
            @(@{}, { param($w) (Step $w 'inbox').activity = 'com.facebook.orca/app.hushmessenger.extension.SettingsActivity' }, '*inbox reached*SettingsActivity, not its own*'),
            @(@{}, { param($w) (Step $w 'inbox').activity = 'com.android.launcher3/.Launcher' }, '*inbox reached com.android.launcher3/.Launcher, not its own*'),
            @(@{}, { param($w, $f) Set-WalkFixtureEvidence $w $f 'settings-controls' (Get-WalkFixtureXml 'settings-app') }, "*settings-controls's screen doesn't show what it should*"),
            @(@{}, { param($w, $f) Set-WalkFixtureEvidence $w $f 'auto-reply' '' }, '*auto-reply left no UI dump'),
            # A link Messenger drops: the inbox stays in front, or another Messenger screen, and the step names it.
            @(@{}, { param($w) (Step $w 'story-settings').activity = 'com.facebook.orca/.auth.StartScreenActivity' }, '*story-settings reached com.facebook.orca/.auth.StartScreenActivity, not its own*'),
            @(@{}, { param($w) (Step $w 'contact-settings').activity = Get-WalkFixtureActivity 'settings' }, '*contact-settings reached*MessengerMePreferenceActivity, not its own*'),
            @(@{}, { param($w) (Step $w 'chat').activity = 'com.facebook.orca/.auth.StartScreenActivity' }, '*chat reached com.facebook.orca/.auth.StartScreenActivity, not its own*'),
            # The right activity showing another step's screen.
            @(@{}, { param($w, $f) Set-WalkFixtureEvidence $w $f 'contact-settings' (Get-WalkFixtureXml 'inbox') }, "*contact-settings's screen doesn't show what it should*"),
            @(@{}, { param($w, $f) Set-WalkFixtureEvidence $w $f 'chat' (Get-WalkFixtureXml 'inbox') }, "*chat's screen doesn't show what it should*"),
            @(@{}, { param($w, $f) Set-WalkFixtureEvidence $w $f 'settings' (Get-WalkFixtureXml 'story-settings') }, "*settings's screen doesn't show what it should*"),
            # Another app in front, as when a dropped link uncovers the app behind Messenger.
            @(@{}, { param($w, $f) Set-WalkFixtureEvidence $w $f 'story-settings' ''; (Step $w 'story-settings').activity = 'com.zhiliaoapp.musically/com.ss.android.ugc.aweme.splash.SplashActivity' },
                '*story-settings left no UI dump, with com.zhiliaoapp.musically in front instead of Messenger*'),
            # The same screen twice, marker and all.
            @(@{}, { param($w, $f) Set-WalkFixtureEvidence $w $f 'contact-settings' ((Get-WalkFixtureXml 'story-settings').Replace('text="Who can see your stories?"', 'text="Manage contacts"')) },
                '*contact-settings showed the same screen as story-settings*'),
            # A secure window stands in only for the log, only below Android 13, and only when it shows the flag.
            @(@{ sdk = 33 }, $secureLog, '*message-log has no screenshot, and only below Android SDK 33 does its window keep one out*'),
            @(@{}, $secureLog, '*message-log has no screenshot, and only below Android SDK 33*'),
            @(@{ sdk = 0 }, $secureLog, '*message-log has no screenshot, and only below Android SDK 33*'),
            @(@{ sdk = '32' }, $secureLog, '*message-log has no screenshot, and only below Android SDK 33*'),
            @($oldEmulator, { param($w, $f) Set-WalkFixtureSecureShot $w $f 'message-log' $WalkFixtureSecureWindow.Replace(' SECURE', '') },
                "*message-log has no screenshot, and its window entry doesn't show FLAG_SECURE*"),
            @($oldEmulator, { param($w, $f) Set-WalkFixtureSecureShot $w $f 'message-log' $mainSecure },
                "*message-log has no screenshot, and its window entry doesn't show FLAG_SECURE*"),
            @($oldEmulator, { param($w, $f) Set-WalkFixtureSecureShot $w $f 'auto-reply' }, "*auto-reply doesn't name its screenshot*"),
            @($oldEmulator, { param($w, $f) Set-WalkFixtureSecureShot $w $f 'settings' }, "*settings doesn't name its screenshot*"),
            @($oldEmulator, { param($w, $f) & $secureLog $w $f; [IO.File]::AppendAllText((Join-Path $f 'steps/message-log.window.txt'), ' ') },
                "*message-log's secureWindow changed after the walk*"),
            @($oldEmulator, { param($w, $f) & $secureLog $w $f; Remove-Item -LiteralPath (Join-Path $f 'steps/message-log.window.txt') },
                "*message-log's secureWindow isn't beside the receipt*"),
            @($oldEmulator, { param($w, $f) & $secureLog $w $f; (Step $w 'message-log').secureWindow = '../message-log.window.txt' },
                "*message-log doesn't name its secureWindow*"))) {
        $path = Write-Walk $badWalk[0] $badWalk[1]
        $bad = Test-WalkReceipt -Path $path -BundlePath $bundle
        Assert-WalkContract (-not $bad.Valid -and $bad.Reason -like $badWalk[2]) "Expected the walk refusal [$($badWalk[2])], got [$($bad.Reason)]."
    }
    # A sheet step for a patch the APK doesn't have.
    $path = Write-Walk -Applied @('Hide Meta AI') -Bend {
        param($w, $f)
        $full = New-WalkFixture -Folder $f -BundleSha256 $bundleSha256
        $w.steps = @($w.steps) + (Step $full 'auto-reply'); $w.screens = 8
    }
    $bad = Test-WalkReceipt -Path $path -BundlePath $bundle
    Assert-WalkContract (-not $bad.Valid -and $bad.Reason -like "*lists auto-reply, which this APK doesn't have*") "A sheet for a missing patch read as: $($bad.Reason)"

    $notJson = Join-Path $work 'not-json.json'
    [IO.File]::WriteAllText($notJson, 'not json')
    $bad = Test-WalkReceipt -Path $notJson -BundlePath $bundle
    Assert-WalkContract (-not $bad.Valid -and $bad.Reason -like "*doesn't read as JSON*") "A receipt that isn't JSON read as: $($bad.Reason)"
    $bad = Test-WalkReceipt -Path (Join-Path $work 'none.json') -BundlePath $bundle
    Assert-WalkContract (-not $bad.Valid -and $bad.Reason -like "*there's no walk receipt at*") "A missing receipt read as: $($bad.Reason)"

    # A walk of one bundle never backs another, even a rebuild of the same commit.
    $path = Write-Walk
    [IO.File]::WriteAllText($bundle, 'the signed bundle, rebuilt')
    $bad = Test-WalkReceipt -Path $path -BundlePath $bundle
    Assert-WalkContract (-not $bad.Valid -and $bad.Reason -like '*patched with bundle*and this one is*') "A walk backed another bundle: $($bad.Reason)"
    $bad = Test-WalkReceipt -Path $path -BundlePath (Join-Path $work 'gone.mpp')
    Assert-WalkContract (-not $bad.Valid -and $bad.Reason -like "*there's no bundle at*") "A walk backed a bundle that isn't there: $($bad.Reason)"
} finally {
    Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue
}

# Publish asks for the walk once the built assets check out, before the notes, the tag or GitHub.
$releaseText = [IO.File]::ReadAllText((Join-Path $PSScriptRoot 'release/release.ps1'))
$publishAt = $releaseText.IndexOf("'publish' {")
$assetsAt = $releaseText.IndexOf('SHA256SUMS.txt or its signature changed after the build stage', $publishAt)
$walkAt = $releaseText.IndexOf('$walked = Test-WalkReceipt -Path $Walk', $publishAt)
$refuseAt = $releaseText.IndexOf('if (-not $walked.Valid) {', $publishAt)
foreach ($later in @('Get-ChangelogSection', 'Invoke-Git tag', 'refs/tags/$tag', 'gh release create')) {
    $laterAt = $releaseText.IndexOf($later, $publishAt)
    Assert-WalkContract ($publishAt -gt 0 -and $assetsAt -gt $publishAt -and $walkAt -gt $assetsAt -and $refuseAt -gt $walkAt -and $laterAt -gt $refuseAt) `
        "release.ps1 -Stage publish reaches $later before it holds the bundle to its walk."
}
Assert-WalkContract ($releaseText -match '(?m)^\s*\[string\]\$Walk,') 'release.ps1 has no -Walk.'
Write-Host '[scripts] walk receipt contracts passed'
