/*
 * Adapted from piko <https://github.com/crimera/piko>, GPLv3.
 * Original credits in piko: MyInsta, InstaPro.
 *
 * Simplified: piko gates each injection on a preference read
 * (Pref.disableScreenshotDetection()Z) backed by its settings UI. This port drops the
 * settings layer, so detection is always disabled.
 *
 * piko also skips a flag update in the chat's RecyclerView. That anchor is RecyclerView's own
 * view holder bookkeeping, shared by every list in the app, and not part of screenshot handling,
 * so it is not ported.
 */

package app.ahmedyarub.patches.instagram.privacy

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal object ScreenshotDetectorFingerprint : Fingerprint(
    strings = listOf("ig_android_story_screenshot_directory", "screenshot_detector"),
)

internal object AddFlagsToWindowFingerprint : Fingerprint(
    strings = listOf("Inconsistency in window FLAG_SECURE state detected! window state: "),
)

internal object DirectScreenshotCaptureTriggerFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("igd_screenshot_capture"),
)

/** Sets window flags; FLAG_SECURE is 0x2000. */
private const val WINDOW_SET_FLAGS = "Landroid/view/Window;->setFlags(II)V"

private const val START_WATCHING = "Landroid/os/FileObserver;->startWatching()V"

@Suppress("unused")
val disableScreenshotDetectionPatch = bytecodePatch(
    name = "Disable screenshot detection",
    description = "Disables screenshot detection in direct messages and stories.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        // Never start the observers that watch the screenshot directories. The call returns
        // nothing, so it can simply become a nop.
        ScreenshotDetectorFingerprint.method.apply {
            val startWatchingIndices =
                instructions.filter { instruction ->
                    instruction.getReference<MethodReference>()?.toString() == START_WATCHING
                }.map { it.location.index }
            if (startWatchingIndices.isEmpty()) throw PatchException("The screenshot detector starts no observer")

            startWatchingIndices.forEach { index -> replaceInstruction(index, "nop") }
        }

        // Never mark a window as secure.
        //
        // The class holding the FLAG_SECURE bookkeeping has a method that sets the flag, one
        // that clears it, and one that reconciles the two. piko early-returns only the
        // reconciler, found positionally as "the last const/16 in the method", which leaves
        // the setter free to make the window secure - so Android still refuses to capture.
        // Every method here that calls Window.setFlags is returned from instead, which is
        // both what the patch actually needs and independent of instruction layout.
        val secureFlagMethods =
            AddFlagsToWindowFingerprint.classDef.methods.filter { method ->
                method.returnType == "V" &&
                    method.implementation?.instructions?.any { instruction ->
                        (instruction as? ReferenceInstruction)?.reference?.toString() == WINDOW_SET_FLAGS
                    } == true
            }
        if (secureFlagMethods.isEmpty()) throw PatchException("Nothing in the FLAG_SECURE class sets window flags")
        secureFlagMethods.forEach { method -> method.addInstructions(0, "return-void") }

        // Do not fire the direct message screenshot capture event.
        DirectScreenshotCaptureTriggerFingerprint.method.addInstructions(0, "return-void")
    }
}
