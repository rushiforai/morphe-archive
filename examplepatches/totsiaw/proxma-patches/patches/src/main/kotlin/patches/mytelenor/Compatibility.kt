package patches.mytelenor

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_MYTELENOR = Compatibility(
    name = "My Telenor",
    packageName = "com.telenor.pakistan.mytelenor",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0x00A8E0, // Telenor blue
    // emptySet() = accept any signing key, so Manager lists an installed My Telenor as patchable.
    signatures = emptySet(),
    targets = listOf(
        AppTarget(
            version = "4.2.62",
            minSdk = 24,
        ),
    ),
)
