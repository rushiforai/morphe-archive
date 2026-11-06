package app.zdrgon.patches.hermit.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Hermit",
        packageName = "com.chimbori.hermitcrab",
        appIconColor = 0x2E7D32,
        targets = listOf(
            AppTarget("31.8.0"),
        ),
    )
}
