package app.utsavrajput.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MX_PLAYER = Compatibility(
        name = "MX Player",
        packageName = "com.mxtech.videoplayer.ad",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xE63030,
        targets = listOf(
            AppTarget(
                version = "2.14.1"
            )
        )
    )
}