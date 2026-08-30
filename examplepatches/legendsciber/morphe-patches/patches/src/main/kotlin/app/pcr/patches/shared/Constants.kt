package app.pcr.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_PCR = Compatibility(
        name = "Pixel Car Racer",
        packageName = "com.StudioFurukawa.PixelCarRacer",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF6F00,
        targets = listOf(
            AppTarget(version = "1.2.5")
        )
    )
}
