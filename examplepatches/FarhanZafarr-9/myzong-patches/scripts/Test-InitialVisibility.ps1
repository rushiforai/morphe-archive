param([string]$Version='1.2.8')
$ErrorActionPreference='Stop'
$project=Split-Path -Parent $PSScriptRoot
$classes=Join-Path $project 'work\resource-check-classes'
$cp=(Join-Path $project "patches\patches\build\libs\patches-$Version.mpp")+';'+(Join-Path $project 'tools\morphe-desktop-2.0.0-all.jar')
& 'C:\Program Files\Java\jdk-23.0.1\bin\javac.exe' -cp $cp -d $classes (Join-Path $project 'tests\resource-checks\InitialVisibilityTest.java')
if($LASTEXITCODE -ne 0){throw 'Resource-check compilation failed'}
& 'C:\Program Files\Java\jdk-23.0.1\bin\java.exe' -cp "$classes;$cp" InitialVisibilityTest (Join-Path $project 'inputs\MyZong-5.19.19.112-adpatched.apk') (Join-Path $project "builds\MyZong-5.19.19.112-cleanup-v$Version.apk")
if($LASTEXITCODE -ne 0){throw 'Initial visibility checks failed'}
