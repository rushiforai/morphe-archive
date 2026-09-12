[CmdletBinding()]
param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$GradleArguments = @(':patches:buildAndroid', ':patches:generatePatchesList', '--no-daemon')
)

$ErrorActionPreference = 'Stop'
$projectRoot = (Resolve-Path -LiteralPath $PSScriptRoot).Path
$envFile = Join-Path $projectRoot '.env'

if (-not (Test-Path -LiteralPath $envFile -PathType Leaf)) {
    throw 'Missing .env. Copy .env.example to .env and insert a replacement GitHub token with read:packages access.'
}

foreach ($line in Get-Content -LiteralPath $envFile) {
    $trimmed = $line.Trim()
    if (-not $trimmed -or $trimmed.StartsWith('#')) { continue }

    $separator = $trimmed.IndexOf('=')
    if ($separator -lt 1) { throw "Invalid .env entry: $trimmed" }

    $name = $trimmed.Substring(0, $separator).Trim()
    $value = $trimmed.Substring($separator + 1).Trim()
    if ($value.Length -ge 2 -and (($value[0] -eq '"' -and $value[-1] -eq '"') -or ($value[0] -eq "'" -and $value[-1] -eq "'"))) {
        $value = $value.Substring(1, $value.Length - 2)
    }

    if ($name -notin @('GITHUB_ACTOR', 'GITHUB_TOKEN')) {
        throw "Unsupported .env variable: $name"
    }

    [Environment]::SetEnvironmentVariable($name, $value, 'Process')
}

if (-not $env:GITHUB_ACTOR -or -not $env:GITHUB_TOKEN) {
    throw '.env must define GITHUB_ACTOR and GITHUB_TOKEN.'
}

& (Join-Path $projectRoot 'gradlew.bat') @GradleArguments
exit $LASTEXITCODE
