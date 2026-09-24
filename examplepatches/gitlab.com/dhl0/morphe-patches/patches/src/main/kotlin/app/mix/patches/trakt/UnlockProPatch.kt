package app.mix.patches.trakt

import app.mix.patches.trakt.shared.Constants.COMPATIBILITY_TRAKT
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock pro",
    description = "Remove ads, add VIP badge and allow to view 'Your Month in Review'.",
) {
    compatibleWith(COMPATIBILITY_TRAKT)

    execute {
        // Set the User members isVip, isVipEp, isVipOg as true
        val setTrueForVipInstruction = { match: Match.InstructionMatch, fingerprint: Fingerprint ->
            var instruction = match.getInstruction<TwoRegisterInstruction>()
            fingerprint.method.addInstructions(
                match.index,
                """
                    const/4 v${instruction.registerA}, 0x1
                """
            )
        }

        for (i in 3 downTo 1) {
            setTrueForVipInstruction(UserModelFingerprint.instructionMatches[i], UserModelFingerprint)
            setTrueForVipInstruction(
                UserModelSerializableFingerprint.instructionMatches[i],
                UserModelSerializableFingerprint
            )
        }
    }
}
