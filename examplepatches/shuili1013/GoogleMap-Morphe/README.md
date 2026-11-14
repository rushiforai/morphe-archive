# Maps-AA-AnyMode-Morphe: two-wheeler navigation with Google Maps on Android Auto

**English** | [中文](README.zh-TW.md)

Makes **Google Maps navigate on an Android Auto head unit with its native car interface, including two-wheeler (motorcycle) routes**. Intended for an Android Auto screen mounted on a motorcycle: stock Google Maps only allows driving routes on Android Auto and refuses two-wheeler navigation.

Patched with [Morphe](https://morphe.software). The patched Maps installs under a different package, **alongside stock Google Maps**: keep stock Maps for driving, use the patched copy on the motorcycle.

> Experimental. On 2026-11-14, the user confirmed the patched Maps works on a **Galaxy S25 (Android 16) + Pernis MS700CL over wireless Android Auto 18**, after installing the patched APK with **KingInstaller Classic**. The successful test used the 1.0.3 bundle, including the template-only patch. Earlier tests also passed on the headunit emulator over USB. This does not establish compatibility with every phone or head unit. Test while parked before riding and follow local road signs.

## Features

- Native Google Maps map and turn cards on the head unit
- Two-wheeler mode gives a two-wheeler route and driving mode gives a driving route; the head unit no longer shows "To navigate on Android Auto, switch to ... directions"
- Search destinations on the head unit and navigate to several destinations in a row
- Google sign-in (through MicroG-RE) and location work

## Supported version

**Google Maps `26.44.06.1006895251` only (versionCode `1068856906`, arm64-v8a).** Every change is pinned to this build's obfuscated names; other versions fail at patch time (they do not produce a broken app). **Do not update** the patched app.

This project does not distribute Google Maps. Get the original APKM of the version above yourself (e.g. from APKMirror).

## What you need

| Item | Download |
|---|---|
| Morphe Manager | <https://morphe.software> |
| KingInstaller (for installing the finished APK on the tested Samsung setup) | [Official project and downloads](https://github.com/fcaronte/KingInstaller) |
| **This version of MicroG-RE** (required) | [shuili1013/MicroG-RE releases](https://github.com/shuili1013/MicroG-RE/releases/tag/v7.3.0-maps-fix) → `microg-re-maps-fix-7.3.0.apk` |
| This project's patch bundle | Add the remote source `github.com/shuili1013/Maps-AA-AnyMode-Morphe` in Morphe (or download `patches-1.0.3.mpp` from [Releases](https://github.com/shuili1013/Maps-AA-AnyMode-Morphe/releases) and add it as a local source) |

The bundle already includes the Dutch App Patches features it needs; you do not need to add Dutch App Patches separately.

### Why this version of MicroG-RE is required

Official MicroG-RE has two problems with a patched Google Maps, both fixed in this version of MicroG-RE:

1. **No sign-in, map and search fail**: MicroG-RE only gives account access to Google apps on its allow list, and Google Maps is not on it (log: `GmsAuthProvider: Not granting extended access`).
2. **No location**: Maps connects to the location service with the original `com.google.android.location.internal.GoogleLocationManagerService.START` action, while the official build only accepts the `app.revanced`-prefixed name (log: `Unable to start service ... not found`).

If official MicroG-RE is already installed, **uninstall it first**, then install this version of MicroG-RE (different signing key, Android cannot update over it). Afterwards open MicroG settings and run Self-Check.

## Installation

### 1. Prepare MicroG-RE and Morphe

1. **Install MicroG-RE** (link above) and run its Self-Check.
2. **Morphe settings → Patching → enable Expert mode.**
3. **Sources → + → Remote →** enter `github.com/shuili1013/Maps-AA-AnyMode-Morphe`. If you previously added Dutch App Patches for Maps, disable it.
4. **Patch Google Maps** (the 26.44 APKM) and select these patches from the **Maps-AA-AnyMode-Morphe** source (all are on by default):
   - `Change package name`
   - `Bypass Play Services checks`
   - `Add microG-RE support`
   - `Native navigation for Gearslip and Android Auto`
   - `Allow any travel mode on Android Auto`
   - `Always two-wheeler on Android Auto`
   - `Skip private Android Auto car connection`
   - `Android Auto template-only app`

   Do not add patches for Maps from other sources (e.g. `Clone app` from the official Morphe Patches).

   `Android Auto template-only app` removes the old projection and notification entries and leaves the CAL navigation entry. It does **not** by itself make a head unit accept the patched app; install-source validation is handled by KingInstaller in the next section. **This patch ships from 1.0.3 on**; older bundles do not have it.

5. When patching finishes, **save/export the finished, signed APK** from Morphe. The input is an APKM; the file to install with KingInstaller must be the **complete patched single APK**, not the original APKM or an extracted base APK missing its splits.

### 2. Install the patched APK with KingInstaller Classic

1. Install KingInstaller from its official project linked above and open it.
2. Leave **Root** and **Shizuku** switches **off**. This is the Classic method confirmed on the S25. No root or Shizuku is required for this tested installation route.
3. Select the finished APK exported from Morphe and press the install button (depending on the version, `Install as king`). Allow KingInstaller to install unknown apps if Android asks.
4. Confirm installation in Android's system package installer. If the same signed patched Maps is already installed, try an update first. Do not uninstall it just to change the installer record without backing up its data. A signing conflict requires resolving the signing key or backing up before uninstalling.
5. Return to KingInstaller. Tap **Check and Reinstall App** below the APK selection button, beside the **AA** shortcut.
6. Search for `maps` and select the patched package **`org.ungoogled.android.apps.maps.microg`**, not stock Google Maps. Its display name may be Maps or Ungoogled Maps.
7. Check both source fields. The successful S25 installation showed:

   | Field | Confirmed value |
   |---|---|
   | Initiating Installer | Package installer (`com.google.android.packageinstaller`) |
   | Installing Installer | Google Play Store (`com.android.vending`) |

   KingInstaller showed a green `This app should work in Android Auto` message. That message checks installation metadata; only connecting to Android Auto confirms it actually works.

8. Open the patched Maps on the phone, grant the permissions it requests for navigation/location, and confirm maps and location work. Sign in through MicroG-RE if desired.

**Use this installation route again for each patched APK update.** Installing a later update through Morphe or ADB may replace the source metadata. KingInstaller's split-APK installation support does not provide the same Android Auto source workaround; use the complete single APK. See [KingInstaller's installation notes](https://github.com/fcaronte/KingInstaller).

### 3. Connect to the head unit

1. On the phone, open Android Auto settings. Tap the version information about 10 times to enable developer mode if needed. The earlier test setup had **Unknown sources** enabled; it may be left enabled, but it is **not sufficient to admit a Car App Library navigation app**. Google explicitly excludes CAL apps from that setting's exception ([official testing documentation](https://developer.android.com/training/cars/testing)).
2. Disconnect and reconnect Android Auto to the MS700CL. If necessary, check Android Auto's **Customize launcher** list on the phone and enable the patched Maps entry if listed.
3. Open the patched Maps entry, identify it by its icon/name, then search for a destination and select two-wheeler navigation. Stock Maps may also be listed; verify which copy you open.
4. While parked, confirm the car screen shows the map and turn cards. The user confirmed this setup works on the physical MS700CL after the KingInstaller Classic installation.

### If Maps is missing or opens a messaging screen

- **Missing from the launcher:** first check both installer fields above. A successful phone installation alone does not mean Android Auto accepts the package.
- **`No new messages during this drive`:** the old notification entry can remain visible even when the CAL navigation entry is rejected. The template-only patch removes that misleading fallback; install-source validation still needs to pass.
- **Unknown sources is on but Maps is absent:** this setting does not cover CAL apps. Recheck the KingInstaller installation route.
- **`adb install -i com.android.vending` did not help:** this was tested and failed. It can leave the initiating installer as shell, even though the installing installer says Play. KingInstaller Classic produced the two different fields shown above and the physical-head-unit test succeeded.
- **Unexpected error:** this symptom alone does not identify the cause. Capture a fresh connection log, including `CAR.VALIDATOR` and `PlayGearheadService`, before changing patches.

The investigation initially treated Play's `app owners empty` as the complete explanation. The successful Classic installation shows that an alternative acceptance path exists on the tested setup. It does **not** restore Google's signature or make Play own the patched package.

## Known limitations

- The "next turn" info in Android Auto's side rail is not shown; the map and turn cards on the main car screen work.
- Physical MS700CL operation over wireless Android Auto is user-confirmed on the setup above. Rerouting, long road trips and other hardware remain insufficiently tested.
- Navigation started on the phone and handed to the head unit is less tested than navigation started from a search on the head unit.

## Patches in the bundle

| Patch | Origin | Description |
|---|---|---|
| `Change package name` | Dutch App Patches | Installs beside stock Google Maps under its own package name. |
| `Bypass Play Services checks` | Dutch App Patches | Lets a re-signed Maps load tiles, search and routing. |
| `Add microG-RE support` | Dutch App Patches | Google sign-in through MicroG-RE. |
| `Native navigation for Gearslip and Android Auto` | Dutch App Patches, fixed for 26.44 here | Runs Maps' native car map and navigation UI on Android Auto. |
| `Skip private Android Auto car connection` | This project | Maps' `CarConnectionHandler.onCarConnected` calls a private Android Auto service that always rejects a re-signed app (`Wrong signature - go/gearhead-retail-device`) and crashes it. The handler is skipped. |
| `Always two-wheeler on Android Auto` | This project | Android Auto's "supported mode" becomes two-wheeler, so destinations searched on the head unit default to two-wheeler routes. |
| `Allow any travel mode on Android Auto` | This project | Removes the two checks that refuse or end car navigation when the travel mode differs. |
| `Android Auto template-only app` (1.0.3 and later) | This project | Keeps CAL template navigation and removes legacy projection/notification entries. Install-source validation still applies. |

Source: `patch/`. This project's patches are in `patch/patches/src/main/kotlin/tw/maps/`; the included Dutch App Patches code is in `patch/patches/src/main/kotlin/dutch/`, `patch/extensions/` and `patch/support/` (see [NOTICE](NOTICE) for what was changed). The full debugging history, logcat evidence and 26.44 name mappings are in [findings.md](findings.md) (Chinese).

## Original sources and credits

This project builds on:

- **[Morphe](https://github.com/MorpheApp)**: patcher, Manager and the [patches template](https://github.com/MorpheApp/morphe-patches-template).
- **[Dutch App Patches](https://codeberg.org/JohninNL/nl-morphe-patches)** (JohninNL, GPLv3; [GitLab mirror](https://gitlab.com/johninnld/nl-morphe-patches)): the native Android Auto navigation adapter, `Change package name`, `Bypass Play Services checks` and `Add microG-RE support` are included from v1.53.9. The 26.44 fixes to the adapter are also recorded as patches in [`third_party/dutch-app-patches/`](third_party/dutch-app-patches/).
- **[bearinmind patches](https://github.com/bearinmindcat/morphe-patches)** (bearinmindcat): the original source of the Maps features in Dutch App Patches.
- **[MicroG-RE](https://github.com/MorpheApp/MicroG-RE)** (MorpheApp) and **[microG](https://github.com/microg/GmsCore)** (microG Project, Apache-2.0): this version of MicroG-RE ([shuili1013/MicroG-RE](https://github.com/shuili1013/MicroG-RE)) is based on them.

## License

- This repository, including the patch bundle: **GPLv3**, see [LICENSE](LICENSE) and [NOTICE](NOTICE).
- This version of MicroG-RE: Apache-2.0, as upstream.
- This project does not distribute any Google APK.

## Research notes

The original reverse-engineering work (DEX disassembly scripts, offline tests, handoff notes) is kept in [handoff.md](handoff.md), [findings.md](findings.md), `scripts/`, `tests/` and [patch/README.md](patch/README.md) (mostly Chinese).
