# slot. Android 11 patches (Morphe)

Morphe patch bundle that lets **slot. for Android** (`fyi.slot.konkr`, by Baggio94)
install on **Android 11** by lowering `minSdkVersion` from 31 to 30.

Unofficial and untested on a real device. Not affiliated with Morphe or the slot. author.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/saiyupunch/sai-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 slot.&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `fyi.slot.konkr`

**🎯 Supported versions:**

| 2.1.0 | 2.0.0 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Android 11 support](#android-11-support) | Lowers the minimum Android version from 12 (API 31) to 11 (API 30) so the app can be installed on Android 11. |  |

</details>

<!-- PATCHES_END -->

The single patch, **Android 11 support**, sets `android:minSdkVersion="30"` in AndroidManifest.xml.

## Known limitations
- The Bluetooth status icon needs the Android 12-only BLUETOOTH_CONNECT permission, so it stays hidden on Android 11.
- The app's native emulator cores were built against API 31. If one uses a function Android 11 lacks, the app may crash when that core loads.
- Targets slot. v2.1.0 (and v2.0.0). Edit `Constants.kt` if a release reports a different versionName.

## Build
Needs Java 17+ and a GitHub token with `read:packages` (Morphe's plugin is on GitHub Packages).

    export GITHUB_ACTOR=your-username
    export GITHUB_TOKEN=your-token
    ./gradlew buildAndroid        # -> patches/build/libs/patches-*.mpp

Apply the `.mpp` with Morphe Desktop, or publish via the template's `release.yml`
and add the repo as a patch source in Morphe Manager.

Based on https://github.com/MorpheApp/morphe-patches-template (GPLv3, see NOTICE).
