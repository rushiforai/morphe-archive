[CmdletBinding()]
param(
    [string]$Serial = 'emulator-5554'
)

$ErrorActionPreference = 'Stop'

$adb = Join-Path $env:LOCALAPPDATA 'Android\Sdk\platform-tools\adb.exe'
if (-not (Test-Path -LiteralPath $adb)) {
    throw "adb was not found at $adb"
}

$result = (& $adb -s $Serial shell am broadcast `
    -a 'com.stremio.morphe.GET_ACCOUNT_SLOT' `
    -n 'com.stremio.morphe/com.stremio.morphe.AccountSlotReceiver') -join "`n"

if ($LASTEXITCODE -ne 0) {
    throw "Unable to query the account slot:`n$result"
}

$match = [regex]::Match($result, 'data="(?<slot>account_[ab])"')
if (-not $match.Success) {
    throw "The installed APK did not return a Morphe account slot:`n$result"
}

Write-Output $match.Groups['slot'].Value
