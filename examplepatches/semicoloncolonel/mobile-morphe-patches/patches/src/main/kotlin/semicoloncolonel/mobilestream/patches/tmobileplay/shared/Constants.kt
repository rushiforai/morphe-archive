package semicoloncolonel.mobilestream.patches.tmobileplay.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "T-Mobile Play",
        packageName = "com.tmobile.m1",
        description = "The T-Mobile Play app.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xE20074,
        targets = listOf(
            // Patches apply, but this version has not been tested on a device.
            AppTarget("19.5.2"),
            AppTarget("19.4.4"),
        )
    )
}
