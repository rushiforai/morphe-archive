param([Parameter(ValueFromRemainingArguments=$true)][string[]]$Options)
$ErrorActionPreference='Stop'
$scope=$PSScriptRoot
$env:JAVA_HOME='C:\Program Files\Java\jdk-25.0.4.1'
$env:ANDROID_HOME=(Join-Path $env:LOCALAPPDATA 'Android\Sdk')
$env:ANDROID_SDK_ROOT=$env:ANDROID_HOME
$env:GRADLE_USER_HOME="$scope\BuildCache\Gradle Cache"
$env:GRADLE_RO_DEP_CACHE=(Join-Path $env:USERPROFILE '.gradle\caches')
$env:TMP="$scope\BuildCache\Temp";$env:TEMP=$env:TMP
$env:JAVA_TOOL_OPTIONS='-XX:-UsePerfData'
$env:ANDROID_USER_HOME="$scope\BuildCache\Android"
Push-Location "$scope\Verification\beta-engine"
try {
    & "$scope\Personal-Patches\gradlew.bat" --no-daemon --console=plain --max-workers=4 `
        "-Duser.home=$scope\BuildCache\Home" "-Djava.io.tmpdir=$env:TMP" "-Dmaven.repo.local=$scope\BuildCache\Maven" `
        '-Pkotlin.compiler.execution.strategy=in-process' '-Dorg.gradle.java.installations.auto-download=false' verifyBundle @Options
    $result=$LASTEXITCODE
} finally { Pop-Location }
exit $result
