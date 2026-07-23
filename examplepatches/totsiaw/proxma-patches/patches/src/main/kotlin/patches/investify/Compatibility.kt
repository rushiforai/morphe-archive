package patches.investify

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_INVESTIFY = Compatibility(
    name = "Investify",
    packageName = "com.blueinklabs.investifystocks.free",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0x1E88E5, // Investify blue
    // emptySet() = accept any signing key, so Manager lists an installed Investify as patchable.
    signatures = emptySet(),
    targets = listOf(
        AppTarget(
            version = "5.6.0",
            minSdk = 24,
        ),
    ),
)
