package mightymich.morphe.patches.devinfo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.InstructionLocation
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro Features",
    description = "Forces the 'is_pro_user' check to always return true, unlocking Pro features in Device Info."
) {
    compatibleWith(DevInfoCompatibility.DEVINFO)

    val isProUserFingerprint = Fingerprint(
        filters = listOf(
            string("is_pro_user"),
            methodCall(
                definingClass = "Landroid/content/SharedPreferences;",
                name = "getBoolean"
            ),
            opcode(Opcode.MOVE_RESULT, InstructionLocation.MatchAfterImmediately())
        )
    )

    execute {
        isProUserFingerprint.let { fingerprint ->
            val method = fingerprint.method
            val moveResultMatch = fingerprint.instructionMatches[2]
            val resultRegister = moveResultMatch
                .getInstruction<OneRegisterInstruction>()
                .registerA

            method.replaceInstruction(
                moveResultMatch.index,
                "const/4 v$resultRegister, 0x1"
            )
        }
    }
}
