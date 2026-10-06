$ErrorActionPreference = 'Stop'
$env:JAVA_HOME = 'E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1'
$env:ANDROID_HOME = 'C:\Users\14776\AppData\Local\Android\Sdk'
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"
$taskRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../..'))
$taskRun = if ($env:N28C_RUN_DIR) { $env:N28C_RUN_DIR } else { (Get-Content -LiteralPath "$taskRoot/.verification/n28c-scheduler-fix/active-run.txt" -Raw).Trim() }
$taskRecords = Join-Path $taskRun 'delivery-records'
$taskOutput = Join-Path $taskRoot 'build/n28c-composition-final'
if (Test-Path -LiteralPath $taskOutput) { throw 'Use a fresh composition output; never overwrite a delivery' }
$taskArguments = @(
    ':patches:verifyComposition', '--offline', '--console=plain',
    '-Dorg.gradle.jvmargs=-Xmx4g -XX:MaxMetaspaceSize=1g',
    "-Pcomposition.input=$taskRoot/com.google.android.youtube_21.16.256-1561068412_minAPI28(arm64-v8a,armeabi-v7a,x86,x86_64)(nodpi)_apkmirror.com.apk",
    "-Pcomposition.official=$taskRoot/patches-1.44.0.mpp",
    "-Pcomposition.addon=$taskRoot/build/local-test/patches-1.3.5-本地测试包-n28c.mpp",
    "-Pcomposition.output=$taskOutput", '-Pcomposition.selection=AI caption translator', '-Pcomposition.compile=true'
)
& "$taskRoot/gradlew.bat" @taskArguments *> (Join-Path $taskRecords 'composition.log')
if ($LASTEXITCODE -ne 0) { Get-Content (Join-Path $taskRecords 'composition.log') -Tail 40; throw "Composition failed: $LASTEXITCODE" }
Get-Content (Join-Path $taskRecords 'composition.log') | Select-String -Pattern '^PASS |COMPOSITION_PASS|STRUCTURE|BUILD |FAIL|error:'
