package app.nullwaypoint.patches.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CRUNCHYROLL = Compatibility(
        name = "Crunchyroll",
        packageName = "com.crunchyroll.crunchyroid",
        appIconColor = 0xff5c00,
        targets = listOf(
            AppTarget(
                version = "3.117.0",
            ),
            AppTarget(
                version = null,
                isExperimental = true,
            ),
        ),
    )
}