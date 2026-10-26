package app.cavla.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_WOLT = Compatibility(
        name = "Wolt",
        packageName = "com.wolt.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x00C2E8,
        targets = listOf(
            AppTarget(version = "26.40.1"),
        ),
    )
}
