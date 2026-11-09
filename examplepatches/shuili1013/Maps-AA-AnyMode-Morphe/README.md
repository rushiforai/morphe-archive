# Maps-AA-AnyMode-Morphe: two-wheeler navigation with Google Maps on Android Auto

**English** | [中文](README.zh-TW.md)

Makes **Google Maps navigate on an Android Auto head unit with its native car interface, including two-wheeler (motorcycle) routes**. Intended for an Android Auto screen mounted on a motorcycle: stock Google Maps only allows driving routes on Android Auto and refuses two-wheeler navigation.

Patched with [Morphe](https://morphe.software). The patched Maps installs under a different package, **alongside stock Google Maps**: keep stock Maps for driving, use the patched copy on the motorcycle.

> Experimental. Only verified on a Galaxy S25 (Android 16) with the headunit head-unit emulator (wired USB). Test while parked before riding. Whether a route is legal (e.g. 125cc bikes are banned from Taiwan's national freeways) depends on local road signs, not on the app.

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
| **This version of MicroG-RE** (required) | [shuili1013/MicroG-RE releases](https://github.com/shuili1013/MicroG-RE/releases/tag/v7.3.0-maps-fix) → `microg-re-maps-fix-7.3.0.apk` |
| This project's patch bundle | Add the remote source `github.com/shuili1013/Maps-AA-AnyMode-Morphe` in Morphe (or download `patches-1.0.1.mpp` from [Releases](https://github.com/shuili1013/Maps-AA-AnyMode-Morphe/releases) and add it as a local source) |

The bundle already includes the Dutch App Patches features it needs; you do not need to add Dutch App Patches separately.

### Why this version of MicroG-RE is required

Official MicroG-RE has two problems with a patched Google Maps, both fixed in this version of MicroG-RE:

1. **No sign-in, map and search fail**: MicroG-RE only gives account access to Google apps on its allow list, and Google Maps is not on it (log: `GmsAuthProvider: Not granting extended access`).
2. **No location**: Maps connects to the location service with the original `com.google.android.location.internal.GoogleLocationManagerService.START` action, while the official build only accepts the `app.revanced`-prefixed name (log: `Unable to start service ... not found`).

If official MicroG-RE is already installed, **uninstall it first**, then install this version of MicroG-RE (different signing key, Android cannot update over it). Afterwards open MicroG settings and run Self-Check.

## Installation

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

   Do not add patches for Maps from other sources (e.g. `Clone app` from the official Morphe Patches).
5. **Install.** The patched app installs as `org.ungoogled.android.apps.maps.microg`, named **Ungoogled Maps**.
6. **Allow unknown sources in Android Auto:** Android Auto settings on the phone → tap "Version" about 10 times to enable developer mode → top-right menu "Developer settings" → enable **Unknown sources**.
7. Connect to the head unit and pick **Ungoogled Maps** (the head unit shows two Maps icons; stock Maps cannot be hidden, so pick the right one).

## Known limitations

- The "next turn" info in Android Auto's side rail is not shown; the map and turn cards on the main car screen work.
- Real head units, wireless Android Auto, rerouting and long real-road trips are not fully verified.
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
