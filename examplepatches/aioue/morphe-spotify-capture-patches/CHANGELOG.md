# Changelog

All notable changes to this patch bundle are documented here.

## 1.0.0 (2026-10-09)

### 🐛 Bug Fixes

* add patches-list markers to README and refresh target note ([0da55d1](https://github.com/aioue/morphe-spotify-capture-patches/commit/0da55d1adbcd548e43ef30ad4bc3cd5c4d75bb3d))

### ✨ New Features

* Spotify capture patch bundle for Morphe (RootlessJamesDSP) ([6412766](https://github.com/aioue/morphe-spotify-capture-patches/commit/6412766f9955799d7e1063725d087dacb429f2ef)), closes [#2095](https://github.com/aioue/morphe-spotify-capture-patches/issues/2095)

# Changelog

All notable changes to this patch bundle are documented here.

## Unreleased

### Fixed

- Patching no longer fails when Spotify already passes `ALLOW_CAPTURE_BY_ALL` to `setAllowedCapturePolicy` (e.g. 9.1.88.2204 `AudioDriver.constructAudioAttributes`).

### Added

- Morphe patch **Allow internal audio capture (RootlessJamesDSP)** for `com.spotify.music`:
  - `android:allowAudioPlaybackCapture="true"` on `<application>`
  - Rewrites `setAllowedCapturePolicy` policy constants to `ALLOW_CAPTURE_BY_ALL` in `com.spotify.*` methods

### Tested on device (2026-10-09)

- Spotify 9.1.88.2204 (versionCode 146816068), stock APK from `/sdcard/Download/`
- Morphe Manager 1.34.0, Patcher 1.15.1, bundle 1.0.1 on Pixel 8a (Android 17, API 37)
- Patcher log: `Allow internal audio capture (RootlessJamesDSP) succeeded` — no exception, no call-site count
- Patched APK installed after uninstalling stock (signature change); app installs
- Patched APK crashed at cold start: Patcher's `STRIP_FAST` dex mode left 14 of 30 dexes with `class_defs_size=0` but a nonzero `class_defs_off` (header and map_list), which ART rejects — `ClassNotFoundException: com.spotify.music.SpotifyApplication` on every launch. Confirmed via `dexdump` class-def check and `Failure to verify dex file ... Offset(1395604) should be zero when size is zero for class-defs` in logcat.
- Post-fix (not the bundle): zeroed the stale offsets in the 14 empty dexes, recomputed dex SHA-1/adler32, re-signed with a separate keystore, reinstalled — two consecutive cold starts clean, `LoginActivity` resumes, empty crash buffer. Upstream Morphe Patcher bug report still to file (draft: [`docs/STRIP_FAST-dex-bug.md`](docs/STRIP_FAST-dex-bug.md)).

### Listen result (stock and patched)

- RootlessJamesDSP 1.6.14 captures Spotify's playback session but the output is **silence** (EQ on/off, post-gain changes make no difference; Spotify's stream is muted by RLJDSP while captured stream is empty)
- Root cause: stock Spotify playback runs on native **AAudio** via `liborbit-jni-spotify.so`, which resolves `AAudioStreamBuilder_setAllowedCapturePolicy` at runtime (`dlopen`/`dlsym`). The Java-side `constructAudioAttributes` constant this bundle rewrites is not the stream that carries audio, so bytecode patching cannot restore capture.
- Revoking Spotify's `BLUETOOTH_CONNECT`/`BLUETOOTH_SCAN` (RLJDSP issue #94 workaround) did not change the result.

### DSP-path A/B verification (2026-10-09, fixed APK installed)

- Positive control: Morphe-patched YouTube (Java `AudioTrack` path) plays **through** RLJDSP — post-gain changes are audible, so the DSP engine, effect insert, and output path all work on this device.
- Spotify A/B reproduced twice: RLJDSP toggle drops the A2DP HAL output from ~-12 dB to -120 dB (digital silence) within one second (`dumpsys media.audio_flinger` signal power history); Spotify's own track stays active with frames ready, and RLJDSP's DP effect on session 513 stays enabled — the effect mutes the original and the captured stream is empty, matching the AAudio root cause above.
- Spatializer ruled out: spatializer `mLevel: NONE`, zero active spatialized tracks, player `isSpatialized=false`; the SPATIALIZER-type output thread is just the normal A2DP mixer path on this device.
- RLJDSP log signature during the silent state: `BaseSessionDatabase: Session 0 skipped (uid=10341; package=com.spotify.music)` — its session watcher skips Spotify's player entirely.

### Known limits

- Playback that uses **AAudio only** (no Java `AudioAttributes` path) is not fixable with this patch. Current Spotify builds use this path (`liborbit-jni-spotify.so`), so the bundle is a control verification only, not a working capture fix.
- Patched Spotify is re-signed; uninstall stock Spotify before installing.
- Anti-tamper or integrity checks on newer Spotify builds may prevent startup without separate patches (out of scope).

### Codec matrix — Wavelet vs capture-based DSP (2026-10-09, aptX)

Motivation: determine whether the RLJDSP silence finding is codec-entangled (aptX offload bypassing the effect chain) or capture-policy-specific. Test: session-effect app (Wavelet) on Spotify over aptX, dumpsys ground truth + listen test.

- Device state: Spotify 9.1.88.2204 playing (session 769, pid 29979), Pixel 8a ↔ EarFun Air Pro 3, negotiated codec **AptX 44.1 kHz/16-bit/stereo** (`dumpsys bluetooth_manager` `Current Codec: AptX`). Headphone selectable codecs: AptX/AAC/SBC only — no LDAC/aptX-HD on the headphone side.
- Installed Spotify is the **re-signed patched build** (firstInstall 2026-10-09 22:11). The patch is **ruled out as the enabler**: RLJDSP on this same build still captured silence at 22:14 (see A/B above), and effect insertion never consults the capture policy the patch modifies.
- Spatializer state during test: `isSpatializerEnabled: false`; full section shows `mHasSpatializerEffect:false`, `mState: STATE_NOT_SUPPORTED` since boot (`init(): setting state to STATE_NOT_SUPPORTED due to effect not expected`). The Pixel 8a is A-series — spatial audio is unsupported on this device (no toggle exists anywhere in Settings; [supported models list](https://support.google.com/pixelphone/answer/12967594) excludes A-series). **Spatial audio cannot be the variable** in the Wavelet #438 legacy+aptX failure on this phone.
- ESD A/B (notification listener grant/revoke, fresh session each arm): Wavelet's DynamicsProcessing attaches on a fresh session **regardless of Enhanced Session Detection state** (sessions 769, 977, 985 — three for three).
- **Attach mechanism (verified arm-by-arm on device, dumpsys ground truth, codec aptX throughout)**: Wavelet in **normal mode attaches its DP effect to Spotify's session even when power is turned on mid-session** (2/2 stable, plus two incidental mid-session attaches; sessions 985, 993, 1001, 1009, 1017, 1025 all attached). Session-start order is NOT the mechanism, and the main UI text "No new music sessions have been started yet" just means the power FAB is off, not that no session was seen. Track skip keeps the same session id and the effect stays.
- **Legacy mode is what fails on aptX (Pixel 8a)**: with legacy ON, the DP effect moves to **session 0 (global output mix)** — its In buffer is the thread mix buffer — and **no chain ever attaches to Spotify's session**, regardless of restarts, skips, or session timing. Matches the 2026-10-08 observation "legacy + aptX does not work". Normal mode is not affected.
- ESD grant state irrelevant (attached both granted and revoked); spatial audio irrelevant on this device (A-series, `mHasSpatializerEffect:false`, `STATE_NOT_SUPPORTED` since boot, no toggle exists).
- **Correction of the 2026-10-08 #438/#437 conclusions**: "legacy + AAC works, legacy + aptX does not" was a mode effect (legacy never per-session-attaches on aptX), not a codec effect. Residual: the 2026-10-08 "normal mode does not attach" report was on GrapheneOS `2026100201`; tonight normal mode works on `2026100601` (GrapheneOS update installed in between) — the OS update is the likely fix for normal mode on this device. Tonight's Spotify is the re-signed Morphe-patched build (patch does not touch the effect path); stock build not retested.
- Follow-up comment posted to [Wavelet #437](https://github.com/Pittvandewitt/Wavelet/issues/437#issuecomment-6090852363) (2026-10-09).
- Follow-up comment posted to [RootlessJamesDSP #353](https://github.com/timschneeb/RootlessJamesDSP/issues/353#issuecomment-6090995233) (2026-10-10): silence reproduced across the GrapheneOS update; session accepts inserts (Wavelet control), capture path returns empty.
- Wavelet on: `dumpsys media.audio_flinger` shows **Effect ID 195, DynamicsProcessing** (insert mode, Enabled) attached to **session 769** on the SPATIALIZER-named output thread (normal A2DP mixer path; track flags 0x000, no DIRECT/OFFLOAD offload). Listen test confirmed audible processing.
- Conclusion: the aptX path does **not** bypass the session-effect chain. Spotify's AAudio stream exposes a normal session that accepts global session effects. The liborbit `setAllowedCapturePolicy` problem blocks playback **capture** (RootlessJamesDSP mechanism), not effect insertion (Wavelet mechanism).
- The −120 dB silence finding is capture-policy-specific, not codec-entangled. Correction for the earlier A/B section above: it was run on aptX, and the controlling variable is capture policy, not codec.
- Practical result: **PEQ on aptX without root is possible with a session-effect app** (Wavelet; AutoEq parametric import supported). Root is unnecessary for EQ on this device.
- RLJDSP state at test start: engine off; Equalizer314 launcher disabled by user (as found).

### RLJDSP retest (2026-10-10 ~00:21–00:25, GrapheneOS 2026100601, aptX)

Question: with Wavelet verified working on aptX, does RLJDSP attach properly? Ground truth: `dumpsys media.audio_flinger` / `dumpsys audio` + listen test. Wavelet switched off first; Spotify session 1025 (AAudio, 44.1 kHz) playing throughout.

- **RLJDSP attaches at the session level**: enabling the engine put RLJDSP's own `DynamicsProcessing` (its Output control — limiter/post gain) **inline on Spotify's session 1025** (insert mode, sole client pid 30474). Same insertion mechanism Wavelet uses, on the same session — Spotify's AAudio session accepts it.
- Capture side also live: record track on `AUDIO_DEVICE_IN_REMOTE_SUBMIX`, `Hw silenced: no`, `not silenced` in the recording-activity log, frames read advancing at ~48 k/s, reads every ~39 ms.
- Re-injection live: RLJDSP's own `AudioTrack` (piid 1383, flags `NO_MEDIA_PROJECTION|NO_SYSTEM_CAPTURE`) `state:started` the whole time.
- **Listen result: total silence.** With engine on (Wavelet off), no audio at all; a +15 dB post-gain swing changed nothing. Toggling the engine off dropped the DP effect from session 1025 and removed piid 1383 within ~3 s, and music came back instantly. Spotify's own player showed `state:started`, `mutedState:none` — the system was not muting it; RLJDSP's chain (DP insert + capture/re-inject) delivers digital silence, matching the 22:14 finding ("Spotify's stream is muted by RLJDSP while captured stream is empty").
- **Conclusion: attach works; audio does not.** The Oct 9 silence finding reproduces on the post-update OS with the patched build — capture-based DSP is still non-functional on Spotify's AAudio path over aptX. The working no-root PEQ route remains session-effect insertion (Wavelet normal mode).
- BT sample rate ruled out (2026-10-10): Developer-options override 44.1 kHz vs "system selection" (negotiates 48 kHz) makes no difference — Wavelet processes audibly either way, RLJDSP still silent. Rate mismatch is resampled at AudioFlinger and cannot produce digital silence anyway.
