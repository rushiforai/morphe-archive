package app.speedtest.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SPEEDTEST = Compatibility(
        name = "Speedtest",
        packageName = "org.zwanoo.android.speedtest",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xD81F26,
        targets = listOf(
            AppTarget(version = "7.1.1"),
        ),
    )
}
