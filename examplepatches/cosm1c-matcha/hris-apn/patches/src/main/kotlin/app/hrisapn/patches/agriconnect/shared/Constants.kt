package app.hrisapn.patches.agriconnect.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_AGRICONNECT = Compatibility(
        packageName = "com.git.agriconnect",
        name = "AgriConnect",
        description = "AgriConnect HRIS app.",
        apkFileType = ApkFileType.APK,
        // 0xRRGGBB; the alpha byte must be zero.
        appIconColor = 0xF46C09,
        targets = listOf(
            // Developed against versionName 1.0.2 / versionCode 6.
            AppTarget(version = "1.0.2"),
        ),
    )
}
