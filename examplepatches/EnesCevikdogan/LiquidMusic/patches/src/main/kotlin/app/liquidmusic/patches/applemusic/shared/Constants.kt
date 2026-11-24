package app.liquidmusic.patches.applemusic.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_APPLE_MUSIC = Compatibility(
        name = "Apple Music",
        packageName = "com.apple.android.music",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFA2D48,
        targets = listOf(
            AppTarget(
                version = "7.0.0-beta",
                description = "Floating tab bar and mini player redesign",
            ),
            AppTarget(
                version = null,
                isExperimental = true,
            ),
        ),
    )
}
