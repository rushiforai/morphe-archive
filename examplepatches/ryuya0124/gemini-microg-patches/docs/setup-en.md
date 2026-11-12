# Supported setup (English)

Gemini is a launcher. Its native assistant/chat implementation is in the **Google app**. These patches redirect the launcher to a separately installed Google clone. They do not move the Google implementation into the Gemini APK.

`Gemini Standalone Support` means **installable without Gemini's resource splits**, not “independent of the Google app.” Keep the original system Google app installed. Do not remove it to work around an installation error.

## Input versions and variants

| Component | Current local build input / tested version | Minimum Android |
| --- | --- | --- |
| Google app, default resource-split input | `17.72.17.ve.arm64` / versionCode `301831138` | API 32 (Android 12L) |
| Gemini launcher, default input | `1.0.995038376` / versionCode `345` | API 32 (Android 12L) |
| Google app, monolithic nodpi variant | Same version; [Android 11+ download](https://www.apkmirror.com/apk/google-inc/google-search/google-app-17-72-17-release/google-app-17-72-17-ve-arm64-android-apk-download/) | API 30 |
| Gemini launcher, arm64/arm variant | Same version; [Android 10+ download](https://www.apkmirror.com/apk/google-inc/google-gemini/google-gemini-1-0-995038376-release/google-gemini-1-0-995038376-3-android-apk-download/) | API 29 |
| microG RE | `7.3.0`, package `app.revanced.android.gms`, previously verified on the Samsung device | Check microG's own requirements |

**The APK variant matters as well as its version number.** API 31 rejects the default API 32 files with `INSTALL_FAILED_OLDER_SDK`; this does not establish that the app version or patch bundle is incompatible with Android 12. For Android 12, use the original API 30 Google and API 29 Gemini variants above. Their minimum SDK is preserved during patching. The Google nodpi APK contains its resources and does not use the API 32 xxhdpi split.

No root operation or de-Googled ROM is required by the install procedure. The Issue #8 regression passed on Google APIs emulators running **Android 12 / API 31** and API 36, with the original Google system app present, using shell UID 2000 and without `adb root`/`su`. The API 31 run used the API 30/API 29 variants above and passed all 26 assertions. See the [Android 12 verification and exact input hashes](testing/issue-8-android12.md). Account login/chat and the reporter's physical OnePlus 8 were not tested in these emulators.

## Morphe Manager configuration

Use **v0.3.2 or newer** with the matching original APKs. The local pipeline uses Morphe Desktop 1.15.0 / Patcher 1.12.0. The official patches bundle 1.41.0 is retained for historical baseline and compatibility tests; it is not needed for normal patching.

For **both** Google and Gemini:

1. Add this source and keep its compatible **default patch selection**, including **Automatic Clone Setup**.
2. Patch and install. No Expert mode, official Clone app selection, or custom clone options are needed.

Automatic Clone Setup fixes the package name, declared custom permissions and provider authorities. The dependent bytecode patches also update owned permission references. Original permission protection levels are preserved. If an older saved selection still includes official Clone app, its `Default` package setting works with both its untouched options and the previous true/true settings while Automatic Clone Setup remains selected. Custom package names are rejected.

Expected installed packages:

- Google: `com.google.android.googlequicksearchbox.morphe`
- Gemini: `com.google.android.apps.bard.morphe`
- microG: `app.revanced.android.gms`

Custom clone names such as `com.quicksearch.bond` are **not supported**. DEX references and launcher visibility target the fixed `.morphe` packages.

Install the Google clone, Gemini clone and microG in the same Android user/profile. The Google nodpi APK above includes resources and needs no separate resource split. For the default API32 split input, also install its repackaged xxhdpi resource split. The verified pipeline signs Google, its split and Gemini with the same key; retain that existing key for updates. The local scripts handle the split. A bare base extracted from a resource-split bundle is not the complete verified resource setup.

Never enable these historical experiments:

- `Account ID Fallback for Clone`
- `Account Switch Lock Bypass`
- `Account Sync Binder Loop Fix`

They previously broke synchronization or token acquisition. They are disabled by default, and the patcher now rejects them before modifying DEX. “Select every patch” is not a supported configuration.

The GmsCore redirect targets `app.revanced.android.gms`. The old title containing `7.0.0` was historical wording, not a hard version check; the title was clarified. The known working microG version is 7.3.0. Please provide the exact version rather than the ambiguous spelling “7.30”.

## Verified local build

For the default API 32 inputs, follow the repository quick start, then:

```sh
scripts/build-all.sh
scripts/sign-apks.sh
ANDROID_USER=0 ADB_SERIAL=your_device_serial scripts/install-device.sh
```

The pipeline uses this source's default selection with no external Clone app or option flags. It verifies final package names, isolated permission declarations, unchanged protection levels, manifest/DEX permission references and noncolliding provider authorities. It also checks fresh patch-result JSON so a failed patch cannot be mistaken for an old successful APK. Set `ANDROID_USER=150` for Secure Folder; installation defaults to user 0.

For an APK exported from Manager, export it **before installation** and run:

```sh
scripts/setup-tools.sh
scripts/compile-patches.sh
scripts/verify-clone-contract.sh original-google-base.apk manager-google-output.apk
scripts/verify-clone-contract.sh original-gemini-base.apk manager-gemini-output.apk
```

The CLI scripts enforce this additional output validation. Manager does not run these host scripts; automatic clone setup is implemented inside the MPP itself.

For the original API 30/API 29 pair, [the Android 12 regression guide](testing/issue-8-android12.md) builds an isolated set of local test APKs without replacing the default inputs or `dist/`. All 14 Google DEX files and all 3 Gemini DEX files are identical between these original variants and the default originals. Only the local default input selection required API 32, not the patch bundle itself. [Default clone verification](testing/default-clone.md) records the v0.3.2 tests.

If the duplicate-permission error persists, provide your exact Google/Gemini/patch/Morphe versions, final package name, selected patches and Clone app option values. Do not publish signing keys, account tokens or full authentication logs.
