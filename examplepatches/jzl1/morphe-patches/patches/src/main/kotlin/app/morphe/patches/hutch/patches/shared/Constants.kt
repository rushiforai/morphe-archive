package lab.hutch.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

val COMPATIBILITY_HUTCH = Compatibility(
    name = "Hutch App",
    packageName = "com.omobio.etisalatone",
    apkFileType = ApkFileType.XAPK,
    appIconColor = 0xFF6600,
    targets = listOf(
        AppTarget(
            version = "4.4.1",
            description = "versionCode 400426001",
        ),
    ),
)
