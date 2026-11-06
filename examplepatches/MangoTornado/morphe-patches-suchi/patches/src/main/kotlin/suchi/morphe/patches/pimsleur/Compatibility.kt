package suchi.morphe.patches.pimsleur

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val pimsleurCompatibility = Compatibility(
    name = "Pimsleur",
    packageName = "com.simonandschuster.pimsleur.unified.android",
    targets = listOf(
        AppTarget(
            version = "8.1",
            isExperimental = true,
            description = "Re-signed APKs crash during offline startup tests. Protection support is pending.",
        ),
    ),
)
