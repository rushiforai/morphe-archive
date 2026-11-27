package app.xfilter.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_X = Compatibility(
        name = "X",
        packageName = "com.twitter.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(
            AppTarget(version = "12.19.1-release.0"),
            // The only hook is a Jackson method, so newer versions will likely work.
            AppTarget(version = null, isExperimental = true),
        ),
    )
}
