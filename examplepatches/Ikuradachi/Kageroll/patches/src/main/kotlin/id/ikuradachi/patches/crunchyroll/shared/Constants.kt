package id.ikuradachi.patches.crunchyroll.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CRUNCHYROLL = Compatibility(
        name = "Crunchyroll",
        packageName = "com.crunchyroll.crunchyroid",
        apkFileType = ApkFileType.APKM_REQUIRED,
        targets = listOf(
            AppTarget(version = "3.129.1", minSdk = 26),
        ),
    )
}
