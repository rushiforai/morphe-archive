# YouTube Music stable promotion

The user approved promotion of the consolidated development patch to `main` on 2026-11-02. Promote only the YouTube Music implementation, extension, tests, validation harness and app instructions from `v1.28.0-dev.1`. Preserve the current stable implementation of every other app.

The resulting public catalogue contains one YouTube Music entry, for the original `com.google.android.apps.youtube.music` package, and one **Gearslip music browser support** patch. Its version and build-code filters are null (Any); missing or changed browser/adapter contracts still stop patching. The personal-library implementation is an unnamed internal dependency, sharing the public patch's trusted-host option and linking after the other selected sources install their hooks.

The ten YouTube Music class/extension payload entries in the local stable candidate match the approved development bundle byte-for-byte. The full release Gradle checks, 421 Python tests (45 skipped), Medium ABI check, generated metadata and bilingual app-page checks passed before promotion. Prior Android validation used actual emitted DEX in accountless fixtures; it does not establish availability of every account's online catalogue.

## Gearslip update badge

This promotion changes no Gearslip patch or extension code. Personal-library delivery runs in YouTube Music and answers Gearslip's existing MediaBrowser requests; it does not require a new Gearslip APK.

A separate development change, [6f52bfa](https://codeberg.org/JohninNL/nl-morphe-patches/commit/6f52bfabce541f237ba817c460e24b8d5de016f3), changed Gearslip's launcher selection to omit an unusable car Settings tile and retain one music player. That change is outside this promotion.

Manager's [scoped changelog matcher](https://github.com/MorpheApp/morphe-manager/blob/d9f78dfbee3f4e1db0cd30b76a57bd10dbaae3f7/app/src/main/java/app/morphe/manager/util/ChangelogParser.kt#L346-L366) matches the explicit app scope, rather than incidental app names in its body. Its [badge decision](https://github.com/MorpheApp/morphe-manager/blob/d9f78dfbee3f4e1db0cd30b76a57bd10dbaae3f7/app/src/main/java/app/morphe/manager/ui/viewmodel/HomeApps.kt#L919-L946) scans releases since each app's stored patch-source version and uses a conservative result when changelog data is unavailable. The older genuine Gearslip release can therefore explain a remaining Gearslip badge. The device's stored version and cached changelog were not inspected, so its precise badge cause is not asserted here.
