package patches.dynamicspot

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val dynamicspot = Compatibility(
    name = "dynamicSpot",
    packageName = "com.jamworks.dynamicspot",
    apkFileType = ApkFileType.APKM,
    signatures = setOf("f19ee6778545938e45118c89385a7a5cc8617576f1fb0733842fc5ed8b6fd153"),
    targets = listOf(AppTarget(version = "3.02", versionCode = 200155, minSdk = 32)),
)
