package app.cesbar.patches.citymapper

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY =
        Compatibility(
            name = "Citymapper",
            packageName = "com.citymapper.app.release",
            appIconColor = 0x37aa2f,
            targets = listOf(AppTarget("11.57.2"), AppTarget(null))
        )
}