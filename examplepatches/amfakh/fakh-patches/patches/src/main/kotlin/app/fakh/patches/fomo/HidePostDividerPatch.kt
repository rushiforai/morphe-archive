/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.fomo

import app.fakh.patches.fomo.shared.Constants.COMPATIBILITY_FOMO
import app.fakh.patches.fomo.shared.Constants.HIDE_POST_DIVIDER
import app.fakh.patches.shared.register
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val fomoHidePostDividerPatch = bytecodePatch(
    name = "Hide post divider",
    description = "Removes the gray band between two posts in the feed.",
) {
    compatibleWith(COMPATIBILITY_FOMO)
    category("Theme")
    dependsOn(colorHooksPatch)

    execute {
        register(HIDE_POST_DIVIDER)
    }
}
