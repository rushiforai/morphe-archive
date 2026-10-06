param([ValidateSet("all","first","second")][string]$Group="all")
$ErrorActionPreference='Stop'
$repo=[IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../..'))
$env:JAVA_HOME='E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1'
$env:ANDROID_HOME='C:\Users\14776\AppData\Local\Android\Sdk'
$records=Join-Path $repo '.verification/n30/delivery-records'
$cases=@(
 @{label='ai';selection='AI caption translator'},
 @{label='simplified';selection='Add Simplified Chinese to auto-translate'},
 @{label='memory';selection='Remember caption selection'},
 @{label='ai-simplified';selection='AI caption translator|Add Simplified Chinese to auto-translate'},
 @{label='ai-memory';selection='AI caption translator|Remember caption selection'},
 @{label='simplified-memory';selection='Add Simplified Chinese to auto-translate|Remember caption selection'}
)
if($Group -eq "first"){$cases=$cases[0..2]}
if($Group -eq "second"){$cases=$cases[3..5]}
foreach($case in $cases){
 $output=Join-Path $repo ".verification/n30/combinations-final-03/$($case.label)"
 $log=Join-Path $records "combination-$($case.label).log"
 $arguments=@(':patches:verifyComposition','--offline','--console=plain','-Dorg.gradle.jvmargs=-Xmx4g -XX:MaxMetaspaceSize=1g',
 "-Pcomposition.input=$repo/com.google.android.youtube_21.16.256-1561068412_minAPI28(arm64-v8a,armeabi-v7a,x86,x86_64)(nodpi)_apkmirror.com.apk",
 "-Pcomposition.official=$repo/patches-1.45.0.mpp","-Pcomposition.addon=$repo/build/local-test/patches-1.3.5-本地测试包-n30.mpp",
 "-Pcomposition.output=$output","-Pcomposition.selection=$($case.selection)",'-Pcomposition.compile=false','-Pcomposition.dex-only=true')
 & "$repo/gradlew.bat" @arguments *> $log
 if($LASTEXITCODE -ne 0){Get-Content -LiteralPath $log -Tail 25;throw "Combination failed: $($case.label)"}
 & "$repo/gradlew.bat" ':patches:auditComposition' '--offline' '--console=plain' "-Pcomposition.apk=$output/serialized-dex.zip" *> (Join-Path $records "combination-$($case.label)-audit.log")
 if($LASTEXITCODE -ne 0){Get-Content (Join-Path $records "combination-$($case.label)-audit.log") -Tail 25;throw "Serialized combination audit failed: $($case.label)"}
 Write-Output "SERIALIZED_COMBINATION_PASS $($case.label)"
}
# Seventh combination is the all-three final APK, not another resource/APK build.
