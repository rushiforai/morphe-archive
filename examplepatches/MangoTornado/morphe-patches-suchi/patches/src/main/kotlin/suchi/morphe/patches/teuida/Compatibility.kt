package suchi.morphe.patches.teuida

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val teuidaCompatibility = Compatibility(
    name = "TEUIDA",
    packageName = "net.teuida.teuida",
    targets = listOf(
        AppTarget(
            version = "1.23.0",
            isExperimental = true,
            description = "Re-signed APKs crash during offline startup tests. Protection support is pending.",
        ),
    ),
)
