package app.morphe.patches.petkit.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_PETKIT = Compatibility(
    name = "PETKIT",
    packageName = "com.petkit.oversea",
    targets = listOf(
        AppTarget(version = "13.10.1"),
    ),
)
