package app.paresh.patches.teleprompter.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_TELEPROMPTER = Compatibility(
        name = "Prompter Pal",
        packageName = "com.solid.teleprompter",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x6200EE,
        targets = listOf(
            AppTarget(version = "6.8.2"),
            AppTarget(version = "6.8.1")
        )
    )
}
