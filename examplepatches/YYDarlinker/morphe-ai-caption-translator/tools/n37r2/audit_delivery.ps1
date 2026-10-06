param([string]$Label='candidate-01')
$ErrorActionPreference='Stop'
$repo=[IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../..'))
$env:JAVA_HOME='E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1'
$env:ANDROID_HOME='C:\Users\14776\AppData\Local\Android\Sdk'
$evidence=Join-Path $repo '.verification/n37r2'
$inputs=@(@('apk',".verification/n37r2/composition-$Label/patched-unsigned.apk"),@('mpp',"build/local-test/patches-1.3.5-local-n37r2-$Label.mpp"),@('mpe',"build/local-test/extension-1.3.5-local-n37r2-$Label.mpe"))
foreach($input in $inputs){
 $name=$input[0];$report="$evidence/audit-$Label-$name.txt"
 if(Test-Path -LiteralPath $report){throw 'Preserve prior evidence; choose a fresh audit label'}
 & "$repo/gradlew.bat" ':patches:auditN34Final' '--offline' '--console=plain' '-I' 'tools/n34/audits.init.gradle' "-Pn34Audit.input=$repo/$($input[1])" "-Pn34Audit.report=$report" "-Pn34Audit.label=n37r2-$Label-$name" '-Pn34Audit.require-ai=false' *> "$evidence/audit-$Label-$name.log"
 if($LASTEXITCODE -ne 0){throw "Final $name serialized DEX branch/API audit failed"}
 Get-Content -LiteralPath $report -Tail 1
}
$apk=Join-Path $repo $inputs[0][1]
$dump="$evidence/official-methods-$Label.txt"
& "$repo/gradlew.bat" ':patches:inspectN34' '--offline' '--console=plain' '-I' 'tools/n34/inspect.init.gradle' "-Pn34.input=$apk" "-Pn34.output=$dump" *> "$evidence/official-inspect-$Label.log"
if($LASTEXITCODE -ne 0){throw 'Official methods inspection failed'}
& "$env:ANDROID_HOME/build-tools/36.0.0/apksigner.bat" verify --verbose $apk *> "$evidence/unsigned-$Label.log"
if($LASTEXITCODE -eq 0){throw 'Unexpectedly signed delivery'}
$global:LASTEXITCODE=0
Write-Output 'N37R2_DELIVERY_AUDIT_PASS'
