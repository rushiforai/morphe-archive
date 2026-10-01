package app.adm.patches.ads

import app.adm.patches.shared.Constants.COMPATIBILITY_ADM
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Skip ADM's Appodeal and AppBrain ad setup and display routines, and the Telegram join prompt.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ADM)

    execute {
        AppodealInitFingerprint.method.addInstructions(0, "return-void")
        BannerDisplayFingerprint.method.addInstructions(0, "return-void")
        InterstitialDisplayFingerprint.method.addInstructions(0, "return-void")

        // The AppBrain banner lives inside a remote-configuration dispatch case that
        // also performs unrelated work, so only the two calls that attach and reveal it
        // are removed. Each is a 35c `invoke-virtual`, three code units wide, padded
        // back out to three `nop`s so the method keeps its exact size and the packed
        // switch payload stays where it is.
        //
        // Each invoke is removed on its own rather than through `replaceInstructions`.
        // That helper removes as many instructions as it is given, so passing three nops
        // also deleted the two instructions after the invoke. The first site ate the
        // second invoke outright, and both sites ate the `new-instance` that assigns
        // `v0`, leaving it a verifier `Conflict` wherever it is used as a receiver.
        //
        // The two indices are read before either edit and applied highest first. Removing
        // one invoke and adding three nops moves every later index up by two, so a second
        // index captured beforehand would otherwise no longer point at its invoke.
        AppBrainBannerFingerprint.let { fingerprint ->
            val attaches = listOf(
                fingerprint.instructionMatches[1].index,
                fingerprint.instructionMatches[2].index
            ).sortedDescending()

            attaches.forEach { index ->
                fingerprint.method.removeInstruction(index)
                fingerprint.method.addInstructions(index, "nop\nnop\nnop")
            }
        }

        // The gate constant is a threshold compared with `if-ge`, not a counter value.
        // Setting it to zero makes the comparison always hold, so the prompt block is
        // skipped and execution resumes on the normal start-up path.
        TelegramPromptFingerprint.let { fingerprint ->
            fingerprint.method.replaceInstruction(fingerprint.instructionMatches[2].index, "const/4 v7, 0")
        }
    }
}
