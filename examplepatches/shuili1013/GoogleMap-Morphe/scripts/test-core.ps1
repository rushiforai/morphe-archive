param([string]$Studio = 'C:\Program Files\Android\Android Studio', [string]$Java = 'C:\Program Files\Java\jdk-25.0.4', [switch]$Inspect)
$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path $PSScriptRoot -Parent
Push-Location $projectRoot
try {
    $classpath = @(
        (Join-Path $Studio 'plugins\android\lib\smali-dexlib2-3.0.9.jar'),
        (Join-Path $Studio 'lib\intellij.libraries.guava.jar'),
        (Join-Path $Studio 'plugins\android\lib\jsr305-2.0.1.jar')
    ) -join ';'
    New-Item -ItemType Directory -Force analysis/core-build | Out-Null
    $sources = @(Get-ChildItem patch/core/src/main/java -Recurse -Filter *.java | ForEach-Object FullName)
    $sources += @(Get-ChildItem tests/java -Filter *.java | ForEach-Object FullName)
    & (Join-Path $Java 'bin\javac.exe') --release 11 -cp $classpath -d analysis/core-build @sources
    if ($LASTEXITCODE -ne 0) { throw 'Core compilation failed' }
    $main = if ($Inspect) { 'InspectMethods' } else { 'VerifyPatchCore' }
    & (Join-Path $Java 'bin\java.exe') -Xmx2g -cp "analysis/core-build;$classpath" $main
    if ($LASTEXITCODE -ne 0) { throw 'Core verification failed' }
} finally { Pop-Location }
