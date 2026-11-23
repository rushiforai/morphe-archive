param([string]$Version='1.2.0')
$ErrorActionPreference='Stop'
$project=Split-Path -Parent $PSScriptRoot
Set-Location -LiteralPath $project
$java='C:\Program Files\Java\jdk-23.0.1\bin\java.exe'
$sdk='C:\Users\hp\AppData\Local\Android\Sdk'
$bundle="builds\MyZong-$Version.mpp"
$unsigned="work\v$Version-unsigned.apk"
$aligned="work\v$Version-aligned.apk"
$final="builds\MyZong-5.19.19.112-v$Version.apk"
function CheckExit { if($LASTEXITCODE -ne 0){throw "Command failed: $LASTEXITCODE"} }
Copy-Item "patches\patches\build\libs\patches-$Version.mpp" $bundle
& $java -jar tools\morphe-desktop-2.0.0-all.jar patch -p $bundle --bytecode-mode FULL --unsigned --validate -o $unsigned -t "work\morphe-v$Version-run" inputs\MyZong-5.19.19.112-adpatched.apk
CheckExit
& "$sdk\build-tools\36.0.0\zipalign.exe" -P 16 -f 4 $unsigned $aligned
CheckExit
try {
    $env:ZONG_PATCH_KEYPASS=(Get-Content -LiteralPath private\home-clean-key-password.txt -Raw).Trim()
    & $java -jar "$sdk\build-tools\36.0.0\lib\apksigner.jar" sign --ks private\home-clean-signing.p12 --ks-key-alias home-clean --ks-pass env:ZONG_PATCH_KEYPASS --key-pass env:ZONG_PATCH_KEYPASS --out $final $aligned
    CheckExit
} finally { Remove-Item Env:\ZONG_PATCH_KEYPASS -ErrorAction SilentlyContinue }
& $java -jar "$sdk\build-tools\36.0.0\lib\apksigner.jar" verify --verbose --print-certs $final
CheckExit
& "$sdk\build-tools\36.0.0\zipalign.exe" -c -P 16 4 $final
CheckExit
Get-FileHash -LiteralPath $final -Algorithm SHA256
