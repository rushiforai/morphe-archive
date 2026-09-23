<# Read-only SteamVR console subscription, using installed console.js protocol.
No console commands, configuration changes, process restarts or ADB operations.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$OutputDirectory,
    [ValidateRange(10,1800)][int]$DurationSeconds = 180
)
$ErrorActionPreference = 'Stop'
$out = [IO.Path]::GetFullPath($OutputDirectory)
if ((Test-Path -LiteralPath $out) -and @((Get-ChildItem -LiteralPath $out -Force)).Count) { throw 'Use a new or empty output directory' }
$null = New-Item -ItemType Directory -Force -Path $out
$writer = [IO.StreamWriter]::new((Join-Path $out 'console-live.jsonl'), $false, [Text.UTF8Encoding]::new($false))
$socket = [Net.WebSockets.ClientWebSocket]::new()
$socket.Options.SetRequestHeader('Origin','http://localhost:27062')
$cancel = [Threading.CancellationTokenSource]::new()
$cancel.CancelAfter([TimeSpan]::FromSeconds($DurationSeconds))
function Write-Record($record) {
    $record.host_epoch = [DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()/1000
    $writer.WriteLine(($record | ConvertTo-Json -Depth 30 -Compress)); $writer.Flush()
}
function Send-Subscription([ValidateSet('console_open','console_close')][string]$value) {
    $bytes = [Text.Encoding]::UTF8.GetBytes($value)
    $socket.SendAsync([ArraySegment[byte]]::new($bytes),[Net.WebSockets.WebSocketMessageType]::Text,$true,$cancel.Token).GetAwaiter().GetResult()
}
$status = 'incomplete'
try {
    $socket.ConnectAsync([Uri]'ws://127.0.0.1:27062/',$cancel.Token).GetAwaiter().GetResult()
    Write-Record @{event='open';source='SteamVR read-only console subscription';duration_seconds=$DurationSeconds}
    Send-Subscription 'console_open'
    $buffer = [byte[]]::new(1048576)
    while (!$cancel.IsCancellationRequested) {
        $stream = [IO.MemoryStream]::new()
        try {
            do {
                $part = $socket.ReceiveAsync([ArraySegment[byte]]::new($buffer),$cancel.Token).GetAwaiter().GetResult()
                if ($stream.Length + $part.Count -gt 33554432) { throw 'Console message exceeded 32 MiB bound' }
                $stream.Write($buffer,0,$part.Count)
            } while (!$part.EndOfMessage)
            if ($part.MessageType -eq [Net.WebSockets.WebSocketMessageType]::Close) { $status='server_closed'; break }
            $message = [Text.Encoding]::UTF8.GetString($stream.ToArray())
            try { $parsed = $message | ConvertFrom-Json; Write-Record @{message=$parsed} }
            catch { Write-Record @{raw=$message} }
        } finally { $stream.Dispose() }
    }
} catch {
    $status = if ($cancel.IsCancellationRequested) { 'duration_complete' } else { 'error' }
    Write-Record @{event=$status;detail=$_.Exception.Message}
} finally {
    # Closing the socket releases this subscription; no SteamVR command is sent.
    $socket.Abort(); $socket.Dispose(); $cancel.Dispose()
    Write-Record @{event='closed';status=$status}; $writer.Dispose()
    @{Status=$status;Utc=(Get-Date).ToUniversalTime().ToString('o');Output=$out} |
        ConvertTo-Json | Set-Content (Join-Path $out 'result.json') -Encoding utf8
}
if ($status -eq 'error') { throw 'Host console capture failed; see retained result/log' }
