package app.template.patches.siagatani

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val SIAGA_TANI = Compatibility(
        name = "Siaga Tani",
        packageName = "id.go.pertanian.epersonal",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4CAF50,
        targets = listOf(
            AppTarget(
                version = "1.0.6"
            )
        )
    )
}
