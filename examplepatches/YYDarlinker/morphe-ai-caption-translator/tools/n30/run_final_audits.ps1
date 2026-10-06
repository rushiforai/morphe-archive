param()
$ErrorActionPreference='Stop'
$repo=[IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../..'))
$env:JAVA_HOME='E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1'
$records=Join-Path $repo '.verification/n30/delivery-records'
$artifacts=@{
 mpp='build/local-test/patches-1.3.5-本地测试包-n30.mpp'
 mpe='build/local-test/extension-1.3.5-本地测试包-n30.mpe'
 apk='build/n30-composition-final/YouTube-21.16.256-本地测试包-n30-unsigned.apk'
}
foreach($label in @('mpp','mpe','apk')) {
 $arguments=@('-I',"$repo/tools/n28a/audit.init.gradle",':patches:auditN28AFinal','--offline','--console=plain',"-Pn28aAudit.input=$(Join-Path $repo $artifacts[$label])","-Pn28aAudit.report=$records/$label-branch-audit.txt",'-Pn28aAudit.require-ai=false',"-Pn28aAudit.label=n30-$label")
 & "$repo/gradlew.bat" @arguments *> "$records/$label-branch-audit.log"
 if($LASTEXITCODE -ne 0){Get-Content "$records/$label-branch-audit.log" -Tail 30;throw "Final $label branch audit failed"}
 Get-Content "$records/$label-branch-audit.txt" | Select-String 'SUMMARY|AUDIT_PASS'
}
& "$repo/gradlew.bat" ':patches:auditComposition' '--offline' '--console=plain' "-Pcomposition.apk=$(Join-Path $repo $artifacts.apk)" *> "$records/composition-dex-audit.log"
if($LASTEXITCODE -ne 0){Get-Content "$records/composition-dex-audit.log" -Tail 30;throw 'Final APK interface/hook audit failed'}
Get-Content "$records/composition-dex-audit.log" | Select-String 'AI_FINALIZER|DEX_AUDIT_PASS'
& "$repo/gradlew.bat" '-I' "$repo/tools/n29/verification.init.gradle" ':patches:testN29OfficialCc' '--offline' '--console=plain' "-Pn29.input=$(Join-Path $repo $artifacts.apk)" "-Pn29.report=$records/official-cc-final.csv" *> "$records/official-cc-final.log"
if($LASTEXITCODE -ne 0){Get-Content "$records/official-cc-final.log" -Tail 30;throw 'Final official CC regression failed'}
Get-Content "$records/official-cc-final.log" | Select-String 'OFFICIAL_CC_CHAIN_PASS'
