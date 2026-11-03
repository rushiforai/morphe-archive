package app.consumerclarity.patches.talabat

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

val TALABAT_COMPATIBILITY = Compatibility(
    name = "talabat",
    packageName = "com.talabat",
    apkFileType = ApkFileType.XAPK_REQUIRED,
    appIconColor = 0xFF5A00,
    targets = listOf(
        AppTarget(
            version = "14.4.0",
            versionCodes = mapOf(SupportedAbi.ARM64_V8A to 2368),
            description = "ARM64 build analyzed with REA and Jadart",
        ),
    ),
)
