package patches.safar

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_SAFAR = Compatibility(
    name = "Safar",
    packageName = "com.safar.fyi",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0x00897B, // Safar teal
    // emptySet() = accept any signing key, so Manager lists an installed Safar as patchable.
    signatures = emptySet(),
    targets = listOf(
        AppTarget(
            version = "3.0.1",
            minSdk = 25,
        ),
    ),
)
