package app.morphe.patches.googlemessages.keywordfilter

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
// Check these helper imports against morphe-patches-template:
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Build: messages.android_20261020_00_RC01.phone_dynamic. Register numbers are specific
 * to this build. NOT COMPILED OR RUN: written from decompiled smali only.
 *
 * SMS: hook in dlgs.b(), before the message is queued.
 * RCS: hook at the start of dnbd.a(Ldlyk;) / dnbd.b(Ldlyk;).
 * MMS: not covered.
 *
 * Blocked messages are dropped permanently (never stored, no notification).
 */
@Suppress("unused")
val messageKeywordFilterPatch = bytecodePatch(
    name = "Keyword message filter",
    description = "Silently drops incoming SMS and RCS messages containing configured " +
        "keywords (no notification, never stored). Cannot be recovered.",
    default = true
) {
    compatibleWith("com.google.android.apps.messaging"("messages.android_20261020_00_RC01.phone_dynamic"))

    val keywords by stringOption(
        key = "keywords",
        default = "",
        title = "Keywords",
        description = "Comma-separated, case-insensitive. Example: winner,crypto,click here"
    )

    // extendWith("extensions/googlemessages.mpe") // as in the template

    execute {
        val kw = (keywords ?: "").replace("\\", "\\\\").replace("\"", "\\\"")

        // ---------- SMS ----------
        val sms = SmsPipelineFingerprint.method
        val smsIndex = sms.indexOfFirstInstruction {
            (getReference<MethodReference>())?.name == "getTimestampMillis"
        }
        sms.addInstructionsWithLabels(
            smsIndex,
            """
            const-string v17, "$kw"
            invoke-static/range {v17 .. v17}, Lapp/morphe/extension/googlemessages/KeywordFilter;->setKeywords(Ljava/lang/String;)V
            invoke-static/range {v22 .. v23}, Lapp/morphe/extension/googlemessages/KeywordFilter;->shouldBlock(Ljava/lang/String;Ljava/lang/String;)Z
            move-result v17
            if-eqz v17, :morphe_sms_continue

            # Drop: close the logging scope (v14), then return Unit like the normal path.
            move-object/from16 v0, v14
            const/4 v1, 0x0
            invoke-static {v0, v1}, Lgwdo;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V
            sget-object v0, Lgvxr;->a:Lgvxr;
            return-object v0

            :morphe_sms_continue
            nop
            """
        )

        // ---------- RCS ----------
        // Both methods are ".locals 2"; p1 (= v3) is the Ldlyk; incoming message.
        // dlyk.t() = remoteUserId (sender), dlyk.q() = messageRawText (body).
        listOf(RcsIncomingAFingerprint, RcsIncomingBFingerprint).forEach { fingerprint ->
            fingerprint.method.addInstructionsWithLabels(
                0,
                """
                const-string v0, "$kw"
                invoke-static {v0}, Lapp/morphe/extension/googlemessages/KeywordFilter;->setKeywords(Ljava/lang/String;)V
                invoke-virtual {p1}, Ldlyk;->t()Ljava/lang/String;
                move-result-object v0
                invoke-virtual {p1}, Ldlyk;->q()Ljava/lang/String;
                move-result-object v1
                invoke-static {v0, v1}, Lapp/morphe/extension/googlemessages/KeywordFilter;->shouldBlock(Ljava/lang/String;Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :morphe_rcs_continue

                # Drop: return an already-completed empty future.
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
