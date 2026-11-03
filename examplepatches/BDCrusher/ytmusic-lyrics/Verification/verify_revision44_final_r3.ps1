$ErrorActionPreference='Stop'
$app=Split-Path -Parent $PSScriptRoot
$plan=Get-Content "$PSScriptRoot/revision44/matrix-plan-r3.json" -Raw -Encoding UTF8 | ConvertFrom-Json
$bundle=Join-Path $app 'Personal-Patches/lyrics-collection/build/libs/lyrics-collection-0.8.0-beta.1.mpp'
if((Get-PSDrive C).Free -lt 6GB){throw 'Need 6 GiB free; no cleanup authorized'}
foreach($case in $plan.cases){
 if((Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash.ToLowerInvariant() -ne $plan.sha256){throw 'Candidate changed'}
 & "$app/verify-stable.ps1" '-PpatcherSource=../../BuildSources/morphe-patcher-2.1.0-dev.4' "-PinputApk=$app/Inputs/youtube-music-$($case.target)-original.apk" "-Pmode=$($case.mode)" "-PverificationDir=$($case.directory)" "-PbundlePath=$bundle" *> $case.log
 if($LASTEXITCODE -ne 0){Get-Content -LiteralPath $case.log -Tail 25;throw "Matrix failed: $($case.target) $($case.mode)"}
 Write-Output "PASS: $($case.target) $($case.mode)"
}
$positive=@($plan.cases | Where-Object {$_.mode -ne 'features-missing-downloads'})
$personal=@($positive | Where-Object {$_.mode -notlike 'without-lyrics-*'})
[System.IO.File]::WriteAllLines("$PSScriptRoot/revision44/feature-manifest-r3.txt",[string[]]@($positive | ForEach-Object {Join-Path $_.directory 'verified-unsigned.apk'}),[System.Text.UTF8Encoding]::new($false))
[System.IO.File]::WriteAllLines("$PSScriptRoot/revision44/entry-manifest-r3.txt",[string[]]@($personal | ForEach-Object {Join-Path $_.directory 'verified-unsigned.apk'}),[System.Text.UTF8Encoding]::new($false))
Write-Output "PASS: matrix uses one unchanged bundle SHA256 $($plan.sha256)"
