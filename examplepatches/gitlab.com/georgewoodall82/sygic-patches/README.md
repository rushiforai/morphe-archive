# Sygic Premium patches (Morphe community bundle, EXPERIMENTAL)

Community Morphe patches for **Sygic GPS Truck & Caravan**
(`com.sygic.truck`).

Developed against:

- `Sygic+GPS+Truck+&+Caravan_26.1.9_APKPure.apk` (APKPure)
- `versionName 26.1.9`, `versionCode 261119003`, `package com.sygic.truck`

## Patches

- **Unlock Premium** (`app.sygic.patches.premium.UnlockPremiumPatch.kt`,
  experimental): forces Java store/billing gates to true:
  `GoogleInAppPurchaseHelper.isBillingSupported/areSubscriptionsSupported/buyDone`,
  `LowStoreFeatureBase.isSupported/buyDone`,
  `SygicMain.StoreIsEnabled/StoreIsSupported/StoreBuyDone`,
  `SidebarServiceImpl.checkLicense`.

See `Fingerprints.kt` for the 26.1.9 mapping and `verify.py` (27 PASS).

## Important limitation (read this)

Sygic licensing lives mostly in **native `libAura.so`**
(`nProcessStoreResponse`, `nGetProductRecordSet`, `HasAALicense`,
`nCheckLicenseKey` have no DEX code). This bundle patches only the Java
bridge. It may remove store UI gates but **may NOT unlock offline maps /
traffic** until the native check is also understood. Test on device:

1. Patch + install, then Menu -> Sygic Store -> All your licenses.
2. If still locked, capture `adb logcat | grep -i -E "sygic|purchase|license|store"`
   and inspect `lib/arm64-v8a/libAura.so` (Ghidra/jadx) around
   `ProcessStoreResponse` / `ProductRecord`.

`handlePurchases` is intentionally NOT forced: it is the method that calls
native `ProcessStoreResponse`. Forcing its return would silence native
instead of faking success.

## Build the .mpp bundle

Requirements (same as
[morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template)):

- JDK 17+, Android SDK via Android Studio/IntelliJ
- GitHub PAT with `read:packages` (Morphe registry is on GitHub Packages)

```bash
# 1. Auth for GitHub Packages (once):
# ~/.gradle/gradle.properties:
#   gpr.user=<github-username>
#   gpr.key=<ghp_... with read:packages>
# or:
#   export GITHUB_ACTOR=<user> GITHUB_TOKEN=$(gh auth token)

# 2. Build:
./gradlew buildAndroid
# output: patches/build/libs/patches-*.mpp
```

## Use in Morphe Manager / CLI

1. Add the bundle source to Morphe (GitLab URL below).
2. Select Sygic 26.1.9 APK as input.
3. Enable **Unlock Premium**.
4. Patch + install. Uninstall stock Sygic first if signatures clash.

## Verification (no Morphe needed)

```bash
pip install androguard
python3 verify.py --apk "Sygic+GPS+Truck+&+Caravan_26.1.9_APKPure.apk"
```

Asserts package/version plus every Java fingerprint used by the patch.

## Disclaimer

Experimental, for education/research on your own legally obtained copy.
You must own Sygic and comply with its ToS and local law.
Not affiliated with Sygic or MorpheApp. License: GPLv3.
