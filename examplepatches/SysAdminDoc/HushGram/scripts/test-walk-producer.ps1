<#
.SYNOPSIS
    Exercise walkthrough navigation and candidate reuse with device and artifact-reader stand-ins.
.NOTES
    Copyright 2026 HushGram contributors. https://github.com/SysAdminDoc/HushGram
    GPL-3.0-only.
#>
[CmdletBinding()]
param()
$ErrorActionPreference='Stop'
. (Join-Path $PSScriptRoot 'walk-app.ps1')
$checks=0
$scratch=Join-Path ([IO.Path]::GetTempPath()) ('hushgram-walk-producer-'+[guid]::NewGuid().ToString('N'))

function Assert-Producer([bool]$Condition, [string]$Message) {
    if (-not $Condition) { throw $Message }
    $script:checks++
}
function Assert-ProducerRefused([scriptblock]$Action, [string]$Pattern) {
    $reason=$null
    try { & $Action | Out-Null } catch { $reason=$_.Exception.Message }
    Assert-Producer ($null -ne $reason -and $reason -like $Pattern) "Expected '$Pattern', received '$reason'."
}
function Reset-Producer {
    $script:state=@{ calls=[Collections.Generic.List[string]]::new(); captures=0; leases=0; releases=0; reads=0; bindings=0
        current='home'; refuseAt=0; wrongBefore=$false; wrongAfter=$false; artifactDrift=$false; rejectProof=$false; wrongPackage=$false }
    $script:state.settingsMode='none'
    $script:state.expanded=$false; $script:state.expandBroken=$false; $script:state.foldBroken=$false; $script:state.headingTaps=0
}
# Strict APK/report/PNG validation has its own real-byte fixtures. These tests cover the
# producer's choice of operations and its propagation of each reader's refusal.
function Resolve-NativeRunnerTools { [pscustomobject]@{ Adb='adb-fixture'; Java='java-fixture'; Aapt2='aapt-fixture' } }
function Get-BundleVersion { '0.0.0' }
function Get-ReleaseBundlePath { Join-Path $scratch 'bundle.mpp' }
function Get-WalkArtifactBinding {
    $state.bindings++
    [pscustomobject]@{ bundleSha256=('a'*64); apkSha256=('b'*64); selectedPatches=@('fixture')
        sourceBuildIdentity=$(if ($state.artifactDrift -and $state.bindings -gt 1) { 'changed' } else { 'hg1:fixture' })
        target=[pscustomobject]@{ package=$(if ($state.wrongPackage) { 'com.example.other' } else { 'com.instagram.android' })
            versionName='fixture'; versionCode='2147483647' } }
}
function Get-WalkRequiredDestinations {
    foreach ($entry in @(@('home','feed_tab'),@('explore','search_tab'),@('reels','clips_tab'),@('inbox','direct_tab'),@('profile','profile_tab'))) {
        [pscustomobject]@{ id=$entry[0]; title=$entry[0]; kind='native'; tab=$entry[1] }
    }
    if ($state.settingsMode -cne 'none') {
        [pscustomobject]@{ id='settings-root'; title='HushGram settings'; kind='settings-root'; page=$false; anchors=@() }
        [pscustomobject]@{ id='settings-fixture'; title='Fixture category'; kind='settings'; page=$true; anchors=@('Known row') }
        [pscustomobject]@{ id='settings-pause'; title='Pause and diagnostics'; kind='settings'; page=$false; anchors=@('Pause HushGram') }
    }
}
function New-WalkCaptureApk { 'capture-fixture.apk' }
function Enter-HushgramDeviceLease { $state.leases++; [pscustomobject]@{ Serial='emulator-5554' } }
function Confirm-HushgramDevice { }
function Exit-HushgramDeviceLease { $state.releases++ }
function Install-WalkCaptureApk { $state.calls.Add('install capture'); 'capture-fixture.apk' }
function Get-WalkInstalledState {
    $state.reads++
    [pscustomobject]@{ versionName='fixture'; files=@([pscustomobject]@{ sha256=('b'*64) }) }
}
function Test-WalkInstalledState {
    if (($state.reads -eq 1 -and $state.wrongBefore) -or ($state.reads -eq 2 -and $state.wrongAfter)) { 'The installed candidate differs.' }
}
function Invoke-HushgramAdbCommand {
    param($Adb,[string[]]$Arguments,$DeviceLease)
    if ($Adb -cne 'adb-fixture' -or $DeviceLease.Serial -cne 'emulator-5554') { throw 'The producer lost its leased ADB identity.' }
    $command=$Arguments[2..($Arguments.Count-1)] -join ' '
    $state.calls.Add($command)
    $output=@()
    if ($command -ceq 'shell getprop ro.product.model') { $output=@('sdk_gphone64_x86_64') }
    elseif ($command -ceq 'shell date +%s') { $output=@([string][DateTimeOffset]::UtcNow.ToUnixTimeSeconds()) }
    elseif ($command -like 'shell am start *') {
        $output=@('Status: ok')
        if ($command -like '*OPEN_SETTINGS true') { $state.current='settings-root' }
    }
    # Categories expand in place on the overview; Back from it closes settings.
    elseif ($command -ceq 'shell input keyevent KEYCODE_BACK') { $state.current='home' }
    elseif ($command -like 'shell input tap *') {
        if ($state.current -ceq 'settings-root') {
            $state.headingTaps++
            if (-not $state.expandBroken -and -not ($state.foldBroken -and $state.expanded)) { $state.expanded=-not $state.expanded }
        }
        else {
            $index=[int]([int]$Arguments[5]/100)
            $state.current=@('home','explore','reels','inbox','profile')[$index]
        }
    }
    [pscustomobject]@{ ExitCode=0; Stdout=$output; Output=$output }
}
function New-ProducerUi {
    $children=''
    if ($state.current -like 'settings-*') {
        $modeLabel=if($state.settingsMode -ceq 'flat') { 'Show settings by category' } else { 'Show all settings as a list' }
        $children="<node package='com.instagram.android' class='android.widget.EditText' hint='Search settings' enabled='true' visible-to-user='true' bounds='[0,100][700,150]' />"+
            "<node package='com.instagram.android' class='android.widget.TextView' text='$modeLabel' enabled='true' visible-to-user='true' bounds='[0,160][700,200]' />"+
            "<node package='com.instagram.android' class='android.widget.ListView' resource-id='android:id/list' enabled='true' visible-to-user='true' bounds='[0,200][700,950]'>"+
            "<node package='com.instagram.android' class='android.widget.TextView' text='Fixture category' clickable='true' enabled='true' visible-to-user='true' bounds='[0,300][700,400]' />"+
            $(if ($state.expanded) { "<node package='com.instagram.android' class='android.widget.TextView' text='Known row' enabled='true' visible-to-user='true' bounds='[0,400][700,500]' />" })+
            '</node>'
        return [xml]"<hierarchy><node package='com.instagram.android' enabled='true' visible-to-user='true' bounds='[0,0][720,1000]'>$children</node></hierarchy>"
    }
    $tabs=@('feed_tab','search_tab','clips_tab','direct_tab','profile_tab')
    for($index=0;$index -lt $tabs.Count;$index++) {
        $left=$index*100; $right=$left+90
        $children+="<node package='com.instagram.android' class='android.widget.FrameLayout' resource-id='com.instagram.android:id/$($tabs[$index])' clickable='true' enabled='true' visible-to-user='true' bounds='[$left,900][$right,999]' />"
    }
    [xml]"<hierarchy><node package='com.instagram.android' enabled='true' visible-to-user='true' bounds='[0,0][720,1000]'>$children</node></hierarchy>"
}
function Invoke-WalkCapture {
    param($CaptureId,$RunId)
    $state.captures++
    if ($state.refuseAt -eq $state.captures) { throw 'The active window is a system ANR dialog.' }
    $ui=New-ProducerUi
    [pscustomobject]@{ CaptureId=$CaptureId; RunId=$RunId; ParsedXml=$ui; AfterParsedXml=$ui; UptimeMs=$state.captures
        StartedUtc=[DateTime]::UtcNow.ToString('o'); FinishedUtc=[DateTime]::UtcNow.ToString('o')
        UiPath='fixture.xml'; AfterUiPath='fixture-after.xml'; ImagePath='fixture.png'
        UiSha256=('d'*64); AfterUiSha256=('e'*64); ImageSha256=('f'*64) }
}
function Test-WalkDestinationContent {
    param($Destination)
    $valid=$Destination.id -ceq $state.current -or
        ($Destination.id -ceq 'settings-pause' -and $state.current -ceq 'settings-root') -or
        ($Destination.id -ceq 'settings-fixture' -and $state.current -ceq 'settings-root' -and ($state.settingsMode -ceq 'flat' -or $state.expanded))
    [pscustomobject]@{ Valid=$valid; Reason='The requested destination is not active.' }
}
function Test-WalkReceipt { [pscustomobject]@{ Valid=(-not $state.rejectProof); Reason='The complete proof was refused.' } }

try {
    [void][IO.Directory]::CreateDirectory($scratch)
    [IO.File]::WriteAllText((Join-Path $scratch 'bundle.mpp'),'fixture')
    $arguments=@{ Serial='emulator-5554'; ExpectedModel='sdk_gphone64_x86_64'; ExpectedAvd='fixture'; Package='com.instagram.android'
        Visit=@('home','explore','reels','inbox','profile'); SkipPatch=$true; SkipSettings=$false; SettleSeconds=0
        SignedApk=(Join-Path $scratch 'candidate.apk'); Report=(Join-Path $scratch 'result.json'); Record=(Join-Path $scratch 'record.json')
        Root=$scratch; OutDir=$scratch; Signing=@{ Keystore='fixture'; KeyAlias='fixture'; KeystorePassword=''; KeyPassword='' } }
    Reset-Producer
    $missing=$arguments.Clone(); $missing.Record=''
    Assert-ProducerRefused { Invoke-WalkApp @missing } '*SkipPatch needs*'
    Assert-Producer ($state.leases -eq 0 -and $state.calls.Count -eq 0) 'Missing artifact proof touched a device.'
    Reset-Producer; $state.wrongPackage=$true
    Assert-ProducerRefused { Invoke-WalkApp @arguments } '*requested package*'
    Assert-Producer ($state.leases -eq 0) 'A wrong package acquired a device.'
    Reset-Producer; $state.wrongBefore=$true
    Assert-ProducerRefused { Invoke-WalkApp @arguments } '*installed candidate differs*'
    Assert-Producer ($state.leases -eq 1 -and $state.releases -eq 1 -and
        @($state.calls | Where-Object { $_ -like '*input*' -or $_ -like '*force-stop*' -or $_ -like '*install*' }).Count -eq 0) 'A mismatched installed APK received input, or leaked its lease.'

    Reset-Producer
    $path=Invoke-WalkApp @arguments
    $receipt=Get-Content -LiteralPath $path -Raw | ConvertFrom-Json
    Assert-Producer ($receipt.result -ceq 'PASS' -and $receipt.screens -eq 5 -and $receipt.observations.id -ccontains 'profile') 'Named native coverage was lost.'
    Assert-Producer (@($receipt.observations.captureId | Select-Object -Unique).Count -eq 5) 'Capture IDs were reused.'
    Assert-Producer ($state.bindings -eq 2 -and $state.reads -eq 2 -and $state.releases -eq 1) 'The producer omitted a binding/install read or lease release.'
    Assert-Producer (@($state.calls | Where-Object { $_ -like '*input tap*' }).Count -eq 5 -and
        @($state.calls | Where-Object { $_ -like '*deep*' -or $_ -like '*settings*' -or $_ -match 'uninstall|clear|SLEEP|KEYCODE_POWER' }).Count -eq 0) 'Unexpected navigation or destructive input.'
    $firstPath=$path

    Reset-Producer; $short=$arguments.Clone(); $short.Visit=@('home')
    $path=Invoke-WalkApp @short
    $receipt=Get-Content -LiteralPath $path -Raw | ConvertFrom-Json
    Assert-Producer ($receipt.result -ceq 'PARTIAL' -and -not $receipt.full -and $receipt.requiredDestinations.Count -eq 5) 'A shortened visit earned full PASS.'
    Assert-Producer ($path -cne $firstPath -and (Test-Path -LiteralPath $firstPath)) 'A later run overwrote an earlier receipt.'

    Reset-Producer; $state.refuseAt=1
    $path=Invoke-WalkApp @arguments
    $receipt=Get-Content -LiteralPath $path -Raw | ConvertFrom-Json
    Assert-Producer ($receipt.result -ceq 'FAIL' -and $state.captures -eq 1 -and $state.releases -eq 1 -and
        @($state.calls | Where-Object { $_ -like '*input tap*' }).Count -eq 0) 'A refused active window caused repeated probes, a tap or a leaked lease.'

    Reset-Producer; $state.wrongAfter=$true
    $path=Invoke-WalkApp @arguments
    Assert-Producer ((Get-Content -LiteralPath $path -Raw | ConvertFrom-Json).result -ceq 'FAIL') 'Installation drift earned PASS.'
    Reset-Producer; $state.artifactDrift=$true
    $path=Invoke-WalkApp @arguments
    Assert-Producer ((Get-Content -LiteralPath $path -Raw | ConvertFrom-Json).result -ceq 'FAIL') 'Local artifact drift earned PASS.'
    Reset-Producer; $state.rejectProof=$true
    $path=Invoke-WalkApp @arguments
    $receipt=Get-Content -LiteralPath $path -Raw | ConvertFrom-Json
    Assert-Producer ($receipt.result -ceq 'FAIL' -and -not $receipt.full -and $receipt.problems -contains 'The complete proof was refused.') 'Final validation refusal was discarded.'

    foreach ($mode in @('pages','flat')) {
        Reset-Producer; $state.settingsMode=$mode
        $path=Invoke-WalkApp @arguments
        $receipt=Get-Content -LiteralPath $path -Raw | ConvertFrom-Json
        Assert-Producer ($receipt.result -ceq 'PASS' -and $receipt.screens -eq 8 -and
            $receipt.observations.id -ccontains 'settings-root' -and $receipt.observations.id -ccontains 'settings-pause') "Settings coverage in $mode mode was incomplete."
        # Category mode taps the heading open and closed again; Back would close settings.
        $expectedTaps=if($mode -ceq 'pages') { 7 } else { 5 }
        Assert-Producer (@($state.calls | Where-Object { $_ -like '*input tap*' }).Count -eq $expectedTaps -and
            @($state.calls | Where-Object { $_ -like '*input tap*180*' }).Count -eq 0) 'The producer changed list mode, tapped Pause or opened a flat section.'
        Assert-Producer (-not $state.expanded -and @($state.calls | Where-Object { $_ -like '*KEYCODE_BACK*' }).Count -eq 0) "Settings in $mode mode were left expanded or closed with Back."
    }
    Reset-Producer; $state.settingsMode='pages'; $state.expandBroken=$true
    $path=Invoke-WalkApp @arguments
    $receipt=Get-Content -LiteralPath $path -Raw | ConvertFrom-Json
    Assert-Producer ($receipt.result -ceq 'FAIL' -and $state.headingTaps -eq 1 -and
        @($receipt.problems | Where-Object { $_ -like '*expanded without a verified row*' }).Count -eq 1) 'A heading that showed no rows earned PASS or was tapped again.'
    # A section left open could lend its rows to the next one, so a fold that doesn't take fails the walk.
    Reset-Producer; $state.settingsMode='pages'; $state.foldBroken=$true
    $path=Invoke-WalkApp @arguments
    $receipt=Get-Content -LiteralPath $path -Raw | ConvertFrom-Json
    Assert-Producer ($receipt.result -ceq 'FAIL' -and $state.headingTaps -eq 2 -and
        @($receipt.problems | Where-Object { $_ -like '*still showed its rows after the fold tap*' }).Count -eq 1) 'A section that stayed open after its fold tap earned PASS.'

    # Coordinates come from one visible, enabled native target and all ancestor clipping.
    Reset-Producer
    $ui=New-ProducerUi
    $area=Get-WalkActionArea -Document $ui -Package 'com.instagram.android' -ResourceId 'com.instagram.android:id/feed_tab'
    Assert-Producer ($area.X -eq 45 -and $area.Y -eq 950) 'Tab coordinates were not derived from the current hierarchy.'
    $ui.SelectSingleNode('//node[@resource-id="com.instagram.android:id/feed_tab"]').SetAttribute('enabled','false')
    Assert-Producer ($null -eq (Get-WalkActionArea -Document $ui -Package 'com.instagram.android' -ResourceId 'com.instagram.android:id/feed_tab')) 'A disabled target could be tapped.'
    $ui=New-ProducerUi
    $ui.SelectSingleNode('/hierarchy/node').SetAttribute('visible-to-user','false')
    Assert-Producer ($null -eq (Get-WalkActionArea -Document $ui -Package 'com.instagram.android' -ResourceId 'com.instagram.android:id/feed_tab')) 'A hidden ancestor could be tapped.'
    $beforeUi=New-ProducerUi; $afterUi=New-ProducerUi
    $afterUi.SelectSingleNode('//node[@resource-id="com.instagram.android:id/feed_tab"]').SetAttribute('bounds','[0,850][90,949]')
    Assert-Producer ($null -eq (Get-WalkCaptureActionArea -Capture ([pscustomobject]@{ ParsedXml=$beforeUi; AfterParsedXml=$afterUi }) `
        -Package 'com.instagram.android' -ResourceId 'com.instagram.android:id/feed_tab')) 'A navigation target that moved during capture could be tapped.'
    $ui=New-ProducerUi
    $clone=$ui.SelectSingleNode('//node[@resource-id="com.instagram.android:id/feed_tab"]').CloneNode($true)
    [void]$ui.SelectSingleNode('/hierarchy/node').AppendChild($clone)
    Assert-Producer ($null -eq (Get-WalkActionArea -Document $ui -Package 'com.instagram.android' -ResourceId 'com.instagram.android:id/feed_tab')) 'An ambiguous target could be tapped.'
    $ui=New-ProducerUi
    $cover=$ui.CreateElement('node')
    foreach($pair in @(@('package','com.instagram.android'),@('class','android.widget.FrameLayout'),@('visible-to-user','true'),
        @('enabled','true'),@('bounds','[0,0][720,1000]'),@('text','Screen unavailable'))) { $cover.SetAttribute($pair[0],$pair[1]) }
    [void]$ui.DocumentElement.FirstChild.AppendChild($cover)
    Assert-Producer ($null -eq (Get-WalkActionArea -Document $ui -Package 'com.instagram.android' -ResourceId 'com.instagram.android:id/feed_tab')) 'An obscured tab could be tapped through an overlay.'
    $cover.SetAttribute('visible-to-user','false')
    Assert-Producer ($null -ne (Get-WalkActionArea -Document $ui -Package 'com.instagram.android' -ResourceId 'com.instagram.android:id/feed_tab')) 'A hidden overlay prevented safe tab navigation.'
    $cover.SetAttribute('visible-to-user','true'); $cover.SetAttribute('bounds','[0,0][45,1000]')
    $otherCover=$cover.CloneNode($true); $otherCover.SetAttribute('bounds','[45,0][720,1000]')
    [void]$ui.DocumentElement.FirstChild.AppendChild($otherCover)
    Assert-Producer ($null -eq (Get-WalkActionArea -Document $ui -Package 'com.instagram.android' -ResourceId 'com.instagram.android:id/feed_tab')) 'Two covering siblings admitted a hidden tap target.'
    $ui=New-ProducerUi
    $ui.SelectSingleNode('//node[@resource-id="com.instagram.android:id/feed_tab"]').SetAttribute('drawing-order','1')
    $cover=$ui.CreateElement('node')
    foreach($pair in @(@('package','com.instagram.android'),@('class','android.widget.Button'),@('visible-to-user','true'),
        @('enabled','true'),@('bounds','[40,850][60,1000]'),@('text','Cover'),@('drawing-order','2'))) { $cover.SetAttribute($pair[0],$pair[1]) }
    [void]$ui.DocumentElement.FirstChild.AppendChild($cover)
    Assert-Producer ($null -eq (Get-WalkActionArea -Document $ui -Package 'com.instagram.android' -ResourceId 'com.instagram.android:id/feed_tab')) 'A partly visible tab admitted a tap on its covered center.'
    $cover.SetAttribute('bounds','[40,930][60,970]'); $cover.SetAttribute('drawing-order','0')
    Assert-Producer ($null -eq (Get-WalkActionArea -Document $ui -Package 'com.instagram.android' -ResourceId 'com.instagram.android:id/feed_tab')) 'A blocker omitted by whole-control visibility was omitted from the point check.'
    $cover.SetAttribute('visible-to-user','false')
    Assert-Producer ($null -ne (Get-WalkActionArea -Document $ui -Package 'com.instagram.android' -ResourceId 'com.instagram.android:id/feed_tab')) 'A hidden center cover blocked navigation.'
    $cover.SetAttribute('visible-to-user','true'); $cover.SetAttribute('drawing-order','1')
    $ui.SelectSingleNode('//node[@resource-id="com.instagram.android:id/feed_tab"]').SetAttribute('drawing-order','2')
    Assert-Producer ($null -ne (Get-WalkActionArea -Document $ui -Package 'com.instagram.android' -ResourceId 'com.instagram.android:id/feed_tab')) 'A lower center cover blocked navigation.'
    $cover.SetAttribute('drawing-order','3'); $cover.SetAttribute('bounds','[0,930][20,970]')
    Assert-Producer ($null -ne (Get-WalkActionArea -Document $ui -Package 'com.instagram.android' -ResourceId 'com.instagram.android:id/feed_tab')) 'A side cover blocked an unobstructed center.'
    [xml]$delegated=@'
<hierarchy><node package="com.instagram.android" enabled="true" visible-to-user="true" bounds="[0,0][720,1000]">
<node package="com.instagram.android" class="android.widget.LinearLayout" enabled="true" clickable="true" visible-to-user="true" bounds="[100,200][600,500]">
<node package="com.instagram.android" class="android.widget.TextView" text="Known category" enabled="true" clickable="false" visible-to-user="true" bounds="[120,220][220,260]" />
</node></node></hierarchy>
'@
    $area=Get-WalkActionArea -Document $delegated -Package 'com.instagram.android' -Title 'Known category'
    Assert-Producer ($null -ne $area -and $area.X -eq 170 -and $area.Y -eq 240) 'A delegated title used its broad ancestor center.'
    Write-Host "[walk-producer] $checks checks passed"
} finally {
    $tempRoot=[IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\')+'\'
    $resolved=[IO.Path]::GetFullPath($scratch)
    if (-not $resolved.StartsWith($tempRoot,[StringComparison]::OrdinalIgnoreCase)) { throw 'Unsafe producer fixture cleanup.' }
    if (Test-Path -LiteralPath $resolved) { Remove-Item -LiteralPath $resolved -Recurse -Force }
}
