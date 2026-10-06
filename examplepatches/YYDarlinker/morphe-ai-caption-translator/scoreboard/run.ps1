param([switch]$Live)
$ErrorActionPreference = 'Stop'
$repo = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
$python = (Get-Command python -ErrorAction SilentlyContinue).Source
if (-not $python -or $python -like '*WindowsApps*') {
    $python = Join-Path $env:USERPROFILE '.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe'
}
if (-not (Test-Path -LiteralPath $python)) { throw 'Local Python 3 is required; no download will be attempted.' }
$argsForPython = @((Join-Path $PSScriptRoot 'run.py'))
if ($Live) { $argsForPython += '--live' }
Push-Location $repo
try {
    & $python @argsForPython
    if ($LASTEXITCODE -ne 0) { throw "Scoreboard exited with code $LASTEXITCODE" }
    & $python (Join-Path $PSScriptRoot 'n9.py')
    if ($LASTEXITCODE -ne 0) { throw "N9 evidence mirror exited with code $LASTEXITCODE" }
    & $python (Join-Path $PSScriptRoot 'n10.py')
    if ($LASTEXITCODE -ne 0) { throw "N10 startup mirror exited with code $LASTEXITCODE" }
} finally { Pop-Location }
