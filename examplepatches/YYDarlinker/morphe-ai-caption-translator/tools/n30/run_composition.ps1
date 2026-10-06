$ErrorActionPreference='Stop'
$repo=[IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../..'))
$env:JAVA_HOME='E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1'
$env:ANDROID_HOME='C:\Users\14776\AppData\Local\Android\Sdk'
$out=Join-Path $repo 'build/n30-composition-final'
if(Test-Path -LiteralPath $out){throw 'Final output already exists; do not overwrite a delivery'}
$args=@(':patches:verifyComposition','--offline','--console=plain','-Dorg.gradle.jvmargs=-Xmx4g -XX:MaxMetaspaceSize=1g',
 "-Pcomposition.input=$repo/com.google.android.youtube_21.16.256-1561068412_minAPI28(arm64-v8a,armeabi-v7a,x86,x86_64)(nodpi)_apkmirror.com.apk",
 "-Pcomposition.official=$repo/patches-1.45.0.mpp","-Pcomposition.addon=$repo/build/local-test/patches-1.3.5-本地测试包-n30.mpp", "-Pcomposition.output=$out",
 '-Pcomposition.selection=AI caption translator|Add Simplified Chinese to auto-translate|Remember caption selection','-Pcomposition.compile=true')
& "$repo/gradlew.bat" @args *> "$repo/.verification/n30/delivery-records/composition-final.log"
if($LASTEXITCODE -ne 0){Get-Content "$repo/.verification/n30/delivery-records/composition-final.log" -Tail 35;throw 'Composition failed'}
Get-Content "$repo/.verification/n30/delivery-records/composition-final.log" | Select-String '^PASS |COMPOSITION_PASS|STRUCTURE|BUILD SUCCESSFUL'
