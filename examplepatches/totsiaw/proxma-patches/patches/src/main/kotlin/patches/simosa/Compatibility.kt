package patches.simosa

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_SIMOSA = Compatibility(
    name = "Simosa",
    packageName = "com.jazz.jazzworld",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0xFF6B35,
    // emptySet() = accept any signing key, so Manager lists installed Simosa as patchable.
    signatures = emptySet(),
    targets = listOf(
        AppTarget(
            version = "3.3.2",
            minSdk = 23,
        ),
    ),
)
