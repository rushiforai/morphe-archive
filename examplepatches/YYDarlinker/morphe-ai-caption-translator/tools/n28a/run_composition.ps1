$ErrorActionPreference = 'Stop'
$env:JAVA_HOME = 'E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1'
$env:ANDROID_HOME = 'C:\Users\14776\AppData\Local\Android\Sdk'
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"
$taskRoot = 'E:\Projects\morphe-caption-v2'
$taskOutput = Join-Path $taskRoot 'build/n28a-composition-final'
if (Test-Path -LiteralPath $taskOutput) { throw 'Use a fresh composition output' }
$taskArguments = @(
    ':patches:verifyComposition', '--offline', '--console=plain',
    '-Dorg.gradle.jvmargs=-Xmx4g -XX:MaxMetaspaceSize=1g',
    '-Pcomposition.input=E:/Projects/morphe-caption-v2/com.google.android.youtube_21.16.256-1561068412_minAPI28(arm64-v8a,armeabi-v7a,x86,x86_64)(nodpi)_apkmirror.com.apk',
    '-Pcomposition.official=E:/Projects/morphe-caption-v2/patches-1.44.0.mpp',
    '-Pcomposition.addon=E:/Projects/morphe-caption-v2/build/local-test/patches-1.3.5-本地测试包-n28a.mpp',
    '-Pcomposition.output=E:/Projects/morphe-caption-v2/build/n28a-composition-final',
    '-Pcomposition.selection=AI caption translator',
    '-Pcomposition.compile=true'
)
& "$taskRoot\gradlew.bat" @taskArguments 2>&1 |
    Tee-Object -FilePath (Join-Path $taskRoot 'build/n28a-records/composition.log') |
    Select-String -Pattern '^PASS |COMPOSITION_PASS|STRUCTURE|BUILD |FAIL|error:'
if ($LASTEXITCODE -ne 0) { throw "Composition failed: $LASTEXITCODE" }
