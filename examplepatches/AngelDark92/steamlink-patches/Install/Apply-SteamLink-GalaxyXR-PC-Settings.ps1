[CmdletBinding()]
param(
    # Five quality tiers.  Default passes only the Galaxy XR render resolution and
    # Pico 4 Pro identity to the driver and removes all toolkit encode/bandwidth
    # overrides so VRLink uses its own built-in defaults.  Stable through Ultra set
    # encodeWidth and a fixed bandwidth; streamFormatWidth is fixed at 1536 (validated
    # foveated transport maximum) for every non-Default tier.
    [ValidateSet('Default', 'Stable', 'Quality', 'High', 'Highest', 'Ultra', 'Reset')]
    [string]$Mode,

    [string]$SettingsPath,

    [switch]$NoPause
)

Set-StrictMode -Version 2.0
$ErrorActionPreference = 'Stop'
$Succeeded = $false
$TemporaryPath = $null

function Write-Step {
    param([string]$Message)
    Write-Host ''
    Write-Host ('==> ' + $Message) -ForegroundColor Cyan
}

function Find-SteamVrSettings {
    $roots = New-Object System.Collections.Generic.List[string]
    foreach ($registryPath in @('HKCU:\Software\Valve\Steam', 'HKLM:\Software\WOW6432Node\Valve\Steam')) {
        try {
            $item = Get-ItemProperty -LiteralPath $registryPath -ErrorAction Stop
            foreach ($propertyName in @('SteamPath', 'InstallPath')) {
                $property = $item.PSObject.Properties[$propertyName]
                if (($null -ne $property) -and -not [string]::IsNullOrWhiteSpace([string]$property.Value)) {
                    $roots.Add(([string]$property.Value).Trim())
                }
            }
        }
        catch {}
    }
    if (${env:ProgramFiles(x86)}) { $roots.Add((Join-Path ${env:ProgramFiles(x86)} 'Steam')) }
    if ($env:ProgramFiles) { $roots.Add((Join-Path $env:ProgramFiles 'Steam')) }

    foreach ($root in $roots | Select-Object -Unique) {
        $candidate = Join-Path $root 'config\steamvr.vrsettings'
        if (Test-Path -LiteralPath $candidate -PathType Leaf) { return $candidate }
    }
    return $null
}

function Assert-SteamVrStopped {
    $names = @('vrserver', 'vrmonitor', 'vrcompositor', 'vrdashboard', 'vrwebhelper')
    $running = @(Get-Process -ErrorAction SilentlyContinue | Where-Object { $names -contains $_.ProcessName })
    if ($running.Count -gt 0) {
        throw ('Close SteamVR before changing its active settings. Running: ' + (($running.ProcessName | Sort-Object -Unique) -join ', '))
    }
}

function Set-JsonProperty {
    param(
        [Parameter(Mandatory = $true)][object]$Object,
        [Parameter(Mandatory = $true)][string]$Name,
        [Parameter(Mandatory = $true)][AllowNull()]$Value
    )
    $property = $Object.PSObject.Properties[$Name]
    if ($null -eq $property) {
        $Object | Add-Member -MemberType NoteProperty -Name $Name -Value $Value
    }
    else {
        $property.Value = $Value
    }
}

function Select-Mode {
    Write-Host ''
    Write-Host 'Choose a Galaxy XR stream-quality profile:' -ForegroundColor White
    Write-Host ''
    Write-Host '  [1] Default   Galaxy XR resolution and Pico 4 Pro identity only.'
    Write-Host '                All encode, stream-format, and bandwidth overrides removed.'
    Write-Host '                VRLink uses its own built-in defaults. Start here if unsure'
    Write-Host '                or to rule out toolkit settings as a lag source.'
    Write-Host ''
    Write-Host '  [2] Stable    encodeWidth 2048  streamFormatWidth 1536  250 Mbit/s'
    Write-Host '                Floor tier. Cr chroma 1024 px wide. Acceptable colour quality.'
    Write-Host ''
    Write-Host '  [3] Quality   encodeWidth 2560  streamFormatWidth 1536  300 Mbit/s'
    Write-Host '                Near Virtual Desktop colour fidelity (Cr 1280 px).'
    Write-Host '                Requires stable Wi-Fi 6E or 7.'
    Write-Host ''
    Write-Host '  [4] High   encodeWidth 3072  streamFormatWidth 1536  300 Mbit/s'
    Write-Host '                Transport-frame chroma ceiling (Cr 1536 px). Conservative bandwidth.'
    Write-Host '                Use when Wi-Fi 6E throughput is limited or 350 Mbit/s causes drops.'
    Write-Host ''
    Write-Host '  [5] Highest   encodeWidth 3072  streamFormatWidth 1536  350 Mbit/s'
    Write-Host '                Transport-frame chroma ceiling (Cr 1536 px = streamFormatWidth).'
    Write-Host '                Community-recommended baseline maximum. Requires Wi-Fi 6E or 7.'
    Write-Host ''
    Write-Host '  [6] Ultra     encodeWidth 4032  streamFormatWidth 1536  350 Mbit/s'
    Write-Host '                Above-transport source resolution (Cr 2016 px).'
    Write-Host '                Feeds the encoder a wider source for foveated centre quality.'
    Write-Host '                Requires Wi-Fi 7 6 GHz. Monitor driver_vrlink.txt for NVENC'
    Write-Host '                Invalid-Level or buffer-starvation; fall back to High if seen.'
    Write-Host ''
    Write-Host '  [7] Reset     Remove all toolkit-written sections from steamvr.vrsettings.'
    Write-Host '                Removes driver_vrlink overrides, identity sections, gxr_toolkit,'
    Write-Host '                and steamvr.preferredRefreshRate. VRLink reads only its own'
    Write-Host '                default.vrsettings. Use to fully restore out-of-box behaviour.'
    Write-Host ''
    Write-Host '  [Q] Quit without changing anything'
    while ($true) {
        $answer = Read-Host 'Selection [1]'
        if ([string]::IsNullOrWhiteSpace($answer) -or ($answer -eq '1')) { return 'Default' }
        if ($answer -eq '2') { return 'Stable' }
        if ($answer -eq '3') { return 'Quality' }
        if ($answer -eq '4') { return 'High' }
        if ($answer -eq '5') { return 'Highest' }
        if ($answer -eq '6') { return 'Ultra' }
        if ($answer -eq '7') { return 'Reset' }
        if ($answer -match '^(q|quit)$') { throw 'Cancelled by the user.' }
        Write-Host 'Please enter 1, 2, 3, 4, 5, 6, 7, or Q.' -ForegroundColor Yellow
    }
}

try {
    Write-Host 'Steam Link PCVR - Galaxy XR host settings tool' -ForegroundColor White
    Write-Host 'This edits only the active SteamVR user settings and creates a timestamped backup.'
    Write-Host 'It does not modify Valve or Samsung driver binaries.'

    if ([string]::IsNullOrWhiteSpace($SettingsPath)) { $SettingsPath = Find-SteamVrSettings }
    if ([string]::IsNullOrWhiteSpace($SettingsPath)) {
        throw 'SteamVR config\steamvr.vrsettings was not found. Pass its full path with -SettingsPath.'
    }
    $SettingsPath = [IO.Path]::GetFullPath($SettingsPath)
    if (-not (Test-Path -LiteralPath $SettingsPath -PathType Leaf)) {
        throw ('SteamVR settings file was not found: ' + $SettingsPath)
    }
    if ([IO.Path]::GetFileName($SettingsPath) -ne 'steamvr.vrsettings') {
        throw ('The selected file is not named steamvr.vrsettings: ' + $SettingsPath)
    }

    Assert-SteamVrStopped
    if ([string]::IsNullOrWhiteSpace($Mode)) { $Mode = Select-Mode }

    # Render resolution: Galaxy XR native panel geometry.
    # overrideRenderWidth/Height must equal the target geometry because the installed
    # APK reports "PICO 4 Pro" to the VRLink driver, which then applies the Pico
    # model-8 geometry cap (2160x2160).  The global driver_vrlink override replaces
    # the capped value after model matching, forcing the compositor to publish
    # 3552x3840.  Proven effective in exp17 diagnostics 20260720-191249.
    $renderWidth          = 3552
    $renderHeight         = 3840
    $overrideRenderWidth  = 3552
    $overrideRenderHeight = 3840
    $spoofAtStart         = $false
    $displayFrequency     = 90

    # Default: no encode/bandwidth override — VRLink driver built-in defaults apply.
    # Stable–Ultra: only encodeWidth, streamFormatWidth (fixed 1536), and bandwidth differ.
    switch ($Mode) {
        'Default' {
            $encodeWidth       = $null
            $streamFormatWidth = $null
            $bandwidth         = $null
        }
        'Reset' {
            $encodeWidth       = $null
            $streamFormatWidth = $null
            $bandwidth         = $null
        }
        'Stable' {
            $encodeWidth       = 2048
            $streamFormatWidth = 1536
            $bandwidth         = 250
        }
        'Quality' {
            $encodeWidth       = 2560
            $streamFormatWidth = 1536
            $bandwidth         = 300
        }
        'High' {
            $encodeWidth       = 3072
            $streamFormatWidth = 1536
            $bandwidth         = 300
        }
        'Highest' {
            $encodeWidth       = 3072
            $streamFormatWidth = 1536
            $bandwidth         = 350
        }
        'Ultra' {
            # Cr chroma 2016 px — above the transport frame width.
            # NVENC stability at this width is unproven; fall back to High if
            # driver_vrlink.txt shows Invalid Level or buffer starvation.
            $encodeWidth       = 4032
            $streamFormatWidth = 1536
            $bandwidth         = 350
        }
        default { throw ('Unsupported mode: ' + $Mode) }
    }

    Write-Step 'Reading and validating the active SteamVR settings'
    $originalText = [IO.File]::ReadAllText($SettingsPath)
    try { $settings = $originalText | ConvertFrom-Json }
    catch { throw ('SteamVR settings are not valid JSON, so they were not changed. ' + $_.Exception.Message) }
    if ($null -eq $settings) { throw 'SteamVR settings parsed to an empty value.' }

    if ($Mode -ne 'Reset') {

    $steamVrProperty = $settings.PSObject.Properties['steamvr']
    if ($null -eq $steamVrProperty) {
        $steamVrSettings = New-Object PSCustomObject
        $settings | Add-Member -MemberType NoteProperty -Name 'steamvr' -Value $steamVrSettings
    }
    else {
        $steamVrSettings = $steamVrProperty.Value
        if ($null -eq $steamVrSettings) {
            $steamVrSettings = New-Object PSCustomObject
            $settings.PSObject.Properties['steamvr'].Value = $steamVrSettings
        }
    }
    # Current VRLink captures consume this SteamVR key for the requested HMD rate.
    # driver_vrlink.displayFrequency is retained below for compatibility/diagnostics.
    Set-JsonProperty $steamVrSettings 'preferredRefreshRate' $displayFrequency

    $driverProperty = $settings.PSObject.Properties['driver_vrlink']
    if ($null -eq $driverProperty) {
        $driverSettings = New-Object PSCustomObject
        $settings | Add-Member -MemberType NoteProperty -Name 'driver_vrlink' -Value $driverSettings
    }
    else {
        $driverSettings = $driverProperty.Value
        if ($null -eq $driverSettings) {
            $driverSettings = New-Object PSCustomObject
            $settings.PSObject.Properties['driver_vrlink'].Value = $driverSettings
        }
    }

    # Always set: render resolution and basic display identity (all modes).
    Set-JsonProperty $driverSettings 'renderWidth'               $renderWidth
    Set-JsonProperty $driverSettings 'renderHeight'              $renderHeight
    Set-JsonProperty $driverSettings 'overrideRenderWidth'       $overrideRenderWidth
    Set-JsonProperty $driverSettings 'overrideRenderHeight'      $overrideRenderHeight
    Set-JsonProperty $driverSettings 'spoofAtStart'              $spoofAtStart
    Set-JsonProperty $driverSettings 'displayFrequency'          $displayFrequency
    # asyncSend: VRLink default is false (synchronous network send).  Setting true lets
    # the render loop advance without blocking on packet delivery, reducing pipeline depth
    # between pose sampling and frame presentation.  Diagnostics (2026-07-22) show
    # repeated THROTTLE EVENT and Bad link delay spikes while sync send stalls the
    # render loop under high bandwidth; async send decouples those paths.
    Set-JsonProperty $driverSettings 'asyncSend'                 $true

    # Remove settings previously set by the toolkit so VRLink built-in defaults apply.
    # NOTE: force10bit=true was required for pico4pro-hmd 10-bit mode in earlier runs
    # (confirmed 2026-07-21). Removing it reverts to the driver default (10bit=true from
    # default.vrsettings, but without the forced override). If 10-bit drops to 8-bit,
    # restore force10bit=true in Stable or higher mode.
    foreach ($fieldName in @('enableHandTracking', 'shareEyeTrackingData',
            'showAdvancedGraphs', 'debugRegionColoring', 'enableHmdAutoConnect',
            'enableTimedRetry', 'wirelessShutdownTimeout',
            '10bit', 'force10bit', 'reqEncMode')) {
        $driverSettings.PSObject.Properties.Remove($fieldName)
    }

    if ($Mode -eq 'Default') {
        # Default: also remove encode and bandwidth overrides.
        foreach ($fieldName in @('encodeWidth', 'streamFormatWidth',
                'automaticStreamFormatWidth', 'automaticBandwidth',
                'recommendedBandwidthMbit', 'targetBandwidth')) {
            $driverSettings.PSObject.Properties.Remove($fieldName)
        }
    }
    else {
        # Stable–Ultra: set only encode width, transport width (fixed 1536), and bandwidth.
        Set-JsonProperty $driverSettings 'encodeWidth'               $encodeWidth
        Set-JsonProperty $driverSettings 'streamFormatWidth'         $streamFormatWidth
        Set-JsonProperty $driverSettings 'automaticStreamFormatWidth' $false
        Set-JsonProperty $driverSettings 'automaticBandwidth'        $false
        Set-JsonProperty $driverSettings 'recommendedBandwidthMbit'  $bandwidth
        Set-JsonProperty $driverSettings 'targetBandwidth'           $bandwidth
    }

    $toolSectionName = 'gxr_toolkit'
    $toolSectionProperty = $settings.PSObject.Properties[$toolSectionName]
    if ($null -eq $toolSectionProperty) {
        $toolSettings = New-Object PSCustomObject
        $settings | Add-Member -MemberType NoteProperty -Name $toolSectionName -Value $toolSettings
    }
    else {
        $toolSettings = $toolSectionProperty.Value
        if ($null -eq $toolSettings) {
            $toolSettings = New-Object PSCustomObject
            $settings.PSObject.Properties[$toolSectionName].Value = $toolSettings
        }
    }
    Set-JsonProperty $toolSettings 'hostProfile'          $Mode
    Set-JsonProperty $toolSettings 'appliedAt'            ([DateTimeOffset]::Now.ToString('o'))
    Set-JsonProperty $toolSettings 'renderWidth'          $renderWidth
    Set-JsonProperty $toolSettings 'renderHeight'         $renderHeight
    Set-JsonProperty $toolSettings 'overrideRenderWidth'  $overrideRenderWidth
    Set-JsonProperty $toolSettings 'overrideRenderHeight' $overrideRenderHeight
    Set-JsonProperty $toolSettings 'spoofAtStart'         $spoofAtStart
    Set-JsonProperty $toolSettings 'displayFrequency'     $displayFrequency
    Set-JsonProperty $toolSettings 'asyncSend'            $true
    if ($Mode -ne 'Default') {
        Set-JsonProperty $toolSettings 'encodeWidth'      $encodeWidth
        Set-JsonProperty $toolSettings 'streamFormatWidth' $streamFormatWidth
        Set-JsonProperty $toolSettings 'targetBandwidth'  $bandwidth
    }
    else {
        $toolSettings.PSObject.Properties.Remove('encodeWidth')
        $toolSettings.PSObject.Properties.Remove('streamFormatWidth')
        $toolSettings.PSObject.Properties.Remove('targetBandwidth')
    }
    $toolSettings.PSObject.Properties.Remove('request10bit')
    $toolSettings.PSObject.Properties.Remove('debugRegionColoring')

    } # end if ($Mode -ne 'Reset')
    else {
        # Remove all toolkit-written sections so VRLink uses only its own default.vrsettings.
        foreach ($sectionName in @('driver_vrlink', 'gxr_toolkit',
                'vrlink_Galaxy XR', 'vrlink_PICO 4 Pro',
                'vrlink_Galaxy XR_controller_left', 'vrlink_Galaxy XR_controller_right')) {
            $settings.PSObject.Properties.Remove($sectionName)
        }
        $resetSteamVrProp = $settings.PSObject.Properties['steamvr']
        if (($null -ne $resetSteamVrProp) -and ($null -ne $resetSteamVrProp.Value)) {
            $resetSteamVrProp.Value.PSObject.Properties.Remove('preferredRefreshRate')
        }
    }

    $newText = $settings | ConvertTo-Json -Depth 100
    $null = $newText | ConvertFrom-Json
    $stamp = Get-Date -Format 'yyyyMMdd-HHmmss-fff'
    $backupPath = $SettingsPath + '.gxr-backup-' + $stamp
    $TemporaryPath = Join-Path ([IO.Path]::GetDirectoryName($SettingsPath)) ('.steamvr-gxr-' + [Guid]::NewGuid().ToString('N') + '.tmp')
    Copy-Item -LiteralPath $SettingsPath -Destination $backupPath -ErrorAction Stop
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [IO.File]::WriteAllText($TemporaryPath, ($newText + [Environment]::NewLine), $utf8NoBom)
    $null = ([IO.File]::ReadAllText($TemporaryPath) | ConvertFrom-Json)
    Move-Item -LiteralPath $TemporaryPath -Destination $SettingsPath -Force
    $TemporaryPath = $null

    if ($Mode -ne 'Reset') {
        Write-Step 'Applied Galaxy XR host settings'
        Write-Host ('Profile : ' + $Mode) -ForegroundColor Green
        Write-Host ('  renderWidth x renderHeight  = ' + $renderWidth + ' x ' + $renderHeight + '  (global override; bypasses Pico model-8 cap)')
        Write-Host ('  displayFrequency            = ' + $displayFrequency + ' Hz')
        Write-Host '  asyncSend                   = true  (async network send; decouples pose pipeline from packet delivery)'
        if ($Mode -ne 'Default') {
            Write-Host ('  encodeWidth                 = ' + $encodeWidth + '  (centre-region source resolution)')
            Write-Host ('  streamFormatWidth           = ' + $streamFormatWidth + '  (foveated transport frame; fixed)')
            Write-Host ('  YUV Cr chroma plane width   = ' + [int]($encodeWidth / 2) + ' px  (encodeWidth / 2)')
            Write-Host ('  targetBandwidth             = ' + $bandwidth + ' Mbit/s')
        }
        else {
            Write-Host '  encode / bandwidth          = VRLink built-in defaults (no override)'
        }
        if ($Mode -eq 'Ultra') {
            Write-Host ''
            Write-Warning 'Ultra (encodeWidth 4032) is unproven for NVENC stability on this rig. If driver_vrlink.txt shows Invalid Level, NVENC reset, or sustained buffer starvation, switch to High.'
        }
    }
    else {
        Write-Step 'Cleared all Galaxy XR toolkit sections from SteamVR settings'
        Write-Host ('Profile : ' + $Mode) -ForegroundColor Green
        Write-Host '  Removed: driver_vrlink, gxr_toolkit, vrlink_Galaxy XR, vrlink_PICO 4 Pro,'
        Write-Host '           vrlink_Galaxy XR_controller_left/right'
        Write-Host '  Removed: steamvr.preferredRefreshRate'
        Write-Host '  VRLink reads only its own default.vrsettings on next launch.'
    }
    Write-Host ('Backup  : ' + $backupPath)
    $Succeeded = $true
}
catch {
    Write-Host ''
    Write-Host ('ERROR: ' + $_.Exception.Message) -ForegroundColor Red
}
finally {
    if (($null -ne $TemporaryPath) -and (Test-Path -LiteralPath $TemporaryPath)) {
        Remove-Item -LiteralPath $TemporaryPath -Force -ErrorAction SilentlyContinue
    }
}

if (-not $NoPause) { $null = Read-Host 'Press Enter to close' }
if ($Succeeded) { exit 0 }
exit 1
