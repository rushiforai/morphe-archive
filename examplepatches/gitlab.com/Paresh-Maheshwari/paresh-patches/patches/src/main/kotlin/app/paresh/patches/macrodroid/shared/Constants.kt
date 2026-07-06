package app.paresh.patches.macrodroid.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MACRODROID = Compatibility(
        name = "MacroDroid",
        packageName = "com.arlosoft.macrodroid",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x20334D,
        targets = listOf(
            AppTarget(version = "5.62.11")
        )
    )
}
