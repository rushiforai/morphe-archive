package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_STELLA_SORA = Compatibility(
        name = "Stella Sora",
        packageName = "com.YoStarEN.StellaSora",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4A90E2,
        targets = listOf(
            AppTarget(
                version = null,
                isExperimental = true
            ),
            AppTarget(
                version = "2.0.0"
            )
        )
    )
}
