package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_BHIM = Compatibility(
        name = "BHIM UPI",
        packageName = "in.org.npci.upiapp",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x097969,
        targets = listOf(
            AppTarget(
                version = "4.0.24",
                versionCodes = mapOf(
                    // versionCode 272000209
                )
            )
        )
    )
}
