package patches.myzong

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_MYZONG = Compatibility(
    name = "MyZong",
    packageName = "com.zong.customercare",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0x00A94F, // Zong green
    // emptySet() = accept any signing key, so Manager lists an installed MyZong as patchable.
    signatures = emptySet(),
    targets = listOf(
        AppTarget(
            version = "5.19.19.112",
            minSdk = 21,
        ),
    ),
)
