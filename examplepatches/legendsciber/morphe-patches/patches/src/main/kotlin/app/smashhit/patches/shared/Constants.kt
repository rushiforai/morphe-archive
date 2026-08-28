package app.smashhit.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SMASHHIT = Compatibility(
        name = "Smash Hit",
        packageName = "com.mediocre.smashhit",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00BCD4,
        targets = listOf(
            AppTarget(version = "1.5.14")
        )
    )
}
