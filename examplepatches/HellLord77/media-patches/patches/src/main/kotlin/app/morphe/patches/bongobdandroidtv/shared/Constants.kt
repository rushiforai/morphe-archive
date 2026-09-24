package app.morphe.patches.bongobdandroidtv.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_BONGOANDROIDTV = Compatibility(
        name = "Bongobdandroidtv",
        packageName = "com.bongo.bongobdandroidtv",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0XD8062D,
        signatures = setOf("92a69a62905e154dc817eb81d676dcb2b686aedb1346d49feb55424f96f8408e"),
        targets = listOf(
            AppTarget(version = "1.17.1", versionCode = 230011701, minSdk = 23),
            AppTarget(version = "1.16.9", versionCode = 230011609, minSdk = 23),
            AppTarget(version = "1.16.7", versionCode = 230011607, minSdk = 23),
            AppTarget(version = "1.16.5", versionCode = 230011605, minSdk = 23)
        )
    )
}
