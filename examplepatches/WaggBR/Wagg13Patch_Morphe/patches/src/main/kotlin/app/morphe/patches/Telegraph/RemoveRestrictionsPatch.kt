package app.morphe.patches.telegraph

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

// Remove "proibido copiar/encaminhar/salvar" (noforwards) e o FLAG_SECURE que bloqueia
// capturas de tela dentro do app.
@Suppress("unused")
val removeRestrictionsPatch = bytecodePatch(
    name = "Remove restrictions",
    description = "Allows copying, forwarding, saving and screenshots in restricted chats and channels.",
    default = true
) {
    compatibleWith(TelegraphCompatibility.TELEGRAPH)

    // MessagesController.isChatNoForwards(Chat) (hs.p2 na 13.0.2.0); a versão (long) delega para
    // esta e para a do UserFull.
    val chatNoForwardsFingerprint = Fingerprint(
        returnType = "Z",
        parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Chat;"),
        filters = listOf(
            fieldAccess(
                opcode = Opcode.IGET_BOOLEAN,
                definingClass = "Lorg/telegram/tgnet/TLRPC\$Chat;",
                name = "noforwards"
            )
        )
    )

    // MessagesController.isUserNoForwards(UserFull) (hs.I2 na 13.0.2.0).
    val userNoForwardsFingerprint = Fingerprint(
        returnType = "Z",
        parameters = listOf("Lorg/telegram/tgnet/TLRPC\$UserFull;"),
        filters = listOf(
            fieldAccess(
                opcode = Opcode.IGET_BOOLEAN,
                definingClass = "Lorg/telegram/tgnet/TLRPC\$UserFull;",
                name = "noforwards_peer_enabled"
            )
        )
    )

    // MessageObject.canForwardMessage(): nome preservado.
    val canForwardFingerprint = Fingerprint(
        name = "canForwardMessage",
        returnType = "Z",
        parameters = listOf()
    )

    // isPeerNoForwards existe em ProfileActivity (classe não ofuscada) e na tela de chat, cuja
    // classe é ofuscada e muda de nome a cada versão (qs na 12.10.6, rs na 13.0.2.0). Por isso o
    // casamento é só pelo nome/assinatura, sem fixar a classe, e todos os matches são patchados.
    val peerNoForwardsFingerprint = Fingerprint(
        name = "isPeerNoForwards",
        returnType = "Z",
        parameters = listOf()
    )

    // Leituras diretas do campo noforwards em Message e Chat (menus, seleção de texto etc.).
    val messageNoForwardsFieldFingerprint = Fingerprint(
        filters = listOf(
            fieldAccess(
                opcode = Opcode.IGET_BOOLEAN,
                definingClass = "Lorg/telegram/tgnet/TLRPC\$Message;",
                name = "noforwards"
            )
        )
    )
    val chatNoForwardsFieldFingerprint = Fingerprint(
        filters = listOf(
            fieldAccess(
                opcode = Opcode.IGET_BOOLEAN,
                definingClass = "Lorg/telegram/tgnet/TLRPC\$Chat;",
                name = "noforwards"
            )
        )
    )

    // AndroidUtilities.FlagSecureReason.invalidate() (v9.c na 13.0.2.0, aa.c na 12.10.6): aplica/remove
    // o FLAG_SECURE da janela. As três chamadas aparecem nesta ordem no método.
    val flagSecureInvalidateFingerprint = Fingerprint(
        returnType = "V",
        parameters = listOf(),
        filters = listOf(
            methodCall(definingClass = "Ljava/util/HashMap;", name = "get"),
            methodCall(definingClass = "Landroid/view/Window;", name = "addFlags"),
            methodCall(definingClass = "Landroid/view/Window;", name = "clearFlags")
        )
    )

    execute {
        listOf(
            chatNoForwardsFingerprint,
            userNoForwardsFingerprint
        ).forEach {
            it.method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }

        // matchAll porque o mesmo nome existe em ProfileActivity e na tela de chat.
        peerNoForwardsFingerprint.matchAllOrNull()?.forEach {
            it.method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }

        canForwardFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        messageNoForwardsFieldFingerprint.matchAllOrNull()?.forEach {
            it.method.zeroBooleanFieldReads("Lorg/telegram/tgnet/TLRPC\$Message;", "noforwards")
        }
        chatNoForwardsFieldFingerprint.matchAllOrNull()?.forEach {
            it.method.zeroBooleanFieldReads("Lorg/telegram/tgnet/TLRPC\$Chat;", "noforwards")
        }

        flagSecureInvalidateFingerprint.method.addInstructions(0, "return-void")
    }
}
