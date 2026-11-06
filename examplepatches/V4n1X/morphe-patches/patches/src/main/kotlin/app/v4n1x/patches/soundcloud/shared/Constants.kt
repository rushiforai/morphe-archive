package app.v4n1x.patches.soundcloud.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SOUNDCLOUD = Compatibility(
        name = "SoundCloud",
        packageName = "com.soundcloud.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF5500,
        targets = listOf(
            AppTarget(
                version = "2026.11.02-release",
                minSdk = 29,
                description = "Verified with all five patches on Android 16 using Morphe Manager 2.5.0.",
            ),
            AppTarget(
                version = "2026.08.26-release"
            ),
            AppTarget(
                version = "2026.09.23-release",
                minSdk = 29,
                isExperimental = true,
                description = "All five patches verified locally; on-device validation pending.",
            )
        )
    )
}
