$ErrorActionPreference='Stop'
$app=Split-Path -Parent $PSScriptRoot
$bundle=Join-Path $app 'Personal-Patches\lyrics-collection\build\libs\lyrics-collection-0.5.0-beta.1.mpp'
$official=Join-Path $app 'Inputs\official-patches-1.48.0.mpp'
$expected=(Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash
$free=(Get-PSDrive C).Free
if($free -lt 24GB){throw 'Full verification needs at least 24 GiB free; no cleanup is authorized'}
$modes=@('defaults','features','full-shaders-only','full-playlists-only','without-lyrics-features','without-lyrics-shaders-only','without-lyrics-playlists-only','features-missing-downloads')
foreach($target in @('9.43.51','9.42.52')){
 foreach($mode in $modes){
    if((Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash -ne $expected){throw 'Candidate changed during matrix'}
    $label=$target.Replace('.','')
    $options=@("-PpatcherSource=../../BuildSources/morphe-patcher-2.1.0-dev.4","-PinputApk=$app\Inputs\youtube-music-$target-original.apk","-Pmode=$mode","-PverificationDir=../scratch/revision37-r4-$label-$mode","-PbundlePath=$bundle")
    & "$app\verify-stable.ps1" @options *> "$PSScriptRoot\revision37\r4-$label-$mode.log"
    if($LASTEXITCODE -ne 0){Get-Content -LiteralPath "$PSScriptRoot\revision37\r4-$label-$mode.log" -Tail 35;throw "Compatibility matrix failed: $target $mode"}
    Write-Output "PASS: $target $mode"
 }
}
Write-Output "PASS: matrix uses one unchanged bundle SHA256 $($expected.ToLowerInvariant())"

