param(
    [Parameter(Mandatory)][string]$BuildTools,
    [Parameter(Mandatory)][string]$AndroidJar,
    [Parameter(Mandatory)][string]$DebugKeyStore,
    [ValidateSet('com.mixplorer', 'com.mixplorer.beta')][string]$TargetPackage = 'com.mixplorer'
)

$ErrorActionPreference = 'Stop'
$javaHome = $env:JAVA_HOME
if (-not $javaHome) {
    $javaHome = Split-Path (Split-Path (Get-Command javac).Source -Parent) -Parent
}
$build = Join-Path $PSScriptRoot 'build'
New-Item -ItemType Directory -Force -Path "$build\classes", "$build\dex" | Out-Null

function Invoke-Checked {
    param([string]$Executable, [string[]]$Arguments)
    & $Executable @Arguments
    if ($LASTEXITCODE -ne 0) { throw "$Executable failed: $LASTEXITCODE" }
}

Invoke-Checked "$javaHome\bin\javac.exe" @('--release', '8', '-classpath', $AndroidJar, '-d', "$build\classes", "$PSScriptRoot\InternalQueryTest.java")
Invoke-Checked "$javaHome\bin\jar.exe" @('cf', "$build\classes.jar", '-C', "$build\classes", '.')
Invoke-Checked "$BuildTools\d8.bat" @('--lib', $AndroidJar, '--min-api', '30', '--output', "$build\dex", "$build\classes.jar")
Invoke-Checked "$BuildTools\aapt2.exe" @('link', '-o', "$build\unsigned.apk", '-I', $AndroidJar, '--manifest', "$PSScriptRoot\AndroidManifest.xml", '--rename-instrumentation-target-package', $TargetPackage)
Invoke-Checked "$javaHome\bin\jar.exe" @('uf', "$build\unsigned.apk", '-C', "$build\dex", 'classes.dex')
Invoke-Checked "$BuildTools\zipalign.exe" @('-f', '4', "$build\unsigned.apk", "$build\aligned.apk")
Invoke-Checked "$BuildTools\apksigner.bat" @('sign', '--ks', $DebugKeyStore, '--ks-key-alias', 'androiddebugkey', '--ks-pass', 'pass:android', '--out', "$build\internal-query-test.apk", "$build\aligned.apk")
Invoke-Checked "$BuildTools\apksigner.bat" @('verify', "$build\internal-query-test.apk")
Write-Output "Built: $build\internal-query-test.apk"