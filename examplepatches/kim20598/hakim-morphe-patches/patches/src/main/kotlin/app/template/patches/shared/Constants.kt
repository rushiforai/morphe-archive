package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_LETTERBOXD = Compatibility(
        name = "Letterboxd",
        packageName = "com.letterboxd.letterboxd",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF8000,
        targets = listOf(
            AppTarget(version = null)
        )
    )

    val COMPATIBILITY_BUSUU = Compatibility(
        name = "Busuu",
        packageName = "com.busuu.android.enc",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x116EEE,
        targets = listOf(
            AppTarget(version = "32.44.1", versionCode = 1717099)
        )
    )
}
