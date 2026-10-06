$ErrorActionPreference='Stop'
$repo=[IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../..'))
$taskRun = if ($env:N28C_RUN_DIR) { $env:N28C_RUN_DIR } else { "$repo/.verification/n28c-r1" }
$taskRecords = Join-Path $taskRun 'delivery-records'
$env:JAVA_HOME='E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1'
# Reuse the verified read-only archived audit classes; no N27 observer is required or injected.
$artifacts=@{
  mpp='build/local-test/patches-1.3.5-本地测试包-n28c-r1.mpp'
  mpe='build/local-test/extension-1.3.5-本地测试包-n28c-r1.mpe'
  apk='build/n28c-r1-composition-final/YouTube-21.16.256-本地测试包-n28c-r1-unsigned.apk'
}
foreach($label in @('mpp','mpe','apk')) {
  $inputFile=Join-Path $repo $artifacts[$label]
  $report=Join-Path $taskRecords "$label-branch-audit.txt"
  $log=Join-Path $taskRecords "$label-branch-audit.log"
  $arguments=@('-I',"$repo/tools/n28a/audit.init.gradle",':patches:auditN28AFinal','--offline',"-Pn28aAudit.input=$inputFile","-Pn28aAudit.report=$report",'-Pn28aAudit.require-ai=false',"-Pn28aAudit.label=n28c-$label")
  & "$repo/gradlew.bat" @arguments *> $log
  if($LASTEXITCODE -ne 0){Get-Content -LiteralPath $log -Tail 30;throw "Final $label audit failed"}
  Get-Content -LiteralPath $report | Select-String -Pattern 'SELF|SUMMARY|AUDIT_PASS'
}
& "$repo/gradlew.bat" ':patches:auditComposition' '--offline' "-Pcomposition.apk=$(Join-Path $repo $artifacts.apk)" *> (Join-Path $taskRecords 'composition-dex-audit.log')
if($LASTEXITCODE -ne 0){Get-Content (Join-Path $taskRecords 'composition-dex-audit.log') -Tail 30;throw 'Interface DEX audit failed'}
Get-Content (Join-Path $taskRecords 'composition-dex-audit.log') | Select-String -Pattern 'DEX_AUDIT_PASS|BUILD SUCCESS'
