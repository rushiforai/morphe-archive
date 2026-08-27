package morningentree.morphe.patches.aiolauncher.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY = Compatibility(
        name = "AIO Launcher",
        packageName = "ru.execbit.aiolauncher",
        appIconColor = 0x263238,
        targets = listOf(AppTarget("7.4.2")),
    )
}
