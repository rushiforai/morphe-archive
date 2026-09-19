package app.ais.patches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_APP = Compatibility(
        name = "AIS",
        packageName = "com.streamdev.aiostreamer",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x5C2D91,
        targets = listOf(
            AppTarget(
                version = "6.7.1"
            ),
            // Expected to keep working on future versions.
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )
}
