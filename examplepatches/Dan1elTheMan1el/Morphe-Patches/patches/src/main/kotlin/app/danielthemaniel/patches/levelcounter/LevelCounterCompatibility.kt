package app.danielthemaniel.patches.levelcounter

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_LEVEL_COUNTER = Compatibility(
    name = "Counter",
    packageName = "com.izorg.munchkin",
    apkFileType = ApkFileType.XAPK,
    appIconColor = 0x705040,
    targets = listOf(
        AppTarget(version = "16.2.3", versionCode = 160203),
    ),
)
