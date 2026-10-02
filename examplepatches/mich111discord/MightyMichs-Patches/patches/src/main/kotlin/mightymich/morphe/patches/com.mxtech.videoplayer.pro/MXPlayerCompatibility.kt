package mightymich.morphe.patches.com.mxtech.videoplayer.pro

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object MXPlayerCompatibility {
    val MX_PLAYER = Compatibility(
        name = "MX Player Pro",
        packageName = "com.mxtech.videoplayer.pro",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFFF44336.toInt(),
        targets = listOf(
            AppTarget(version = "2.2.4")
        )
    )
}
