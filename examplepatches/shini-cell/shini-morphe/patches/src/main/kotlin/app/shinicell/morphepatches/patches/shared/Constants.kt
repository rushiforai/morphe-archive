package app.shinicell.morphepatches.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val COMPATIBILITY_CITYMAPPER = Compatibility(
        name = "Citymapper",
        packageName = "com.citymapper.app.release",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00C89B,
        targets = listOf(
            AppTarget(
                version = "11.59.3",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 1159070),
            ),
        ),
    )

    val COMPATIBILITY_NAGRAM_XF = Compatibility(
        name = "Nagram XF",
        packageName = "fork.risin42.nagramx",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5C4D,
        targets = listOf(AppTarget(version = null)),
    )
}
