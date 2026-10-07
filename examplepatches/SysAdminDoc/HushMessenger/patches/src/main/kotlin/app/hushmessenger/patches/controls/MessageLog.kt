/*
 * The notification-capture idea follows hyowonbernabe/Messenger-Z (behavior only; its code is not used here).
 */
package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val MESSAGE_LOG = "message_log"

internal const val NEW_MESSAGE_NOTIFICATION = "Lcom/facebook/messaging/notify/type/NewMessageNotification;"
internal const val MESSENGER_ACCOUNT_TYPE = "Lcom/facebook/messaging/accountswitch/model/MessengerAccountType;"
internal const val MESSAGE = "Lcom/facebook/messaging/model/messages/Message;"
internal const val THREAD_SUMMARY = "Lcom/facebook/messaging/model/threads/ThreadSummary;"
internal const val THREAD_KEY_TYPE = "Lcom/facebook/messaging/model/threadkey/ThreadKey;"
internal const val SECRET_STRING = "Lcom/facebook/secure/secrettypes/SecretString;"

/**
 * The new-message notification constructor's hook id for a build. Only its fourth and fifth parameter types are
 * obfuscated and move between builds; the rest stay the same.
 */
internal fun newMessageNotificationCtor(obf4: String, obf5: String) =
    "$NEW_MESSAGE_NOTIFICATION-><init>($MESSENGER_ACCOUNT_TYPE$MESSAGE$THREAD_SUMMARY$obf4$obf5" +
        "Lcom/facebook/messaging/push/flags/ServerMessageAlertFlags;Lcom/facebook/push/constants/PushProperty;" +
        "Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;ZZZZZZZ)V"

/**
 * Where, in this exact build, the message text and the thread live. Resolved from the stock classes at patch time, so
 * nothing reads obfuscated field names at runtime. A build that doesn't match any of these refuses the switch.
 */
internal class MessageLogContract(
    /** Message's SecretString field that the "text" getter returns. */
    val bodyField: String,
    /** SecretString's plaintext String field, the one its constructor fills from its argument. */
    val secretField: String,
    /** Message's ThreadKey field, the one the notification constructor itself reads. */
    val threadKeyField: String,
)

internal var messageLogContract: MessageLogContract? = null

private fun fieldId(reference: FieldReference) = "${reference.definingClass}->${reference.name}:${reference.type}"

private fun Method.stringRefs() =
    implementation?.instructions?.toList().orEmpty().mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }

/** Instance reads only: the stock text getter also falls back to a shared static empty SecretString. */
private fun Method.fieldReads(owner: String, type: String) =
    implementation?.instructions?.toList().orEmpty().filter { it.opcode == Opcode.IGET_OBJECT }
        .mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
        .filter { it.definingClass == owner && it.type == type }

/**
 * Picks the three field references the hook needs out of the stock classes. Returns null when any of them is missing or
 * ambiguous, so the control stops instead of guessing.
 */
internal fun resolveMessageLogContract(classes: Iterable<ClassDef>): MessageLogContract? {
    val message = classes.firstOrNull { it.type == MESSAGE } ?: return null
    val secret = classes.firstOrNull { it.type == SECRET_STRING } ?: return null
    val notification = classes.firstOrNull { it.type == NEW_MESSAGE_NOTIFICATION } ?: return null

    // The body getter returns a SecretString and, once "text" is in the set fields, reads one SecretString instance field.
    val bodyFields = message.methods
        .filter { it.returnType == SECRET_STRING && "text" in it.stringRefs() }
        .flatMap { it.fieldReads(MESSAGE, SECRET_STRING) }
        .map { fieldId(it) }.distinct()
    val body = bodyFields.singleOrNull() ?: return null

    // SecretString keeps the real text in the field its (String) constructor fills from the argument register.
    val secretCtor = secret.methods.singleOrNull {
        it.name == "<init>" && it.parameterTypes == listOf("Ljava/lang/String;") && it.implementation != null
    } ?: return null
    val argRegister = secretCtor.implementation!!.registerCount - 1
    val secretFields = secretCtor.implementation!!.instructions.mapNotNull { insn ->
        val reference = (insn as? ReferenceInstruction)?.reference as? FieldReference ?: return@mapNotNull null
        val source = (insn as? TwoRegisterInstruction)?.registerA
        if (reference.definingClass == SECRET_STRING && reference.type == "Ljava/lang/String;" && source == argRegister)
            fieldId(reference) else null
    }.distinct()
    val secretField = secretFields.singleOrNull() ?: return null

    // The thread key is whatever ThreadKey field the notification constructor itself loads from the message.
    val ctor = messageLogHook(notification) ?: return null
    val threadKeys = ctor.fieldReads(MESSAGE, THREAD_KEY_TYPE).map { fieldId(it) }.distinct()
    val threadKeyField = threadKeys.singleOrNull() ?: return null

    return MessageLogContract(body, secretField, threadKeyField)
}

private fun messageLogHook(notification: ClassDef): Method? = notification.methods.singleOrNull {
    it.name == "<init>" && it.returnType == "V" && it.parameterTypes.size >= 3 &&
        it.parameterTypes[0] == MESSENGER_ACCOUNT_TYPE && it.parameterTypes[1] == MESSAGE &&
        it.parameterTypes[2] == THREAD_SUMMARY && it.implementation != null
}

/** The one non-Parcel NewMessageNotification constructor. The hook reads its message and thread parameters. */
internal fun findMessageLogHook(classes: Iterable<ClassDef>): List<Method> {
    val notification = classes.firstOrNull { it.type == NEW_MESSAGE_NOTIFICATION } ?: return emptyList()
    return listOfNotNull(messageLogHook(notification))
}

/** v0 and v1 are free locals, and the constructor keeps its message/thread shape. */
internal fun MutableMethod.validateMessageLog() {
    if (name != "<init>" || returnType != "V" || AccessFlags.STATIC.isSet(accessFlags) ||
        parameterTypes.size < 3 || parameterTypes[0] != MESSENGER_ACCOUNT_TYPE ||
        parameterTypes[1] != MESSAGE || parameterTypes[2] != THREAD_SUMMARY) {
        throw PatchException("Messenger controls: ${hookId()} isn't the new-message notification constructor")
    }
    val parameterWords = parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 } + 1
    if ((implementation?.registerCount ?: 0) < parameterWords + 2) {
        throw PatchException("Messenger controls: ${hookId()} has no room for the message log hook")
    }
    if (messageLogContract == null) {
        throw PatchException("Messenger controls: the message and thread fields don't match the tested build")
    }
}

/**
 * At the constructor's start, before the super call, the hook reads the incoming message's text and thread from the
 * parameter object (never the one being built), and hands them to the extension off Messenger's own thread. Off, Pause
 * and safe mode read nothing: the extension's gate is checked first, so the text is never even loaded.
 */
internal fun MutableMethod.injectMessageLog() {
    validateMessageLog()
    val contract = messageLogContract!!
    addInstructionsWithLabels(0, """
        invoke-static {}, $SETTINGS->logReceivedMessages()Z
        move-result v0
        if-eqz v0, :stock_behavior
        move-object/from16 v0, p2
        if-eqz v0, :stock_behavior
        iget-object v1, v0, ${contract.bodyField}
        if-eqz v1, :stock_behavior
        iget-object v1, v1, ${contract.secretField}
        iget-object v0, v0, ${contract.threadKeyField}
        if-eqz v0, :message_log_no_thread
        invoke-virtual {v0}, $THREAD_KEY_TYPE->toString()Ljava/lang/String;
        move-result-object v0
        goto :message_log_store
        :message_log_no_thread
        const/4 v0, 0x0
        :message_log_store
        invoke-static {v1, v0}, $SETTINGS->recordReceivedMessage(Ljava/lang/String;Ljava/lang/String;)V
    """.trimIndent(), ExternalLabel("stock_behavior", getInstruction(0)))
}
