/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.notifications

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.parameterRegister
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val NON_CONTACTS = "$EXTENSION_PACKAGE/misc/NonContacts;"
internal const val SILENCED = "$NON_CONTACTS->silenced(Ljava/lang/Object;)Z"
internal const val NOTIFICATIONS = "Lorg/telegram/messenger/NotificationsController;"
internal const val MESSAGE_OBJECT = "Lorg/telegram/messenger/MessageObject;"
internal const val TL_USER = "Lorg/telegram/tgnet/TLRPC\$User;"
private const val MESSAGES = "Lorg/telegram/messenger/MessagesController;"
internal const val SILENT_FLAG = "Lorg/telegram/tgnet/TLRPC\$Message;->silent:Z"

@Suppress("unused")
val silenceNonContactsPatch = bytecodePatch(
    name = "Silence people outside your contacts",
    description = "Shows notifications from people who aren't in your contacts without sound or vibration. Bots, " +
        "reminders and login codes keep their sound. Starts off. Turn it on in HushTelegram settings > Chats.",
    default = true,
) {
    category("Notifications")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val check = resolveSilenceNonContacts()
        // Assembled on a copy first, so a refusal leaves the app untouched.
        insertSilenced(MutableMethod(ImmutableMethod.of(check)))
        writeStub(NON_CONTACTS, "dialog", 3, """
            check-cast p0, $MESSAGE_OBJECT
            invoke-virtual {p0}, $MESSAGE_OBJECT->getDialogId()J
            move-result-wide v0
            return-wide v0
        """)
        writeStub(NON_CONTACTS, "user", 4, """
            check-cast p0, $MESSAGE_OBJECT
            iget v0, p0, $MESSAGE_OBJECT->currentAccount:I
            invoke-static {v0}, $MESSAGES->getInstance(I)$MESSAGES
            move-result-object v0
            invoke-virtual {p0}, $MESSAGE_OBJECT->getDialogId()J
            move-result-wide v1
            invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
            move-result-object v1
            invoke-virtual {v0, v1}, $MESSAGES->getUser(Ljava/lang/Long;)$TL_USER
            move-result-object v0
            return-object v0
        """)
        for (flag in listOf("contact", "bot", "self")) {
            writeStub(NON_CONTACTS, flag, 2, """
                check-cast p0, $TL_USER
                iget-boolean v0, p0, $TL_USER->$flag:Z
                return v0
            """)
        }
        insertSilenced(check)
        enableStatus("silenceNonContacts")
    }
}

/** A stranger's message counts as silent before Telegram looks at the sender's own silent flag. */
internal fun insertSilenced(target: MutableMethod) {
    val (silenced) = target.freeLocalsAt("Silence people outside your contacts", 0, 1)
    target.addInstructionsWithLabels(0, """
        invoke-static {${target.parameterRegister(0)}}, $SILENCED
        move-result v$silenced
        if-eqz v$silenced, :hush_stock
        const/4 v$silenced, 0x1
        return v$silenced
    """, ExternalLabel("hush_stock", target.getInstruction(0)))
}

/**
 * NotificationsController.isSilentMessage(message) decides whether a notification plays its sound:
 * a message sent without sound, or a reaction. The person behind a private chat comes from
 * MessagesController.getUser, and TLRPC.User says whether they're a contact, a bot or you.
 */
internal fun BytecodePatchContext.resolveSilenceNonContacts(): MutableMethod {
    requireStatusMethod("silenceNonContacts")
    controlHook(NON_CONTACTS, "silenced", listOf("Ljava/lang/Object;"), "Z")
    controlHook(NON_CONTACTS, "dialog", listOf("Ljava/lang/Object;"), "J")
    controlHook(NON_CONTACTS, "user", listOf("Ljava/lang/Object;"), "Ljava/lang/Object;")
    for (flag in listOf("contact", "bot", "self")) controlHook(NON_CONTACTS, flag, listOf("Ljava/lang/Object;"), "Z")

    val notifications = mutableClassDefByOrNull(NOTIFICATIONS)
    controlShape(notifications != null, "NotificationsController is missing")
    val check = notifications!!.methods.filter { it.name == "isSilentMessage" && it.parameterTypes == listOf(MESSAGE_OBJECT) &&
        it.returnType == "Z" && !AccessFlags.STATIC.isSet(it.accessFlags) }.controlSingle("silent notification check")
    controlShape(check.controlBody().any { it.controlRef() == SILENT_FLAG }, "the silent notification check no longer reads the sender's flag")
    controlShape(ControlFlow.of(check).normal.none { 0 in it }, "something jumps back to the start of the silent notification check")

    val message = classDefByOrNull(MESSAGE_OBJECT)
    controlShape(message != null && message.fields.any { it.name == "currentAccount" && it.type == "I" && !AccessFlags.STATIC.isSet(it.accessFlags) } &&
        message.methods.any { it.name == "getDialogId" && it.parameterTypes.isEmpty() && it.returnType == "J" && AccessFlags.PUBLIC.isSet(it.accessFlags) },
        "a message no longer says which chat and account it belongs to")
    val messages = classDefByOrNull(MESSAGES)
    controlShape(messages != null && messages.methods.any { it.name == "getInstance" && it.parameterTypes == listOf("I") && it.returnType == MESSAGES } &&
        messages.methods.any { it.name == "getUser" && it.parameterTypes == listOf("Ljava/lang/Long;") && it.returnType == TL_USER && AccessFlags.PUBLIC.isSet(it.accessFlags) },
        "MessagesController no longer looks up a user by ID")
    val user = classDefByOrNull(TL_USER)
    controlShape(user != null && listOf("contact", "bot", "self").all { flag -> user.fields.any { it.name == flag && it.type == "Z" && !AccessFlags.STATIC.isSet(it.accessFlags) } },
        "a Telegram user no longer says whether they're a contact, a bot or you")
    return check
}
