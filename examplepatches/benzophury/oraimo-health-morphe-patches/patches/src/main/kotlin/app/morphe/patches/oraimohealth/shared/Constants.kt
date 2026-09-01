package app.morphe.patches.oraimohealth.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Shared compatibility definition for Oraimo Health.
 */
val COMPATIBILITY_ORAIMO_HEALTH = Compatibility(
    name = "oraimo health",
    packageName = "com.transsion.oraimohealth",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x24C875,
    targets = listOf(
        AppTarget(version = "2.0.4"),
        AppTarget(version = null, isExperimental = true)
    )
)
