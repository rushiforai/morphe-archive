package app.adish.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_JAINPANCHANG = Compatibility(
        name = "Jain Panchang",
        packageName = "com.jaindarshan.panchangtithi",
        apkFileType = ApkFileType.APKS,
        appIconColor = 0xD50000,
        targets = listOf(
            AppTarget(version = "10.2")
        )
    )
}
