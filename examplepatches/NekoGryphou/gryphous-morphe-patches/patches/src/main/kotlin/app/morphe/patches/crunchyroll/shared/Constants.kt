package app.morphe.patches.crunchyroll.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_CRUNCHYROLL = Compatibility(
    name = "Crunchyroll",
    packageName = "com.crunchyroll.crunchyroid",
    appIconColor = 0xff5c00,
    targets = listOf(
        AppTarget(
            version = "3.112.2",
        ),
    ),
)
