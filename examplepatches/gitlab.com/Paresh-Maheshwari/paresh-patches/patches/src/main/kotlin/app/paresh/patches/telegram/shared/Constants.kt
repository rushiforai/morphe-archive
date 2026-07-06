package app.paresh.patches.telegram.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_TELEGRAM = Compatibility(
        name = "Telegram",
        packageName = "org.telegram.messenger.web",
        appIconColor = 0x2AABEE,
        targets = listOf(
            AppTarget(version = "12.6.4")
        )
    )
}
