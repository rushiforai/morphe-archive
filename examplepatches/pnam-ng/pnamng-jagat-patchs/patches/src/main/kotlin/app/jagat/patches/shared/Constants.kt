package app.jagat.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val COMPATIBILITY_JAGAT = Compatibility(
        name = "Jagat",
        packageName = "io.jagat.lite",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5722,
        targets = listOf(
            AppTarget(
                version = "6.8.4",
                versionCodes = mapOf(
                    SupportedAbi.ARM64_V8A to 417,
                    SupportedAbi.ARMEABI_V7A to 417
                )
            ),
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )
}
