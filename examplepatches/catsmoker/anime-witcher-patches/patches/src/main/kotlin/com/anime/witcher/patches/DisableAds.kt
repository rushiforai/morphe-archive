package com.anime.witcher.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Disables ads in the app by:
 * - Making AdsManager.shouldShowAd() always return false
 * - Making AdsConfig.getFrequency() return Integer.MAX_VALUE (so ads never trigger)
 *
 * Both methods are short enough that adding a return at index 0 makes
 * the original code unreachable (dead code), which is safe in DEX bytecode.
 */
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables all ad display logic in the app.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ANIME_WITCHER)

    execute {
        // Patch AdsManager.shouldShowAd() to always return false
        // Original method: checks SharedPreferences, increments counter, compares frequency
        // New method: just return false immediately
        ShouldShowAdFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        // Patch AdsConfig.getFrequency() to return Integer.MAX_VALUE
        // Original method: reads "ad_frequency" from SharedPreferences (default 1)
        // New method: just return 0x7fffffff immediately
        GetFrequencyFingerprint.method.addInstructions(
            0,
            """
                const v0, 0x7fffffff
                return v0
            """
        )
    }
}
