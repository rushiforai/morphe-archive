package app.paresh.patches.plusmessenger.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.plusmessenger.shared.Constants.COMPATIBILITY_PLUS_MESSENGER
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

object GetRestrictionReasonFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "getRestrictionReason",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/util/ArrayList;"),
)

object IsChatNoForwardsLongFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isChatNoForwards",
    returnType = "Z",
    parameters = listOf("J"),
)

object IsChatNoForwardsChatFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isChatNoForwards",
    returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Chat;"),
)

object CanForwardMessageFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "canForwardMessage",
    returnType = "Z",
    parameters = listOf(),
)

object ShowCantOpenAlertFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "showCantOpenAlert",
    returnType = "V",
    parameters = listOf("Lorg/telegram/ui/ActionBar/BaseFragment;", "Ljava/lang/String;"),
)

object CheckCanOpenChat4Fingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf(
        "Landroid/os/Bundle;",
        "Lorg/telegram/ui/ActionBar/BaseFragment;",
        "Lorg/telegram/messenger/MessageObject;",
        "Lorg/telegram/messenger/browser/Browser\$Progress;",
    ),
)

@Suppress("unused")
val bypassChannelRestrictionsPatch = bytecodePatch(
    name = "Bypass channel restrictions",
    description = "Allows copying text, saving media, and opening blocked channels. Forwarding is server-side blocked and won't work."
) {
    compatibleWith(COMPATIBILITY_PLUS_MESSENGER)

    execute {
        // No restriction reason = all content accessible
        GetRestrictionReasonFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return-object v0
        """)

        // Bypass no-forward restrictions
        IsChatNoForwardsLongFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)
        IsChatNoForwardsChatFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        // Allow forwarding any message
        CanForwardMessageFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // Suppress "can't open" alert
        ShowCantOpenAlertFingerprint.method.addInstructions(0, "return-void")

        // Allow opening any chat
        CheckCanOpenChat4Fingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // Neutralize message.noforwards field reads
        val noforwardsFilter = fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "Lorg/telegram/tgnet/TLRPC\$Message;",
            name = "noforwards",
            type = "Z",
        )
        Fingerprint(filters = listOf(noforwardsFilter)).matchAllOrNull()?.forEach { match ->
            match.method.apply {
                val indices = match.instructionMatches.map { it.index }
                for (index in indices.reversed()) {
                    val reg = getInstruction<TwoRegisterInstruction>(index).registerA
                    replaceInstruction(index, "const/4 v$reg, 0x0")
                }
            }
        }

        // Neutralize chat.noforwards field reads
        val chatNoforwardsFilter = fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "Lorg/telegram/tgnet/TLRPC\$Chat;",
            name = "noforwards",
            type = "Z",
        )
        Fingerprint(filters = listOf(chatNoforwardsFilter)).matchAllOrNull()?.forEach { match ->
            match.method.apply {
                val indices = match.instructionMatches.map { it.index }
                for (index in indices.reversed()) {
                    val reg = getInstruction<TwoRegisterInstruction>(index).registerA
                    replaceInstruction(index, "const/4 v$reg, 0x0")
                }
            }
        }
    }
}
