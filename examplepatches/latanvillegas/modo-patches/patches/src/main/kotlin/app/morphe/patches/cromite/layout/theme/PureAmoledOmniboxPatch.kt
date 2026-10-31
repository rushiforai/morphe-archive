package app.morphe.patches.cromite.layout.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.util.findInstructionIndicesReversedOrThrow
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

/**
 * Reconstructed directly from PureAmoledOmniboxPatchKt.class in
 * patches-1.50.0.mpp, including its StringConcatFactory smali templates.
 */
private val locationBarTabletInflateFingerprint = Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/omnibox/LocationBarTablet;",
    name = "onFinishInflate",
    returnType = "V",
)

private val locationBarTabletRefreshFingerprint = Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/omnibox/LocationBarTablet;",
    name = "Q",
    returnType = "V",
)

private val omniboxSetBackgroundCall = methodCall(
    "Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V",
)

private fun runtimeBackgroundSmali(viewRegister: Int): String =
    "invoke-static {v$viewRegister}, " +
        "Lapp/morphe/extension/cromite/amoled/AmoledBrightnessController;->applyNativeSurfaceBackground(Landroid/view/View;)V"

@Suppress("unused")
val pureAmoledOmniboxPatch = bytecodePatch(
    name = "AMOLED - Omnibox and search UI",
    description = "Uses the saved runtime theme for verified LocationBarTablet background setters.",
) {
    compatibleWith("org.cromite.cromite"("153.0.8010.37"))
    dependsOn(cromiteAmoledBrightnessPatch)

    execute {

        fun patchVerifiedBackgroundSetters(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
            val indices = method.findInstructionIndicesReversedOrThrow(omniboxSetBackgroundCall)
            indices.forEach { index ->
                val instruction = method.getInstruction(index) as FiveRegisterInstruction
                method.addInstructions(
                    index + 1,
                    runtimeBackgroundSmali(instruction.registerC),
                )
            }
        }

        patchVerifiedBackgroundSetters(locationBarTabletRefreshFingerprint.method)
        patchVerifiedBackgroundSetters(locationBarTabletInflateFingerprint.method)
    }
}
