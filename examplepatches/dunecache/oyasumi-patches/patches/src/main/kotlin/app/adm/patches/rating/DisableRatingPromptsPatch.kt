package app.adm.patches.rating

import app.adm.patches.shared.Constants.COMPATIBILITY_ADM
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableRatingPromptsPatch = bytecodePatch(
    name = "Disable rating prompts",
    description = "Skip ADM's automatic rating prompt. The menu item that opens the same dialog on request is left intact.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ADM)

    execute {
        // Only the delayed dispatch case is silenced, because 14.0.39 shares one
        // dispatcher across every deferred activity action. The `invoke-virtual` is
        // three code units wide and is swapped for three `nop`s of the same width, so
        // the case's own `return-void`, the packed-switch payload, and every other
        // case stay exactly where they were. `Back.onDestroy()` is left alone, so
        // service teardown is unaffected.
        RatingPromptFingerprint.let { fingerprint ->
            fingerprint.method.replaceInstructions(fingerprint.instructionMatches[2].index, "nop\nnop\nnop")
        }
    }
}
