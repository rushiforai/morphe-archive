package mightymich.morphe.patches.com.teejay.trebedit

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.InstructionLocation
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium Features",
    description = "Unlocks TrebEdit premium by forcing the premium check to return true. ",
    default = true
) {
    compatibleWith(TrebEditCompatibility.TREBEDIT)

    // Fingerprint: match the sequence
    //   string("is_premium_user") -> methodCall(returnType = "Z") -> move-result
    val purchaseCheckFingerprint = Fingerprint(
        filters = listOf(
            string("is_premium_user"),
            methodCall(returnType = "Z"),
            opcode(Opcode.MOVE_RESULT, InstructionLocation.MatchAfterImmediately())
        )
    )

    execute {
        purchaseCheckFingerprint.let { fingerprint ->
            // Get the move-result instruction match (the third filter).
            val moveResultMatch = fingerprint.instructionMatches[2]

            // Get the register that receives the boolean result.
            val resultRegister = moveResultMatch
                .getInstruction<OneRegisterInstruction>()
                .registerA

            // Insert "const/4 vX, 0x1" right after move-result.
            // This overwrites the result of the purchase check with true (1).
            fingerprint.method.addInstructions(
                moveResultMatch.index + 1,
                """
                    const/4 v$resultRegister, 0x1
                """
            )
        }
    }
}
