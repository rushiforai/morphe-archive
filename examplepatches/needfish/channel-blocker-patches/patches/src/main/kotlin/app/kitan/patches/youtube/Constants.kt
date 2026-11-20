package app.kitan.patches.youtube

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val COMPATIBILITY_YOUTUBE = Compatibility(
        name = "YouTube",
        packageName = "com.google.android.youtube",
        apkFileType = ApkFileType.APK,
        // YouTube icon background color, used in Morphe Manager.
        appIconColor = 0x282828,
        targets = listOf(
            // 'any' future version supported experimentally.
            AppTarget(
                version = null,
                isExperimental = true
            ),
            // Versions confirmed working with this patch bundle.
            AppTarget(
                version = "21.30.216"
            ),
            AppTarget(
                version = "21.28.208"
            ),
            AppTarget(
                version = "21.23.492"
            )
        )
    )
}
