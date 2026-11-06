[CmdletBinding()]
param()
. "$PSScriptRoot/common.ps1"
$env:ANDROID_HOME = Get-AndroidSdk
Push-Location $script:ProjectRoot
try {
    & (Get-ProjectPath 'gradlew.bat') ':patches:test' ':extensions:twitch:testDebugUnitTest' ':patches:buildAndroid' '--console=plain' '--no-daemon'
    if ($LASTEXITCODE -ne 0) { throw 'Feature/DEX tests failed.' }
    $run = New-RunDirectory 'tests'
    $morphe = Get-MorphePath
    & javac '-cp' $morphe '-d' $run (Join-Path $PSScriptRoot 'verification/OriginalAwareVerifier.java') (Join-Path $PSScriptRoot 'verification/OriginalAwareVerifierTest.java')
    if ($LASTEXITCODE -ne 0) { throw 'Verifier tests did not compile.' }
    & java '-cp' "$run;$morphe" 'OriginalAwareVerifierTest'
    if ($LASTEXITCODE -ne 0) { throw 'Verifier tests failed.' }
} finally { Pop-Location }
