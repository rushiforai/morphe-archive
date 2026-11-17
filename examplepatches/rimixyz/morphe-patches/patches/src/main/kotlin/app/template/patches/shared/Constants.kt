package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_17TRACK = Compatibility(
        name = "17TRACK",
        packageName = "yqtrack.app",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1878F3,
        targets = listOf(
            // Version analyzed and confirmed by reverse engineering of the APK.
            AppTarget(version = "3.1.6896.1")
        )
    )
}
