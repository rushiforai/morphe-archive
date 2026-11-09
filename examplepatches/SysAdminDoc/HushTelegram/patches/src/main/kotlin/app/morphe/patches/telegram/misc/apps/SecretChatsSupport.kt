/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.apps

import app.morphe.util.names.origParameterTypes
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val SECRET_CHATS = "$EXTENSION_PACKAGE/misc/SecretChats;"
internal const val SECRET_HELPER = "Lorg/telegram/messenger/SecretChatHelper;"
internal const val SECRET_UPDATE = "Lorg/telegram/tgnet/tl/TL_update\$TL_updateEncryption;"
internal const val SECRET_CHAT = "Lorg/telegram/tgnet/TLRPC\$EncryptedChat;"
internal const val SECRET_REQUESTED = "Lorg/telegram/tgnet/TLRPC\$TL_encryptedChatRequested;"
internal const val SECRET_REFUSE = "$SECRET_CHATS->refuse()Z"
private const val SECRET_CHAT_FIELD = "$SECRET_UPDATE->chat:$SECRET_CHAT"
private const val SECRET_DH_CONFIG = "Lorg/telegram/tgnet/TLRPC\$TL_messages_getDhConfig;"

/** processUpdateEncryption, and the check that goes in front of it. */
internal class SecretChatsSite(val method: MutableMethod) {
    private val code = """
        iget-object v0, p1, $SECRET_CHAT_FIELD
        instance-of v1, v0, $SECRET_REQUESTED
        if-eqz v1, :hush_stock
        invoke-static {}, $SECRET_REFUSE
        move-result v1
        if-eqz v1, :hush_stock
        return-void
        :hush_stock
        nop
    """.trimIndent()

    fun apply(target: MutableMethod = method) = target.addInstructionsAtControlFlowLabel(0, code)

    /** The same edit on a copy, so a smali or register problem shows before the app is touched. */
    fun rehearse() = apply(MutableMethod(ImmutableMethod.of(method)))
}

/**
 * SecretChatHelper.processUpdateEncryption(updateEncryption, map) is the one entry for a secret chat
 * update: MessagesController hands it every one. It reads {@code chat}, and an
 * {@code encryptedChatRequested} with no saved chat is saved and accepted. The check goes first, and v0
 * and v1 are free there because the method's own first instructions write them.
 */
internal fun BytecodePatchContext.resolveSecretChats(): SecretChatsSite {
    requireStatusMethod("disableSecretChats")
    controlHook(SECRET_CHATS, "refuse", emptyList(), "Z")
    val owner = tgMutableClassDefByOrNull(SECRET_HELPER)
    controlShape(owner != null, "Telegram's secret chat helper is missing")
    val method = owner!!.methods.filter { it.origName == "processUpdateEncryption" && it.origReturnType == "V" &&
        it.parameterTypes.size == 2 && it.origParameterTypes[0] == SECRET_UPDATE && it.implementation != null &&
        !AccessFlags.STATIC.isSet(it.accessFlags) }.controlSingle("the secret chat update entry")
    val body = method.controlBody()
    controlShape(body.firstOrNull()?.let { it.opcode == Opcode.IGET_OBJECT && it.controlRef() == SECRET_CHAT_FIELD } == true,
        "the secret chat update no longer starts by reading its chat")
    // 13.2 inlined acceptSecretChat here, which starts by asking for the key exchange's DH config.
    controlShape(body.any { it.opcode == Opcode.INSTANCE_OF && it.controlRef() == SECRET_REQUESTED } &&
        body.any { it.controlRef()?.startsWith("$SECRET_HELPER->acceptSecretChat(") == true ||
            (it.opcode == Opcode.NEW_INSTANCE && it.controlRef() == SECRET_DH_CONFIG) },
        "the secret chat update no longer accepts a requested chat")
    controlShape(method.implementation!!.registerCount - method.parameterTypes.size - 1 >= 2, "the secret chat update has no free registers")
    return SecretChatsSite(method).also { it.rehearse() }
}
