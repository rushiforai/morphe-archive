package app.aapam.patches.monect.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MONECT_TV = Compatibility(
        packageName = "com.monect.tv",
        name = "Monect PC Link TV",
        description = "Monect PC Link TV Remote Desktop",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00A0E3,
        targets = listOf(
            AppTarget(
                version = "8.3.4",
                minSdk = 23,
            ),
        ),
    )
}
