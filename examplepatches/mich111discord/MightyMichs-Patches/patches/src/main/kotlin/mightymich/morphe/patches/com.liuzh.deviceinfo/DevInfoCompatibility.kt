package mightymich.morphe.patches.devinfo

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object DevInfoCompatibility {
    val DEVINFO = Compatibility(
        name = "Device Info",
        packageName = "com.liuzh.deviceinfo",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2196F3,
        targets = listOf(
            AppTarget(
                version = "3.2.3.0" 
            )
        )
    )
}
