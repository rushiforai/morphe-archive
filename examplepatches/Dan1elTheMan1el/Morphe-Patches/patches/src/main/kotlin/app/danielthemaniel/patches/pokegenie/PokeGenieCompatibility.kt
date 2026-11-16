package app.danielthemaniel.patches.pokegenie

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_POKEGENIE = Compatibility(
    name = "Poke Genie -Remote Raid IV PvP",
    packageName = "com.cjin.pokegenie.standard",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x2878B4,
    targets = listOf(
        AppTarget(version = "8.19.3", versionCode = 419),
    ),
)
