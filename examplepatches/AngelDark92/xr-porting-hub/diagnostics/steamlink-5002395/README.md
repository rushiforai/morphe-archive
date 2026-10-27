# Steam Link 2.0.24 / 5002395 adaptation

> **2026-10-24:** Full-FOV foveal canvas retired and removed; later references in this record are historical.

Checked 2026-10-24 against the retained decoded tree
`android-steamlinkvr-release-base-2.0.24-5002395`. This is static and
host-side evidence; no headset, ADB, SteamVR or install run was performed.

## Exact inputs

| Input | Evidence |
|---|---|
| Decoded tree | `android-steamlinkvr-release-base-2.0.24-5002395` |
| Package metadata | `com.valvesoftware.steamlinkvr`, `2.0.24`, `5002395` |
| `lib/arm64-v8a/libvrlink_scene.so` | 2,301,432 bytes, SHA-256 `5fab23a7eac1429c93520bdd4d7c579b75a6d55525a755379d15388272571a4b` |
| `lib/arm64-v8a/libmain.so` | 15,929,432 bytes, SHA-256 `e59435bd0685a24b232b628986b191da43dda9a123f10977c2574b78d2b73e5c` |
| `assets/config/*.json` | Byte-identical to 2.0.23 |
| Decoded `AndroidManifest.xml` | Byte-identical to 2.0.23 |
| Smali | Only `BuildConfig` and SDL classes changed; `SteamLink.smali` is byte-identical |
| Native library set | Adds `libobuparse.so` and `libpyrowave-shared.so`; no patch targets them |

The pristine signed APK for this exact build was not present in the workspace during
the audit. The production patch helpers were exercised against the decoded scene and
main libraries; whole-APK Morphe application and installability remain unverified
until that source APK is supplied.

## Patch selection

The 2.0.24 pair exposes the same 11 public core patches and 10-patch recommended set
as 2.0.23:

| Patch | Adaptation |
|---|---|
| Visual Delay Fix | Hook `0x103174`; six velocity stores at `0x1033e8`..`0x10340c`; trampoline cave `0xc815c0` |
| OLED color calibration | Shader `0x97aae`; format MOVs `0x10da98`, `0x10db08`, `0x10db78` |
| Blue-noise dithering | Prefix `0x97aae`; masked `0xa3ceb`; opaque `0x99a51`; draw PCs `0xf2df4`/`0xf2ed4` |
| Microphone input preset | `MOV W1` at `0xf5710` |
| GXR face and tongue bridge | 24-byte transport block at `0x1433ac` |
| Network Optimizations | Scene `0x1682a0`, `0x169044`, `0x1772cc`; main `0x903634` |
| Codecs Support | Scene anchor `0xfe954`; 15 libmediandk GOT slots `0x231b58`..`0x231c60`; rebuilt helper |
| Galaxy XR high-resolution | Retains the 3-projection API-layer contract |
| Unrestricted battery usage | `SteamLink.onCreate` anchor unchanged; native-XR battery hook enabled |
| Controller velocity frame | Native-XR angular frame (`angularWorld = false`) |
| Controller pose time (experimental) | Scene profile `0x108f88`, `0xf5ff4`, `0x15e2b8`; rebuilt layer |

Optional base-agnostic layers (pose extrapolation, HAL pose, grip haptics, performance
boost, vendor driver, foveal canvas) are enabled for the pair. The GXR spacewarp layer
now has a 2.0.24 scene/VTS profile and is advertised for this build (experimental, off
by default); see the [spacewarp record](SPACEWARP-2026-10-26.md) for its pins. The
optional Codecs Support telemetry setting also fails closed for 2.0.24 (no admission
profile).

## Validation results

- `:patches:test` passed with **218 tests, 20 skipped, 0 failures** in the fresh
  local run (real-input audits whose retained decoded tree is not provisioned skip).
  With local junctions exposing the decoded trees under the legacy `decoded-apk-*`
  names, `VdSdrFoveaPatchTest` (11 tests) and `FovealCanvasPatchTest` (8 tests)
  executed with **0 skipped** and **0 failures**; the combined run was
  **217 tests, 8 skipped, 0 failures**.
- `:patches:auditSteamLink2395Native` passed: microphone (4 presets), tongue block,
  Visual Delay (hook, 6 stores, PT_LOAD/cave, 36 offset transitions), OLED (shader,
  3 formats, reversible VD suffix), blue-noise fovea/background hooks and OFF restore,
  Network Optimizations exact output hashes, and codecs/foveal/pose-time scene
  contracts with tamper rejection.
- `:patches:buildAndroid :patches:generatePatchesList -PreleaseChannel=stable` passed.
  The regenerated catalogs list 2.0.24 in the legacy-compatible, experimental and
  high-resolution scopes.

## Repeatable checks

```powershell
.\gradlew.bat :patches:test
.\gradlew.bat :patches:auditSteamLink2395Native
.\gradlew.bat :patches:buildAndroid :patches:generatePatchesList -PreleaseChannel=stable
```

The native audit requires the retained
`android-steamlinkvr-release-base-2.0.24-5002395` tree; it fails closed when the
exact bytes are absent rather than substituting a neighboring base.

## Runtime boundary

Headset behavior is not established. In particular, the rebuilt Codecs Support helper,
the rebuilt Controller pose time layer, the color calibration and blue-noise shaders,
the Android-surface high-resolution helper and the battery hook still need an
on-device run on this exact build.
