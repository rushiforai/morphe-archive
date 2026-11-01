package app.fakh.patches.kompas.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_KOMPAS = Compatibility(
        name = "KOMPAS.com",
        packageName = "com.ertanto.kompas.official",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x0067B1,
        targets = listOf(AppTarget(version = "9.8.4", versionCode = 9008004)),
    )
}
