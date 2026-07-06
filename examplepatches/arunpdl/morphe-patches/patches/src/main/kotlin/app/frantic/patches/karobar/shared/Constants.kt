package app.frantic.patches.karobar.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_KAROBAR = Compatibility(
        name = "Mero Karobar",
        packageName = "com.bytecaretech.merokarobar",
        appIconColor = 0x1565C0,
        targets = listOf(
            AppTarget(version = "7.8.0"),
        )
    )
}
