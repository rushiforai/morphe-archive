package app.playerbridge.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_LETTERBOXD = Compatibility(
        packageName = "com.letterboxd.letterboxd",
        name = "Letterboxd",
        apkFileType = ApkFileType.APK,
        appIconColor = "#7B5EA7",
        targets = listOf(AppTarget(version = null)),
    )

    val COMPATIBILITY_DOUBAN = Compatibility(
        packageName = "com.douban.frodo",
        name = "豆瓣",
        apkFileType = ApkFileType.APK,
        appIconColor = "#00B51D",
        targets = listOf(
            AppTarget(
                version = "7.135.0",
                description = "Verified target from the supplied APK (versionCode 363).",
            ),
        ),
    )
}
