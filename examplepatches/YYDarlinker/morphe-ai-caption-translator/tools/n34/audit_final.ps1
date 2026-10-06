param([string]$Label='final-03')
$ErrorActionPreference='Stop'
$repo=[IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../..'))
$env:JAVA_HOME='E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1'
$env:ANDROID_HOME='C:\Users\14776\AppData\Local\Android\Sdk'
$inputs=@(@('apk','build/n34-composition-final/YouTube-21.16.256-本地测试包-n34-unsigned.apk'),@('mpp','build/local-test/patches-1.3.5-本地测试包-n34.mpp'),@('mpe','build/local-test/extension-1.3.5-本地测试包-n34.mpe'))
foreach($input in $inputs){
 $name=$input[0];$report="$repo/.verification/n34/$Label-$name-branch-audit.txt"
 if(Test-Path -LiteralPath $report){throw 'Keep old audit evidence; choose a fresh label'}
 & "$repo/gradlew.bat" ':patches:auditN34Final' '--offline' '--console=plain' '-I' 'tools/n34/audits.init.gradle' "-Pn34Audit.input=$repo/$($input[1])" "-Pn34Audit.report=$report" "-Pn34Audit.label=n34-$Label-$name" '-Pn34Audit.require-ai=false' *> "$repo/.verification/n34/$Label-$name-branch-audit.log"
 if($LASTEXITCODE -ne 0){throw "Final $name raw-code-item and branch audit failed"}
 Get-Content -LiteralPath $report -Tail 2
}
$dump="$repo/.verification/n34/$Label-official-methods-complete.txt"
& "$repo/gradlew.bat" ':patches:inspectN34' '--offline' '--console=plain' '-I' 'tools/n34/inspect.init.gradle' "-Pn34.input=$repo/build/n34-composition-final/YouTube-21.16.256-本地测试包-n34-unsigned.apk" "-Pn34.output=$dump" *> "$repo/.verification/n34/$Label-inspect-official.log"
if($LASTEXITCODE -ne 0){throw 'Final official-method inspection failed'}
& "$env:ANDROID_HOME/build-tools/36.0.0/apksigner.bat" verify --verbose "$repo/build/n34-composition-final/YouTube-21.16.256-本地测试包-n34-unsigned.apk" *> "$repo/.verification/n34/$Label-unsigned-negative.log"
if($LASTEXITCODE -eq 0){throw 'Unexpectedly signed delivery'}
Write-Output 'N34_FINAL_BRANCH_OFFICIAL_AND_UNSIGNED_AUDIT_PASS'
