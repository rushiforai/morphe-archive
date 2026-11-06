package app.xfeedcleanup.patches.x

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_X = Compatibility(
    name = "X",
    packageName = "com.twitter.android",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x000000,
    targets = listOf(
        AppTarget(version = "12.31.0-prod.01"),
        AppTarget(version = "12.32.0-prod.01"),
    )
)
