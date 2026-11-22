$ErrorActionPreference = 'Stop'

$portableJdk = Join-Path (Split-Path -Parent $PSScriptRoot) '.tools\temurin21\jdk-21.0.12.1+1'
if (Test-Path -LiteralPath (Join-Path $portableJdk 'bin\java.exe')) {
    $env:JAVA_HOME = $portableJdk
} elseif (-not $env:JAVA_HOME) {
    throw 'JDK 21 is required. Set JAVA_HOME before running this script.'
}

$gradleHome = Join-Path $PSScriptRoot '.gradle-home'
New-Item -ItemType Directory -Force -Path $gradleHome | Out-Null
$env:GRADLE_USER_HOME = $gradleHome

$tempDir = Join-Path $PSScriptRoot '.gradle-tmp'
New-Item -ItemType Directory -Force -Path $tempDir | Out-Null
$env:TEMP = $tempDir
$env:TMP = $tempDir
$env:JAVA_TOOL_OPTIONS = "-Djdk.net.unixdomain.tmpdir=$tempDir"

& (Join-Path $PSScriptRoot 'gradlew.bat') ':patches:buildAndroid' '--no-daemon'
exit $LASTEXITCODE
