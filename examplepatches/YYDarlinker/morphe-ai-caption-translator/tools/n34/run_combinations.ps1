param([string]$Addon='build/local-test/patches-1.3.5-local-n34-candidate-04.mpp',[string]$Label='combinations-final')
$ErrorActionPreference='Stop'
$taskRepo=[IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../..'))
$env:JAVA_HOME='E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1'
$env:ANDROID_HOME='C:\Users\14776\AppData\Local\Android\Sdk'
$taskDirectory=Join-Path $taskRepo ".verification/n34/$Label"
New-Item -ItemType Directory -Path $taskDirectory -ErrorAction Stop | Out-Null
$combinations=@(@('ai','AI caption translator'),@('remember','Remember caption selection'),@('both','AI caption translator|Remember caption selection'),@('obsolete','Add Simplified Chinese to auto-translate'))
foreach($combination in $combinations){
 $arguments=@(':patches:verifyComposition','--offline','--console=plain','-Dorg.gradle.jvmargs=-Xmx4g -XX:MaxMetaspaceSize=1g',
  "-Pcomposition.input=$taskRepo/com.google.android.youtube_21.16.256-1561068412_minAPI28(arm64-v8a,armeabi-v7a,x86,x86_64)(nodpi)_apkmirror.com.apk",
  "-Pcomposition.official=$taskRepo/patches-1.45.0.mpp","-Pcomposition.addon=$taskRepo/$Addon","-Pcomposition.output=$taskDirectory/$($combination[0])",
  "-Pcomposition.selection=$($combination[1])",'-Pcomposition.compile=false','-Pcomposition.dex-only=true')
 & "$taskRepo/gradlew.bat" @arguments *> "$taskDirectory/$($combination[0]).log"
 $result=$LASTEXITCODE
 if($combination[0] -eq 'obsolete'){
  if($result -eq 0 -or -not(Select-String -LiteralPath "$taskDirectory/obsolete.log" -SimpleMatch 'Unknown caption root: Add Simplified Chinese to auto-translate')){throw 'Obsolete public root was not rejected by name'}
  Write-Output 'OBSOLETE_ROOT_NAMED_REJECT'
 }else{
  if($result -ne 0){Get-Content -LiteralPath "$taskDirectory/$($combination[0]).log" -Tail 20;throw "Combination failed: $($combination[0])"}
  & "$taskRepo/gradlew.bat" ':patches:auditComposition' '--offline' '--console=plain' "-Pcomposition.apk=$taskDirectory/$($combination[0])/serialized-dex.zip" *> "$taskDirectory/$($combination[0])-audit.log"
  if($LASTEXITCODE -ne 0){Get-Content -LiteralPath "$taskDirectory/$($combination[0])-audit.log" -Tail 15;throw 'Serialized combination audit failed'}
  Write-Output "COMBINATION_PASS $($combination[0])"
 }
}
