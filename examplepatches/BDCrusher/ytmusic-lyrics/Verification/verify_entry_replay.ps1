$ErrorActionPreference='Stop'
$app=Split-Path -Parent $PSScriptRoot
$bundle=Join-Path $app 'Personal-Patches\lyrics-collection\build\libs\lyrics-collection-0.2.5-beta.1.mpp'
$official=Join-Path $app 'Inputs\official-patches-1.48.0.mpp'
foreach($mode in @('catalog','lyrics','defaults','addon-first','official-first','editions-both','editions-reverse','addon-full-other','conflict','missing-official')){
    $options=@("-Pmode=$mode","-PverificationDir=../scratch/native-replay-final-$mode","-PbundlePath=$bundle")
    if($mode -in @('addon-first','official-first','conflict')){$options+="-PofficialPath=$official"}
    & "$app\verify-stable.ps1" @options *> "$PSScriptRoot\native-replay-final-$mode.log"
    if($LASTEXITCODE -ne 0){Get-Content -LiteralPath "$PSScriptRoot\native-replay-final-$mode.log" -Tail 25;throw "Native replay application failed: $mode"}
    Write-Output "PASS: $mode"
}
$paths=@()
foreach($mode in @('lyrics','defaults','addon-first','official-first')){
    $report=Get-Content -Raw -LiteralPath "$PSScriptRoot\scratch\native-replay-final-$mode\verification.json" | ConvertFrom-Json
    if((Get-FileHash -LiteralPath $report.outputUnsignedApk -Algorithm SHA256).Hash.ToLowerInvariant() -ne $report.outputUnsignedApkSha256){throw 'Changed output APK'}
    $paths+=$report.outputUnsignedApk
}
$manifest=Join-Path $PSScriptRoot 'native-replay-final-entry-manifest.txt'
if(Test-Path -LiteralPath $manifest){throw 'Use a fresh audit manifest'}
[System.IO.File]::WriteAllLines($manifest,$paths,[System.Text.UTF8Encoding]::new($false))
& "$app\verify-stable.ps1" 'auditModelEntry' '-x' 'verifyBundle' "-PauditManifest=$manifest" *> "$PSScriptRoot\native-replay-final-bytecode-audit.log"
if($LASTEXITCODE -ne 0){Get-Content -LiteralPath "$PSScriptRoot\native-replay-final-bytecode-audit.log" -Tail 25;throw 'Native replay bytecode audit failed'}
Write-Output 'PASS: four compiled native replay and system navigation audits'
