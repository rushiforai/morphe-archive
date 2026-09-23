[CmdletBinding()]
param(
    [string]$JavaHome = $env:JAVA_HOME,
    [string]$ToolDirectory,
    [string]$OutputDirectory
)
$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '../..')).Path
if (!$ToolDirectory) { $ToolDirectory = Join-Path $repo 'build/startup-boundary-tools' }
if (!$OutputDirectory) { $OutputDirectory = Join-Path $repo ('build/audit-5002363/compiled-' + [guid]::NewGuid().ToString('N')) }
$java = if ($JavaHome) { Join-Path $JavaHome 'bin/java.exe' } else { (Get-Command java).Source }
$compiler = Get-ChildItem (Join-Path $env:USERPROFILE '.gradle/wrapper/dists') -Recurse -Filter 'kotlin-compiler-embeddable-*.jar' |
    Sort-Object FullName | Select-Object -Last 1
if (!$compiler) { throw 'Cached Kotlin compiler missing.' }
$tools = (Resolve-Path $ToolDirectory).Path
$null = New-Item -ItemType Directory -Force -Path $OutputDirectory
$out = (Resolve-Path $OutputDirectory).Path
$classes = Join-Path $out 'classes'
$tests = Join-Path $out 'test-classes'
$resources = Join-Path $out 'resources'
$null = New-Item -ItemType Directory -Force -Path $classes,$tests,(Join-Path $resources 'extensions')
# Match Gradle's kotlin("test-junit") adapter. The platform console includes
# Jupiter classes, so keep it OFF the compiler classpath to expose CI mismatches.
$dependencies = @('gson.jar','jcommander.jar','junit4.jar','hamcrest-core.jar','kotlin-test-junit.jar','kotlin-test.jar','morphe-desktop-1.13.1-all.jar') |
    ForEach-Object { (Resolve-Path (Join-Path $tools $_)).Path }
$classpath = $dependencies -join ';'
function Invoke-CheckedJava([string[]]$Arguments) {
    $previousPreference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        & $java @Arguments 2>&1 | ForEach-Object { "$_" }
        $exitCode = $LASTEXITCODE
    } finally { $ErrorActionPreference = $previousPreference }
    if ($exitCode -ne 0) { throw "Java failed with exit code $exitCode" }
}
function Compile-Kotlin([string]$SourceDirectory, [string]$Destination, [string[]]$ExtraArguments) {
    $arguments = @('-no-stdlib','-no-reflect','-Xcontext-parameters','-jvm-target','11','-classpath',"$classpath;$classes",'-d',$Destination) + $ExtraArguments
    $arguments += (Get-ChildItem $SourceDirectory -Recurse -Filter '*.kt').FullName
    $argumentFile = Join-Path $Destination 'compiler.args'
    $quoted = $arguments | ForEach-Object { '"' + $_.Replace('\','/').Replace('"','\"') + '"' }
    [IO.File]::WriteAllLines($argumentFile, $quoted)
    Invoke-CheckedJava @('-cp',"$($compiler.DirectoryName)/*",'org.jetbrains.kotlin.cli.jvm.K2JVMCompiler',"@$argumentFile")
}
Compile-Kotlin (Join-Path $repo 'patches/src/main/kotlin') $classes @()
Compile-Kotlin (Join-Path $repo 'patches/src/test/kotlin') $tests @("-Xfriend-paths=$classes")
# Assemble current helper sources. Do not copy extension DEX from an older bundle.
$smali = Join-Path $repo 'patches/src/main/resources/steamlink/androidxr/smali'
$extensionInputs = @{
    'extension.mpe' = @('org/libsdl/app/GxrSdlBridge.smali')
    'minimal-extension.mpe' = @('com/valvesoftware/steamlink/GalaxyXRPermissionActivity.smali','com/valvesoftware/steamlink/GxrOverlayBridge.smali','com/valvesoftware/steamlink/GxrResolutionProbe.smali')
    'battery-extension.mpe' = @('com/valvesoftware/steamlink/GxrBatterySettings.smali')
}
foreach ($name in $extensionInputs.Keys) {
    $arguments = @('-cp',$classpath,'com.android.tools.smali.smali.Main','a','-a','33','-o',(Join-Path $resources "extensions/$name"))
    $arguments += $extensionInputs[$name] | ForEach-Object { Join-Path $smali $_ }
    Invoke-CheckedJava $arguments
}
$runtimeClasspath = "$classes;$resources;$(Join-Path $repo 'patches/src/main/resources');$classpath"
[IO.File]::WriteAllText((Join-Path $out 'runtime-classpath.txt'), $runtimeClasspath)
$consoleLauncher = (Resolve-Path (Join-Path $tools 'junit.jar')).Path
Invoke-CheckedJava @('-cp',"$consoleLauncher;$tests;$(Join-Path $repo 'patches/src/test/resources');$runtimeClasspath",'org.junit.platform.console.ConsoleLauncher','execute','--scan-classpath',"--include-classname=.*Test",'--include-engine=junit-vintage','--fail-if-no-tests','--details=summary',"--reports-dir=$(Join-Path $out 'test-results')")
Write-Host "Compiled current production source and ran JUnit using cached dependencies: $out"
Write-Host 'This bypasses the unresolved Gradle plugin. It is not a Gradle build or device validation.'
