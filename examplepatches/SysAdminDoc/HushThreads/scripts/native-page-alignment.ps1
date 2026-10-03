function Get-NativePageFacts {
    param(
        [Parameter(Mandatory = $true)][string]$Apk,
        [Parameter(Mandatory = $true)][string]$Java,
        [Parameter(Mandatory = $true)][string]$Aapt2,
        [Parameter(Mandatory = $true)][string]$ReportPath,
        [Parameter(Mandatory = $true)][bool]$ExtractNativeLibs
    )
    $Apk = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Apk)
    $ReportPath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($ReportPath)
    if (Test-Path -LiteralPath $ReportPath) { throw "Native report already exists: $ReportPath" }
    $preference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        $output = @(& $Java (Join-Path $PSScriptRoot 'NativePageCheck.java') $Apk $ReportPath 2>&1)
        $code = $LASTEXITCODE
    } finally { $ErrorActionPreference = $preference }
    if ($code -ne 0 -or -not (Test-Path -LiteralPath $ReportPath -PathType Leaf)) {
        throw "Native ELF inspection failed (exit $code): $($output -join ' ')"
    }
    $document = [IO.File]::ReadAllText($ReportPath) | ConvertFrom-Json
    if ($null -eq $document.PSObject.Properties['libraries']) { throw 'Native inspection returned no library list.' }
    $libraries = @($document.libraries)
    $uncompressed = @($libraries | Where-Object { -not $_.compressed })
    $zipAligned = $null
    if ($uncompressed.Count -gt 0) {
        $zipalign = Join-Path (Split-Path -Parent $Aapt2) $(if ($IsWindows -or $env:OS -eq 'Windows_NT') { 'zipalign.exe' } else { 'zipalign' })
        if (-not (Test-Path -LiteralPath $zipalign -PathType Leaf)) { throw "No zipalign beside aapt2: $zipalign" }
        try {
            $ErrorActionPreference = 'Continue'
            $zipOutput = @(& $zipalign -c -P 16 -v 4 $Apk 2>&1)
            $zipCode = $LASTEXITCODE
        } finally { $ErrorActionPreference = $preference }
        if (($zipCode -eq 0 -and ($zipOutput -join ' ') -notmatch 'Verification successful') -or
            ($zipCode -ne 0 -and ($zipOutput -join ' ') -notmatch 'Verification FAILED')) {
            throw "zipalign could not complete its 16 KB check (exit $zipCode): $($zipOutput -join ' ')"
        }
        $zipAligned = $zipCode -eq 0
        [IO.File]::WriteAllLines($ReportPath + '.zipalign.txt', [string[]]$zipOutput)
    }
    $facts = [pscustomobject][ordered]@{
        extractNativeLibs = $ExtractNativeLibs
        libraries = $libraries
        zipAligned = $zipAligned
    }
    [IO.File]::WriteAllText($ReportPath, ($facts | ConvertTo-Json -Depth 8), [Text.UTF8Encoding]::new($false))
    return $facts
}

function Get-NativePageDelta {
    param([Parameter(Mandatory = $true)]$Stock, [Parameter(Mandatory = $true)]$Patched)
    foreach ($facts in @($Stock, $Patched)) {
        if ($facts.extractNativeLibs -isnot [bool] -or $null -eq $facts.PSObject.Properties['libraries'] -or
            $null -eq $facts.PSObject.Properties['zipAligned']) { throw 'Incomplete native alignment facts.' }
        $names = [Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
        foreach ($library in @($facts.libraries)) {
            if (-not $library.path -or -not $names.Add([string]$library.path) -or $library.sha256 -notmatch '^[0-9a-f]{64}$' -or
                $library.compressed -isnot [bool] -or $library.elfAligned -isnot [bool] -or @($library.loadAlignments).Count -eq 0) {
                throw 'Incomplete or duplicate native library facts.'
            }
            $aligned = $true
            foreach ($value in @($library.loadAlignments)) {
                $alignment = [long]$value
                if ($alignment -le 0 -or ($alignment -band ($alignment - 1)) -ne 0) { throw 'Invalid recorded ELF alignment.' }
                if ($alignment -lt 16384) { $aligned = $false }
            }
            if ($aligned -ne $library.elfAligned) { throw 'Recorded ELF verdict disagrees with its segments.' }
        }
        if (@($facts.libraries | Where-Object { -not $_.compressed }).Count -gt 0) {
            if ($facts.zipAligned -isnot [bool]) { throw 'Missing uncompressed native ZIP verdict.' }
        } elseif ($null -ne $facts.zipAligned) { throw 'ZIP verdict claimed without uncompressed native entries.' }
    }
    $defects = [Collections.Generic.List[string]]::new()
    $vendor = [Collections.Generic.List[string]]::new()
    $original = [Collections.Generic.Dictionary[string,object]]::new([StringComparer]::Ordinal)
    foreach ($library in @($Stock.libraries)) { $original[$library.path] = $library }
    $remaining = [Collections.Generic.HashSet[string]]::new([string[]]@($original.Keys), [StringComparer]::Ordinal)
    foreach ($library in @($Patched.libraries)) {
        $source = $original[$library.path]
        if ($null -eq $source -or $source.sha256 -cne $library.sha256) { $defects.Add("Native payload changed: $($library.path)") }
        else {
            if (($source.loadAlignments -join ',') -cne ($library.loadAlignments -join ',')) { throw 'Identical native bytes have inconsistent segment evidence.' }
            if (-not $library.elfAligned) { $vendor.Add($library.path) }
        }
        [void]$remaining.Remove($library.path)
        if (-not $Patched.extractNativeLibs -and $library.compressed -and $library.path -cmatch '^lib/[^/]+/[^/]+\.so$') {
            $defects.Add("Compressed library with extractNativeLibs=false: $($library.path)")
        }
    }
    foreach ($path in $remaining) { $defects.Add("Native payload removed: $path") }
    if ($Stock.extractNativeLibs -ne $Patched.extractNativeLibs) { $defects.Add('Native extraction policy changed.') }
    if (-not $Patched.extractNativeLibs -and @($Patched.libraries | Where-Object { -not $_.compressed }).Count -gt 0 -and $Patched.zipAligned -ne $true) {
        $defects.Add('Uncompressed native entries failed zipalign -c -P 16 -v 4.')
    }
    return [pscustomobject][ordered]@{
        pageSizeBytes = 16384
        stock = $Stock
        patched = $Patched
        vendorElfIncompatibilities = @($vendor | Sort-Object -CaseSensitive)
        packagingDefects = @($defects | Sort-Object -CaseSensitive)
        alignmentCompatible = $vendor.Count -eq 0 -and $defects.Count -eq 0
    }
}

function Align-UnsignedNativeApk {
    param([Parameter(Mandatory = $true)][string]$Apk, [Parameter(Mandatory = $true)][string]$Aapt2,
        [Parameter(Mandatory = $true)][string]$Java, [Parameter(Mandatory = $true)]$Facts)
    if (@($Facts.libraries | Where-Object { -not $_.compressed }).Count -eq 0) { return }
    $Apk = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Apk)
    $aligned = Join-Path (Split-Path -Parent $Apk) ([guid]::NewGuid().ToString('N') + '.aligned.apk')
    $prepared = Join-Path (Split-Path -Parent $Apk) ([guid]::NewGuid().ToString('N') + '.prepared.apk')
    $zipalign = Join-Path (Split-Path -Parent $Aapt2) $(if ($IsWindows -or $env:OS -eq 'Windows_NT') { 'zipalign.exe' } else { 'zipalign' })
    if (-not (Test-Path -LiteralPath $zipalign -PathType Leaf)) { throw "No zipalign beside aapt2: $zipalign" }
    $preference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        $output = @(& $Java (Join-Path $PSScriptRoot 'PrepareNativeZip.java') $Apk $prepared 2>&1)
        if ($LASTEXITCODE -ne 0) { throw "Native ZIP preparation failed: $($output -join ' ')" }
        $output = @(& $zipalign -f -P 16 -v 4 $prepared $aligned 2>&1)
        if ($LASTEXITCODE -ne 0) { throw "Native ZIP alignment failed: $($output -join ' ')" }
        $output = @(& $zipalign -c -P 16 -v 4 $aligned 2>&1)
        if ($LASTEXITCODE -ne 0 -or ($output -join ' ') -notmatch 'Verification successful') { throw 'Aligned APK failed the independent ZIP check.' }
        Move-Item -LiteralPath $aligned -Destination $Apk -Force -ErrorAction Stop
    } finally {
        $ErrorActionPreference = $preference
        if (Test-Path -LiteralPath $aligned) { Remove-Item -LiteralPath $aligned -Force }
        if (Test-Path -LiteralPath $prepared) { Remove-Item -LiteralPath $prepared -Force }
    }
}
