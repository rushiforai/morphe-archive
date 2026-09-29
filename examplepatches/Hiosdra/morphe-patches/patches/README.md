# Hiosdra Patches

This repository contains Morphe patches for the F1 TV Android app
(`com.formulaone.production`) and Movie Paradise (`com.techkitlabs.movieparadise`).

## 📋 Available Patches

### 1. F1 TV - Picture-in-Picture
**File:** `F1TvPictureInPicturePatch.kt`  
**Target:** `BasePlayerActivity` (Bitmovin player)

Enables PiP for the standard Bitmovin player. On Android 12 and newer it sets
the system auto-enter flag only while playback is active and not casting; on
Android 10 and 11 it uses a guarded `onUserLeaveHint()` entry point. It also
enables the PiP flag used by Tiledmedia multiview and adds the required
`supportsPictureInPicture` and `resizeableActivity` manifest attributes. The
manifest edit is included automatically as a dependency.

### 2. F1 TV - Background playback
**File:** `F1TvBackgroundPlaybackPatch.kt`  
**Target:** `BasePlayerActivity`

Keeps Bitmovin playback attached when the activity stops by removing the
player-view `onPause()`, `PlayerSwitcher.onStop()`, and playback-use-case
`detach()` calls. For multiview, it enables ClearVR's background-audio session
and its Media3 service. Pair it with the foreground-service patch below for
stronger process lifetime protection on the Bitmovin path.

### 3. F1 TV - Foreground playback service
**File:** `F1TvForegroundServicePatch.kt`
**Target:** `BasePlayerActivity`

Adds a small Android media-playback foreground service and starts it when the
player resumes. The patch also adds the required foreground-service manifest
permissions and an ongoing playback notification. It depends on the background
playback patch and the extension bundled in the `.mpp` file. The notification
provides Play/pause, Stop player, and Show PiP actions; tapping the notification
also restores the player/PiP activity.

### 4. F1 TV - Disable Play Store updates
**File:** `F1TvDisablePlayStoreUpdatesPatch.kt`
**Target:** F1 TV version-code reads

Sets the manifest version code to `Int.MAX_VALUE` so Play Store does not offer
an update, while replacing F1 TV's version-code reads with a bundled helper
that restores the original value to the app itself. This is an F1 TV-specific,
standalone adaptation of Morphe's GPLv3 patch and keeps the required source
and license attribution in the source file.

### 5. F1 TV - Change package name
**File:** `F1TvChangePackageNamePatch.kt`
**Target:** F1 TV `AndroidManifest.xml`

Changes the package name to install a separate F1 TV instance. It is an
F1 TV-specific, standalone adaptation of Morphe's GPLv3 Clone app patch and
supports the same `packageName`, `updatePermissions`, and `updateProviders`
options. The required Morphe and ReVanced attribution is retained in the
source file.

## 🚀 Building

```bash
# Build patches (.mpp file)
./gradlew :patches:buildAndroid

```

Outputs:
- `patches/build/libs/patches-*.mpp` - Patch bundle

## 📱 Installation in Morphe

1. Add this repository as a patch source in Morphe:
   - URL: `https://github.com/Hiosdra/morphe-patches`
   - Or use the one-click link: `https://morphe.software/add-source?github=Hiosdra%2Fmorphe-patches`

2. Enable desired patches in Morphe's patch list

The patch bundle includes standalone F1 TV copies of Morphe's `Disable Play
Store updates` and `Clone app`/`Change package name` patches. Select `F1 TV -
Disable Play Store updates` or `F1 TV - Change package name` directly from
this source; they do not require selecting the corresponding universal patch
from the official Morphe bundle. Their source files retain the required
Morphe/ReVanced attribution and GPLv3 notices.

### 6. F1 TV - Dismiss forced update prompt
**File:** `F1TvDismissForcedUpgradePatch.kt`
**Target:** F1 TV `GenericActivity` forced-update dialog

Allows closing the forced-update dialog without exiting F1 TV. The update
button remains available. This patch targets F1 TV 3.0.49.4.

### 7. Movie Paradise - GmsCore support (microG login)
**File:** `MovieParadiseGmsCoreSupportPatch.kt`
**Target:** Movie Paradise 5.2.0

Routes Google Play Services calls through MicroG-RE, adds the manifest entries
needed for package visibility and signature spoofing, and warns when MicroG-RE
is missing. The patch is disabled by default and depends on the PairIP license
bypass patch. Google sign-in has not been verified on a device.

### 8. Movie Paradise - PairIP license bypass
**File:** `MovieParadisePairipBypassPatch.kt`
**Target:** Movie Paradise 5.2.0

Neutralises the PairIP license check that otherwise terminates a repackaged
build. This is a prerequisite for the Movie Paradise GmsCore patch.

## 🐞 Debugging on a device

If playback still stops or Android shows an app-stopping message, capture the
system log while reproducing it:

```bash
adb logcat -c
adb logcat -b all -v threadtime \
  -s AndroidRuntime:V ActivityTaskManager:V ActivityManager:V \
  > f1-tv-logcat.txt
```

Start playback, press Home once, then stop logging with `Ctrl-C`. Useful lines
usually include `FATAL EXCEPTION`, `ForegroundServiceStartNotAllowed`,
`SecurityException`, or `Unable to start service`. Also capture:

```bash
adb shell dumpsys activity services com.formulaone.production
adb shell dumpsys package com.formulaone.production | grep -i -E 'picture|foreground|notification'
```

## 🎯 Target App Details

- **Package:** `com.formulaone.production`
- **Version:** 3.0.49.4-SP166.4.1-release-R54.2-mobile
- **Version Code:** 30494002
- **Min SDK:** 29 (Android 10)
- **Target SDK:** 35 (Android 15)

## ⚖️ Legal Notice

> **These patches are intended only for applications that you own or are authorized to modify.**

F1 TV is a commercial service by Formula One. Only use these patches if:
- You have a valid F1 TV subscription
- You are modifying your own installed app for personal use
- You comply with F1 TV's Terms of Service and applicable laws

The F1 TV patches modify playback behavior and the forced-update dialog for
content you are already authorized to access; they do not bypass F1 TV's DRM,
authentication, or subscription checks. Movie Paradise's optional GmsCore
patch uses the PairIP prerequisite described above; Google sign-in has not
been verified on a device.

## 🔧 Technical Details

### Architecture

The F1 TV app uses two separate player implementations:
1. **Bitmovin Player** (`BasePlayerActivity`) - Standard live/VOD playback with dual PlayerView for seamless channel switching
2. **Tiledmedia/ClearVR** (`TiledPlayerActivity`) - Multiview (multiple onboard cameras)

The PiP and background-playback patches cover both Bitmovin
(`BasePlayerActivity`) and Tiledmedia (`TiledPlayerFactoryMobile`). The
foreground-service patch applies to the Bitmovin path.

### Key Classes Patched

| Class | Package | Purpose |
|-------|---------|---------|
| BasePlayerActivity | com.avs.f1.ui.player | Main player Activity |
| PlayerSwitcherImpl | com.avs.f1.interactors.playback | Manages dual PlayerView, DRM, channel switching |
| PlaybackUseCase | com.avs.f1.interactors.playback | Activity/player attachment lifecycle |

### Bytecode Patching Strategy

The patches use Morphe fingerprints against exact lifecycle method calls and
the current `com.avs.f1` class descriptors. The PiP resource dependency edits
the decoded `AndroidManifest.xml` with the standard resource-patch API.

## 📝 Version Compatibility

| F1 TV Version | Patch Version | Status |
|---------------|---------------|--------|
| 3.0.49.4-SP166.4.1-release-R54.2-mobile (30494002) | current main | ✅ Six F1 TV patches; the forced-update dismiss patch was reported working by the user |
| Other F1 TV versions | — | ⚠️ Fingerprints may need updates |

Patches use fingerprints to target the exact player lifecycle calls. Update the
class descriptors and compatibility target when F1 TV updates.

## 🐛 Known Limitations

1. **Notification permission** - On Android 13 and newer, allow notifications for
   the F1 TV app so the foreground playback notification can be shown.

2. **Multiview** - TiledPlayerActivity is not targeted.

3. **Version pinning** - Update the compatibility target and fingerprints when
   F1 TV changes its player lifecycle or class names.

## 📚 References

- [Morphe Patcher Documentation](https://github.com/MorpheApp/morphe-patcher/tree/main/docs)
- [Android PiP Documentation](https://developer.android.com/develop/ui/views/picture-in-picture)
- [Media3 MediaSessionService](https://developer.android.com/media/media3/session/background-playback)
- [Bitmovin Player Android SDK](https://bitmovin.com/docs/player/sdks/android-sdk)

## 🤝 Contributing

1. Follow [Morphe development setup](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/README.md)
2. Use semantic commit messages (`feat:`, `fix:`, `chore:`)
3. Test on target F1 TV version before submitting PR
4. Update fingerprint when F1 TV updates

## 📄 License

GPLv3 - See [LICENSE](../LICENSE)
