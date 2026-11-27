package app.unlimited.sportsnet.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val EXTENSION_PACKAGE = "Lapp/unlimited/sportsnet/extension"

    val COMPATIBILITY_SPORTSNET = Compatibility(
        name = "Sportsnet",
        packageName = "com.rogers.sportsnet.sportsnet",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xC8102E,
        targets = listOf(
            AppTarget(version = "6.58.0.2096-mobile-production"),
        )
    )
}
