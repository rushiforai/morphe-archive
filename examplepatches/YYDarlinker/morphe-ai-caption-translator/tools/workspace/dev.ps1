# Daily localization + requested Gradle tasks (default: both unit suites).
[CmdletBinding()]
param([Parameter(ValueFromRemainingArguments=$true)][string[]]$GradleArguments)
$ErrorActionPreference = 'Stop'
$envInfo = . (Join-Path $PSScriptRoot 'Enter-Dev.ps1')
$ErrorActionPreference = 'Continue'
& $envInfo.Python -X utf8 tools/check_localization.py
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
if (-not $GradleArguments) { $GradleArguments = @(':translation-core:testDebugUnitTest',':extensions:extension:testDebugUnitTest') }
& .\gradlew.bat @GradleArguments '-Ptranslation.live=false' --console=plain --no-parallel --no-daemon --init-script (Join-Path $PSScriptRoot 'workspace.init.gradle')
exit $LASTEXITCODE
