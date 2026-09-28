package app.subwaysurf.patches.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val COMPATIBILITY_SUBWAYSURF = Compatibility(
        name = "Subway Surfers",
        packageName = "com.kiloo.subwaysurf",
        appIconColor = 0xF9A825,
        targets = listOf(
            AppTarget(
                version = "3.69.2",
                versionCodes = SupportedAbi.entries.associateWith { 96070 }
            ),
        )
    )
}
