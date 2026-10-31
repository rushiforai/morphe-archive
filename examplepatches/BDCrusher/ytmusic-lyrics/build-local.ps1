param([Parameter(ValueFromRemainingArguments=$true)][string[]]$GradleTasks = @(':lyrics-collection:buildAndroid'))
$ErrorActionPreference = 'Stop'
$scope = $PSScriptRoot
if (-not (Test-Path -LiteralPath "$scope\BuildCache\Maven\com\github\MorpheApp\smali\smali\d92701d947\smali-d92701d947.pom")) {
    & "$scope\build-smali.ps1"
    if ($LASTEXITCODE -ne 0) { throw 'Pinned Smali dependency build failed' }
}
if (-not (Test-Path -LiteralPath "$scope\Personal-Patches\web\tools\esbuild\esbuild.exe")) {
    & python -B "$scope\Personal-Patches\web\prepare_vendor.py"
    if ($LASTEXITCODE -ne 0) { throw 'Web dependency preparation failed' }
}
& python -B "$scope\Personal-Patches\web\patch_braccato.py"
if ($LASTEXITCODE -ne 0) { throw 'Pinned Braccato correction failed' }
& python -B "$scope\Personal-Patches\web\prepare_shaders.py"
if ($LASTEXITCODE -ne 0) { throw 'Pinned shader dependency preparation failed' }
& python -B "$scope\Personal-Patches\web\build_notices.py"
if ($LASTEXITCODE -ne 0) { throw 'Personal feature notice preparation failed' }
Push-Location "$scope\Personal-Patches"
try {
    & "$scope\Personal-Patches\web\tools\esbuild\esbuild.exe" web\src\main.js --bundle --format=iife --target=chrome110 --outfile=patches\src\main\resources\bdcrusher-lyrics\renderer.js
    if ($LASTEXITCODE -ne 0) { throw 'Web renderer build failed' }
    & "$scope\Personal-Patches\web\tools\esbuild\esbuild.exe" web\src\shaders.js --bundle --format=iife --target=chrome110 --outfile=patches\src\main\resources\bdcrusher-shaders\shaders.js
    if ($LASTEXITCODE -ne 0) { throw 'Shaders renderer build failed' }
} finally { Pop-Location }
$env:JAVA_HOME = 'C:\Program Files\Java\jdk-25.0.5.0.2'
$env:ANDROID_HOME = 'USER_HOME\AppData\Local\Android\Sdk'
$env:ANDROID_SDK_ROOT = $env:ANDROID_HOME
$env:GRADLE_USER_HOME = "$scope\BuildCache\Gradle Cache"
$env:GRADLE_RO_DEP_CACHE = 'USER_HOME\.gradle\caches'
$env:ANDROID_USER_HOME = "$scope\BuildCache\Android"
$env:ANDROID_EMULATOR_HOME = "$scope\BuildCache\Android\emulator"
$env:TMP = "$scope\BuildCache\Temp"
$env:TEMP = $env:TMP
$env:JAVA_TOOL_OPTIONS = '-XX:-UsePerfData'
$env:KOTLIN_DAEMON_RUN_FILES_PATH = "$scope\BuildCache\Kotlin"
New-Item -ItemType Directory -Force -Path $env:TMP,$env:ANDROID_USER_HOME,$env:KOTLIN_DAEMON_RUN_FILES_PATH | Out-Null
$gradleArgs = @('--no-daemon','--console=plain','--max-workers=4',
    "-Duser.home=$scope\BuildCache\Home", "-Djava.io.tmpdir=$env:TMP",
    "-Dmaven.repo.local=$scope\BuildCache\Maven",
    '-Dorg.gradle.java.installations.auto-download=false',
    '-Dorg.gradle.java.installations.auto-detect=false',
    "-Porg.gradle.java.installations.paths=$env:JAVA_HOME,C:\Program Files\Microsoft\jdk-17.0.20.101-hotspot",
    '-Pkotlin.compiler.execution.strategy=in-process',
    '-Pandroid.builder.sdkDownload=false') + $GradleTasks
Push-Location "$scope\Personal-Patches"
try { & .\gradlew.bat @gradleArgs; $result = $LASTEXITCODE }
finally { Pop-Location }
exit $result

