package mightymich.morphe.patches.com.piriform.ccleaner

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object CCleanerCompatibility {
    val CCLEANER = Compatibility(
        name = "CCleaner",
        packageName = "com.piriform.ccleaner",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A73E8,
        targets = listOf(
            AppTarget(version = "26.08.0")
        )
    )
}
