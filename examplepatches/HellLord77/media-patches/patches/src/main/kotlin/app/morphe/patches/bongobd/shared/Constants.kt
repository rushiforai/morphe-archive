package app.morphe.patches.bongobd.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_BONGO = Compatibility(
        name = "Bongobd",
        packageName = "com.bongo.bongobd",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0XD8062D,
        signatures = setOf("29ccbd820d40b90e7ab5206b20bcafa538508f842d21890aca39df9ee5aec9c6"),
        targets = listOf(
            AppTarget(version = "6.10.3", versionCode = 210061003, minSdk = 21),
            AppTarget(version = "6.10.2", versionCode = 210061002, minSdk = 21),
            AppTarget(version = "6.10.0", versionCode = 210061000, minSdk = 21),
            AppTarget(version = "6.9.2", versionCode = 210060902, minSdk = 21),
            AppTarget(version = "6.9.1", versionCode = 210060901, minSdk = 21),
            AppTarget(version = "6.9.0", versionCode = 210060900, minSdk = 21),
            AppTarget(version = "6.8.9", versionCode = 210060809, minSdk = 21),
            AppTarget(version = "6.8.8", versionCode = 210060808, minSdk = 21),
            AppTarget(version = "6.8.6", versionCode = 210060806, minSdk = 21)
        )
    )
}
