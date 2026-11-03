$ErrorActionPreference='Stop'
$app=Split-Path -Parent $PSScriptRoot
$work=Join-Path $PSScriptRoot 'revision45'
$bundle=Join-Path $app 'Personal-Patches/lyrics-collection/build/libs/lyrics-collection-0.8.0-beta.2.mpp'
$plan=Get-Content "$work/matrix-plan.json" -Raw -Encoding UTF8 | ConvertFrom-Json
if((Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash.ToLowerInvariant() -ne $plan.sha256){throw 'Candidate changed'}
if(-not (Select-String -LiteralPath "$work/matrix.log" -SimpleMatch 'PASS: matrix uses one unchanged bundle SHA256' -Quiet)){throw 'Matrix incomplete'}
& "$PSScriptRoot/audit_revision45.ps1" *> "$work/audits.log"
if($LASTEXITCODE -ne 0){Get-Content "$work/audits.log" -Tail 30;throw 'Compiled audits failed'}
& "$app/verify-stable.ps1" auditReferenceReturns45 -x verifyBundle '-PpatcherSource=../../BuildSources/morphe-patcher-2.1.0-dev.4' "-PauditManifest=$work/released-manifest.txt" '-PreturnExpected=expect-released-failure' *> "$work/released-regression-final.log"
if($LASTEXITCODE -ne 0){Get-Content "$work/released-regression-final.log" -Tail 25;throw 'Released regression failed'}
foreach($pair in @(@('catalog','9.42.52'),@('jam-unsupported','9.43.51'))){
 $mode=$pair[0];$target=$pair[1]
 & "$app/verify-stable.ps1" '-PpatcherSource=../../BuildSources/morphe-patcher-2.1.0-dev.4' "-PinputApk=$app/Inputs/youtube-music-$target-original.apk" "-Pmode=$mode" "-PverificationDir=$app/Verification/scratch/revision45-$mode" "-PbundlePath=$bundle" *> "$work/$mode.log"
 if($LASTEXITCODE -ne 0){Get-Content "$work/$mode.log" -Tail 25;throw "Guard/catalog failed: $mode"}
}
$env:PYTHONUTF8='1'
& 'USER_HOME/AppData/Local/Programs/Python/Python312/python.exe' -B "$PSScriptRoot/inspect_revision45_outputs.py" *> "$work/manifest-check.log"
if($LASTEXITCODE -ne 0){Get-Content "$work/manifest-check.log" -Tail 20;throw 'Manifest check failed'}
Write-Output 'PASS: all compiled audits, released regression, catalog/Jam and manifest checks'
