$ErrorActionPreference='Stop'
$project=Split-Path -Parent $PSScriptRoot
$env:JAVA_HOME='C:\Program Files\Java\jdk-23.0.1'
$env:ANDROID_HOME='C:\Users\hp\AppData\Local\Android\Sdk'
& (Join-Path $PSScriptRoot 'Build-LauncherIcons.ps1') -SdkPath $env:ANDROID_HOME
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

$versionLine=Get-Content -LiteralPath (Join-Path $project 'patches\gradle.properties') | Where-Object { $_ -match '^version\s*=' } | Select-Object -First 1
$version=($versionLine -split '=',2)[1].Trim()
$output=Join-Path $project 'outputs'
New-Item -ItemType Directory -Force -Path $output | Out-Null
$artifact=Join-Path $output "MyZong-$version.mpp"
Copy-Item -LiteralPath (Join-Path $project "patches\patches\build\libs\patches-$version.mpp") -Destination $artifact -Force
$checksum=(Get-FileHash -LiteralPath $artifact -Algorithm SHA256).Hash.ToLowerInvariant()
[IO.File]::WriteAllText((Join-Path $output 'SHA256SUMS.txt'),"$checksum  MyZong-$version.mpp"+[Environment]::NewLine,[Text.Encoding]::ASCII)
Write-Host "Bundle: $artifact"
