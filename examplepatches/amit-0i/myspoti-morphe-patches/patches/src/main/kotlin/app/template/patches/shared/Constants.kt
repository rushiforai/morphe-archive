package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val MYSPOTI_STABLE = Compatibility(
        name = "MySpoti",
        packageName = "app.myspoti.stable",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1DB954,
        targets = listOf(AppTarget(version = "2.3.0", isExperimental = false)),
    )
}
