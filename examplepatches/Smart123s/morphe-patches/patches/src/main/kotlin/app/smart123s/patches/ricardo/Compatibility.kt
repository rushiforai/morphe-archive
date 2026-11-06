package app.smart123s.patches.ricardo

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val ricardoCompatibility = Compatibility(
    name = "Ricardo nem lopot",
    packageName = "ricardonemlopot.nemlopot",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xD2B48C,
    signatures = setOf("d188ce7084ac43c98f94cec273917c2c32fba8f772a73cbd9d69003f3d305226"),
    targets = listOf(AppTarget(version = "2.077", versionCode = 16, minSdk = 15)),
)
