package patches.rox

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_ROX = Compatibility(
    name = "ROX",
    packageName = "com.jazz.rox",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0xE4002B, // ROX red
    // emptySet() = accept any signing key, so Manager lists an installed ROX as patchable.
    signatures = emptySet(),
    targets = listOf(
        AppTarget(
            version = "3.0.13",
            minSdk = 28,
        ),
    ),
)
