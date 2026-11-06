package app.xiondigital.patches.tandem.darkmode

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.xiondigital.patches.tandem.shared.Constants.COMPATIBILITY_TANDEM_APK
import app.xiondigital.patches.tandem.shared.Constants.COMPATIBILITY_TANDEM_APKM

/**
 * Asks the platform for app-level night mode, which is exactly what Tandem already keys its
 * theming off:
 *
 * - `AppTheme` derives from `Theme.Material3.DayNight.NoActionBar` and the APK ships a real
 *   `res/values-night` overlay (`styles.xml` flips `android:isLightTheme` to false, `colors.xml`
 *   remaps the design tokens such as `background` → `dark1` and `fontPrimary` → `light1`).
 * - Tandem's Compose theme wrapper builds its own `Configuration`, sets
 *   `uiMode = (uiMode & ~0x30) | 0x20` when the app decides it is dark, and applies it through a
 *   `ContextThemeWrapper`, so the Compose palette and the XML resources follow the same switch.
 *
 * The app has no in-app appearance setting and never calls `AppCompatDelegate`/
 * `setDefaultNightMode` itself, so the only thing standing between the user and the dark theme is
 * the system-wide setting. `UiModeManager.setApplicationNightMode(MODE_NIGHT_YES)` (API 31+,
 * and this build is minSdk 32) sets that switch for this app only, before any activity is created,
 * leaving the system setting and every other app untouched.
 */
private const val FORCE_APP_NIGHT_MODE = """
    const-string v0, "uimode"
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/app/UiModeManager;
    const/4 v1, 0x2
    invoke-virtual {v0, v1}, Landroid/app/UiModeManager;->setApplicationNightMode(I)V
"""

@Suppress("unused")
val forceDarkModePatch = bytecodePatch(
    name = "Force dark mode",
    description = "Turns on Tandem's own dark theme, regardless of the system dark-mode setting.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TANDEM_APK, COMPATIBILITY_TANDEM_APKM)

    execute {
        // Injected at the start of Application.onCreate(), so it runs once per process, before
        // the first activity resolves any theme or Compose palette.
        TandemAppOnCreateFingerprint.method.addInstructions(0, FORCE_APP_NIGHT_MODE)
    }
}
