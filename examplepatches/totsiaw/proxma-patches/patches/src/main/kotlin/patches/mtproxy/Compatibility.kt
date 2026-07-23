package patches.mtproxy

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_MTPROXY = Compatibility(
    name = "MTProxy",
    packageName = "com.sdev.mtproxy",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0x0088CC, // Telegram blue
    // emptySet() = accept any signing key, so Manager lists an installed MTProxy as patchable.
    signatures = emptySet(),
    targets = listOf(
        AppTarget(
            version = "2.1.4",
            minSdk = 32,
        ),
    ),
)
