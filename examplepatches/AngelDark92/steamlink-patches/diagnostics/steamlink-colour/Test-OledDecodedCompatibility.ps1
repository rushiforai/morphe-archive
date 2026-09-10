[CmdletBinding()]
param(
    [string]$JavaHome = $env:JAVA_HOME,
    [string]$GradleUserHome = $(if ($env:GRADLE_USER_HOME) { $env:GRADLE_USER_HOME } else { Join-Path $env:USERPROFILE '.gradle' })
)
$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '../..')).Path
if ($JavaHome) { $java = Join-Path $JavaHome 'bin/java.exe' }
else { $java = (Get-Command java -ErrorAction Stop).Source }
if (-not (Test-Path -LiteralPath $java)) { throw 'Java not found; pass -JavaHome pointing to a JDK 21 installation.' }
$compiler = Get-ChildItem -LiteralPath (Join-Path $GradleUserHome 'wrapper/dists') -Filter 'kotlin-compiler-embeddable-*.jar' -Recurse |
    Sort-Object FullName | Select-Object -Last 1
if (-not $compiler) { throw 'No cached Gradle Kotlin compiler found. Run Gradle once to download its distribution.' }
$compilerLib = $compiler.DirectoryName
$output = Join-Path $repo ('build/oled-decoded-audit/' + [guid]::NewGuid().ToString('N'))
$null = New-Item -ItemType Directory -Path $output
$source = [IO.File]::ReadAllText((Join-Path $repo 'patches/src/main/kotlin/app/template/patches/steamlink/binary/OledCalibrationPatch.kt'))
$marker = '@Suppress("unused")'
if ($source.IndexOf($marker) -lt 0) { throw 'OLED source boundary changed; update this audit runner.' }
$helpers = $source.Substring(0, $source.IndexOf($marker))
$helpers = $helpers -replace '(?m)^import app\.morphe\.patcher\.patch\.(booleanOption|floatSliderOption|rawResourcePatch|stringOption)\r?\n', ''
$helpers = $helpers -replace '(?m)^import app\.template\.patches\.shared\.Constants\.COMPATIBILITIES_STEAM_LINK\r?\n', ''
[IO.File]::WriteAllText((Join-Path $output 'OledHelpers.kt'), $helpers)
# Only the exception type is shimmed. Every shader/format mutation helper is current production source.
[IO.File]::WriteAllText((Join-Path $output 'PatchException.kt'), 'package app.morphe.patcher.patch; class PatchException(message: String) : RuntimeException(message)')
$classpath = ((Get-ChildItem -LiteralPath $compilerLib -Filter '*.jar').FullName -join ';')
$jar = Join-Path $output 'audit.jar'
& $java -cp "$compilerLib/*" org.jetbrains.kotlin.cli.jvm.K2JVMCompiler -no-stdlib -no-reflect -classpath $classpath -d $jar (Join-Path $output 'OledHelpers.kt') (Join-Path $output 'PatchException.kt') (Join-Path $repo 'patches/src/main/kotlin/util/OledDecodedCompatibilityAudit.kt')
if ($LASTEXITCODE -ne 0) { throw 'OLED helper compilation failed.' }
& $java -Xmx1g -cp "$compilerLib/*;$jar" util.OledDecodedCompatibilityAudit $repo | Tee-Object -FilePath (Join-Path $output 'result.txt')
if ($LASTEXITCODE -ne 0) { throw 'Decoded compatibility audit failed.' }
Write-Host "Report: $output/result.txt"
Write-Host 'This standalone check bypasses the Morphe DSL; it does not build or install an APK.'
