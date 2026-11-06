package suchi.morphe.patches.duchinese

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val duChineseCompatibility = Compatibility(
    name = "Du Chinese",
    packageName = "org.sinamon.duchinese",
    targets = listOf(AppTarget(version = "3.6.1", isExperimental = true)),
)
