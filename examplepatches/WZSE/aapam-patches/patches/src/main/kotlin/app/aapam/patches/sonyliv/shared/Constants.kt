package app.aapam.patches.sonyliv.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SONYLIV = Compatibility(
        packageName = "com.sonyliv",
        name = "SonyLIV Android TV",
        description = "SonyLIV: Entertainment & Sports (Android TV)",
        apkFileType = ApkFileType.APKM_REQUIRED,
        appIconColor = 0x000000,
        signatures = setOf(
            "9793a2c96ee2c8590e12f580277a5cd82a728eb5bd6aa8a2e30bf264ebb58d69"
        ),
        targets = listOf(
            AppTarget(
                version = "6.23.1",
                minSdk = 24,
            ),
            AppTarget(
                version = "6.29.13",
                minSdk = 24,
            ),
        ),
    )
}
