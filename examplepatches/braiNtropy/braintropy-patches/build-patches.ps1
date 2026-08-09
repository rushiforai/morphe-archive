$ErrorActionPreference = "Stop"

$githubUser = "braiNtropy"
$githubToken = gh auth token --hostname github.com --user $githubUser
$githubActor = $githubUser

$env:GITHUB_TOKEN = $githubToken
$env:GITHUB_ACTOR = $githubActor

& "$PSScriptRoot\gradlew.bat" buildAndroid @args
exit $LASTEXITCODE
