package app.d0nj.patches.firefox

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_FIREFOX = Compatibility(
        packageName = "org.mozilla.firefox",
        name = "Firefox",
        appIconColor = 0x00DDFF,
        targets = listOf(AppTarget(version = null)),
    )
}
