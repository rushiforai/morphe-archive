package app.morphe.patches.klikktv.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_KLIKKTV = Compatibility(
        name = "Klikk",
        packageName = "com.angel.klikk.tv",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0XFD000D,
        signatures = setOf("4e7922a556c7cfda27cf4309e05c5ecb61bef59c1b9427a870ecad3f65bbf589"),
        targets = listOf(
            AppTarget(version = "3.4.9", versionCode = 95, minSdk = 21),
        )
    )
}
