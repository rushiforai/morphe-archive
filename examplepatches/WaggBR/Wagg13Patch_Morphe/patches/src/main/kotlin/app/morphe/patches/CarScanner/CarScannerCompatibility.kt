package app.template.patches.carscanner

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val CAR_SCANNER_COMPATIBILITY = Compatibility(
    name = "Car Scanner",
    packageName = "com.ovz.carscanner",
    targets = listOf(AppTarget(version = "2.1.50")),
)
