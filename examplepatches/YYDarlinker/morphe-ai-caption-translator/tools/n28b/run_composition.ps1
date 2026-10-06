$ErrorActionPreference = 'Stop'
$env:JAVA_HOME = 'E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1'
$env:ANDROID_HOME = 'C:\Users\14776\AppData\Local\Android\Sdk'
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"
$taskRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../..'))
$taskOutput = Join-Path $taskRoot 'build/n28b-composition-final'
if (Test-Path -LiteralPath $taskOutput) { throw 'Use a fresh composition output; never overwrite a delivery' }
$taskArguments = @(
    ':patches:verifyComposition', '--offline', '--console=plain',
    '-Dorg.gradle.jvmargs=-Xmx4g -XX:MaxMetaspaceSize=1g',
    "-Pcomposition.input=$taskRoot/com.google.android.youtube_21.16.256-1561068412_minAPI28(arm64-v8a,armeabi-v7a,x86,x86_64)(nodpi)_apkmirror.com.apk",
    "-Pcomposition.official=$taskRoot/patches-1.44.0.mpp",
    "-Pcomposition.addon=$taskRoot/build/local-test/patches-1.3.5-本地测试包-n28b.mpp",
    "-Pcomposition.output=$taskOutput", '-Pcomposition.selection=AI caption translator', '-Pcomposition.compile=true'
)
& "$taskRoot/gradlew.bat" @taskArguments *> (Join-Path $taskRoot 'build/n28b-records/composition.log')
if ($LASTEXITCODE -ne 0) { Get-Content (Join-Path $taskRoot 'build/n28b-records/composition.log') -Tail 40; throw "Composition failed: $LASTEXITCODE" }
Get-Content (Join-Path $taskRoot 'build/n28b-records/composition.log') | Select-String -Pattern '^PASS |COMPOSITION_PASS|STRUCTURE|BUILD |FAIL|error:'
