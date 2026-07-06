package app.braydog2010.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_VENABOX_HUB = Compatibility(
        name = "Venabox Hub",
        packageName = "com.dubani.dub",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A237E,
        targets = listOf(
            AppTarget(
                version = "1.3.2"
            )
        )
    )
}
