package app.jofslash.patches.yallashoot.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val PACKAGE_NAME = "com.yallagroup.yallashoot"

    /**
     * SHA-1 of Yalla Group's signing certificate (CN=Yalla Group), from the APK the developer hosts
     * on ysscores.com. Kept for reference: the app's core (scores, news, lineups) needs no account,
     * so no patch uses it today.
     */
    const val SIGNATURE = "ebb403895461c1453e25a0483c667e2cf5a9dc32"

    /**
     * The app is Flutter: its own code is Dart (lib/<abi>/libapp.so) and can't be patched here. The
     * patches hook the Java side of the Flutter plugins instead, which keep their names.
     */
    const val ADS_PLUGIN = "Lio/flutter/plugins/googlemobileads"

    val COMPATIBILITY_YALLA_SHOOT = Compatibility(
        name = "Yalla Shoot",
        packageName = PACKAGE_NAME,
        // The developer's download (ysscores.com) is one universal APK with arm64-v8a, armeabi-v7a
        // and x86_64 libraries, not a bundle.
        apkFileType = ApkFileType.APK,
        appIconColor = 0x131521,
        targets = listOf(
            AppTarget(version = "6.0.15"),
            AppTarget(version = null, isExperimental = true),
        )
    )
}
