package ee.morphe.patches.hypnobox.pro

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY = Compatibility(
        name = "HypnoBox",
        packageName = "epixler.de.hypnobox_android",
        appIconColor = 0x5EA15A,
        targets = listOf(
            AppTarget("4.2.81"),
            AppTarget(">=4.2.81")
        )
    )
}
