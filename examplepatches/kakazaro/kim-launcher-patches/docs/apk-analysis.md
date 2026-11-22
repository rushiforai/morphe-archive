# Kim Launcher 1.0.2781 — APK analysis

Static analysis of `refer-apk/kim-launcher-1.0.2781.apk`. Nothing was executed; every
statement below is an **observation** from the shipped files unless marked *inference* or
*unknown*.

## 1. Identity

| Field | Value |
|---|---|
| File SHA-256 | `f28371f318f860d639725e14410b88bdf40181412d8949830aab9e0f0f65f91c` |
| Package | `com.kimkim` |
| Label | Kim Launcher |
| versionName / versionCode | `1.0.2781` / `2393` |
| minSdk / targetSdk / compileSdk | 24 / 29 / 36 |
| ABIs | `arm64-v8a` only |
| Dex | single `classes.dex` (10.8 MB, 9 393 smali classes, R8-obfuscated) |
| Signing cert | `CN=Android Debug, O=Android, C=US` (v1 `META-INF/CERT.RSA`) |
| Cert SHA-256 | `faea5495063d996c3a8977c4f08dce328b92087cc5c9c743bba4b18231c14f72` |
| Application class | `com.kimkim.KimApplication` |
| Default process | `com.byd.warning` (deliberately named like a BYD system process) |

Target platform: **BYD DiLink head units** (Atto 2/3, Dolphin, Seal, Seal U (DM-i), Seal 5 DM-i,
Han, Tang, M6; 3D models in `assets/flutter_assets/assets/models/*.glb`).

## 2. Architecture

The app is **Flutter (Dart AOT) plus a large Kotlin native layer**.

```
┌──────────── Dart (lib/arm64-v8a/libapp.so, 17 MB AOT snapshot) ────────────┐
│ UI, dashboard, Widget Studio, settings, PRO/Trial entitlement logic,       │
│ OTA download, Kim AI orchestration, PWA pairing, i18n strings               │
└──────────────┬────────────────────────── MethodChannel / EventChannel ─────┘
               │  ~50 channels, all registered in KimLauncherActivity
┌──────────────▼──────────── Kotlin / Java (classes.dex) ────────────────────┐
│ com.kimkim.*  activities + Application                                      │
│ byd.*         BYD vehicle bridge, daemons, Sentry, IC (cluster) cast,       │
│               key mapping accessibility service, camera, voice              │
│ r2.a          "is this a BYD head unit?" check                              │
│ Mapbox Maps/Navigation, ONNX/sherpa-onnx (voice), TFLite (YOLO), WebRTC,     │
│ Filament (3D car), OkHttp, WorkManager, Room                                 │
└─────────────────────────────────────────────────────────────────────────────┘
```

Original source layout (from `assets/flutter_assets/assets/kim_guide/feature_inventory.json`
`sourcePaths`): `lib/main.dart`, `lib/services/*.dart`, `lib/ui/*.dart`,
`lib/widget_studio/*.dart`, `android/app/src/main/kotlin/byd/*.kt`, `tracker_pwa/public/app.js`.

### What Morphe can and cannot reach

| Layer | Patchable with Morphe bytecode/resource patches? |
|---|---|
| `classes.dex` (Kotlin/Java) | **Yes**: fingerprints + smali edits |
| `AndroidManifest.xml`, `res/` | **Yes**: resource patches |
| Dart logic in `libapp.so` | **No** (native AOT code). Influence it only through what the Kotlin side returns over MethodChannels. |
| Dex loaded at runtime (`byd/BydRuntimeClassLoaderBootstrap`, channels `byd_oem_dex`, `byd_fallback_dex`) | No: not in the APK's dex at patch time |
| Other `.so` libraries | No |

## 3. Components (manifest)

Activities

| Class | Exported | Notes |
|---|---|---|
| `com.kimkim.KimDeviceGateActivity` | via alias | Launcher entry; target of `MainActivityLauncher` alias (`MAIN`/`LAUNCHER`/`HOME`) |
| `com.kimkim.KimLauncherActivity` | no | The `FlutterActivity`; registers every MethodChannel (14 437-line smali) |
| `com.kimkim.MainActivity` | yes, **disabled** | Legacy entry |
| `byd.ExternalMapIcStackSeedActivity`, `byd.IcBlindSpotActivity` | no | Instrument-cluster helpers |

Services: `byd.MusicNotificationListenerService`, `byd.KimKeyAccessibilityService` (steering-wheel
key mapping), `byd.ai.KimWakeWordListenerService`, `byd.voice.KimSherpaVoiceService`
(`:kim_voice` process), `byd.IcCastMainOverlayService`, `byd.VehicleLocationService`,
`byd.SentryForegroundService`, `byd.ChargeLimitForegroundService`, `byd.AdbRecoveryJobService`.

Receivers: `byd.SentryRecoveryReceiver`, `byd.DiLink5HomeRecoveryReceiver` (disabled),
`byd.AdbRecoveryBootReceiver`, `byd.SentryBootReceiver`.

Permissions of note: ~60 `android.permission.BYDAUTO_*`, `BYD_CAMERA`,
`com.byd.ditrainer.permission.CORE`, `WRITE_SECURE_SETTINGS`, `INJECT_EVENTS`,
`INTERNAL_SYSTEM_WINDOW`, `STATUS_BAR`, `REQUEST_INSTALL_PACKAGES`, `QUERY_ALL_PACKAGES`.
*Inference:* the privileged ones are granted over ADB (the in-app "ADB setup guide" asset).

## 4. Startup flow

1. `KimApplication.attachBaseContext/onCreate` calls `byd.BydRuntimeClassLoaderBootstrap.bootstrap`
   (loads BYD framework classes or a fallback dex) and `r2.a.a(Context)`.
2. Launcher icon / HOME starts `KimDeviceGateActivity.onCreate`:
   - `r2.a.a(this)` **false**: shows a TextView *"Kim Launcher is available only on BYD head
     units.\n\nThis Android device is not supported."* and stops.
   - **true**: forwards action/data/extras to `KimLauncherActivity`
     (flags `0x24000000` = `NEW_TASK | CLEAR_TOP`) and finishes.

### Device gate `r2.a.a(Landroid/content/Context;)Z`

Cached in static `Boolean r2.a.b`, computed under `monitor-enter`. Observed inputs:

- `Build.BRAND/MANUFACTURER/PRODUCT/DEVICE/MODEL/FINGERPRINT/DISPLAY` joined, lower-cased,
  checked for `"byd"`, then `"dilink"` (further branches follow).
- Class probes (`r2.a.c`): `android.hardware.BYDAutoManager`,
  `android.hardware.bydauto.BYDAutoDeviceManager`,
  `android.hardware.bydauto.speed.BYDAutoSpeedDevice`,
  `android.hardware.special.BYDAutoSpecialDevice`.
- Package probes (`r2.a.d`): `com.byd.carsettings`, `com.byd.airconditioning`,
  `com.byd.data.collect`.

Callers: `KimApplication`, `KimDeviceGateActivity`, `MainActivity`,
`byd.KimKeyAccessibilityService`, `byd.SentryForegroundService`, `byd.SentryBootReceiver`,
`byd.SentryRecoveryReceiver`, `byd.DiLink5HomeRecoveryReceiver`, `K1.q`.

Stable fingerprint anchors: the class `<clinit>` strings above; the method is
`public final a(Landroid/content/Context;)Z` (non-static, one `Context` param).
The gate text string is a stable anchor for `KimDeviceGateActivity.onCreate`.

## 5. MethodChannels (Kotlin ⇄ Dart)

All are created in `KimLauncherActivity` as `new E5/q(messenger, "<name>")` (E5.q is the
obfuscated `io.flutter.plugin.common.MethodChannel`), each with an obfuscated handler
(often the R8-merged lambda class `A0/g` with an int switch id).

`byd`, `byd.vehicle(/events)`, `byd.kim_ai(/events, /proactive_events)`, `byd/adb`,
`byd/adb_restore`, `byd/automation`, `byd/custom_ic_theme`, `byd/external_dashcam`,
`byd/front_object_detection`, `byd/guide_adb`, `byd/ic_live_editor`, `byd/ic_map`,
`byd/ic_turn_signal_camera`, `byd/key_mapping`, `byd/kim_remote_navigation`, `byd/launcher`,
`byd/live_camera(_view)`, `byd/location_tracking(/events)`, `byd/music(/events, /spectrum…)`,
`byd/native_geocoder`, `byd/native_kim_map`, `byd/native_navigation(/events)`,
`byd/native_vehicle_scene`, `byd/native_vehicle_texture`, `byd/navigation`, `byd/navigation_vd`,
`byd/permissions`, `byd/proximity_key`, `byd/telegram_debug`, `byd/update` (handler `A0/g` id
`0x16`), `byd/voice_packs(/events)`, `byd/wallpapers`, `byd_apa`, `byd_native_voice_assistant`,
`kim/config_exchange`, `kim_charge_limit_hal`, `kim_external_map_ic_cast`,
`kim_ic_cast_overlay_position`, `kim_qcarcam`, `kim_smart_key_probe`.

A channel name string plus its `MethodChannel.<init>` call is the most reliable fingerprint
for locating a feature's native handler; class/method names are obfuscated and change per
build.

## 6. Network endpoints seen in Dart strings

`https://kim.storageclbsync.cc/android/PackageInstaller.apk` (OTA installer),
`https://botbtc.online/kim-search`, Overpass API mirrors (`overpass-api.de`,
`overpass.kumi.systems`, `overpass.private.coffee`), Mapbox. *Unknown:* the full request set;
backend URLs may be assembled at runtime.

## 7. Commercial entitlement (out of scope)

The Dart layer implements a **PRO / Trial subscription** (strings `_remoteEntitlement`,
`entitlementPaid`, `entitlementExpiresAt`, `setEntitlement`, "Vehicle and proactive controls
require an active Kim Pro trial or paid plan", "Studio editing requires PRO/Trial…", OTA
updates limited to Trial/PRO, QR pairing with the Kim PWA for a 7-day trial). Sentry, Studio
editing, vehicle controls, Key Mapping, IC cast and OTA are gated on it.

**This project does not bypass, weaken or extend the entitlement or licensing checks.** Use PRO
features by buying them from the developer. How the check works, and a read-only patch that only
shows its result, are in [entitlement-check.md](entitlement-check.md).

## 8. Re-signing / tamper considerations

- No app-level APK-signature check found in the app's own dex code (`byd/*`, `com/kimkim/*`);
  the only `Signature` readers are library code (FontsContract, Google Play services).
- No `package_info` `buildSignature` / `installerStore` strings in `libapp.so`.
- *Unknown:* server-side checks that tie the install to a signature or package name.
- Package name `com.kimkim` is hard-coded (paths such as
  `/storage/emulated/0/Android/data/com.kimkim/files/wallpapers`, FileProvider authority
  `com.kimkim.fileprovider`). **Do not rename the package.**
- Re-signing with a Morphe key changes the signer: an existing install must be uninstalled
  first (data lost unless exported with the in-app backup), and the in-app OTA will download
  the upstream build, which will not install over the patched one.

## 9. Reproducing this analysis

Tools (not committed; kept outside the repo in `C:\Workspace\tools`):

- apktool 3.0.3: `java -jar apktool.jar d -f -r -o .work/smali refer-apk/kim-launcher-1.0.2781.apk`
- JADX 1.5.6: `jadx --no-res --show-bad-code -d .work/jadx refer-apk/kim-launcher-1.0.2781.apk`
  (stalls around 82% on the 4.6 MB `byd/e` class; the rest of the output is usable)
- Dart strings: printable ASCII runs of ≥6 chars from `lib/arm64-v8a/libapp.so`
- REA (`rea-agents@6.7.0`) is registered for Claude Code in `~/.claude.json` with the JADX
  headless MCP JAR; start a fresh session for its `inspect_android_*` tools to appear.

Windows caveat: apktool output on a case-insensitive file system renames colliding
packages (e.g. `r2/` and `R2/` become `r2/` and `r2.1/`). Search smali by the `.class` header,
not by path.
