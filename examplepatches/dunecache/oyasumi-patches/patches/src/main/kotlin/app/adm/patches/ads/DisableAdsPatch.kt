package app.adm.patches.ads

import app.adm.patches.shared.Constants.COMPATIBILITY_ADM
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
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
        // also performs unrelated work, so only the two instructions that attach and
        // reveal it are removed. Each `invoke-virtual` is three code units wide and is
        // swapped for three `nop`s of the same width, so no branch offset, switch
        // target, or payload address in this method moves. Every register they read is
        // still assigned, so the `nop`s cannot introduce an undefined read.
        AppBrainBannerFingerprint.let { fingerprint ->
            fingerprint.method.replaceInstructions(fingerprint.instructionMatches[1].index, "nop\nnop\nnop")
            fingerprint.method.replaceInstructions(fingerprint.instructionMatches[2].index, "nop\nnop\nnop")
        }

        // The gate constant is a threshold compared with `if-ge`, not a counter value.
        // Setting it to zero makes the comparison always hold, so the prompt block is
        // skipped and execution resumes on the normal start-up path.
        TelegramPromptFingerprint.let { fingerprint ->
            fingerprint.method.replaceInstruction(fingerprint.instructionMatches[2].index, "const/4 v7, 0")
        }
    }
}
