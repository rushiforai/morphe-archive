package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * ProxMobo (com.halliharp.proxmobo) - Flutter (Dart AOT) streaming app.
     *
     * The shipping APK is version 1.0.1 (versionCode 9). It is a Flutter app, so
     * the "premium" gating logic lives in libapp.so and can only be influenced
     * through the Android plugin layer (in-app billing / PairIP licensing). The
     * premium product id is `proxmobo.premium.lifetime`.
     */
    val COMPATIBILITY_PROXMOBO = Compatibility(
        name = "ProxMobo", // App name as it appears in the Android launcher.
        packageName = "com.halliharp.proxmobo",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x3F2A44, // Icon background color used in Morphe Manager.
        targets = listOf(
            AppTarget(
                version = "1.0.1"
            )
        )
    )
}