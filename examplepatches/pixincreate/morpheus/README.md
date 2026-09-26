# Morpheus

## Introduction

Morpheus is a [Morphe](https://github.com/MorpheApp/morphe-patches) patch set for Android apps that assume Google Play Services.
It patches two apps:

- The Ather app (`com.athermobileapp`), verified against 13.5.0.
- The Nothing X app (`com.nothing.smartcenter`), verified against 3.8.0.

The repository ships patches only.
It never ships patched APKs or vendor binaries.
You build your own copy from your own APK.

## Lore

The Ather app stopped showing ride details when the scooter is in incognito mode.
It is invasive: it nags for location, contacts, call log and SMS permissions, and it refuses to run when Developer Options is on or when it finds root.
Its maps do not work on de-Googled Android, because Google Maps needs Play Services and Mappls needs a licence tied to Ather's signing certificate.
This patch set makes an insane app sane.

The Nothing X app pushes the K1 token into its own internal, encrypted data instead of the adb log.
On an unrooted device you cannot get the token that links the watch to Gadgetbridge.
This repository patches that too.
Nothing X is invasive as well, so its analytics can be turned off.
You may not need that, because you will probably uninstall it after getting the token, but it is there.

## Installation

### Toolchain

- JDK 25.
  `scripts/build.sh` defaults to Android Studio's bundled JBR (`/Applications/Android Studio.app/Contents/jbr/Contents/Home`).
  Newer JDKs such as Homebrew's JDK 27 fail the Android plugin's `jlink` step.
- Android build-tools 37.0.0 (`zipalign`, `apksigner`, `aapt2`, `dexdump`) under `~/Library/Android/sdk`.
- The Morphe CLI 1.16.0, downloaded by the build script into `build/tools/` and verified by SHA-256.

### What you supply

Put your own copy of the Ather APK and its config splits in `base/`:

```text
base/com.athermobileapp.apk
base/config.arm64_v8a.apk
base/config.en.apk
base/config.mdpi.apk
```

Generate your own signing key with `keytool`:

```bash
keytool -genkeypair -v -keystore keystore/ather-morphe.jks -alias ather \
  -keyalg RSA -keysize 4096 -validity 10000 \
  -storepass atherpatch -keypass atherpatch
```

`scripts/sign-all.sh` expects that path, alias and password.
Override `KS`, `KS_ALIAS` and `KS_PASS` in the environment to use your own values.
The repository never ships or fetches a signing key.

### Build

```bash
bash scripts/build.sh          # add --clean to rebuild the patch bundle from scratch
```

The script builds `patches/build/libs/patches-<version>.mpp`, which embeds both extensions.
It then applies every patch whose declared package matches the APK to `base/com.athermobileapp.apk` and signs the patched base plus the three original config splits into `out/signed/`.

### Install

All four splits share one signature and must be installed together.

```bash
adb install-multiple out/signed/base.apk out/signed/config.arm64_v8a.apk out/signed/config.en.apk out/signed/config.mdpi.apk
```

### Limitations

- When the signing key changes, uninstall the app first.
  Uninstalling wipes its data, so log in again.
  The Ather ride log is local, so export it first if you want to keep it.
- The Nothing X patch needs the `FlutterSecureStorage` class.
- The K1 dialog only appears after the watch bind flow has run.
  On a fresh install there is no token to show.

## Usage

### Ather

Open the app and go to Account → General settings → Morphe settings.

The screen holds:

- Map provider: Auto (recommended), OpenStreetMap, or Google Maps (requires Play Services).
  Auto keeps Ather's choice and replaces the providers that cannot work here with OpenStreetMap.
- Block analytics events: stops MoEngage, PostHog and Firebase events.
  Crashlytics is untouched, so crash reports still reach Ather.
- Battery pack (kWh): the pack size used to turn a ride's charge drop into km/unit.
- Record rides while the app is closed: keeps the app's process alive with a silent ongoing notification, so rides keep their own start and end times.
- Ride history, Charging history, and Battery and wear history: open the recorded history.
  The history screen exports all three tables as CSV to Downloads on Android 10 and later.

Push notifications from Ather's servers need Google Play Services.
The local notifications derived from the app's own connection are the substitute.

### Nothing X

1. Install the patched Nothing X app.
2. Log in and bind your watch.
3. The "K1 Token(s) Found" dialog appears.
   Tap a token card to copy the token.
4. In Gadgetbridge, pair the first-generation CMF Watch Pro (D395) and paste the token.
5. To read the token from logcat instead, run `adb logcat -s Morpheus` and look for the line with `HEX32!` or `HEX64!`.

See [docs/nothingx-k1.md](docs/nothingx-k1.md) for the full mechanism.

## Uninstallation

Uninstall the patched apps and install the vendor builds again.

```bash
adb uninstall com.athermobileapp
adb uninstall com.nothing.smartcenter
```

Uninstalling removes the patched app's data:

- Ather: the Morphe settings, and the local ride, charging and health history.
- Nothing X: the login session and the captured token.

Export the Ather history from the Morphe history screen before you uninstall if you want to keep it.

## Working

A patch finds its target in the vendor app with a fingerprint, then injects or replaces smali at a known point.
When a patch needs runtime code, it calls into an extension that the patch bundle mounts into the patched app.

The Ather patches:

| Patch                              | Effect                                                                                                                                                                                                                                                               |
| ---------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Bypass security check              | Stops the Developer Options warning and the root/Frida block.                                                                                                                                                                                                        |
| Report Ather's signing certificate | Reports the original Ather certificate hash to Google APIs, so Firebase login works after re-signing.                                                                                                                                                                |
| Bypass PairIP licence check        | Skips the Play license check that the re-signed app cannot pass.                                                                                                                                                                                                     |
| Permission filter                  | Drops phone-location (and call log, contacts, SMS) from the request list at the single dialog choke point, so the app never asks for permissions it cannot use here. Nothing is faked; the OS permissions stay ungranted.                                            |
| Pairing wizard                     | The setup wizard now asks only for Nearby device access, so scooter pairing can complete.                                                                                                                                                                            |
| Analytics toggle                   | Blocks MoEngage, PostHog and Firebase events from the Morphe settings screen. Crashlytics is untouched so bugs stay reportable.                                                                                                                                      |
| Map provider                       | Adds a provider chooser (Auto / OpenStreetMap / Google Maps). Mappls is removed because its licence is bound to Ather's signing certificate. OSM renders through the bundled MapLibre.                                                                               |
| Morphe settings row                | Injects a "Morphe settings" row into the app's Account -> General settings list, and repairs the account rows whose deep links the app could not resolve.                                                                                                            |
| Ride log                           | Rebuilds rides from the live odometer the app already receives, shows them in a Morphe history screen, exports CSV, and injects them into the app's own "All rides" list, month total and chart.                                                                     |
| Enable ride stats                  | Turns on the app's own ride-statistics screens. The app gates them behind a server flag that stays off while the scooter is in incognito mode; the ride data itself still comes from the API.                                                                        |
| Charge log                         | Records charging sessions with start/end state of charge.                                                                                                                                                                                                            |
| True Health capture                | Keeps every True Health report the app fetches: part scores, battery health history and wear-and-tear (belt, brakes).                                                                                                                                                |
| Local notifications                | Derives alerts from the app's own connection (charging started, fully charged, charging stopped, movement detected, switched on, OTA available, low battery, low range) and shows the notifications the server pushes over the shadow, which the app was discarding. |
| Morphe screens                     | Registers the Morphe screens, the optional background ride service and its boot receiver in the app manifest. The service keeps the app's process alive so rides are recorded with real start and end times even while the app is closed.                            |

The `Show K1 token(s)` patch targets Nothing X.
It hooks the `flutter_secure_storage` plugin inside the app process, because the token is encrypted at rest on 3.8.0.

More detail:

- [docs/architecture.md](docs/architecture.md) — the repository layout, the patch and extension model, and the build pipeline.
- [docs/ather-patches.md](docs/ather-patches.md) — every Ather patch, the class it touches and the smali it changes.
- [docs/nothingx-k1.md](docs/nothingx-k1.md) — the K1 token, the hook points and how to verify them.
- [docs/build-and-release.md](docs/build-and-release.md) — building, signing rules, the CI jobs and the release plan.
- [docs/verification.md](docs/verification.md) — how the changes were verified.

## Contribution

Fork the repository and create a branch for your change.
Keep the house style of the surrounding code.
Before you open a pull request, run `bash scripts/build.sh` and the CI checks: shellcheck, the extension compile, the patch-set check, typos and markdownlint.
Never commit a keystore or a vendor APK.

## License

The repository is released under [CC0 1.0 Universal](LICENSE).

## Disclaimer

The maintainer is not responsible for anything that happens when you build or install these patches.
You build and install at your own risk.
The vendor apps and their trademarks belong to their owners.
