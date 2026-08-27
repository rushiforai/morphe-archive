[CmdletBinding()]
param(
    [string]$JavaHome = 'C:\Program Files\Android\Android Studio\jbr',
    [string]$AndroidSdk = (Join-Path $env:LOCALAPPDATA 'Android\Sdk'),
    [string]$MorpheGradlePluginSource = $env:MORPHE_GRADLE_PLUGIN_SRC,
    [string]$MorphePatcherSource = $env:MORPHE_PATCHER_SRC,
    [string]$GitHubActor = $env:GITHUB_ACTOR
)

$ErrorActionPreference = 'Stop'

$workspace = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
$java = Join-Path $JavaHome 'bin\java.exe'
$gradleWrapper = Join-Path $workspace 'gradlew.bat'

foreach ($requiredPath in @($java, $AndroidSdk, $gradleWrapper)) {
    if (-not (Test-Path -LiteralPath $requiredPath)) {
        throw "Required path does not exist: $requiredPath"
    }
}

$env:JAVA_HOME = $JavaHome
$env:ANDROID_HOME = $AndroidSdk
$env:ANDROID_SDK_ROOT = $AndroidSdk

if (-not [string]::IsNullOrWhiteSpace($MorpheGradlePluginSource)) {
    $env:MORPHE_GRADLE_PLUGIN_SRC = (Resolve-Path -LiteralPath $MorpheGradlePluginSource).Path
}
if (-not [string]::IsNullOrWhiteSpace($MorphePatcherSource)) {
    $env:MORPHE_PATCHER_SRC = (Resolve-Path -LiteralPath $MorphePatcherSource).Path
}

$hasLocalPlugin = -not [string]::IsNullOrWhiteSpace($env:MORPHE_GRADLE_PLUGIN_SRC)
$hasLocalPatcher = -not [string]::IsNullOrWhiteSpace($env:MORPHE_PATCHER_SRC)
if ($hasLocalPlugin -ne $hasLocalPatcher) {
    throw 'Set both Morphe local source paths or neither of them.'
}
if (-not $hasLocalPlugin -and [string]::IsNullOrWhiteSpace($env:MORPHE_PACKAGES_TOKEN)) {
    throw 'Published Morphe dependencies require MORPHE_PACKAGES_TOKEN with read:packages scope, or set both local source paths.'
}
if (-not $hasLocalPlugin -and [string]::IsNullOrWhiteSpace($GitHubActor)) {
    $GitHubActor = (& gh api user --jq .login)
    if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($GitHubActor)) {
        throw 'Published Morphe dependencies require GITHUB_ACTOR or an authenticated GitHub CLI account.'
    }
}
if (-not [string]::IsNullOrWhiteSpace($GitHubActor)) {
    $env:GITHUB_ACTOR = $GitHubActor
}

& $gradleWrapper :patches:buildAndroid
if ($LASTEXITCODE -ne 0) {
    throw 'Morphe patch bundle build failed.'
}

$bundle = Get-ChildItem -LiteralPath (Join-Path $workspace 'patches\build\libs') -Filter '*.mpp' -File |
    Sort-Object LastWriteTime -Descending |
    Select-Object -First 1

if ($null -eq $bundle) {
    throw 'The build completed without producing an MPP bundle.'
}

[pscustomobject]@{
    Bundle = $bundle.FullName
    SHA256 = (Get-FileHash -LiteralPath $bundle.FullName -Algorithm SHA256).Hash
}
