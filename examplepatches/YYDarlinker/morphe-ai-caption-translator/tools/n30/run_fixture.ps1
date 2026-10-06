param([string]$Label='known-145',[string]$Official='patches-1.45.0.mpp',[string]$Fault='')
$ErrorActionPreference='Stop'
$repo=[IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../..'))
$env:JAVA_HOME='E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1'
$env:ANDROID_HOME='C:\Users\14776\AppData\Local\Android\Sdk'
$output=Join-Path $repo ".verification/n30/$Label"
$log=Join-Path $repo ".verification/n30/delivery-records/$Label.log"
$arguments=@(':patches:verifyComposition','--offline','--console=plain','-Dorg.gradle.jvmargs=-Xmx4g -XX:MaxMetaspaceSize=1g',
 "-Pcomposition.input=$repo/com.google.android.youtube_21.16.256-1561068412_minAPI28(arm64-v8a,armeabi-v7a,x86,x86_64)(nodpi)_apkmirror.com.apk",
 "-Pcomposition.official=$repo/$Official","-Pcomposition.addon=$repo/build/local-test/patches-1.3.5-本地测试包-n30.mpp",
 "-Pcomposition.output=$output",'-Pcomposition.selection=AI caption translator|Add Simplified Chinese to auto-translate|Remember caption selection',
 '-Pcomposition.compile=false','-Pcomposition.dex-only=true')
if($Fault){$arguments+="-Pcomposition.fault=$Fault"}
& "$repo/gradlew.bat" @arguments *> $log
$exit=$LASTEXITCODE
if(($Fault -and $exit -eq 0) -or (-not $Fault -and $exit -ne 0)){Get-Content -LiteralPath $log -Tail 25;throw "Unexpected fixture result: $Label exit=$exit"}
& "$repo/gradlew.bat" ':patches:auditComposition' '--offline' '--console=plain' "-Pcomposition.apk=$output/serialized-dex.zip" *> (Join-Path $repo ".verification/n30/delivery-records/$Label-audit.log")
$auditExit=$LASTEXITCODE
if(($Fault -and $auditExit -eq 0) -or (-not $Fault -and $auditExit -ne 0)){throw "Unexpected serialized audit result: $Label exit=$auditExit"}
Write-Output "FIXTURE_VERIFIED $Label patch_exit=$exit audit_exit=$auditExit"
