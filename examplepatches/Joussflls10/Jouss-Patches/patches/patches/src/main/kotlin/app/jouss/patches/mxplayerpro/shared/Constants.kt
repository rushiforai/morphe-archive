package app.jouss.patches.mxplayerpro.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MXPLAYER_PRO = Compatibility(
        name = "MX Player Pro",
        packageName = "com.mxtech.videoplayer.pro",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0288D1,
        targets = listOf(
            AppTarget(version = "1.93.4")
        )
    )
}
