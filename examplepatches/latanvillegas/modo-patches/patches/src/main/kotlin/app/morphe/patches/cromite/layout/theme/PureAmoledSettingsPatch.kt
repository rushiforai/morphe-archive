package app.morphe.patches.cromite.layout.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.util.findInstructionIndicesReversedOrThrow
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.Opcode

/**
 * Bytecode recovery from the original PureAmoledSettingsPatchKt.class
 * in patches-1.50.0.mpp. The original contains four distinct mutation groups;
 * restores SettingsActivity, preference background setters, and the Lxx2 containment-card mutation.
 */
private val settingsActivityBackgroundFingerprint = Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/settings/SettingsActivity;",
    filters = listOf(
        methodCall("Ldr7;->e(Landroid/content/Context;ILjava/lang/String;)Landroid/util/TypedValue;"),
        methodCall("Lis7;->f(Landroid/content/Context;Landroid/util/TypedValue;)I"),
    ),
)

// Original Cromite SettingsActivity.onResume() is verified in the supplied Smali.
private val settingsActivityResumeFingerprint = Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/settings/SettingsActivity;",
    name = "onResume",
    returnType = "V",
    parameters = listOf(),
)

private val chromeImageViewPreferenceBindFingerprint = Fingerprint(
    definingClass = "Lorg/chromium/components/browser_ui/settings/ChromeImageViewPreference;",
    name = "y",
    returnType = "V",
    parameters = listOf("Lepa;"),
)

private val chromeSwitchPreferenceBindFingerprint = Fingerprint(
    definingClass = "Lorg/chromium/components/browser_ui/settings/ChromeSwitchPreference;",
    name = "y",
    returnType = "V",
    parameters = listOf("Lepa;"),
)

private val settingsContainmentDrawableFingerprint = Fingerprint(
    definingClass = "Lxx2;",
    name = "d",
    returnType = "Landroid/graphics/drawable/RippleDrawable;",
    parameters = listOf("Landroid/content/Context;", "F", "F", "I"),
)

// Cromite 153.0.8010.37: Ldic;.q(Bundle) inflates the two Settings
// search layouts and assigns the same tinted drawable to both containers.
private val settingsSearchLayoutFingerprint = Fingerprint(
    definingClass = "Ldic;",
    name = "q",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

private val settingsSetBackgroundDrawableCall =
    methodCall("Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V")

private val settingsContextColorCall =
    methodCall("Lis7;->f(Landroid/content/Context;Landroid/util/TypedValue;)I")

private val settingsSetBackgroundColorCall =
    methodCall("Landroid/view/View;->setBackgroundColor(I)V")

private fun settingsBackgroundSmali(viewRegister: Int): String =
    "invoke-static {v$viewRegister}, " +
        "Lapp/morphe/extension/cromite/amoled/AmoledBrightnessController;->applyNativeSurfaceBackground(Landroid/view/View;)V"

private const val SETTINGS_CONTAINMENT_RUNTIME_COLOR = """
    invoke-static {v11}, Lapp/morphe/extension/cromite/amoled/AmoledBrightnessController;->resolvedPureThemeColor(Landroid/content/Context;)I
    move-result v14
"""

@Suppress("unused")
val pureAmoledSettingsPatch = bytecodePatch(
    name = "AMOLED - Settings",
    description = "Uses the saved runtime theme for SettingsActivity, preference backgrounds and containment-card colors.",
) {
    compatibleWith("org.cromite.cromite"("153.0.8010.37"))
    dependsOn(cromiteAmoledBrightnessPatch)

    execute {

        // Settings owns the status-bar appearance; apply after its native
        // onResume logic, before returning, without changing the theme selector.
        val resume = settingsActivityResumeFingerprint.method
        val returns = resume.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }
        check(returns.size == 1) {
            "AMOLED Settings: expected one onResume return; found ${returns.size}"
        }
        resume.addInstructions(
            returns.single(),
            "invoke-static {p0}, " +
                "Lapp/morphe/extension/cromite/amoled/AmoledBrightnessController;->applySettingsStatusBar(Landroid/app/Activity;)V",
        )

        val activity = settingsActivityBackgroundFingerprint.method
        val activityIndices = activity.findInstructionIndicesReversedOrThrow(settingsSetBackgroundColorCall)
        check(activityIndices.size == 2) {
            "AMOLED Settings: SettingsActivity must contain exactly two background setters; found ${activityIndices.size}"
        }
        activityIndices.forEach { index ->
            val instruction = activity.getInstruction(index) as FiveRegisterInstruction
            activity.addInstructions(
                index + 1,
                settingsBackgroundSmali(instruction.registerC),
            )
        }

        fun recoverPreferenceBackground(
            method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod,
            preference: String,
        ) {
            val indices = method.findInstructionIndicesReversedOrThrow(settingsSetBackgroundColorCall)
            check(indices.size in 1..2) {
                "AMOLED Settings: $preference must contain one or two background setters; found ${indices.size}"
            }
            val index = indices.first()
            val instruction = method.getInstruction(index) as FiveRegisterInstruction
            method.addInstructions(
                index + 1,
                settingsBackgroundSmali(instruction.registerC),
            )
        }

        recoverPreferenceBackground(
            chromeImageViewPreferenceBindFingerprint.method,
            "ChromeImageViewPreference",
        )
        recoverPreferenceBackground(
            chromeSwitchPreferenceBindFingerprint.method,
            "ChromeSwitchPreference",
        )

        // Only the two drawable setters in Ldic.q(Bundle) are the Settings
        // search_box and search_query_container (verified from original Smali).
        val search = settingsSearchLayoutFingerprint.method
        val searchSetters = search.findInstructionIndicesReversedOrThrow(settingsSetBackgroundDrawableCall)
        check(searchSetters.size == 2) {
            "AMOLED Settings search: expected two verified drawable setters, found ${searchSetters.size}"
        }
        searchSetters.forEach { index ->
            val instruction = search.getInstruction(index) as? FiveRegisterInstruction
                ?: error("AMOLED Settings search: unexpected invoke encoding")
            check(instruction.opcode == Opcode.INVOKE_VIRTUAL && instruction.registerCount == 2) {
                "AMOLED Settings search: unexpected View.setBackground invocation"
            }
            search.addInstructions(
                index + 1,
                "invoke-static {v${instruction.registerC}}, " +
                    "Lapp/morphe/extension/cromite/amoled/AmoledBrightnessController;->applySettingsSearchSurface(Landroid/view/View;)V",
            )
        }

        // Restore the original containment-card override at the verified call site.
        val containment = settingsContainmentDrawableFingerprint.method
        val colorCalls = containment.findInstructionIndicesReversedOrThrow(settingsContextColorCall)
        check(colorCalls.size == 1) {
            "AMOLED Settings: expected one containment-card color lookup; found ${colorCalls.size}"
        }
        val resultIndex = colorCalls.single() + 1
        check(containment.getInstruction(resultIndex).opcode ==
            com.android.tools.smali.dexlib2.Opcode.MOVE_RESULT) {
            "AMOLED Settings: expected move-result after containment color lookup"
        }
        // Verified in the original patches-1.50.0.mpp bytecode:
        // SETTINGS_CONTAINMENT_RUNTIME_COLOR, not registers inferred
        // from the Lis7.f call. Preserve the original method's register mapping.
        check(containment.implementation!!.registerCount > 14) {
            "AMOLED Settings: containment method lacks original v14 register"
        }
        containment.addInstructions(resultIndex + 1, SETTINGS_CONTAINMENT_RUNTIME_COLOR)
    }
}
