package app.morphe.patches.delonghi.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_DELONGHI_COMFORT = Compatibility(
    name = "De'Longhi Comfort",
    packageName = "com.ddsx_ayla_android",
    appIconColor = 0x006b52,
    targets = listOf(
        AppTarget(
            version = "5.1.5",
        ),
    ),
)
