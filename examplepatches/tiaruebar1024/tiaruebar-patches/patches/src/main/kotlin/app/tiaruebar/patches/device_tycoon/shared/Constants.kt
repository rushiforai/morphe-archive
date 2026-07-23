package app.tiaruebar.patches.device_tycoon.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_DEVICE_TYCOON = Compatibility(
        name = "Devices Tycoon",
        packageName = "com.roasterygames.devicestycoon",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1565C0,
        targets = listOf(
            AppTarget(version = "4.0.1")
        )
    )
}
