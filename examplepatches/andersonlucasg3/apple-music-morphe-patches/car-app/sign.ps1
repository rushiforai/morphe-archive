# Signs the unsigned :car-app APK with the Morphe certificate. The engine and this app
# share android:sharedUserId="com.apple.android", so the signature must match.
#
#   .\car-app\sign.ps1
#   .\car-app\sign.ps1 -Variant release
param(
    [ValidateSet("debug", "release")][string]$Variant = "debug"
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
$task = if ($Variant -eq "debug") { "assembleDebug" } else { "assembleRelease" }
$apk = Join-Path $PSScriptRoot "build\outputs\apk\$Variant\car-app-$Variant-unsigned.apk"
if (-not (Test-Path $apk)) {
    throw "APK nao encontrado: $apk (rode :car-app:$task)"
}

$bt = Join-Path $env:LOCALAPPDATA "Android\Sdk\build-tools\36.0.0"
$aligned = Join-Path $root ".pipeline\car-app-aligned.apk"
$signed = Join-Path $root ".pipeline\car-app-$Variant.apk"

& "$bt\zipalign.exe" -p -f 4 $apk $aligned
if ($LASTEXITCODE -ne 0) { throw "zipalign falhou" }

& "$bt\apksigner.bat" sign `
    --ks (Join-Path $root "tools\tv-app-signing.p12") `
    --ks-key-alias Morphe --ks-pass pass:Morphe --key-pass pass:Morphe `
    --out $signed $aligned
if ($LASTEXITCODE -ne 0) { throw "apksigner falhou" }

& "$bt\apksigner.bat" verify --print-certs $signed
Write-Host "APK assinado: $signed"
