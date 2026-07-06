package app.paresh.patches.plusmessenger.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_PLUS_MESSENGER = Compatibility(
        name = "Plus Messenger",
        packageName = "org.telegram.plus",
        appIconColor = 0x2AABEE,
        targets = listOf(
            AppTarget(version = "12.7.3.0")
        )
    )
}
