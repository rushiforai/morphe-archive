param([switch]$NegativesOnly)
$ErrorActionPreference='Stop'
$app=Split-Path -Parent $PSScriptRoot
$bundle="$app\Personal-Patches\lyrics-collection\build\libs\lyrics-collection-0.2.4-beta.1.mpp"
$official="$app\Inputs\official-patches-1.48.0.mpp"
$modes=if($NegativesOnly){@('editions-both','editions-reverse','addon-full-other','conflict','missing-official')}else{@('catalog','lyrics','defaults','addon-first','official-first')}
foreach($mode in $modes){
    $options=@("-Pmode=$mode","-PverificationDir=../scratch/categories-release-$mode","-PbundlePath=$bundle")
    if($mode -in @('addon-first','official-first','conflict')){$options+="-PofficialPath=$official"}
    & "$app\verify-stable.ps1" @options *> "$PSScriptRoot\categories-release-$mode.log"
    if($LASTEXITCODE -ne 0){Get-Content -LiteralPath "$PSScriptRoot\categories-release-$mode.log" -Tail 30;throw "Verification failed: $mode"}
    Write-Output "PASS: $mode"
}
