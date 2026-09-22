package patches.olx

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * OLX's Application (`com.olx.pk.OlxApplication`). Anchored on the real, un-obfuscated class name
 * (the app shell keeps its manifest-declared name) and the `onCreate` entry point.
 */
internal val olxApplicationOnCreateFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(),
    custom = { m, c -> c.type == "Lcom/olx/pk/OlxApplication;" && m.name == "onCreate" },
)

/**
 * Forces OLX into dark (night) mode regardless of the system setting.
 *
 * OLX ships full `-night` resources (drawable-night, Material3 dark colors) but has no in-app
 * dark-mode toggle — it just follows the system. minSdk is 32, so we call the platform
 * `UiModeManager.setApplicationNightMode(MODE_NIGHT_YES)` at startup (no AppCompat dependency,
 * which R8 has stripped down in this build). This flips the app's resource night qualifier on,
 * so every screen renders with the app's own dark resources.
 *
 * Injected at the top of OlxApplication.onCreate() (a large method, so v0/v1 are free locals):
 *   move-object/from16 v0, p0
 *   invoke-virtual {v0}, Landroid/app/Application;->getApplicationContext()Landroid/content/Context;
 *   move-result-object v0
 *   const-string v1, "uimode"
 *   invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
 *   move-result-object v0
 *   check-cast v0, Landroid/app/UiModeManager;
 *   const/4 v1, 0x2                       # UiModeManager.MODE_NIGHT_YES
 *   invoke-virtual {v0, v1}, Landroid/app/UiModeManager;->setApplicationNightMode(I)V
 */
@Suppress("unused")
val forceDarkModePatch = bytecodePatch(
    name = "Force dark mode",
    description = "Forces OLX into dark (night) mode regardless of the system theme, using the " +
        "app's built-in -night resources via UiModeManager.setApplicationNightMode at startup.",
) {
    compatibleWith(COMPATIBILITY_OLX)

    execute {
        olxApplicationOnCreateFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                invoke-virtual {v0}, Landroid/app/Application;->getApplicationContext()Landroid/content/Context;
                move-result-object v0
                const-string v1, "uimode"
                invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
                move-result-object v0
                check-cast v0, Landroid/app/UiModeManager;
                const/4 v1, 0x2
                invoke-virtual {v0, v1}, Landroid/app/UiModeManager;->setApplicationNightMode(I)V
            """.trimIndent(),
        )
    }
}
