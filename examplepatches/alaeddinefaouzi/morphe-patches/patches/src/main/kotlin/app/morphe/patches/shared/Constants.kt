package app.morphe.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val BROBUDDY_PACKAGE_NAME = "com.brobuddy.game"
    const val BROBUDDY_TARGET_VERSION = "1.0.3"

    val COMPATIBILITY_BROBUDDY = Compatibility(
        name = "BroBuddy",
        packageName = BROBUDDY_PACKAGE_NAME,
        description = "BroBuddy game patch",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF6B35,
        targets = listOf(
            AppTarget(
                version = BROBUDDY_TARGET_VERSION,
                isExperimental = false,
                description = "BroBuddy: Ragdoll Game v1.0.3",
            )
        )
    )
}
