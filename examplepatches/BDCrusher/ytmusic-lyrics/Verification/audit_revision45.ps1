$ErrorActionPreference='Stop'
$app=Split-Path -Parent $PSScriptRoot
$work=Join-Path $PSScriptRoot 'revision45'
foreach($task in @('auditPersonalFeatures','auditModelEntry','auditDownloads40','auditDownloads41','auditDownloads42','auditDownloads43','auditDownloads44','auditReferenceReturns45')){
 $manifest=if($task -eq 'auditModelEntry'){'entry'}else{'feature'}
 & "$app/verify-stable.ps1" $task -x verifyBundle '-PpatcherSource=../../BuildSources/morphe-patcher-2.1.0-dev.4' "-PauditManifest=$work/$manifest-manifest.txt" *> "$work/$task.log"
 if($LASTEXITCODE -ne 0){Get-Content "$work/$task.log" -Tail 25;throw "Compiled audit failed: $task"}
 Write-Output "PASS: $task"
}
