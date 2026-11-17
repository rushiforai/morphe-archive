package app.zdrgon.patches.appfinder.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_APP_FINDER = Compatibility(
        name = "App Finder",
        packageName = "scadica.aq",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x3F51B5,
        targets = listOf(
            AppTarget(version = "1.5.1")
        )
    )
}
