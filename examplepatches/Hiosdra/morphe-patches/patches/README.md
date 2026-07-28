# F1 TV Morphe Patches

This repository contains Morphe patches for the F1 TV Android app (`com.formulaone.production`).

## 📋 Available Patches

### 1. F1 TV - Picture-in-Picture
**File:** `F1TvPictureInPicturePatch.kt`  
**Target:** `BasePlayerActivity` (Bitmovin player)

Enables PiP for the standard Bitmovin player by removing the player pause call
from `onPause()`, adding a guarded `onUserLeaveHint()` entry point, and adding
the required `supportsPictureInPicture` and `resizeableActivity` manifest
attributes. The manifest edit is included automatically as a dependency.

### 2. F1 TV - Background playback
**File:** `F1TvBackgroundPlaybackPatch.kt`  
**Target:** `BasePlayerActivity`

Keeps playback attached when the activity stops by removing the player-view
`onPause()`, `PlayerSwitcher.onStop()`, and playback-use-case `detach()` calls.
This allows audio to continue while the app remains alive. Pair it with the
foreground-service patch below for stronger process lifetime protection.

### 3. F1 TV - Foreground playback service
**File:** `F1TvForegroundServicePatch.kt`
**Target:** `BasePlayerActivity`

Adds a small Android media-playback foreground service and starts it when the
player resumes. The patch also adds the required foreground-service manifest
permissions and an ongoing playback notification. It depends on the background
playback patch and the extension bundled in the `.mpp` file. The notification
provides Play/pause, Stop player, and Show PiP actions; tapping the notification
also restores the player/PiP activity.

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

The two universal Morphe patches `Disable Play Store updates` and `Change
package name` are separate patches from the official Morphe bundle. Select
them manually alongside the F1 TV patches when you want those behaviors; the
current patch API cannot express a dependency on a patch object supplied by a
different bundle, nor can it set options on that external patch. The requested
automatic selection remains a Morphe Manager integration item.

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
- **Version:** 3.0.48.1-SP157.6.0-release-R52-mobile
- **Version Code:** 30481000
- **Min SDK:** 29 (Android 10)
- **Target SDK:** 35 (Android 15)

## ⚖️ Legal Notice

> **These patches are intended only for applications that you own or are authorized to modify.**

F1 TV is a commercial service by Formula One. Only use these patches if:
- You have a valid F1 TV subscription
- You are modifying your own installed app for personal use
- You comply with F1 TV's Terms of Service and applicable laws

The patches do not bypass DRM, authentication, or subscription checks. They only modify playback behavior (PiP, background audio) for content you're already authorized to access.

## 🔧 Technical Details

### Architecture

The F1 TV app uses two separate player implementations:
1. **Bitmovin Player** (`BasePlayerActivity`) - Standard live/VOD playback with dual PlayerView for seamless channel switching
2. **Tiledmedia/ClearVR** (`TiledPlayerActivity`) - Multiview (multiple onboard cameras)

These patches target only the Bitmovin player path (`BasePlayerActivity`).

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
| 3.0.48.1-SP157.6.0-release-R52-mobile (30481000) | current main | ✅ Applied and rebuilt |
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
