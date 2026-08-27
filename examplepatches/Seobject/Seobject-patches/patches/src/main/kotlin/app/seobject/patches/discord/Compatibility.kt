package app.seobject.patches.discord

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Compatibility {
    val COMPATIBILITY_DISCORD = Compatibility(
        name = "Discord",
        packageName = "com.discord",
        apkFileType = ApkFileType.APKM_REQUIRED,
        appIconColor = 0x5864F0,
        targets = listOf(
            AppTarget(
                version = "341.13 - Stable",
                minSdk = 24,
                isExperimental = true,
            )
        )
    )
}
