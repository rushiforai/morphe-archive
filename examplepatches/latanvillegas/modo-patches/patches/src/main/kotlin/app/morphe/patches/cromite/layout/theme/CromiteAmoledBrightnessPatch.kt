package app.morphe.patches.cromite.layout.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.patcher.patch.bytecodePatch

private const val CROMITE_PATCH14_VERSION = "153.0.8010.37"
private const val BRIGHTNESS_CONTROLLER =
    "Lapp/morphe/extension/cromite/amoled/AmoledBrightnessController;"

/**
 * First executable slice of patch 14: bundles the Cromite Android extension
 * and applies persisted per-window brightness whenever the tabbed activity
 * resumes. The controller defaults to -1f (system brightness).
 *
 * Do not insert a ThemeSettingsFragment hook here until the click listener
 * and target obfuscated Preference API are validated end-to-end.
 */
private val cromiteTabbedActivityResumeFingerprint = Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/ChromeTabbedActivity;",
    name = "onResume",
    returnType = "V",
    parameters = listOf(),
)

// Verified in uploaded d52.smali: ChromeTabbedActivity extends Ld52;,
// whose onWindowFocusChanged(Z)V is final. Patch that existing method instead.
private val browserFocusFingerprint = Fingerprint(
    definingClass = "Ld52;",
    name = "onWindowFocusChanged",
    returnType = "V",
    parameters = listOf("Z"),
)

private val themeFingerprint = Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/night_mode/settings/ThemeSettingsFragment;",
    name = "a2",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/os/Bundle;"),
)

@Suppress("unused")
val cromiteAmoledBrightnessPatch = bytecodePatch(
    name = "Cromite AMOLED native theme runtime",
    description = "Bundles the native pure-color runtime without installing a duplicate theme or brightness dialog.",
    default = false,
) {
    compatibleWith("org.cromite.cromite"(CROMITE_PATCH14_VERSION))

    // Morphe packages the Android extension as extensions/cromite.mpe.
    // The extension is NOT supplied by the patcher Kotlin classpath.
    extendWith("extensions/cromite.mpe")

    execute {
        // Fail closed if the extension wasn't bundled into the target DEX.
        classDefBy(BRIGHTNESS_CONTROLLER)

        // Apply after Chromium's existing focus handler, without overriding
        // its final method or changing its clipboard/session logic.
        val focus = browserFocusFingerprint.method
        val focusReturns = focus.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }
        check(focusReturns.size == 1) {
            "Expected one return in verified d52.onWindowFocusChanged"
        }
        focus.addInstructions(
            focusReturns.single(),
            "invoke-static {p0}, " +
                "Lapp/morphe/extension/cromite/amoled/AmoledBrightnessController;->applyBrowserTabletStatusBar(Landroid/app/Activity;)V",
        )

        // Inject at the first instruction so conditional early returns cannot skip
        // the status-bar hook. The helper guards unavailable windows itself.
        val resume = cromiteTabbedActivityResumeFingerprint.method
        resume.addInstructions(
            0,
            "invoke-static {p0}, " +
                "Lapp/morphe/extension/cromite/amoled/AmoledBrightnessController;->applyBrowserTabletStatusBar(Landroid/app/Activity;)V",
        )

    }
}
