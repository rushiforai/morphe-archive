[CmdletBinding()]
param()
. "$PSScriptRoot/common.ps1"

$config = Get-Content -Raw (Get-ProjectPath 'config/toolchain.json') | ConvertFrom-Json
$toolsDirectory = Get-ProjectPath '.local/tools'
New-Item -ItemType Directory -Path $toolsDirectory -Force | Out-Null
foreach ($tool in @($config.morpheDesktop, $config.jadx)) {
    $destination = Join-Path $toolsDirectory $tool.file
    if (-not (Test-Path -LiteralPath $destination)) {
        Invoke-WebRequest -Uri $tool.url -OutFile $destination
    }
    $actual = (Get-FileHash -LiteralPath $destination -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($actual -ne $tool.sha256) {
        throw "SHA-256 mismatch for $($tool.file). Remove this file and rerun."
    }
    Write-Host "Verified $($tool.file)"
}
$jadxDirectory = Join-Path $toolsDirectory "jadx-$($config.jadx.version)"
if (-not (Test-Path -LiteralPath (Join-Path $jadxDirectory 'bin/jadx.bat'))) {
    Expand-Archive -LiteralPath (Join-Path $toolsDirectory $config.jadx.file) -DestinationPath $jadxDirectory
}
