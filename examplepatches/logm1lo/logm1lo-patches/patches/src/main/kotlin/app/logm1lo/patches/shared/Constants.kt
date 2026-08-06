package app.logm1lo.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

val COMPATIBILITY_CALISTREE = Compatibility(
    name = "Calistree",
    packageName = "com.calistree.calistree",
    appIconColor = 0x4CAF50,
    apkFileType = ApkFileType.APK,
    targets = listOf(
        AppTarget(version = "5.8.5"),
    )
)
