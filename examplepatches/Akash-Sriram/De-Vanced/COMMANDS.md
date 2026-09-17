# De-Vanced Commands Runbook

Executable command reference for developing, building, releasing, deploying, and debugging **De-Vanced** and **GooglePhotos-Patched**.

---

## 1. Local Building & Compilation

### Build Morphe Patches Bundle
Compiles Kotlin sources, generates DEX bytecode, and outputs `patches-*.mpp` + `patches-list.json`.
```bash
./gradlew :patches:buildAndroid generatePatchesList
```

### Compile Kotlin Only (Fast Verification)
Validates code changes and imports without packaging full DEX.
```bash
./gradlew :patches:compileKotlin
```

### Clean Build Cache
```bash
./gradlew clean
```

---

## 2. Release Management (GitHub CLI)

> **Note**: Releases are manual via `workflow_dispatch`. Commits to `main` do not auto-release.

### Trigger a Patch Release (`1.0.0` → `1.0.1`)
Automatically cuts a release, generates release notes, and triggers the downstream APK builder.
```bash
gh workflow run release.yml --repo Akash-Sriram/De-Vanced -f release_type=patch
```

### Trigger a Minor Release (`1.0.0` → `1.1.0`)
```bash
gh workflow run release.yml --repo Akash-Sriram/De-Vanced -f release_type=minor
```

### Trigger with Custom Version Tag
```bash
gh workflow run release.yml --repo Akash-Sriram/De-Vanced -f custom_tag=1.1.0
```

### Monitor Release Progress
```bash
gh run list --repo Akash-Sriram/De-Vanced -L 1
gh run watch --repo Akash-Sriram/De-Vanced
```

---

## 3. Downstream APK Builder (`GooglePhotos-Patched`)

### Trigger Downstream Build Manually
```bash
gh workflow run build_and_patch.yml --repo Akash-Sriram/GooglePhotos-Patched
```

### Monitor Downstream Build Status
```bash
gh run list --repo Akash-Sriram/GooglePhotos-Patched -L 1
gh run view --repo Akash-Sriram/GooglePhotos-Patched
```

### Download the Latest Patched APK
```bash
gh release download --repo Akash-Sriram/GooglePhotos-Patched --pattern "*.apk" --dir /tmp/
```

---

## 4. Device Deployment & ADB Operations

### Install Patched APK
```bash
adb install -r -d /tmp/GooglePhotos-*-patched.apk
```

### Fix Data Sandbox Ownership (Fix Crash if Restoring Files via Root)
```bash
APP_PKG="app.morphe.android.apps.photos"
APP_UID=$(adb shell pm list packages -U | grep "$APP_PKG" | sed 's/.*uid://')
echo "Setting permissions for UID: $APP_UID"

adb shell "su -c 'chown -R ${APP_UID}:${APP_UID} /data/data/${APP_PKG}/files /data/data/${APP_PKG}/shared_prefs'"
adb shell "su -c 'chmod 771 /data/data/${APP_PKG}/files /data/data/${APP_PKG}/shared_prefs'"
```

### Monitor Photos Crash Logs & Morphe Hooks
```bash
adb logcat -c
adb logcat | grep -E "AndroidRuntime|Morphe|PhotosModelSeeder|Phenotype"
```

---

## 5. Offline AI Models Management (Galaxy S24 / Non-Root)

### Verify Models on Device
```bash
# Check internal app sandbox
adb shell "run-as app.morphe.android.apps.photos ls -la files/datadownload/shared/public/"

# Check persistent media backup directory
adb shell "ls -la /storage/emulated/0/Android/media/app.morphe.android.apps.photos/"
```

### Pre-seed Models Offline via ADB (Alternative to Auto-Downloader)
```bash
# Push zip to persistent media cache
adb push photos_models.zip /storage/emulated/0/Android/media/app.morphe.android.apps.photos/photos_models.zip
```

### Scan Official App for New Models & Flags
```bash
cd ../GooglePhotos-Patched
python3 tools/sync_and_detect_new_models.py --diff-only
```

---

## 6. Repository & Security Maintenance

### Check Dependabot Security Alerts
```bash
gh api repos/Akash-Sriram/De-Vanced/dependabot/alerts --jq '.[] | select(.state == "open") | {pkg: .dependency.package.name, severity: .security_advisory.severity, summary: .security_advisory.summary}'
```

### List Open Pull Requests
```bash
gh pr list --repo Akash-Sriram/De-Vanced
```

### Merge a Dependabot PR
```bash
gh pr merge <PR_NUMBER> --repo Akash-Sriram/De-Vanced --squash --delete-branch
```
