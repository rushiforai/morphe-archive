package dev.alastorkaneki.morphe.patches.suno

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val SUNO = Compatibility(
        name = "Suno",
        packageName = "com.suno.android",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x8B5CF6,
        targets = listOf(
            // The implementation is self-contained and deliberately avoids
            // version-specific fingerprints against Suno's obfuscated UI.
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )
}
