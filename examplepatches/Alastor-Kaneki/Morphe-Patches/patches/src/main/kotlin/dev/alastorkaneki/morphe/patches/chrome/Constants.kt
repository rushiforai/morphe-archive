package dev.alastorkaneki.morphe.patches.chrome

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val CHROME = Compatibility(
        name = "Google Chrome",
        packageName = "com.android.chrome",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4285F4,
        targets = listOf(
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )
}
