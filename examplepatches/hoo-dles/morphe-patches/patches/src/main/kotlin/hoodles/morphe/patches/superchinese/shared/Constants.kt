/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.superchinese.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val PACKAGE_NAME = "com.superchinese"

    val Compatibility = Compatibility(
        name = "SuperChinese",
        packageName = PACKAGE_NAME,
        appIconColor = 0xf79729,
        targets = listOf(AppTarget("6.6.3"))
    )
}