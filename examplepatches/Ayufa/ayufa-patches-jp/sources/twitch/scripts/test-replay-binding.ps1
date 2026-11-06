[CmdletBinding()]
param([Parameter(Mandatory)][string] $Apk, [string] $Serial)
. "$PSScriptRoot/common.ps1"
$apkPath = (Resolve-Path -LiteralPath $Apk).Path
$device = Resolve-Device $Serial
$adb = Get-AdbPath
$sdk = Get-AndroidSdk
$androidJar = Join-Path $sdk 'platforms/android-36/android.jar'
$run = New-RunDirectory 'replay-binding-probe'
$classes = Join-Path $run 'classes'
New-Item -ItemType Directory -Path $classes | Out-Null
$row = (& java '-cp' (Get-MorphePath) "$PSScriptRoot/verification/ReplayBindingClass.java" $apkPath | Out-String).Trim()
if ($LASTEXITCODE -or $row -notmatch '^[A-Za-z0-9_.$]+$') { throw 'Replay row resolution failed.' }
& javac '-classpath' $androidJar '-d' $classes "$PSScriptRoot/verification/ReplayBindingProbe.java"
if ($LASTEXITCODE) { throw 'Replay probe compilation failed.' }
$probe = Join-Path $run 'probe.zip'
& java '-cp' (Join-Path $sdk 'build-tools/36.0.0/lib/d8.jar') 'com.android.tools.r8.D8' '--min-api' '29' '--lib' $androidJar '--output' $probe (Join-Path $classes 'ReplayBindingProbe.class')
if ($LASTEXITCODE) { throw 'Replay probe DEX compilation failed.' }
$remote = '/data/local/tmp/twitch-replay-probe-' + [guid]::NewGuid().ToString('N')
try {
    & $adb '-s' $device push $probe "$remote.zip"
    if ($LASTEXITCODE) { throw 'Replay probe transfer failed.' }
    & $adb '-s' $device push $apkPath "$remote.apk"
    if ($LASTEXITCODE) { throw 'Replay APK transfer failed.' }
    & $adb '-s' $device shell "CLASSPATH=$remote.zip`:$remote.apk app_process -Xmx256m /system/bin ReplayBindingProbe $row" 2>&1 |
        Tee-Object -FilePath (Join-Path $run 'result.log')
    if ($LASTEXITCODE) { throw "Android replay verification failed. See $run." }
} finally {
    & $adb '-s' $device shell rm '-f' "$remote.zip" "$remote.apk" | Out-Null
}
Write-Host "Replay verification artifacts: $run"
