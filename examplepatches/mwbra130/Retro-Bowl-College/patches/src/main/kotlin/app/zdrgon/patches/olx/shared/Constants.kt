package app.zdrgon.patches.olx.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_OLX = Compatibility(
        name = "OLX Pakistan",
        packageName = "com.olx.pk",
        appIconColor = 0x002E25,
        targets = listOf(
            AppTarget(version = "18.13.1")
        )
    )
}
