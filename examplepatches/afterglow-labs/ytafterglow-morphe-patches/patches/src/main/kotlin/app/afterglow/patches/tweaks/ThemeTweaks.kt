package app.afterglow.patches.tweaks

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.markTweakInstalled
import app.afterglow.patches.theme.nativeThemePatch
import app.afterglow.patches.theme.nativeViewsPatch
import app.afterglow.patches.theme.semanticForegroundPatch
import app.afterglow.patches.theme.typographyHooksPatch
import app.afterglow.patches.theme.seekBarThemePatch
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val themeStudioTweakPatch = bytecodePatch(
    name = "Theme Studio",
    description = "Adds Afterglow's 30 presets, custom theme editor and library, portable theme files, and native YouTube colors and gradients on Android 14+. Restart to apply.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(nativeThemePatch, nativeViewsPatch, semanticForegroundPatch)
    execute { markTweakInstalled("theme-studio") }
}

@Suppress("unused")
val typographyTweakPatch = bytecodePatch(
    name = "Typography",
    description = "Customizes app and tab text size, weight and style, with Afterglow's bundled fonts and Android system families.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(typographyHooksPatch)
    execute { markTweakInstalled("typography") }
}

@Suppress("unused")
val glowTweakPatch = bytecodePatch(
    name = "Glow",
    description = "Adds Glow Lab and theme-colored light around tab icons, player controls, and the scrubber.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(nativeViewsPatch, seekBarThemePatch)
    execute { markTweakInstalled("glow") }
}

@Suppress("unused")
val seekBarTweakPatch = bytecodePatch(
    name = "Seek bar",
    description = "Customizes native player tracks and scrubbers, and controls persistent progress and the most-replayed graph.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(seekBarThemePatch, app.afterglow.patches.playback.heatwavesHookPatch,
        app.afterglow.patches.playback.persistentProgressHookPatch)
    execute { markTweakInstalled("seek-bar") }
}
