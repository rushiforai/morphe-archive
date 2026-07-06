package app.morphe.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_LSPOSED = Compatibility(
        name = "Java Inspector",
        description = "https://gitlab.com/inotia00/JavaInspector",
        packageName = "com.java.inspector",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x6750A4,
        targets = listOf(
            AppTarget(
                version = "1.0.0",
                minSdk = 29
            )
        )
    )
}
