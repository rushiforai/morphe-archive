package patches.indrive

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_INDRIVE = Compatibility(
    name = "inDrive",
    packageName = "sinet.startup.inDriver",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0xC1F11D,
    signatures = emptySet(),
    targets = listOf(
        AppTarget(
            version = "5.188.0",
            minSdk = 29,
        ),
        AppTarget(
            version = "5.189.0",
            minSdk = 29,
        ),
        AppTarget(
            version = "5.193.0",
            minSdk = 29,
        ),
    ),
)
