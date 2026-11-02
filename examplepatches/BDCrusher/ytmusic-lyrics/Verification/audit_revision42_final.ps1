$ErrorActionPreference='Stop'
$app=Split-Path -Parent $PSScriptRoot
$plan=Get-Content "$PSScriptRoot/revision42/matrix-plan.json" -Raw | ConvertFrom-Json
$positive=@($plan.cases | Where-Object {$_.mode -ne 'features-missing-downloads'})
if($positive.Count -ne 6){throw 'Wrong selections'}
foreach($item in @(@('auditPersonalFeatures','feature'),@('auditModelEntry','entry'),@('auditDownloads40','downloads40'),@('auditDownloads41','downloads41'),@('auditDownloads42','downloads42'))){
 $manifest=if($item[1] -eq 'entry'){'entry'}else{'feature'}
 & "$app/verify-stable.ps1" $item[0] -x verifyBundle '-PpatcherSource=../../BuildSources/morphe-patcher-2.1.0-dev.4' "-PauditManifest=$PSScriptRoot/revision42/$manifest-manifest-r2.txt" *> "$PSScriptRoot/revision42/$($item[1])-audit-r2.log"
 if($LASTEXITCODE -ne 0){Get-Content "$PSScriptRoot/revision42/$($item[1])-audit-r2.log" -Tail 25;throw 'Compiled audit failed'}
 Write-Output "PASS: $($item[0])"
}
