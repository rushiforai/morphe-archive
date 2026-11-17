package app.zdrgon.patches.contentcam.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CONTENTCAM = Compatibility(
        name = "ContentCam",
        packageName = "app.contentcam.android",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x00BCD4,
        targets = listOf(
            AppTarget(version = "2.8.0")
        )
    )
}
