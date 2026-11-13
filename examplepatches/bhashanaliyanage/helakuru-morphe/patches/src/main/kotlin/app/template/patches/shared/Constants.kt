package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_HELAKURU_LITE = Compatibility(
        name = "Helakuru Lite",
        packageName = "lk.bhasha.helakuru.lite",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xD7C900,
        targets = listOf(
            AppTarget(version = "3.2.0")
        )
    )
}
