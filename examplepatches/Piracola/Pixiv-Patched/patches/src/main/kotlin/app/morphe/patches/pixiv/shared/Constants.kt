package app.morphe.patches.pixiv.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object PixivConstants {
    val PIXIV = Compatibility(
        name = "Pixiv",
        packageName = "jp.pxv.android",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0096FA,
        targets = listOf(
            AppTarget(version = "6.202.1"),
            AppTarget(version = "6.203.0")
        )
    )
}
