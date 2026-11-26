package de.mobile.morphe.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MOBILE_DE = Compatibility(
        name = "mobile.de",
        packageName = "de.mobile.android.app",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF6600,
        targets = listOf(
            AppTarget(version = "10.30"),
            AppTarget(version = "10.29"),
            AppTarget(version = null, isExperimental = true),
        ),
    )
}
