<#
.SYNOPSIS
    A made-up walk for the walk contract tests: a receipt plus the screenshot and UI dump of every
    step, written to a folder the way walk-app.ps1 leaves them. Dot-source after walk-receipt.ps1.
#>

$WalkFixturePatches = [string[]]@('Settings in Messenger', 'Keep a message log', 'Auto reply', 'Hide Meta AI')

# What each step's screen read as on the S22: the resumed activity and the node its marker matches.
$WalkFixtureScreens = @{
    'chat' = @('com.facebook.orca/com.facebook.messaging.msys.thread.fragment.MsysThreadViewActivity', '', 'Matt Parker, Thread details', 'android.widget.Button')
    'inbox' = @('com.facebook.orca/.auth.StartScreenActivity', '', 'New message', 'android.widget.Button')
    'settings-controls' = @('com.facebook.orca/app.hushmessenger.extension.SettingsActivity', 'Controls', '', 'android.widget.Button')
    'settings-app' = @('com.facebook.orca/app.hushmessenger.extension.SettingsActivity', 'App', '', 'android.widget.Button')
    'message-log' = @('com.facebook.orca/app.hushmessenger.extension.SettingsActivity', 'Message log', '', 'android.widget.TextView')
    'auto-reply' = @('com.facebook.orca/app.hushmessenger.extension.SettingsActivity', 'Auto replies', '', 'android.widget.TextView')
    'settings' = @('com.facebook.orca/com.facebook.messaging.settings.mesettings.surface.MessengerMePreferenceActivity', 'Dark mode', '', 'android.widget.TextView')
    'story-settings' = @('com.facebook.orca/com.facebook.messaging.montage.prefs.MontagePreferenceActivity', 'Who can see your stories?', '', 'android.widget.TextView')
    'contact-settings' = @('com.facebook.orca/com.facebook.messaging.contacts.settings.mesettings.NeueContactsPreferenceActivity', 'Manage contacts', '', 'android.widget.TextView')
}

function Get-WalkFixtureActivity([string]$Id) { return $WalkFixtureScreens[$Id][0] }

function Get-WalkFixtureXml {
    <# A UI dump for step -Id: its marker, inside a root only this step has, so no two steps share a screen. #>
    param([Parameter(Mandatory = $true)][string]$Id, [string]$Extra = '')
    $screen = $WalkFixtureScreens[$Id]
    $selected = if ($Id -in 'settings-controls', 'settings-app') { 'true' } else { 'false' }
    $marker = "<node index=""0"" text=""$($screen[1])"" resource-id="""" class=""$($screen[3])"" package=""com.facebook.orca"" content-desc=""$($screen[2])"" enabled=""true"" selected=""$selected"" bounds=""[0,100][1080,200]"" />"
    return "<?xml version='1.0' encoding='UTF-8' standalone='yes' ?><hierarchy rotation=""0""><node index=""0"" text="""" resource-id=""fixture:id/$Id"" class=""android.widget.FrameLayout"" package=""com.facebook.orca"" content-desc="""" enabled=""true"" selected=""false"" bounds=""[0,0][1080,2340]"">$marker$Extra</node></hierarchy>"
}

function Write-WalkFixtureFile([string]$Path, [byte[]]$Bytes) {
    [void][IO.Directory]::CreateDirectory((Split-Path -Parent $Path))
    [IO.File]::WriteAllBytes($Path, $Bytes)
    return (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant()
}

function New-WalkFixture {
    <#
    .SYNOPSIS
        Writes steps/<id>.png and steps/<id>.xml for every step these patches require into -Folder
        and answers the PASS receipt for them, ready to bend and save.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Folder,
        [Parameter(Mandatory = $true)][string]$BundleSha256,
        [string[]]$AppliedPatches = $WalkFixturePatches,
        [string]$Serial = 'TESTPHONE01', [string]$Device = 'SM-S908U1', [string]$ApkSha256 = ('4' * 64), [int]$Sdk = 36
    )
    $records = foreach ($id in (Get-WalkRequiredSteps -AppliedPatches $AppliedPatches)) {
        $png = [byte[]](0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A) + [Text.Encoding]::ASCII.GetBytes("fixture screenshot $id")
        [ordered]@{
            id = $id; activity = (Get-WalkFixtureActivity $id); opened = $true; problem = ''
            screenshot = "steps/$id.png"; screenshotSha256 = (Write-WalkFixtureFile (Join-Path $Folder "steps/$id.png") $png)
            uiDump = "steps/$id.xml"; uiDumpSha256 = (Write-WalkFixtureFile (Join-Path $Folder "steps/$id.xml") ([Text.Encoding]::UTF8.GetBytes((Get-WalkFixtureXml $id))))
        }
    }
    return New-WalkReceipt -Result PASS -Full $true -Serial $Serial -Device $Device -Sdk $Sdk -AppVersion '584.1.0.61.98' `
        -BundleSha256 $BundleSha256 -PatchedApkSha256 $ApkSha256 -InstalledApkSha256 $ApkSha256 `
        -Started '2026-10-26T16:00:00Z' -Finished '2026-10-26T16:30:00Z' -AppliedPatches $AppliedPatches -Steps @($records) -Crashes 0
}

# dumpsys window windows on the API 32 emulator with the message log open (2026-10-27, cut down): the log's
# dialog window under SettingsActivity's name, fl= on a wrapped mAttrs line, then a Messenger window after it.
$WalkFixtureSecureWindow = @(
    '  Window #10 Window{176f3f5 u0 com.facebook.orca/app.hushmessenger.extension.SettingsActivity}:'
    '    mDisplayId=0 rootTaskId=86 mSession=Session{5248708 17461:u0a10156} mClient=android.os.BinderProxy@464cd2c'
    '    mOwnerUid=10156 showForAllUsers=false package=com.facebook.orca appop=NONE'
    '    mAttrs={(0,0)(fillxfill) gr=CENTER sim={adjust=resize} ty=APPLICATION wanim=0x10302ff surfaceInsets=Rect(84, 84 - 84, 84)'
    '      fl=DIM_BEHIND SECURE SPLIT_TOUCH HARDWARE_ACCELERATED'
    '      pfl=USE_BLAST'
    '  Window #12 Window{7a8b9c0 u0 com.facebook.orca/com.facebook.messenger.neue.MainActivity}:'
    '    mAttrs={(0,0)(fillxfill) sim={adjust=resize} ty=BASE_APPLICATION'
    '      fl=LAYOUT_IN_SCREEN LAYOUT_INSET_DECOR SPLIT_TOUCH HARDWARE_ACCELERATED'
) -join "`n"

function Set-WalkFixtureSecureShot {
    <# Swaps step -Id's screenshot in -Folder for a secure window entry, -Entry, the way walk-app.ps1 records one. #>
    param([Parameter(Mandatory = $true)]$Receipt, [Parameter(Mandatory = $true)][string]$Folder,
        [Parameter(Mandatory = $true)][string]$Id, [string]$Entry = $WalkFixtureSecureWindow)
    $step = @($Receipt.steps | Where-Object { $_.id -ceq $Id })[0]
    Remove-Item -LiteralPath (Join-Path $Folder $step.screenshot) -Force
    $step.screenshot = ''; $step.screenshotSha256 = ''
    $step.secureWindow = "steps/$Id.window.txt"
    $step.secureWindowSha256 = Write-WalkFixtureFile (Join-Path $Folder $step.secureWindow) ([Text.Encoding]::UTF8.GetBytes($Entry))
}

function Set-WalkFixtureEvidence {
    <# Replaces step -Id's UI dump in -Folder with -Xml and updates its hash in -Receipt. #>
    param([Parameter(Mandatory = $true)]$Receipt, [Parameter(Mandatory = $true)][string]$Folder,
        [Parameter(Mandatory = $true)][string]$Id, [Parameter(Mandatory = $true)][AllowEmptyString()][string]$Xml)
    $step = @($Receipt.steps | Where-Object { $_.id -ceq $Id })[0]
    $step.uiDumpSha256 = Write-WalkFixtureFile (Join-Path $Folder $step.uiDump) ([Text.Encoding]::UTF8.GetBytes($Xml))
}
