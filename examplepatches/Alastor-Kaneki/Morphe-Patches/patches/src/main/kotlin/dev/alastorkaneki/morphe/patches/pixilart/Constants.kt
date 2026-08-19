package dev.alastorkaneki.morphe.patches.pixilart

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val PIXILART = Compatibility(
        name = "Pixilart",
        packageName = "com.pixilart.app",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF315A,
        targets = listOf(
            AppTarget(
                version = "1.9.0",
                isExperimental = false
            )
        )
    )
}
