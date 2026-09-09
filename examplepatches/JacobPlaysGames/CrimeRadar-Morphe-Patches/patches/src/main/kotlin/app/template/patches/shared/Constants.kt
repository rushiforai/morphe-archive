package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val COMPATIBILITY_CRIMERADAR = Compatibility(
        name = "CrimeRadar",
        packageName = "com.newsbreak.crimeradar",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xB71C1C, // Dark red, matching CrimeRadar icon background
        targets = listOf(
            AppTarget(
                version = "26.33.1"
            ),
            AppTarget(
                version = "26.34.0"
            )
        )
    )

    val COMPATIBILITY_SCANNERRADIO = Compatibility(
        name = "Scanner Radio",
        packageName = "com.scannerradio",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2196F3, // Blue, matching Scanner Radio icon
        targets = listOf(
            AppTarget(
                version = null, // Any version
                minSdk = 29     // Scanner Radio requires Android 10+
            )
        )
    )
}
