package app.jouss.patches.starsense.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_STARSENSE = Compatibility(
        name = "StarSense Explorer",
        packageName = "com.celestron.skybox",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x1A237E,
        targets = listOf(
            AppTarget(version = "2.0.2.3")
        )
    )
}
