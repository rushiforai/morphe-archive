/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.util.names.origString
import app.morphe.util.names.loadsInt
import app.morphe.util.names.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.requireParameterIntact
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.forward.IS_PREMIUM
import app.morphe.patches.telegram.misc.forward.MESSAGE_TYPE
import app.morphe.patches.telegram.misc.forward.premiumHideSenderTypes
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.savedownloads.CONTROLLER_INSTANCE
import app.morphe.patches.telegram.misc.savedownloads.IS_ENCRYPTED
import app.morphe.patches.telegram.misc.savedownloads.NO_FORWARDS
import app.morphe.patches.telegram.misc.savedownloads.PEER_NO_FORWARDS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.definitionReaches
import app.morphe.util.writesReaching
import app.morphe.util.call
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origDescriptor
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

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
private const val ATTRIBUTE = "Lorg/telegram/tgnet/TLRPC\$DocumentAttribute;"
private const val VIDEO_ATTRIBUTE = "Lorg/telegram/tgnet/TLRPC\$TL_documentAttributeVideo;"
private const val AUDIO_ATTRIBUTE = "Lorg/telegram/tgnet/TLRPC\$TL_documentAttributeAudio;"
private const val NAME_ATTRIBUTE = "Lorg/telegram/tgnet/TLRPC\$TL_documentAttributeFilename;"
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
internal val MENU_OPTIONS = listOf(0x48544d01, 0x48544d02, 0x48544d03, 0x48544d04, 0x48544d05, 0x48544d06, 0x48544d07, 0x48544d08, 0x48544d09, 0x48544d0a, 0x48544d0b, 0x48544d0c, 0x48544d0d, 0x48544d0e, 0x48544d0f)
private val MOVES = setOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_WIDE, Opcode.MOVE_WIDE_FROM16)

@Suppress("unused")
val messageMenuPatch = bytecodePatch(
    name = NAME,
    description = "Adds Repeat, Copy photo, Message details and Quick forward to a message's press-and-hold menu, for " +
        "resending, copying and forwarding faster. All four start off. Turn them on in HushTelegram settings " +
        "> Conversations.",
    default = true,
) {
    category("Conversations")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveMessageMenu()
        val selection = resolveSelectionCopy()
        val story = resolveStorySave()
        val screenshots = resolveScreenshots()
        // Assembled on copies first, so a refusal leaves the app untouched.
        site.insertFill(MutableMethod(ImmutableMethod.of(site.fill)))
        site.insertChosen(MutableMethod(ImmutableMethod.of(site.choose)))
        writeMessageMenuStubs(site)
        site.insertFill(site.fill)
        site.insertChosen(site.choose)
        if (selection.missing == null) {
            selection.apply()
            enableCapability("copySelection")
        } else {
            patchLog.warning("Add Repeat to the message menu: ${selection.missing}. The patch goes on without selecting text in chats that don't allow saving.")
        }
        if (story.missing == null) {
            story.apply()
            enableCapability("storySave")
        } else {
            patchLog.warning("Add Repeat to the message menu: ${story.missing}. The patch goes on without Save to Gallery in stories.")
        }
        if (screenshots.missing == null) {
            screenshots.apply()
            enableCapability("allowScreenshots")
        } else {
            patchLog.warning("Add Repeat to the message menu: ${screenshots.missing}. The patch goes on without screenshots in chats that don't allow saving.")
        }
        val between = resolveSelectBetween(site.chat)
        if (between.missing == null) {
            between.apply(this)
            enableCapability("selectBetween")
            // Screenshot rides the same bar hooks, so it can only go in beside Select between.
            val shot = resolveSelectionScreenshot(site.chat)
            if (shot.missing == null) {
                shot.apply(this)
                enableCapability("selectionScreenshot")
            } else {
                patchLog.warning("Add Repeat to the message menu: ${shot.missing}. The patch goes on without the Screenshot button.")
            }
            // So does Select all in chats.
            val all = resolveSelectAll()
            if (all.missing == null) {
                all.apply(this)
                enableCapability("selectAll")
            } else {
                patchLog.warning("Add Repeat to the message menu: ${all.missing}. The patch goes on without Select all in chats.")
            }
        } else {
            patchLog.warning("Add Repeat to the message menu: ${between.missing}. The patch goes on without the Select between button, Screenshot or Select all in chats.")
        }
        val mediaAll = resolveSharedMediaSelectAll()
        if (mediaAll.missing == null) {
            mediaAll.apply(this)
            enableCapability("sharedMediaSelectAll")
        } else {
            patchLog.warning("Add Repeat to the message menu: ${mediaAll.missing}. The patch goes on without Select all in shared media.")
        }
        val hide = resolveHideForMe()
        if (hide.missing == null) {
            hide.apply(this)
            enableCapability("hideForMe")
        } else {
            patchLog.warning("Add Repeat to the message menu: ${hide.missing}. The patch goes on without Hide for me.")
        }
        val alsoDelete = resolveAlsoDeleteChecked()
        if (alsoDelete.missing == null) {
            alsoDelete.apply()
            enableCapability("alsoDeleteChecked")
        } else {
            patchLog.warning("Add Repeat to the message menu: ${alsoDelete.missing}. The patch goes on without checking Also delete for by default.")
        }
        val bookmarks = resolveBookmarks()
        if (bookmarks.missing == null) {
            bookmarks.apply(this)
            enableCapability("bookmarks")
        } else {
            patchLog.warning("Add Repeat to the message menu: ${bookmarks.missing}. The patch goes on without Bookmark.")
        }
        val photoEdit = resolvePhotoEdit(site.chat)
        if (photoEdit.missing == null) {
            photoEdit.apply(this)
            enableCapability("photoEdit")
        } else {
            patchLog.warning("Add Repeat to the message menu: ${photoEdit.missing}. The patch goes on without Edit a copy.")
        }
        enableStatus("messageMenuRepeat")
    }
}

/**
 * The chat screen's menu builder [fill], its choice handler [choose], Telegram's own forward into
 * the open chat [forward], the fields holding the selected message and its album, the chat's
 * activity getter, Telegram's file provider, and the numbers Telegram gives Forward and article
 * messages. [authority] is the provider authority Share loads as one string, or null where it
 * joins the app's ID and ".provider" itself.
 */
internal class MessageMenuSite(
    val chat: String, val fill: MutableMethod, val choose: MutableMethod, val forward: Method, val activity: String,
    val provider: String, val selected: FieldReference, val group: FieldReference, val forwardOption: Int, val article: Int,
    val authority: String?,
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
    requireStatusMethod("copySelection")
    requireStatusMethod("storySave")
    controlHook(STORY_SAVE, "shareable", listOf("I"), "Z")
    controlHook(STORY_SAVE, "premium", listOf("I"), "Z")
    requireStatusMethod("allowScreenshots")
    controlHook(SCREENSHOTS, "protectedContent", listOf("I"), "Z")
    controlHook(SCREENSHOTS, "storyAllowed", listOf("I"), "Z")
    controlHook(SCREENSHOTS, "secretChat", listOf(OBJECT), OBJECT)
    controlHook(MESSAGE_MENU, "selectionCopy", listOf(), "Z")
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
    for (name in listOf("canSend", "blocked", "premium", "forwarded", "photo", "restricted")) controlHook(MESSAGE_MENU, name, listOf(OBJECT), "Z")
    for (name in listOf("type", "id", "date", "edited", "forwardDate", "fileDc", "photoSize", "photoWidth", "photoHeight",
        "attributeKind", "attributeWidth", "attributeHeight")) controlHook(MESSAGE_MENU, name, listOf(OBJECT), "I")
    for (name in listOf("dialog", "sender", "forwardFrom", "documentSize")) controlHook(MESSAGE_MENU, name, listOf(OBJECT), "J")
    for (name in listOf("forwardName", "attachPath", "text", "documentName", "mime", "attributeName")) controlHook(MESSAGE_MENU, name, listOf(OBJECT), "Ljava/lang/String;")
    controlHook(MESSAGE_MENU, "attributeDuration", listOf(OBJECT), "D")
    controlHook(MESSAGE_MENU, "photoSizes", listOf(OBJECT), LIST)
    controlHook(MESSAGE_MENU, "attributes", listOf(OBJECT), LIST)
    controlHook(MESSAGE_MENU, "photoFile", listOf(OBJECT), FILE)
    controlHook(MESSAGE_MENU, "sending", listOf(), "Z")
    controlHook(MESSAGE_MENU, "sendText", listOf("I", "J", STRING), "Z")
    controlHook(MESSAGE_MENU, "sendPhoto", listOf("I", "J", STRING, STRING), "Z")
    controlHook(MESSAGE_MENU, "sendFile", listOf("I", "J", STRING, STRING, STRING), "Z")
    controlHook(MESSAGE_MENU, "uri", listOf(CONTEXT, FILE), URI)
    resolveMessageMenuTools()

    // The builder, and the Premium gate on hiding an article's sender.
    val builders = messageMenuBuilders()
    val article = premiumHideSenderTypes().toList().controlSingle("the Premium gate on hiding an article's sender")
    val (chat, chatClass, fill, built) = messageMenuBuilder(builders, NAME)
    controlShape(built.none { (it as? NarrowLiteralInstruction)?.narrowLiteral in MENU_OPTIONS }, "the message menu already uses the extension's numbers")

    // Forward goes in with its option number, inline on Plus Messenger, through a helper on Telegram.
    val label = built.indices.filter { built[it].controlRef() == FORWARD_LABEL }.controlSingle("Forward label")
    val forwardOption = inlineForwardOption(built, label) ?: helperForwardOption(built, label)

    // The selected message and its album, as the builder reads them.
    val selected = built.firstOrNull { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.let { f -> f.origDefiningClass == chat && f.origType == MESSAGE } == true }?.controlField()
    val group = built.firstOrNull { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.let { f -> f.origDefiningClass == chat && f.origType == GROUPED } == true }?.controlField()
    controlShape(selected != null && group != null, "the message menu builder no longer reads the selected message and its album")
    for (field in listOf(selected!!, group!!)) {
        val declared = chatClass.fields.filter { it.origName == field.origName && it.origType == field.origType }.controlSingle("${field.name} field")
        controlShape(AccessFlags.PUBLIC.isSet(declared.accessFlags) && !AccessFlags.STATIC.isSet(declared.accessFlags), "${field.name} is inaccessible")
    }

    // The choice handler: a switch on the number that starts from the selected message and clears its album after.
    val choose = chatClass.methods.filter { m ->
        !AccessFlags.STATIC.isSet(m.accessFlags) && m.origReturnType == "V" && m.origParameterTypes == listOf("I") &&
            m.controlBody().let { body -> body.any { it.opcode == Opcode.PACKED_SWITCH || it.opcode == Opcode.SPARSE_SWITCH } && body.any { it.controlString() == "hasInvoice" } }
    }.controlSingle("message menu choice")
    val chosen = choose.controlBody()
    controlShape(chosen.firstOrNull { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.origType == MESSAGE }?.controlField().toString() == selected.toString(),
        "the menu choice no longer starts from the selected message")
    controlShape(chosen.any { it.opcode == Opcode.IPUT_OBJECT && it.controlField().toString() == group.toString() }, "the menu choice no longer clears the selected album")
    val cases = chosen.filterIsInstance<SwitchPayload>().flatMap { it.switchElements.map { e -> e.key } } + optionCompares(choose, chosen)
    controlShape(forwardOption in cases && cases.none { it in MENU_OPTIONS }, "the menu choice's numbers changed")
    controlShape(ControlFlow.of(choose).normal.none { 0 in it }, "something jumps back to the start of the menu choice")

    // The chat's activity, through the getter the choice handler itself uses.
    val activity = chosen.mapNotNull { it.call() }.firstOrNull { it.origName == "getParentActivity" && it.parameterTypes.isEmpty() && it.origReturnType == ACTIVITY }
    val activityOwner = activity?.let { tgClassDefByOrNull(it.definingClass) }
    controlShape(activityOwner != null && AccessFlags.PUBLIC.isSet(activityOwner.accessFlags) && activityOwner.methods.any {
        signature(it) == activity.origString() && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
    }, "the chat screen no longer has its activity")

    // Telegram's file provider, which the choice handler's Share hands its files to under the app's ".provider" authority.
    val provider = chosen.mapNotNull { it.call() }.filter { it.origParameterTypes == listOf(CONTEXT, "Ljava/lang/String;", FILE) && it.origReturnType == URI }
        .map { it.origString() }.distinct().controlSingle("Telegram's file provider")
    val providerOwner = tgClassDefByOrNull(provider.substringBefore("->"))
    // Older builds join the app's ID and ".provider"; newer ones load the joined authority as one string.
    val joined = chosen.any { it.controlRef() == APPLICATION_ID } && chosen.any { it.controlString() == ".provider" }
    val chosenFlow by lazy { ControlFlow.of(choose) }
    val authority = if (joined) null else chosen.indices.filter { chosen[it].call()?.origString() == provider }.map { at ->
        val register = chosen[at].namedRegisters().getOrNull(1)
        val near = (at - 1 downTo maxOf(0, at - 3)).firstOrNull { (chosen[it] as? OneRegisterInstruction)?.registerA == register }
        // Plus Messenger loads the authority once, at the top of the method, and keeps it in its register.
        if (near != null || register == null) near?.let { chosen[it].controlString() }
        else chosenFlow.writesReaching(at, register).map { chosen.getOrNull(it)?.controlString() }.distinct().singleOrNull()
    }.distinct().singleOrNull()
    controlShape(providerOwner != null && AccessFlags.PUBLIC.isSet(providerOwner.accessFlags) && providerOwner.methods.any {
        signature(it) == provider && AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags)
    } && (joined || authority != null && authority.endsWith(".provider") && authority.all { it.isLetterOrDigit() || it == '.' || it == '_' }),
        "Telegram's file provider changed")

    // Telegram's forward into the open chat, which the extension calls with the sender hidden.
    val forward = chatClass.methods.filter { m ->
        !AccessFlags.STATIC.isSet(m.accessFlags) && m.origReturnType == "V" && m.origParameterTypes == listOf(LIST, "Z", "Z", "Z", "I", "J") &&
            m.controlBody().count { it.controlRef() == FORWARD_SEND } == 1
    }.controlSingle("forward into the open chat")
    controlShape(AccessFlags.PUBLIC.isSet(forward.accessFlags), "the forward into the open chat is inaccessible")
    requireForwardArguments(forward)

    requireHostMembers(joined)
    return MessageMenuSite(chat, fill, choose, forward, activity.toString(), provider, selected, group, forwardOption, article, authority)
}

/**
 * The chat screen's message menu builders, as owner type and signature: each method taking a
 * message and three lists that loads Telegram's Forward and Cancel sending labels. Only classes
 * naming both labels are read. Translate with an outside service adds to the same menu.
 */
internal fun BytecodePatchContext.messageMenuBuilders(): List<Pair<String, String>> {
    val builders = mutableListOf<Pair<String, String>>()
    forEachClassMentioning(Mention.reference(FORWARD_LABEL) and Mention.reference(CANCEL_SENDING)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.forEach { m ->
            val body = m.controlBody()
            if (!AccessFlags.STATIC.isSet(m.accessFlags) && m.origReturnType == "V" &&
                m.origParameterTypes == listOf(MESSAGE, LIST, LIST, LIST) &&
                body.any { it.controlRef() == FORWARD_LABEL } && body.any { it.controlRef() == CANCEL_SENDING }) builders += cls.type to signature(m)
        }
    }
    return builders
}

/** The chat screen [chat], its menu builder [fill] and the builder's instructions [built]. */
internal data class MessageMenuBuilder(val chat: String, val chatClass: MutableClass, val fill: MutableMethod, val built: List<Instruction>)

/**
 * The one builder [builders] found, on a public chat screen, ending in its one return with `this`
 * and its four arguments still there. [patch] names the patch whose hook goes at that return.
 */
internal fun BytecodePatchContext.messageMenuBuilder(builders: List<Pair<String, String>>, patch: String): MessageMenuBuilder {
    val (chat, wanted) = builders.controlSingle("message menu builder")
    val chatClass = tgMutableClassDefBy(chat)
    controlShape(AccessFlags.PUBLIC.isSet(chatClass.accessFlags), "the chat screen is inaccessible")
    val fill = chatClass.methods.single { signature(it) == wanted }
    val built = fill.controlBody()
    val end = built.size - 1
    controlShape(built[end].opcode == Opcode.RETURN_VOID && built.count { it.opcode == Opcode.RETURN_VOID } == 1,
        "the message menu builder no longer ends in its one return")
    fill.requireThisIntact(patch, listOf(end))
    for (i in 0..3) fill.requireParameterIntact(patch, i, listOf(end))
    return MessageMenuBuilder(chat, chatClass, fill, built)
}

/**
 * Telegram's Forward: a helper taking the label, the option number and two of the lists (13.2's
 * also takes the icon and hands it back boxed), right after the label and its constants.
 */
private fun BytecodePatchContext.helperForwardOption(built: List<Instruction>, label: Int): Int {
    val constants = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST)
    val callAt = (label + 1..minOf(label + 4, built.size - 1)).firstOrNull { built[it].opcode !in constants }
    val add = callAt?.let { built[it] }
    val helper = add?.call()
    controlShape(built[label].loadsInt() && add != null && add.opcode == Opcode.INVOKE_STATIC && helper != null &&
        helper.origParameterTypes.count { it == LIST } == 2 && helper.origParameterTypes.all { it == "I" || it == LIST },
        "Forward no longer goes into the menu with its number")
    val helperMethod = tgClassDefByOrNull(helper!!.origDefiningClass)?.methods?.singleOrNull { signature(it) == helper.origString() }
    val roles = helperMethod?.let(::labelHelperRoles)
    controlShape(roles != null, "the menu's label helper changed")
    val (labelAt, optionAt) = roles!!
    val passed = add!!.namedRegisters()
    val optionRegister = passed.getOrNull(optionAt)
    val option = (label + 1 until callAt!!).lastOrNull { (built[it] as? OneRegisterInstruction)?.registerA == optionRegister }
        ?.let { built[it] as? NarrowLiteralInstruction }
    controlShape(passed.getOrNull(labelAt) == (built[label] as OneRegisterInstruction).registerA && option != null,
        "Forward no longer goes into the menu with its number")
    return option!!.narrowLiteral
}

/**
 * Plus Messenger's Forward, added inline: the label looked up and added to one list, then its
 * number boxed and added to another, in the seven instructions after the label. Null when Forward
 * goes in some other way.
 */
private fun inlineForwardOption(built: List<Instruction>, label: Int): Int? {
    val text = (built[label] as? OneRegisterInstruction)?.registerA ?: return null
    val lookup = built.getOrNull(label + 1) ?: return null
    if (!built[label].loadsInt() || lookup.controlRef() !in LABEL_LOOKUPS || lookup.namedRegisters().firstOrNull() != text) return null
    val labels = addedList(built, label + 2) ?: return null
    val number = built.getOrNull(label + 4)?.takeIf { it.opcode in setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST) } ?: return null
    val box = built.getOrNull(label + 5) ?: return null
    if (box.controlRef() != BOX_INT || box.namedRegisters().singleOrNull() != (number as OneRegisterInstruction).registerA) return null
    val options = addedList(built, label + 6) ?: return null
    return (number as NarrowLiteralInstruction).narrowLiteral.takeIf { labels != options }
}

/** The list a call's result goes into: the result moved out at [at] and added to that list right after. */
private fun addedList(built: List<Instruction>, at: Int): Int? {
    val result = (built.getOrNull(at)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT } as? OneRegisterInstruction)?.registerA ?: return null
    val add = built.getOrNull(at + 1)?.takeIf { it.controlRef() == ADD_TO_LIST && it.namedRegisters().getOrNull(1) == result } ?: return null
    return add.namedRegisters().first()
}

/**
 * The numbers the menu choice compares its option with one at a time, as Plus Messenger checks
 * Forward and its own options ahead of the switch: an if-eq or if-ne of the option, or a straight
 * copy of it, against a constant that still holds there.
 */
private fun optionCompares(choose: Method, chosen: List<Instruction>): List<Int> {
    val flow = ControlFlow.of(choose)
    val param = choose.implementation!!.registerCount - 1
    val moves = setOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16)
    fun lastWrite(at: Int, register: Int) = (at - 1 downTo 0).firstOrNull {
        chosen[it].opcode.setsRegister() && chosen[it].namedRegisters().firstOrNull() == register }
    val copies = chosen.indices.filter { m -> chosen[m].opcode in moves && chosen[m].namedRegisters()[1] == param &&
        lastWrite(m, param) == null }
    fun option(at: Int, register: Int) = register == param && lastWrite(at, param) == null ||
        copies.any { m -> chosen[m].namedRegisters()[0] == register && flow.definitionReaches(m, at, register) }
    return chosen.indices.mapNotNull { at ->
        val test = chosen[at]
        if (test.opcode != Opcode.IF_EQ && test.opcode != Opcode.IF_NE) return@mapNotNull null
        val (a, b) = test.namedRegisters()
        val other = when { option(at, a) -> b; option(at, b) -> a; else -> return@mapNotNull null }
        val load = lastWrite(at, other) ?: return@mapNotNull null
        (chosen[load] as? NarrowLiteralInstruction)?.takeIf { flow.definitionReaches(load, at, other) }?.narrowLiteral
    }
}

/** LocaleController.getString(res), and the (res, key) form 13.2 left with its arguments swapped. */
private val LABEL_LOOKUPS = setOf("$LOCALE->getString(I)$STRING", "$LOCALE->getString(I$STRING)$STRING")
private const val BOX_INT = "Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;"

/**
 * Which of the menu helper's arguments is the label and which the option number, as positions in
 * its parameters: the label goes through LocaleController.getString into one list argument and the
 * number, boxed, into another. Straight-line code only; anything else boxed is handed back, not
 * added. Null when the helper does something else.
 */
private fun labelHelperRoles(helper: Method): Pair<Int, Int>? {
    val types = helper.origParameterTypes
    val count = helper.implementation?.registerCount ?: return null
    if (!AccessFlags.STATIC.isSet(helper.accessFlags) || types.any { it != "I" && it != LIST }) return null
    val body = helper.controlBody()
    val allowed = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.INVOKE_STATIC, Opcode.INVOKE_VIRTUAL,
        Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_VOID, Opcode.RETURN_OBJECT)
    if (body.any { it.opcode !in allowed }) return null
    val first = count - types.size
    fun param(register: Int?) = register?.minus(first)?.takeIf { it in types.indices }
    // The list argument a call's result is added to, read at the next instruction naming the result.
    fun addedTo(call: Int): Int? {
        val result = (body.getOrNull(call + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT } as? OneRegisterInstruction)?.registerA ?: return null
        val next = (call + 2 until body.size).firstOrNull { result in body[it].namedRegisters() }?.let { body[it] } ?: return null
        if (next.controlRef() != ADD_TO_LIST || next.namedRegisters().getOrNull(1) != result) return null
        return param(next.namedRegisters().first())?.takeIf { types[it] == LIST }
    }
    val text = body.indices.filter { body[it].controlRef() in LABEL_LOOKUPS }.singleOrNull() ?: return null
    val box = body.indices.filter { body[it].controlRef() == BOX_INT && addedTo(it) != null }.singleOrNull() ?: return null
    val labelAt = param(body[text].namedRegisters().first())
    val optionAt = param(body[box].namedRegisters().single())
    val labels = addedTo(text)
    if (labelAt == null || optionAt == null || labelAt == optionAt || types[labelAt] != "I" || types[optionAt] != "I" ||
        labels == null || labels == addedTo(box) || body.count { it.controlRef() == ADD_TO_LIST } != 2) return null
    return labelAt to optionAt
}

/**
 * The send takes the messages, Hide sender's name, Hide captions, notify, the schedule date and the
 * stars straight from the method's own parameters, each moved in just before the call. Plus
 * Messenger picks the two hide flags itself in some of its own modes (a chat opened to quote, its
 * captions switch), so each of those may also come from a constant on another branch.
 */
private fun requireForwardArguments(forward: Method) {
    val body = forward.controlBody()
    val at = body.indexOfFirst { it.controlRef() == FORWARD_SEND }
    val call = body[at] as? RegisterRangeInstruction
    controlShape(call != null && call.registerCount == 16, "the forward into the open chat no longer sends in one call")
    val flow = ControlFlow.of(forward)
    val self = forward.implementation!!.registerCount - 8
    // A boolean the host chose: a const/4, or a move of a register only const/4s reach.
    fun constant(write: Int): Boolean = write >= 0 && when (body[write].opcode) {
        Opcode.CONST_4 -> true
        Opcode.MOVE, Opcode.MOVE_FROM16 -> body[write].namedRegisters()[1].let { from ->
            flow.writesReaching(write, from).let { reach -> reach.isNotEmpty() && reach.all { it >= 0 && body[it].opcode == Opcode.CONST_4 } }
        }
        else -> false
    }
    // The call's slot, and the declared parameter it must hold.
    for ((slot, parameter) in listOf(1 to 0, 4 to 1, 5 to 2, 6 to 3, 7 to 4, 11 to 5)) {
        val register = call!!.startRegister + slot
        val source = self + 1 + parameter
        val writes = flow.writesReaching(at, register)
        val moves = writes.filter { it >= 0 && body[it].opcode in MOVES && body[it].namedRegisters() == listOf(register, source) }
        val straight = moves.singleOrNull()?.takeIf { write -> writes.size == 1 &&
            (write + 1..at).all { i -> flow.normal.indices.filter { i in flow.normal[it] } == listOf(i - 1) } }
        controlShape(straight != null || slot in setOf(4, 5) && moves.isNotEmpty() && (writes - moves.toSet()).all(::constant),
            "the forward's send no longer takes its argument $slot from the method")
        forward.requireParameterIntact(NAME, parameter, moves)
    }
}

/** 13.2 makes getPathToMessage static, as it never reads the loader it's called on. */
private fun BytecodePatchContext.pathIsStatic() = tgClassDefByOrNull(FILE_LOADER)?.methods?.any {
    "${it.origName}${it.origDescriptor}" == "getPathToMessage($TL_MESSAGE)$FILE" && AccessFlags.STATIC.isSet(it.accessFlags)
} == true

/** 13.2 inlines getAllDialogs() everywhere into reads of the list it returns. */
private fun BytecodePatchContext.keepsAllDialogsGetter() = tgClassDefByOrNull(CONTROLLER)?.methods?.any {
    "${it.origName}${it.origDescriptor}" == "getAllDialogs()$LIST"
} == true

/**
 * Every Telegram member the stubs reach, with the access and kind each call needs. The app's ID only
 * where Share [joinsAuthority] from it; 13.2 drops getApplicationId and loads the authority whole.
 */
private fun BytecodePatchContext.requireHostMembers(joinsAuthority: Boolean) {
    controlMembers(MESSAGE, "messageOwner:$TL_MESSAGE", "type:I", "currentAccount:I", "scheduled:Z",
        "getId()I", "getDialogId()J", "getFromChatId()J", "getForwardedName()Ljava/lang/String;", "getDocument()$DOCUMENT",
        "isPoll()Z", "isTodo()Z", "isPhoto()Z", "isHiddenSensitive()Z", "getDocumentName()$STRING", "static getPeerId($PEER)J", "static getMedia($MESSAGE)$MEDIA")
    controlMembers(GROUPED, "messages:$LIST")
    controlMembers(TL_MESSAGE, "message:$STRING", "noforwards:Z", "date:I", "edit_date:I", "fwd_from:$FWD_HEADER", "action:$ACTION", "attachPath:Ljava/lang/String;")
    controlMembers(FILE_LOADER, "static getInstance(I)$FILE_LOADER", "${if (pathIsStatic()) "static " else ""}getPathToMessage($TL_MESSAGE)$FILE")
    if (joinsAuthority) controlMembers("Lorg/telegram/messenger/ApplicationLoader;", "static getApplicationId()Ljava/lang/String;")
    controlMembers(FWD_HEADER, "date:I", "from_id:$PEER")
    controlMembers(MEDIA, "photo:$PHOTO")
    controlMembers(PHOTO, "dc_id:I", "sizes:$LIST")
    controlMembers(PHOTO_SIZE, "size:I", "w:I", "h:I")
    controlMembers(DOCUMENT, "dc_id:I", "size:J", "mime_type:$STRING", "attributes:$LIST")
    controlMembers(ATTRIBUTE, "w:I", "h:I", "duration:D", "file_name:$STRING")
    for (kind in listOf(VIDEO_ATTRIBUTE, AUDIO_ATTRIBUTE, NAME_ATTRIBUTE)) controlMembers(kind)
    controlMembers(PAID_MEDIA)
    controlMembers(ACTION_EMPTY)
    controlMembers(CONTROLLER, "isPeerNoForwards(J)Z", "static getInstance(I)$CONTROLLER", "getChat(Ljava/lang/Long;)$TL_CHAT", "getUser(Ljava/lang/Long;)$TL_USER",
        if (keepsAllDialogsGetter()) "getAllDialogs()$LIST" else "allDialogs:$LIST")
    controlMembers(CHAT_OBJECT, "static isNotInChat($TL_CHAT)Z", "static canSendMessages($TL_CHAT)Z", "static isForum($TL_CHAT)Z", "static isMonoForum($TL_CHAT)Z")
    controlMembers(USER_OBJECT, "static isDeleted($TL_USER)Z", "static isReplyUser(J)Z", "static isService(J)Z", "static getUserName($TL_USER)$STRING")
    controlMembers(TL_CHAT, "title:$STRING")
    controlMembers(TL_DIALOG, "id:J")
    controlMembers(SEND_HELPER, "static getInstance(I)$SEND_HELPER", FORWARD_SEND.substringAfter("->"))
    controlMembers(LOCALE, "static getString(I)$STRING")
    controlMembers(STRINGS, "static SavedMessages:I")
    controlMembers(DIALOG_OBJECT, "static isEncryptedDialog(J)Z")
    controlMembers(ACCOUNT_CONFIG, "static getInstance(I)$ACCOUNT_CONFIG", "isPremium()Z", "getClientUserId()J")
    controlMembers(DRAWABLES, "static msg_retry:I", "static msg_copy:I", "static msg_info:I", "static msg_forward:I")
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
    // A chat that doesn't allow saving, or a message with its own flag; never a secret chat's.
    writeStub(MESSAGE_MENU, "restricted", 4, """
        check-cast p0, $MESSAGE
        invoke-virtual {p0}, $MESSAGE->getDialogId()J
        move-result-wide v1
        invoke-static {v1, v2}, $IS_ENCRYPTED
        move-result v0
        if-nez v0, :hush_no
        iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        if-eqz v0, :hush_no
        iget-boolean v0, v0, $NO_FORWARDS
        if-nez v0, :hush_yes
        iget v0, p0, $MESSAGE->currentAccount:I
        invoke-static {v0}, $CONTROLLER_INSTANCE
        move-result-object v0
        invoke-virtual {v0, v1, v2}, $PEER_NO_FORWARDS
        move-result v0
        return v0
        :hush_yes
        const/4 v0, 0x1
        return v0
        :hush_no
        const/4 v0, 0x0
        return v0
    """)
    writeStub(MESSAGE_MENU, "text", 2, """
        check-cast p0, $MESSAGE
        iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        if-eqz v0, :hush_none
        iget-object v0, v0, $TL_MESSAGE->message:$STRING
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """)
    writeStub(MESSAGE_MENU, "documentName", 2, """
        check-cast p0, $MESSAGE
        invoke-virtual {p0}, $MESSAGE->getDocumentName()$STRING
        move-result-object v0
        return-object v0
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
    val path = if (pathIsStatic()) "invoke-static {v1}" else """
        iget v0, p0, $MESSAGE->currentAccount:I
        invoke-static {v0}, $FILE_LOADER->getInstance(I)$FILE_LOADER
        move-result-object v0
        invoke-virtual {v0, v1}
    """.trimIndent()
    writeStub(MESSAGE_MENU, "photoFile", 3, """
        check-cast p0, $MESSAGE
        iget-object v1, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        $path, $FILE_LOADER->getPathToMessage($TL_MESSAGE)$FILE
        move-result-object v0
        return-object v0
    """)
    // The same authority Telegram's Share passes: the app's ID and ".provider", or the one string it loads.
    val authority = site.authority?.let { "const-string v0, \"$it\"" } ?: """
        invoke-static {}, $APPLICATION_ID
        move-result-object v0
        const-string v1, ".provider"
        invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v0
    """.trimIndent()
    writeStub(MESSAGE_MENU, "uri", 4, """
        $authority
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
    writeSendCopyStubs()
    writeMessageMenuToolsStubs()
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
    for (side in listOf("w" to "photoWidth", "h" to "photoHeight")) writeStub(MESSAGE_MENU, side.second, 2, """
        check-cast p0, $PHOTO_SIZE
        iget v0, p0, $PHOTO_SIZE->${side.first}:I
        return v0
    """)
    for (read in listOf("$DOCUMENT->mime_type:$STRING" to "mime", "$DOCUMENT->attributes:$LIST" to "attributes")) writeStub(MESSAGE_MENU, read.second, 3, """
        check-cast p0, $MESSAGE
        invoke-virtual {p0}, $MESSAGE->getDocument()$DOCUMENT
        move-result-object v0
        if-eqz v0, :hush_none
        iget-object v1, v0, ${read.first}
        return-object v1
        :hush_none
        const/4 v1, 0x0
        return-object v1
    """)
    // The numbers MessageMenu gives each kind: a video, a song or voice message, the file's name, anything else.
    writeStub(MESSAGE_MENU, "attributeKind", 2, """
        instance-of v0, p0, $VIDEO_ATTRIBUTE
        if-eqz v0, :hush_audio
        const/4 v0, 0x1
        return v0
        :hush_audio
        instance-of v0, p0, $AUDIO_ATTRIBUTE
        if-eqz v0, :hush_name
        const/4 v0, 0x2
        return v0
        :hush_name
        instance-of v0, p0, $NAME_ATTRIBUTE
        if-eqz v0, :hush_other
        const/4 v0, 0x3
        return v0
        :hush_other
        const/4 v0, 0x0
        return v0
    """)
    for (side in listOf("w" to "attributeWidth", "h" to "attributeHeight")) writeStub(MESSAGE_MENU, side.second, 2, """
        check-cast p0, $ATTRIBUTE
        iget v0, p0, $ATTRIBUTE->${side.first}:I
        return v0
    """)
    writeStub(MESSAGE_MENU, "attributeDuration", 3, """
        check-cast p0, $ATTRIBUTE
        iget-wide v0, p0, $ATTRIBUTE->duration:D
        return-wide v0
    """)
    writeStub(MESSAGE_MENU, "attributeName", 2, """
        check-cast p0, $ATTRIBUTE
        iget-object v0, p0, $ATTRIBUTE->file_name:$STRING
        return-object v0
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
        ${if (keepsAllDialogsGetter()) "invoke-virtual {v0}, $CONTROLLER->getAllDialogs()$LIST\nmove-result-object v0"
            else "iget-object v0, v0, $CONTROLLER->allDialogs:$LIST"}
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
    // sender stays shown unless the caller says to hide it. 13.2 dropped the short forward overload,
    // so this passes the full one what the short one passed: no repeat, no topic, no video start
    // (-1), no monoforum peer and no suggestion.
    writeStub(MESSAGE_MENU, "forwardTo", 21, """
        invoke-static/range {p0 .. p0}, $SEND_HELPER->getInstance(I)$SEND_HELPER
        move-result-object v0
        move-object/from16 v1, p1
        move-wide/from16 v2, p2
        move/from16 v4, p4
        const/4 v5, 0x0
        const/4 v6, 0x1
        const/4 v7, 0x0
        const/4 v8, 0x0
        const/4 v9, 0x0
        const/4 v10, -0x1
        const-wide/16 v11, 0x0
        const-wide/16 v13, 0x0
        const/4 v15, 0x0
        invoke-virtual/range {v0 .. v15}, $FORWARD_SEND
        move-result v0
        return v0
    """)
}

private fun signature(m: Method) = m.origString()
