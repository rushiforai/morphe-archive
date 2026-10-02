<#
.SYNOPSIS
    Sign device-only APKs and check their certificates without converting or copying keys.
#>

function Resolve-ApkSigningTools {
    param([string]$Root, [string]$Sdk, [string]$KeystoreType)

    $buildTools = Get-ChildItem -LiteralPath (Join-Path $Sdk 'build-tools') -Directory |
        Sort-Object { [version]($_.Name -replace '[^0-9.].*$', '') } -Descending |
        Select-Object -First 1
    if (-not $buildTools) { throw "No build-tools under $Sdk." }
    $signerJar = Join-Path $buildTools.FullName 'lib/apksigner.jar'
    if (-not (Test-Path -LiteralPath $signerJar -PathType Leaf)) { throw "No apksigner.jar under $($buildTools.FullName)." }
    $classPath = $signerJar
    if ($KeystoreType -eq 'BKS') {
        $pin = Get-Content -LiteralPath (Join-Path $Root 'gradle/libs.versions.toml') |
            Where-Object { $_ -match '^bouncycastle\s*=\s*"([^"]+)"' } | Select-Object -First 1
        if (-not $pin -or $pin -notmatch '^bouncycastle\s*=\s*"([^"]+)"') { throw 'No Bouncy Castle version pin.' }
        $version = $Matches[1]
        $artifactName = "bcprov-jdk18on-$version.jar"
        [xml]$metadata = Get-Content -LiteralPath (Join-Path $Root 'gradle/verification-metadata.xml') -Raw
        $hashes = @($metadata.SelectNodes("//*[local-name()='component' and @group='org.bouncycastle' and @name='bcprov-jdk18on' and @version='$version']/*[local-name()='artifact' and @name='$artifactName']/*[local-name()='sha256']") |
            ForEach-Object { $_.value.ToLowerInvariant() })
        if ($hashes.Count -eq 0) { throw "No verified checksum for $artifactName." }
        $gradleHome = if ($env:GRADLE_USER_HOME) { $env:GRADLE_USER_HOME } else { Join-Path $HOME '.gradle' }
        $cache = Join-Path $gradleHome "caches/modules-2/files-2.1/org.bouncycastle/bcprov-jdk18on/$version"
        $provider = $null
        foreach ($candidate in @(Get-ChildItem -LiteralPath $cache -Recurse -Filter $artifactName -File -ErrorAction SilentlyContinue)) {
            $providerHash = [Security.Cryptography.SHA256]::Create()
            $providerStream = [IO.File]::OpenRead($candidate.FullName)
            try { $checksum = [BitConverter]::ToString($providerHash.ComputeHash($providerStream)).Replace('-', '').ToLowerInvariant() }
            finally { $providerStream.Dispose(); $providerHash.Dispose() }
            if ($checksum -in $hashes) {
                $provider = $candidate.FullName
                break
            }
        }
        if (-not $provider) { throw "No checksum-verified $artifactName in the Gradle cache. Resolve the project's dependencies first." }
        $classPath += [IO.Path]::PathSeparator + $provider
    }
    return [pscustomobject]@{
        BuildTools = $buildTools.FullName
        ClassPath = $classPath
        Checker = Join-Path $Root 'scripts/SigningCertificateCheck.java'
    }
}

function New-ApkSigningSession {
    param(
        [Collections.IDictionary]$BoundParameters,
        [string]$Root, [string]$Sdk, [string]$Java, [string]$Keystore, [string]$KeyAlias,
        [string]$KeystoreType
    )

    $variables = [Environment]::GetEnvironmentVariables([EnvironmentVariableTarget]::Process)
    if ($BoundParameters.ContainsKey('KeystorePassword')) { $storePassword = [string]$BoundParameters['KeystorePassword'] }
    elseif ($variables.Contains('HUSHFEED_SIDELOAD_KEYSTORE_PASSWORD')) { $storePassword = [string]$variables['HUSHFEED_SIDELOAD_KEYSTORE_PASSWORD'] }
    else { $storePassword = 'sideload' }
    if ($BoundParameters.ContainsKey('KeyPassword')) { $entryPassword = [string]$BoundParameters['KeyPassword'] }
    elseif ($variables.Contains('HUSHFEED_SIDELOAD_KEY_PASSWORD')) { $entryPassword = [string]$variables['HUSHFEED_SIDELOAD_KEY_PASSWORD'] }
    else { $entryPassword = $storePassword }
    $tools = Resolve-ApkSigningTools -Root $Root -Sdk $Sdk -KeystoreType $KeystoreType
    $session = [pscustomobject]@{
        Java = $Java; Tools = $tools; Keystore = $Keystore; KeyAlias = $KeyAlias; KeystoreType = $KeystoreType
        StorePasswordSpec = 'pass:'; EntryPasswordSpec = 'pass:'; Environment = @{}; Certificate = $null
    }
    $preference = $ErrorActionPreference
    try {
        foreach ($entry in @(
            @{ Value = $storePassword; Property = 'StorePasswordSpec' }
            @{ Value = $entryPassword; Property = 'EntryPasswordSpec' }
        )) {
            if ($entry.Value.Length -eq 0) { continue }
            $name = 'HUSHFEED_SIGNING_' + [Guid]::NewGuid().ToString('N')
            $session.Environment[$name] = [Environment]::GetEnvironmentVariable($name, [EnvironmentVariableTarget]::Process)
            [Environment]::SetEnvironmentVariable($name, $entry.Value, [EnvironmentVariableTarget]::Process)
            $session.($entry.Property) = "env:$name"
        }
        $type = if ($KeystoreType) { $KeystoreType } else { 'default' }
        $ErrorActionPreference = 'Continue'
        $output = @(& $Java --class-path $tools.ClassPath $tools.Checker key $Keystore $KeyAlias $type `
            $session.StorePasswordSpec $session.EntryPasswordSpec 2>&1)
        $status = $LASTEXITCODE
        $ErrorActionPreference = $preference
        if ($status -ne 0 -or $output.Count -ne 1 -or [string]$output[0] -notmatch '^[a-f0-9]{64}$') {
            throw 'Could not unlock the signing key. Check its type, alias, and passwords.'
        }
        $session.Certificate = [string]$output[0]
        return $session
    } catch {
        Close-ApkSigningSession -Session $session
        throw
    } finally { $ErrorActionPreference = $preference }
}

function Close-ApkSigningSession {
    param($Session)
    if (-not $Session) { return }
    foreach ($name in $Session.Environment.Keys) {
        $previous = $Session.Environment[$name]
        # PowerShell coerces $null to an empty string for this overload. On recent .NET,
        # that creates a present empty variable; NullString removes an absent original.
        if ($null -eq $previous) { $previous = [NullString]::Value }
        [Environment]::SetEnvironmentVariable($name, $previous, [EnvironmentVariableTarget]::Process)
    }
}

function Get-ApkSigningCertificate {
    param($Session, [string]$Apk)
    $preference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        $output = @(& $Session.Java --class-path $Session.Tools.ClassPath $Session.Tools.Checker apk $Apk 2>&1)
        $status = $LASTEXITCODE
    } finally { $ErrorActionPreference = $preference }
    if ($status -ne 0 -or $output.Count -ne 1 -or [string]$output[0] -notmatch '^[a-f0-9]{64}(,[a-f0-9]{64})*$') {
        throw 'Could not verify the APK signing certificate.'
    }
    return [string]$output[0]
}

function Invoke-ApkSigning {
    param($Session, [string]$InputApk, [string]$OutputApk)
    $arguments = @('--class-path', $Session.Tools.ClassPath, 'com.android.apksigner.ApkSignerTool',
        'sign', '--ks', $Session.Keystore, '--ks-pass', $Session.StorePasswordSpec,
        '--ks-key-alias', $Session.KeyAlias, '--key-pass', $Session.EntryPasswordSpec,
        '--min-sdk-version', '23', '--out', $OutputApk)
    if ($Session.KeystoreType) { $arguments += @('--ks-type', $Session.KeystoreType) }
    if ($Session.KeystoreType -eq 'BKS') {
        $arguments += @('--ks-provider-class', 'org.bouncycastle.jce.provider.BouncyCastleProvider')
    }
    $arguments += $InputApk
    $preference = $ErrorActionPreference
    $verified = $false
    try {
        $ErrorActionPreference = 'Continue'
        $output = @(& $Session.Java @arguments 2>&1)
        $status = $LASTEXITCODE
        $ErrorActionPreference = $preference
        if ($status -ne 0) { throw 'APK signing failed. Check the signing key and passwords.' }
        if ((Get-ApkSigningCertificate -Session $Session -Apk $OutputApk) -ne $Session.Certificate) {
            throw 'The signed APK does not match the requested signing certificate.'
        }
        $verified = $true
    } finally {
        $ErrorActionPreference = $preference
        if (-not $verified -and (Test-Path -LiteralPath $OutputApk -PathType Leaf)) {
            Remove-Item -LiteralPath $OutputApk -Force
        }
    }
}
