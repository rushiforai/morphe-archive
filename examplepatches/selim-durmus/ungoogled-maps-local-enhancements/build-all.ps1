param(
    [Parameter(Mandatory=$true)][string]$RecoveryRoot,
    [ValidateSet("stock","baseline")][string]$From = "stock",
    [string]$Output,
    [switch]$VerifyOffline
)
$ErrorActionPreference = "Stop"
$kitRoot = (Resolve-Path -LiteralPath $RecoveryRoot).Path
$pythonPath = Join-Path $kitRoot "python\python.exe"
if (!(Test-Path -LiteralPath $pythonPath)) { throw "Missing recovery Python: $pythonPath" }
$buildArgs = @((Join-Path $PSScriptRoot "build-all.py"), "--recovery-root", $kitRoot, "--from", $From)
if ($Output) { $buildArgs += @("--output", $Output) }
if ($VerifyOffline) { $buildArgs += "--verify-offline" }
& $pythonPath @buildArgs
if ($LASTEXITCODE -ne 0) { throw "Build failed (exit $LASTEXITCODE). See the build output." }
