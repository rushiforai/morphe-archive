package app.zdrgon.patches.tuner.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Tuner",
        packageName = "com.studiosol.afinadorlite",
        appIconColor = 0x009688,
        targets = listOf(
            AppTarget("3.7.36"),
        ),
    )
}
