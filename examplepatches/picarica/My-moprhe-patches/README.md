# AFFiNE no-GMS patch

This project contains a narrowly versioned Morphe patch for the Android build of
[AFFiNE](https://github.com/toeverything/AFFiNE). It removes Google Play's PairIP
license gate and prevents AFFiNE's Firebase/GMS telemetry paths from initializing.

## Add to Morphe Manager

Use the one-click source link:

**[Add `picarica/My-moprhe-patches` to Morphe](https://morphe.software/add-source?github=picarica/My-moprhe-patches)**

Or add this repository manually in Morphe Manager's patch sources:

```text
https://github.com/picarica/My-moprhe-patches
```

Then select the original AFFiNE `0.27.4` XAPK and enable
`Remove Google requirements`. Do not use a patched APK as the input.

## Supported input

- Package: `app.affine.pro`
- Version: `0.27.4`
- Version code: `439`
- Architecture: `arm64-v8a`
- File type: XAPK containing the base, ARM64, density, and language splits
- Expected input SHA-256:
  `daa36b4523e800990249ac8a996e388a09024147be54564b0df5504029525f0a`

The patch intentionally fails closed on a changed manifest or unmatched bytecode.
Do not force it onto a different AFFiNE release.

## What the patch changes

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
- Morphe patcher `v1.12.0`:
  `ac0d688eaacb7ece80b65ebf719b252f69455783`

Output:

```text
patches/build/libs/patches-1.0.0.mpp
```

## Patch the supplied XAPK

```bash
./scripts/patch-affine.sh
```

This downloads and verifies Morphe Desktop `1.15.0` if it is not already present,
builds the patch, applies only `Remove Google requirements`, signs the result with a
dedicated local key, and runs static verification.

Outputs:

```text
../AFFiNE_0.27.4_no-gms.apk
../AFFiNE_0.27.4_no-gms-result.json
../affine-no-gms.keystore
```

Back up the keystore and keep it private. Every later patched update must use the
same key to update the installed patched application.

## Installation warning

The patched APK has the same package name as official AFFiNE but a different signing
certificate. It cannot update an official Play-installed copy. Android will normally
report `INSTALL_FAILED_UPDATE_INCOMPATIBLE` while the official app is installed.

**Uninstalling AFFiNE can erase local-only data.** Sync or export your data first.
Do not uninstall until you have confirmed that everything important is backed up.

After backing up and removing a conflicting official installation, install with:

```bash
adb install ../AFFiNE_0.27.4_no-gms.apk
```

Future builds signed by the preserved `affine-no-gms.keystore` can use:

```bash
adb install -r ../AFFiNE_0.27.4_no-gms.apk
```

## Validation and limitations

The following were validated locally:

- Four manifest transformer tests pass.
- Morphe applies exactly one patch without failures.
- The APK is readable by Apktool and the JDK ZIP parser.
- APK Signature Scheme v2 and v3 verification passes.
- The output remains version `0.27.4` / code `439`, ARM64.
- The 49 MB native AFFiNE engine is byte-for-byte unchanged.
- The manifest has no PairIP, Firebase, GMS, Play licensing, or data-transport entry
  points.
- Decompiled DEX checks confirm the targeted Firebase paths are unreachable while
  local authentication cookie persistence remains present.

No Android device was connected during development, so launch, login, cloud sync,
and editing still require real-device testing. The patch deliberately disables
Firebase Analytics, Crashlytics reporting, Crashlytics user IDs, and upload of old
diagnostic log files. It is not a universal GMS patch and does not support future
AFFiNE versions without review.

## Credits and license

The patch structure follows the official Morphe template and was informed by the
application-specific fingerprinting style used by
[De-Vanced](https://github.com/RookieEnough/De-Vanced). No Strava patch was copied;
AFFiNE has different PairIP and Firebase startup paths.

Patch source is licensed under GPL-3.0. AFFiNE and Morphe retain their respective
licenses and trademarks.