package app.danielthemaniel.patches.raidparty

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_RAIDPARTY = Compatibility(
    name = "Raid Party",
    packageName = "net.tinywhale.remote",
    apkFileType = ApkFileType.APKS,
    appIconColor = 0x234E8E,
    targets = listOf(
        AppTarget(version = "1.9.2", versionCode = 93),
    ),
)
