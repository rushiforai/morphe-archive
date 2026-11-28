<#
.SYNOPSIS
    The ADB side of a device verify: running adb, naming what failed, and tallying what
    Android's verifier reported.

.NOTES
    Taken from Hushfacebook's scripts/injected-register-device.ps1
    (https://github.com/SysAdminDoc/Hushfacebook, commit 3a47363954eea853357e71e7cf3951a5ee984cee).
    GPL-3.0-only. Modified for HushGram (Instagram), 2026.
#>

. (Join-Path $PSScriptRoot 'device-install.ps1')

function Invoke-HushgramAdbCommand {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string[]]$Arguments,
        [scriptblock]$Invoker,
        $DeviceLease
    )

    if ($Arguments.Count -lt 3 -or $Arguments[0] -cne '-s') { throw 'Every ADB operation needs an exact serial.' }
    $identity = ($Arguments[2..($Arguments.Count - 1)] -join ' ') -cin @(
        'get-serialno', 'shell getprop ro.product.model', 'shell getprop ro.product.cpu.abi', 'emu avd name')
    Assert-HushgramDeviceLease -DeviceLease $DeviceLease -Serial $Arguments[1] -IdentityQuery:$identity

    if ($Invoker) {
        $result = & $Invoker $Adb $Arguments
        if ($null -eq $result -or $null -eq $result.ExitCode) {
            throw 'The ADB invoker returned no exit code.'
        }
        $standardOutput = @()
        if ($result.PSObject.Properties['Stdout']) { $standardOutput = @($result.Stdout) }
        return [pscustomobject]@{
            ExitCode = [int]$result.ExitCode
            Output = @($result.Output | ForEach-Object { "$_" })
            Stdout = @($standardOutput | ForEach-Object { "$_" })
        }
    }

    $process = [Diagnostics.Process]::new()
    $process.StartInfo = [Diagnostics.ProcessStartInfo]::new($Adb)
    $process.StartInfo.UseShellExecute = $false
    $process.StartInfo.CreateNoWindow = $true
    $process.StartInfo.RedirectStandardOutput = $true
    $process.StartInfo.RedirectStandardError = $true
    foreach ($argument in $Arguments) { $process.StartInfo.ArgumentList.Add($argument) }
    $started = $false
    try {
        if (-not $process.Start()) { throw 'ADB did not start.' }
        $started = $true
        $stdout = $process.StandardOutput.ReadToEndAsync()
        $stderr = $process.StandardError.ReadToEndAsync()
        while (-not $process.WaitForExit(30000)) { Update-HushgramDeviceLease $DeviceLease }
        $standardOutput = @($stdout.GetAwaiter().GetResult() -split '\r*\n|\r' |
            Where-Object { $_ -ne '' })
        $standardError = @($stderr.GetAwaiter().GetResult() -split '\r*\n|\r' |
            Where-Object { $_ -ne '' })
        [pscustomobject]@{ ExitCode = $process.ExitCode; Output = @($standardOutput + $standardError); Stdout = $standardOutput }
    } finally {
        # Keep ownership while a started ADB operation finishes, including an exceptional path.
        if ($started -and -not $process.HasExited) { $process.WaitForExit() }
        $process.Dispose()
    }
}

function Format-HushgramAdbFailure {
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
        [scriptblock]$AdbInvoker,
        $DeviceLease
    )

    Assert-HushgramDeviceLease -DeviceLease $DeviceLease -Serial $Serial

    if ($Label -notmatch '^[A-Za-z0-9][A-Za-z0-9._-]{0,31}$') {
        throw "Invalid verifier label: $Label"
    }

    $remote = "/data/local/tmp/hushgram-verify-$Label.apk"
    $directory = "/data/local/tmp/hushgram-verify-$Label"
    $primaryFailure = $null
    # A stock build can raise no verifier message at all (Facebook 580 raised none), so an empty
    # tally is a real answer here, and the proof that dex2oat verified anything has to come from
    # elsewhere: it read a file of the pushed size, and it didn't log that the file was missing.
    # dex2oat exits 0 on a missing dex file.
    $localSize = (Get-Item -LiteralPath $Local).Length
    try {
        $push = Invoke-HushgramAdbCommand -Adb $Adb -Invoker $AdbInvoker `
            -Arguments @('-s', $Serial, 'push', $Local, $remote) -DeviceLease $DeviceLease
        if ($push.ExitCode -ne 0) {
            throw (Format-HushgramAdbFailure -Message "Could not push $Label to $Serial" -Result $push)
        }

        $setup = Invoke-HushgramAdbCommand -Adb $Adb -Invoker $AdbInvoker `
            -Arguments @('-s', $Serial, 'shell', "rm -rf $directory && mkdir -p $directory") -DeviceLease $DeviceLease
        if ($setup.ExitCode -ne 0) {
            throw (Format-HushgramAdbFailure `
                -Message "Could not prepare the verifier output directory for $Label on $Serial" `
                -Result $setup)
        }

        # The phones are shared, so the log buffer is never cleared. A unique marker line starts
        # this run's part of it, and only the lines after it are read.
        $marker = "hushgram-verify-$Label-$([guid]::NewGuid().ToString('N'))"
        $mark = Invoke-HushgramAdbCommand -Adb $Adb -Invoker $AdbInvoker `
            -Arguments @('-s', $Serial, 'shell', "log -t HushGramVerify $marker") -DeviceLease $DeviceLease
        if ($mark.ExitCode -ne 0) {
            throw (Format-HushgramAdbFailure `
                -Message "Could not mark logcat on $Serial before verifying $Label" `
                -Result $mark)
        }

        $dexExecutable = if ($DeviceLease.InstructionSet -in @('arm64', 'x86_64')) { 'dex2oat64' } else { 'dex2oat' }
        $dexCommand = "$dexExecutable --dex-file=$remote --oat-file=$directory/out.oat " +
            "--output-vdex=$directory/out.vdex --instruction-set=$($DeviceLease.InstructionSet) " +
            '--compiler-filter=verify --runtime-arg -Xmx1024m -j4; echo exit=$?; ' +
            'echo size=$(stat -c %s ' + $remote + ' 2>/dev/null || echo 0)'
        $dex = Invoke-HushgramAdbCommand -Adb $Adb -Invoker $AdbInvoker `
            -Arguments @('-s', $Serial, 'shell', $dexCommand) -DeviceLease $DeviceLease
        if ($dex.ExitCode -ne 0) {
            throw (Format-HushgramAdbFailure `
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

        $logResult = Invoke-HushgramAdbCommand -Adb $Adb -Invoker $AdbInvoker `
            -Arguments @('-s', $Serial, 'logcat', '-d') -DeviceLease $DeviceLease
        if ($logResult.ExitCode -ne 0) {
            throw (Format-HushgramAdbFailure `
                -Message "Could not read logcat on $Serial after verifying $Label" `
                -Result $logResult)
        }
        $logLines = @($logResult.Output)
        $markedAt = -1
        for ($i = $logLines.Count - 1; $i -ge 0; $i--) {
            if ("$($logLines[$i])".Contains($marker)) { $markedAt = $i; break }
        }
        if ($markedAt -lt 0) {
            throw "The log on $Serial no longer holds the start of the $Label run, so its verifier messages can't be counted. Retry when the phone is quieter."
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
                $cleanup = Invoke-HushgramAdbCommand -Adb $Adb -Invoker $AdbInvoker `
                    -Arguments @('-s', $Serial, 'shell', "rm -rf $remotePath") -DeviceLease $DeviceLease
                if ($cleanup.ExitCode -ne 0) {
                    $cleanupFailures.Add((Format-HushgramAdbFailure `
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
