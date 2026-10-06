param([string]$Label='candidate-02')
$ErrorActionPreference='Stop'
$repo=[IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../..'))
$env:JAVA_HOME='E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1'
$env:ANDROID_HOME='C:\Users\14776\AppData\Local\Android\Sdk'
$directory=Join-Path $repo ".verification/n34/composition-$Label"
if(Test-Path -LiteralPath $directory){throw 'Preserve the prior candidate; choose a fresh label.'}
& "$repo/gradlew.bat" ':patches:buildAndroid' ':patches:generatePatchesList' '--offline' '--console=plain' '-Dorg.gradle.jvmargs=-Xmx4g -XX:MaxMetaspaceSize=1g' *> "$repo/.verification/n34/build-$Label.log"
if($LASTEXITCODE -ne 0){throw 'Offline source build failed'}
$mpp=Join-Path $repo "build/local-test/patches-1.3.5-local-n34-$Label.mpp"
$mpe=Join-Path $repo "build/local-test/extension-1.3.5-local-n34-$Label.mpe"
if((Test-Path -LiteralPath $mpp) -or (Test-Path -LiteralPath $mpe)){throw 'Candidate filename already exists'}
Copy-Item -LiteralPath "$repo/patches/build/libs/patches-1.3.5.mpp" -Destination $mpp
Copy-Item -LiteralPath "$repo/extensions/extension/build/morphe/extensions/extension.mpe" -Destination $mpe
$args=@(':patches:verifyComposition','--offline','--console=plain','-Dorg.gradle.jvmargs=-Xmx4g -XX:MaxMetaspaceSize=1g',
 "-Pcomposition.input=$repo/com.google.android.youtube_21.16.256-1561068412_minAPI28(arm64-v8a,armeabi-v7a,x86,x86_64)(nodpi)_apkmirror.com.apk",
 "-Pcomposition.official=$repo/patches-1.45.0.mpp","-Pcomposition.addon=$mpp","-Pcomposition.output=$directory",'-Pcomposition.selection=AI caption translator|Remember caption selection','-Pcomposition.compile=true')
& "$repo/gradlew.bat" @args *> "$repo/.verification/n34/composition-$Label.log"
if($LASTEXITCODE -ne 0){throw 'Real Patcher final composition failed'}
# Earlier N34 candidate output is preserved in composition-candidate-01/local candidate files.
Copy-Item -LiteralPath $mpp -Destination "$repo/build/local-test/patches-1.3.5-本地测试包-n34.mpp" -Force
Copy-Item -LiteralPath $mpe -Destination "$repo/build/local-test/extension-1.3.5-本地测试包-n34.mpe" -Force
Copy-Item -LiteralPath "$directory/patched-unsigned.apk" -Destination "$repo/build/n34-composition-final/YouTube-21.16.256-本地测试包-n34-unsigned.apk" -Force
Write-Output "N34_BUILD_AND_COMPOSITION_PASS $Label"
