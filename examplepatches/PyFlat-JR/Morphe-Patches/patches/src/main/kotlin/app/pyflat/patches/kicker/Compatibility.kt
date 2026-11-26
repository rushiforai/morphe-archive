package app.pyflat.patches.kicker

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_KICKER = Compatibility(
    name = "kicker",
    packageName = "com.netbiscuits.kicker",
    apkFileType = ApkFileType.XAPK,
    appIconColor = 0xE3000F,
    targets = listOf(
        AppTarget(version = null, isExperimental = true),
        AppTarget(version = "7.15.2"),
    ),
)
