param(
    [Parameter(Mandatory)][string]$Apk,
    [Parameter(Mandatory)][string]$Bundle,
    [Parameter(Mandatory)][string]$DesktopJar,
    [Parameter(Mandatory)][string]$BuildTools,
    [Parameter(Mandatory)][string]$OutputDirectory,
    [switch]$ForceVersion
)

# Comprueba el APK original y las dos variantes. No instala ni firma el resultado.
$ErrorActionPreference = 'Stop'
$Apk = (Resolve-Path -LiteralPath $Apk).Path
$Bundle = (Resolve-Path -LiteralPath $Bundle).Path
$DesktopJar = (Resolve-Path -LiteralPath $DesktopJar).Path
New-Item -ItemType Directory -Force -Path $OutputDirectory | Out-Null
$OutputDirectory = (Resolve-Path -LiteralPath $OutputDirectory).Path

$certs = & "$BuildTools/apksigner.bat" verify --print-certs $Apk 2>&1
if ($LASTEXITCODE -ne 0) { throw "Firma APK inválida: $certs" }
$googleCert = '21199d112cece428c82cb0df221da24ff8674c7a982a83a17a970eec43305b4a'
if (($certs -join "`n") -notmatch "Signer #1 certificate SHA-256 digest: $googleCert") {
    throw 'El APK no tiene el certificado esperado de YouTube para Android TV.'
}
$badging = & "$BuildTools/aapt2.exe" dump badging $Apk 2>&1
if ($LASTEXITCODE -ne 0) { throw 'No se pudo leer el APK.' }
$metadata = $badging -join "`n"
if ($metadata -notmatch "(?m)^package: name='com\.google\.android\.youtube\.tv'[^\r\n]*?\bversionName='([^']+)'") {
    throw 'Paquete inesperado.'
}
$version = $Matches[1]
$rows = @()
foreach ($variant in @('normal', 'spoof')) {
    $prefix = Join-Path $OutputDirectory "$version-$variant"
    $argsList = @('-jar', $DesktopJar, 'patch', "--patches=$Bundle", '--validate', '--unsigned',
        "-t=$prefix-work", "-r=$prefix.json", "-o=$prefix-unsigned.apk")
    if ($ForceVersion) { $argsList += '--force' }
    if ($variant -eq 'spoof') { $argsList += @('-e', 'Spoof device') }
    $argsList += $Apk
    & java @argsList *> "$prefix.log"
    $exitCode = $LASTEXITCODE
    if ($exitCode -ne 0) { throw "Falló $variant. Consulta $prefix.log" }
    $result = Get-Content -LiteralPath "$prefix.json" -Raw | ConvertFrom-Json
    if (-not $result.success -or $result.failedPatches.Count -gt 0) {
        throw "Resultado incompleto: $prefix.json"
    }
    $rebuilt = & "$BuildTools/aapt2.exe" dump badging "$prefix-unsigned.apk" 2>&1
    if ($LASTEXITCODE -ne 0 -or ($rebuilt -join "`n") -notmatch "package: name='app.tvpatches.android.youtube.tv'") {
        throw "El paquete reconstruido no es el esperado: $variant"
    }
    $rows += [pscustomobject]@{ version = $version; variant = $variant; success = $true
        appliedPatches = $result.appliedPatches; runtimeTested = $false }
    Write-Output "Correcto: $version / $variant"
}
[pscustomobject]@{ originalApkSha256 = (Get-FileHash -LiteralPath $Apk -Algorithm SHA256).Hash
    forcedVersion = [bool]$ForceVersion; results = $rows } |
    ConvertTo-Json -Depth 6 | Set-Content -LiteralPath (Join-Path $OutputDirectory "$version-summary.json") -Encoding utf8
