# futatabi v0.1.0 — Clone app + banner blocking

**For futatter 3.1.1 only** (`com.Nanasaki.ftutter`, versionCode 65).

This release contains a **Morphe patch bundle (.mpp), not a patched APK**. Use a merged APK of the original split-XAPK release with a compatible Morphe patcher.

Included patches (both **enabled by default**):

- **Block banner ads** — intercepts the two `google_mobile_ads` banner-load methods; does not intentionally change rewarded/interstitial/native/app-open ad code.
- **Clone app** — adapted from Morphe's official Clone app patch, changing the default package name to `com.Nanasaki.ftutter.morphe` for side-by-side installation. Its `updatePermissions` and `updateProviders` options default to true. Cloning is not guaranteed to work with every app.

**Disable cloning** in Morphe by deselecting **Clone app**, or pass `--disable="Clone app"` to Morphe Desktop. The `packageName` option supports an alternate clone identity. Never overwrite an existing installation expecting to preserve data; changes to package identity or signing keys can require uninstalling and will lose that package's app data.

**Verification**: the exact target XAPK and base APK matched the documented SHA-256 hashes. Both patches applied to the **unmerged base APK** with `--unsigned`; patching/rebuilding succeeded and AAPT reported `com.Nanasaki.ftutter.morphe`, with all four provider authorities renamed under the cloned prefix. The patched DEX retained the banner guard and the original rewarded dispatcher. **Signing, installation, real banner removal, rewarded-ad functionality, and clone coexistence remain unverified.** The owner will carry out physical-device checks.

**Bridge status**: NOT included. The Android emulator gate on unmodified futatter failed at adding the localhost board; future ContentProvider/adapters must not proceed without a passing gate. The eventual bridge authority must be based on the active package name to coexist with cloning; runtime interaction has not been tested.

**Upstream license**: Clone app is a derivative of [MorpheApp/morphe-patches](https://github.com/MorpheApp/morphe-patches/blob/main/patches/src/main/kotlin/app/morphe/patches/all/misc/clone/CloneAppPatch.kt), itself derived from ReVanced. GPL-3.0 and the original upstream copyright/Section 7 attribution block are preserved in source. See [README](https://github.com/rikunode/futatabi/blob/main/README.md).

**Verify the bundle before using**: download `SHA256SUMS` alongside the `.mpp` and compare SHA-256.
