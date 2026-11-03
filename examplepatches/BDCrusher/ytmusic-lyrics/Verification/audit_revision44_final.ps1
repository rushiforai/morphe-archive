$ErrorActionPreference='Stop'
$app=Split-Path -Parent $PSScriptRoot
$plan=Get-Content "$PSScriptRoot/revision44/matrix-plan-r3.json" -Raw -Encoding UTF8 | ConvertFrom-Json
$positive=@($plan.cases | Where-Object {$_.mode -ne 'features-missing-downloads'})
if($positive.Count -ne 12){throw 'Wrong final selection count'}
foreach($item in @(@('auditPersonalFeatures','feature'),@('auditModelEntry','entry'),@('auditDownloads40','downloads40'),@('auditDownloads41','downloads41'),@('auditDownloads42','downloads42'),@('auditDownloads43','downloads43'),@('auditDownloads44','downloads44'))){
 $manifest=if($item[1] -eq 'entry'){'entry'}else{'feature'}
 & "$app/verify-stable.ps1" $item[0] -x verifyBundle '-PpatcherSource=../../BuildSources/morphe-patcher-2.1.0-dev.4' "-PauditManifest=$PSScriptRoot/revision44/$manifest-manifest-r3.txt" *> "$PSScriptRoot/revision44/$($item[1])-audit-r3.log"
 if($LASTEXITCODE -ne 0){Get-Content "$PSScriptRoot/revision44/$($item[1])-audit-r3.log" -Tail 25;throw "Compiled audit failed: $($item[0])"}
 Write-Output "PASS: $($item[0])"
}
