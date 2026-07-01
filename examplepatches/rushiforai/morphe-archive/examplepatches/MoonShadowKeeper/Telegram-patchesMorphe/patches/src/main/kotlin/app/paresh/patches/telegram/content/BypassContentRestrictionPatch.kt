package app.paresh.patches.telegram.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.telegram.shared.Constants.COMPATIBILITY_TELEGRAM
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

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

object ChatActivityIsPeerNoForwardsFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/ui/ChatActivity;",
    name = "isPeerNoForwards",
    returnType = "Z",
)

object ProfileActivityIsPeerNoForwardsFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/ui/ProfileActivity;",
    name = "isPeerNoForwards",
    returnType = "Z",
)

object CanForwardMessageFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "canForwardMessage",
    returnType = "Z",
    parameters = listOf(),
)

object HasSelectedNoforwardsMessageFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/ui/ChatActivity;",
    name = "hasSelectedNoforwardsMessage",
    returnType = "Z",
)

object MessagesControllerIsPeerNoForwardsFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isPeerNoForwards",
    returnType = "Z",
    parameters = listOf("J"),
)

@Suppress("unused")
val bypassContentRestrictionPatch = bytecodePatch(
    name = "Bypass content restrictions",
    description = "Allows saving from restricted channels."
) {
    compatibleWith(COMPATIBILITY_TELEGRAM)

    execute {
        IsChatNoForwardsLongFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        IsChatNoForwardsChatFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        MessagesControllerIsPeerNoForwardsFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        ChatActivityIsPeerNoForwardsFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        ProfileActivityIsPeerNoForwardsFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        CanForwardMessageFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        HasSelectedNoforwardsMessageFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        // Patch ALL methods that read message.noforwards field — replace with const/4 0
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

        // Also patch Chat.noforwards field reads
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

        // Patch serialization of noforwards in send/forward request classes.
        // These have their own noforwards field (not inherited from Message/Chat),
        // so the above matchAll doesn't catch them.
        listOf(
            "Lorg/telegram/tgnet/TLRPC\$TL_messages_forwardMessages;",
            "Lorg/telegram/tgnet/TLRPC\$TL_messages_sendMessage;",
            "Lorg/telegram/tgnet/TLRPC\$TL_messages_sendMedia;",
            "Lorg/telegram/tgnet/TLRPC\$TL_messages_sendMultiMedia;",
        ).forEach { definingClass ->
            val filter = fieldAccess(
                opcode = Opcode.IGET_BOOLEAN,
                definingClass = definingClass,
                name = "noforwards",
                type = "Z",
            )
            Fingerprint(filters = listOf(filter)).matchAllOrNull()?.forEach { match ->
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
}
