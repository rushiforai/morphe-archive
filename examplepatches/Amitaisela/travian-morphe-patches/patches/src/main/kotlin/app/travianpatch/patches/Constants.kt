package app.travianpatch.patches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_TRAVIAN_LEGENDS = Compatibility(
        name = "Travian: Legends",
        packageName = "com.traviangames.travianlegendsmobile",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x7A1F1F,
        targets = listOf(
            AppTarget(version = "4.0.0"),
            AppTarget(version = "4.0.1"),
            // Any other version is allowed to try (Unity bootstrap layer rarely changes).
            AppTarget(version = null, isExperimental = true)
        )
    )
}
