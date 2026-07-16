package app.jouss.patches.truecaller.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.bytecodePatch
import app.jouss.patches.truecaller.shared.Constants.COMPATIBILITY_TRUECALLER
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private object OtpSmsApiSelectionFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = "Lcom/truecaller/wizard/verification/otp/sms/OtpSmsApi;",
            name = "GOOGLE",
        ),
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = "Lcom/truecaller/wizard/verification/otp/sms/OtpSmsApi;",
            name = "SMS",
        ),
    ),
)

@Suppress("unused")
val gmsSigninBypassPatch = bytecodePatch(
    name = "GMS sign-in bypass",
    description = "Forces SMS-based OTP verification instead of GMS SmsRetriever, fixing sign-in on re-signed APKs.",
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        val googleFieldIndex = OtpSmsApiSelectionFingerprint.instructionMatches[0].index
        OtpSmsApiSelectionFingerprint.method.addInstructions(googleFieldIndex, """
            sget-object v0, Lcom/truecaller/wizard/verification/otp/sms/OtpSmsApi;->SMS:Lcom/truecaller/wizard/verification/otp/sms/OtpSmsApi;
            return-object v0
        """)
    }
}
