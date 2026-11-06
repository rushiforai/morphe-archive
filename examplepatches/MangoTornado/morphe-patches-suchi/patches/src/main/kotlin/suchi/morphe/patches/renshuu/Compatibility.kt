package suchi.morphe.patches.renshuu

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val renshuuCompatibility = Compatibility(
    name = "renshuu",
    packageName = "com.renshuu.renshuu_org",
    targets = listOf(AppTarget(version = "1.2.20260311", isExperimental = true)),
)
