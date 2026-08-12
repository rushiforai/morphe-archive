package app.imgur.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_IMGUR = Compatibility(
        name = "Imgur",
        packageName = "com.imgur.mobile",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1BB76E,
        targets = listOf(
            AppTarget(version = "7.34.0.0")
        )
    )
}
