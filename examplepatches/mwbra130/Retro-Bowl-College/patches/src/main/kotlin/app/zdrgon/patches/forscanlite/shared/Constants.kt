package app.zdrgon.patches.forscanlite.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_FORSCAN_LITE = Compatibility(
        name = "FORScan Lite",
        packageName = "com.astech.forscanlite",
        appIconColor = 0x33B5E5,
        targets = listOf(
            AppTarget(version = "1.5.31")
        )
    )
}
