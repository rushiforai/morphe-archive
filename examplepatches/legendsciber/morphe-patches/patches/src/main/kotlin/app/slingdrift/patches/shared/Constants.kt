package app.slingdrift.patches.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SLINGDRIFT = Compatibility(
        name = "Sling Drift",
        packageName = "com.rubygames.slingdrift",
        appIconColor = 0x00BCD4,
        targets = listOf(
            AppTarget(version = "5.13.2")
        )
    )
}