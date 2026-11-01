$ErrorActionPreference='Stop'
$app=Split-Path -Parent $PSScriptRoot
$plan=Get-Content -LiteralPath "$PSScriptRoot\revision39\matrix-plan-r1.json" -Raw -Encoding UTF8 | ConvertFrom-Json
$bundle=Join-Path $app 'Personal-Patches\lyrics-collection\build\libs\lyrics-collection-0.6.1-beta.1.mpp'
if((Get-PSDrive C).Free -lt 24GB){throw 'Need 24 GiB free; no cleanup is authorized'}
foreach($case in $plan.cases){
 if((Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash.ToLowerInvariant() -ne $plan.sha256){throw 'Candidate changed'}
 if($case.reuse){
  $report=Get-Content -LiteralPath (Join-Path $case.directory 'verification.json') -Raw -Encoding UTF8 | ConvertFrom-Json
  if($report.bundleSha256 -ne $plan.sha256 -or -not $report.sdkDexVerification -or -not $report.assetIdentity){throw 'Retained verification does not match candidate'}
  if((Get-FileHash -LiteralPath $report.outputUnsignedApk -Algorithm SHA256).Hash.ToLowerInvariant() -ne $report.outputUnsignedApkSha256){throw 'Retained APK changed'}
 }else{
  $options=@('-PpatcherSource=../../BuildSources/morphe-patcher-2.1.0-dev.4',"-PinputApk=$app\Inputs\youtube-music-$($case.target)-original.apk","-Pmode=$($case.mode)","-PverificationDir=$($case.directory)","-PbundlePath=$bundle")
  & "$app\verify-stable.ps1" @options *> $case.log
  if($LASTEXITCODE -ne 0){Get-Content -LiteralPath $case.log -Tail 30;throw "Compatibility matrix failed: $($case.target) $($case.mode)"}
 }
 if($case.mode -eq 'features'){
  & "$app\verify-stable.ps1" auditInvokeAccess -x verifyBundle '-PpatcherSource=../../BuildSources/morphe-patcher-2.1.0-dev.4' "-PaccessApk=$($case.directory)\verified-unsigned.apk" '-PaccessExpected=expect-pass' *> "$PSScriptRoot\revision39\access-$($case.target).log"
  if($LASTEXITCODE -ne 0){Get-Content "$PSScriptRoot\revision39\access-$($case.target).log" -Tail 30;throw 'New APK access audit failed'}
 }
 Write-Output "PASS: $($case.target) $($case.mode) retained=$($case.reuse)"
}
$positive=@($plan.cases | Where-Object {$_.mode -ne 'features-missing-downloads'})
$personal=@($positive | Where-Object {$_.mode -notlike 'without-lyrics-*'})
if($positive.Count -ne 14 -or $personal.Count -ne 8){throw 'Unexpected audit selection counts'}
[System.IO.File]::WriteAllLines("$PSScriptRoot\revision39\feature-manifest-r1.txt",[string[]]@($positive | ForEach-Object {Join-Path $_.directory 'verified-unsigned.apk'}),[System.Text.UTF8Encoding]::new($false))
[System.IO.File]::WriteAllLines("$PSScriptRoot\revision39\entry-manifest-r1.txt",[string[]]@($personal | ForEach-Object {Join-Path $_.directory 'verified-unsigned.apk'}),[System.Text.UTF8Encoding]::new($false))
Write-Output "PASS: matrix uses one unchanged bundle SHA256 $($plan.sha256)"
