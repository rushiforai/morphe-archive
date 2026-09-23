[CmdletBinding()]
param([string]$Zig, [string]$OutputDirectory)
$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '../..')).Path
if (!$Zig) { $Zig = Join-Path $repo 'build/tooling/zig/ziglang/zig.exe' }
if (!$OutputDirectory) { $OutputDirectory = Join-Path $repo 'build/decoder-buffering/host-tests' }
$output = [IO.Path]::GetFullPath($OutputDirectory)
$allowed = [IO.Path]::GetFullPath((Join-Path $repo 'build/decoder-buffering')).TrimEnd('\') + '\'
if (!$output.StartsWith($allowed, [StringComparison]::OrdinalIgnoreCase)) { throw 'Test output must be under build/decoder-buffering' }
$null = New-Item -ItemType Directory -Force -Path $output
$cases = @(
    @{ Name = 'pool'; Source = 'staging_pool_test.cpp'; Flags = @() },
    @{ Name = 'fec-compat'; Source = 'fec_guard_compat_test.cpp'; Flags = @(); Arguments = @($repo) },
    @{ Name = 'pipeline'; Source = 'pipeline_test.cpp'; Flags = @() },
    @{ Name = 'bridge-5002322'; Source = 'bridge_test.cpp'; Flags = @('-DGXR_BUILD_CODE=5002322') },
    @{ Name = 'bridge-5002363'; Source = 'bridge_test.cpp'; Flags = @('-DGXR_BUILD_CODE=5002363') }
)
foreach ($case in $cases) {
    $exe = Join-Path $output ($case.Name + '.exe')
    $arguments = @('c++','-std=c++17','-O1','-g') + $case.Flags + @((Join-Path $PSScriptRoot ('tests/' + $case.Source)), '-o', $exe)
    & $Zig @arguments 2>&1 | Tee-Object -FilePath (Join-Path $output ($case.Name + '-compile.log'))
    if ($LASTEXITCODE -ne 0) { throw "Native test compile failed: $($case.Name)" }
    $testArguments = @($case.Arguments)
    & $exe @testArguments 2>&1 | Tee-Object -FilePath (Join-Path $output ($case.Name + '.log'))
    if ($LASTEXITCODE -ne 0) { throw "Native test failed: $($case.Name)" }
    # Delete only the test artifacts created above; retain their verification logs.
    foreach ($artifact in @($exe, [IO.Path]::ChangeExtension($exe, '.pdb'))) {
        $absolute = [IO.Path]::GetFullPath($artifact)
        if (!$absolute.StartsWith($output.TrimEnd('\') + '\', [StringComparison]::OrdinalIgnoreCase)) { throw 'Unsafe test cleanup path' }
        if (Test-Path -LiteralPath $absolute) { Remove-Item -LiteralPath $absolute -Force }
    }
}
$sources = Get-ChildItem (Join-Path $PSScriptRoot 'src'),(Join-Path $PSScriptRoot 'tests') -File -Recurse |
    ForEach-Object { @{ Path = $_.FullName; Sha256 = (Get-FileHash -LiteralPath $_.FullName).Hash.ToLowerInvariant() } }
@{ Status = 'passed'; Cases = @($cases.Name); BridgeScenariosPerBuild = 15; Sources = @($sources); DeviceTest = $false } |
    ConvertTo-Json -Depth 5 | Set-Content -LiteralPath (Join-Path $output 'result.json') -Encoding utf8
