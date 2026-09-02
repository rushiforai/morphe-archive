package app.template.patches.telegram.content

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.SendMessagesHelperForwardMessagesFingerprint

/**
 * Removes the forwarded sender attribution for Rich Messages only.
 *
 * The target is the first original instruction in sendMessage(). All
 * conditional exits from the injected block therefore use an ExternalLabel
 * bound to a real instruction in the original method instead of a label
 * declared inside the injected smali block.
 */
@Suppress("unused")
val telegramHideRichMessageForwardedSenderPatch = bytecodePatch(
    name = "Hide sender name for Rich Message forwards",
    description = "Removes forwarded channel attribution from Rich Messages while preserving their original content.",
) {
    compatibleWith(
        TELEGRAM_COMPATIBILITY,
        TELEGRAM_WEB_COMPATIBILITY,
        TELEGRAM_PLUS_COMPATIBILITY,
    )

    execute {
        val originalFirstInstruction = SendMessagesHelperForwardMessagesFingerprint.method.getInstruction(0)

        SendMessagesHelperForwardMessagesFingerprint.method.addInstructionsWithLabels(
            0,
            """
                if-eqz p1, :rich_forward_original
                invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z
                move-result v0
                if-nez v0, :rich_forward_original

                const/4 v0, 0x0
                invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
                move-result-object v0
                check-cast v0, Lorg/telegram/messenger/MessageObject;

                iget-object v0, v0, Lorg/telegram/messenger/MessageObject;->messageOwner:Lorg/telegram/tgnet/TLRPC${'$'}Message;
                if-eqz v0, :rich_forward_original

                iget-object v0, v0, Lorg/telegram/tgnet/TLRPC${'$'}Message;->rich_message:Lorg/telegram/tgnet/tl/TL_iv${'$'}RichMessage;
                if-eqz v0, :rich_forward_original

                # p4 is the first boolean parameter after the long destination
                # id for this forwarding overload. It is the forwarding-name
                # flag used by Telegram's request-building path.
                const/4 p4, 0x1

            """,
            ExternalLabel("rich_forward_original", originalFirstInstruction),
        )
    }
}
