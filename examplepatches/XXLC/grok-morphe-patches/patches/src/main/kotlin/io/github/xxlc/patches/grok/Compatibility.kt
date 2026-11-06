package io.github.xxlc.patches.grok

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val grokCompatibility = Compatibility(
    name = "Grok",
    packageName = "ai.x.grok",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x000000,
    targets = listOf(
        AppTarget(
            version = "1.2.53-release.00",
            versionCode = 11253200,
        ),
    ),
)
