package semicoloncolonel.mobilestream.patches.substack.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.substack.shared.Constants

// Substack 3.12.0. The app registers Android's Activity.ScreenCaptureCallback
// on its reader and other screens, so it is told whenever you take a
// screenshot and then fires its own handler (a logged event and UI). Each
// callback's onScreenCaptured() now returns immediately, so a screenshot does
// nothing. Registration and unregistration are left intact, so the lifecycle
// stays balanced.

private const val ON_SCREEN_CAPTURED = "onScreenCaptured"

@Suppress("unused")
val disableScreenshotDetectionPatch = bytecodePatch(
    name = "Disable screenshot detection",
    description = "Stops the app from reacting when you take a screenshot.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        var patched = 0
        val targets = mutableListOf<String>()
        classDefForEach { classDef ->
            val hit = classDef.methods.any {
                it.name == ON_SCREEN_CAPTURED &&
                    it.parameterTypes.isEmpty() &&
                    it.returnType == "V" &&
                    it.implementation != null
            }
            if (hit) targets += classDef.type
        }
        targets.forEach { type ->
            mutableClassDefBy(type).methods
                .filter { it.name == ON_SCREEN_CAPTURED && it.parameterTypes.isEmpty() && it.returnType == "V" }
                .forEach {
                    it.addInstructions(0, "return-void")
                    patched++
                }
        }
        if (patched == 0) throw PatchException("No ScreenCaptureCallback.onScreenCaptured() found")
    }
}
