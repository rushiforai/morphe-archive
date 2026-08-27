package app.canh0chua.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_VIBER = Compatibility(
        name = "Viber",
        packageName = "com.viber.voip",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x7360F2,
        targets = listOf(
            AppTarget(version = null, isExperimental = true)
        )
    )
}