$ErrorActionPreference='Stop'
$project=Split-Path -Parent $PSScriptRoot
$env:JAVA_HOME='C:\Program Files\Java\jdk-23.0.1'
$env:ANDROID_HOME='C:\Users\hp\AppData\Local\Android\Sdk'
Push-Location (Join-Path $project 'patches')
try {
    $env:GITHUB_TOKEN=(& 'C:\Program Files\GitHub CLI\gh.exe' auth token)
    $env:GITHUB_ACTOR=(& 'C:\Program Files\GitHub CLI\gh.exe' api user --jq .login)
    & .\gradlew.bat --offline --no-daemon buildAndroid
    if($LASTEXITCODE -ne 0){throw 'Morphe bundle compilation failed'}
} finally {
    Remove-Item Env:\GITHUB_TOKEN -ErrorAction SilentlyContinue
    Pop-Location
}
