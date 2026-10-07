package app.morphe.patches.reddit.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_REDDIT = Compatibility(
        name = "Reddit",
        packageName = "com.reddit.frontpage",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF4500,
        targets = listOf(
            AppTarget(
                version = "2026.40.0",
                minSdk = 29,
                isExperimental = true
            ),
            AppTarget(
                version = "2026.39.0",
                minSdk = 29,
                isExperimental = true
            )
        )
    )
}
