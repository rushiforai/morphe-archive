package app.navhi.patches.greatday.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_GREATDAY = Compatibility(
        name = "GreatDay HR",
        packageName = "com.dataon.sunfishgo",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF7A00,
        targets = listOf(
            AppTarget(version = "7.54.0"),
            AppTarget(version = null, isExperimental = true),
        ),
    )
}
