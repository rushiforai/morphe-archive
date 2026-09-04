package com.autocat.morphe.smartlauncher.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Smart Launcher 6",
        packageName = "ginlemon.flowerfree",
        apkFileType = ApkFileType.APK_REQUIRED,
        appIconColor = 0x3B82F6,
        signatures = emptySet<String>(),
        targets = listOf(
            AppTarget(version = "6.6 build 017", isExperimental = true, minSdk = 24),
        )
    )
}
