package lab.ltediscovery.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

val COMPATIBILITY_LTEDISCOVERY = Compatibility(
    name = "LTE Discovery",
    packageName = "net.simplyadvanced.ltediscovery",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x1A73E8,
    targets = listOf(
        AppTarget(
            version = "7.6.33",
            description = "versionCode 550",
        ),
        AppTarget(
            version = "7.6.34",
            description = "versionCode 551",
        ),
    ),
)
