package app.fakh.patches.detik.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_DETIK = Compatibility(
        name = "detikcom",
        packageName = "org.detikcom.rss",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0A4D9C,
        targets = listOf(AppTarget(version = "7.14.1", versionCode = 464)),
    )
}
