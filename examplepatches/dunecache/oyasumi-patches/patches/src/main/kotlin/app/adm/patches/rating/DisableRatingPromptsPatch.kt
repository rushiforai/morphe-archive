package app.adm.patches.rating

import app.adm.patches.shared.Constants.COMPATIBILITY_ADM
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
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
        // dispatcher across every deferred activity action. The matched
        // `invoke-virtual` is a 35c, three code units wide, and is padded back out to
        // three `nop`s, so the case's own `return-void`, the packed-switch payload, and
        // every other case stay exactly where they were. `Back.onDestroy()` is left
        // alone, so service teardown is unaffected.
        //
        // The instruction is removed on its own rather than through `replaceInstructions`.
        // That helper removes as many instructions as it is given, so passing three nops
        // also deleted the two instructions after the invoke: the case's `return-void`
        // and, critically, the `iget-object` at index 726 that was the only assignment
        // of a reference to `v0` on that path. Without it `v0` is a verifier `Conflict`
        // at every later use, and the app dies on launch with
        // "tried to get class from non-reference register v0 (type=Conflict)".
        RatingPromptFingerprint.let { fingerprint ->
            val invoke = fingerprint.instructionMatches[2].index

            fingerprint.method.removeInstruction(invoke)
            fingerprint.method.addInstructions(invoke, "nop\nnop\nnop")
        }
    }
}
