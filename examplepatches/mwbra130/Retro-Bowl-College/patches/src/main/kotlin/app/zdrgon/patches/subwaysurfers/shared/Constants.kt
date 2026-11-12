package app.zdrgon.patches.subwaysurfers.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SUBWAY_SURFERS = Compatibility(
        name = "Subway Surfers",
        packageName = "com.kiloo.subwaysurf",
        appIconColor = 0xF9A825,
        targets = listOf(
            AppTarget(version = "3.70.0"),
            AppTarget(version = "3.71.0"),
        ),
    )
}
