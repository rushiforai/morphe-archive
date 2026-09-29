package app.stickwar.patches.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_STICKWAR = Compatibility(
        name = "Stick War Legacy",
        packageName = "com.maxgames.stickwarlegacy",
        appIconColor = 0x6D4C41,
        targets = listOf(
            AppTarget(version = "2026.1.983"),
        )
    )
}
