package ee.morphe.patches.byair

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY = Compatibility(
        name = "byAir",
        packageName = "com.byairapp.android",
        appIconColor = 0x1F6FEB,
        targets = listOf(
            AppTarget("2.36.0")
        )
    )
}
