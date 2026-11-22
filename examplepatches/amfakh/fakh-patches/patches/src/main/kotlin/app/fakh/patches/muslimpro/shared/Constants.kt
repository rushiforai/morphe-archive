package app.fakh.patches.muslimpro.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MUSLIMPRO = Compatibility(
        name = "Muslim Pro",
        packageName = "com.bitsmedia.android.muslimpro",
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x2E7D32,
        targets = listOf(AppTarget(version = "17.11", versionCode = 1711000201)),
    )
}
