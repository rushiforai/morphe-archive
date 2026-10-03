<# Exercise resolved UTP gRPC/HTTP transports and Jetifier's JDOM API without a device. #>
[CmdletBinding()]
param([string]$Root, [string]$Report, [string]$Java)
$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'release-receipt.ps1')
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')
if (-not $Report) { $Report = [IO.Path]::ChangeExtension((Get-ReleaseBundlePath -Root $Root), '.tooling.json') }
$tooling = Read-ReleaseTooling $Report
$Java = Resolve-Java -Explicit $Java
$javac = Join-Path (Split-Path -Parent $Java) $(if ($Java.EndsWith('.exe')) { 'javac.exe' } else { 'javac' })
if (-not (Test-Path -LiteralPath $javac -PathType Leaf)) { throw 'Tooling compatibility checks need a JDK with javac.' }
$cacheRoot = if ($env:GRADLE_USER_HOME) { $env:GRADLE_USER_HOME } else { Join-Path $HOME '.gradle' }
$cacheRoot = [IO.Path]::GetFullPath((Join-Path $cacheRoot 'caches/modules-2/files-2.1'))
$separator = [IO.Path]::PathSeparator

function Get-ToolingClasspath([string]$Scope) {
    $jars = New-Object System.Collections.Generic.List[string]
    foreach ($component in @($tooling.Components | Where-Object { $_.scopes -ccontains $Scope })) {
        $folder = [IO.Path]::GetFullPath((Join-Path $cacheRoot "$($component.group)/$($component.name)/$($component.version)"))
        if (-not $folder.StartsWith($cacheRoot + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
            throw 'A tooling coordinate escapes the Gradle artifact cache.'
        }
        foreach ($artifact in @($component.artifacts | Where-Object { $_.name -like '*.jar' })) {
            $found = @(Get-ChildItem -LiteralPath $folder -Recurse -File | Where-Object {
                $_.Name -ceq $artifact.name -and (Get-Sha256Hex $_.FullName) -ieq $artifact.sha256
            })
            if ($found.Count -eq 0) { throw "No cached artifact matches $($component.coordinate) / $($artifact.name) and its report hash." }
            $jars.Add($found[0].FullName)
        }
    }
    if ($jars.Count -eq 0) { throw "No verified JAR artifact in $Scope." }
    return (@($jars | Sort-Object -Unique) -join $separator)
}

function Invoke-ToolingJava([string]$Executable, [string[]]$Arguments) {
    $info = New-Object Diagnostics.ProcessStartInfo
    $info.FileName = $Executable
    $info.UseShellExecute = $false
    $info.CreateNoWindow = $true
    $info.RedirectStandardOutput = $true
    $info.RedirectStandardError = $true
    if ($info.PSObject.Properties['ArgumentList']) {
        foreach ($argument in $Arguments) { $info.ArgumentList.Add($argument) }
    } else {
        $info.Arguments = (@($Arguments | ForEach-Object {
            '"' + ($_ -replace '(\\*)"', '$1$1\"' -replace '(\\+)$', '$1$1') + '"'
        }) -join ' ')
    }
    $process = New-Object Diagnostics.Process
    $process.StartInfo = $info
    try {
        if (-not $process.Start()) { throw 'Could not start the tooling compatibility process.' }
        $stdout = $process.StandardOutput.ReadToEndAsync()
        $stderr = $process.StandardError.ReadToEndAsync()
        if (-not $process.WaitForExit(30000)) {
            if ($process.GetType().GetMethod('Kill', [type[]]@([bool]))) { $process.Kill($true) }
            else { & (Join-Path $env:WINDIR 'System32/taskkill.exe') /PID $process.Id /T /F | Out-Null }
            [void]$process.WaitForExit(5000)
            throw 'Tooling compatibility exceeded its 30-second deadline.'
        }
        $out = $stdout.GetAwaiter().GetResult()
        $err = $stderr.GetAwaiter().GetResult()
        if ($process.ExitCode -ne 0) { throw "Tooling compatibility exited $($process.ExitCode): $out $err" }
        Write-Host $out.Trim()
    } finally { $process.Dispose() }
}

$utp = @($tooling.Scopes | Where-Object { $_.id -cmatch '/configuration/_internal-unified-test-platform-(core|android-test-plugin-host-emulator-control)$' })
if ($utp.Count -ne 6 -or @($utp | Where-Object { $_.status -cne 'resolved' }).Count) {
    throw 'The compatibility check requires all six resolved UTP graphs.'
}
$cases = [Collections.Generic.Dictionary[string, object]]::new([StringComparer]::Ordinal)
foreach ($scope in $utp) {
    $grpc = @($tooling.Components | Where-Object { $_.group -ceq 'io.grpc' -and $_.name -ceq 'grpc-netty' -and $_.scopes -ccontains $scope.id })
    if ($grpc.Count -ne 1) { throw "$($scope.id) has no unique gRPC transport." }
    $classpath = Get-ToolingClasspath $scope.id
    if ($cases.ContainsKey($grpc[0].version) -and $cases[$grpc[0].version] -cne $classpath) {
        throw 'Graphs carrying the same gRPC version have different verified artifacts.'
    }
    $cases[$grpc[0].version] = $classpath
}
if (($cases.Keys | Sort-Object) -join ',' -cne '1.57.2,1.69.1') { throw 'The gRPC version pairing changed and needs a fresh compatibility review.' }
$tempRoot = [IO.Path]::GetTempPath()
$work = Join-Path $tempRoot ('hushfacebook-tooling-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $work -Force | Out-Null
try {
    Invoke-ToolingJava $javac @('--release', '8', '-cp', $cases['1.57.2'], '-d', $work, (Join-Path $PSScriptRoot 'ToolingClasspathSmoke.java'))
    foreach ($version in @($cases.Keys | Sort-Object)) {
        Write-Host "[tooling] gRPC $version with its resolved Netty transport"
        Invoke-ToolingJava $Java @('-cp', ($work + $separator + $cases[$version]), 'ToolingClasspathSmoke')
    }
    $jdom = @($tooling.Components | Where-Object { $_.group -ceq 'org.jdom' -and $_.name -ceq 'jdom2' })
    if ($jdom.Count -ne 1 -or ($jdom[0].scopes -join ',') -cne 'settings/buildscript/classpath') {
        throw 'JDOM has an unexpected version pairing or carrier.'
    }
    Write-Host "[tooling] JDOM $($jdom[0].version) in settings/buildscript/classpath"
    Invoke-ToolingJava $Java @('-cp', ($work + $separator + (Get-ToolingClasspath 'settings/buildscript/classpath')), 'ToolingClasspathSmoke$Xml')
    $listeners = @($tooling.Scopes | Where-Object { $_.id.EndsWith('/configuration/_internal-unified-test-platform-android-test-plugin-result-listener-gradle') })
    if ($listeners.Count -ne 3 -or @($listeners | Where-Object { $_.status -cne 'resolved' }).Count) {
        throw 'The compatibility check requires all three resolved UTP result-listener graphs.'
    }
    $httpClasspath = $null
    foreach ($scope in $listeners) {
        $client = @($tooling.Components | Where-Object { $_.group -ceq 'org.apache.httpcomponents' -and $_.name -ceq 'httpclient' -and $_.scopes -ccontains $scope.id })
        $mime = @($tooling.Components | Where-Object { $_.group -ceq 'org.apache.httpcomponents' -and $_.name -ceq 'httpmime' -and $_.scopes -ccontains $scope.id })
        if ($client.Count -ne 1 -or $mime.Count -ne 1 -or $client[0].version -cne $mime[0].version -or
            [version]$client[0].version -lt [version]'4.5.13' -or [version]$client[0].version -ge [version]'5.0.0') {
            throw 'The UTP result-listener needs aligned, fixed HttpClient/HttpMime 4.x modules.'
        }
        $classpath = Get-ToolingClasspath $scope.id
        if ($httpClasspath -and $httpClasspath -cne $classpath) { throw 'UTP result-listener graphs have different verified artifacts.' }
        $httpClasspath = $classpath
    }
    Write-Host "[tooling] HttpClient/HttpMime $($client[0].version) in UTP result-listener tooling"
    Invoke-ToolingJava $javac @('--release', '8', '-cp', $httpClasspath, '-d', $work, (Join-Path $PSScriptRoot 'ToolingHttpSmoke.java'))
    Invoke-ToolingJava $Java @('-cp', ($work + $separator + $httpClasspath), 'ToolingHttpSmoke')
} finally { Remove-GeneratedPath -Path $work -Root $tempRoot }
