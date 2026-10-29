package app.fakh.patches.dodo.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_DODO = Compatibility(
        name = "DoDo Music",
        packageName = "com.dundunstudio.autoplay",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xD32E38,
        targets = listOf(AppTarget(version = "2.0.14", versionCode = 253)),
    )
}
