$ErrorActionPreference='Stop'
$app=Split-Path -Parent $PSScriptRoot
$paths=@()
foreach($mode in @('lyrics','defaults','addon-first','official-first')){
    $folder=Join-Path $PSScriptRoot "scratch\categories-release-$mode"
    $report=Get-Content -Raw -LiteralPath (Join-Path $folder 'verification.json') | ConvertFrom-Json
    $target=[System.IO.Path]::GetFullPath((Join-Path $folder 'verified-unsigned.apk'))
    if($report.outputUnsignedApk -ne $target){throw "Unexpected output for $mode"}
    if((Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash.ToLowerInvariant() -ne $report.outputUnsignedApkSha256){throw "Changed output for $mode"}
    $paths+=$target
}
$manifest=Join-Path $PSScriptRoot 'categories-release-entry-manifest.txt'
if(Test-Path -LiteralPath $manifest){throw 'Audit manifest already exists; inspect prior evidence'}
[System.IO.File]::WriteAllLines($manifest,$paths,[System.Text.UTF8Encoding]::new($false))
& "$app\verify-stable.ps1" 'auditModelEntry' '-x' 'verifyBundle' "-PauditManifest=$manifest" *> "$PSScriptRoot\categories-release-entry-audit.log"
if($LASTEXITCODE -ne 0){Get-Content -LiteralPath "$PSScriptRoot\categories-release-entry-audit.log" -Tail 25;throw 'Native category output audit failed'}
Get-Content -LiteralPath "$PSScriptRoot\categories-release-entry-audit.log" -Tail 15
