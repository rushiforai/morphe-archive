package app.dorfandiy.ironfox.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_IRONFOX = Compatibility(
        name = "IronFox",
        packageName = "org.ironfoxoss.ironfox",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xE8590C,
        targets = listOf(
            // Developed against the Fenix 151 sources; other versions are expected to work
            // because the patch only touches resources that Fenix has kept for years.
            AppTarget(version = null, isExperimental = true),
        ),
    )
}
