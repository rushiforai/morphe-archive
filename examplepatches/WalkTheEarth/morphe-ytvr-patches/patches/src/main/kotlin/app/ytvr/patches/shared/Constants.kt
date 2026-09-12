package app.ytvr.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_YOUTUBE_VR = Compatibility(
        name = "YouTube VR", // App name as it appears in the Android launcher.
        packageName = "com.google.android.apps.youtube.vr.oculus",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF0000, // Icon color in Morphe Manager. Usually the same color as the icon background.
        targets = listOf(
            // App version the patches were developed against.
            AppTarget(
                version = "1.61.48"
            )
        )
    )
}
