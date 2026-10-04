package app.solarsmash.patches.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SOLARSMASH = Compatibility(
        name = "Solar Smash",
        packageName = "com.paradyme.solarsmash",
        appIconColor = 0x444C84,
        targets = listOf(
            AppTarget(version = "2.7.5")
        )
    )
}
