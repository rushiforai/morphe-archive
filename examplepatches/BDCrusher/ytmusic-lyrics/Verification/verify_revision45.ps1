$ErrorActionPreference='Stop'
$app=Split-Path -Parent $PSScriptRoot
$work=Join-Path $PSScriptRoot 'revision45'
$plan=Get-Content "$work/matrix-plan.json" -Raw -Encoding UTF8 | ConvertFrom-Json
$bundle=Join-Path $app 'Personal-Patches/lyrics-collection/build/libs/lyrics-collection-0.8.0-beta.2.mpp'
if((Get-PSDrive C).Free -lt 5GB){throw 'Need 5 GiB free before this bounded matrix; no cleanup authorized'}
foreach($case in $plan.cases){
 if((Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash.ToLowerInvariant() -ne $plan.sha256){throw 'Candidate changed'}
 & "$app/verify-stable.ps1" '-PpatcherSource=../../BuildSources/morphe-patcher-2.1.0-dev.4' "-PinputApk=$app/Inputs/youtube-music-$($case.target)-original.apk" "-Pmode=$($case.mode)" "-PverificationDir=$($case.directory)" "-PbundlePath=$bundle" *> $case.log
 if($LASTEXITCODE -ne 0){Get-Content -LiteralPath $case.log -Tail 25;throw "Matrix failed: $($case.target) $($case.mode)"}
 Write-Output "PASS: $($case.target) $($case.mode)"
}
$positive=@($plan.cases | Where-Object {$_.mode -ne 'features-missing-downloads'})
[IO.File]::WriteAllLines("$work/feature-manifest.txt",[string[]]@($positive | ForEach-Object {Join-Path $_.directory 'verified-unsigned.apk'}),[Text.UTF8Encoding]::new($false))
[IO.File]::WriteAllLines("$work/entry-manifest.txt",[string[]]@($positive | Where-Object {$_.mode -notlike 'without-lyrics-*'} | ForEach-Object {Join-Path $_.directory 'verified-unsigned.apk'}),[Text.UTF8Encoding]::new($false))
Write-Output "PASS: matrix uses one unchanged bundle SHA256 $($plan.sha256)"
