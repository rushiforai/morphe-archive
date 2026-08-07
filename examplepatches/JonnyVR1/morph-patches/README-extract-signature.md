# Extract Tantan APK Signature

This folder contains scripts to extract the SHA-256 signature from the Tantan APK, which is needed to enable the "Use installed APK" option in Morph Manager.

## Quick Start

**Easiest method - Just run:**
```powershell
.\extract-signature.bat
```

This will:
1. Pull the APK from your device (if not already present)
2. Try multiple methods to extract the signature
3. Output the SHA-256 hash ready to add to `Constants.kt`

## Manual Methods

### Method 1: PowerShell Script
```powershell
.\extract-signature.ps1
```

### Method 2: Python Script
```powershell
python extract-signature.py
```

### Method 3: Manual apksigner
If you have Android SDK installed:
```powershell
# Find apksigner
Get-ChildItem -Path "$env:LOCALAPPDATA\Android\Sdk\build-tools" -Recurse -Filter "apksigner.bat" | Select-Object -First 1

# Use it
& "C:\Users\Jonathon\AppData\Local\Android\Sdk\build-tools\34.0.0\apksigner.bat" verify --print-certs .\tantan-7.3.6.apk
```

## What You're Looking For

The output will show something like:
```
Signer #1 certificate SHA-256 digest:
a32a43cd459f7ce6b82c552f5d876989d53e6af1c0b2d35fb677b51a1dc4f0e5
```

Copy the hash (without colons) and add it to `patches/src/main/java/com/p1/mobile/putong/data/Constants.kt`:

```kotlin
internal val tantanCompatibility = Compatibility(
    name = "Tantan",
    packageName = TANTAN_PACKAGE_NAME,
    description = "Tantan - Global Dating App",
    apkFileType = ApkFileType.APK_REQUIRED,
    signatures = setOf(
        "a32a43cd459f7ce6b82c552f5d876989d53e6af1c0b2d35fb677b51a1dc4f0e5"  // <-- Add here
    ),
    targets = listOf(
        AppTarget(
            version = "7.3.6",
            description = "Tested on 7.3.6",
        )
    )
)
```

## Troubleshooting

### "Not a signed jar file" error
This means the APK uses v2/v3 signing scheme. You need `apksigner` (not `keytool`).

### "apksigner not found"
Install Android SDK Command Line Tools:
https://developer.android.com/studio#command-tools

Or search for it:
```powershell
Get-ChildItem -Path "$env:LOCALAPPDATA" -Recurse -Filter "apksigner.bat" -ErrorAction SilentlyContinue | Select-Object -First 1
```

### "APK file not found"
Pull it from your device:
```powershell
adb shell pm path com.tantantribe.tribe
adb pull /data/app/~~I9ouu8Dy0osFDx6Wu-ynzA==/com.tantantribe.tribe-hlmqYxXoe5ADovZzRBpn2A==/base.apk .\tantan-7.3.6.apk
```

## Files

- `extract-signature.bat` - All-in-one batch script (recommended)
- `extract-signature.ps1` - PowerShell script
- `extract-signature.py` - Python fallback script
- `README-extract-signature.md` - This file
