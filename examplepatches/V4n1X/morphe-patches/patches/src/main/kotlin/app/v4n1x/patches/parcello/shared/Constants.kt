package app.v4n1x.patches.parcello.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_PARCELLO = Compatibility(
        name = "Parcello",
        packageName = "org.parcello",
        apkFileType = ApkFileType.APK,
        targets = listOf(
            AppTarget(
                version = "2.2.20",
                versionCode = 200220,
                minSdk = 26,
                isExperimental = true,
                description = "On-device validation pending.",
            ),
        ),
    )
}
