package mightymich.morphe.patches.mydiary.journal.diary.diarywithlock.diaryjournal.secretdiary

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
    description = "Forces the purchase verification method to always return true, unlocking premium features in My Diary."
) {
    compatibleWith(MyDiaryCompatibility.MY_DIARY)



    val purchaseCheckFingerprint = Fingerprint(
        filters = listOf(
            string("purchase_buy__"),
            methodCall(returnType = "Z"),
            opcode(Opcode.MOVE_RESULT, InstructionLocation.MatchAfterImmediately())
        )
    )

    execute {
        purchaseCheckFingerprint.let { fingerprint ->

            val moveResultMatch = fingerprint.instructionMatches[2]


            val resultRegister = moveResultMatch
                .getInstruction<OneRegisterInstruction>()
                .registerA


            fingerprint.method.addInstructions(
                moveResultMatch.index + 1,
                """
                    const/4 v$resultRegister, 0x1
                """
            )
        }
    }
}
