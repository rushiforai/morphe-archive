package app.mrcool.patches.iconpackstudio

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val iconPackStudio = Compatibility(
    name = "Icon Pack Studio",
    packageName = "ginlemon.iconpackstudio",
    appIconColor = 0xF4287D,
    targets = listOf(AppTarget("2.5 build 003"))
)
