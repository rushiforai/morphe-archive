package app.riky.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    // TODO: Shown in each app. Settings user may watch.
    // 3BMeteo: https://apkpure.net/app/com.Meteosolutions.Meteo3b
    val COMPATIBILITY_METEO3B = Compatibility(
        // App name as it appears in the Android launcher.
        name = "3BMeteo",
        packageName = "com.Meteosolutions.Meteo3b",
        // Split APK (XAPK) from apkpure.net.
        apkFileType = ApkFileType.APKM,
        // Icon color in Morphe Manager. Usually the same color as the icon background.
        appIconColor = 0x30639B,
        targets = listOf(
            AppTarget(version = "4.9.15")
        )
    )
}