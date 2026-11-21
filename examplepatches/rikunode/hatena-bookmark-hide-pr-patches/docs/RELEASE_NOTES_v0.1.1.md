# Hatena Bookmark PR ad filter v0.1.1 — experimental / known-blocked

**IMPORTANT 2026-10-14:** The real nonroot Android user confirmed the patched Hatena 5.84 clone opens Google's Pairip license dialog, preventing normal operation. Independent Android emulator tests also reached Pairip LicenseActivity. Merely installing both the original and clone on an emulator and marking the clone as Play-installed did not resolve it. These patches can be compiled and applied but **have not been proven functional for removing ads in the live app**. Keep the official app installed; do not disable Google Play Protect. This release is retained as a prerelease for debugging, not recommended for installation.


Morphe Manager source for Hatena Bookmark Android **5.84 (58400)** only.

The Android .mpp archive has two patches: **Hide native PR entries from article feeds** (PR article suppression, preserves normal mute matching) and **Clone Hatena Bookmark for safe side-by-side testing** (changes package to `com.hatena.android.bookmark.morphe`, its custom permission and three providers so an existing original app can remain untouched). Both patches are enabled by default; disable clone only if you intend to install under the original package and understand signature conflicts.

## What was verified

- Exact supplied 5.84 APK SHA256 `0e2c6727e92a8a4ecbb05a4fdcd9059d80c11552ff6f4155d94c874247384684`.
- Applied 2 patches, 0 errors, original `classes2.dex` byte-identical, patched `filteredWithMuteWords` PR guard disassembled and confirmed.
- Resulting clone APK version 5.84 package `com.hatena.android.bookmark.morphe`, v2 signing valid, all 3 provider authorities and custom receiver permission changed appropriately.
- Tested emulator install success and entry into app `MainActivity`.
- 19 prepublication tests and Android metadata validation PASS; .mpp includes valid Android classes.dex.

## Known issue: Pairip Play license check

After MainActivity, Pairip license activity took focus in emulator where original package was missing. Normal UI operation, ad removal in real feed, login, bookmarks and other tabs have NOT been proven. We have **not bypassed or disabled any Play licensing mechanism**. Do not uninstall the original working app, modify Play Protect, or claim this release is fully working before on-device verification.

Input `.mpp` source is from this repository; no original Hatena APK nor credentials distributed.
