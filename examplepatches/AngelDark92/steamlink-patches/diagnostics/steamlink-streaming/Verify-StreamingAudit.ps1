param([string]$Python = 'python')

$ErrorActionPreference = 'Stop'
$root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent
$script = Join-Path $PSScriptRoot 'audit_streaming_controls.py'
$bases = @(
    @('2.0.20', '5001712', '80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495'),
    @('2.0.22', '5002244', '4b2fa5e1b5d9d5c938873f692b0e5e18159e1199dee1253dd6eccc8fa43dfa12'),
    @('2.0.22', '5002296', '879694c57f0ca7e74017c174c24da619b1d1e909f4491edd9b2423513f0f87a6'),
    @('2.0.22', '5002313', 'e4d3575a130dc013e4c8fe4fb965217028229f89b13ba821c01b492e457398bb'),
    @('2.0.22', '5002318', '3c8d1ce13fd61edff5ce65efe6eedcc8565c89b66bab371550986a5c75407e56'),
    @('2.0.22', '5002322', 'e61baf34dfc4749d92561bab5fee47891d271607a0ce44824ff61c3e6a450c3f'),
    @('2.0.23', '5002363', '628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0')
)
foreach ($base in $bases) {
    $directory = Join-Path $root "decoded-apk-android-steamlinkvr-release-base-$($base[0])-$($base[1])"
    $library = Join-Path $directory 'lib/arm64-v8a/libvrlink_scene.so'
    $audit = & $Python -B $script $library --function '^_ZN12QSVLCodecNDK4InitEv$' --strings '^video/' | ConvertFrom-Json
    if ($LASTEXITCODE -ne 0 -or $audit.sha256 -ne $base[2] -or @($audit.functions).Count -ne 1) {
        throw "Unexpected native input or missing decoder initialization: $($base[1])"
    }
    $init = $audit.functions[0]
    $references = @($init.instructions | Where-Object { $_ -match "address .*'video/hevc'" })
    $creationCalls = @($init.instructions | Where-Object { $_ -match 'AMediaCodec_createDecoderByType@plt' })
    if (-not $init.complete -or $references.Count -ne 2 -or $creationCalls.Count -ne 1) {
        throw "HEVC initialization evidence changed: $($base[1])"
    }
    if ((Get-FileHash $library -Algorithm SHA256).Hash -ne $base[2]) {
        throw "Input changed during audit: $($base[1])"
    }
    Write-Output "$($base[0])/$($base[1]): hash, complete Init, 2 HEVC references, decoder creation PASS"
}
$legacy = Join-Path $root 'decoded-apk-android-steamlinkvr-release-base-2.0.20-5001712/lib/arm64-v8a'
$scene = Join-Path $legacy 'libvrlink_scene.so'
$audit = & $Python -B $script $scene --function '^_ZN7SVLRoot8SetValue.*Ed$' --strings '^$' --callers | ConvertFrom-Json
if ($LASTEXITCODE -ne 0 -or @($audit.functions).Count -ne 1 -or
    @($audit.caller_scan).Count -ne 2 -or @($audit.caller_scan | Where-Object { -not $_.complete }).Count -ne 0 -or
    @($audit.direct_callers | Where-Object va -eq '0xf4da8').Count -ne 1) {
    throw 'Exact-name numeric-setting caller or section coverage regression'
}
$shell = Join-Path $legacy 'libshell_arm64-v8a.so'
$audit = & $Python -B $script $shell --function '^_ZN17CShellApplication11StartVRLinkEPKc$' --strings '^$' --callers | ConvertFrom-Json
if ($LASTEXITCODE -ne 0 -or @($audit.functions).Count -ne 1 -or
    @($audit.direct_callers | Where-Object va -eq '0x1201498').Count -ne 1) {
    throw 'Exact-name VR launcher PLT caller regression'
}
Write-Output '5001712: numeric-setting coverage and exact-name PLT caller PASS'
Write-Output 'Static evidence only. 5001740 unavailable; no codec selection or bitrate override validated.'