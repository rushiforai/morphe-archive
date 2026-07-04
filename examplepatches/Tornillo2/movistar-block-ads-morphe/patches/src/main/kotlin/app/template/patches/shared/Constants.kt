package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MOVISTAR = Compatibility(
        name = "Movistar Plus",
        packageName = "com.movistarplus.androidtv",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00A9E0,
        targets = listOf(
            AppTarget(
                version = "26.03.100"
            )
        )
    )
}
