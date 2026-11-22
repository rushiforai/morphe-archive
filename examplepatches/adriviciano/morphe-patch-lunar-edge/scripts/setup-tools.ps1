$ErrorActionPreference = 'Stop'
Set-Location (Split-Path $PSScriptRoot -Parent)
New-Item -ItemType Directory -Force tools | Out-Null

function Get-VerifiedTool($Url, $Destination, $ExpectedHash) {
    if (-not (Test-Path -LiteralPath $Destination)) {
        Invoke-WebRequest $Url -OutFile $Destination
    }
    if ((Get-FileHash -LiteralPath $Destination -Algorithm SHA256).Hash -ne $ExpectedHash) {
        throw "SHA256 inesperado: $Destination"
    }
}

Get-VerifiedTool 'https://github.com/skylot/jadx/releases/download/v1.5.6/jadx-1.5.6.zip' 'tools\jadx.zip' '545EA2BE9C242511BC145755CF4BDA2485ADE42966E096F8B4D3DA2A230E8974'
Get-VerifiedTool 'https://github.com/JetBrains/kotlin/releases/download/v2.4.21/kotlin-compiler-2.4.21.zip' 'tools\kotlin-current.zip' '7CC140E76DAF416A0424A5557F99AFD7CA89EBD463EA1101261E3E01C33E75CD'
Get-VerifiedTool 'https://github.com/MorpheApp/morphe-desktop/releases/download/v2.2.0/morphe-desktop-2.2.0-all.jar' 'tools\morphe-desktop.jar' '5CA0320EE05481DF1AE3AFD2F003BBA3FF994D11D1F66AE48811CED71355E4FE'
if (-not (Test-Path tools\jadx)) { Expand-Archive tools\jadx.zip tools\jadx }
if (-not (Test-Path tools\kotlin-current)) { Expand-Archive tools\kotlin-current.zip tools\kotlin-current }
