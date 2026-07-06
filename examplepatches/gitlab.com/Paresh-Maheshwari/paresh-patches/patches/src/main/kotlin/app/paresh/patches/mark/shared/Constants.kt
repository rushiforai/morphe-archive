package app.paresh.patches.mark.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MARK = Compatibility(
        name = "Mark",
        packageName = "com.markOne.ss_app",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x1A1A2E,
        targets = listOf(
            AppTarget(version = "6.6")
        )
    )
}
