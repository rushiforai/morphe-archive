<# Offline contracts for walk-app-core.ps1: what the walk taps, which logcat lines are TikTok crashes, and when a walk is PASS. #>
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'walk-receipt.ps1')
. (Join-Path $PSScriptRoot 'walk-app-core.ps1')

function Assert-WalkContract([bool]$Condition, [string]$Message) {
    if (-not $Condition) { throw $Message }
}

# A For You dump as uiautomator writes it on 47.5.3, cut to the rows the walk reads.
$dump = @'
<?xml version='1.0' encoding='UTF-8' standalone='yes' ?><hierarchy rotation="0"><node index="0" text="" resource-id="" class="android.widget.FrameLayout" package="com.zhiliaoapp.musically" content-desc="" checkable="false" checked="false" clickable="false" enabled="true" focusable="false" focused="false" scrollable="false" long-clickable="false" password="false" selected="false" bounds="[0,0][1080,2181]"><node index="0" text="" resource-id="com.zhiliaoapp.musically:id/ixi" class="android.widget.Button" package="com.zhiliaoapp.musically" content-desc="Follow ItsMeKatyG" checkable="false" checked="false" clickable="true" enabled="true" focusable="true" focused="false" scrollable="false" long-clickable="false" password="false" selected="false" bounds="[910,995][1080,1092]" /><node index="1" text="" resource-id="com.zhiliaoapp.musically:id/g9b" class="android.widget.Button" package="com.zhiliaoapp.musically" content-desc="Like video. 285 likes" checkable="false" checked="false" clickable="true" enabled="true" focusable="true" focused="false" scrollable="false" long-clickable="false" password="false" selected="false" bounds="[900,1092][1080,1261]" /><node index="2" text="" resource-id="com.zhiliaoapp.musically:id/epr" class="android.widget.Button" package="com.zhiliaoapp.musically" content-desc="Read or add comments. 49 comments" checkable="false" checked="false" clickable="true" enabled="true" focusable="true" focused="false" scrollable="false" long-clickable="false" password="false" selected="false" bounds="[855,1261][1080,1430]" /><node index="3" text="" resource-id="com.zhiliaoapp.musically:id/g9b" class="android.widget.Button" package="com.zhiliaoapp.musically" content-desc="Share video. 34 shares" checkable="false" checked="false" clickable="true" enabled="true" focusable="true" focused="false" scrollable="false" long-clickable="false" password="false" selected="false" bounds="[900,1599][1080,1768]" /><node index="4" text="Following" resource-id="android:id/text1" class="android.widget.TextView" package="com.zhiliaoapp.musically" content-desc="" checkable="false" checked="false" clickable="false" enabled="true" focusable="false" focused="false" scrollable="false" long-clickable="false" password="false" selected="false" bounds="[390,75][598,238]" /><node index="5" text="" resource-id="com.zhiliaoapp.musically:id/op1" class="android.widget.FrameLayout" package="com.zhiliaoapp.musically" content-desc="Home" checkable="false" checked="false" clickable="true" enabled="true" focusable="true" focused="false" scrollable="false" long-clickable="false" password="false" selected="true" bounds="[0,2043][216,2181]" /><node index="6" text="" resource-id="" class="android.view.View" package="com.zhiliaoapp.musically" content-desc="" checkable="false" checked="false" clickable="false" enabled="true" focusable="false" focused="false" scrollable="false" long-clickable="false" password="false" selected="false" bounds="[0,0][0,0]" /></node></hierarchy>
'@
$nodes = @(ConvertFrom-UiDump -Xml $dump)
Assert-WalkContract ($nodes.Count -eq 8) "ConvertFrom-UiDump read $($nodes.Count) nodes, not 8."
$comments = @(Find-UiNode -Nodes $nodes -Label '^Read or add comments') | Select-Object -First 1
Assert-WalkContract ($comments -and $comments.X -eq 967 -and $comments.Y -eq 1345 -and $comments.Id -ceq 'epr' -and $comments.Clickable) `
    'The comment button was not read with its center, id and clickable flag.'
$homeTab = @(Find-UiNode -Nodes $nodes -Label '^Home$') | Select-Object -First 1
Assert-WalkContract ($homeTab.Selected -and $homeTab.Top -eq 2043) "The Home tab's selected flag or bounds were lost."
Assert-WalkContract (@(Find-UiNode -Nodes $nodes -Label '^$').Count -eq 0 -or
    @(Find-UiNode -Nodes $nodes -Label '^$' | Where-Object { $_.Right -eq $_.Left }).Count -eq 0) 'Find-UiNode returned a node with no area.'
Assert-WalkContract (@(ConvertFrom-UiDump -Xml '').Count -eq 0) 'An empty dump did not read as no nodes.'

# The walk opens sheets and tabs. It never follows, likes, messages, posts or saves, even when
# a lookup goes wrong and hands it one of those.
foreach ($label in 'Follow ItsMeKatyG', 'Follow back', 'Like video. 285 likes', 'Message', 'Send', 'Post', 'Repost',
    'Add friend', 'Confirm', 'Remove Angela from suggested accounts', 'Download', 'Save video', 'Log out') {
    Assert-WalkContract (-not (Test-WalkTapAllowed -Node ([pscustomobject]@{ Text = ''; Desc = $label }))) "The walk would tap '$label'."
    Assert-WalkContract (-not (Test-WalkTapAllowed -Node ([pscustomobject]@{ Text = $label; Desc = '' }))) "The walk would tap text '$label'."
}
foreach ($label in 'Following', 'For You', 'Read or add comments. 49 comments', 'Share video. 34 shares', 'Search', 'Inbox',
    'Profile menu', 'Settings and privacy', 'Hushfeed', 'Downloads', 'Share sheet', 'Backup and restore', 'Search settings') {
    Assert-WalkContract (Test-WalkTapAllowed -Node ([pscustomobject]@{ Text = $label; Desc = '' })) "The walk refused '$label', which it needs."
}

# The same on an Italian TikTok (Login2), with the labels recorded there on 47.5.3, plus the
# quick setups on Hushfeed's home and pages, which change settings in one tap.
$agrave = [string][char]0xE0; $ugrave = [string][char]0xF9; $isolate = [string][char]0x2068
foreach ($label in 'Segui Kass', 'Metti Mi piace al video. 384.254 Mi piace', 'Mi piace', 'Ripubblica', 'Scarica', 'Segnala',
    'Aggiungi persona', 'Aggiungi persone', 'Invita', 'Rimuovi', 'Duetto', 'Ripristina predefiniti', 'Usa "Feed tranquillo"',
    'Back to defaults', 'Use "Calm feed"', 'Add people') {
    Assert-WalkContract (-not (Test-WalkTapAllowed -Node ([pscustomobject]@{ Text = $label; Desc = '' }))) "The walk would tap '$label'."
}
$italian = @{
    Home = 'Home'; Friends = 'Amici'; Inbox = 'Posta in arrivo'; Profile = 'Profilo'; ForYou = 'Per te'; Following = 'Seguiti'
    Search = 'Cerca'; CommentsButton = 'Leggi o aggiungi commenti. 12.519 commenti'; CommentsSheet = "${isolate}12.520 commenti"
    ShareButton = 'Condividi il video. 42.711 condivisioni'; ShareSheet = 'Copia link'; ActivityRow = "Attivit$agrave e nuovi follower"
    ActivityTitle = "Attivit$agrave"; ProfileMenu = "Men$ugrave del profilo"; SettingsAndPrivacy = 'Impostazioni e privacy'
}
foreach ($key in $WalkLabels.Keys) {
    Assert-WalkContract ($italian.ContainsKey($key)) "No recorded Italian label for $key."
    Assert-WalkContract ($italian[$key] -match $WalkLabels[$key]) "$key's label doesn't match Italian '$($italian[$key])'."
    Assert-WalkContract (Test-WalkTapAllowed -Node ([pscustomobject]@{ Text = $italian[$key]; Desc = '' })) "The walk refused '$($italian[$key])', which it needs."
}
# English TikTok 47.5.3 on the S22 writes the Inbox row with an ampersand.
foreach ($row in 'Activity & new followers', 'Activity and new followers', 'Activity') {
    Assert-WalkContract ($row -match $WalkLabels.ActivityRow) "The Activity row label doesn't match '$row'."
    Assert-WalkContract (Test-WalkTapAllowed -Node ([pscustomobject]@{ Text = $row; Desc = '' })) "The walk refused '$row', which it needs."
}
Assert-WalkContract ('Activity status: turned off' -notmatch $WalkLabels.ActivityRow) 'The Activity row label matched the status button.'
Assert-WalkContract ('Aggiungi un commento...' -match $WalkLabels.CommentsSheet) "The comment field didn't mark the comment sheet."
Assert-WalkContract ('Seguiti' -notmatch $WalkLabels.Friends -and 'Visualizza 18 risposte' -notmatch $WalkLabels.CommentsSheet) 'A label matched the wrong row.'

# Hushfeed's titles in every language it ships, read from its translation tables.
$root = Split-Path -Parent $PSScriptRoot
$translations = Get-HushfeedTranslations -Root $root
Assert-WalkContract ($translations['Backup and restore'] -contains 'Backup e ripristino') "The Italian table's 'Backup and restore' wasn't read."
Assert-WalkContract ($translations['Search settings'] -contains 'Cerca nelle impostazioni') "The Italian table's 'Search settings' wasn't read."
Assert-WalkContract ($translations['Feed filter'].Count -ge 8) "'Feed filter' has $($translations['Feed filter'].Count) translations, not one per table."
$privacy = Get-WalkTitleLabel 'Privacy' $translations
Assert-WalkContract ('Privacy' -match $privacy -and 'PRIVACY' -notmatch $privacy -and 'Privacy and app' -notmatch $privacy) "The Privacy row label is '$privacy'."
$feedFilter = Get-WalkTitleLabel 'Feed filter' $translations
Assert-WalkContract ('Filtro del feed' -match $feedFilter -and 'Feed filter' -match $feedFilter -and 'Feed' -notmatch $feedFilter) "The Feed filter label is '$feedFilter'."
Assert-WalkContract ((Get-WalkTitleLabel 'Not a title' @{}) -ceq '(?-i)^(Not\ a\ title)$') 'An untranslated title was not matched as itself.'

# Italian names the Downloads page "Download", a word the walk never taps, except as that page's
# own row on Hushfeed's home.
$downloads = Get-WalkTitleLabel 'Downloads' $translations
$row = [pscustomobject]@{ Text = 'Download'; Desc = ''; Id = 'title' }
Assert-WalkContract (Test-WalkTapAllowed -Node $row -Title $downloads) "The walk refused Italian's Downloads row."
Assert-WalkContract (-not (Test-WalkTapAllowed -Node $row)) 'A "Download" row was tapped with no Hushfeed title to vouch for it.'
Assert-WalkContract (-not (Test-WalkTapAllowed -Node ([pscustomobject]@{ Text = 'Download'; Desc = ''; Id = 'w81' }) -Title $downloads)) `
    "TikTok's Download button was tapped as the Downloads row."
Assert-WalkContract (-not (Test-WalkTapAllowed -Node ([pscustomobject]@{ Text = 'Follow'; Desc = ''; Id = 'title' }) -Title $downloads)) `
    'A Follow row was tapped under the Downloads title.'

# Logcat: TikTok's own crashes count, once each. Other apps and ordinary process deaths don't.
$logcat = @(
    '10-22 21:40:01.100  1000  1500 I ActivityManager: Process com.zhiliaoapp.musically (pid 4100) has died: fg  TOP',
    '10-22 21:40:02.000  5200  5200 E AndroidRuntime: FATAL EXCEPTION: main',
    '10-22 21:40:02.000  5200  5200 E AndroidRuntime: Process: com.zhiliaoapp.musically, PID: 5200',
    '10-22 21:40:02.000  5200  5200 E AndroidRuntime: java.lang.NullPointerException: Attempt to invoke virtual method',
    '10-22 21:40:03.000  6100  6100 E AndroidRuntime: FATAL EXCEPTION: main',
    '10-22 21:40:03.000  6100  6100 E AndroidRuntime: Process: com.instagram.android, PID: 6100',
    '10-22 21:40:03.000  6100  6100 E AndroidRuntime: java.lang.IllegalStateException: not ours',
    '10-22 21:40:04.000  5300  5300 E AndroidRuntime: FATAL EXCEPTION: push',
    '10-22 21:40:04.000  5300  5300 E AndroidRuntime: Process: com.zhiliaoapp.musically:push, PID: 5300',
    '10-22 21:40:04.000  5300  5300 E AndroidRuntime: java.lang.RuntimeException: push died',
    '10-22 21:40:05.000  5400  5490 F libc    : Fatal signal 11 (SIGSEGV), code 1 (SEGV_MAPERR), fault addr 0x0 in tid 5490 (RenderThread), pid 5400 (liaoapp.musically)',
    '10-22 21:40:05.500  5500  5500 F DEBUG   : pid: 5400, tid: 5490, name: RenderThread  >>> com.zhiliaoapp.musically <<<',
    '10-22 21:40:06.000  7000  7010 F libc    : Fatal signal 6 (SIGABRT), code -1 (SI_QUEUE) in tid 7010 (Thread-2), pid 7000 (com.whatsapp)',
    '10-22 21:40:07.000  1000  1500 E ActivityManager: ANR in com.zhiliaoapp.musically (com.zhiliaoapp.musically/com.ss.android.ugc.aweme.main.MainActivity)'
)
$crashes = @(Get-WalkCrashes -Lines $logcat)
$kinds = ($crashes | ForEach-Object { "$($_.Kind):$($_.Pid)" }) -join ','
Assert-WalkContract ($crashes.Count -eq 4 -and $kinds -like 'java:5200,java:5300,native:5400,anr:line*') "Get-WalkCrashes found '$kinds'."
Assert-WalkContract ($crashes[0].Detail -like 'java.lang.NullPointerException*') "A Java crash didn't carry its exception: $($crashes[0].Detail)"
Assert-WalkContract (@(Get-WalkCrashes -Lines $logcat[0..0] + $logcat[4..6] + $logcat[12..12]).Count -eq 0) `
    "A force-stop or another app's crash counted as a TikTok crash."
Assert-WalkContract (@(Get-WalkCrashes -Lines @()).Count -eq 0) 'No logcat found a crash.'

# The verdict, then the receipt it makes and whether publish takes it.
$planned = @('launch', 'feed: For You', 'settings: Hushfeed', 'settings: Playback')
$clean = Get-WalkVerdict -Planned $planned -Reached $planned
Assert-WalkContract ($clean.Result -eq 'PASS' -and $clean.Full -and $clean.Problems.Count -eq 0) "A clean walk was $($clean.Result)."
$skipped = Get-WalkVerdict -Planned $planned -Reached $planned[0..2]
Assert-WalkContract ($skipped.Result -eq 'PARTIAL' -and -not $skipped.Full -and $skipped.Problems -contains 'not reached: settings: Playback') `
    "A walk that skipped a page was $($skipped.Result): $($skipped.Problems -join '; ')"
$crashed = Get-WalkVerdict -Planned $planned -Reached $planned -Crashes $crashes[0..0]
Assert-WalkContract ($crashed.Result -eq 'FAIL' -and $crashed.Problems[0] -like 'java crash in com.zhiliaoapp.musically (pid 5200)*') `
    "A walk with a crash was $($crashed.Result): $($crashed.Problems -join '; ')"
$faulted = Get-WalkVerdict -Planned $planned -Reached $planned -Faults @('TikTok left the foreground during Following')
Assert-WalkContract ($faulted.Result -eq 'FAIL') "A walk where TikTok left the foreground was $($faulted.Result)."
Assert-WalkContract ((Get-WalkVerdict -Planned $planned -Reached @()).Result -eq 'FAIL') 'A walk that reached nothing was not FAIL.'
Assert-WalkContract ((Get-WalkVerdict -Planned @() -Reached @('launch')).Result -eq 'PARTIAL') 'A walk with no plan passed.'

$work = Join-Path ([IO.Path]::GetTempPath()) ('hushfeed-walk-app-contract-' + [guid]::NewGuid().ToString('N'))
[void][IO.Directory]::CreateDirectory($work)
try {
    $bundle = Join-Path $work 'patches-0.78.0.mpp'
    [IO.File]::WriteAllText($bundle, 'the signed bundle')
    $sha = (Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash
    foreach ($case in @(@($clean, $true), @($skipped, $false), @($crashed, $false))) {
        $verdict = $case[0]
        $receipt = New-WalkReceipt -Result $verdict.Result -Full $verdict.Full -Serial 'TESTPHONE01' -Device 'SM-S908U1' `
            -AppVersion '47.5.3' -BundleSha256 $sha -InstalledApkSha256 ('4' * 64) -Started '2026-10-22T21:00:00Z' `
            -Finished '2026-10-22T21:20:00Z' -Screens 3 -Crashes $(if ($verdict.Result -eq 'FAIL') { 1 } else { 0 }) -Problems $verdict.Problems
        $path = Join-Path $work 'walk-receipt.json'
        [IO.File]::WriteAllText($path, ($receipt | ConvertTo-Json -Depth 4))
        $tested = Test-WalkReceipt -Path $path -BundlePath $bundle
        Assert-WalkContract ($tested.Valid -eq $case[1]) "Publish $(if ($case[1]) { 'refused' } else { 'took' }) a $($verdict.Result) walk: $($tested.Reason)"
    }
} finally {
    Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host '[scripts] walk app contracts passed'
