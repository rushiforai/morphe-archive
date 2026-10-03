function Invoke-HushTelegramAdbCommand {
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

function Format-HushTelegramAdbFailure {
    param([string]$Message, $Result)

    $detail = @($Result.Output | Select-Object -First 3) -join '; '
    $suffix = if ([string]::IsNullOrWhiteSpace($detail)) { '' } else { " Output: $detail" }
    "$Message (ADB exit $($Result.ExitCode)).$suffix"
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

    $remote = "/data/local/tmp/hushtelegram-verify-$Label.apk"
    $directory = "/data/local/tmp/hushtelegram-verify-$Label"
    $primaryFailure = $null
    # A clean telegram.org build can raise no verifier message at all (the Facebook sibling's never did), so
    # an empty tally is a real answer here, and the proof that dex2oat verified anything has to
    # come from elsewhere: it read a file of
    # the pushed size, and it didn't log that the file was missing. dex2oat exits 0 on a missing
    # dex file.
    $localSize = (Get-Item -LiteralPath $Local).Length
    try {
        $push = Invoke-HushTelegramAdbCommand -Adb $Adb -Invoker $AdbInvoker `
            -Arguments @('-s', $Serial, 'push', $Local, $remote)
        if ($push.ExitCode -ne 0) {
            throw (Format-HushTelegramAdbFailure -Message "Could not push $Label to $Serial" -Result $push)
        }

        $setup = Invoke-HushTelegramAdbCommand -Adb $Adb -Invoker $AdbInvoker `
            -Arguments @('-s', $Serial, 'shell', "rm -rf $directory && mkdir -p $directory")
        if ($setup.ExitCode -ne 0) {
            throw (Format-HushTelegramAdbFailure `
                -Message "Could not prepare the verifier output directory for $Label on $Serial" `
                -Result $setup)
        }

        # The phones are shared, so the log buffer is never cleared. A unique marker line starts
        # this run's part of it, and only the lines after it are read. It goes out as a warning so a phone that keeps only warnings still logs it.
        $marker = "hushtelegram-verify-$Label-$([guid]::NewGuid().ToString('N'))"
        $mark = Invoke-HushTelegramAdbCommand -Adb $Adb -Invoker $AdbInvoker `
            -Arguments @('-s', $Serial, 'shell', "log -p w -t HushTelegramVerify $marker")
        if ($mark.ExitCode -ne 0) {
            throw (Format-HushTelegramAdbFailure `
                -Message "Could not mark logcat on $Serial before verifying $Label" `
                -Result $mark)
        }

        $dexCommand = "dex2oat64 --dex-file=$remote --oat-file=$directory/out.oat " +
            "--output-vdex=$directory/out.vdex --instruction-set=arm64 " +
            '--compiler-filter=verify --runtime-arg -Xmx1024m -j4; echo exit=$?; ' +
            'echo size=$(stat -c %s ' + $remote + ' 2>/dev/null || echo 0)'
        $dex = Invoke-HushTelegramAdbCommand -Adb $Adb -Invoker $AdbInvoker `
            -Arguments @('-s', $Serial, 'shell', $dexCommand)
        if ($dex.ExitCode -ne 0) {
            throw (Format-HushTelegramAdbFailure `
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

        $logResult = Invoke-HushTelegramAdbCommand -Adb $Adb -Invoker $AdbInvoker `
            -Arguments @('-s', $Serial, 'logcat', '-d')
        if ($logResult.ExitCode -ne 0) {
            throw (Format-HushTelegramAdbFailure `
                -Message "Could not read logcat on $Serial after verifying $Label" `
                -Result $logResult)
        }
        $logLines = @($logResult.Output)
        $markedAt = -1
        for ($i = $logLines.Count - 1; $i -ge 0; $i--) {
            if ("$($logLines[$i])".Contains($marker)) { $markedAt = $i; break }
        }
        if ($markedAt -lt 0) {
            throw "The log on $Serial doesn't hold the start of the $Label run, so its verifier messages can't be counted. A busy log may have dropped it, or the phone may filter warnings out of its log. Retry when the phone is quieter."
        }
        $runLines = @($logLines | Select-Object -Skip ($markedAt + 1))

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
                $cleanup = Invoke-HushTelegramAdbCommand -Adb $Adb -Invoker $AdbInvoker `
                    -Arguments @('-s', $Serial, 'shell', "rm -rf $remotePath")
                if ($cleanup.ExitCode -ne 0) {
                    $cleanupFailures.Add((Format-HushTelegramAdbFailure `
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
