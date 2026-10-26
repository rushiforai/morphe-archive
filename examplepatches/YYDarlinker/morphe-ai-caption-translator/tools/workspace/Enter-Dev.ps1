# Canonical process-only Windows environment. Dot-source; no account/tool discovery.
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$repo = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../..'))
if (-not (Test-Path -LiteralPath 'E:\') -or $repo.Substring(0,3) -ine 'E:\') {
    throw 'Project repository and writable work must be on E:. No fallback is allowed.'
}
function Resolve-Input([string]$Name, [string]$Default) {
    $value = [Environment]::GetEnvironmentVariable($Name, 'Process')
    if ([string]::IsNullOrWhiteSpace($value)) { $value = Join-Path $repo $Default }
    if (-not [IO.Path]::IsPathRooted($value)) { $value = Join-Path $repo $value }
    return [IO.Path]::GetFullPath($value)
}
$jdk = Resolve-Input 'JAVA_HOME' 'work/toolchain/jdk-21'
if (-not (Test-Path -LiteralPath "$jdk/bin/java.exe") -or -not (Test-Path -LiteralPath "$jdk/bin/javac.exe")) {
    throw 'JDK 21 missing. Set process JAVA_HOME or provision work/toolchain/jdk-21.'
}
$ErrorActionPreference = 'Continue'
$javaVersion = & "$jdk/bin/java.exe" -version 2>&1 | Out-String
$javaExit = $LASTEXITCODE
$ErrorActionPreference = 'Stop'
if ($javaExit -ne 0 -or $javaVersion -notmatch 'version "21\.') { throw 'JAVA_HOME must identify a working JDK 21.' }
$sdk = Resolve-Input 'ANDROID_HOME' 'work/toolchain/android-sdk'
if ($env:ANDROID_SDK_ROOT -and [IO.Path]::GetFullPath($env:ANDROID_SDK_ROOT) -ine $sdk) {
    throw 'ANDROID_HOME and ANDROID_SDK_ROOT disagree; supply one explicit SDK.'
}
foreach ($part in @('platforms/android-35/android.jar','platforms/android-36/android.jar','build-tools/36.0.0/aapt2.exe','build-tools/36.0.0/d8.bat','licenses/android-sdk-license')) {
    if (-not (Test-Path -LiteralPath (Join-Path $sdk $part))) { throw "Android SDK input missing $part. Set process ANDROID_HOME; see docs/DEVELOPMENT.md." }
}
$python = Resolve-Input 'MORPHE_TASK_PYTHON' 'work/toolchain/python/python.exe'
if (-not (Test-Path -LiteralPath $python)) { throw 'Python 3.12 missing. Set process MORPHE_TASK_PYTHON to python.exe.' }
$ErrorActionPreference = 'Continue'
$pythonVersion = & $python -c 'import sys; print(str(sys.version_info.major)+chr(46)+str(sys.version_info.minor))' 2>&1 | Out-String
$pythonExit = $LASTEXITCODE
$ErrorActionPreference = 'Stop'
if ($pythonExit -ne 0 -or $pythonVersion.Trim() -ne '3.12') { throw 'MORPHE_TASK_PYTHON must identify Python 3.12.' }
$robolectric = Resolve-Input 'MORPHE_ROBOLECTRIC_DIR' 'work/toolchain/robolectric'
foreach ($v in @('9-robolectric-4913185-2-i7','13-robolectric-9030017-i7','15-robolectric-12650502-i7')) {
    if (-not (Test-Path -LiteralPath (Join-Path $robolectric "android-all-instrumented-$v.jar"))) { throw "Robolectric SDK jar missing: $v. See docs/DEVELOPMENT.md." }
}
$gradleHome = Resolve-Input 'GRADLE_USER_HOME' 'work/gradle-home'
if ($gradleHome.Substring(0,3) -ine 'E:\') { throw 'GRADLE_USER_HOME is writable and must be on E:.' }
$mavenLocal = Resolve-Input 'MORPHE_MAVEN_LOCAL' 'work/maven-local'
# External Maven input is opt-in, read by Gradle; never populated or cleaned here.
if ($env:MORPHE_MAVEN_LOCAL -and -not (Test-Path -LiteralPath $mavenLocal -PathType Container)) { throw 'Explicit MORPHE_MAVEN_LOCAL does not exist.' }
# Morphe 2.0.0 eagerly reads both settings even when Gradle is offline.
# Private properties may satisfy either value; never print or copy their contents.
$packageUser = -not [string]::IsNullOrWhiteSpace($env:GITHUB_ACTOR)
$packageToken = -not [string]::IsNullOrWhiteSpace($env:GITHUB_TOKEN)
foreach ($props in @((Join-Path $repo 'gradle.properties'), (Join-Path $gradleHome 'gradle.properties'))) {
    if (Test-Path -LiteralPath $props) {
        foreach ($line in [IO.File]::ReadLines($props)) {
            if ($line -match '^\s*gpr\.user\s*[=:]\s*\S+') { $packageUser = $true }
            if ($line -match '^\s*gpr\.key\s*[=:]\s*\S+') { $packageToken = $true }
        }
    }
}
if (-not $packageUser -or -not $packageToken) {
    throw 'Morphe package settings missing: supply process GITHUB_ACTOR/GITHUB_TOKEN or private gpr.user/gpr.key. Offline cached runs still need explicit nonempty placeholders; these do not authenticate online. See docs/DEVELOPMENT.md.'
}
foreach ($name in @('HTTP_PROXY','HTTPS_PROXY')) {
    $proxyValue = [Environment]::GetEnvironmentVariable($name, 'Process')
    if ($proxyValue) {
        $proxyUri = $null
        if (-not [Uri]::TryCreate($proxyValue,[UriKind]::Absolute,[ref]$proxyUri) -or $proxyUri.Scheme -notin @('http','https') -or -not $proxyUri.Host -or $proxyUri.UserInfo) {
            throw 'Proxy must be an explicit http(s) host/port URI without embedded credentials.'
        }
    }
}
$dirs = @{
    Temp = (Join-Path $repo 'work/temp'); TestTemp = (Join-Path $repo 'work/test-temp')
    AndroidUser = (Resolve-Input 'ANDROID_USER_HOME' 'work/android-user-home'); Pycache = (Join-Path $repo 'work/pycache')
}
if ($dirs.AndroidUser.Substring(0,3) -ine 'E:\') { throw 'ANDROID_USER_HOME is writable and must be on E:.' }
foreach ($dir in @($dirs.Values) + @($gradleHome)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
$env:JAVA_HOME = $jdk
$env:ANDROID_HOME = $sdk
$env:ANDROID_SDK_ROOT = $sdk
$env:MORPHE_TASK_PYTHON = $python
$env:MORPHE_MAVEN_LOCAL = $mavenLocal
$env:MORPHE_ROBOLECTRIC_DIR = $robolectric
$env:GRADLE_USER_HOME = $gradleHome
$env:TEMP = $dirs.Temp
$env:TMP = $dirs.Temp
$env:MORPHE_TEST_TEMP = $dirs.TestTemp
$env:ANDROID_USER_HOME = $dirs.AndroidUser
$env:PYTHONPYCACHEPREFIX = $dirs.Pycache
$env:PYTHONUTF8 = '1'
$env:PYTHONIOENCODING = 'utf-8'
$env:Path = "$jdk/bin;$(Split-Path -Parent $python);$sdk/platform-tools;$sdk/build-tools/36.0.0;$env:Path"
Set-Location -LiteralPath $repo
# Only approved tool paths; no arbitrary environment values, proxy strings or credentials.
[pscustomobject]@{ Repository=$repo; Python=$python; Java=$jdk; AndroidSdk=$sdk;
    GradleHome=$gradleHome; MavenLocal=$mavenLocal; Robolectric=$robolectric; Temp=$dirs.Temp }
