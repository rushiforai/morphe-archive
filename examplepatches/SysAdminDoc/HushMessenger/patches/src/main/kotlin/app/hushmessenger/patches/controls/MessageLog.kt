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
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val MESSAGE_LOG = "message_log"
internal const val AUTO_REPLY = "auto_reply"

internal const val NEW_MESSAGE_NOTIFICATION = "Lcom/facebook/messaging/notify/type/NewMessageNotification;"
internal const val MESSENGER_ACCOUNT_TYPE = "Lcom/facebook/messaging/accountswitch/model/MessengerAccountType;"
internal const val MESSAGE = "Lcom/facebook/messaging/model/messages/Message;"
internal const val THREAD_SUMMARY = "Lcom/facebook/messaging/model/threads/ThreadSummary;"
internal const val THREAD_KEY_TYPE = "Lcom/facebook/messaging/model/threadkey/ThreadKey;"
internal const val SECRET_STRING = "Lcom/facebook/secure/secrettypes/SecretString;"
internal const val MESSAGES_NOTIFICATION_MANAGER = "Lcom/facebook/messaging/notify/client/MessagesNotificationManager;"
internal const val MESSENGER_BROWSER_LAUNCHER = "Lcom/facebook/messaging/browser/util/MessengerBrowserLauncher;"
private const val JSON_PUT = "Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;"

/** Messenger's own spelling. Its notification manager logs this when an unsend takes a chat's notification back. */
internal const val UNSEND_RETRACTION = "messenger_android_unsend_notificaiton_retraction"

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
    /**
     * Messenger's static check that a message was unsent (its unsent time isn't 0). An unsend reaches the constructor
     * as a notification of its own, with a stand-in text like "Ana sent a message.", and the notification manager runs
     * this check on it before taking the chat's notification back.
     */
    val unsentCheck: String,
    /**
     * Message's own id, the String field Messenger's browser launcher puts under "message_id" when it hands a message to
     * a web page. The push and the sync copy of one message share it, and two messages with the same text don't.
     */
    val messageIdField: String,
    /**
     * Message's boolean that marks text Messenger hid from the notification. A chat with disappearing messages on gets a
     * stand-in Message whose text is "Secret conversation" and whose notification has no Reply action. Messenger's own
     * notification text builder, the one (Message, ThreadSummary)String method, reads this flag and nothing else.
     */
    val hiddenField: String,
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
 * Picks the field and method references the hook needs out of the stock classes. Returns null when any of them is
 * missing or ambiguous, so the control stops instead of guessing.
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
    // The hook reads both from the notification class, so one it can't access would fail the verifier on every
    // notification.
    if (!message.declaresReadable(body, NEW_MESSAGE_NOTIFICATION) || !secret.declaresReadable(secretField, NEW_MESSAGE_NOTIFICATION)) return null

    // The thread key is whatever ThreadKey field the notification constructor itself loads from the message.
    val ctor = messageLogHook(notification) ?: return null
    val threadKeys = ctor.fieldReads(MESSAGE, THREAD_KEY_TYPE).map { fieldId(it) }.distinct()
    val threadKeyField = threadKeys.singleOrNull() ?: return null

    val unsentCheck = findUnsentChecks(classes).singleOrNull() ?: return null

    val messageId = findMessageIdFields(classes).singleOrNull() ?: return null
    if (!message.declaresReadable(messageId, NEW_MESSAGE_NOTIFICATION)) return null

    val hidden = findHiddenTextFields(classes).singleOrNull() ?: return null
    if (!message.declaresReadable(hidden, NEW_MESSAGE_NOTIFICATION)) return null

    return MessageLogContract(body, secretField, threadKeyField, unsentCheck, messageId, hidden)
}

/** The Message boolean fields every (Message, ThreadSummary)String method reads. More than one can't be told apart. */
internal fun findHiddenTextFields(classes: Iterable<ClassDef>): List<String> =
    classes.flatMap { it.methods }.filter {
        it.returnType == "Ljava/lang/String;" && it.parameterTypes.map { type -> type.toString() } == listOf(MESSAGE, THREAD_SUMMARY)
    }.flatMap { method ->
        method.implementation?.instructions?.toList().orEmpty().filter { it.opcode == Opcode.IGET_BOOLEAN }
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
            .filter { it.definingClass == MESSAGE && it.type == "Z" }
            .map { fieldId(it) }
    }.distinct()

/**
 * Every Message String field the browser launcher reads straight after loading "message_id" and puts into a JSONObject
 * under that key, all three on the same registers. More than one means the id can't be told apart.
 */
internal fun findMessageIdFields(classes: Iterable<ClassDef>): List<String> =
    classes.filter { it.type == MESSENGER_BROWSER_LAUNCHER }.flatMap { it.methods }.flatMap { method ->
        val code = method.implementation?.instructions?.toList().orEmpty()
        (0 until (code.size - 2).coerceAtLeast(0)).mapNotNull { at ->
            val key = code[at]
            if ((key.opcode != Opcode.CONST_STRING && key.opcode != Opcode.CONST_STRING_JUMBO) ||
                ((key as ReferenceInstruction).reference as? StringReference)?.string != "message_id") return@mapNotNull null
            val read = code[at + 1]
            val field = (read as? ReferenceInstruction)?.reference as? FieldReference
            if (read.opcode != Opcode.IGET_OBJECT || field == null || field.definingClass != MESSAGE ||
                field.type != "Ljava/lang/String;") return@mapNotNull null
            val put = code[at + 2] as? FiveRegisterInstruction
            if (code[at + 2].opcode != Opcode.INVOKE_VIRTUAL || put == null ||
                ((put as ReferenceInstruction).reference as? MethodReference)?.toString() != JSON_PUT ||
                put.registerCount != 3 || put.registerD != (key as OneRegisterInstruction).registerA ||
                put.registerE != (read as TwoRegisterInstruction).registerA) return@mapNotNull null
            fieldId(field)
        }
    }.distinct()

/** Static, public, (Message)Z, and all it reads is one long field of the message, compared with 0. */
private fun Method.isUnsentCheck(): Boolean {
    if (!AccessFlags.STATIC.isSet(accessFlags) || !AccessFlags.PUBLIC.isSet(accessFlags) || returnType != "Z" ||
        parameterTypes.map { it.toString() } != listOf(MESSAGE)) return false
    val code = implementation?.instructions?.toList().orEmpty()
    // Opcode.name is the smali spelling, so match on the reference: the one field the check touches.
    val touches = code.filter { (it as? ReferenceInstruction)?.reference is FieldReference }
    val field = touches.singleOrNull()?.takeIf { it.opcode == Opcode.IGET_WIDE }
        ?.let { (it as ReferenceInstruction).reference as FieldReference }
    return field != null && field.definingClass == MESSAGE && field.type == "J" && code.count { it.opcode == Opcode.CMP_LONG } == 1
}

/**
 * The (Message)Z checks the notification manager calls in the method that logs [UNSEND_RETRACTION], cut down to the
 * one shaped like an unsent check, in a public class the notification can call into.
 */
internal fun findUnsentChecks(classes: Iterable<ClassDef>): List<String> {
    val manager = classes.firstOrNull { it.type == MESSAGES_NOTIFICATION_MANAGER } ?: return emptyList()
    val called = manager.methods.filter { UNSEND_RETRACTION in it.stringRefs() }.flatMap { method ->
        method.implementation?.instructions?.toList().orEmpty()
            .filter { it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_STATIC_RANGE }
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .filter { it.returnType == "Z" && it.parameterTypes.map { type -> type.toString() } == listOf(MESSAGE) }
            .map { it.toString() }
    }.toSet()
    val owners = called.map { it.substringBefore("->") }.toSet()
    return classes.filter { it.type in owners && AccessFlags.PUBLIC.isSet(it.accessFlags) }
        .flatMap { it.methods }.filter { it.hookId() in called && it.isUnsentCheck() }.map { it.hookId() }.distinct()
}

/** Whether the class declares [fieldId] as a field code in [reader] may read: public, or non-private in its package. */
private fun ClassDef.declaresReadable(fieldId: String, reader: String): Boolean {
    val field = fields.firstOrNull { fieldId(it) == fieldId } ?: return false
    fun pkg(type: String) = type.substringBeforeLast('/')
    return AccessFlags.PUBLIC.isSet(field.accessFlags) ||
        (!AccessFlags.PRIVATE.isSet(field.accessFlags) && pkg(type) == pkg(reader))
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
 * At the constructor's start, before the super call, the hook reads the incoming message's id, text and thread from the
 * parameter object (never the one being built), and hands them to the extension off Messenger's own thread. Off, Pause
 * and safe mode read nothing: the extension's gate is checked first, so the text is never even loaded. An unsent
 * message is skipped, since its text is only Messenger's stand-in, and so is one whose text Messenger hid.
 *
 * The constructor has only two free registers, so the id goes over first, on its own, and the sink picks it up on the
 * same thread. Every path to a sink passes its own handover first, so a sink can't get an earlier message's id.
 */
internal fun MutableMethod.injectMessageLog() = injectIncomingMessage("$SETTINGS->logReceivedMessages()Z",
    "$SETTINGS->recordReceivedMessage(Ljava/lang/String;Ljava/lang/String;)V")

/**
 * Auto reply reads the same message at the same constructor, behind its own gate, so either control works without the
 * other. When both are in, each block runs its own gate and reads the fields itself.
 */
internal fun MutableMethod.injectAutoReply() = injectIncomingMessage("$SETTINGS->autoReplyWanted()Z",
    "$SETTINGS->autoReplyTo(Ljava/lang/String;Ljava/lang/String;)V")

/** [gate] and [sink] are whole references, so the patcher DEX holds each as one string the catalog check can find. */
private fun MutableMethod.injectIncomingMessage(gate: String, sink: String) {
    validateMessageLog()
    val contract = messageLogContract!!
    addInstructionsWithLabels(0, """
        invoke-static {}, $gate
        move-result v0
        if-eqz v0, :stock_behavior
        move-object/from16 v0, p2
        if-eqz v0, :stock_behavior
        invoke-static {v0}, ${contract.unsentCheck}
        move-result v1
        if-nez v1, :stock_behavior
        iget-boolean v1, v0, ${contract.hiddenField}
        if-nez v1, :stock_behavior
        iget-object v1, v0, ${contract.messageIdField}
        invoke-static {v1}, $SETTINGS->incomingMessageId(Ljava/lang/String;)V
        iget-object v1, v0, ${contract.bodyField}
        if-eqz v1, :stock_behavior
        iget-object v1, v1, ${contract.secretField}
        iget-object v0, v0, ${contract.threadKeyField}
        if-eqz v0, :incoming_no_thread
        invoke-virtual {v0}, $THREAD_KEY_TYPE->toString()Ljava/lang/String;
        move-result-object v0
        goto :incoming_hand_over
        :incoming_no_thread
        const/4 v0, 0x0
        :incoming_hand_over
        invoke-static {v1, v0}, $sink
    """.trimIndent(), ExternalLabel("stock_behavior", getInstruction(0)))
}

/** Shared by Keep a message log and Keep unsent messages, the way story_ring is shared. */
internal const val UNSENT_RECALL = "unsent_recall"
private const val NOTIFICATION_RECALLER = "NotificationRecaller"
private val UNSENT_RECALL_PARAMETERS = listOf(BUBBLE_SESSION, "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;")
private const val UNSENT_RECALL_SINK = "$SETTINGS->unsentRecall(Ljava/lang/String;)Z"

/**
 * Messenger's notification recaller: the one instance (session, message id, push id, offline id)Z method that takes an
 * unsent message out of its chat's notification. Plain unsends reach it from the notification manager, and encrypted
 * one-to-one unsends from the Minos unsend handler, so it covers the chats Keep unsent messages can't reach in the
 * chat itself. Its log tag is the only name it keeps across builds.
 */
internal fun findUnsentRecall(classes: Iterable<ClassDef>): List<Method> =
    listOfNotNull(classes.flatMap { it.methods }.filter { it.isUnsentRecall() }.singleOrNull())

private fun Method.isUnsentRecall(): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "Z" ||
        parameterTypes.map(CharSequence::toString) != UNSENT_RECALL_PARAMETERS) return false
    return implementation?.instructions?.any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == NOTIFICATION_RECALLER
    } == true
}

/** The other control sharing the hook already put it in. */
private fun MutableMethod.unsentRecallRouted() =
    ((implementation?.instructions?.firstOrNull() as? ReferenceInstruction)?.reference as? MethodReference)?.toString() == UNSENT_RECALL_SINK

internal fun MutableMethod.validateUnsentRecall() {
    if (!isUnsentRecall()) throw PatchException("Messenger controls: ${hookId()} isn't the notification recaller")
    validateScratch()
}

/**
 * Before Messenger takes an unsent message out of its notification, the extension gets the message's id: the message
 * log marks that message Unsent, and with Keep unsent messages on the method returns true at once, as if it had taken
 * it out, so the notification keeps showing it. The id is p2 of the instance method, read with a range call since it
 * sits past v15. The second control to claim the hook finds it in and leaves it.
 */
internal fun MutableMethod.injectUnsentRecall() {
    validateUnsentRecall()
    if (unsentRecallRouted()) return
    addInstructionsWithLabels(0, """
        invoke-static/range {p2 .. p2}, $UNSENT_RECALL_SINK
        move-result v0
        if-eqz v0, :stock_behavior
        const/4 v0, 0x1
        return v0
    """.trimIndent(), ExternalLabel("stock_behavior", getInstruction(0)))
}

/** The recaller's other way out, shared by the same two controls. */
internal const val UNSENT_CLEAR = "unsent_clear"
private const val UNSEND_CLEAR_REASON = "UnsendMessage"
private const val RECALLED_BY_CLEARING = "new_message_notification_recalled_by_clearing"
private val CLEAR_THREAD_PARAMETERS = listOf(BUBBLE_SESSION, THREAD_KEY_TYPE, "Ljava/lang/String;")
private val DROP_LOG_PARAMETERS = listOf(MESSAGES_NOTIFICATION_MANAGER, "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;")
private val STRING_LOADS = setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO)
private val STATIC_INVOKES = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)

/**
 * Where the notification manager clears a chat's notification for an unsend: [reason] is the "UnsendMessage" load
 * into [reasonRegister], the clear call follows it, and [idRegister] holds the unsent message's id there.
 */
private class UnsentClearSite(val reason: Int, val reasonRegister: Int, val idRegister: Int)

private fun Instruction.argumentRegisters(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> emptyList()
}

private fun Instruction.invokes(definingClass: String?, parameters: List<String>, returnType: String): Boolean {
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return (definingClass == null || reference.definingClass == definingClass) && reference.returnType == returnType &&
        reference.parameterTypes.map(CharSequence::toString) == parameters
}

private fun Instruction.writes(register: Int) = opcode.setsRegister() && this is OneRegisterInstruction &&
    (registerA == register || (opcode.setsWideRegister() && registerA + 1 == register))

/**
 * When the unsent message is the only one its chat's notification shows, the notification manager never asks the
 * recaller: it loads "UnsendMessage" and calls its own (session, thread, reason)V clear, which takes the whole
 * notification away (#70). The id is the register the same method hands the recaller as its message id, and
 * Messenger's own drop log after the clear, in the same block, prints that register as the messageId with nothing
 * writing it between.
 */
private fun Method.unsentClearSite(): UnsentClearSite? {
    if (definingClass != MESSAGES_NOTIFICATION_MANAGER || RECALLED_BY_CLEARING !in stringRefs()) return null
    val code = implementation?.instructions?.toList() ?: return null
    val reasons = code.indices.filter { at ->
        val load = code[at]
        load.opcode in STRING_LOADS && ((load as ReferenceInstruction).reference as StringReference).string == UNSEND_CLEAR_REASON &&
            code.getOrNull(at + 1)?.let { clear ->
                clear.invokes(MESSAGES_NOTIFICATION_MANAGER, CLEAR_THREAD_PARAMETERS, "V") &&
                    clear.argumentRegisters().lastOrNull() == (load as OneRegisterInstruction).registerA
            } == true
    }
    val reason = reasons.singleOrNull() ?: return null
    // A jump straight to the load or the clear would pass the hook by.
    if (jumpTargets().let { reason in it || reason + 1 in it }) return null
    val recalls = code.filter { it.opcode !in STATIC_INVOKES && it.invokes(null, UNSENT_RECALL_PARAMETERS, "Z") }
    val id = recalls.singleOrNull()?.argumentRegisters()?.getOrNull(2) ?: return null
    val blockEnd = (reason + 2 until code.size).firstOrNull { !code[it].opcode.canContinue() } ?: return null
    val log = (reason + 2 until blockEnd).filter {
        code[it].opcode in STATIC_INVOKES && code[it].invokes(MESSAGES_NOTIFICATION_MANAGER, DROP_LOG_PARAMETERS, "V")
    }.singleOrNull() ?: return null
    if (code[log].argumentRegisters().getOrNull(2) != id || (reason until log).any { code[it].writes(id) }) return null
    return UnsentClearSite(reason, (code[reason] as OneRegisterInstruction).registerA, id)
}

/** The notification manager's one method with that clear. */
internal fun findUnsentClear(classes: Iterable<ClassDef>): List<Method> =
    listOfNotNull(classes.firstOrNull { it.type == MESSAGES_NOTIFICATION_MANAGER }?.methods
        ?.filter { it.unsentClearSite() != null }?.singleOrNull())

/** The other control sharing the hook already put it in. */
private fun MutableMethod.unsentClearRouted() = implementation?.instructions?.any {
    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.toString() == UNSENT_RECALL_SINK
} == true

internal fun MutableMethod.validateUnsentClear() {
    if (!unsentClearRouted() && unsentClearSite() == null) {
        throw PatchException("Messenger controls: ${hookId()} isn't the notification manager's unsend clear")
    }
}

/**
 * Before the clear, the extension gets the message's id the way the recaller hook hands it over. When it keeps the
 * message, the reason is loaded as stock loads it and only the clear call is skipped, so every register leaves the
 * block as it would have. The id is read with a range call, which takes any register.
 */
internal fun MutableMethod.injectUnsentClear() {
    validateUnsentClear()
    if (unsentClearRouted()) return
    val site = unsentClearSite()!!
    val reason = "v${site.reasonRegister}"
    addInstructionsWithLabels(site.reason, """
        invoke-static/range {v${site.idRegister} .. v${site.idRegister}}, $UNSENT_RECALL_SINK
        move-result $reason
        if-eqz $reason, :stock_clear
        const-string $reason, "$UNSEND_CLEAR_REASON"
        goto :unsent_kept
    """.trimIndent(), ExternalLabel("stock_clear", getInstruction(site.reason)),
        ExternalLabel("unsent_kept", getInstruction(site.reason + 2)))
}
