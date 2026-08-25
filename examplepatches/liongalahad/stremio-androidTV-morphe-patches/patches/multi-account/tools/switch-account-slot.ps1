[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet('account_a', 'account_b')]
    [string]$Slot,

    [string]$Serial = 'emulator-5554'
)

$ErrorActionPreference = 'Stop'

$adb = Join-Path $env:LOCALAPPDATA 'Android\Sdk\platform-tools\adb.exe'
if (-not (Test-Path -LiteralPath $adb)) {
    throw "adb was not found at $adb"
}

throw "Direct account mutation is disabled because it bypasses process, cache, job, and TV-channel isolation. Open Stremio's Accounts chooser and select $Slot there."
