package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_LOCKSTAR = Compatibility(
        name = "LockStar",
        packageName = "com.samsung.systemui.lockstar",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x3E91FF,
        targets = listOf(
            // Version the patch was built against.
            AppTarget(version = "9.5.00.0"),
        ),
    )
}
