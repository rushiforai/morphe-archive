package app.morphe.patches.klikk.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_KLIKK = Compatibility(
        name = "Klikk",
        packageName = "com.angel.klikk",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0XFD000D,
        signatures = setOf("38a6da45b9097c0286b962a804d3c3d65511685fef6ead76cdcfa1690c3bb592"),
        targets = listOf(
            AppTarget(version = "3.6.3", versionCode = 150, minSdk = 23),
            AppTarget(version = "3.5.6", versionCode = 146, minSdk = 23),
            AppTarget(version = "3.5.4", versionCode = 144, minSdk = 23),
            AppTarget(version = "3.5.2", versionCode = 142, minSdk = 23),
            AppTarget(version = "3.5.0", versionCode = 137, minSdk = 23),
            AppTarget(version = "3.4.7", versionCode = 136, minSdk = 23),
            AppTarget(version = "3.3.3", versionCode = 133, minSdk = 23),
        )
    )
}
