package app.template.patches.truecaller.misc.verification

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.shared.addInstructionChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

@Suppress("unused")
val useSmsVerificationPatch = bytecodePatch(
    name = "Use SMS for verification codes",
    description = "Reads the verification code from SMS. Verification can still fail on patched apps.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        OtpSmsApiSelectionFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val googleReads = instructions.withIndex().filter { (_, instruction) ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                instruction.opcode == Opcode.SGET_OBJECT && field?.definingClass == OTP_SMS_API && field.name == "GOOGLE"
            }
            if (googleReads.size != 1) {
                throw PatchException("$definingClass.$name reads OtpSmsApi.GOOGLE ${googleReads.size} times, expected 1")
            }
            // The selection branch loads GOOGLE to compare the configured value with it. Load SMS
            // there instead and return it, so this branch always answers SMS. The branch's earlier
            // instructions only read the configured value; nothing else in the method changes.
            val (index, instruction) = googleReads.single()
            val register = (instruction as OneRegisterInstruction).registerA
            replaceInstruction(index, "sget-object v$register, $OTP_SMS_API->SMS:$OTP_SMS_API")
            addInstructionChecked(index + 1, "return-object v$register")
        }
    }
}
