package mightymich.morphe.patches.audioeditor.musiceditor.soundeditor.songeditor

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
    description = "Forces the purchase verification method to always return true, unlocking premium features in Audio Editor."
) {
    compatibleWith(AudioEditorCompatibility.AUDIO_EDITOR)

    // 1. Fingerprint: match the sequence
    //    string("purchase_buy__") -> methodCall(returnType = "Z") -> move-result
    val purchaseCheckFingerprint = Fingerprint(
        filters = listOf(
            string("purchase_buy__"),
            methodCall(returnType = "Z"),
            opcode(Opcode.MOVE_RESULT, InstructionLocation.MatchAfterImmediately())
        )
    )

    execute {
        purchaseCheckFingerprint.let { fingerprint ->
            // 2. Get the move-result instruction match (the third filter).
            val moveResultMatch = fingerprint.instructionMatches[2]

            // 3. Get the register that receives the boolean result.
            val resultRegister = moveResultMatch
                .getInstruction<OneRegisterInstruction>()
                .registerA

            // 4. Insert "const/4 vX, 0x1" right after move-result.
            //    This overwrites the result of the purchase check with true (1).
            fingerprint.method.addInstructions(
                moveResultMatch.index + 1,
                """
                    const/4 v$resultRegister, 0x1
                """
            )
        }
    }
}
