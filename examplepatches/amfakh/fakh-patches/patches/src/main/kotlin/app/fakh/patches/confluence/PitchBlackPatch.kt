/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.confluence

import app.fakh.patches.confluence.shared.Constants.COMPATIBILITY_CONFLUENCE
import app.fakh.patches.confluence.shared.Constants.PITCH_BLACK
import app.fakh.patches.shared.register
import app.morphe.patcher.patch.patch

@Suppress("unused")
val pitchBlackPatch = patch(
    name = "Pitch black",
    description = "Turns the dark mode backgrounds black.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CONFLUENCE)
    category("Theme")
    dependsOn(colorsPatch, settingsPatch)

    execute {
        register(PITCH_BLACK)
    }
}
