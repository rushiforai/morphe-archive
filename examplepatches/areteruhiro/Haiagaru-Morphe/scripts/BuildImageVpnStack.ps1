param(
    [Parameter(Mandatory=$true)][string]$GoRoot,
    [Parameter(Mandatory=$true)][string]$AndroidSdk,
    [Parameter(Mandatory=$true)][string]$NdkRoot
)
$ErrorActionPreference = 'Stop'
$taskRepo = Split-Path -Parent $PSScriptRoot
$taskGo = Join-Path $GoRoot 'bin/go.exe'
if ((& $taskGo version) -notmatch 'go1\.25\.1 ') { throw 'Go 1.25.1 is required' }
if (!(Test-Path -LiteralPath (Join-Path $NdkRoot 'source.properties'))) { throw 'Missing Android NDK' }
$env:GOROOT = (Resolve-Path -LiteralPath $GoRoot).Path
$env:ANDROID_HOME = (Resolve-Path -LiteralPath $AndroidSdk).Path
$env:ANDROID_NDK_HOME = (Resolve-Path -LiteralPath $NdkRoot).Path
$env:GOPATH = Join-Path $taskRepo 'build/verification/vpn-tools/gopath'
$env:GOCACHE = Join-Path $taskRepo 'build/verification/vpn-tools/gocache'
$env:PATH = (Join-Path $env:GOROOT 'bin') + ';' + (Join-Path $env:GOPATH 'bin') + ';' + $env:PATH
Push-Location (Join-Path $taskRepo 'vpn/image-stack')
try {
    & $taskGo mod verify
    if ($LASTEXITCODE) { throw 'Dependency checksum verification failed' }
    & $taskGo test -trimpath -ldflags '-X runtime.modinfo=' ./...
    if ($LASTEXITCODE) { throw 'Offline private-stack tests failed' }
    foreach ($taskTool in @('gomobile','gobind')) {
        & $taskGo install ('golang.org/x/mobile/cmd/' + $taskTool + '@v0.0.0-20250911085028-6912353760cf')
        if ($LASTEXITCODE) { throw ('Tool installation failed: ' + $taskTool) }
    }
    $taskOutput = Join-Path $taskRepo 'vpn/image-stack/prebuilt/image-stack.aar'
    [System.IO.Directory]::CreateDirectory((Split-Path -Parent $taskOutput)) | Out-Null
    # gomobile's module replacements contain local directories even with trimpath.
    # Dependency versions and notices remain in go.mod, go.sum and the license files.
    & (Join-Path $env:GOPATH 'bin/gomobile.exe') bind -target android -androidapi 21 -trimpath `
        -javapkg app.morphe.extension.chmate.vpn.nativecore `
        -ldflags '-s -w -X runtime.modinfo= -extldflags=-Wl,-z,max-page-size=16384' -o $taskOutput .
    if ($LASTEXITCODE) { throw 'Android AAR build failed' }
    Get-FileHash -LiteralPath $taskOutput -Algorithm SHA256
    Write-Output 'After rebuilding, verify every ELF LOAD alignment and update ImageVpnResourcesPatch checksums before enabling it.'
} finally { Pop-Location }
