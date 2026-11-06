package app.template.patches.googlemessages

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_GOOGLE_MESSAGES
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/template/extension/googlemessages/KeywordFilter;"
@Suppress("unused")
val messageKeywordFilterPatch = bytecodePatch(
    name = "Keyword message filter",
    description = "Silently drops incoming SMS and RCS messages containing keywords set in the " +
        "\"Keyword Filter\" screen (no notification, never stored). Cannot be recovered.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GOOGLE_MESSAGES)

    dependsOn(keywordSettingsResourcePatch)

    extendWith("extensions/extension.mpe")

    execute {
        // ---------- SMS: dlgs.b, right before SmsMessage.getTimestampMillis() ----------
        val sms = SmsPipelineFingerprint.method
        val smsIndex = sms.implementation!!.instructions.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name ==
                "getTimestampMillis"
        }
        if (smsIndex < 0) throw IllegalStateException("getTimestampMillis not found in SMS method")

        sms.addInstructionsWithLabels(
            smsIndex,
            """
            invoke-static/range {v22 .. v23}, $EXTENSION_CLASS->shouldBlock(Ljava/lang/String;Ljava/lang/String;)Z
            move-result v17
            if-eqz v17, :morphe_sms_continue
            move-object/from16 v0, v14
            const/4 v1, 0x0
            invoke-static {v0, v1}, Lgwdo;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V
            sget-object v0, Lgvxr;->a:Lgvxr;
            return-object v0
            :morphe_sms_continue
            nop
            """
        )

        // ---------- RCS: dnbd.a / dnbd.b (.locals 2, p1 = Ldlyk; incoming message) ----------
        listOf(RcsIncomingAFingerprint, RcsIncomingBFingerprint).forEach { fingerprint ->
            fingerprint.method.addInstructionsWithLabels(
                0,
                """
                instance-of v0, p1, Ldluv;
                if-eqz v0, :morphe_rcs_continue
                move-object v0, p1
                check-cast v0, Ldluv;
                invoke-virtual {v0}, Ldluv;->t()Ljava/lang/String;
                move-result-object v1
                invoke-virtual {v0}, Ldluv;->q()Ljava/lang/String;
                move-result-object v0
                invoke-static {v1, v0}, $EXTENSION_CLASS->shouldBlock(Ljava/lang/String;Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :morphe_rcs_continue
                const/4 v0, 0x0
                invoke-static {v0}, Lfuip;->e(Ljava/lang/Object;)Lfuim;
                move-result-object v0
                return-object v0
                :morphe_rcs_continue
                nop
                """
            )
        }
    }
}
