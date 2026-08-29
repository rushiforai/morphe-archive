package app.stylus.patches.github.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_GITHUB = Compatibility(
        name = "GitHub",
        packageName = "com.github.android",
        apkFileType = ApkFileType.APK_REQUIRED,
        appIconColor = 0x181C20,
        signatures = setOf(
            "df08c9f2d809189d9d506497c15745a7395a41536efb433e3aee1aedbe11b261"
        ),
        targets = listOf(
            AppTarget(
                version = "1.273.0",
                minSdk = 32,
            ),
        ),
    )
}