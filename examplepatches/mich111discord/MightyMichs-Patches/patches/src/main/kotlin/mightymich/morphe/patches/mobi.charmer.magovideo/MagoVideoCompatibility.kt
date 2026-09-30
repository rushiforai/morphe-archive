package mightymich.morphe.patches.magovideo

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object MagoVideoCompatibility {
    val MAGO_VIDEO = Compatibility(
        name = "MagoVideo",
        packageName = "mobi.charmer.magovideo",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5722,
        targets = listOf(
            AppTarget(
                version = "5.7.1",
                isExperimental = true // Experimental support – patch may cause crashes.
            )
        )
    )
}
