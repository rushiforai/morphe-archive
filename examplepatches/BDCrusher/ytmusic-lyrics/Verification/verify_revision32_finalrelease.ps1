$ErrorActionPreference='Stop'
$app=Split-Path -Parent $PSScriptRoot
$bundle=Join-Path $app 'Personal-Patches\lyrics-collection\build\libs\lyrics-collection-0.3.0-beta.1.mpp'
$official=Join-Path $app 'Inputs\official-patches-1.48.0.mpp'
$expected=(Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash
$free=(Get-PSDrive C).Free
if($free -lt 24GB){throw 'Full verification needs at least 24 GiB free; no cleanup is authorized'}
$modes=@('catalog','defaults','features','full-shaders-only','full-playlists-only','addon-first','official-first',
 'addon-first-features','official-first-features','addon-first-shaders-only','official-first-shaders-only',
 'addon-first-playlists-only','official-first-playlists-only','standalone-shaders-only','standalone-playlists-only','standalone-features','standalone-official-first-features',
 'editions-both','editions-reverse','addon-full-other','conflict','missing-official','standalone-missing-downloads-features')
foreach($mode in $modes){
    if((Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash -ne $expected){throw 'Candidate changed during matrix'}
    $options=@("-Pmode=$mode","-PverificationDir=../scratch/revision32-finalrelease-$mode","-PbundlePath=$bundle")
    if($mode -match 'addon-first|official-first|^standalone-|^conflict$'){$options+="-PofficialPath=$official"}
    & "$app\verify-stable.ps1" @options *> "$PSScriptRoot\revision32-finalrelease-$mode.log"
    if($LASTEXITCODE -ne 0){Get-Content -LiteralPath "$PSScriptRoot\revision32-finalrelease-$mode.log" -Tail 35;throw "Compatibility matrix failed: $mode"}
    Write-Output "PASS: $mode"
}
Write-Output "PASS: matrix uses one unchanged bundle SHA256 $($expected.ToLowerInvariant())"

