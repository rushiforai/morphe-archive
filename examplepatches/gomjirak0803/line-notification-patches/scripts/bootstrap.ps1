$ErrorActionPreference = 'Stop'
python (Join-Path $PSScriptRoot 'bootstrap.py')
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
