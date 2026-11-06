[CmdletBinding()]
param([switch] $Clean)
. "$PSScriptRoot/common.ps1"

$sdk = Get-AndroidSdk
$env:ANDROID_HOME = $sdk
$arguments = @(':patches:buildAndroid', ':patches:generatePatchesList', ':extensions:twitch:testDebugUnitTest', '--console=plain', '--no-daemon')
if ($Clean) { $arguments = @('clean') + $arguments }
Push-Location $script:ProjectRoot
try {
    & (Get-ProjectPath 'gradlew.bat') @arguments
    if ($LASTEXITCODE -ne 0) {
        throw 'Gradle failed. For plugin resolution errors, check GitHub Packages authentication.'
    }
    $bundle = Get-BundlePath
    Write-Host "Bundle: $bundle"
    Write-Host "SHA-256: $((Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash)"
} finally { Pop-Location }
