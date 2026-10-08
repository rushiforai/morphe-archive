package patches.netmonster

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_NETMONSTER = Compatibility(
    name = "NetMonster",
    packageName = "cz.mroczis.netmonster",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0x00BCD4, // NetMonster cyan
    // emptySet() = accept any signing key, so Manager lists an installed NetMonster as patchable.
    signatures = emptySet(),
    targets = listOf(
        AppTarget(
            version = "4.0.4",
            minSdk = 27,
        ),
    ),
)
