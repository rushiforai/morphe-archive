package app.zdrgon.patches.echo.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Echo",
        packageName = "com.hapibits.soundlift",
        appIconColor = 0xFFB300,
        targets = listOf(
            AppTarget("9.7"),
        ),
    )
}
