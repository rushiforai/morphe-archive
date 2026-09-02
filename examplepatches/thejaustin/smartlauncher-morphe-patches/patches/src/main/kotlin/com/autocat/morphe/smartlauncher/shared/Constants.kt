package com.autocat.morphe.smartlauncher.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Target compatibility configuration for Smart Launcher 6 (ginlemon.flowerfree).
 * Strictly pinned to build 017 as the primary target.
 */
internal object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Smart Launcher 6",
        packageName = "ginlemon.flowerfree",
        targets = listOf(
            AppTarget("6.6 build 017"),
        )
    )
}
