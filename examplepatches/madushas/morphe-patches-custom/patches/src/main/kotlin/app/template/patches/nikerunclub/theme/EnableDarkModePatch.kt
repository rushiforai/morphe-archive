package app.template.patches.nikerunclub.theme

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.nikerunclub.NrcUseDarkModeFingerprint
import app.template.patches.shared.Constants.NIKE_RUN_CLUB_COMPATIBILITY
import app.template.patches.shared.returnEarly

/**
 * Enables Nike Run Club's built-in **dark mode**.
 *
 * NRC already ships a full dark theme (`OneNikeDarkTheme` plus a dark Compose colour
 * mode) but gates it behind `DefaultDesignManager.useDarkMode()`, which is
 * `allowDarkMode && (forceDarkMode || systemDarkMode)`. `allowDarkMode` is a remote
 * configuration flag and is off in the shipping build, so the app is always light.
 *
 * Forcing `useDarkMode()` to `true` makes `getColorMode()` return `ColorMode.Dark`,
 * which every Compose design provider consumes — the whole Compose surface renders
 * dark, independent of the system setting. (Older View-based screens keep the light
 * app theme; the modern UI is Compose.)
 */
@Suppress("unused")
val nikeEnableDarkModePatch = bytecodePatch(
    name = "Enable dark mode",
    description = "Turns on Nike Run Club's built-in dark theme by forcing the " +
        "DefaultDesignManager colour-mode gate, so the Compose UI renders dark.",
    default = true,
) {
    category("Theme")
    compatibleWith(NIKE_RUN_CLUB_COMPATIBILITY)

    execute {
        NrcUseDarkModeFingerprint.method.returnEarly(true)
    }
}
