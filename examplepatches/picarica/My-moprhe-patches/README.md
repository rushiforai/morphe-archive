# Android no-GMS / no-Play patches

This project contains narrowly versioned Morphe patches for Android apps that
otherwise require Google services to launch:

- **AFFiNE 0.27.4 — `Remove Google requirements`:** removes Google Play's PairIP
  license gate and prevents AFFiNE's Firebase/GMS telemetry paths from initializing.
- **Stick War: Legacy 2026.1.983 — `Remove Google Play requirement`:** removes the
  mandatory PairIP signature and Play-license launch checks while preserving the
  instrumented runtime and optional Google-backed features.

These are app- and version-specific patches, not a universal GMS compatibility layer.

## Add to Morphe Manager

Use the one-click source link:

**[Add `picarica/My-moprhe-patches` to Morphe](https://morphe.software/add-source?github=picarica/My-moprhe-patches)**

Or add this repository manually in Morphe Manager's patch sources:

```text
https://github.com/picarica/My-moprhe-patches
```

Select the original supported XAPK and enable the matching patch. Do not use an
already-patched APK as input.

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/picarica/My-moprhe-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Stick War: Legacy&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2026.1.983 |
| :---: |
| Google Play release 2026001983; requires its ARM64 and Unity asset-pack splits. |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove Google Play requirement](#remove-google-play-requirement) | Removes Stick War: Legacy's mandatory Google Play PairIP launch checks while preserving the PairIP runtime, Unity asset packs, Play Games, billing, ads, and Firebase integrations. |  |

</details>

<details open>
<summary>📦 AFFiNE&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 0.27.4 |
| :---: |
| Google Play release 439; requires its arm64-v8a split. |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove Google requirements](#remove-google-requirements) | Removes Google Play PairIP licensing, Firebase/Google startup components, analytics permissions, and AFFiNE's explicit Crashlytics startup call. |  |

</details>

<!-- PATCHES_END -->

## Original APK sources

- **Stick War: Legacy:** [APKPure download page](https://apkpure.com/stick-war-legacy/com.maxgames.stickwarlegacy/download)
- **AFFiNE:** [APKPure app page](https://apkpure.com/affine/app.affine.pro)

The links identify the source pages; always verify that the downloaded version and
architecture match the supported input below. APKPure may label the action as
"Download APK" even when the downloaded file is an XAPK bundle.

## Supported inputs

### Stick War: Legacy

- Package: `com.maxgames.stickwarlegacy`
- Version: `2026.1.983`
- Version code: `2026001983`
- Architecture: `arm64-v8a`
- File type: XAPK containing the base, ARM64, and five Unity asset-pack splits
- Google Play signing-certificate SHA-256:
  `59bc9becd6fa02f2ff43c6d31aacc93246d8b63e7973494198f15f99e3988666`
- Expected input SHA-256:
  `dc51f432633fb727715d318ae544fa1319e53f6676893c198c46e41ad574c561`

### AFFiNE

- Package: `app.affine.pro`
- Version: `0.27.4`
- Version code: `439`
- Architecture: `arm64-v8a`
- File type: XAPK containing the base, ARM64, density, and language splits
- Expected input SHA-256:
  `daa36b4523e800990249ac8a996e388a09024147be54564b0df5504029525f0a`

Both patches intentionally fail closed on a changed manifest, version code, or
unmatched bytecode. Do not force them onto different app releases.

## What the Stick War patch changes

- Keeps `com.pairip.application.Application`, `VMRunner.setContext()`, PairIP's
  instrumented Java call sites, and `libpairipcore.so` intact.
- Neutralizes only the PairIP wrapper's signature check and mandatory Google Play
  license check before normal Unity startup.
- Removes only PairIP's now-unused `LicenseActivity` and
  `com.android.vending.CHECK_LICENSE` manifest permission.
- Preserves the Unity player and all supplied install-time asset packs.
- Preserves Play Games, billing, ads, Firebase, Play Asset Delivery classes, and the
  game's native libraries.

Preserving an optional integration does not make it work without GMS. Play Games,
in-app purchases, cloud-backed features, ads, and similar functionality may fail or
remain unavailable on a no-GMS device. The patch is intended to remove the mandatory
launch gate so the local game can start.

## What the AFFiNE patch changes

- Restores the real application class, `app.affine.pro.AFFiNEApp`, instead of the
  Play-injected `com.pairip.application.Application` wrapper.
- Removes PairIP's activity and the Play licensing permission.
- Removes Firebase, Google measurement, and data-transport startup components.
- Removes advertising/install-referrer permissions and Google/Play metadata.
- Makes AFFiNE's Crashlytics logger and custom-key/user-ID calls inert.
- Disables only the Firebase Storage upload of old local diagnostic logs.
- Preserves local file logging, authentication cookies, AFFiNE Cloud requests,
  WebView startup, app resources, and the native AFFiNE engine.

Google/Firebase and PairIP classes remain bundled but have no manifest entry points,
and AFFiNE's owned call sites are bypassed. Removing thousands of unused library
classes would make the patch much more fragile without improving compatibility.

## Build

Requirements are Bash, Git, Python 3, `unzip`, and standard checksum/core utilities.
Building and patching also require Java 21 or newer. On NixOS, the scripts
automatically use `nixpkgs#jdk21`, Apktool, and `apksigner` when those tools are not
already on `PATH`.

```bash
git clone https://github.com/picarica/My-moprhe-patches.git
cd My-moprhe-patches
./scripts/build.sh
```

The bootstrap script checks out these public sources at exact commits:

- Morphe patches Gradle plugin `v1.3.4`:
  `a230c33f7eca1e18b07bf1114ca850421520f98d`
- Morphe patcher `v1.14.1`:
  `6f189f9ffb448ae32ceaf6c136c9d84d9a7ed274`

Output:

```text
patches/build/libs/patches-*.mpp
```

## Development and releases

This repository follows the official
[Morphe patches template](https://github.com/MorpheApp/morphe-patches-template):

- Keep all development and releases on the `main` branch and use semantic commit
  messages.
- `feat:` creates a minor release, `fix:` creates a patch release, and `chore:`
  does not create a user-facing release.
- Every push to `main` runs semantic-release. Commits without a release-triggering
  semantic type are still compiled but do not publish a new version.
- The release workflow generates `CHANGELOG.md`, `patches-bundle.json`,
  `patches-list.json`, the README patch table, the release tag, and the MPP asset.
- Do not manually bump versions or create release tags/assets. A release is usable
  by Morphe Manager only after its matching `patches-<version>.mpp` asset exists.

## Patch the supplied XAPKs

AFFiNE:

```bash
./scripts/patch-affine.sh
```

Stick War: Legacy:

```bash
./scripts/patch-stick-war.sh
```

The scripts download and verify Morphe Desktop `1.17.0` if needed, build the patch
bundle, apply only the app's matching patch, sign the standalone result with a
dedicated local key, and run static verification.

Default outputs are written beside this repository:

```text
AFFiNE_0.27.4_no-gms.apk
AFFiNE_0.27.4_no-gms-result.json
affine-no-gms.keystore
Stick+War_+Legacy_2026.1.983_no-play.apk
Stick+War_+Legacy_2026.1.983_no-play-result.json
stick-war-no-play.keystore
```

Back up each keystore and keep it private. Every later patched update of the same app
must use the same key to update the installed patched application.

## Installation warning

A patched APK keeps the official package name but has a different signing
certificate. It cannot update an official Play-installed copy. Android will normally
report `INSTALL_FAILED_UPDATE_INCOMPATIBLE` while the official app is installed.

Uninstalling an app can erase its local data and game progress. Back up or sync
important data before removing an official installation. Once any conflict is
resolved, install the appropriate generated APK with `adb install`; future builds
signed by the preserved app-specific keystore can use `adb install -r`.

## Validation and limitations

The project validates that:

- All manifest-transformer unit tests pass.
- Morphe applies exactly the selected patch without failures.
- Generated APKs are readable by Apktool and pass APK Signature Scheme verification.
- Package names, versions, version codes, and ARM64 native libraries are preserved.
- The targeted PairIP launch paths are unreachable after patching.
- Unrelated startup components and app-specific assets remain present.

Static validation cannot prove gameplay or every optional integration works on a
specific ROM. Real-device launch testing is still required. In particular, Stick
War's Play Games, purchases, ads, cloud features, or other network functionality may
still require Google services or developer servers even though local launch succeeds.

## Credits and license

The patch structure follows the official Morphe template and was informed by the
application-specific fingerprinting style used by
[De-Vanced](https://github.com/RookieEnough/De-Vanced). No Strava patch was copied;
these applications have different startup paths.

Patch source is licensed under GPL-3.0. AFFiNE, Stick War: Legacy, APKPure, Google
Play, and Morphe retain their respective licenses and trademarks.