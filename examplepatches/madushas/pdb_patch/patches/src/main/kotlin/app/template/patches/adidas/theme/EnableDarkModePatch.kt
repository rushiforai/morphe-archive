package app.template.patches.adidas.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.adidas.AdidasApplicationOnCreateFingerprint
import app.template.patches.shared.Constants.ADIDAS_RUNNING_COMPATIBILITY

/**
 * Turns on **dark mode** for adidas Running.
 *
 * The app already ships a complete dark theme — `values-night/RtBaseTheme` inherits
 * `RtBaseTheme.Dark` while the day variant inherits `RtBaseTheme.Light` — but it does
 * not force a night mode, so it renders light unless the whole device is in dark mode.
 *
 * This patch calls `AppCompatDelegate.setDefaultNightMode(MODE_NIGHT_YES)` at the very
 * start of `RuntasticApplication.onCreate()`. That switches the app's `Configuration`
 * `uiMode` to night for the process, so both the resource-qualified themes
 * (`values-night`) and any Compose `isSystemInDarkTheme()` reads resolve to dark.
 */
@Suppress("unused")
val adidasEnableDarkModePatch = bytecodePatch(
    name = "Enable dark mode",
    description = "Forces adidas Running into its built-in night theme " +
        "(RtBaseTheme.Dark) by setting AppCompatDelegate night mode at app startup.",
    default = true,
) {
    compatibleWith(ADIDAS_RUNNING_COMPATIBILITY)

    execute {
        AdidasApplicationOnCreateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x2
                invoke-static {v0}, Landroidx/appcompat/app/AppCompatDelegate;->setDefaultNightMode(I)V
            """.trimIndent(),
        )
    }
}
