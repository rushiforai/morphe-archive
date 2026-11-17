package app.zdrgon.patches.timemark.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_TIMEMARK = Compatibility(
        name = "Timemark",
        packageName = "com.oceangalaxy.camera.new",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x2196F3,
        targets = listOf(
            // The version string literally starts with "v" in the
            // APK's badging (aapt: versionName="v10.0.316",
            // versionCode=100031600).
            AppTarget(version = "v10.0.316")
        )
    )
}
