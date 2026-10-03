# The probe answers in logcat under HushfeedProbe. The phones are shared, so the buffer is never
# cleared: a unique marker line under the same tag starts each broadcast's answer, and only the
# lines after its last copy are read.

function Select-ProbeRun {
    param([string[]]$Lines, [Parameter(Mandatory = $true)][string]$Marker, [string]$Serial)
    $Lines = @($Lines)
    for ($i = $Lines.Count - 1; $i -ge 0; $i--) {
        if ("$($Lines[$i])".Trim() -eq $Marker) { return @($Lines | Select-Object -Skip ($i + 1)) }
    }
    throw "The log on $Serial no longer holds the start of this probe answer. Retry when the phone is quieter."
}

function Invoke-ProbeAction {
    param(
        [Parameter(Mandatory = $true)][string]$Serial,
        [Parameter(Mandatory = $true)][string]$Action,
        [int]$WaitMs = 1200,
        [string[]]$Extras = @()
    )
    $marker = "hushfeed-probe-$([guid]::NewGuid().ToString('N'))"
    & adb -s $Serial shell log -t HushfeedProbe $marker
    if ($LASTEXITCODE -ne 0) { throw "Could not mark logcat on $Serial before the $Action probe action." }
    & adb -s $Serial shell am broadcast -a app.hushfeed.verification.PROBE -p com.zhiliaoapp.musically `
        -e action $Action @Extras | Out-Null
    Start-Sleep -Milliseconds $WaitMs
    $lines = @(& adb -s $Serial logcat -d -s HushfeedProbe:V -v raw)
    if ($LASTEXITCODE -ne 0) { throw "Could not read logcat on $Serial after the $Action probe action." }
    Select-ProbeRun -Lines $lines -Marker $marker -Serial $Serial
}
