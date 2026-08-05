package dev.alastorkaneki.morphe.patches.operagx

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val OPERA_GX = Compatibility(
        name = "Opera GX",
        packageName = "com.opera.gx",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xA31AFF,
        targets = listOf(
            // Opera GX Mobile is heavily obfuscated and updates independently.
            // This patch only injects a self-contained Activity, so it deliberately
            // avoids version-specific method fingerprints.
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )
}
