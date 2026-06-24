package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_YOUTUBE = Compatibility(
        name = "YouTube",
        packageName = "com.google.android.youtube",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF0000, // YouTube red
        targets = listOf(
            AppTarget(
                version = "19.16.39"
            ),
            AppTarget(
                version = "19.25.37"
            ),
            AppTarget(
                version = "20.47.62"
            ),
        )
    )
}
