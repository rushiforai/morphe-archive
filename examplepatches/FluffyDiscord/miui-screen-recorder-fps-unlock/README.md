# 👋🧩 MIUI Screen Recorder FPS Unlock

Morphe patches for the MIUI / HyperOS Screen Recorder.

## ❓ About

Record at 120, 144, 165 and 185 fps instead of 90. The patched recorder installs next to the stock one.

- **Even frame pacing** — one video frame per screen frame, stamped with the frame's own time. The stock app uses an 8 ms timer, so it duplicates and drops frames.
- **Full-length clips** — the stock app can lose the start of a clip while it waits for a keyframe. Patched clips start at 0 s.
- **Still screen** — the last image repeats every 100 ms, so pauses stay in the clip.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=FluffyDiscord/miui-screen-recorder-fps-unlock

The recorder is a system app, so pull its APK off the phone first:

```
adb shell pm path com.miui.screenrecorder
adb pull /product/data-app/MIUIScreenRecorder/MIUIScreenRecorder.apk
```

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/FluffyDiscord/miui-screen-recorder-fps-unlock/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Screen Recorder&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 4.15.3.5.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Mark tile icon](#mark-tile-icon) | Cuts an "H" into the camera of the Screen Recorder tile icon. |  |
| [Unlock high frame rates](#unlock-high-frame-rates) | Adds 120, 144, 165 and 185 fps, encodes every new screen frame with its own timestamp, and installs the recorder as a separate app next to the stock one. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

FluffyDiscord Screen Recorder patches are licensed under the [GNU General Public License v3.0](LICENSE)
