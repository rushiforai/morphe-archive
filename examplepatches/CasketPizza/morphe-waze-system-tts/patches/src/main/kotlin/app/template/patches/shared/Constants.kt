package app.waze.systemtts.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val COMPATIBILITY_WAZE = Compatibility(
        name = "Waze",
        packageName = "com.waze",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0097A7,
        targets = listOf(
            AppTarget(
                version = "5.24.5.0",
                versionCodes = mapOf(
                    SupportedAbi.ARM64_V8A to 1030732,
                    SupportedAbi.ARMEABI_V7A to 1030732
                )
            )
        )
    )
}
