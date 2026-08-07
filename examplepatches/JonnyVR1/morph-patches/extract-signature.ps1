# Extract APK Signature Script
# Finds apksigner and extracts SHA-256 signature from Tantan APK

param(
    [string]$ApkPath = ".\tantan-7.3.6.apk"
)

Write-Host "=== APK Signature Extractor ===" -ForegroundColor Cyan
Write-Host ""

# Check if APK exists
if (-not (Test-Path $ApkPath)) {
    Write-Host "Error: APK file not found at $ApkPath" -ForegroundColor Red
    Write-Host "Please run: adb pull /data/app/~~I9ouu8Dy0osFDx6Wu-ynzA==/com.tantantribe.tribe-hlmqYxXoe5ADovZzRBpn2A==/base.apk .\tantan-7.3.6.apk" -ForegroundColor Yellow
    exit 1
}

Write-Host "APK found: $ApkPath" -ForegroundColor Green
Write-Host ""

# Function to find apksigner
function Find-ApkSigner {
    $locations = @(
        "$env:LOCALAPPDATA\Android\Sdk\build-tools",
        "$env:ProgramFiles\Android\Android Studio\jbr\bin",
        "$env:ProgramFiles(x86)\Android\Android Studio\jbr\bin"
    )
    
    # Check if apksigner is in PATH
    $inPath = Get-Command apksigner -ErrorAction SilentlyContinue
    if ($inPath) {
        return $inPath.Source
    }
    
    # Search in common locations
    foreach ($location in $locations) {
        if (Test-Path $location) {
            $buildTools = Get-ChildItem $location -Directory | Sort-Object Name -Descending
            foreach ($version in $buildTools) {
                $apksignerPath = Join-Path $version.FullName "apksigner.bat"
                if (Test-Path $apksignerPath) {
                    return $apksignerPath
                }
            }
        }
    }
    
    return $null
}

# Try to find apksigner
Write-Host "Searching for apksigner..." -ForegroundColor Yellow
$apksignerPath = Find-ApkSigner

if ($apksignerPath) {
    Write-Host "Found apksigner at: $apksignerPath" -ForegroundColor Green
    Write-Host ""
    Write-Host "Extracting signature..." -ForegroundColor Yellow
    Write-Host ""
    
    # Run apksigner
    $output = & $apksignerPath verify --print-certs $ApkPath 2>&1
    
    # Parse output for SHA-256
    $sha256Line = $output | Select-String "SHA-256"
    
    if ($sha256Line) {
        Write-Host "=== Signature Found ===" -ForegroundColor Green
        Write-Host $sha256Line -ForegroundColor White
        Write-Host ""
        
        # Extract just the hash
        $hash = ($sha256Line -split ":")[-1].Trim()
        Write-Host "SHA-256 Hash (for Constants.kt):" -ForegroundColor Cyan
        Write-Host $hash -ForegroundColor Yellow
        Write-Host ""
        Write-Host "Add this to Constants.kt:" -ForegroundColor Cyan
        Write-Host "signatures = setOf(`"$hash`")" -ForegroundColor Yellow
    } else {
        Write-Host "Could not find SHA-256 in output" -ForegroundColor Red
        Write-Host "Full output:" -ForegroundColor Yellow
        Write-Host $output
    }
} else {
    Write-Host "apksigner not found in common locations" -ForegroundColor Red
    Write-Host ""
    Write-Host "Alternative methods:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "1. Download Android SDK Command Line Tools:" -ForegroundColor White
    Write-Host "   https://developer.android.com/studio#command-tools" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "2. Or use Python (if installed):" -ForegroundColor White
    Write-Host "   python extract-signature.py" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "3. Or manually find apksigner:" -ForegroundColor White
    Write-Host "   Get-ChildItem -Path `$env:LOCALAPPDATA -Recurse -Filter 'apksigner.bat' -ErrorAction SilentlyContinue" -ForegroundColor Cyan
}
