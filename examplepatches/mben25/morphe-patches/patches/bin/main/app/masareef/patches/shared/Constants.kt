package app.masareef.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MASAREEF = Compatibility(
        name = "Masareef",
        packageName = "com.appsqueue.masareef",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2E7D32,
        targets = listOf(
            AppTarget(
                version = "2.6.4"
            )
        )
    )
}
