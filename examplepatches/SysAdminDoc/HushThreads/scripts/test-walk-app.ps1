<#
.SYNOPSIS
    Offline contracts for walk-app-core.ps1: what the walk taps, how it tells the settings pages
    apart, which logcat lines are Threads crashes, and when a walk is PASS.
.DESCRIPTION
    test-script-contracts.ps1 runs this, so the push gate holds it for every script change. The
    dumps below were recorded on Threads 452.0.0.50.64 (emulator-5580, 1080x2400), cut to the rows
    the walk reads.
#>
[CmdletBinding()]
param([string]$Root, [string]$Java, [string]$DesktopJar, [string]$Aapt2)
$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $PSScriptRoot 'walk-receipt.ps1')
. (Join-Path $PSScriptRoot 'walk-app-core.ps1')

function Assert-WalkContract([bool]$Condition, [string]$Message) {
    if (-not $Condition) { throw $Message }
}

# The settings pages come from SettingsNavigation.java, in the order home lists them.
$sections = @(Get-WalkSections -Root $Root)
Assert-WalkContract ($sections.Count -eq 10 -and $sections[0] -ceq 'Feed' -and $sections[-1] -ceq 'About' -and
    $sections -ccontains 'Pause, backup and diagnostics') "Get-WalkSections read: $($sections -join ', ')"

function New-WalkDump([string[]]$Rows) {
    $pkg = 'package="com.instagram.barcelona"'
    $xmlRows = foreach ($row in $Rows) { $row.Replace('PKG', $pkg) }
    "<?xml version='1.0' encoding='UTF-8' standalone='yes' ?><hierarchy rotation=`"0`">$($xmlRows -join '')</hierarchy>"
}
$header = @(
    '<node text="" resource-id="" class="android.widget.Button" PKG content-desc="Back" clickable="true" bounds="[42,254][168,380]" />'
    '<node text="HushThreads" resource-id="" class="android.widget.TextView" PKG content-desc="" clickable="false" bounds="[210,254][1038,297]" />'
)
$homeDump = New-WalkDump (@($header) + @(
        '<node text="Settings" resource-id="" class="android.widget.TextView" PKG content-desc="" clickable="false" bounds="[210,297][1038,396]" />'
        '<node text="Search settings" resource-id="" class="android.widget.EditText" PKG content-desc="Search settings" clickable="true" bounds="[147,433][912,570]" />'
        '<node text="HushThreads is on" resource-id="android:id/title" class="android.widget.TextView" PKG content-desc="" clickable="false" bounds="[246,683][600,740]" />'
        '<node text="Pause" resource-id="" class="android.widget.Button" PKG content-desc="" clickable="true" bounds="[820,672][1006,798]" />'
        '<node text="Quick setups" resource-id="android:id/title" class="android.widget.TextView" PKG content-desc="" clickable="false" bounds="[236,935][481,992]" />'
        '<node text="BROWSE SETTINGS" resource-id="android:id/title" class="android.widget.TextView" PKG content-desc="" clickable="false" bounds="[0,1192][1080,1307]" />'
        '<node text="" resource-id="" class="android.widget.Button" PKG content-desc="" clickable="true" bounds="[0,1307][1080,1570]">'
        '<node text="Feed" resource-id="android:id/title" class="android.widget.TextView" PKG content-desc="" clickable="false" bounds="[236,1362][329,1419]" />'
        '<node text="Ads and suggested accounts in your feed" resource-id="android:id/summary" class="android.widget.TextView" PKG content-desc="" clickable="false" bounds="[236,1419][922,1515]" />'
        '</node>'
        '<node text="Privacy" resource-id="android:id/title" class="android.widget.TextView" PKG content-desc="" clickable="false" bounds="[236,1638][376,1695]" />'
        '<node text="" resource-id="" class="android.widget.TextView" PKG content-desc="" clickable="false" bounds="[0,591][1080,592]" />'
    ))
$feedDump = New-WalkDump (@($header) + @(
        '<node text="Feed" resource-id="" class="android.widget.TextView" PKG content-desc="" clickable="false" bounds="[210,297][1038,396]" />'
        '<node text="" resource-id="" class="android.widget.Switch" PKG content-desc="" clickable="true" bounds="[0,433][1080,794]">'
        '<node text="Hide ads" resource-id="android:id/title" class="android.widget.TextView" PKG content-desc="" clickable="false" bounds="[236,488][403,545]" />'
        '<node text="" resource-id="android:id/switch_widget" class="android.widget.Switch" PKG content-desc="" clickable="false" bounds="[885,556][1006,624]" />'
        '</node>'
    ))
# A Threads screen whose own text happens to read HushThreads and Feed, with no settings header.
$threadsDump = New-WalkDump @(
    '<node text="HushThreads" resource-id="com.instagram.barcelona:id/username" class="android.widget.TextView" PKG content-desc="" clickable="true" bounds="[210,254][1038,297]" />'
    '<node text="Feed" resource-id="" class="android.widget.TextView" PKG content-desc="" clickable="true" bounds="[400,2250][680,2337]" />'
)

$homeNodes = @(ConvertFrom-UiDump -Xml $homeDump)
$feedNodes = @(ConvertFrom-UiDump -Xml $feedDump)
Assert-WalkContract ((Get-WalkSettingsPage -Nodes $homeNodes -Sections $sections) -ceq 'home') 'The settings home dump did not read as home.'
Assert-WalkContract ((Get-WalkSettingsPage -Nodes $feedNodes -Sections $sections) -ceq 'Feed') 'The Feed page dump did not read as Feed.'
Assert-WalkContract ($null -eq (Get-WalkSettingsPage -Nodes @(ConvertFrom-UiDump -Xml $threadsDump) -Sections $sections)) 'A Threads screen read as a settings page.'
Assert-WalkContract ($null -eq (Get-WalkSettingsPage -Nodes @() -Sections $sections)) 'An empty dump read as a settings page.'
# A page hides the search box, so a page name over a search box isn't a page the walk opened.
$searchUnderFeed = @(ConvertFrom-UiDump -Xml $homeDump.Replace('text="Settings"', 'text="Feed"'))
Assert-WalkContract ($null -eq (Get-WalkSettingsPage -Nodes $searchUnderFeed -Sections $sections)) 'A page name over the search box read as that page.'

$feedRow = Find-WalkSectionRow -Nodes $homeNodes -Section 'Feed'
Assert-WalkContract ($feedRow -and $feedRow.X -eq 282 -and $feedRow.Y -eq 1390) "The Feed row was found at $($feedRow.X),$($feedRow.Y), not 282,1390."
Assert-WalkContract ($null -eq (Find-WalkSectionRow -Nodes $homeNodes -Section 'Downloads')) 'A page whose row is off screen was found.'
Assert-WalkContract ($null -eq (Find-WalkSectionRow -Nodes $feedNodes -Section 'Feed')) "The Feed page's own header was taken for its row."

# What the walk refuses to tap, whatever a lookup hands it.
$refused = @(
    @{ Why = 'Quick setups'; Node = ($homeNodes | Where-Object Text -ceq 'Quick setups') }
    @{ Why = 'the Pause button'; Node = ($homeNodes | Where-Object Text -ceq 'Pause') }
    @{ Why = 'a Feed node without the title id'; Node = ($homeNodes | Where-Object { $_.Text -ceq 'Feed' } | Select-Object -First 1 | ForEach-Object { $copy = $_.PSObject.Copy(); $copy.Id = 'summary'; $copy }) }
    @{ Why = 'a one-pixel Feed title'; Node = ($feedRow.PSObject.Copy() | ForEach-Object { $_.Bottom = $_.Top + 1; $_ }) }
    @{ Why = "another app's Feed title"; Node = ($feedRow.PSObject.Copy() | ForEach-Object { $_.Package = 'com.instagram.android'; $_ }) }
    @{ Why = 'a Hide ads switch'; Node = ($feedNodes | Where-Object Text -ceq 'Hide ads') }
)
foreach ($case in $refused) {
    Assert-WalkContract ($null -ne $case.Node) "The fixture for $($case.Why) is missing."
    Assert-WalkContract (-not (Test-WalkTapAllowed -Node $case.Node -Sections $sections)) "The walk would tap $($case.Why)."
}
Assert-WalkContract (Test-WalkTapAllowed -Node $feedRow -Sections $sections) 'The walk refused the Feed row itself.'

# Threads' screens and the way into its settings, cut from the same recordings.
function New-WalkNode([string]$Id, [string]$Bounds, [string]$Text = '', [string]$Desc = '', [string]$Class = 'android.view.View') {
    "<node text=`"$Text`" resource-id=`"$Id`" class=`"$Class`" PKG content-desc=`"$Desc`" clickable=`"false`" bounds=`"$Bounds`" />"
}
$tabBar = @(
    New-WalkNode -Id 'tabs_screen' -Bounds '[0,0][1080,2400]'
    New-WalkNode -Id '' -Desc 'Feed' -Bounds '[111,2232][174,2295]'
    New-WalkNode -Id 'barcelona_tab_profile' -Bounds '[839,2190][1038,2337]'
    New-WalkNode -Id '' -Desc 'Profile' -Bounds '[907,2232][970,2295]'
)
$postText = 'You can now attach longer text to your Threads posts. Helpful when you want to link out to something longform'
$feedScreen = @(ConvertFrom-UiDump -Xml (New-WalkDump (@($tabBar) + @(
                New-WalkNode -Id 'MainFeedScreen' -Bounds '[0,0][1080,2400]'
                New-WalkNode -Id 'ig_text' -Text 'mrp1900s' -Class 'android.widget.TextView' -Bounds '[158,281][347,334]'
            ))))
$postScreen = @(ConvertFrom-UiDump -Xml (New-WalkDump (@($tabBar) + @(
                New-WalkNode -Id 'MainFeedScreen' -Bounds '[0,0][1080,2400]'
                New-WalkNode -Id '' -Text $postText -Class 'android.widget.TextView' -Bounds '[158,547][1038,800]'
            ))))
$ownProfile = @(ConvertFrom-UiDump -Xml (New-WalkDump (@($tabBar) + @(
                New-WalkNode -Id 'ProfileScreen' -Bounds '[0,0][1080,2190]'
                New-WalkNode -Id 'profile_screen_profile_settings' -Desc 'Settings' -Class 'android.widget.ImageView' -Bounds '[944,140][1070,266]'
                New-WalkNode -Id 'ig_text' -Text 'Parker' -Class 'android.widget.TextView' -Bounds '[42,312][231,385]'
                New-WalkNode -Id 'profile_screen_edit_profile_button' -Bounds '[42,581][466,676]'
                New-WalkNode -Id '' -Desc 'Follow' -Bounds '[79,1232][415,1358]'
            ))))
$theirProfile = New-WalkDump @(
    New-WalkNode -Id 'ProfileScreen' -Bounds '[0,829][1080,2400]'
    New-WalkNode -Id 'profile_screen_profile_settings' -Desc 'Profile menu' -Class 'android.widget.ImageView' -Bounds '[944,883][1070,1009]'
    New-WalkNode -Id 'ig_text' -Text 'Mark Zuckerberg' -Class 'android.widget.TextView' -Bounds '[42,1040][520,1110]'
    New-WalkNode -Id 'profile_screen_follow_button' -Bounds '[42,1500][520,1600]'
)
$threadsSettings = New-WalkDump @(
    New-WalkNode -Id 'navigation_bar_back_button' -Desc 'Back' -Class 'android.widget.Button' -Bounds '[0,139][158,265]'
    New-WalkNode -Id 'SettingsScreen' -Bounds '[0,128][1080,2400]'
    New-WalkNode -Id 'ig_text' -Text 'Privacy' -Class 'android.widget.TextView' -Bounds '[158,1312][305,1364]'
    New-WalkNode -Id 'ig_text' -Text 'HushThreads' -Class 'android.widget.TextView' -Bounds '[158,1941][425,1993]'
    New-WalkNode -Id 'ig_text' -Text 'More settings' -Class 'android.widget.TextView' -Bounds '[158,2127][433,2179]'
)
$threadsSettingsNodes = @(ConvertFrom-UiDump -Xml $threadsSettings)
$theirProfileNodes = @(ConvertFrom-UiDump -Xml $theirProfile)

$screenByName = @{}
foreach ($screen in $WalkScreens) { $screenByName[$screen.Name] = $screen }
Assert-WalkContract (Test-WalkScreenShown -Nodes $feedScreen -Screen $screenByName['Home feed']) 'The feed did not read as the Home feed.'
Assert-WalkContract (-not (Test-WalkScreenShown -Nodes $feedScreen -Screen $screenByName['Activity'])) 'The feed read as Activity, so a link that lands on the feed would pass.'
Assert-WalkContract (-not (Test-WalkScreenShown -Nodes $feedScreen -Screen $screenByName['Opened post'])) 'The feed without the post read as the opened post.'
Assert-WalkContract (Test-WalkScreenShown -Nodes $postScreen -Screen $screenByName['Opened post']) 'The feed with the post on top did not read as the opened post.'
Assert-WalkContract (Test-WalkScreenShown -Nodes $theirProfileNodes -Screen $screenByName['Profile']) "zuck's profile did not read as the Profile screen."
Assert-WalkContract (-not (Test-WalkScreenShown -Nodes $ownProfile -Screen $screenByName['Profile'])) "The own profile read as zuck's."
Assert-WalkContract (-not (Test-WalkScreenShown -Nodes @(ConvertFrom-UiDump -Xml $homeDump) -Screen $screenByName['Home feed'])) 'The HushThreads settings read as the Home feed.'
foreach ($screen in $WalkScreens) {
    Assert-WalkContract ([bool]$screen.ExpectId) "The $($screen.Name) screen has no screen id to check it opened."
}

# A screen still drawing, or a video holding uiautomator off, is no fault until the wait runs out.
$feedTest = { param($dump) Test-WalkScreenShown -Nodes $dump -Screen $screenByName['Home feed'] }
$script:walkReads = 0
$slowDrawing = @(@(), $ownProfile, $feedScreen)
$drawn = Wait-WalkScreen -Seconds 30 -PauseMilliseconds 1 -Test $feedTest -Read { $slowDrawing[$script:walkReads++] }
Assert-WalkContract ($drawn.Found -and $script:walkReads -eq 3 -and $drawn.Nodes.Count -eq $feedScreen.Count -and -not $drawn.Unread) "A screen that drew on the third read wasn't found there: $script:walkReads reads."
$script:walkReads = 0
$neverThere = Wait-WalkScreen -Seconds 0 -PauseMilliseconds 1 -Test $feedTest -Read { $script:walkReads++; $ownProfile }
Assert-WalkContract (-not $neverThere.Found -and $script:walkReads -eq 1 -and -not $neverThere.Unread -and $neverThere.Nodes.Count -gt 0) "A screen read without the thing in it didn't answer as read and missing."
$unreadable = Wait-WalkScreen -Seconds 0 -PauseMilliseconds 1 -Test { throw 'An empty read was tested.' } -Read { }
Assert-WalkContract (-not $unreadable.Found -and $unreadable.Unread -and $unreadable.Nodes.Count -eq 0) "A screen that couldn't be read didn't answer as unread."

# The way into Threads' settings: each step on its own screen, and nowhere else.
$profileTab = Find-WalkPathNode -Nodes $feedScreen -Step $WalkSettingsPath[0]
Assert-WalkContract ($profileTab -and $profileTab.X -eq 938 -and $profileTab.Y -eq 2263) "The Profile tab was found at $($profileTab.X),$($profileTab.Y), not 938,2263."
$settingsButton = Find-WalkPathNode -Nodes $ownProfile -Step $WalkSettingsPath[1]
Assert-WalkContract ($settingsButton -and $settingsButton.X -eq 1007 -and $settingsButton.Y -eq 203) "The profile's Settings button was found at $($settingsButton.X),$($settingsButton.Y), not 1007,203."
$hushRow = Find-WalkPathNode -Nodes $threadsSettingsNodes -Step $WalkSettingsPath[2]
Assert-WalkContract ($hushRow -and $hushRow.X -eq 291 -and $hushRow.Y -eq 1967) "The HushThreads row was found at $($hushRow.X),$($hushRow.Y), not 291,1967."
Assert-WalkContract ($WalkSettingsPath[2].Shows -ceq "Threads' settings") "Finding the HushThreads row doesn't count Threads' settings as reached."
# A screen too short for the HushThreads row swipes Threads' settings to it, and nothing else gets swiped.
$hushStep = $WalkSettingsPath[2]
$shortSettings = @($threadsSettingsNodes | Where-Object Text -cne 'HushThreads')
$script:walkSwipes = 0
$scrolled = Wait-WalkStep -Step $hushStep -Seconds 0 -Swipe { $script:walkSwipes++ } -Read { if ($script:walkSwipes -gt 0) { $threadsSettingsNodes } else { $shortSettings } }
Assert-WalkContract ($scrolled.Found -and $script:walkSwipes -eq 1 -and (Find-WalkPathNode -Nodes $scrolled.Nodes -Step $hushStep)) "The HushThreads row below the fold wasn't found by one swipe: $script:walkSwipes swipes."
$script:walkSwipes = 0
$listEnd = Wait-WalkStep -Step $hushStep -Seconds 0 -Swipe { $script:walkSwipes++ } -Read { $shortSettings }
Assert-WalkContract (-not $listEnd.Found -and -not $listEnd.Unread -and $script:walkSwipes -eq 1) "A list that stopped moving didn't end the swiping as read and missing: $script:walkSwipes swipes."
$script:walkSwipes = 0
$offSettings = Wait-WalkStep -Step $hushStep -Seconds 0 -Swipe { $script:walkSwipes++ } -Read { $feedScreen }
Assert-WalkContract (-not $offSettings.Found -and $script:walkSwipes -eq 0) "The walk swiped a screen that isn't Threads' settings."
$script:walkSwipes = 0
$unscrolled = Wait-WalkStep -Step $WalkSettingsPath[1] -Seconds 0 -Swipe { $script:walkSwipes++ } -Read { $theirProfileNodes }
Assert-WalkContract (-not $unscrolled.Found -and $script:walkSwipes -eq 0) "A step that doesn't scroll swiped its screen."
$script:walkSwipes = 0
$unreadSettings = Wait-WalkStep -Step $hushStep -Seconds 0 -Swipe { $script:walkSwipes++ } -Read { }
Assert-WalkContract (-not $unreadSettings.Found -and $unreadSettings.Unread -and $script:walkSwipes -eq 0) "A screen that couldn't be read didn't answer as unread, or got swiped."
Assert-WalkContract ($null -eq (Find-WalkPathNode -Nodes $theirProfileNodes -Step $WalkSettingsPath[1])) "The walk would open someone else's profile menu."
$theirAsSettings = @(ConvertFrom-UiDump -Xml $theirProfile.Replace('content-desc="Profile menu"', 'content-desc="Settings"'))
Assert-WalkContract ($null -eq (Find-WalkPathNode -Nodes $theirAsSettings -Step $WalkSettingsPath[1])) "The walk would tap a profile's settings button away from the own profile's Edit profile."
$ownMenu = @($ownProfile | ForEach-Object { $copy = $_.PSObject.Copy(); if ($copy.Desc -ceq 'Settings') { $copy.Desc = 'Profile menu' }; $copy })
Assert-WalkContract ($null -eq (Find-WalkPathNode -Nodes $ownMenu -Step $WalkSettingsPath[1])) "The walk would tap the profile button when it isn't labeled Settings."
$hushName = @(ConvertFrom-UiDump -Xml $theirProfile.Replace('Mark Zuckerberg', 'HushThreads'))
Assert-WalkContract ($null -eq (Find-WalkPathNode -Nodes $hushName -Step $WalkSettingsPath[2])) "The walk would tap a profile named HushThreads."
$tabUnderSheet = @(ConvertFrom-UiDump -Xml ($theirProfile.Replace('</hierarchy>', '') + $tabBar[2].Replace('PKG', 'package="com.instagram.barcelona"') + '</hierarchy>'))
Assert-WalkContract (@($tabUnderSheet | Where-Object Id -ceq 'barcelona_tab_profile').Count -eq 1 -and
    $null -eq (Find-WalkPathNode -Nodes $tabUnderSheet -Step $WalkSettingsPath[0])) "The Profile tab was tapped on a screen without the tab bar's screen."
foreach ($case in @(
        @{ Why = 'More settings'; Node = ($threadsSettingsNodes | Where-Object Text -ceq 'More settings'); OnScreen = $threadsSettingsNodes }
        @{ Why = 'a Follow button'; Node = ($ownProfile | Where-Object Desc -ceq 'Follow'); OnScreen = $ownProfile }
        @{ Why = "zuck's follow button"; Node = ($theirProfileNodes | Where-Object Id -ceq 'profile_screen_follow_button'); OnScreen = $theirProfileNodes }
        @{ Why = "the feed's Profile icon"; Node = ($feedScreen | Where-Object Desc -ceq 'Profile'); OnScreen = $feedScreen })) {
    Assert-WalkContract ($null -ne $case.Node) "The fixture for $($case.Why) is missing."
    Assert-WalkContract (-not (Test-WalkTapAllowed -Node $case.Node -Sections $sections -Nodes $case.OnScreen)) "The walk would tap $($case.Why)."
}

# Crashes. Threads' own processes count, another app's don't, and one crash logged twice
# (a native crash's signal and debuggerd lines) counts once.
$log = @(
    '1761190000.100  4100  4100 I ActivityManager: Start proc 4100:com.instagram.barcelona/u0a210'
    '1761190010.200  4100  4100 E AndroidRuntime: FATAL EXCEPTION: main'
    '1761190010.200  4100  4100 E AndroidRuntime: Process: com.instagram.barcelona, PID: 4100'
    '1761190010.200  4100  4100 E AndroidRuntime: java.lang.NullPointerException: feed row'
    '1761190010.200  4100  4100 E AndroidRuntime: 	at X.a(Unknown Source:12)'
    '1761190020.300  5200  5200 E AndroidRuntime: FATAL EXCEPTION: main'
    '1761190020.300  5200  5200 E AndroidRuntime: Process: com.instagram.android, PID: 5200'
    '1761190020.300  5200  5200 E AndroidRuntime: java.lang.IllegalStateException: not ours'
    '1761190030.400  6300  6320 F libc    : Fatal signal 11 (SIGSEGV), code 1, fault addr 0x0 in tid 6320 (mqtt), pid 6300 (com.instagram.barcelona:mqtt)'
    '1761190030.500  6400  6400 F DEBUG   : pid: 6300, tid: 6320, name: mqtt  >>> com.instagram.barcelona:mqtt <<<'
    '1761190040.600  1500  1600 E ActivityManager: ANR in com.instagram.barcelona (com.instagram.barcelona/.mainactivity.BarcelonaActivity)'
    '1761190050.700  1500  1600 E ActivityManager: ANR in com.instagram.barcelonafake'
)
$crashes = @(Get-WalkCrashes -Lines $log)
Assert-WalkContract ($crashes.Count -eq 3) "Get-WalkCrashes found $($crashes.Count) crashes, not 3: $(($crashes | ForEach-Object { "$($_.Kind) $($_.Process)" }) -join '; ')"
Assert-WalkContract ($crashes[0].Kind -ceq 'java' -and $crashes[0].Pid -ceq '4100' -and $crashes[0].Detail -ceq 'java.lang.NullPointerException: feed row') `
    "The Java crash read as $($crashes[0].Kind) $($crashes[0].Pid) '$($crashes[0].Detail)'."
Assert-WalkContract ($crashes[1].Kind -ceq 'native' -and $crashes[1].Process -ceq 'com.instagram.barcelona:mqtt') 'The native crash in :mqtt was missed.'
Assert-WalkContract ($crashes[2].Kind -ceq 'anr') 'The ANR was missed.'
Assert-WalkContract (@(Get-WalkCrashes -Lines @()).Count -eq 0) 'An empty log read as a crash.'

# Only what the walk logged: an earlier crash on the device is not this walk's.
$since = @(Select-WalkLogSince -Lines $log -Since 1761190015)
Assert-WalkContract ($since.Count -eq 7 -and $since[0] -like '1761190020.300  5200  5200 E AndroidRuntime: FATAL*') `
    "Select-WalkLogSince kept $($since.Count) lines from $($since[0])."
Assert-WalkContract (@(Get-WalkCrashes -Lines $since).Count -eq 2) 'A crash from before the walk began was counted.'
$stack = @(Select-WalkLogSince -Lines @('1761190010.200  4100  4100 E AndroidRuntime: FATAL EXCEPTION: main', 'no time on this line') -Since 1761190000)
Assert-WalkContract ($stack.Count -eq 2) 'A line with no time of its own was split from the line before it.'

# The verdict. A crash fails the walk even when every screen opened, a skipped screen makes it
# partial, a screen that wouldn't open fails it, and only a whole clean walk passes.
$planned = @('Settings: home', 'Settings: Feed', 'Home feed', 'Opened post')
$pass = Get-WalkVerdict -Planned $planned -Reached $planned
Assert-WalkContract ($pass.Result -ceq 'PASS' -and $pass.Full -and $pass.Problems.Count -eq 0) "A clean walk came back $($pass.Result)."
$crashed = Get-WalkVerdict -Planned $planned -Reached $planned -Crashes @($crashes[0])
Assert-WalkContract ($crashed.Result -ceq 'FAIL' -and $crashed.Problems[0] -like '*java crash in com.instagram.barcelona (pid 4100)*') `
    "A walk with a crash came back $($crashed.Result): $($crashed.Problems -join '; ')"
$skipped = Get-WalkVerdict -Planned $planned -Reached @('Settings: home', 'Home feed', 'Opened post')
Assert-WalkContract ($skipped.Result -ceq 'PARTIAL' -and -not $skipped.Full -and $skipped.Problems -ccontains 'not reached: Settings: Feed') `
    "A walk that skipped a page came back $($skipped.Result): $($skipped.Problems -join '; ')"
$fault = Get-WalkVerdict -Planned $planned -Reached @('Settings: home', 'Settings: Feed', 'Home feed') -Faults @('Opened post did not open')
Assert-WalkContract ($fault.Result -ceq 'FAIL') "A screen that wouldn't open came back $($fault.Result)."
Assert-WalkContract ((Get-WalkVerdict -Planned $planned -Reached @()).Result -ceq 'FAIL') 'A walk that reached nothing was not a FAIL.'
Assert-WalkContract ((Get-WalkVerdict -Planned @() -Reached @()).Result -ceq 'FAIL') 'A walk with nothing planned was not a FAIL.'

# Publication checks every field independently against a complete, coherent artifact chain.
$scratch = Join-Path ([IO.Path]::GetTempPath()) ('hushthreads-walk-test-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $scratch | Out-Null
try {
    $bundle = Join-Path $scratch 'patches-1.2.3.mpp'
    $sourceCommit = (@(Invoke-RepoGit -Root $Root -Arguments @('rev-parse', 'HEAD')) -join '').Trim()
    $sourceTree = (@(Invoke-RepoGit -Root $Root -Arguments @('rev-parse', 'HEAD^{tree}')) -join '').Trim()
    $manifest = "Manifest-Version: 1.0`nVersion: 1.2.3`nPatcher-Version: 2.0.0`nTimestamp: 1761190000`n" +
        "HushThreads-Source-State: clean`nHushThreads-Source-Commit: $sourceCommit`nHushThreads-Source-Tree: $sourceTree`nHushThreads-Input-SHA256: $('3' * 64)`n`n"
    $zip = [IO.Compression.ZipFile]::Open($bundle, [IO.Compression.ZipArchiveMode]::Create)
    try {
        $writer = [IO.StreamWriter]::new($zip.CreateEntry('META-INF/MANIFEST.MF').Open())
        try { $writer.Write($manifest) } finally { $writer.Dispose() }
    } finally { $zip.Dispose() }
    $zip = [IO.Compression.ZipFile]::OpenRead($bundle)
    try { $payload = Get-BundlePayloadSha256 -Archive $zip } finally { $zip.Dispose() }
    $zip = [IO.Compression.ZipFile]::Open($bundle, [IO.Compression.ZipArchiveMode]::Update)
    try {
        $writer = [IO.StreamWriter]::new($zip.CreateEntry('META-INF/hushthreads-build.identity').Open())
        try { $writer.Write("hushthreads-bundle-1`n$payload`n") } finally { $writer.Dispose() }
    } finally { $zip.Dispose() }
    $bundleSha = (Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash.ToLowerInvariant()
    $inputFile = Join-Path $scratch 'vendor.apk'
    $outputFile = Join-Path $scratch 'patched.apk'
    $catalogPath = Join-Path $scratch 'patches-list.json'
    $sourceCatalogJson = @(Invoke-RepoGit -Root $Root -Arguments @('show', ($sourceCommit + ':patches-list.json'))) -join "`n"
    [IO.File]::WriteAllText($catalogPath, $sourceCatalogJson)
    $catalog = Read-WalkJson -Path $catalogPath
    $target = Get-PatchTarget -PatchList $catalog
    $selected = [string]$catalog.patches[0].name
    $dependencies = @(Get-PatchDependencyNames -PatchList $catalog -RequestedNames @($selected))
    $Java = Resolve-Java -Explicit $Java
    $DesktopJar = Resolve-DesktopCli -Explicit $DesktopJar -Root $Root -Required
    $Aapt2 = Resolve-Aapt2 -Explicit $Aapt2 -Root $Root
    $sdk = Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $Aapt2))
    $androidJar = @(Get-ChildItem -LiteralPath (Join-Path $sdk 'platforms') -Directory |
        Sort-Object Name -Descending | ForEach-Object { Join-Path $_.FullName 'android.jar' } |
        Where-Object { Test-Path -LiteralPath $_ -PathType Leaf })[0]
    if (-not $androidJar) { throw 'The walk fixture needs an installed Android SDK platform.' }
    $manifestPath = Join-Path $scratch 'AndroidManifest.xml'
    # The catalog names 453 without pinning a code, so a stand-in fills in when no code is pinned.
    $vendorCode = [string]@(@($target.PackageVersionCodes[$target.PackageVersion]) + '512308675' | Where-Object { $_ })[0]
    [IO.File]::WriteAllText($manifestPath, ('<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="{0}" android:versionName="{1}" android:versionCode="{2}"><application/></manifest>' -f
        $target.PackageName, $target.PackageVersion, $vendorCode))
    & $Aapt2 link -o $outputFile --manifest $manifestPath -I $androidJar
    Assert-WalkContract ($LASTEXITCODE -eq 0) 'aapt2 could not make the binary manifest fixture.'
    Copy-Item -LiteralPath $outputFile -Destination $inputFile
    $expectedIdentity = "sha256=$payload; source=clean:$sourceCommit; tree=$sourceTree; inputs=$('3' * 64)"
    $dexFile = Join-Path $scratch 'classes.dex'
    function Write-WalkFixtureDex([string]$Identity, [string]$Fault) {
        $fixtureArguments = @($dexFile, $Identity)
        if ($Fault) { $fixtureArguments += $Fault }
        & $Java -Xmx256m -cp $DesktopJar (Join-Path $PSScriptRoot 'WalkApkFixture.java') @fixtureArguments
        Assert-WalkContract ($LASTEXITCODE -eq 0) 'The walk fixture DEX could not be generated.'
        $archive = [IO.Compression.ZipFile]::Open($outputFile, [IO.Compression.ZipArchiveMode]::Update)
        try {
            $oldDex = $archive.GetEntry('classes.dex')
            if ($oldDex) { $oldDex.Delete() }
            [void][IO.Compression.ZipFileExtensions]::CreateEntryFromFile($archive, $dexFile, 'classes.dex')
        } finally { $archive.Dispose() }
    }
    Write-WalkFixtureDex -Identity $expectedIdentity
    $validatorTools = @{ Java = $Java; DesktopJar = $DesktopJar; Aapt2 = $Aapt2 }
    $patch = [ordered]@{
        schema = 1; kind = 'hushthreads-patch'; bundleSha256 = $bundleSha; bundlePayloadSha256 = $payload
        input = [ordered]@{ file = $inputFile; sha256 = (Get-FileHash $inputFile).Hash.ToLowerInvariant()
            package = $target.PackageName; versionName = $target.PackageVersion; versionCode = $vendorCode }
        apk = [ordered]@{ file = $outputFile; sha256 = (Get-FileHash $outputFile).Hash.ToLowerInvariant()
            package = $target.PackageName; versionName = $target.PackageVersion; versionCode = $vendorCode }
        catalog = [ordered]@{ file = $catalogPath; sha256 = (Get-FileHash $catalogPath).Hash.ToLowerInvariant() }
        requestedPatches = @($selected); appliedPatches = @($selected) + $dependencies; options = 'defaults'
    }
    $wholePlan = @(Get-WalkExpectedScreens -Root $Root)
    $path = Join-Path $scratch 'walk-receipt.json'
    $good = New-WalkReceipt -Result PASS -Full $true -Serial 'emulator-5580' -Device 'sdk_gphone64_x86_64' `
        -AppVersion $patch.apk.versionName -AppVersionCode $patch.apk.versionCode -BundleSha256 $bundleSha `
        -InstalledApkSha256 $patch.apk.sha256 -InstalledBeforeSha256 $patch.apk.sha256 -Started ([DateTimeOffset]::UtcNow.AddMinutes(-1)) `
        -Finished ([DateTimeOffset]::UtcNow) -Screens $wholePlan.Count -Crashes 0 -PlannedScreens $wholePlan -ReachedScreens $wholePlan -Patch $patch
    $goodJson = ConvertTo-Json -InputObject $good -Depth 12
    [IO.File]::WriteAllText($path, $goodJson)
    $checked = Test-WalkReceipt -Path $path -BundlePath $bundle @validatorTools
    Assert-WalkContract $checked.Valid "A complete matching walk failed: $($checked.Reason)"
    # Exercise the retained-install producer itself. All ADB calls are intercepted in this scope.
    & {
        . (Join-Path $PSScriptRoot 'walk-app.ps1')
        function Get-BundleVersion { param($Root) '1.2.3' }
        function Get-ReleaseBundlePath { param($Root, $Version) $bundle }
        function Assert-HushThreadsDeviceLease { }
        $seenCommands = [Collections.Generic.List[string]]::new()
        function Invoke-HushThreadsAdbCommand {
            param($Adb, [switch]$RequireLease, [string[]]$Arguments)
            $seenCommands.Add($Arguments -join ' ')
            switch ($Arguments[3]) {
                'pm' { return [pscustomobject]@{ ExitCode = 0; Output = @('package:/fixture/base.apk') } }
                'dumpsys' { return [pscustomobject]@{ ExitCode = 0; Output = @("versionName=$($patch.apk.versionName)", "versionCode=$($patch.apk.versionCode)") } }
                'sha256sum' { return [pscustomobject]@{ ExitCode = 0; Output = @(('0' * 64) + '  /fixture/base.apk') } }
                default { throw "Unexpected device command in refusal test: $($Arguments -join ' ')" }
            }
        }
        $producerArguments = @{
            Serial = 'emulator-5580'; SkipPatch = $true; SkipSettings = $false; SettleSeconds = 0
            OutDir = $scratch; Root = $Root; PatchArgs = $validatorTools
            PatchReceipt = (Join-Path $scratch 'missing-patch-receipt.json')
        }
        $refusal = ''
        try { [void](Invoke-WalkApp @producerArguments) } catch { $refusal = $_.Exception.Message }
        Assert-WalkContract ($refusal -like '*No patch provenance*' -and $seenCommands.Count -eq 0) 'An unknown retained install reached a device command.'
        $producerArguments.PatchReceipt = Join-Path $scratch 'patch-receipt.json'
        [IO.File]::WriteAllText($producerArguments.PatchReceipt, (ConvertTo-Json -InputObject $patch -Depth 12))
        $refusal = ''
        try { [void](Invoke-WalkApp @producerArguments) } catch { $refusal = $_.Exception.Message }
        Assert-WalkContract ($refusal -like '*retained installed APK does not match*') "A stale retained install was not refused: $refusal"
        Assert-WalkContract (@($seenCommands | Where-Object { $_ -match ' install | force-stop | am | input ' }).Count -eq 0) 'A stale retained install was changed before refusal.'
    }
    foreach ($case in @(
            @{ Name = 'old schema'; Change = { param($r) $r.schema = 1 } },
            @{ Name = 'stale app'; Change = { param($r) $r.appVersion = '451.0.0.51.80' } },
            @{ Name = 'wrong version code'; Change = { param($r) $r.appVersionCode = '1' } },
            @{ Name = 'empty installed hash'; Change = { param($r) $r.installedApkSha256 = '' } },
            @{ Name = 'changed installed bytes'; Change = { param($r) $r.installedBeforeSha256 = '0' * 64 } },
            @{ Name = 'missing before hash'; Change = { param($r) $r.installedBeforeSha256 = '' } },
            @{ Name = 'one screen'; Change = { param($r) $r.screens = 1 } },
            @{ Name = 'missing reached page'; Change = { param($r) $r.reachedScreens = @($r.reachedScreens | Select-Object -Skip 1) } },
            @{ Name = 'missing planned page'; Change = { param($r) $r.plannedScreens = @($r.plannedScreens | Select-Object -Skip 1) } },
            @{ Name = 'duplicate page'; Change = { param($r) $r.reachedScreens[-1] = $r.reachedScreens[0] } },
            @{ Name = 'invented page'; Change = { param($r) $r.plannedScreens[-1] = 'Not a screen' } },
            @{ Name = 'missing problems'; Change = { param($r) $r.problems = $null } },
            @{ Name = 'recorded problem'; Change = { param($r) $r.problems = @('missing page') } },
            @{ Name = 'invalid timestamp'; Change = { param($r) $r.started = 'not a time' } },
            @{ Name = 'reversed timestamps'; Change = { param($r) $r.started = ([DateTimeOffset]::UtcNow.AddHours(1)).UtcDateTime.ToString('o') } },
            @{ Name = 'future timestamps'; Change = { param($r) $r.finished = ([DateTimeOffset]::UtcNow.AddDays(1)).UtcDateTime.ToString('o') } },
            @{ Name = 'missing provenance'; Change = { param($r) $r.patch = $null } },
            @{ Name = 'another bundle'; Change = { param($r) $r.patch.bundleSha256 = '0' * 64 } },
            @{ Name = 'ZIP digest as payload'; Change = { param($r) $r.patch.bundlePayloadSha256 = $r.bundleSha256 } },
            @{ Name = 'changed input'; Change = { param($r) $r.patch.input.sha256 = '0' * 64 } },
            @{ Name = 'changed output'; Change = { param($r) $r.patch.apk.sha256 = '0' * 64 } },
            @{ Name = 'changed catalog'; Change = { param($r) $r.patch.catalog.sha256 = '0' * 64 } },
            @{ Name = 'undeclared input'; Change = { param($r) $r.patch.input.versionCode = '1' } },
            @{ Name = 'missing selected patch'; Change = { param($r) $r.patch.appliedPatches = @('unrelated patch') } },
            @{ Name = 'duplicated selected patch'; Change = { param($r) $r.patch.requestedPatches = @($r.patch.requestedPatches[0], $r.patch.requestedPatches[0]) } },
            @{ Name = 'unrecorded options'; Change = { param($r) $r.patch.options = 'custom' } },
            @{ Name = 'crash'; Change = { param($r) $r.crashes = 1 } },
            @{ Name = 'partial'; Change = { param($r) $r.full = $false } })) {
        [IO.File]::WriteAllText($path, $goodJson)
        $bad = Read-WalkJson -Path $path
        & $case.Change $bad
        [IO.File]::WriteAllText($path, (ConvertTo-Json -InputObject $bad -Depth 12))
        $checked = Test-WalkReceipt -Path $path -BundlePath $bundle @validatorTools
        Assert-WalkContract (-not $checked.Valid) "Publish accepted $($case.Name)."
    }
    foreach ($phone in @('SM-S908U1', 'SM-S938B')) {
        $good.device = $phone; $good.serial = 'LEASED_PHONE'; $good.emulator = $false
        [IO.File]::WriteAllText($path, (ConvertTo-Json -InputObject $good -Depth 12))
        $checked = Test-WalkReceipt -Path $path -BundlePath $bundle @validatorTools
        Assert-WalkContract $checked.Valid "A matching release phone failed: $($checked.Reason)"
    }
    # A substituted catalog cannot redefine what the bundle declares, even with its own hash.
    $foreignCatalog = Read-WalkJson -Path $catalogPath
    foreach ($listed in $foreignCatalog.patches) {
        $listed.compatiblePackages.PSObject.Properties[$target.PackageName].Value =
            @($target.PackageVersion, '999.0.0.0.0')
    }
    [IO.File]::WriteAllText($catalogPath, (ConvertTo-Json -InputObject $foreignCatalog -Depth 40))
    $good.patch.catalog.sha256 = (Get-FileHash -LiteralPath $catalogPath).Hash.ToLowerInvariant()
    [IO.File]::WriteAllText($path, (ConvertTo-Json -InputObject $good -Depth 12))
    $checked = Test-WalkReceipt -Path $path -BundlePath $bundle @validatorTools
    Assert-WalkContract (-not $checked.Valid -and $checked.Reason -like '*catalog*not*declaration*bundle source commit*') 'Publish accepted a substituted catalog with its matching hash.'
    [IO.File]::WriteAllText($catalogPath, $sourceCatalogJson)
    $good.patch.catalog.sha256 = (Get-FileHash -LiteralPath $catalogPath).Hash.ToLowerInvariant()

    # Coherent receipt hashes must not disguise an APK that carries an older bundle identity.
    $goodBytes = [IO.File]::ReadAllBytes($outputFile)
    Write-WalkFixtureDex -Identity $expectedIdentity.Replace($payload, ('0' * 64))
    $good.patch.apk.sha256 = (Get-FileHash -LiteralPath $outputFile).Hash.ToLowerInvariant()
    $good.installedBeforeSha256 = $good.patch.apk.sha256; $good.installedApkSha256 = $good.patch.apk.sha256
    [IO.File]::WriteAllText($path, (ConvertTo-Json -InputObject $good -Depth 12))
    $checked = Test-WalkReceipt -Path $path -BundlePath $bundle @validatorTools
    Assert-WalkContract (-not $checked.Valid -and $checked.Reason -like '*payload identity*') 'Publish accepted stale APK identity with coherently changed hashes.'
    [IO.File]::WriteAllBytes($outputFile, $goodBytes)
    Write-WalkFixtureDex -Identity $expectedIdentity -Fault clobber
    $good.patch.apk.sha256 = (Get-FileHash -LiteralPath $outputFile).Hash.ToLowerInvariant()
    $good.installedBeforeSha256 = $good.patch.apk.sha256; $good.installedApkSha256 = $good.patch.apk.sha256
    [IO.File]::WriteAllText($path, (ConvertTo-Json -InputObject $good -Depth 12))
    $checked = Test-WalkReceipt -Path $path -BundlePath $bundle @validatorTools
    Assert-WalkContract (-not $checked.Valid -and $checked.Reason -like '*payload identity*') 'Publish accepted a getter that overwrites the expected identity before returning.'
    [IO.File]::WriteAllBytes($outputFile, $goodBytes)
    $good.patch.apk.sha256 = (Get-FileHash -LiteralPath $outputFile).Hash.ToLowerInvariant()
    $good.installedBeforeSha256 = $good.patch.apk.sha256; $good.installedApkSha256 = $good.patch.apk.sha256
    Remove-Item -LiteralPath $outputFile
    [IO.File]::WriteAllText($manifestPath, [IO.File]::ReadAllText($manifestPath).Replace($target.PackageVersion, '1.0.0.0.0'))
    & $Aapt2 link -o $outputFile --manifest $manifestPath -I $androidJar
    Assert-WalkContract ($LASTEXITCODE -eq 0) 'aapt2 could not make the stale binary manifest fixture.'
    Write-WalkFixtureDex -Identity $expectedIdentity
    $good.patch.apk.sha256 = (Get-FileHash -LiteralPath $outputFile).Hash.ToLowerInvariant()
    $good.installedBeforeSha256 = $good.patch.apk.sha256; $good.installedApkSha256 = $good.patch.apk.sha256
    [IO.File]::WriteAllText($path, (ConvertTo-Json -InputObject $good -Depth 12))
    $checked = Test-WalkReceipt -Path $path -BundlePath $bundle @validatorTools
    Assert-WalkContract (-not $checked.Valid -and $checked.Reason -like '*manifest contradicts*') 'Publish accepted a contradictory APK manifest.'
} finally {
    Remove-Item -LiteralPath $scratch -Recurse -Force -ErrorAction SilentlyContinue
}

# walk-app.ps1 itself: it parses, taps only through Invoke-WalkTap, which checks the node first,
# and opens every Threads screen by link.
$walkPath = Join-Path $PSScriptRoot 'walk-app.ps1'
$tokens = $null; $errors = $null
$ast = [Management.Automation.Language.Parser]::ParseFile($walkPath, [ref]$tokens, [ref]$errors)
Assert-WalkContract ($errors.Count -eq 0) "walk-app.ps1 doesn't parse: $($errors | Select-Object -First 1)"
$walkSource = [IO.File]::ReadAllText($walkPath)
$taps = @([regex]::Matches($walkSource, "'input', 'tap'"))
Assert-WalkContract ($taps.Count -eq 1 -and $walkSource -cmatch "'input', 'tap', `"\`$\(\`$Row\.X\)`", `"\`$\(\`$Row\.Y\)`"") `
    'walk-app.ps1 taps something other than the node Invoke-WalkTap was handed.'
Assert-WalkContract ($walkSource -cmatch '(?s)function Invoke-WalkTap\(\$Row, \[object\[\]\]\$OnScreen\) \{\s*if \(-not \(Test-WalkTapAllowed -Node \$Row -Sections \$sections -Nodes \$OnScreen\)\) \{\s*throw') `
    "walk-app.ps1's Invoke-WalkTap doesn't refuse a node Test-WalkTapAllowed turns down before tapping."
Assert-WalkContract (@([regex]::Matches($walkSource, 'Invoke-WalkTap -Row')).Count -eq 2) 'walk-app.ps1 taps from somewhere other than the settings path and the settings rows.'
Assert-WalkContract ($walkSource -notmatch 'KEYCODE_(POWER|SLEEP)|stay_on_while_plugged_in|pm (clear|uninstall)|logcat[^\r\n]*-c') `
    'walk-app.ps1 sends power or sleep, changes stay awake, clears Threads or clears the log.'
foreach ($screen in $WalkScreens) {
    Assert-WalkContract ($screen.Link -match '^(barcelona://|https://www\.threads\.com/)') "The $($screen.Name) screen opens by '$($screen.Link)', not a Threads link."
}

Write-Host '[scripts] whole-app walk contracts passed'
