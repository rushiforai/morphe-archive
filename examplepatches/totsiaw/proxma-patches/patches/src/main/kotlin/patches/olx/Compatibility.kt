package patches.olx

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_OLX = Compatibility(
    name = "OLX",
    packageName = "com.olx.pk",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0x002F34,
    // emptySet() = accept any signing key, so Manager lists installed OLX as patchable.
    signatures = emptySet(),
    targets = listOf(
        AppTarget(
            version = "18.8.0",
            minSdk = 32,
        ),
    ),
)
