package app.zdrgon.patches.vehico.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    // Vehico — Flutter title, ads via Google Mobile Ads (AdMob) only. Marked experimental 2026-11-03 at Matsen's request after the first on-device attempt failed; revisit later.

    val COMPATIBILITY_VEHICO = Compatibility(
        name = "Vehico",
        packageName = "com.optimageeks.vehico_app",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x1E88E5,
        targets = listOf(
            AppTarget(version = "1.2.31", isExperimental = true)
        )
    )
}
