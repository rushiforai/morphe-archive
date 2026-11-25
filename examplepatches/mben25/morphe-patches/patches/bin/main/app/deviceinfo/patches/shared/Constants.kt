package app.deviceinfo.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Verified against the decompiled `Deviceinfo.apk` in `deviceinfo/Deviceinfo.apk`
     * (apktool.yml: versionCode 330, versionName 3.4.3.4).
     */
    val COMPATIBILITY_DEVICEINFO = Compatibility(
        name = "DeviceInfo",
        packageName = "com.ytheekshana.deviceinfo",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1976D2,
        targets = listOf(
            AppTarget(version = "3.4.3.4"),
        ),
    )
}
