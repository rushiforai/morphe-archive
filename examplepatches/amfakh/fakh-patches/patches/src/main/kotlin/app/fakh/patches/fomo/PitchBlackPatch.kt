/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.fomo

import app.fakh.patches.fomo.shared.Constants.COMPATIBILITY_FOMO
import app.fakh.patches.fomo.shared.Constants.PITCH_BLACK
import app.fakh.patches.shared.register
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val fomoPitchBlackPatch = bytecodePatch(
    name = "Pitch black",
    description = "Keeps the dark mode background black, with slightly lighter black cards, instead of tinting it with the wallpaper. Includes Material You.",
) {
    compatibleWith(COMPATIBILITY_FOMO)
    category("Theme")
    dependsOn(colorHooksPatch, fomoMaterialYouPatch)

    execute {
        register(PITCH_BLACK)
    }
}
