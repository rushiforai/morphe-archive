<#
.SYNOPSIS
Preview or repair the Samsung Galaxy XR RNDIS child using Windows' built-in driver.
.DESCRIPTION
Preview is read-only and the default. Apply requires Administrator, saves current
driver information, and binds only the selected Samsung RNDIS child to Microsoft's
netrndis.inf / usbrndis6.ndi. Installation can briefly reconnect that child; this
script never reboots Windows or changes the composite or ADB device.
.EXAMPLE
.\Repair-GalaxyXrRndisDriver.ps1
.EXAMPLE
.\Repair-GalaxyXrRndisDriver.ps1 -Mode Apply
.LINK
https://learn.microsoft.com/en-us/windows/win32/api/setupapi/nf-setupapi-setupdiopendeviceinfow
.LINK
https://learn.microsoft.com/en-us/windows/win32/api/newdev/nf-newdev-diinstalldevice
#>
[CmdletBinding()]
param(
    [ValidateSet('Preview', 'Apply')][string]$Mode = 'Preview',
    [string]$InstanceId
)
Set-StrictMode -Version 2.0
$ErrorActionPreference = 'Stop'
if (![Environment]::Is64BitProcess) { throw 'Run this script in 64-bit Windows PowerShell.' }
$pattern = '^USB\\VID_04E8&PID_6864&RNDIS\\[^\\]+$'
if ($InstanceId -and $InstanceId -notmatch $pattern) { throw 'InstanceId must identify the Samsung RNDIS child, not ADB or the composite device.' }
$devices = @(Get-PnpDevice -PresentOnly | Where-Object { $_.InstanceId -match $pattern })
if ($InstanceId) { $devices = @($devices | Where-Object { $_.InstanceId -ieq $InstanceId }) }
if ($devices.Count -ne 1) { throw 'Exactly 1 present Samsung RNDIS child is required. Use -InstanceId only to select an exact ID shown by Get-PnpDevice.' }
$target = $devices[0]
$InstanceId = $target.InstanceId
function Read-Property([string]$Name) {
    (Get-PnpDeviceProperty -InstanceId $InstanceId -KeyName $Name -ErrorAction Stop).Data
}
$hardwareIds = @(Read-Property 'DEVPKEY_Device_HardwareIds')
if ($hardwareIds -inotcontains 'USB\SAMSUNG_MOBILE&RNdis') { throw 'The child lacks the exact Samsung RNDIS hardware ID. No changes made.' }
if ($Mode -eq 'Apply') {
    $principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    if (!$principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        throw 'Apply needs an Administrator PowerShell. Preview works without elevation.'
    }
}
$current = [ordered]@{
    InstanceId = $InstanceId
    Name = $target.FriendlyName
    Class = $target.Class
    Status = $target.Status
    HardwareIds = $hardwareIds
    ClassGuid = Read-Property 'DEVPKEY_Device_ClassGuid'
    DriverInfPath = Read-Property 'DEVPKEY_Device_DriverInfPath'
    DriverProvider = Read-Property 'DEVPKEY_Device_DriverProvider'
    DriverVersion = Read-Property 'DEVPKEY_Device_DriverVersion'
    DriverSection = Read-Property 'DEVPKEY_Device_DriverInfSection'
    Service = Read-Property 'DEVPKEY_Device_Service'
}
if (-not ('GalaxyXrRndisDriver' -as [type])) { Add-Type -Path (Join-Path $PSScriptRoot 'GalaxyXrRndisDriver.cs') }
$candidate = New-Object GalaxyXrRndisDriver($InstanceId)
try {
    $plan = [pscustomobject][ordered]@{
        Mode = $Mode; InstanceId = $InstanceId
        CurrentName = $current.Name; CurrentClass = $current.Class; CurrentInf = $current.DriverInfPath
        Candidate = $candidate.Description; Provider = $candidate.Provider
        Inf = $candidate.InfPath; Section = $candidate.Section
        ModelId = $candidate.DriverHardwareId; Version = $candidate.DriverVersion
    }
    $plan | Format-List | Out-Host
    if ($Mode -eq 'Preview') {
        Write-Host 'Preview verified the exact built-in candidate. No driver was selected or installed.'
        return
    }
    if ($current.DriverInfPath -ieq 'netrndis.inf' -and $current.Service -ieq 'usbrndis6' -and $current.Class -ieq 'Net') {
        Write-Host 'The Microsoft RNDIS6 driver is already bound. No changes made.'
        return
    }
    $backupRoot = Join-Path (Split-Path $PSScriptRoot -Parent) 'build\usb-streaming'
    $null = New-Item -ItemType Directory -Path $backupRoot -Force
    $stamp = Get-Date -Format 'yyyyMMdd-HHmmss-fff'
    $backupPath = Join-Path $backupRoot ("rndis-driver-before-{0}-{1}.json" -f $stamp, [guid]::NewGuid().ToString('N').Substring(0, 8))
    [pscustomobject]@{
        CapturedAt = (Get-Date).ToString('o'); Original = $current; Proposed = $plan
        Rollback = 'Use Device Manager on this exact RNDIS child: Driver > Roll Back Driver if available; otherwise select the recorded original driver. This JSON is an information backup, not an automatic restore script.'
    } | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $backupPath -Encoding UTF8
    Write-Host "Original driver information saved: $backupPath"
    try { $candidate.Apply() }
    catch { throw "Driver installation failed or is incomplete: $($_.Exception.Message). Inspect the exact child in Device Manager; original information is in $backupPath." }
    $after = Get-PnpDevice -InstanceId $InstanceId -ErrorAction Stop
    $afterInf = Read-Property 'DEVPKEY_Device_DriverInfPath'
    $afterService = Read-Property 'DEVPKEY_Device_Service'
    [pscustomobject]@{ InstanceId = $InstanceId; Name = $after.FriendlyName; Class = $after.Class; Status = $after.Status; Inf = $afterInf; Service = $afterService; RebootRequired = $candidate.RebootRequired } | Format-List | Out-Host
    if ($after.Class -ine 'Net' -or $afterInf -ine 'netrndis.inf' -or $afterService -ine 'usbrndis6') {
        throw "Installation returned but the expected Net/netrndis.inf/usbrndis6 binding is not confirmed. Inspect Device Manager. Backup: $backupPath"
    }
    if ($candidate.RebootRequired) { Write-Warning 'Windows requests a reboot. This script has not rebooted the PC.' }
    else { Write-Host 'RNDIS6 binding verified. Next check the USB network adapter and IP connectivity.' }
}
finally { $candidate.Dispose() }
