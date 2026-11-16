package app.lmrcopyleftmusic.patches.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_LMR = Compatibility(
        name = "LMR - Copyleft Music",
        packageName = "com.lmr.lfm",
        appIconColor = 0x1DB954,
        targets = listOf(
            AppTarget(version = "6.8.4")
        )
    )
}
