package app.salaat.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SALAAT = Compatibility(
        name = "Salaat First",
        packageName = "org.hicham.salaat",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00897B,
        targets = listOf(
            AppTarget(
                version = "6.3.4"
            )
        )
    )
}
