# Steam Link 2.0.23/5002363 resource, startup, and identity audit

Audited 2026-09-15 against the supplied decoded directory and the matching signed source APK. This report records static compatibility evidence. It does not establish headset behavior, installation success, SteamVR behavior, or physical display precision.

## Source provenance

- Source: `../Best Apks/android-steamlinkvr-release-2.0.23-5002363.apk` from the repository root.
- APK size: `41,350,487` bytes.
- APK SHA-256: `36b21974db9f5cd9f54cdf850565b80d31c76a2dd7608406fe160e3005d976d6`.
- `aapt2 dump badging`: package `com.valvesoftware.steamlinkvr`, version name `2.0.23`, version code `5002363`, minimum SDK `29`, target SDK `32`, compile SDK `36`.
- `apksigner verify --verbose --print-certs`: verified APK Signature Scheme v2, 1 signer; certificate DN `O=Valve Corporation, L=Bellevue, ST=WA, C=01`.
- Certificate SHA-256: `5dff6b05761447a5bdf919ea88fc6fdf20d301e30b2315415c4d368ec0fbda45`.
- ZIP contains no duplicate entry names. Binary manifest, native scene library, and all 4 target config files match the supplied decoded base byte for byte.
- Fresh `apktool 3.0.3` decode of source `classes.dex`: all `104` smali files byte-identical to the supplied decoded tree. Original DEX size `146,600`; SHA-256 `36c985011ca45919f2e2f3cb57489237e449e3d83b2cf93071d661bf66dafb24`.

The source is available for an independent Morphe APK audit; it is not necessary to claim a decoded reconstruction is pristine. The original APK was not modified by these checks.

## Comparison with exact 2.0.22/5002322

| Surface | Actual difference |
|---|---|
| Decoded manifest | Only launcher `layout` default size: `1920x1080` to `1422x800`. Android XR permission declarations, features, activity classes, and launch modes unchanged. |
| `assets/config/hmd_config.json` | Byte-identical; SHA-256 `35a685195bb4bb3cb1645702f60dbec6453df8de005531263cf0606ada34c5a6`. |
| `assets/config/controller_config.json` | Byte-identical; SHA-256 `36a1947073bcda038f0a61934d212bd80228b8a3e2b581dd2eba5334ce6d20d7`. |
| `assets/config/default_config.json` | Byte-identical; SHA-256 `c09453fe38ac98dcdb809c3f90f32f9a6788dfdf24e33d5e036f396b9cafe506`. |
| `assets/config/ui_config.json` | Byte-identical; SHA-256 `abad22706b98a0f9528b8812c4c8b4068e8815f5c5245b143006566b0849a6d7`. |
| All assets | `75/76` identical; only Traditional Chinese web UI localization changed. |
| Resources | All `11` decoded resource files identical. |
| Smali | `102` to `104` files: `74` identical, `28` changed, `2` added (`ShellWiredInfo`, `ShellUsbTetherInfo`). |
| SteamLink methods | `52` to `55`; adds `getWiredInfo`, `getUsbTetherInfo`, `trySetupUsbNetwork`. Ignoring debug line numbers, changes constructor, `onCreate`, `onPause`, `onResume`; `startVRLink` unchanged. |
| Native libraries | `15/23` identical; scene, main, shell, OpenXR loader, and SDL3 libraries rebuilt. |

The stock controller config still declares `XR_EXT_hand_interaction`, the `/interaction_profiles/ext/hand_interaction_ext` profile, and grip/aim poses. The manifest still declares Android `HAND_TRACKING`, `EYE_TRACKING_FINE`, and `FACE_TRACKING`. Keep stock controller, hand, permission, and launcher routing.

## Exact native scene identity

- File: `lib/arm64-v8a/libvrlink_scene.so`.
- Size: `2,292,008` bytes.
- SHA-256: `628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0`.

Addresses below were read from this ELF's dynamic symbols and AArch64 disassembly. Listed addresses are also file offsets for these loadable code/string locations. They were not inferred by applying a uniform offset to the previous build.

## High-resolution API-layer contract

`QSVLRendererXR::SetupSwapchains(XRQContext const&, unsigned, unsigned, AtlasMode)` begins at `0x10C780`, size `1,384` bytes. The function contains `3` swapchain/projection-view families inside the `2`-eye loop:

| Operation | Family 1 | Family 2 | Family 3 |
|---|---|---|---|
| Stock `GL_SRGB8_ALPHA8` format instruction | `0x10C840` | `0x10C8B0` | `0x10C920` |
| `XRQCreateSwapchain` call | `0x10C850` | `0x10C8C0` | `0x10C930` |
| `XRQCreateProjectionViewLayer` call | `0x10C870` | `0x10C8E0` | `0x10C950` |

The eye loop begins with index `0`, changes to index `1` at `0x10C958`, and branches back at `0x10C95C`. `QSVLRendererXR::FlipFrame(XRQContext const&, long*, long)` remains a `3,000`-byte function and calls this setup at `0x10D208`.

The existing `libgxr_ast.so` is an OpenXR API layer. It does not inject a native scene branch or alter these format instructions. Its source validates `3` source projection layers with `2` views each, preserves their images and formats, then appends a static `2x2` Android Surface quad. The high-resolution resource patch installs the helper and implicit-layer manifest, sets `GXR_RESOLUTION_MODE`, and removes obsolete resolution resources through its existing guarded cleanup. It does not add the earlier startup UI or permission flow. Shader/format adaptations belong to the independent OLED patch.

## Battery hook target

The new `SteamLink.smali` has `onCreate(Landroid/os/Bundle;)V` at line `1466`, with `.locals 2` and `4` total registers. Its first instruction at line `1470` is:

```smali
invoke-super {p0, p1}, Lorg/libsdl/app/SDLActivity;->onCreate(Landroid/os/Bundle;)V
```

The next instruction overwrites `p1` with `1`. Inserting the battery helper immediately after the superclass call therefore preserves the live `Activity` and saved-state `Bundle` arguments; inserting later would pass an invalid Bundle register. Existing `NativeBatterySettingsPatch` locates that exact method and superclass invocation, inserts `invoke-static/range` using registers `2..3`, and rejects incomplete existing helper hooks.

Only the exact modern family (`2.0.22/5002322`, `2.0.23/5002363`) receives this call. The helper-only DEX and `REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` declaration support the separately selectable battery patch. Earlier-startup guards keep custom splash, overlay, and tracking-permission request hooks inactive.

## Device identity lookup

`QSVLDeviceHmd::GetStaticProps(SVLStaticProps&)` begins at `0x100980`, size `2,800` bytes:

1. `0x1009A4..0x1009CC` loads string `staticProps` at `0xA374C` and selects that JSON object.
2. `0x1009E0` calls `GetDeviceProductName()`.
3. `0x1009EC` calls `Json::Value::isMember(product)`.
4. `0x100A08` branches to `0x100D28` when the product has no entry.
5. `0x100A24` selects `staticProps[product]` when it exists.
6. The miss path logs the missing device and calls `GetDeviceProductName()` again at `0x100D40` to construct generic identity fields. It does not select the `unknown` JSON template.

This is the same exact-product lookup contract as `5002322`. Explicit Quest Pro/Pico profiles must populate `xrvst2` and `xrvst2ue` when absent; changing only `unknown.sModelNumber` would not affect this path. `DeviceIdentityPatch` now enables its existing validated product-upsert helper for the exact new base. The Galaxy profile continues to supply the complete Galaxy XR transport identity. The patch remains optional and outside the recommended `6`-patch bundle.

## Public patch scope and transitive dependencies

The new exact base exposes `7` individual patches: high-resolution, modern tongue, microphone preset, unrestricted battery usage, Visual Delay Fix, OLED calibration, and optional Device identity. Its separate default recommendation bundle selects the first `6`.

Keep these `14` existing public patches excluded:

- Android XR native permission names; Force HMD initialization gates; Force lobby permission-state gate; Force stream XR gates.
- Legacy full face bridge; Appear on top; Controller velocity fix; Change package name.
- XR Core Runtime; XR Device Config Baseline; XR Input Routing Config; XR Manifest Capability Pack.
- Earlier startup permission requests; earlier startup splash and XR launch mode.

Dependency execution does not re-check patch compatibility. The guards in legacy runtime, config, direct-input, permission suppression, and startup mutation bodies therefore remain required. Device identity retains its historical legacy foundation dependency, but its build-aware mutations are skipped on the new native-XR base. Helper-only DEX packaging is distinct from installing startup or SDL/controller call sites. The modern tongue manifest dependency is idempotent because stock `FACE_TRACKING` is already present. Retired projection experiments remain retired.

## Evidence and checks

- Comparison artifacts: `build/audit-5002363/surface-comparison.json`, `surface-targets.diff`, and `5002363-surface-native-functions.json`.
- Source APK evidence: `source-apk-comparison.json`, `source-apk-badging.txt`, `source-apk-signature.txt`, and `source-apk-smali-comparison.json` in the same audit directory.
- `ConstantsTest` covers exact-family inclusion, incorrect version/build rejection, legacy exclusions, and preserved older compatibility lists.
- `PatchCompatibilityMatrixTest` covers exactly `7` eligible individual patches, `14` exclusions, the new `6`-patch bundle, old bundle membership/defaults, and absence of excluded public dependencies from the new recommendation.
- Source changes passed `git diff --check`. Full Kotlin and APK execution results are recorded by the main adaptation audit; the assertions above alone are not a claim that those runs passed.
