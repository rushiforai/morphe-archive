# Coffee: APKM preparation failures

For Coffee 1.24.0 (1397), the following Manager failures happen before our
patches execute:

- `No space left on device` in `Merger` / `ApkModule.writeApk`: Android could not
  write the merged APK. The source archive, extracted splits, merged APK and
  patching output need working space in addition to the installed game.
- `invalid stored block lengths` in `SplitApkPreparer.extractSplitEntries`:
  the ZIP inflater cannot decode an entry in the input archive. This can be a
  damaged source or working copy. Freeing storage does not repair damaged bytes.
  The phone's exact input and cached copy are needed to distinguish these cases.

These locations were checked against [Manager 1.33.0's split preparation
source](https://github.com/MorpheApp/morphe-manager/blob/v1.33.0/app/src/main/java/app/morphe/manager/patcher/split/SplitApkPreparer.kt).
Changing the patch bundle cannot repair an archive that fails before patching.

## Recover without losing saves or signing keys

1. Keep the installed game and the Manager's signing key/data. Do not uninstall
   the game or clear Manager storage as an archive-repair step.
2. Select a fresh, complete APKM from its original source after freeing working
   space. Do not reuse an interrupted download. No universal free-space threshold
   has been measured for Samsung Android 16; 883.60 MB was insufficient in the
   reported run, while 5.40 GB alone does not prove archive integrity.
3. On a computer, run `python scripts/verify_apkm.py downloaded.apkm`. This checks
   all outer entries and every embedded APK entry, reports the archive SHA-256,
   and identifies the failing split/file. It reads but never repairs the input.
   A PASS proves archive readability, not game-version or runtime compatibility.
4. Alternatively, merge the verified complete APKM on a computer and select that
   clean single APK as input in Manager. This avoids Android's outer-archive
   extraction and split merge; patching and installation still need free space.
   Patch with your existing signing key. A merged clean APK is input for patching,
   not a ready-to-install replacement for an existing signed game.

The two default selections, **Skip rewarded ads** and **Google Play Games via
MicroG-RE**, both depend on **Coffee startup support**. Two selected patches are
normal; startup support runs as a dependency. Selecting the startup patch
explicitly is optional, not a fix for a ZIP error.

## Verified input and reproduction, 2026-09-30

The locally available complete APKM is 649647098 bytes, with SHA-256
`61a8e5d22782a4599f1c2fe46ed4e5bee328311e3173db16cff653b1ed305d37`.
All outer entries and all 15 embedded APKs passed decompression/CRC checks.
This identifies our tested copy; it is not a claim about the file on the phone.

Both full APKM preparation and patching a premerged clean APK succeeded using the
published **1.33.0** bundle, the two default Coffee selections, FULL bytecode mode
and Morphe Desktop 1.17.0. Both outputs passed the 2447-asset / 46-library audit
with only the two reviewed native reconstructions allowed.

The prepared clean merged input has SHA-256
`1d1c54507e27b70801d058ff5dae8d5ce6c09db270c91b6937feedb482e299b6`.
Its assets and native libraries match all 15 original splits. Game APKs and
signing keys remain private; they are not attached to GitHub releases.

On the existing Android 15 test profile, the newly patched release bundle reached
Day 2 gameplay with the preserved 139.04 cash balance. The news-screen reward
increased crystals from 0 to 1 without a video. Slow loading at 5% eventually
completed; no code change was made on the assumption that it was a permanent hang.

The Samsung SM-A546B was not connected through ADB. Game runtime on Android 16
and real TapBlaze account restoration remain unverified. These checks do not justify a release
claiming that real authentication or cloud restoration has been repaired.

## Original APKMirror bundle: Android extraction verification

The user supplied the [original 1.24.0 APKMirror variant](https://www.apkmirror.com/apk/tapblaze/good-coffee-great-coffee/good-coffee-great-coffee-1-24-0-release/good-coffee-great-coffee-1-24-0-android-apk-download/).
Its published **file** SHA-256 (not the signing-certificate fingerprint) is
`61a8e5d22782a4599f1c2fe46ed4e5bee328311e3173db16cff653b1ed305d37`,
and its size is 649647098 bytes. Both match our unchanged local APKM.

On both Android 15 / API 35 and Android 16 / API 36, a Java probe using Android's
`ZipFile.getInputStream` and an 8192-byte copy buffer extracted all 15 APK entries
successfully. Every extracted entry matched its declared length and CRC32.
This exercises the inflater used at the reported failure site. It does not test
Samsung's filesystem or establish the integrity of the user's downloaded/cached
copy. The API 36 test used an isolated AOSP ATD x86_64 emulator.

The original APKM format does not require conversion to a single APK to be
readable on these Android versions. The premerged input above remains an optional
workaround. A damaged compressed stream cannot be recovered by skipping the ZIP
error: that would omit or truncate game data.

An end-to-end run in the **official Android Manager 1.33.0**, using patcher
1.15.0 and our published 1.33.1 bundle, also succeeded on API35. The unchanged
APKM was selected through the Downloads picker, its imported copy retained the
same SHA-256, both default patches ran, and Manager reached its **Patched**
screen with an installable signed output. Native libraries were preserved;
Manager used STRIP_FAST. No custom Manager build or input conversion was used.
Its working directory reached 4.4 GiB; earlier probe scratch files were removed
during the run to free space, so this is not a minimum-free-space measurement.

The Samsung error remains unreproduced. These results establish support for
the published original bundle, not a repair of the phone's particular failure.

## Separate runtime fix

Further testing reproduced a native crash when the Singular SDK received a
network-change event on an adult test profile. The callback was restored from
the same SDK version; see [source and reproduction](coffee-sdk-restoration.md)
and [runtime evidence](coffee-project-context.md#singular-network-callback-regression--2026-09-30).
The corrected build opened the TapBlaze ID email/code form. A visible login form
is not proof of authenticated account restoration. This runtime correction does
not repair invalid ZIP data or remove Android's need for working storage.
