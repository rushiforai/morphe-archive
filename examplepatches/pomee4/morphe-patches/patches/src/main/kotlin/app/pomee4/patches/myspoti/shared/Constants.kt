package app.pomee4.patches.myspoti.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    private val TARGETS = listOf(
        AppTarget(version = "2.3.0"),
        AppTarget(version = null, isExperimental = true),
    )

    val COMPATIBILITY_MYSPOTI = Compatibility(
        name = "MySpoti",
        packageName = "app.myspoti.dev",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1DB954,
        targets = TARGETS,
    )
}
