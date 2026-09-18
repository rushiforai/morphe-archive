package app.dantheman.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_DANTHEMAN = Compatibility(
        name = "Dan The Man",
        packageName = "com.halfbrick.dantheman",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4CAF50,
        targets = listOf(
            AppTarget(version = "1.14.02")
        )
    )
}
