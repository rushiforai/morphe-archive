param(
    [string]$Avd = 'Morphe_Coffee_Update_API35',
    [int]$Port = 5562,
    [string]$Sdk = "$env:LOCALAPPDATA\Android\Sdk",
    [switch]$VerifyOnly
)
$ErrorActionPreference = 'Stop'
$adb = Join-Path $Sdk 'platform-tools\adb.exe'
$serial = "emulator-$Port"
$avdHome = if ($env:ANDROID_AVD_HOME) { $env:ANDROID_AVD_HOME } else { Join-Path $env:USERPROFILE '.android\avd' }
$registration = Join-Path $avdHome "$Avd.ini"
$avdPath = @(Get-Content -LiteralPath $registration | Where-Object { $_ -match '^path=' })
if ($avdPath.Count -ne 1) { throw 'Expected one absolute path in the named AVD registration' }
$config = Join-Path $avdPath[0].Substring(5) 'config.ini'
$processes = @(Get-CimInstance Win32_Process -Filter "name='emulator.exe'" |
    Where-Object { $_.CommandLine -match "-avd\s+$([regex]::Escape($Avd))(\s|$)" })
if (!$processes.Count) {
    if ($VerifyOnly) { throw 'Named muted emulator is not running' }
    $lines = @(Get-Content -LiteralPath $config | Where-Object { $_ -notmatch '^hw.audio(Input|Output)=' })
    $lines += 'hw.audioInput=no', 'hw.audioOutput=no'
    Set-Content -LiteralPath $config -Value $lines
    Start-Process (Join-Path $Sdk 'emulator\emulator.exe') -WindowStyle Hidden -ArgumentList @(
        '-avd', $Avd, '-port', $Port, '-no-audio', '-no-window', '-no-snapshot', '-memory', '4096')
} elseif (@($processes | Where-Object { $_.CommandLine -notmatch '(^|\s)-no-audio(\s|$)' }).Count) {
    throw 'Existing emulator lacks -no-audio; stop it before testing'
}
$settings = Get-Content -LiteralPath $config
foreach ($key in 'hw.audioInput=no', 'hw.audioOutput=no') {
    if ($key -notin $settings) { throw "Audio configuration missing: $key" }
}
$deadline = (Get-Date).AddMinutes(3)
do {
    $boot = & $adb -s $serial shell getprop sys.boot_completed 2>$null
    if ($boot -eq '1') { break }
    if ((Get-Date) -gt $deadline) { throw 'Android boot timed out' }
    Start-Sleep -Seconds 2
} while ($true)
$actualAvd = & $adb -s $serial emu avd name
if ($Avd -notin $actualAvd) { throw 'ADB serial belongs to another AVD' }
$volume = & $adb -s $serial shell cmd media_session volume --stream 3 --set 0 --get
if (($volume -join "`n") -notmatch 'volume is 0 in range') {
    # These are explicitly named disposable, debuggable AVDs; root permits audio control.
    & $adb -s $serial root | Out-Null
    & $adb -s $serial wait-for-device
    $volume = & $adb -s $serial shell cmd media_session volume --stream 3 --set 0 --get
}
if ($LASTEXITCODE -ne 0 -or ($volume -join "`n") -notmatch 'volume is 0 in range') {
    throw "Could not verify media volume zero: $($volume -join ' ')"
}
[pscustomobject]@{serial=$serial; avd=$Avd; hostAudio='disabled'; mediaVolume=0} | ConvertTo-Json
