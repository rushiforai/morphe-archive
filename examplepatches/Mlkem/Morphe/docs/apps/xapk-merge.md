# Merge XAPK only — Morphe patch v1.0.0

A single, manually selected patch that lets Morphe run its existing split-APK
merge and signing workflow without making app-code or resource edits of its own.

This is a patch bundle, not an Android app. Import the `.mpp` into Morphe; do not
try to install it with Android's package installer.

## Use it

1. Use a current Morphe Manager with Morphe Patcher 2.0.1 or newer. This bundle was
   built and verified against Patcher 2.0.1; later versions have not been tested.
2. In Morphe, open **Sources → + → Local** and choose
   **morphe-merge-xapk-only-v1.0.0.mpp**. The source name is **XAPK Merge Only**.
3. Enable **Expert mode** in Settings.
4. From Apps, choose **Select other apps** and select your original XAPK. A
   universal source can show zero named apps; that is expected.
5. Clear the patch search/filter. Use **Disable all** on every source tab, then
   select only **Merge XAPK only** in the XAPK Merge Only source. Check that the
   overall selection counter shows exactly **one** patch.
6. Leave **Settings → Patcher → Optimize for device architecture** off. Keep the
   normal system installer and the embedded VM setting enabled.
7. Tap **Patch**, then **Install** when it finishes. Allow installs from Morphe
   if Android asks.

If you need to keep the original installed app's local data, stop when Morphe
reports a signature conflict. Uninstalling that app erases its local data.

## What changes

The patch itself performs no reads, writes, bytecode edits, resource edits,
network requests, permission changes, package renaming, or extension injection.
It has no dependencies or options and is disabled by default.

Morphe still merges the APK components, removes the old signing information,
aligns the output, and signs it using your Morphe key. The result is not the
original developer-signed package. App integrity/signature checks can therefore
fail, and the result generally cannot update an official install in place.
Future official store updates likewise need the original signing identity.

This is intended for XAPK/APKM/APKS archives containing ordinary APK components.
It does not install separate OBB/game data or external asset packs. Morphe's
merger expects APK components at the archive's top level. Merging may itself
affect compatibility; this patch does not repair apps that reject merged APKs.

## How it is built

The implementation is one universal **RawResourcePatch**, declared with
`default=false`. It leaves the patcher's default empty execute/finalize blocks
intact. This selects raw resource handling without decoding/recompiling resources
and does not request bytecode processing.

The MPP contains JVM class files for Morphe's embedded JVM and `classes.dex` for
Android patch discovery. Morphe and Kotlin dependencies are not embedded. Java
class files target Java 11; D8 targets Android API 26.

Complete source and the reproducible packaging script are included under
`source/` in the MPP (a ZIP-format archive). Extract that directory and run
`python3 build.py` with Python 3 and a Java 17+ JDK. The script downloads the
pinned official build dependencies and verifies their SHA-256 hashes. If they
are already in `build-tools/`, `python3 build.py --offline` needs no network.

## Verification and limits

The machine-readable verification report is included under `validation/`.
Verification passed against the actual Morphe Patcher 2.0.1 APIs: bundle loading,
one universal opt-in patch, no-op application to a plain APK, a two-module XAPK
merge with language resources and independent app DEX, unchanged app-entry bytes
through the no-op step, and successful output signing/signature verification.
These are synthetic APK fixtures. Test APKs and test signing keys are not
distributed in this MPP. No Android phone installation or app-specific
launch/login test has been done.

## Upstream references

- Patch API: https://github.com/MorpheApp/morphe-patcher/blob/v2.0.1/src/main/kotlin/app/morphe/patcher/patch/Patch.kt
- APK output handling: https://github.com/MorpheApp/morphe-patcher/blob/v2.0.1/src/main/kotlin/app/morphe/patcher/apk/ApkUtils.kt
- Manager patch sources: https://github.com/MorpheApp/morphe-manager/blob/main/docs/patch-sources.md
- Manager other-app selection: https://github.com/MorpheApp/morphe-manager/blob/main/docs/home-screen.md
- Manager split handling: https://github.com/MorpheApp/morphe-manager/blob/main/patcher-core/src/main/kotlin/app/morphe/manager/patcher/split/SplitApkPreparer.kt

This is a personal custom bundle and is not an official Morphe release.
