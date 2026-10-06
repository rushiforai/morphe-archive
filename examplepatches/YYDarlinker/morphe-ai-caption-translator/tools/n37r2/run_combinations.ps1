$ErrorActionPreference='Stop'
$repo=[IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../..'))
$env:JAVA_HOME='E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1'
$env:ANDROID_HOME='C:\Users\14776\AppData\Local\Android\Sdk'
$evidence=Join-Path $repo '.verification/n37r2'
foreach($entry in @(@('ai-only','AI caption translator'),@('remember-only','Remember caption selection'))){
 $label=$entry[0];$selection=$entry[1];$out="$evidence/composition-$label"
 if(Test-Path -LiteralPath $out){throw 'Preserve prior combination evidence'}
 & "$repo/gradlew.bat" ':patches:verifyComposition' '--offline' '--console=plain' '-Dorg.gradle.jvmargs=-Xmx4g -XX:MaxMetaspaceSize=1g' "-Pcomposition.input=$repo/com.google.android.youtube_21.16.256-1561068412_minAPI28(arm64-v8a,armeabi-v7a,x86,x86_64)(nodpi)_apkmirror.com.apk" "-Pcomposition.official=$repo/patches-1.45.0.mpp" "-Pcomposition.addon=$repo/build/local-test/patches-1.3.5-local-n37r2-candidate-01.mpp" "-Pcomposition.output=$out" "-Pcomposition.selection=$selection" '-Pcomposition.compile=false' *> "$evidence/composition-$label.log"
 if($LASTEXITCODE -ne 0){throw "Composition $label failed"}
 Write-Output "N37R2_STRUCTURE_PASS $label"
}
foreach($entry in @(@('before','build/local-test/extension-1.3.5-local-n37-candidate-04.mpe'),@('after','build/local-test/extension-1.3.5-local-n37r2-candidate-01.mpe'))){
 $label=$entry[0];& "$repo/gradlew.bat" ':patches:auditN37R2ApiRefs' '--offline' '--console=plain' '-I' 'tools/n37r2/api-refs.init.gradle' "-Pn37r2.input=$repo/$($entry[1])" "-Pn37r2.output=$evidence/api-refs-$label.tsv" *> "$evidence/api-refs-$label.log"
 if($LASTEXITCODE -ne 0){Get-Content "$evidence/api-refs-$label.log" -Tail 12;throw "API refs $label failed"}
}
$env:PYTHONUTF8='1'
& "$env:USERPROFILE/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe" "$repo/tools/n37r2/check_api.py"
if($LASTEXITCODE -ne 0){throw 'API28 compatibility audit failed'}