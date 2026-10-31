# Spotify capture patches for Morphe (RootlessJamesDSP)

Minimal [Morphe](https://github.com/MorpheApp/morphe-manager) patch bundle for **`com.spotify.music`** intended to let [RootlessJamesDSP](https://github.com/timschneeb/RootlessJamesDSP) use **internal audio capture** on non-root Android.

> ## ⚠️ Status: the patch applies, but does not achieve its goal on current Spotify
>
> **What this patch does:** it applies cleanly and correctly rewrites everything it can reach — the manifest capture flag and every Java-side `setAllowedCapturePolicy` call site.
>
> **What it was trying to achieve:** audible, EQ-processed Spotify audio through RootlessJamesDSP.
>
> **Result: not achieved.** On the tested build, Spotify plays audio through the **native AAudio API** (`liborbit-jni-spotify.so`), which sets the capture policy via runtime `dlsym` on `AAudioStreamBuilder_setAllowedCapturePolicy`. That is unreachable by any bytecode patch, including ReVanced's original — the [RLJDSP README says so directly](https://github.com/timschneeb/RootlessJamesDSP#limitations). With this patch applied, RLJDSP still captures silence.
>
> **Is it useful to anyone?** Honestly: not to someone looking for a working Spotify EQ today. It *is* useful as a base for further work:
>
> - **Starting point for a native-level patch** — the fix would need to neutralise the `dlsym`-resolved capture policy in `liborbit-jni-spotify.so` (or force playback off AAudio), which is a different patching approach (targeted binary patching or an Xposed/LSPosed-style hook).
> - **Future-proofing** — if a Spotify build or device path returns to the Java `AudioAttributes` route, this bundle already handles it and fails fast with a diagnostic when it can't.
> - **Control verification** — documents precisely why the Java-level approach cannot work on AAudio-only builds, with measurements, so the next person doesn't repeat it.

This is **not** a Premium unlock, ad blocker, or UI mod. It mirrors the intent of RLJDSP's documented ReVanced workaround ("Remove screen capture restriction" / Spotify `disable-capture-restriction`): relax **capture policy** only.

### Add this patch source in Morphe

On your Android device, open:

**[Add Spotify capture patches to Morphe](https://morphe.software/add-source?github=aioue/morphe-spotify-capture-patches&name=Spotify%20capture%20(RLJDSP))**

(Morphe Manager → **Sources** → **+** → **Remote** also accepts `github.com/aioue/morphe-spotify-capture-patches`.)

**License:** GPL-3.0 (see [LICENSE](LICENSE)). Patch logic derives from [ReVanced PR #2095](https://github.com/ReVanced/revanced-patches-template/pull/2095) (Tim Schneeberger).

## Disclaimer

- You supply your own **stock Spotify APK** from a source you trust.
- Do **not** redistribute patched Spotify APKs.
- For personal EQ with RLJDSP; Spotify's terms may restrict modified clients.

## Tested on device

| | |
| --- | --- |
| App | `com.spotify.music` **9.1.88.2204** (versionCode **146816068**), universal APK, targetSdk 37 |
| Device | Pixel 8a, Android 17 |
| Patcher | Morphe Manager 1.34.0 / Morphe Patcher 1.15.1, bundle 1.0.1 |
| Capture target | RootlessJamesDSP 1.6.14 (ADB mode), EarFun Air Pro 3 over Bluetooth A2DP |

**Results, in order:**

1. **Patched APK did not launch** — Morphe Patcher's `STRIP_FAST` dex mode emitted 14 of 30 dexes with `class_defs_size = 0` but a stale nonzero `class_defs_off`, which ART rejects (`Failure to verify dex file ... Offset should be zero when size is zero for class-defs` → `ClassNotFoundException: com.spotify.music.SpotifyApplication` on every cold start). This is an upstream [MorpheApp/morphe-patcher](https://github.com/MorpheApp/morphe-patcher) bug, **not** a bug in this bundle; it is being reported separately. After repairing the 14 dexes out-of-band (zero the offsets, drop the stale map entries, recompute SHA-1/adler32, re-align, re-sign), the app launched and ran normally.
2. **Capture produced silence.** With the repaired APK installed and RLJDSP enabled, Spotify's track stays active and the inserted `DynamicsProcessing` effect stays enabled, but the A2DP output collapses from ~−12 dB to digital silence (−120 dB) within one second (`dumpsys media.audio_flinger` signal-power history). RLJDSP's own logs show its session watcher skipping the Spotify player entirely (`Session 0 skipped (uid=10341; package=com.spotify.music)`).
3. **Positive control passed.** A Morphe-patched YouTube (Java `AudioTrack` path) on the same device plays *through* RLJDSP with audible post-gain changes — the DSP engine, effect insert, and output path all work. The failure is specific to Spotify's AAudio playback path.
4. **Java layer was never the blocker on this build.** Stock 9.1.88.2204 already passes `ALLOW_CAPTURE_BY_ALL` in `AudioDriver.constructAudioAttributes`; the DRM enforcement happens in native code on the AAudio stream builder.

## What the patch does

1. Sets `android:allowAudioPlaybackCapture="true"` on `<application>` in `AndroidManifest.xml`.
2. In `com.spotify.*` bytecode, finds `AudioAttributes.Builder.setAllowedCapturePolicy` / `AudioManager.setAllowedCapturePolicy` calls and rewrites the preceding `const` to **`ALLOW_CAPTURE_BY_ALL` (1)**.
3. Fails fast with a diagnostic if no `com.spotify.*` method calls `setAllowedCapturePolicy` (a hint that the build is AAudio-only and no Java-level patch can help).

Ported from ReVanced `spotify/disable-capture-restriction` ([PR #2095](https://github.com/ReVanced/revanced-patches-template/pull/2095)), so a ReVanced-patched Spotify would behave identically — the limitation is the approach, not the toolchain.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/aioue/morphe-spotify-capture-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Spotify&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 9.1.88.2204 |
| :---: |
| Patch verified applying on Pixel 8a (Android 17); capture remains silent, see README |  |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Allow internal audio capture (RootlessJamesDSP)](#allow-internal-audio-capture-rootlessjamesdsp) | Sets allowAudioPlaybackCapture and ALLOW_CAPTURE_BY_ALL so RootlessJamesDSP can capture Spotify playback. Does not unlock Premium or remove ads. See https://github.com/timschneeb/RootlessJamesDSP#spotify-support-patch |  |

</details>

<!-- PATCHES_END -->

## Install (Morphe Manager)

1. Install [Morphe Manager](https://github.com/MorpheApp/morphe-manager).
2. Add this patch source with the [add-source link](#add-this-patch-source-in-morphe) on your phone, or paste `github.com/aioue/morphe-spotify-capture-patches` under **Sources** → **+** → **Remote**.
   Alternatively, grab a release **`.mpp`** from [GitHub Releases](https://github.com/aioue/morphe-spotify-capture-patches/releases) and add it as a local source.
3. **Other apps** → select your Spotify APK from storage.
4. Enable only **Allow internal audio capture (RootlessJamesDSP)**.
5. Patch and install. **Uninstall** the Play Store Spotify first (signature conflict).

## RootlessJamesDSP setup

Follow [RLJDSP Spotify support](https://github.com/timschneeb/RootlessJamesDSP#spotify-support-patch):

- Shizuku or ADB per RLJDSP docs.
- If capture is silent, disable **Exclude unsupported apps** in RLJDSP.
- Spotify **Nearby devices** permission can break Bluetooth capture ([#94](https://github.com/timschneeb/RootlessJamesDSP/issues/94)).
- Turn off conflicting EQ apps (Equalizer314, Wavelet) while testing.

## Build the `.mpp`

Requires JDK 17+ and a GitHub token with `read:packages` for [Morphe Gradle plugin](https://github.com/MorpheApp/morphe-patches-gradle-plugin):

```bash
export GITHUB_ACTOR=your_github_username
export GITHUB_TOKEN=ghp_...
./gradlew :patches:buildAndroid --no-daemon
```

Output: `patches/build/libs/patches-*.mpp`

Local patch test (Morphe Desktop / CLI):

```bash
java -jar morphe-desktop.jar patch -p patches/build/libs/patches-*.mpp Spotify.apk
```

Do not commit `*.apk` files.

## Develop / refresh fingerprints

When Spotify updates break the patch:

1. Decompile the APK (jadx / baksmali).
2. Search for `setAllowedCapturePolicy` under `com.spotify`.
3. Confirm a `const/4` or `const/16` loads `2` or `3` before the invoke.
4. Adjust [CapturePolicyBytecode.kt](patches/src/main/kotlin/app/spotify/capture/patches/spotify/CapturePolicyBytecode.kt) if the pattern changed.
5. Record version name and `versionCode` in the changelog and in [Constants.kt](patches/src/main/kotlin/app/spotify/capture/patches/shared/Constants.kt).

## Attribution

- [RootlessJamesDSP](https://github.com/timschneeb/RootlessJamesDSP) — use case and ReVanced patch documentation
- [ReVanced](https://github.com/ReVanced/revanced-patches-template) — Spotify capture restriction fix (PR #2095)
- [MorpheApp](https://github.com/MorpheApp/morphe-manager) — patcher and Manager
