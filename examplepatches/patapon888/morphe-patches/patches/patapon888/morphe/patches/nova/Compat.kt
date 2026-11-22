package patapon888.morphe.patches.nova

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val NOVA_LAUNCHER = Compatibility(
    name = "Nova Launcher",
    packageName = "com.teslacoilsw.launcher",
    targets = listOf(AppTarget("90000 (9.0.0)")),
    appIconColor = 0xDA4624
)
