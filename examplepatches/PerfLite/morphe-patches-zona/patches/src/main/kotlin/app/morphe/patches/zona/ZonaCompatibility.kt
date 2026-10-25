package app.morphe.patches.zona

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

val ZONA_COMPATIBILITY = Compatibility(
    name = "FreeZona World",
    packageName = "free.zona",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0x202124,
    signatures = setOf("a40da80a59d170caa950cf15c18c454d47a39b26989d8b640ecd745ba71bf5dc"),
    targets = listOf(
        AppTarget(
            version = "3.0.75",
            versionCode = 1075,
            minSdk = 21,
            description = "APK: https://github.com/julay123/mobi.zona/releases",
        ),
        AppTarget(
            version = "3.0.76",
            versionCode = 1076,
            minSdk = 21,
            description = "APK: https://github.com/julay123/mobi.zona/releases",
        ),
    ),
)
