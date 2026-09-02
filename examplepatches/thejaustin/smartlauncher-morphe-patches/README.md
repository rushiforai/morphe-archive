# 🚀 Smart Launcher 6 - Morphe Patch Suite

[![Add to Morphe](https://img.shields.io/badge/Add%20to-Morphe-7C3AED?style=for-the-badge&logo=android&logoColor=white)](https://morphe.software/add-source?github=thejaustin/smartlauncher-morphe-patches)
[![Download .mpp](https://img.shields.io/badge/Download-.mpp%20Package-10B981?style=for-the-badge&logo=android&logoColor=white)](https://github.com/thejaustin/smartlauncher-morphe-patches/releases/latest/download/smartlauncher-morphe-patches.mpp)
[![Build Status](https://img.shields.io/github/actions/workflow/status/thejaustin/smartlauncher-morphe-patches/release.yml?branch=main&style=for-the-badge&logo=github)](https://github.com/thejaustin/smartlauncher-morphe-patches/actions)

Custom **Morphe Patch Package (`.mpp`)** suite for **Smart Launcher 6**, specially designed for devices like the **Samsung Galaxy S22 Ultra** (One UI / Android 14+ / Android 15+ / Android 16+).

---

## 📲 Quick Installation

### Method 1: Add Source to Morphe Manager (Recommended)
Choose any of the options below directly on your Android device:

* 🌐 [**Option A: Add Source via Morphe Web Portal**](https://morphe.software/add-source?github=thejaustin/smartlauncher-morphe-patches)
* 📱 [**Option B: Add Source via Morphe Manager App Link (`morphe-manager://`)**](morphe-manager://add-source?url=https://raw.githubusercontent.com/thejaustin/smartlauncher-morphe-patches/main/patches-bundle.json)
* ⚡ [**Option C: Add Source via Morphe Protocol (`morphe://`)**](morphe://add-source?github=thejaustin/smartlauncher-morphe-patches)

---

### Method 2: Manual MPP Import
1. Download the latest **[`smartlauncher-morphe-patches.mpp`](https://github.com/thejaustin/smartlauncher-morphe-patches/releases/latest/download/smartlauncher-morphe-patches.mpp)** release file.
2. Open **Morphe Manager** on your Android device.
3. On the **Home Screen**, tap **Import Patches** (or **+**).
4. Select `smartlauncher-morphe-patches.mpp` from your **Downloads** folder.
5. Select **Smart Launcher 6** (`ginlemon.flowerfree`) APK and apply your desired patches!

---

## 🌟 Included Patches

### 1. 🙈 Hide archived apps (`hideArchivedAppsPatch`) - Enabled
- Filters archived apps (Android 15+ app archiving) out of the app drawer, the add-to-home-screen picker, and the shortcut picker.
- **Zero-Allocation Fast Path**: Uses high-performance flag checks (`FLAG_ARCHIVED`) and unlinked APK file checks to ensure 120Hz smooth scrolling without GC micro-stutters.
- Applying the patch is the toggle - there is no separate in-app setting required.

### 2. 📱 Native app archiving (`nativeArchivePatch`) - Enabled
- Integrates system `PackageInstaller.requestArchive` / `LauncherApps.archiveApp` native archiving runtime on Android 15+ / Samsung One UI 7.
- Automatically handles callback `IntentSender` dispatch and user notifications.

### 3. ⚡ Shizuku app archiving (`shizukuArchivePatch`) - Enabled
- Integrates Shizuku binder-level privileged execution (`IPackageManager` / shell) for app archiving on Android 14/15/16.
- Executes asynchronously on a background thread pool to prevent UI thread ANR freezes.

---

## 🛠️ Local Development & Building

Building the `.mpp` patch container locally:

```bash
# Clone the repository
git clone https://github.com/thejaustin/smartlauncher-morphe-patches.git
cd smartlauncher-morphe-patches

# Build Morphe Patch Package (.mpp)
./gradlew buildAndroid
```

The output `.mpp` container will be generated at:
`patches/build/libs/smartlauncher-morphe-patches.mpp`
