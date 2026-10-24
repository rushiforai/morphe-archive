param(
    [Parameter(Mandatory=$true)][string]$Apk,
    [Parameter(Mandatory=$true)][string]$Package,
    [Parameter(Mandatory=$true)][string]$Serial
)
$ErrorActionPreference='Stop'
$adb='C:/Users/narum/AppData/Local/Android/Sdk/platform-tools/adb.exe'
$tools='C:/Users/narum/AppData/Local/Android/Sdk/build-tools/36.0.0'
function Read-Certificate([string]$File){
    $out=& "$tools/apksigner.bat" verify --print-certs $File
    if($LASTEXITCODE -ne 0){throw "Invalid APK signature: $File"}
    $line=$out | Where-Object {$_ -match '^Signer #1 certificate SHA-256 digest: ([a-f0-9]+)$'} | Select-Object -First 1
    if(!$line -or $line -notmatch 'digest: ([a-f0-9]+)$'){throw 'Certificate digest missing'}
    return $Matches[1]
}
$identity=(& "$tools/aapt2.exe" dump badging $Apk | Select-Object -First 1)
if($identity -notmatch "package: name='([^']+)'" -or $Matches[1] -ne $Package){throw "Unexpected package: $identity"}
$certificate=Read-Certificate $Apk
$existing=(& $adb -s $Serial shell pm path $Package | Where-Object {$_ -like 'package:*'} | Select-Object -First 1)
if($existing){
    $tmp=Join-Path ([IO.Path]::GetTempPath()) ('haiagaru-signature-'+[guid]::NewGuid().ToString('N')+'.apk')
    & $adb -s $Serial pull $existing.Substring(8).Trim() $tmp
    if($LASTEXITCODE -ne 0){throw 'Cannot read installed APK; refusing update'}
    if((Read-Certificate $tmp) -ne $certificate){throw 'Installed certificate differs; existing application left unchanged'}
    Write-Output "Installed and new certificates match: $certificate"
}else{Write-Output "New verification package: $Package ; certificate $certificate"}
& $adb -s $Serial install -r $Apk
if($LASTEXITCODE -ne 0){throw 'Installation failed; do not uninstall or clear data'}
Get-FileHash -LiteralPath $Apk -Algorithm SHA256
