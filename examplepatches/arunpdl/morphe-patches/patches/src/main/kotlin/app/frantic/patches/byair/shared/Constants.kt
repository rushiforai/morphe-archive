package app.frantic.patches.byair.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_BYAIR = Compatibility(
        name = "byAir",
        packageName = "com.byairapp.android",
        appIconColor = 0x1F6FEB,
        targets = listOf(
            AppTarget(version = "2.37.0"),
        )
    )
}
