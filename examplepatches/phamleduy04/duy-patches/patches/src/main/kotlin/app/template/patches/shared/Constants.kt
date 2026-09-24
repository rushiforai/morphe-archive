package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_FLIGHTCONNECTIONS = Compatibility(
        name = "FlightConnections",
        packageName = "com.flightconnections",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xE53935,
        targets = listOf(
            AppTarget(
                version = "1.5"
            )
        )
    )
}
