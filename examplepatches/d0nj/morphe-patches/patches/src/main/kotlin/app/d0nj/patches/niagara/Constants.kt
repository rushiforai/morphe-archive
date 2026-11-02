package app.d0nj.patches.niagara

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_NIAGARA = Compatibility(
        packageName = "bitpit.launcher",
        name = "Niagara Launcher",
        appIconColor = 0x1E88E5,
        targets = listOf(AppTarget(version = null)),
    )
}
