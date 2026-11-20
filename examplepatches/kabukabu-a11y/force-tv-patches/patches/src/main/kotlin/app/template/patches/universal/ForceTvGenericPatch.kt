package app.template.patches.universal

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * Universal variant of the TV mode patch, for apps that detect a TV
 * through the leanback system features (PackageManager.hasSystemFeature
 * with "android.software.leanback" and friends).
 *
 * Every boolean method in the app that references a leanback feature
 * string is made to return true immediately. This is a heuristic: it
 * works for the common "small detection helper" shape, but an app that
 * mixes the feature check into a larger boolean decision may change
 * more behavior than intended. If an app misbehaves, this patch is the
 * first thing to turn off.
 *
 * The patch is universal (no compatibility declaration): it can be
 * applied to any app, and it fails with a clear message when the app
 * does not contain this detection pattern at all.
 */
@Suppress("unused")
val forceTvLeanbackPatch = patch(
    name = "Force TV mode (leanback check)",
    description = "Universal: makes any app that detects TVs via the leanback system features treat the device as an Android TV, including apps that run the check once in an initializer. Experimental heuristic.",
    default = false
) {
    execute {
        // Resolve both shapes before changing anything.
        val callSites = LeanbackCallSiteFingerprint.matchAllOrNull()
        val boolMethods = LeanbackFeatureCheckFingerprint.matchAllOrNull()

        if (callSites == null && boolMethods == null) {
            throw PatchException(
                "No leanback TV detection found in this app. " +
                    "The app either has no TV interface, or detects TVs in another way. " +
                    "Try the UiModeManager variant instead."
            )
        }

        // Shape 2: the check runs inside an initializer or another
        // non-boolean method (VLC's AndroidDevices, for example), so
        // there is no boolean helper to flip. Force the result of
        // that one hasSystemFeature() call to true by overwriting
        // its move-result register right after the call.
        callSites?.forEach { match ->
            val method = match.method
            val invokeIndex = match.instructionMatches[1].index
            val moveResultIndex = (invokeIndex + 1..invokeIndex + 3).firstOrNull { index ->
                method.getInstruction(index).opcode == Opcode.MOVE_RESULT
            } ?: return@forEach
            val register = method.getInstruction<OneRegisterInstruction>(moveResultIndex).registerA
            method.addInstructions(moveResultIndex + 1, "const/4 v$register, 0x1")
        }

        // Shape 1: a boolean helper returns the check. Make it
        // return true immediately; the original body, including
        // any call site edited above, becomes unreachable.
        boolMethods?.forEach { match ->
            match.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
    }
}

/**
 * Universal variant of the TV mode patch, for apps that detect a TV
 * through UiModeManager.getCurrentModeType().
 *
 * Every boolean method that queries the UI mode type is made to return
 * true immediately. Same heuristic caveat as the leanback variant.
 */
@Suppress("unused")
val forceTvUiModePatch = patch(
    name = "Force TV mode (UiModeManager check)",
    description = "Universal: makes any app that detects TVs via UiModeManager treat the device as an Android TV. Experimental heuristic.",
    default = false
) {
    execute {
        val matches = UiModeTvCheckFingerprint.matchAllOrNull()
            ?: throw PatchException(
                "No UiModeManager TV detection found in this app. " +
                    "The app either has no TV interface, or detects TVs in another way. " +
                    "Try the leanback variant instead."
            )

        matches.forEach { match ->
            match.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
    }
}
