package app.serajr.patches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_X = Compatibility(
        name = "X (Twitter)",
        packageName = "com.twitter.android",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x000000,
        targets = listOf(
            AppTarget(
                version = "12.40.1-prod.01", // Experimental (migration in progress)
                isExperimental = true
            ),
            AppTarget(
                version = "12.38.1-prod.01", // Validated
                isExperimental = false
            )
        )
    )
}
