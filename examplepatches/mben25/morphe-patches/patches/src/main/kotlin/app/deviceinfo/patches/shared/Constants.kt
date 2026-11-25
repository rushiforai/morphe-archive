package app.deviceinfo.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Verified against the decompiled `apps/deviceinfo/dinfo.3.4.4.0.apk`
     * (apktool.yml: versionCode 336, versionName 3.4.4.0).
     */
    val COMPATIBILITY_DEVICEINFO = Compatibility(
        name = "DeviceInfo",
        packageName = "com.ytheekshana.deviceinfo",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1976D2,
        targets = listOf(
            AppTarget(version = "3.4.4.0"),
        ),
    )
}
