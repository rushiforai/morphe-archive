package app.zdrgon.patches.rainviewer.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY = Compatibility(
        name = "RainViewer",
        packageName = "com.lucky_apps.RainViewer",
        appIconColor = 0x1E88E5,
        targets = listOf(
            AppTarget("8.4.1", isExperimental = true),
        ),
    )
}
