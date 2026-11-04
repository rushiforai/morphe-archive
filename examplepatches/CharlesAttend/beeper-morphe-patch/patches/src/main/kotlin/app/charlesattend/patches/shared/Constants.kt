package app.charlesattend.patches.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_BEEPER = Compatibility(
        name = "Beeper",
        packageName = "com.beeper.android",
        // Start color of the launcher icon gradient.
        appIconColor = 0x6953F2,
        targets = listOf(
            AppTarget(version = "4.61.1")
        )
    )
}
