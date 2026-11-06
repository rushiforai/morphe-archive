package app.mrcool.patches.smartlauncher

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val smartLauncher = Compatibility(
    name = "Smart Launcher",
    packageName = "ginlemon.flowerfree",
    targets = listOf(AppTarget("6.6 build 024"))
)
