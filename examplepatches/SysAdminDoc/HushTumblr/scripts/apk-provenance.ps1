<# Identity carried from a checked patch run to installation and a release walk. #>
. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'patch-target.ps1')

function Assert-HushApkIdentity {
    param([Parameter(Mandatory)]$Expected, [Parameter(Mandatory)]$Actual)
    foreach ($item in @($Expected, $Actual)) {
        if ($item.sha256 -isnot [string] -or $item.sha256 -cnotmatch '^[0-9a-f]{64}$' -or
            $item.package -isnot [string] -or $item.package -cnotmatch '^[A-Za-z0-9_.]+$' -or
            $item.versionName -isnot [string] -or [string]::IsNullOrWhiteSpace($item.versionName) -or
            "$($item.versionCode)" -cnotmatch '^[1-9][0-9]*$' -or
            $item.signers -isnot [array] -or @($item.signers).Count -ne 1 -or
            $item.signers[0] -isnot [string] -or $item.signers[0] -cnotmatch '^[0-9a-f]{64}$') {
            throw 'APK identity is missing or malformed. Verification refused.'
        }
    }
    foreach ($field in @('sha256', 'package', 'versionName', 'versionCode')) {
        if ([string]$Expected.$field -cne [string]$Actual.$field) { throw "APK $field changed. Verification refused." }
    }
    if (($Expected.signers -join ',') -cne ($Actual.signers -join ',')) { throw 'APK signer changed. Verification refused.' }
}

function Assert-HushApkProvenance {
    param([Parameter(Mandatory)]$Provenance, [Parameter(Mandatory)][string]$BundleSha256,
        [Parameter(Mandatory)][string]$CatalogPath, [switch]$FullSelection)
    if (($Provenance.schema -isnot [int] -and $Provenance.schema -isnot [long]) -or $Provenance.schema -ne 1) {
        throw 'APK provenance schema refused.'
    }
    foreach ($field in @('bundleSha256', 'sourceSha256', 'inputIdentity', 'mergedApkSha256', 'catalogSha256')) {
        if ($Provenance.$field -isnot [string] -or $Provenance.$field -cnotmatch '^[0-9a-f]{64}$') {
            throw "APK provenance $field refused."
        }
    }
    if ($Provenance.bundleSha256 -cne $BundleSha256) { throw 'APK provenance names another bundle. Verification refused.' }
    $catalogHandle = Open-HeldFile -Path $CatalogPath -What 'The walk catalog'
    try {
        if ($Provenance.catalogSha256 -cne (Get-StreamSha256 $catalogHandle)) { throw 'APK provenance names another catalog. Verification refused.' }
        $catalog = Get-Content -LiteralPath (Get-HeldPath $catalogHandle) -Raw | ConvertFrom-Json
        $target = Get-PatchTarget -PatchList $catalog
        Assert-HushApkIdentity -Expected $Provenance.output -Actual $Provenance.output
        if ($Provenance.output.package -cne $target.PackageName -or
            -not (Test-DeclaredBuild -Target $target -VersionName $Provenance.output.versionName -VersionCode $Provenance.output.versionCode)) {
            throw 'APK provenance package or version is not a declared target. Verification refused.'
        }
        $declared = @($catalog.patches | ForEach-Object { [string]$_.name })
        $selected = @($Provenance.patches)
        if ($Provenance.patches -isnot [array] -or $selected.Count -eq 0 -or
            @($selected | Sort-Object -Unique).Count -ne $selected.Count -or
            @($selected | Where-Object { $_ -isnot [string] -or $declared -cnotcontains $_ }).Count -gt 0 -or
            $Provenance.options -isnot [array] -or
            @($Provenance.options | Where-Object { $_ -isnot [string] -or $_ -cnotmatch '^.+:[A-Za-z][A-Za-z0-9_]*=.*$' }).Count -gt 0) {
            throw 'APK provenance patch selection or options refused.'
        }
        if ($FullSelection -and ($selected.Count -ne $declared.Count -or $Provenance.options.Count -ne 0)) {
            throw 'A release walk requires every catalog patch with the bundle defaults. Verification refused.'
        }
    } finally { $catalogHandle.Dispose() }
}

function Write-HushApkProvenance {
    param([Parameter(Mandatory)][string]$Path, [Parameter(Mandatory)]$Provenance)
    $bytes = [Text.Encoding]::UTF8.GetBytes((ConvertTo-Json -InputObject $Provenance -Depth 8) + "`n")
    $stream = [IO.File]::Open($Path, [IO.FileMode]::CreateNew, [IO.FileAccess]::Write, [IO.FileShare]::None)
    try { $stream.Write($bytes, 0, $bytes.Length); $stream.Flush($true) } finally { $stream.Dispose() }
}
