# Ooredoo Patches — My Ooredoo (com.algeria.selfcare.app.android)

Patches for the Algerian **My Ooredoo** app (Flutter-based), targeting its
detection & privacy surface. Developed from live analysis: every fingerprint
matches the actual smali of 1.5.11–1.5.13.

## Patches

| Patch | What it does |
|---|---|
| **Disable developer options detection** | Zeroes every `Settings$Secure.getInt("development_settings_enabled"/"adb_enabled")` inside `MainActivity`'s channel dispatcher and the rjsniffer gate; forces `DevelopmentModeCheck.*`, `usbDebuggingCheck`, `RootCheckerPlus.isDeveloperMode` to `false`. Kills the **"For your safety, please turn off developer settings"** dialog (works with Developer Options ON). |
| **Disable root & emulator detection** | Forces `Rttx.r()`, all 8 `BinaryProtections` checks, `RootedCheck.isJailBroken`, `ExternalStorageCheck.isOnExternalStorage`, `EmulatorCheck.isEmulator`, `Emulate.isEmulator/isEmulator2`, `RootCheckerPlus` root check → `false`. |
| **Remove CleverTap tracking** | `MainActivity.onCreate` returns right after `super.onCreate` — CleverTap init (with `"Identity,Phone"` collection) never runs. |
| **Disable Play Integrity** | `Play.apic` instantly answers `"DISABLED"` — no attestation request (Play Integrity cannot be forged; this avoids the failure path). |

## Compatibility

- `com.algeria.selfcare.app.android` — stable version 1.5.13
- No certificate restriction: the patch list accepts the stable APK/XAPK variants.
- Verified behavior on Realme RMX3706 / Android 16: no dev-options dialog,
  no root dialog, no crash, app fully functional (login + flows).

> Note: the app's own OkHttp/API traffic is already NOT pinned (network-security-config
> trusts user CAs and allows cleartext). VdoPlayer (video DRM) and Huawei HMS SDK keep
> their own pinned BKS stores — those only protect video/HMS paths.

## Architecture note

Following the repo convention: `myooredoo/shared/Constants.kt` declares the
compatibility contract; each patch lives under `myooredoo/misc/<category>/`
(developeroptions, rootdetection, privacy, integrity). The patch list generator
picks up the package automatically.
