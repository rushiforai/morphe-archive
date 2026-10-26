# Runtime regression: offline audit and original-APK language path

## Confirmed device failure
The old Force English UI patch produced English bottom navigation, but a black home screen, unresponsive Account and a network-related login error. Neither the signature nor the locale getter has been proven the sole root cause.

## Repeatable offline APK scan (version 10.66.30)
- APK contains 13 DEX entries and 63 arm64-v8a native libraries.
- Full dexlib2 traversal inspected 595,518 methods, 6,699,989 reference instructions and 877,228 string-reference instructions.
- Localization.h() has 70 direct call instructions including network (UtilityImpl.getLanguageTag), login (TaobaoAppProvider.getCurrentLanguage, LoginBarController.getCurrentLanguage) and edition switching (EditionApi.g).
- LocalizationManager.d() has 6 direct call instructions, including edition switching.
- LocalizationManager.i(Context, Language) has 4 call instructions. The UI-resources-only patch is narrower, but this resource-setting method is **not guaranteed to affect UI only**.
- A separate scan found 337 methods using Android package/signature APIs; notable names include MD5Util.getApkPublicKeyDigest, SecurityUtil.getCertificate and PackageUtils.getApkKeyHashBytes. This establishes possible certificate sensitivity, **not confirmed causation**.

## Current local limits
Morphe Desktop CLI can apply a patch, rebuild and sign APKs, and independently inspect DEX changes and APK certificates. The local x86_64 container lacks Android emulator, ADB, KVM acceleration, and Android SDK download access. It cannot launch the arm64-only native app or reproduce remote login.

## Better route: Android 13+ per-app locale
Using the original signed Taobao APK and Android system shell settings avoids re-signing:

    adb shell cmd locale set-app-locales com.taobao.taobao --locales en-US
    adb shell cmd locale get-app-locales com.taobao.taobao

Android may accept this setting yet Taobao may override it internally. It is an **unverified** alternative, not a confirmed fix. A single-run, original-APK-only PowerShell probe is provided at scripts/adb_locale_probe.ps1. It verifies the original build hash before changing anything and collects app screenshots and logcat locally without uploading.

Do not request repeated unverified patched-APK installs. The original-APK probe must be evaluated first.
