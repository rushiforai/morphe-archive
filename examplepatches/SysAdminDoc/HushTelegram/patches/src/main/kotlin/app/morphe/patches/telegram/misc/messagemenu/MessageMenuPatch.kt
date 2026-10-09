/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireParameterIntact
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.forward.FORWARDS
import app.morphe.patches.telegram.misc.forward.IS_PREMIUM
import app.morphe.patches.telegram.misc.forward.MESSAGE_TYPE
import app.morphe.patches.telegram.misc.forward.NAME_HIDE
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlCall
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val MESSAGE_MENU = "$EXTENSION_PACKAGE/misc/MessageMenu;"
internal const val FILL = "$MESSAGE_MENU->fill(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V"
internal const val CHOSEN = "$MESSAGE_MENU->chosen(Ljava/lang/Object;I)V"
internal const val FORWARD_SEND = "Lorg/telegram/messenger/SendMessagesHelper;->sendMessage(Ljava/util/ArrayList;JZZZIILorg/telegram/messenger/MessageObject;IJJLorg/telegram/messenger/MessageSuggestionParams;)I"
internal const val FORWARD_LABEL = "Lorg/telegram/messenger/R\$string;->Forward:I"
private const val CANCEL_SENDING = "Lorg/telegram/messenger/R\$string;->CancelSending:I"
private const val MESSAGE = "Lorg/telegram/messenger/MessageObject;"
private const val GROUPED = "Lorg/telegram/messenger/MessageObject\$GroupedMessages;"
private const val TL_MESSAGE = "Lorg/telegram/tgnet/TLRPC\$Message;"
private const val FWD_HEADER = "Lorg/telegram/tgnet/TLRPC\$MessageFwdHeader;"
private const val MEDIA = "Lorg/telegram/tgnet/TLRPC\$MessageMedia;"
private const val PHOTO = "Lorg/telegram/tgnet/TLRPC\$Photo;"
private const val PHOTO_SIZE = "Lorg/telegram/tgnet/TLRPC\$PhotoSize;"
private const val DOCUMENT = "Lorg/telegram/tgnet/TLRPC\$Document;"
private const val PEER = "Lorg/telegram/tgnet/TLRPC\$Peer;"
private const val TL_CHAT = "Lorg/telegram/tgnet/TLRPC\$Chat;"
private const val TL_USER = "Lorg/telegram/tgnet/TLRPC\$User;"
private const val ACTION = "Lorg/telegram/tgnet/TLRPC\$MessageAction;"
private const val PAID_MEDIA = "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaPaidMedia;"
private const val ACTION_EMPTY = "Lorg/telegram/tgnet/TLRPC\$TL_messageActionEmpty;"
private const val CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
private const val CHAT_OBJECT = "Lorg/telegram/messenger/ChatObject;"
private const val USER_OBJECT = "Lorg/telegram/messenger/UserObject;"
private const val DIALOG_OBJECT = "Lorg/telegram/messenger/DialogObject;"
private const val ACCOUNT_CONFIG = "Lorg/telegram/messenger/UserConfig;"
private const val SEND_HELPER = "Lorg/telegram/messenger/SendMessagesHelper;"
private const val TL_DIALOG = "Lorg/telegram/tgnet/TLRPC\$Dialog;"
private const val LOCALE = "Lorg/telegram/messenger/LocaleController;"
private const val STRINGS = "Lorg/telegram/messenger/R\$string;"
private const val STRING = "Ljava/lang/String;"
private const val DRAWABLES = "Lorg/telegram/messenger/R\$drawable;"
private const val ADD_TO_LIST = "Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z"
private const val LIST = "Ljava/util/ArrayList;"
private const val OBJECT = "Ljava/lang/Object;"
private const val ACTIVITY = "Landroid/app/Activity;"
private const val CONTEXT = "Landroid/content/Context;"
private const val FILE = "Ljava/io/File;"
private const val URI = "Landroid/net/Uri;"
private const val FILE_LOADER = "Lorg/telegram/messenger/FileLoader;"
internal const val APPLICATION_ID = "Lorg/telegram/messenger/ApplicationLoader;->getApplicationId()Ljava/lang/String;"
private const val NAME = "Add Repeat to the message menu"

/** The extension's option numbers, Repeat, Message details, Copy photo and Quick forward, which Telegram's own may never use. */
internal val MENU_OPTIONS = listOf(0x48544d01, 0x48544d02, 0x48544d03, 0x48544d04)
private val COMPARES = setOf(Opcode.IF_EQ, Opcode.IF_NE)
private val MOVES = setOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_WIDE, Opcode.MOVE_WIDE_FROM16)

@Suppress("unused")
val messageMenuPatch = bytecodePatch(
    name = NAME,
    description = "Adds switches, off by default, for a message's long-press menu. Repeat sends the message again to the same chat as a new message from you. Copy photo puts a downloaded photo on the clipboard, and Message details shows the message's IDs and times, plus the file's data center and size. Quick forward lists a few recent chats to forward to in one tap.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveMessageMenu()
        // Assembled on copies first, so a refusal leaves the app untouched.
        site.insertFill(MutableMethod(ImmutableMethod.of(site.fill)))
        site.insertChosen(MutableMethod(ImmutableMethod.of(site.choose)))
        writeMessageMenuStubs(site)
        site.insertFill(site.fill)
        site.insertChosen(site.choose)
        enableStatus("messageMenuRepeat")
    }
}

/**
 * The chat screen's menu builder [fill], its choice handler [choose], Telegram's own forward into
 * the open chat [forward], the fields holding the selected message and its album, the chat's
 * activity getter, Telegram's file provider, and the numbers Telegram gives Forward and article
 * messages.
 */
internal class MessageMenuSite(
    val chat: String, val fill: MutableMethod, val choose: MutableMethod, val forward: Method, val activity: String,
    val provider: String, val selected: FieldReference, val group: FieldReference, val forwardOption: Int, val article: Int,
) {
    /** The extension adds its items as the builder returns; the branches to that return land on it too. */
    fun insertFill(target: MutableMethod) {
        val first = target.implementation!!.registerCount - 5
        target.addInstructionsAtControlFlowLabel(target.implementation!!.instructions.size - 1,
            "invoke-static/range {v$first .. v${first + 4}}, $FILL")
    }

    /** The extension sees the chosen number first; Telegram's switch passes the extension's numbers by. */
    fun insertChosen(target: MutableMethod) {
        val first = target.implementation!!.registerCount - 2
        target.addInstructions(0, "invoke-static/range {v$first .. v${first + 1}}, $CHOSEN")
    }
}

/**
 * ChatActivity.fillMessageMenu(primary, icons, items, options) fills the long-press menu's three
 * lists, Forward through a helper that adds the label and the option number. processSelectedOption
 * switches on the chosen number and, past the switch, clears the selection and closes the menu.
 * forwardMessages(messages, fromMyName, hideCaption, notify, scheduleDate, payStars) is what the
 * chat's forward panel sends with, slow mode, the open topic and paid messages included.
 */
internal fun BytecodePatchContext.resolveMessageMenu(): MessageMenuSite {
    requireStatusMethod("messageMenuRepeat")
    controlHook(MESSAGE_MENU, "fill", listOf(OBJECT, OBJECT, LIST, LIST, LIST), "V")
    controlHook(MESSAGE_MENU, "chosen", listOf(OBJECT, "I"), "V")
    controlHook(MESSAGE_MENU, "selected", listOf(OBJECT), OBJECT)
    controlHook(MESSAGE_MENU, "grouped", listOf(OBJECT), LIST)
    controlHook(MESSAGE_MENU, "send", listOf(OBJECT, LIST), "V")
    controlHook(MESSAGE_MENU, "activity", listOf(OBJECT), ACTIVITY)
    for (name in listOf("forwardOption", "article", "quickIcon", "repeatIcon", "copyIcon", "detailsIcon")) controlHook(MESSAGE_MENU, name, listOf(), "I")
    controlHook(MESSAGE_MENU, "account", listOf(OBJECT), "I")
    controlHook(MESSAGE_MENU, "selfId", listOf("I"), "J")
    controlHook(MESSAGE_MENU, "dialogs", listOf("I"), LIST)
    controlHook(MESSAGE_MENU, "dialogId", listOf(OBJECT), "J")
    controlHook(MESSAGE_MENU, "secret", listOf("J"), "Z")
    controlHook(MESSAGE_MENU, "reachable", listOf("I", "J"), "Z")
    controlHook(MESSAGE_MENU, "title", listOf("I", "J"), STRING)
    controlHook(MESSAGE_MENU, "forwardTo", listOf("I", LIST, "J", "Z"), "I")
    for (name in listOf("canSend", "blocked", "premium", "forwarded", "photo")) controlHook(MESSAGE_MENU, name, listOf(OBJECT), "Z")
    for (name in listOf("type", "id", "date", "edited", "forwardDate", "fileDc", "photoSize")) controlHook(MESSAGE_MENU, name, listOf(OBJECT), "I")
    for (name in listOf("dialog", "sender", "forwardFrom", "documentSize")) controlHook(MESSAGE_MENU, name, listOf(OBJECT), "J")
    for (name in listOf("forwardName", "attachPath")) controlHook(MESSAGE_MENU, name, listOf(OBJECT), "Ljava/lang/String;")
    controlHook(MESSAGE_MENU, "photoSizes", listOf(OBJECT), LIST)
    controlHook(MESSAGE_MENU, "photoFile", listOf(OBJECT), FILE)
    controlHook(MESSAGE_MENU, "uri", listOf(CONTEXT, FILE), URI)

    // One pass over the app: the builder, the only method taking a message and three lists with
    // Telegram's Forward and Cancel sending labels, and the Premium gate on hiding an article's sender.
    val builders = mutableListOf<Pair<String, String>>()
    val articles = mutableSetOf<Int>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
        cls.methods.forEach { m ->
            val body = m.controlBody()
            if (!AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" &&
                m.parameterTypes.map(CharSequence::toString) == listOf(MESSAGE, LIST, LIST, LIST) &&
                body.any { it.controlRef() == FORWARD_LABEL } && body.any { it.controlRef() == CANCEL_SENDING }) builders += cls.type to signature(m)
            val premium = body.indexOfFirst { it.controlRef() == IS_PREMIUM }
            if (premium < 0 || body.none { it.controlRef() == FORWARDS } || body.none { it.controlRef() == NAME_HIDE }) return@forEach
            for (i in premium until body.size - 2) {
                val literal = body[i + 1] as? NarrowLiteralInstruction ?: continue
                if (body[i].controlRef() == MESSAGE_TYPE && body[i + 2].opcode in COMPARES) articles += literal.narrowLiteral
            }
        }
    }
    val article = articles.toList().controlSingle("the Premium gate on hiding an article's sender")
    val (chat, wanted) = builders.controlSingle("message menu builder")
    val chatClass = mutableClassDefBy(chat)
    controlShape(AccessFlags.PUBLIC.isSet(chatClass.accessFlags), "the chat screen is inaccessible")
    val fill = chatClass.methods.single { signature(it) == wanted }
    val built = fill.controlBody()
    val end = built.size - 1
    controlShape(built[end].opcode == Opcode.RETURN_VOID && built.count { it.opcode == Opcode.RETURN_VOID } == 1,
        "the message menu builder no longer ends in its one return")
    fill.requireThisIntact(NAME, listOf(end))
    for (i in 0..3) fill.requireParameterIntact(NAME, i, listOf(end))
    controlShape(built.none { (it as? NarrowLiteralInstruction)?.narrowLiteral in MENU_OPTIONS }, "the message menu already uses the extension's numbers")

    // Forward goes in through a helper taking the label, the option number and two of the lists.
    val label = built.indices.filter { built[it].controlRef() == FORWARD_LABEL }.controlSingle("Forward label")
    val option = built.getOrNull(label + 1) as? NarrowLiteralInstruction
    val add = built.getOrNull(label + 2)
    val helper = add?.controlCall()
    controlShape(built[label].opcode == Opcode.SGET && option != null && built[label + 1].opcode in setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST) &&
        add != null && add.opcode == Opcode.INVOKE_STATIC && helper != null &&
        helper.parameterTypes.map(CharSequence::toString) == listOf("I", "I", LIST, LIST) && helper.returnType == "V" &&
        add.namedRegisters().take(2) == listOf((built[label] as OneRegisterInstruction).registerA, (option as OneRegisterInstruction).registerA),
        "Forward no longer goes into the menu with its number")
    val helperMethod = classDefByOrNull(helper!!.definingClass)?.methods?.singleOrNull { signature(it) == helper.toString() }
    val helperBody = helperMethod?.controlBody().orEmpty()
    val base = (helperMethod?.implementation?.registerCount ?: 0) - 4
    controlShape(helperMethod != null && AccessFlags.STATIC.isSet(helperMethod.accessFlags) && helperBody.map { it.opcode } == listOf(
        Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT,
        Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID) &&
        helperBody[0].controlRef() == "Lorg/telegram/messenger/LocaleController;->getString(I)Ljava/lang/String;" &&
        helperBody[0].namedRegisters() == listOf(base) && helperBody[2].controlRef() == ADD_TO_LIST &&
        helperBody[2].namedRegisters().first() == base + 2 &&
        helperBody[3].controlRef() == "Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;" && helperBody[3].namedRegisters() == listOf(base + 1) &&
        helperBody[5].controlRef() == ADD_TO_LIST && helperBody[5].namedRegisters() == listOf(base + 3, helperBody[4].namedRegisters().single()),
        "the menu's label helper changed")
    val forwardOption = option!!.narrowLiteral

    // The selected message and its album, as the builder reads them.
    val selected = built.firstOrNull { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.let { f -> f.definingClass == chat && f.type == MESSAGE } == true }?.controlField()
    val group = built.firstOrNull { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.let { f -> f.definingClass == chat && f.type == GROUPED } == true }?.controlField()
    controlShape(selected != null && group != null, "the message menu builder no longer reads the selected message and its album")
    for (field in listOf(selected!!, group!!)) {
        val declared = chatClass.fields.filter { it.name == field.name && it.type == field.type }.controlSingle("${field.name} field")
        controlShape(AccessFlags.PUBLIC.isSet(declared.accessFlags) && !AccessFlags.STATIC.isSet(declared.accessFlags), "${field.name} is inaccessible")
    }

    // The choice handler: a switch on the number that starts from the selected message and clears its album after.
    val choose = chatClass.methods.filter { m ->
        !AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" && m.parameterTypes.map(CharSequence::toString) == listOf("I") &&
            m.controlBody().let { body -> body.any { it.opcode == Opcode.PACKED_SWITCH || it.opcode == Opcode.SPARSE_SWITCH } && body.any { it.controlString() == "hasInvoice" } }
    }.controlSingle("message menu choice")
    val chosen = choose.controlBody()
    controlShape(chosen.firstOrNull { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.type == MESSAGE }?.controlField().toString() == selected.toString(),
        "the menu choice no longer starts from the selected message")
    controlShape(chosen.any { it.opcode == Opcode.IPUT_OBJECT && it.controlField().toString() == group.toString() }, "the menu choice no longer clears the selected album")
    val cases = chosen.filterIsInstance<SwitchPayload>().flatMap { it.switchElements.map { e -> e.key } }
    controlShape(forwardOption in cases && cases.none { it in MENU_OPTIONS }, "the menu choice's numbers changed")
    controlShape(ControlFlow.of(choose).normal.none { 0 in it }, "something jumps back to the start of the menu choice")

    // The chat's activity, through the getter the choice handler itself uses.
    val activity = chosen.mapNotNull { it.controlCall() }.firstOrNull { it.name == "getParentActivity" && it.parameterTypes.isEmpty() && it.returnType == ACTIVITY }
    val activityOwner = activity?.let { classDefByOrNull(it.definingClass) }
    controlShape(activityOwner != null && AccessFlags.PUBLIC.isSet(activityOwner.accessFlags) && activityOwner.methods.any {
        signature(it) == activity.toString() && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
    }, "the chat screen no longer has its activity")

    // Telegram's file provider, which the choice handler's Share hands its files to under the app's ".provider" authority.
    val provider = chosen.mapNotNull { it.controlCall() }.filter { it.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT, "Ljava/lang/String;", FILE) && it.returnType == URI }
        .map { it.toString() }.distinct().controlSingle("Telegram's file provider")
    val providerOwner = classDefByOrNull(provider.substringBefore("->"))
    controlShape(providerOwner != null && AccessFlags.PUBLIC.isSet(providerOwner.accessFlags) && providerOwner.methods.any {
        signature(it) == provider && AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags)
    } && chosen.any { it.controlRef() == APPLICATION_ID } && chosen.any { it.controlString() == ".provider" }, "Telegram's file provider changed")

    // Telegram's forward into the open chat, which the extension calls with the sender hidden.
    val forward = chatClass.methods.filter { m ->
        !AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" && m.parameterTypes.map(CharSequence::toString) == listOf(LIST, "Z", "Z", "Z", "I", "J") &&
            m.controlBody().count { it.controlRef() == FORWARD_SEND } == 1
    }.controlSingle("forward into the open chat")
    controlShape(AccessFlags.PUBLIC.isSet(forward.accessFlags), "the forward into the open chat is inaccessible")
    requireForwardArguments(forward)

    requireHostMembers()
    return MessageMenuSite(chat, fill, choose, forward, activity.toString(), provider, selected, group, forwardOption, article)
}

/**
 * The send takes the messages, Hide sender's name, Hide captions, notify, the schedule date and the
 * stars straight from the method's own parameters, each moved in just before the call.
 */
private fun requireForwardArguments(forward: Method) {
    val body = forward.controlBody()
    val at = body.indexOfFirst { it.controlRef() == FORWARD_SEND }
    val call = body[at] as? RegisterRangeInstruction
    controlShape(call != null && call.registerCount == 16, "the forward into the open chat no longer sends in one call")
    val flow = ControlFlow.of(forward)
    val self = forward.implementation!!.registerCount - 8
    // The call's slot, and the declared parameter it must hold.
    for ((slot, parameter) in listOf(1 to 0, 4 to 1, 5 to 2, 6 to 3, 7 to 4, 11 to 5)) {
        val register = call!!.startRegister + slot
        val write = (at - 1 downTo 0).firstOrNull { i -> body[i].opcode.setsRegister() && (body[i] as? OneRegisterInstruction)?.registerA == register }
        val source = self + 1 + parameter
        controlShape(write != null && body[write].opcode in MOVES && body[write].namedRegisters() == listOf(register, source) &&
            (write + 1..at).all { i -> flow.normal.indices.filter { i in flow.normal[it] } == listOf(i - 1) } &&
            (write + 1 until at).none { j -> body[j].opcode.setsWideRegister() && (body[j] as? OneRegisterInstruction)?.registerA == register - 1 },
            "the forward's send no longer takes its argument $slot from the method")
        forward.requireParameterIntact(NAME, parameter, listOf(write!!))
    }
}

/** Every Telegram member the stubs reach, with the access and kind each call needs. */
private fun BytecodePatchContext.requireHostMembers() {
    fun members(type: String, vararg wanted: String) {
        val owner = classDefByOrNull(type)
        controlShape(owner != null && AccessFlags.PUBLIC.isSet(owner.accessFlags), "$type is missing")
        for (member in wanted) {
            val static = member.startsWith("static ")
            val name = member.removePrefix("static ")
            val ok = if ('(' in name) owner!!.methods.any { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == name &&
                AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) == static && !AccessFlags.ABSTRACT.isSet(it.accessFlags) }
            else owner!!.fields.any { "${it.name}:${it.type}" == name && AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) == static }
            controlShape(ok, "$type no longer has $member")
        }
    }
    members(MESSAGE, "messageOwner:$TL_MESSAGE", "type:I", "currentAccount:I", "scheduled:Z",
        "getId()I", "getDialogId()J", "getFromChatId()J", "getForwardedName()Ljava/lang/String;", "getDocument()$DOCUMENT",
        "isPoll()Z", "isTodo()Z", "isPhoto()Z", "isHiddenSensitive()Z", "static getPeerId($PEER)J", "static getMedia($MESSAGE)$MEDIA")
    members(GROUPED, "messages:$LIST")
    members(TL_MESSAGE, "date:I", "edit_date:I", "fwd_from:$FWD_HEADER", "action:$ACTION", "attachPath:Ljava/lang/String;")
    members(FILE_LOADER, "static getInstance(I)$FILE_LOADER", "getPathToMessage($TL_MESSAGE)$FILE")
    members("Lorg/telegram/messenger/ApplicationLoader;", "static getApplicationId()Ljava/lang/String;")
    members(FWD_HEADER, "date:I", "from_id:$PEER")
    members(MEDIA, "photo:$PHOTO")
    members(PHOTO, "dc_id:I", "sizes:$LIST")
    members(PHOTO_SIZE, "size:I")
    members(DOCUMENT, "dc_id:I", "size:J")
    members(PAID_MEDIA)
    members(ACTION_EMPTY)
    members(CONTROLLER, "static getInstance(I)$CONTROLLER", "getChat(Ljava/lang/Long;)$TL_CHAT", "getUser(Ljava/lang/Long;)$TL_USER", "getAllDialogs()$LIST")
    members(CHAT_OBJECT, "static isNotInChat($TL_CHAT)Z", "static canSendMessages($TL_CHAT)Z", "static isForum($TL_CHAT)Z", "static isMonoForum($TL_CHAT)Z")
    members(USER_OBJECT, "static isDeleted($TL_USER)Z", "static isReplyUser(J)Z", "static isService(J)Z", "static getUserName($TL_USER)$STRING")
    members(TL_CHAT, "title:$STRING")
    members(TL_DIALOG, "id:J")
    members(SEND_HELPER, "static getInstance(I)$SEND_HELPER", "sendMessage(${LIST}JZZZIJ)I")
    members(LOCALE, "static getString(I)$STRING")
    members(STRINGS, "static SavedMessages:I")
    members(DIALOG_OBJECT, "static isEncryptedDialog(J)Z")
    members(ACCOUNT_CONFIG, "static getInstance(I)$ACCOUNT_CONFIG", "isPremium()Z", "getClientUserId()J")
    members(DRAWABLES, "static msg_retry:I", "static msg_copy:I", "static msg_info:I", "static msg_forward:I")
}

/** The stubs' bodies, from the members [site] found. */
internal fun BytecodePatchContext.writeMessageMenuStubs(site: MessageMenuSite) {
    val chat = site.chat
    writeStub(MESSAGE_MENU, "selected", 2, """
        check-cast p0, $chat
        iget-object v0, p0, ${site.selected}
        return-object v0
    """)
    writeStub(MESSAGE_MENU, "grouped", 3, """
        check-cast p0, $chat
        iget-object v0, p0, ${site.group}
        if-nez v0, :hush_group
        const/4 v1, 0x0
        return-object v1
        :hush_group
        iget-object v1, v0, $GROUPED->messages:$LIST
        return-object v1
    """)
    // Hide sender's name on, captions kept, with sound, now, and no stars agreed yet: a chat that
    // charges for messages gets Telegram's own confirmation.
    writeStub(MESSAGE_MENU, "send", 10, """
        check-cast p0, $chat
        move-object v0, p0
        move-object v1, p1
        const/4 v2, 0x1
        const/4 v3, 0x0
        const/4 v4, 0x1
        const/4 v5, 0x0
        const-wide/16 v6, 0x0
        invoke-virtual/range {v0 .. v7}, ${signature(site.forward)}
        return-void
    """)
    writeStub(MESSAGE_MENU, "activity", 2, """
        check-cast p0, $chat
        invoke-virtual {p0}, ${site.activity}
        move-result-object v0
        return-object v0
    """)
    writeStub(MESSAGE_MENU, "forwardOption", 1, "const v0, ${site.forwardOption}\nreturn v0")
    writeStub(MESSAGE_MENU, "article", 1, "const v0, ${site.article}\nreturn v0")
    writeStub(MESSAGE_MENU, "quickIcon", 1, "sget v0, $DRAWABLES->msg_forward:I\nreturn v0")
    writeStub(MESSAGE_MENU, "repeatIcon", 1, "sget v0, $DRAWABLES->msg_retry:I\nreturn v0")
    writeStub(MESSAGE_MENU, "copyIcon", 1, "sget v0, $DRAWABLES->msg_copy:I\nreturn v0")
    writeStub(MESSAGE_MENU, "detailsIcon", 1, "sget v0, $DRAWABLES->msg_info:I\nreturn v0")
    // A photo that isn't kept behind the age filter.
    writeStub(MESSAGE_MENU, "photo", 2, """
        check-cast p0, $MESSAGE
        invoke-virtual {p0}, $MESSAGE->isPhoto()Z
        move-result v0
        if-eqz v0, :hush_no
        invoke-virtual {p0}, $MESSAGE->isHiddenSensitive()Z
        move-result v0
        if-nez v0, :hush_no
        const/4 v0, 0x1
        return v0
        :hush_no
        const/4 v0, 0x0
        return v0
    """)
    writeStub(MESSAGE_MENU, "attachPath", 2, """
        check-cast p0, $MESSAGE
        iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        iget-object v0, v0, $TL_MESSAGE->attachPath:Ljava/lang/String;
        return-object v0
    """)
    writeStub(MESSAGE_MENU, "photoFile", 3, """
        check-cast p0, $MESSAGE
        iget v0, p0, $MESSAGE->currentAccount:I
        invoke-static {v0}, $FILE_LOADER->getInstance(I)$FILE_LOADER
        move-result-object v0
        iget-object v1, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        invoke-virtual {v0, v1}, $FILE_LOADER->getPathToMessage($TL_MESSAGE)$FILE
        move-result-object v0
        return-object v0
    """)
    // The same authority Telegram's Share passes: the app's ID and ".provider".
    writeStub(MESSAGE_MENU, "uri", 4, """
        invoke-static {}, $APPLICATION_ID
        move-result-object v0
        const-string v1, ".provider"
        invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v0
        invoke-static {p0, v0, p1}, ${site.provider}
        move-result-object v0
        return-object v0
    """)
    // A secret chat never; a user who's real and reachable; a chat you're in that lets you write.
    writeStub(MESSAGE_MENU, "canSend", 6, """
        check-cast p0, $MESSAGE
        iget v0, p0, $MESSAGE->currentAccount:I
        invoke-static {v0}, $CONTROLLER->getInstance(I)$CONTROLLER
        move-result-object v0
        invoke-virtual {p0}, $MESSAGE->getDialogId()J
        move-result-wide v1
        invoke-static {v1, v2}, $DIALOG_OBJECT->isEncryptedDialog(J)Z
        move-result v3
        if-nez v3, :hush_no
        const-wide/16 v3, 0x0
        cmp-long v3, v1, v3
        if-gtz v3, :hush_user
        if-eqz v3, :hush_no
        neg-long v1, v1
        invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v1
        invoke-virtual {v0, v1}, $CONTROLLER->getChat(Ljava/lang/Long;)$TL_CHAT
        move-result-object v0
        if-eqz v0, :hush_no
        invoke-static {v0}, $CHAT_OBJECT->isNotInChat($TL_CHAT)Z
        move-result v1
        if-nez v1, :hush_no
        invoke-static {v0}, $CHAT_OBJECT->canSendMessages($TL_CHAT)Z
        move-result v1
        return v1
        :hush_user
        invoke-static {v1, v2}, $USER_OBJECT->isReplyUser(J)Z
        move-result v3
        if-nez v3, :hush_no
        invoke-static {v1, v2}, $USER_OBJECT->isService(J)Z
        move-result v3
        if-nez v3, :hush_no
        invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v1
        invoke-virtual {v0, v1}, $CONTROLLER->getUser(Ljava/lang/Long;)$TL_USER
        move-result-object v0
        if-eqz v0, :hush_no
        invoke-static {v0}, $USER_OBJECT->isDeleted($TL_USER)Z
        move-result v1
        if-nez v1, :hush_no
        const/4 v1, 0x1
        return v1
        :hush_no
        const/4 v1, 0x0
        return v1
    """)
    writeQuickForwardStubs()
    writeStub(MESSAGE_MENU, "blocked", 2, """
        check-cast p0, $MESSAGE
        invoke-virtual {p0}, $MESSAGE->getId()I
        move-result v0
        if-lez v0, :hush_yes
        iget-boolean v0, p0, $MESSAGE->scheduled:Z
        if-nez v0, :hush_yes
        invoke-virtual {p0}, $MESSAGE->isPoll()Z
        move-result v0
        if-nez v0, :hush_yes
        invoke-virtual {p0}, $MESSAGE->isTodo()Z
        move-result v0
        if-nez v0, :hush_yes
        invoke-virtual {p0}, $MESSAGE->isHiddenSensitive()Z
        move-result v0
        if-nez v0, :hush_yes
        invoke-static {p0}, $MESSAGE->getMedia($MESSAGE)$MEDIA
        move-result-object v0
        instance-of v0, v0, $PAID_MEDIA
        if-nez v0, :hush_yes
        iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        iget-object v0, v0, $TL_MESSAGE->action:$ACTION
        if-eqz v0, :hush_no
        instance-of v0, v0, $ACTION_EMPTY
        if-nez v0, :hush_no
        :hush_yes
        const/4 v0, 0x1
        return v0
        :hush_no
        const/4 v0, 0x0
        return v0
    """)
    writeStub(MESSAGE_MENU, "premium", 2, """
        check-cast p0, $MESSAGE
        iget v0, p0, $MESSAGE->currentAccount:I
        invoke-static {v0}, $ACCOUNT_CONFIG->getInstance(I)$ACCOUNT_CONFIG
        move-result-object v0
        invoke-virtual {v0}, $IS_PREMIUM
        move-result v0
        return v0
    """)
    writeStub(MESSAGE_MENU, "type", 2, "check-cast p0, $MESSAGE\niget v0, p0, $MESSAGE_TYPE\nreturn v0")
    writeStub(MESSAGE_MENU, "id", 2, "check-cast p0, $MESSAGE\ninvoke-virtual {p0}, $MESSAGE->getId()I\nmove-result v0\nreturn v0")
    for ((name, getter) in listOf("dialog" to "getDialogId", "sender" to "getFromChatId")) {
        writeStub(MESSAGE_MENU, name, 3, "check-cast p0, $MESSAGE\ninvoke-virtual {p0}, $MESSAGE->$getter()J\nmove-result-wide v0\nreturn-wide v0")
    }
    for ((name, field) in listOf("date" to "date", "edited" to "edit_date")) {
        writeStub(MESSAGE_MENU, name, 2, """
            check-cast p0, $MESSAGE
            iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
            iget v0, v0, $TL_MESSAGE->$field:I
            return v0
        """)
    }
    writeStub(MESSAGE_MENU, "forwarded", 2, """
        check-cast p0, $MESSAGE
        iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        iget-object v0, v0, $TL_MESSAGE->fwd_from:$FWD_HEADER
        if-eqz v0, :hush_none
        const/4 v0, 0x1
        return v0
        :hush_none
        const/4 v0, 0x0
        return v0
    """)
    writeStub(MESSAGE_MENU, "forwardName", 2, """
        check-cast p0, $MESSAGE
        invoke-virtual {p0}, $MESSAGE->getForwardedName()Ljava/lang/String;
        move-result-object v0
        return-object v0
    """)
    writeStub(MESSAGE_MENU, "forwardFrom", 4, """
        check-cast p0, $MESSAGE
        iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        iget-object v0, v0, $TL_MESSAGE->fwd_from:$FWD_HEADER
        if-eqz v0, :hush_none
        iget-object v0, v0, $FWD_HEADER->from_id:$PEER
        if-eqz v0, :hush_none
        invoke-static {v0}, $MESSAGE->getPeerId($PEER)J
        move-result-wide v1
        return-wide v1
        :hush_none
        const-wide/16 v1, 0x0
        return-wide v1
    """)
    writeStub(MESSAGE_MENU, "forwardDate", 2, """
        check-cast p0, $MESSAGE
        iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        iget-object v0, v0, $TL_MESSAGE->fwd_from:$FWD_HEADER
        if-eqz v0, :hush_none
        iget v0, v0, $FWD_HEADER->date:I
        return v0
        :hush_none
        const/4 v0, 0x0
        return v0
    """)
    writeStub(MESSAGE_MENU, "fileDc", 3, """
        check-cast p0, $MESSAGE
        invoke-virtual {p0}, $MESSAGE->getDocument()$DOCUMENT
        move-result-object v0
        if-eqz v0, :hush_photo
        iget v1, v0, $DOCUMENT->dc_id:I
        return v1
        :hush_photo
        invoke-static {p0}, $MESSAGE->getMedia($MESSAGE)$MEDIA
        move-result-object v0
        if-eqz v0, :hush_none
        iget-object v0, v0, $MEDIA->photo:$PHOTO
        if-eqz v0, :hush_none
        iget v1, v0, $PHOTO->dc_id:I
        return v1
        :hush_none
        const/4 v1, 0x0
        return v1
    """)
    writeStub(MESSAGE_MENU, "documentSize", 4, """
        check-cast p0, $MESSAGE
        invoke-virtual {p0}, $MESSAGE->getDocument()$DOCUMENT
        move-result-object v0
        if-eqz v0, :hush_none
        iget-wide v1, v0, $DOCUMENT->size:J
        return-wide v1
        :hush_none
        const-wide/16 v1, 0x0
        return-wide v1
    """)
    writeStub(MESSAGE_MENU, "photoSizes", 3, """
        check-cast p0, $MESSAGE
        invoke-static {p0}, $MESSAGE->getMedia($MESSAGE)$MEDIA
        move-result-object v0
        if-eqz v0, :hush_none
        iget-object v0, v0, $MEDIA->photo:$PHOTO
        if-eqz v0, :hush_none
        iget-object v1, v0, $PHOTO->sizes:$LIST
        return-object v1
        :hush_none
        const/4 v1, 0x0
        return-object v1
    """)
    writeStub(MESSAGE_MENU, "photoSize", 2, """
        check-cast p0, $PHOTO_SIZE
        iget v0, p0, $PHOTO_SIZE->size:I
        return v0
    """)
}

/**
 * What Quick forward reads and does through Telegram: the message's account, your own user ID,
 * the account's chat list, a chat's ID, name and send rights, and the forward itself. A chat is
 * reachable the way Repeat's check has it, minus forums, which need a topic picked first.
 */
private fun BytecodePatchContext.writeQuickForwardStubs() {
    writeStub(MESSAGE_MENU, "account", 2, "check-cast p0, $MESSAGE\niget v0, p0, $MESSAGE->currentAccount:I\nreturn v0")
    writeStub(MESSAGE_MENU, "selfId", 3, """
        invoke-static {p0}, $ACCOUNT_CONFIG->getInstance(I)$ACCOUNT_CONFIG
        move-result-object v0
        invoke-virtual {v0}, $ACCOUNT_CONFIG->getClientUserId()J
        move-result-wide v0
        return-wide v0
    """)
    writeStub(MESSAGE_MENU, "dialogs", 2, """
        invoke-static {p0}, $CONTROLLER->getInstance(I)$CONTROLLER
        move-result-object v0
        invoke-virtual {v0}, $CONTROLLER->getAllDialogs()$LIST
        move-result-object v0
        return-object v0
    """)
    writeStub(MESSAGE_MENU, "dialogId", 3, "check-cast p0, $TL_DIALOG\niget-wide v0, p0, $TL_DIALOG->id:J\nreturn-wide v0")
    writeStub(MESSAGE_MENU, "secret", 3, """
        invoke-static {p0, p1}, $DIALOG_OBJECT->isEncryptedDialog(J)Z
        move-result v0
        return v0
    """)
    writeStub(MESSAGE_MENU, "reachable", 8, """
        invoke-static {p0}, $CONTROLLER->getInstance(I)$CONTROLLER
        move-result-object v0
        const-wide/16 v1, 0x0
        cmp-long v3, p1, v1
        if-gtz v3, :hush_user
        if-eqz v3, :hush_no
        neg-long v1, p1
        invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v1
        invoke-virtual {v0, v1}, $CONTROLLER->getChat(Ljava/lang/Long;)$TL_CHAT
        move-result-object v0
        if-eqz v0, :hush_no
        invoke-static {v0}, $CHAT_OBJECT->isNotInChat($TL_CHAT)Z
        move-result v1
        if-nez v1, :hush_no
        invoke-static {v0}, $CHAT_OBJECT->isForum($TL_CHAT)Z
        move-result v1
        if-nez v1, :hush_no
        invoke-static {v0}, $CHAT_OBJECT->isMonoForum($TL_CHAT)Z
        move-result v1
        if-nez v1, :hush_no
        invoke-static {v0}, $CHAT_OBJECT->canSendMessages($TL_CHAT)Z
        move-result v1
        return v1
        :hush_user
        invoke-static {p1, p2}, $USER_OBJECT->isReplyUser(J)Z
        move-result v3
        if-nez v3, :hush_no
        invoke-static {p1, p2}, $USER_OBJECT->isService(J)Z
        move-result v3
        if-nez v3, :hush_no
        invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v1
        invoke-virtual {v0, v1}, $CONTROLLER->getUser(Ljava/lang/Long;)$TL_USER
        move-result-object v0
        if-eqz v0, :hush_no
        invoke-static {v0}, $USER_OBJECT->isDeleted($TL_USER)Z
        move-result v1
        if-nez v1, :hush_no
        const/4 v1, 0x1
        return v1
        :hush_no
        const/4 v1, 0x0
        return v1
    """)
    // Your own chat is Saved Messages, named the way Telegram names it; a user by their name, a chat by its title.
    writeStub(MESSAGE_MENU, "title", 7, """
        invoke-static {p0}, $ACCOUNT_CONFIG->getInstance(I)$ACCOUNT_CONFIG
        move-result-object v0
        invoke-virtual {v0}, $ACCOUNT_CONFIG->getClientUserId()J
        move-result-wide v1
        cmp-long v3, v1, p1
        if-nez v3, :hush_other
        sget v0, $STRINGS->SavedMessages:I
        invoke-static {v0}, $LOCALE->getString(I)$STRING
        move-result-object v0
        return-object v0
        :hush_other
        invoke-static {p0}, $CONTROLLER->getInstance(I)$CONTROLLER
        move-result-object v0
        const-wide/16 v1, 0x0
        cmp-long v3, p1, v1
        if-lez v3, :hush_chat
        invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v1
        invoke-virtual {v0, v1}, $CONTROLLER->getUser(Ljava/lang/Long;)$TL_USER
        move-result-object v0
        if-eqz v0, :hush_none
        invoke-static {v0}, $USER_OBJECT->getUserName($TL_USER)$STRING
        move-result-object v0
        return-object v0
        :hush_chat
        neg-long v1, p1
        invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v1
        invoke-virtual {v0, v1}, $CONTROLLER->getChat(Ljava/lang/Long;)$TL_CHAT
        move-result-object v0
        if-eqz v0, :hush_none
        iget-object v0, v0, $TL_CHAT->title:$STRING
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """)
    // Sound on, now, no stars agreed yet: a chat that charges gets Telegram's own confirmation. The
    // sender stays shown unless the caller says to hide it.
    writeStub(MESSAGE_MENU, "forwardTo", 15, """
        invoke-static {p0}, $SEND_HELPER->getInstance(I)$SEND_HELPER
        move-result-object v0
        move-object v1, p1
        move-wide v2, p2
        move v4, p4
        const/4 v5, 0x0
        const/4 v6, 0x1
        const/4 v7, 0x0
        const-wide/16 v8, 0x0
        invoke-virtual/range {v0 .. v9}, $SEND_HELPER->sendMessage(${LIST}JZZZIJ)I
        move-result v0
        return v0
    """)
}

private fun signature(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"
