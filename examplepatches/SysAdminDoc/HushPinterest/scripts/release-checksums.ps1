<# Offline authentication of a bounded, canonical SHA256SUMS.txt payload. #>

function Assert-ReleaseAssetName {
    param([Parameter(Mandatory)][string]$Name)
    if ($Name -cnotmatch '^[A-Za-z0-9][A-Za-z0-9._-]{0,127}$' -or $Name.Contains('..') -or
        $Name.EndsWith('.') -or $Name -match '^(CON|PRN|AUX|NUL|COM[1-9]|LPT[1-9])(\.|$)') {
        throw "Unsafe release asset name: $Name"
    }
}

function Get-ReleaseChecksumFingerprint {
    param([Parameter(Mandatory)][string]$Fingerprint)
    $value = $Fingerprint.Trim().ToUpperInvariant()
    if ($value -cnotmatch '^(?:[0-9A-F]{40}|[0-9A-F]{64})$') {
        throw 'Pin a complete public-key fingerprint, not a key ID.'
    }
    return $value
}

function Get-ReleaseChecksumPath {
    param([Parameter(Mandatory)][string]$Path, [switch]$Directory)
    $absolute = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Path)
    $item = Get-Item -LiteralPath $absolute -Force -ErrorAction Stop
    if ($item.PSIsContainer -ne [bool]$Directory -or ($item.Attributes -band [IO.FileAttributes]::ReparsePoint)) {
        throw 'Release inputs must be ordinary files and directories, not links.'
    }
    return $item.FullName
}

function Get-ReleaseChecksumHash {
    param([Parameter(Mandatory)][string]$Path)
    $pathHere = Get-ReleaseChecksumPath $Path
    $stream = [IO.File]::Open($pathHere, [IO.FileMode]::Open, [IO.FileAccess]::Read, [IO.FileShare]::Read)
    $sha = [Security.Cryptography.SHA256]::Create()
    try { return [BitConverter]::ToString($sha.ComputeHash($stream)).Replace('-', '').ToLowerInvariant() }
    finally { $sha.Dispose(); $stream.Dispose() }
}

function Read-ReleaseChecksumBytes {
    param([Parameter(Mandatory)][string]$Path, [Parameter(Mandatory)][int]$MaximumBytes)
    $absolute = Get-ReleaseChecksumPath $Path
    $stream = [IO.File]::Open($absolute, [IO.FileMode]::Open, [IO.FileAccess]::Read, [IO.FileShare]::Read)
    try {
        if ($stream.Length -lt 1 -or $stream.Length -gt $MaximumBytes) { throw 'Release authentication input exceeds its size bound or is empty.' }
        $bytes = [byte[]]::new([int]$stream.Length)
        $read = 0
        while ($read -lt $bytes.Length) {
            $count = $stream.Read($bytes, $read, $bytes.Length - $read)
            if ($count -eq 0) { throw 'Incomplete release authentication input.' }
            $read += $count
        }
        return ,$bytes
    } finally { $stream.Dispose() }
}

function ConvertFrom-CanonicalReleaseChecksums {
    [CmdletBinding()]
    param([Parameter(Mandatory)][byte[]]$Bytes)
    if ($Bytes.Length -lt 1 -or $Bytes.Length -gt 65536 -or @($Bytes | Where-Object { $_ -gt 127 }).Count -gt 0) {
        throw 'SHA256SUMS.txt must be nonempty ASCII without a BOM and at most 64 KiB.'
    }
    $text = [Text.Encoding]::ASCII.GetString($Bytes)
    if (-not $text.EndsWith("`n") -or $text.Contains("`r")) { throw 'SHA256SUMS.txt requires LF lines and a final newline.' }
    $lines = $text.Substring(0, $text.Length - 1).Split([char]10)
    if ($lines.Count -gt 128) { throw 'SHA256SUMS.txt may list at most 128 assets.' }
    $names = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
    $entries = [Collections.Generic.List[object]]::new()
    $previous = $null
    foreach ($line in $lines) {
        $match = [regex]::Match($line, '^([0-9a-f]{64})  ([A-Za-z0-9][A-Za-z0-9._-]{0,127})$')
        if (-not $match.Success) { throw 'SHA256SUMS.txt contains a noncanonical hash or line.' }
        $name = $match.Groups[2].Value
        Assert-ReleaseAssetName $name
        if (-not $names.Add($name)) { throw "SHA256SUMS.txt lists a duplicate asset: $name" }
        if ($null -ne $previous -and [StringComparer]::Ordinal.Compare($previous, $name) -ge 0) {
            throw 'SHA256SUMS.txt must order asset names with ordinal comparison.'
        }
        $entries.Add([pscustomobject]@{ Name = $name; Sha256 = $match.Groups[1].Value })
        $previous = $name
    }
    $sha = [Security.Cryptography.SHA256]::Create()
    try { $hash = [BitConverter]::ToString($sha.ComputeHash($Bytes)).Replace('-', '').ToLowerInvariant() }
    finally { $sha.Dispose() }
    return [pscustomobject]@{ Bytes = $Bytes.Clone(); Entries = $entries.ToArray(); PayloadSha256 = $hash }
}

function New-CanonicalReleaseChecksums {
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$AssetDirectory, [Parameter(Mandatory)][string[]]$AssetNames)
    $directory = Get-ReleaseChecksumPath -Path $AssetDirectory -Directory
    if ($AssetNames.Count -lt 1 -or $AssetNames.Count -gt 128) { throw 'Select between 1 and 128 release assets.' }
    $ordered = [string[]]$AssetNames.Clone()
    [Array]::Sort($ordered, [StringComparer]::Ordinal)
    $lines = foreach ($name in $ordered) {
        Assert-ReleaseAssetName $name
        (Get-ReleaseChecksumHash -Path (Join-Path $directory $name)) + '  ' + $name
    }
    return ConvertFrom-CanonicalReleaseChecksums -Bytes ([Text.Encoding]::ASCII.GetBytes(($lines -join "`n") + "`n"))
}

function Invoke-ReleaseChecksumGpg {
    param([Parameter(Mandatory)][string]$Gpg, [Parameter(Mandatory)][AllowEmptyString()][string[]]$Arguments)
    $program = @(Get-Command $Gpg -CommandType Application -ErrorAction Stop)[0].Source
    # Prefer native GnuPG for Windows paths and agent IPC when a hook's PATH puts
    # Git's MSYS tools first. Explicit executable paths still select that tool.
    if ($env:OS -eq 'Windows_NT' -and $Gpg -in @('gpg', 'gpg.exe', 'gpgconf', 'gpgconf.exe')) {
        $binary = [IO.Path]::GetFileNameWithoutExtension($Gpg) + '.exe'
        foreach ($programFiles in @($env:ProgramFiles, ${env:ProgramFiles(x86)}) | Where-Object { $_ }) {
            $native = Join-Path $programFiles (Join-Path 'GnuPG/bin' $binary)
            if (Test-Path -LiteralPath $native -PathType Leaf) { $program = $native; break }
        }
    }
    # Git's Windows hook can resolve the MSYS build first. It interprets drive paths as
    # relative names, unlike native GnuPG. Use its own absolute path syntax for inputs.
    if ($env:OS -eq 'Windows_NT' -and
            (Test-Path -LiteralPath (Join-Path (Split-Path -Parent $program) 'msys-2.0.dll'))) {
        $Arguments = @($Arguments | ForEach-Object {
            if ($_ -match '^([A-Za-z]):[\\/](.*)$') {
                '/' + $Matches[1].ToLowerInvariant() + '/' + $Matches[2].Replace('\', '/')
            } else { $_ }
        })
    }
    $PSNativeCommandUseErrorActionPreference = $false
    $ErrorActionPreference = 'Continue'
    $global:LASTEXITCODE = -1
    $output = @(& $program @Arguments 2>&1 | ForEach-Object { "$_" })
    return [pscustomobject]@{ ExitCode = $LASTEXITCODE; Output = $output; Program = $program }
}

function Get-ReleaseChecksumGpgArguments {
    param([Parameter(Mandatory)][string]$KeyringHome)
    return @('--no-options', '--homedir', $KeyringHome, '--batch', '--no-tty', '--disable-dirmngr',
        '--no-auto-key-retrieve', '--no-auto-key-import', '--auto-key-locate', 'clear', '--no-auto-check-trustdb')
}

function Remove-ReleaseChecksumWorkspace {
    param([Parameter(Mandatory)][string]$Path)
    $absolute = [IO.Path]::GetFullPath($Path)
    $temporaryRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\', '/') + [IO.Path]::DirectorySeparatorChar
    if (-not $absolute.StartsWith($temporaryRoot, [StringComparison]::OrdinalIgnoreCase) -or
        (Get-Item -LiteralPath $absolute -Force).Attributes -band [IO.FileAttributes]::ReparsePoint) {
        throw 'Unsafe release authentication workspace cleanup.'
    }
    Remove-Item -LiteralPath $absolute -Recurse -Force -ErrorAction Stop
}

function Read-AuthenticatedReleaseChecksums {
    <# The key and full fingerprint must be pinned independently. Companion keys are never discovered. #>
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$ChecksumsPath, [Parameter(Mandatory)][string]$SignaturePath,
        [Parameter(Mandatory)][string]$TrustedPublicKeyPath, [Parameter(Mandatory)][string]$TrustedFingerprint,
        [string]$Gpg = 'gpg')
    $fingerprint = Get-ReleaseChecksumFingerprint $TrustedFingerprint
    $payload = ConvertFrom-CanonicalReleaseChecksums -Bytes (Read-ReleaseChecksumBytes $ChecksumsPath 65536)
    $signatureBytes = Read-ReleaseChecksumBytes $SignaturePath 16384
    $keyBytes = Read-ReleaseChecksumBytes $TrustedPublicKeyPath 262144
    $work = Join-Path ([IO.Path]::GetTempPath()) ('hushpinterest-checksums-' + [guid]::NewGuid().ToString('N'))
    [void][IO.Directory]::CreateDirectory($work)
    try {
        $key = Join-Path $work 'trusted-public-key'
        $sums = Join-Path $work 'SHA256SUMS.txt'
        $signature = Join-Path $work 'SHA256SUMS.txt.asc'
        [IO.File]::WriteAllBytes($key, $keyBytes)
        [IO.File]::WriteAllBytes($sums, $payload.Bytes)
        [IO.File]::WriteAllBytes($signature, $signatureBytes)
        $options = @(Get-ReleaseChecksumGpgArguments $work) + @('--no-autostart')
        $shown = Invoke-ReleaseChecksumGpg $Gpg ($options + @('--with-colons', '--with-fingerprint', '--show-keys', $key))
        $primary = @($shown.Output | Where-Object { $_ -like 'pub:*' })
        $fprs = @($shown.Output | Where-Object { $_ -like 'fpr:*' })
        if ($shown.ExitCode -ne 0 -or $primary.Count -ne 1 -or $fprs.Count -eq 0 -or
            @($shown.Output | Where-Object { $_ -match '^(sec|ssb):' }).Count -gt 0 -or
            ($fprs[0].Split(':')[9]).ToUpperInvariant() -cne $fingerprint) {
            throw 'Trusted public key does not match the independently pinned fingerprint or contains extra keys.'
        }
        $fields = $primary[0].Split(':')
        if ($fields[1] -in @('r', 'e', 'd', 'i') -or
            ($fields[6] -match '^\d+$' -and [long]$fields[6] -ne 0 -and
                [long]$fields[6] -le [DateTimeOffset]::UtcNow.ToUnixTimeSeconds())) {
            throw 'The pinned release key is revoked, expired or invalid.'
        }
        $imported = Invoke-ReleaseChecksumGpg $Gpg ($options + @('--import', $key))
        if ($imported.ExitCode -ne 0) { throw 'Could not import the pinned public key into the isolated verifier.' }
        $verified = Invoke-ReleaseChecksumGpg $Gpg ($options + @('--status-fd', '1', '--verify', $signature, $sums))
        $valid = @($verified.Output | Where-Object { $_ -match '^\[GNUPG:\] VALIDSIG ' })
        $good = @($verified.Output | Where-Object { $_ -match '^\[GNUPG:\] GOODSIG ' })
        $bad = @($verified.Output | Where-Object {
            $_ -match '^\[GNUPG:\] (BADSIG|ERRSIG|NO_PUBKEY|EXPKEYSIG|REVKEYSIG|EXPSIG|KEYEXPIRED|SIGEXPIRED|KEYREVOKED|FAILURE|ERROR)\b'
        })
        if ($verified.ExitCode -ne 0 -or $valid.Count -ne 1 -or $good.Count -ne 1 -or $bad.Count -gt 0) {
            throw 'Detached release checksum signature authentication failed.'
        }
        $status = $valid[0].Substring('[GNUPG:] '.Length).Split(' ')
        $signer = $status[1].ToUpperInvariant()
        $primarySigner = if ($status.Count -gt 10) { $status[10].ToUpperInvariant() } else { $signer }
        if ($primarySigner -cne $fingerprint -or $status[8] -notin @('8', '9', '10') -or $status[9] -cne '00') {
            throw 'Release signature has the wrong signer, digest or signature class.'
        }
        return [pscustomobject]@{ Authenticated = $true; Entries = $payload.Entries; PayloadSha256 = $payload.PayloadSha256;
            Fingerprint = $fingerprint; SignerFingerprint = $signer }
    } finally { Remove-ReleaseChecksumWorkspace $work }
}

function Assert-ReleaseChecksumAssets {
    [CmdletBinding()]
    param([Parameter(Mandatory)]$Checksums, [Parameter(Mandatory)][string]$AssetDirectory,
        [string[]]$ExpectedAssetNames)
    if ($Checksums.Authenticated -ne $true) { throw 'Authenticate the checksum signature before checking release assets.' }
    $directory = Get-ReleaseChecksumPath -Path $AssetDirectory -Directory
    $entries = @($Checksums.Entries)
    if ($entries.Count -lt 1 -or $entries.Count -gt 128) { throw 'Invalid authenticated asset list.' }
    $names = [Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    foreach ($entry in $entries) {
        Assert-ReleaseAssetName $entry.Name
        if (-not $names.Add([string]$entry.Name) -or $entry.Sha256 -cnotmatch '^[0-9a-f]{64}$') { throw 'Invalid authenticated asset entry.' }
        if ((Get-ReleaseChecksumHash (Join-Path $directory $entry.Name)) -cne $entry.Sha256) {
            throw "Release asset checksum mismatch: $($entry.Name)"
        }
    }
    if ($ExpectedAssetNames -and -not $names.SetEquals([string[]]$ExpectedAssetNames)) {
        throw 'Authenticated checksums do not name exactly the expected release assets.'
    }
    return [pscustomobject]@{ Authenticated = $true; Fingerprint = $Checksums.Fingerprint;
        PayloadSha256 = $Checksums.PayloadSha256; VerifiedAssets = $entries.Count; Entries = $entries }
}

function Write-SignedReleaseChecksums {
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$AssetDirectory, [Parameter(Mandatory)][string[]]$AssetNames,
        [Parameter(Mandatory)][string]$GpgHome, [Parameter(Mandatory)][string]$SigningFingerprint,
        [Parameter(Mandatory)][string]$TrustedPublicKeyPath, [string]$ChecksumsPath, [string]$SignaturePath,
        [string]$Gpg = 'gpg')
    $directory = Get-ReleaseChecksumPath -Path $AssetDirectory -Directory
    $keyringHome = Get-ReleaseChecksumPath -Path $GpgHome -Directory
    $repo = [IO.Path]::GetFullPath((Split-Path -Parent $PSScriptRoot)).TrimEnd('\', '/') + [IO.Path]::DirectorySeparatorChar
    if (($keyringHome.TrimEnd('\', '/') + [IO.Path]::DirectorySeparatorChar).StartsWith($repo, [StringComparison]::OrdinalIgnoreCase) -or
        ($keyringHome + [IO.Path]::DirectorySeparatorChar).StartsWith($directory.TrimEnd('\', '/') + [IO.Path]::DirectorySeparatorChar,
            [StringComparison]::OrdinalIgnoreCase)) { throw 'Keep the private signing keyring outside the repository and release assets.' }
    $fingerprint = Get-ReleaseChecksumFingerprint $SigningFingerprint
    if (-not $ChecksumsPath) { $ChecksumsPath = Join-Path $directory 'SHA256SUMS.txt' }
    if (-not $SignaturePath) { $SignaturePath = "$ChecksumsPath.asc" }
    $ChecksumsPath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($ChecksumsPath)
    $SignaturePath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($SignaturePath)
    if ($ChecksumsPath -eq $SignaturePath -or @($AssetNames | Where-Object {
        (Join-Path $directory $_) -eq $ChecksumsPath -or (Join-Path $directory $_) -eq $SignaturePath
    }).Count -gt 0) { throw 'Checksum outputs cannot replace a selected asset or one another.' }
    $payload = New-CanonicalReleaseChecksums -AssetDirectory $directory -AssetNames $AssetNames
    $work = Join-Path ([IO.Path]::GetTempPath()) ('hushpinterest-sign-checksums-' + [guid]::NewGuid().ToString('N'))
    [void][IO.Directory]::CreateDirectory($work)
    $reservations = [Collections.Generic.List[object]]::new()
    $complete = $false
    try {
        $sums = Join-Path $work 'SHA256SUMS.txt'
        $signature = Join-Path $work 'SHA256SUMS.txt.asc'
        [IO.File]::WriteAllBytes($sums, $payload.Bytes)
        # GPG uses the existing agent/pinentry. Passphrases never enter arguments or this helper.
        $signed = Invoke-ReleaseChecksumGpg $Gpg (@(Get-ReleaseChecksumGpgArguments $keyringHome) + @('--armor',
            '--digest-algo', 'SHA256', '--local-user', $fingerprint, '--output', $signature, '--detach-sign', $sums))
        if ($signed.ExitCode -ne 0) { throw 'Detached checksum signing failed. Provision the selected private key in the explicit keyring.' }
        $authenticated = Read-AuthenticatedReleaseChecksums -ChecksumsPath $sums -SignaturePath $signature `
            -TrustedPublicKeyPath $TrustedPublicKeyPath -TrustedFingerprint $fingerprint -Gpg $Gpg
        [void](Assert-ReleaseChecksumAssets -Checksums $authenticated -AssetDirectory $directory -ExpectedAssetNames $AssetNames)
        foreach ($destination in @($ChecksumsPath, $SignaturePath)) {
            $stream = [IO.File]::Open($destination, [IO.FileMode]::CreateNew, [IO.FileAccess]::Write, [IO.FileShare]::None)
            $reservations.Add([pscustomobject]@{ Path = $destination; Stream = $stream })
        }
        $reservations[0].Stream.Write($payload.Bytes, 0, $payload.Bytes.Length)
        $signatureBytes = Read-ReleaseChecksumBytes $signature 16384
        $reservations[1].Stream.Write($signatureBytes, 0, $signatureBytes.Length)
        foreach ($reservation in $reservations) { $reservation.Stream.Flush($true) }
        $complete = $true
        return [pscustomobject]@{ ChecksumsPath = $ChecksumsPath; SignaturePath = $SignaturePath;
            Fingerprint = $fingerprint; Entries = $authenticated.Entries; PayloadSha256 = $authenticated.PayloadSha256 }
    } finally {
        foreach ($reservation in $reservations) { $reservation.Stream.Dispose() }
        if (-not $complete) { foreach ($reservation in $reservations) { Remove-Item -LiteralPath $reservation.Path -Force } }
        Remove-ReleaseChecksumWorkspace $work
    }
}
