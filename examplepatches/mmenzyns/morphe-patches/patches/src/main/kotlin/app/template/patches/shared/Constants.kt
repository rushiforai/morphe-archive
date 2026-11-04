package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_ALZA = Compatibility(
        name = "Alza",
        packageName = "cz.alza.eshop",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00A651,
        targets = listOf(
            AppTarget(
                version = "2026.21.0"
            )
        )
    )
}

