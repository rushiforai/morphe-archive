package app.aphelion.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_APHELION = Compatibility(
        name = "Aphelion",
        packageName = "com.wave.aphelion",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A237E,
        targets = listOf(
            AppTarget(version = "0.4.9")
        )
    )
}
