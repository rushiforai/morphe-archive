package dev.brave.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

val COMPATIBILITY_BRAVE = Compatibility(
    name = "Brave Browser",
    packageName = "com.brave.browser",
    apkFileType = ApkFileType.APKM,
    targets = listOf(
        AppTarget(
            version = "1.100.58",
            minSdk = 26
        )
    )
)
