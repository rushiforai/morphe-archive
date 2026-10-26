function Invoke-HushfacebookAdbCommand {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string[]]$Arguments,
        [scriptblock]$Invoker
    )

    if ($Invoker) {
        $result = & $Invoker $Adb $Arguments
        if ($null -eq $result -or $null -eq $result.ExitCode) {
            throw 'The ADB invoker returned no exit code.'
        }
        return [pscustomobject]@{
            ExitCode = [int]$result.ExitCode
            Output = @($result.Output | ForEach-Object { "$_" })
        }
    }

    $PSNativeCommandUseErrorActionPreference = $false
    $output = @(& $Adb @Arguments 2>&1 | ForEach-Object { "$_" })
    [pscustomobject]@{ ExitCode = $LASTEXITCODE; Output = $output }
}

function Format-HushfacebookAdbFailure {
    param([string]$Message, $Result)

    $detail = @($Result.Output | Select-Object -First 3) -join '; '
    $suffix = if ([string]::IsNullOrWhiteSpace($detail)) { '' } else { " Output: $detail" }
    "$Message (ADB exit $($Result.ExitCode)).$suffix"
}

# The lines after the last one carrying the verifier's log tag and [Mark], or null when no line does.
function Select-VerifierRunLines {
    param([AllowEmptyCollection()][string[]]$Lines, [Parameter(Mandatory = $true)][string]$Mark)

    $last = -1
    for ($i = 0; $i -lt $Lines.Count; $i++) {
        if ($Lines[$i].Contains('HushfacebookVerify') -and $Lines[$i].Contains($Mark)) { $last = $i }
    }
    if ($last -lt 0) { return $null }
    # The comma keeps an empty or one-line answer an array rather than null or a string.
    , @($Lines | Select-Object -Skip ($last + 1))
}

function Invoke-AndroidVerifierTally {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string]$Serial,
        [Parameter(Mandatory = $true)][string]$Local,
        [Parameter(Mandatory = $true)][string]$Label,
        [scriptblock]$AdbInvoker
    )

    if ($Label -notmatch '^[A-Za-z0-9][A-Za-z0-9._-]{0,31}$') {
        throw "Invalid verifier label: $Label"
    }

    $remote = "/data/local/tmp/hushfacebook-verify-$Label.apk"
    $directory = "/data/local/tmp/hushfacebook-verify-$Label"
    $primaryFailure = $null
    # Meta's own build raises no verifier message at all, so an empty tally is a real answer here,
    # and the proof that dex2oat verified anything has to come from elsewhere: it read a file of
    # the pushed size, and it didn't log that the file was missing. dex2oat exits 0 on a missing
    # dex file.
    $localSize = (Get-Item -LiteralPath $Local).Length
    try {
        $push = Invoke-HushfacebookAdbCommand -Adb $Adb -Invoker $AdbInvoker `
            -Arguments @('-s', $Serial, 'push', $Local, $remote)
        if ($push.ExitCode -ne 0) {
            throw (Format-HushfacebookAdbFailure -Message "Could not push $Label to $Serial" -Result $push)
        }

        $setup = Invoke-HushfacebookAdbCommand -Adb $Adb -Invoker $AdbInvoker `
            -Arguments @('-s', $Serial, 'shell', "rm -rf $directory && mkdir -p $directory")
        if ($setup.ExitCode -ne 0) {
            throw (Format-HushfacebookAdbFailure `
                -Message "Could not prepare the verifier output directory for $Label on $Serial" `
                -Result $setup)
        }

        # The phones and emulators are shared, so the log isn't cleared: a line of this run's own
        # goes in before dex2oat, and only what comes after its last copy counts.
        $mark = "$Label-$([guid]::NewGuid().ToString('N'))"
        $marked = Invoke-HushfacebookAdbCommand -Adb $Adb -Invoker $AdbInvoker `
            -Arguments @('-s', $Serial, 'shell', "log -t HushfacebookVerify $mark")
        if ($marked.ExitCode -ne 0) {
            throw (Format-HushfacebookAdbFailure `
                -Message "Could not mark the log on $Serial before verifying $Label" `
                -Result $marked)
        }

        $dexCommand = "dex2oat64 --dex-file=$remote --oat-file=$directory/out.oat " +
            "--output-vdex=$directory/out.vdex --instruction-set=arm64 " +
            '--compiler-filter=verify --runtime-arg -Xmx1024m -j4; echo exit=$?; ' +
            'echo size=$(stat -c %s ' + $remote + ' 2>/dev/null || echo 0)'
        $dex = Invoke-HushfacebookAdbCommand -Adb $Adb -Invoker $AdbInvoker `
            -Arguments @('-s', $Serial, 'shell', $dexCommand)
        if ($dex.ExitCode -ne 0) {
            throw (Format-HushfacebookAdbFailure `
                -Message "Could not run dex2oat on $Label on $Serial" -Result $dex)
        }
        $dexExit = $null
        $readSize = $null
        foreach ($line in $dex.Output) {
            if ($line -match 'exit=(-?\d+)') { $dexExit = [int]$Matches[1] }
            if ($line -match '^size=(\d+)') { $readSize = [long]$Matches[1] }
        }
        if ($null -eq $dexExit) {
            throw "dex2oat on $Label reported no exit code; the shell did not finish."
        }
        if ($dexExit -ne 0) { throw "dex2oat on $Label exited $dexExit." }
        if ($readSize -ne $localSize) {
            throw "dex2oat on $Label read a file of $readSize bytes on $Serial, not the $localSize bytes pushed."
        }

        $logResult = Invoke-HushfacebookAdbCommand -Adb $Adb -Invoker $AdbInvoker `
            -Arguments @('-s', $Serial, 'shell', 'logcat', '-d')
        if ($logResult.ExitCode -ne 0) {
            throw (Format-HushfacebookAdbFailure `
                -Message "Could not read logcat on $Serial after verifying $Label" `
                -Result $logResult)
        }

        $runLines = Select-VerifierRunLines -Lines $logResult.Output -Mark $mark
        if ($null -eq $runLines) {
            throw ("The log mark for $Label on $Serial was gone from the log by the time it was read, " +
                'so this run''s lines cannot be told apart from older ones.')
        }

        $unread = @($runLines | Where-Object {
            $_ -match 'dex2oat' -and $_ -match '(Skipping non-existent dex file|Failed to open dex)' })
        if ($unread.Count -ne 0) {
            throw "dex2oat did not read $Label on ${Serial}: $(($unread[0] -replace '^.*dex2oat[0-9]*:\s*', '').Trim())"
        }

        # The method in the verifier line is its identity. Timestamps and process IDs differ
        # between runs and are stripped. Counts remain significant.
        $messages = @($runLines |
            Where-Object { $_ -match 'dex2oat' } |
            Where-Object { $_ -match '(failed lock verification|Verification error|Rejecting class|VerifyError)' } |
            ForEach-Object { ($_ -replace '^.*dex2oat[0-9]*:\s*', '').Trim() })
        $tally = [System.Collections.Generic.Dictionary[string, int]]::new(
            [System.StringComparer]::Ordinal)
        foreach ($message in $messages) {
            if ($tally.ContainsKey($message)) { $tally[$message]++ }
            else { $tally.Add($message, 1) }
        }
        return $tally
    } catch {
        $primaryFailure = $_
        throw
    } finally {
        $cleanupFailures = [System.Collections.Generic.List[string]]::new()
        foreach ($remotePath in @($directory, $remote)) {
            try {
                $cleanup = Invoke-HushfacebookAdbCommand -Adb $Adb -Invoker $AdbInvoker `
                    -Arguments @('-s', $Serial, 'shell', "rm -rf $remotePath")
                if ($cleanup.ExitCode -ne 0) {
                    $cleanupFailures.Add((Format-HushfacebookAdbFailure `
                        -Message "Could not remove $remotePath" -Result $cleanup))
                }
            } catch {
                $cleanupFailures.Add("Could not remove ${remotePath}: $($_.Exception.Message)")
            }
        }
        if ($cleanupFailures.Count -ne 0) {
            $message = $cleanupFailures -join ' '
            if ($null -ne $primaryFailure) {
                Write-Warning -WarningAction Continue `
                    "Verifier cleanup also failed after the original error. $message"
            } else {
                throw "Verifier cleanup failed. $message"
            }
        }
    }
}

# The patch build identity a patched APK carries, or null when none of its classes*.dex holds one:
# the string the shared extension patch makes getPatchesBuildIdentity return, the same one the app
# reports about itself and Get-BundlePatchBuild (walk-receipt.ps1) works out from a bundle. A dex
# keeps an ASCII string as its own bytes, so it reads as written.
function Get-ApkPatchBuild {
    param([Parameter(Mandatory = $true)][string]$Apk)

    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $identity = [regex]('sha256=[0-9a-f]{64}; source=(?:(?:clean|dirty):[0-9a-f]{40}; tree=[0-9a-f]{40}|unknown); ' +
        'inputs=[0-9a-f]{64}')
    $latin1 = [System.Text.Encoding]::GetEncoding(28591)
    $found = [System.Collections.Generic.SortedSet[string]]::new([System.StringComparer]::Ordinal)
    # ZipFile reads a relative path against the process directory, not PowerShell's.
    $zip = [System.IO.Compression.ZipFile]::OpenRead((Resolve-Path -LiteralPath $Apk).ProviderPath)
    try {
        foreach ($entry in $zip.Entries) {
            if ($entry.FullName -cnotmatch '\Aclasses[0-9]*\.dex\z') { continue }
            $bytes = [System.IO.MemoryStream]::new()
            $stream = $entry.Open()
            try { $stream.CopyTo($bytes) } finally { $stream.Dispose() }
            foreach ($match in $identity.Matches($latin1.GetString($bytes.GetBuffer(), 0, [int]$bytes.Length))) {
                [void]$found.Add($match.Value)
            }
        }
    } finally { $zip.Dispose() }
    # Two would mean two bundles' extensions in one APK, and neither can be told to be the one.
    if ($found.Count -gt 1) { throw "$Apk carries $($found.Count) patch build identities, so which bundle patched it can't be told." }
    if ($found.Count -eq 0) { return $null }
    return $found.Min
}

# The receipt a -Serial run of verify-injected-registers.ps1 leaves, as an ordered dictionary ready
# for ConvertTo-Json. release/release.ps1's publish stage holds it to the bundle it ships
# (Test-VerifierReceipt in walk-receipt.ps1): a static FAIL or any verifier message the patched
# build raises and Meta's doesn't, or the other way round, makes the run a FAIL, and the messages
# go in it word for word, since each names the method that failed.
function New-VerifierReceipt {
    param(
        [Parameter(Mandatory = $true)][string]$Serial,
        [Parameter(Mandatory = $true)][string]$Device,
        [AllowEmptyString()][string]$Facebook,
        [AllowEmptyString()][string]$PatchBuild,
        [AllowEmptyString()][string]$PatchedApkSha256,
        [Parameter(Mandatory = $true)][bool]$StaticPassed,
        # What Compare-VerifierTallies answered for the clean and patched tallies.
        [Parameter(Mandatory = $true)]$Comparison,
        [DateTimeOffset]$Finished = [DateTimeOffset]::UtcNow
    )
    $deltas = @($Comparison.Deltas | Where-Object { $null -ne $_ } | ForEach-Object {
        [ordered]@{ kind = [string]$_.Kind; message = [string]$_.Message; clean = [int]$_.Clean; patched = [int]$_.Patched } })
    $passed = $StaticPassed -and [bool]$Comparison.Valid -and $deltas.Count -eq 0
    return [ordered]@{
        schema = 1; result = if ($passed) { 'PASS' } else { 'FAIL' }
        serial = $Serial; device = $Device; emulator = $Serial.StartsWith('emulator-', [StringComparison]::Ordinal)
        facebook = $Facebook; patchBuild = $PatchBuild; patchedApkSha256 = $PatchedApkSha256
        static = if ($StaticPassed) { 'PASS' } else { 'FAIL' }
        cleanMessages = [int]$Comparison.CleanTotal; patchedMessages = [int]$Comparison.PatchedTotal
        deltas = $deltas
        finished = $Finished.UtcDateTime.ToString('yyyy-MM-ddTHH:mm:ssZ')
    }
}
