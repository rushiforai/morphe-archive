# Contributing to the Yalla Shoot patches

Yalla Shoot is a Flutter app: its own code is Dart, compiled into `lib/<abi>/libapp.so`, which these patches
don't change. The ads, the tracking and the permissions all go through Flutter plugins whose Java side keeps its
names, so the patches hook those (`io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin.onMethodCall`,
Firebase Crashlytics) and the manifest, and fail loudly when one is gone. The developer hosts a single universal
APK (arm64-v8a, armeabi-v7a and x86_64) on ysscores.com; it isn't on APKMirror or APKPure:
`python .github/scripts/check_app.py yalla-shoot <yalla-shoot.apk> --cli <morphe-cli.jar> --install --expect-screen`
patches it with every Yalla Shoot patch and starts it on a phone or emulator, as the emulator test does.

Which ad calls the Dart code makes can be read from the strings in `libapp.so`: today `MobileAds#initialize`,
`loadBannerAd`, `loadNativeAd`, `loadInterstitialAd` and `loadRewardedAd`, and no consent (UMP) calls.

See the [general guide](../../CONTRIBUTING.md) for building, pull requests and where things are.
