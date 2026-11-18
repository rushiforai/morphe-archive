# Local, memory-only OCR worker. One JSON request/reply per line; no PNG files.
$ErrorActionPreference = 'Stop'
[Console]::InputEncoding = [System.Text.UTF8Encoding]::new($false)
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)
Add-Type -AssemblyName System.Runtime.WindowsRuntime
$null = [Windows.Graphics.Imaging.BitmapDecoder, Windows.Graphics.Imaging, ContentType=WindowsRuntime]
$null = [Windows.Media.Ocr.OcrEngine, Windows.Foundation, ContentType=WindowsRuntime]
$asTask = [System.WindowsRuntimeSystemExtensions].GetMethods() | Where-Object {
    $_.Name -eq 'AsTask' -and $_.IsGenericMethod -and $_.GetParameters().Count -eq 1 -and
    $_.GetParameters()[0].ParameterType.Name -eq 'IAsyncOperation`1'
} | Select-Object -First 1
function Await-Result($Operation, [Type]$ResultType) {
    $task = $asTask.MakeGenericMethod($ResultType).Invoke($null, @($Operation))
    $task.Wait()
    $task.Result
}
$engine = [Windows.Media.Ocr.OcrEngine]::TryCreateFromUserProfileLanguages()
while ($null -ne ($line = [Console]::ReadLine())) {
    $memory = $stream = $bitmap = $null
    try {
        if ($null -eq $engine) { throw 'Install a Windows OCR language pack.' }
        $request = $line | ConvertFrom-Json
        $memory = [System.IO.MemoryStream]::new([Convert]::FromBase64String($request.png))
        $stream = [System.IO.WindowsRuntimeStreamExtensions]::AsRandomAccessStream($memory)
        $decoder = Await-Result ([Windows.Graphics.Imaging.BitmapDecoder]::CreateAsync($stream)) ([Windows.Graphics.Imaging.BitmapDecoder])
        $bitmap = Await-Result ($decoder.GetSoftwareBitmapAsync()) ([Windows.Graphics.Imaging.SoftwareBitmap])
        $result = Await-Result ($engine.RecognizeAsync($bitmap)) ([Windows.Media.Ocr.OcrResult])
        $rows = @($result.Lines | ForEach-Object {
            $words = @($_.Words)
            $left = ($words | ForEach-Object {$_.BoundingRect.X} | Measure-Object -Minimum).Minimum
            $top = ($words | ForEach-Object {$_.BoundingRect.Y} | Measure-Object -Minimum).Minimum
            $right = ($words | ForEach-Object {$_.BoundingRect.X + $_.BoundingRect.Width} | Measure-Object -Maximum).Maximum
            $bottom = ($words | ForEach-Object {$_.BoundingRect.Y + $_.BoundingRect.Height} | Measure-Object -Maximum).Maximum
            @{text=$_.Text; x=($left+$right)/2; y=($top+$bottom)/2}
        })
        [Console]::WriteLine((@{rows=$rows} | ConvertTo-Json -Depth 4 -Compress))
    } catch {
        # Do not echo OCR text or the image request in diagnostic output.
        [Console]::WriteLine((@{error="ocr_failed"} | ConvertTo-Json -Compress))
    } finally {
        if ($null -ne $bitmap) {$bitmap.Dispose()}
        if ($null -ne $stream) {$stream.Dispose()}
        if ($null -ne $memory) {$memory.Dispose()}
    }
}
