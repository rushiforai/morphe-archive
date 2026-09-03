package app.template.patches.telegram.content

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.SendMessagesHelperForwardMessagesFingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/**
 * v5 — surgical Rich Message forwarding test/fix.
 *
 * The inspected Telegram Web 12.10.1 DEX contains the exact request write:
 *
 *     move/from16 v1, v70       # p4 -> v1
 *     iput-boolean v1, v3, ...->drop_author:Z
 *
 * Rather than touching the beginning of sendMessage(), this patch hooks the
 * existing drop_author write. A tiny helper is invoked only at that point and
 * receives the existing ArrayList parameter with an invoke-range, so no high
 * parameter register is used in a normal 35c invoke.
 *
 * For the first test iteration, the helper returns true only when the first
 * forwarded MessageObject contains a Rich Message. The original p4 value is
 * otherwise preserved. This deliberately isolates the Rich Message request
 * path before attempting to infer the UI's hide-sender state.
 */
@Suppress("unused")
val telegramHideRichMessageForwardedSenderPatch = bytecodePatch(
    name = "Hide sender name for Rich Message forwards",
    description = "Surgically forces drop_author for Rich Message forwards at Telegram's existing request write.",
) {
    compatibleWith(
        TELEGRAM_COMPATIBILITY,
        TELEGRAM_WEB_COMPATIBILITY,
        TELEGRAM_PLUS_COMPATIBILITY,
    )

    execute {
        val method = SendMessagesHelperForwardMessagesFingerprint.method
        val targetClass = SendMessagesHelperForwardMessagesFingerprint.classDef

        val implementation = method.implementation
            ?: throw IllegalStateException("SendMessagesHelper.sendMessage has no implementation")

        val dropAuthorIndex = implementation.instructions.indexOfFirst { instruction ->
            instruction is com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction &&
                instruction.reference is com.android.tools.smali.dexlib2.iface.reference.FieldReference &&
                (instruction.reference as com.android.tools.smali.dexlib2.iface.reference.FieldReference).name == "drop_author" &&
                (instruction.reference as com.android.tools.smali.dexlib2.iface.reference.FieldReference).definingClass ==
                    "Lorg/telegram/tgnet/TLRPC${'$'}TL_messages_forwardMessages;"
        }

        if (dropAuthorIndex < 0) {
            throw IllegalStateException("TL_messages_forwardMessages.drop_author write was not found")
        }

        // Add a tiny helper. It is not called during app startup/login; it is
        // reached only from the forwarding request construction point.
        val helperMethod = ImmutableMethod(
            targetClass.type,
            "patchIsRichForward",
            listOf(ImmutableMethodParameter("Ljava/util/ArrayList;", null, null)),
            "Z",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(3),
        ).toMutable().apply {
            addInstructionsWithLabels(
                0,
                """
                    if-eqz p0, :not_rich
                    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z
                    move-result v0
                    if-nez v0, :not_rich

                    const/4 v0, 0x0
                    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
                    move-result-object v0
                    check-cast v0, Lorg/telegram/messenger/MessageObject;
                    if-eqz v0, :not_rich

                    iget-object v0, v0, Lorg/telegram/messenger/MessageObject;->messageOwner:Lorg/telegram/tgnet/TLRPC${'$'}Message;
                    if-eqz v0, :not_rich

                    iget-object v0, v0, Lorg/telegram/tgnet/TLRPC${'$'}Message;->rich_message:Lorg/telegram/tgnet/tl/TL_iv${'$'}RichMessage;
                    if-eqz v0, :not_rich

                    # The inspected DEX contains MessageObject.hideSendersName.
                    # Use that UI state so ordinary Rich forwards are untouched.
                    # The field is the forwarding-preview state found during the
                    # Telegram 12.10.1 investigation.
                    const/4 v0, 0x0
                    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
                    move-result-object v0
                    check-cast v0, Lorg/telegram/messenger/MessageObject;
                    iget-boolean v0, v0, Lorg/telegram/messenger/MessageObject;->hideSendersName:Z
                    return v0

                    :not_rich
                    const/4 v0, 0x0
                    return v0
                """,
            )
        }
        targetClass.methods.add(helperMethod)

        val originalDropAuthorInstruction = method.getInstruction(dropAuthorIndex)

        // The helper returns the RichMessage test result in v1. If false, jump
        // to Telegram's original move/from16 immediately before the field write
        // so p4 is restored exactly as Telegram supplied it. If true, fall
        // through to the original iput-boolean with v1=true.
        //
        // We target the original move instruction, not the method entry.
        val originalMoveInstruction = method.getInstruction(dropAuthorIndex - 1)

        method.addInstructionsWithLabels(
            dropAuthorIndex,
            """
                invoke-static/range {p1 .. p1}, ${targetClass.type}->patchIsRichForward(Ljava/util/ArrayList;)Z
                move-result v1
                if-eqz v1, :drop_author_restore_original
                const/4 v1, 0x1
            """,
            ExternalLabel("drop_author_restore_original", originalMoveInstruction),
        )
    }
}
