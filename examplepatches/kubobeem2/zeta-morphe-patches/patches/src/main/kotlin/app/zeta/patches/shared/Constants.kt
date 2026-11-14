package app.zeta.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val ZETA = Compatibility(
        name = "Zeta: AI Chat, Story, Play",
        packageName = "com.scatterlab.messenger",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x6C5CE7,
        targets = listOf(
            AppTarget(
                version = "3.51.63"
            ),
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )
}
