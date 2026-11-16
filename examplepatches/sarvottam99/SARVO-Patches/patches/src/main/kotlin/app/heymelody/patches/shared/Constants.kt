package app.heymelody.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_HEY_MELODY = Compatibility(
        name = "HeyMelody",
        packageName = "com.heytap.headset",
        apkFileType = ApkFileType.APKM,
        targets = listOf(
            AppTarget(
                version = "117.6.6",
                isExperimental = false,
                minSdk = 29
            )
        )
    )
}
