/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.ling.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Ling",
        packageName = "com.simyasolutions.ling.universal",
        appIconColor = 0xF8485E,
        targets = listOf(AppTarget("8.4.4"))
    )
}
