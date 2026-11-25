/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlCallable
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.patches.telegram.misc.translate.chatAccountGetter
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.call
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origString
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.superclassChain
import app.morphe.util.writesReaching
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val LINK_PREVIEW_PHOTO = "$EXTENSION_PACKAGE/misc/LinkPreviewPhoto;"
private const val DO_NOT_LINK_PREVIEW = "Lorg/telegram/messenger/R\$string;->DoNotLinkPreview:I"
private const val APPLY_CHANGES = "Lorg/telegram/messenger/R\$string;->ApplyChanges:I"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
private const val LONG_OBJECT = "Ljava/lang/Long;"
private const val FILE = "Ljava/io/File;"
private const val LIST = "Ljava/util/ArrayList;"
private const val CONTEXT = "Landroid/content/Context;"
private const val VIEW = "Landroid/view/View;"
private const val DRAWABLE = "Landroid/graphics/drawable/Drawable;"
private const val LAYOUT_PARAMS = "Landroid/widget/LinearLayout\$LayoutParams;"
private const val PREVIEW_PARAMS = "Lorg/telegram/messenger/MessagePreviewParams;"
private const val MESSAGE = "Lorg/telegram/messenger/MessageObject;"
private const val FILE_LOADER = "Lorg/telegram/messenger/FileLoader;"
private const val IMAGE_LOCATION = "Lorg/telegram/messenger/ImageLocation;"
private const val UTILITIES = "Lorg/telegram/messenger/AndroidUtilities;"
private const val MEDIA_DATA = "Lorg/telegram/messenger/MediaDataController;"
private const val CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
private const val CHAT_OBJECT = "Lorg/telegram/messenger/ChatObject;"
private const val DIALOG_OBJECT = "Lorg/telegram/messenger/DialogObject;"
private const val DRAWABLES = "Lorg/telegram/messenger/R\$drawable;"
private const val WEB_PAGE = "Lorg/telegram/tgnet/TLRPC\$WebPage;"
private const val PHOTO = "Lorg/telegram/tgnet/TLRPC\$Photo;"
private const val PHOTO_SIZE = "Lorg/telegram/tgnet/TLRPC\$PhotoSize;"
private const val TL_OBJECT = "Lorg/telegram/tgnet/TLObject;"
private const val TL_CHAT = "Lorg/telegram/tgnet/TLRPC\$Chat;"
private const val ENTER_VIEW = "Lorg/telegram/ui/Components/ChatActivityEnterView;"
private const val CLOSEST_SIZE = "getClosestPhotoSizeWithSize(${LIST}IZ${PHOTO_SIZE}Z)$PHOTO_SIZE"
private const val LOAD_FILE = "loadFile($IMAGE_LOCATION${OBJECT}${STRING}II)V"
private const val FOR_PHOTO = "getForPhoto($PHOTO_SIZE$PHOTO)$IMAGE_LOCATION"
private const val PATH_TO_ATTACH = "getPathToAttach(${TL_OBJECT}Z)$FILE"
private const val ENTITIES = "getEntities([${CHAR_SEQUENCE}ZZ)$LIST"
private const val GET_CHAT = "getChat($LONG_OBJECT)$TL_CHAT"

/**
 * Where Send photo goes and what it reads: the link page's constructor with the call that adds
 * Remove preview, how a row is made, and the chat fields Remove preview's own click goes through.
 * The fields and calls are in the form a stub names them.
 */
internal class LinkPreviewSite(
    val constructor: MutableMethod, val added: Int, val pageRegister: Int, val rowRegister: Int,
    val page: String, val chat: String, val pageOuter: String, val sub: String, val subChat: String,
    val provider: String, val rowType: String, val rowInit: String, val rowTitle: String,
    val params: String, val enter: String, val reply: String, val thread: String, val quote: String, val editing: String,
    val dialog: String, val arguments: String, val chatMode: String, val monoPeer: String, val account: String,
    val photoSend: CopySend, val staticPath: Boolean,
)

/** Send photo in the link preview menu: what it takes on this build, or why this build can't have it. */
internal class LinkPreviewPhotoPlan(val missing: String?, private val site: LinkPreviewSite? = null) {
    fun apply(context: BytecodePatchContext) {
        context.writeLinkPreviewStubs(site!!, true)
        site.hook(site.constructor)
    }
}

/**
 * Finds the link preview menu and proves every step on copies, so a build shaped another way
 * leaves the app as it was and only this row out.
 */
internal fun BytecodePatchContext.resolveLinkPreviewPhoto(chat: String): LinkPreviewPhotoPlan = try {
    requireStatusMethod("linkPreviewPhoto")
    requireLinkPreviewRuntime()
    val site = linkPreviewSite(chat)
    site.hook(MutableMethod(ImmutableMethod.of(site.constructor)))
    writeLinkPreviewStubs(site, false)
    LinkPreviewPhotoPlan(null, site)
} catch (refused: PatchException) {
    LinkPreviewPhotoPlan(refused.message ?: "the link preview menu can't be read")
} catch (failed: RuntimeException) {
    LinkPreviewPhotoPlan("the link preview menu can't be read (${failed.javaClass.simpleName}: ${failed.message})")
}

private fun LinkPreviewSite.hook(into: MutableMethod) = into.addInstructionsAtControlFlowLabel(
    added + 1, "invoke-static {v$pageRegister, v$rowRegister}, $LINK_PREVIEW_PHOTO->menuBuilt($OBJECT$OBJECT)V")

private fun BytecodePatchContext.requireLinkPreviewRuntime() {
    fun hook(name: String, parameters: List<String>, result: String) = controlHook(LINK_PREVIEW_PHOTO, name, parameters, result)
    hook("menuBuilt", listOf(OBJECT, OBJECT), "V")
    hook("row", listOf(OBJECT, CONTEXT, CHAR_SEQUENCE), VIEW)
    for (name in listOf("chat", "webPage", "photo", "bestSize", "editing", "reply", "thread", "quote", "arguments")) {
        hook(name, listOf(OBJECT), OBJECT)
    }
    hook("path", listOf("I", OBJECT, "I"), FILE)
    hook("load", listOf("I", OBJECT, OBJECT, OBJECT), "Z")
    hook("account", listOf(OBJECT), "I")
    hook("chatMode", listOf(OBJECT), "I")
    hook("dialog", listOf(OBJECT), "J")
    hook("monoPeer", listOf(OBJECT), "J")
    hook("photoAllowed", listOf("I", "J"), "Z")
    hook("captionLimit", listOf("I"), "I")
    hook("entities", listOf("I", "[$CHAR_SEQUENCE"), LIST)
    hook("text", listOf(OBJECT), CHAR_SEQUENCE)
    hook("clearText", listOf(OBJECT), "V")
    hook("clearReply", listOf(OBJECT), "V")
    hook("sendPhoto", listOf("I", "J", STRING, STRING, LIST, OBJECT, OBJECT, OBJECT, OBJECT, "J"), "Z")

    controlMembers(PREVIEW_PARAMS, "webpage:$WEB_PAGE")
    controlMembers(WEB_PAGE, "photo:$PHOTO")
    controlMembers(PHOTO, "sizes:$LIST")
    controlMembers(FILE_LOADER, "static $CLOSEST_SIZE", "static getInstance(I)$FILE_LOADER", LOAD_FILE)
    controlMembers(IMAGE_LOCATION, "static $FOR_PHOTO")
    controlMembers(UTILITIES, "static getPhotoSize()I")
    controlMembers(MEDIA_DATA, "static getInstance(I)$MEDIA_DATA", ENTITIES)
    controlMembers(CONTROLLER, "static getInstance(I)$CONTROLLER", "getCaptionMaxLengthLimit()I", GET_CHAT)
    controlMembers(CHAT_OBJECT, "static canSendPhoto($TL_CHAT)Z")
    controlMembers(DIALOG_OBJECT, "static isEncryptedDialog(J)Z")
    controlMembers(ENTER_VIEW, "getFieldText()$CHAR_SEQUENCE", "setFieldText($CHAR_SEQUENCE)V")
    controlMembers(DRAWABLES, "static msg_gallery:I")
    controlShape(pathToAttach() != null, "FileLoader no longer says where a photo is kept")
}

private fun refused(why: String): Nothing {
    controlShape(false, why)
    throw IllegalStateException(why)
}

/** The page takes its menu, a context and a number. The Play build's other screen with both labels is a dialog that takes no menu. */
private fun Method.isLinkPreviewPage() = name == "<init>" &&
    origParameterTypes.let { it.size == 3 && it[1] == CONTEXT && it[2] == "I" } && controlBody().let { body ->
    body.any { it.controlRef() == DO_NOT_LINK_PREVIEW } && body.any { it.controlRef() == APPLY_CHANGES }
}

/** A read of a field on [owner] with the type [type], by [opcode]. */
private fun Instruction.reads(opcode: Opcode, owner: String, type: String) = this.opcode == opcode &&
    controlField()?.let { it.origDefiningClass == owner && it.origType == type } == true

private fun BytecodePatchContext.linkPreviewSite(chat: String): LinkPreviewSite {
    val pages = mutableListOf<MutableMethod>()
    forEachClassMentioning(Mention.reference(DO_NOT_LINK_PREVIEW) and Mention.reference(APPLY_CHANGES)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        if (cls.methods.any { it.isLinkPreviewPage() }) pages += tgMutableClassDefBy(cls.type).methods.filter { it.isLinkPreviewPage() }
    }
    val constructor = pages.controlSingle("the link preview menu")
    val page = constructor.origDefiningClass
    val outer = constructor.origParameterTypes[0]
    val body = constructor.controlBody()
    val label = body.indices.filter { body[it].controlRef() == DO_NOT_LINK_PREVIEW }.controlSingle("the Remove preview label")

    // Remove preview's row: made before its label, titled and added after it.
    val rowAt = (0 until label).lastOrNull { i ->
        body[i].opcode == Opcode.INVOKE_DIRECT_RANGE && body[i].call()?.let { m ->
            m.name == "<init>" && m.origParameterTypes.let { it.size == 5 && it[0] == "I" && it[1] == CONTEXT && it[3] == "Z" && it[4] == "Z" }
        } == true
    } ?: refused("the link preview menu's row constructor is missing")
    val rowInit = body[rowAt].call()!!
    val rowType = rowInit.origDefiningClass
    val providerRegister = (body[rowAt] as RegisterRangeInstruction).startRegister + 3
    val providerAt = (0 until rowAt).lastOrNull { i ->
        body[i].opcode == Opcode.IGET_OBJECT && (body[i] as TwoRegisterInstruction).registerA == providerRegister
    } ?: refused("the link preview menu's theme is missing")
    // The row takes an interface and the menu's field holds the class behind it, so the types differ: what's checked is where the value comes from.
    val flow = ControlFlow.of(constructor)
    controlShape(flow.writesReaching(rowAt, providerRegister) == setOf(providerAt) &&
        body[providerAt].controlField()?.origDefiningClass == outer, "the link preview menu's theme changed")
    val after = label + 1 until body.size
    val titleAt = after.firstOrNull { i ->
        body[i].opcode == Opcode.INVOKE_VIRTUAL && body[i].call()?.let {
            it.origDefiningClass == rowType && it.controlShape(listOf(CHAR_SEQUENCE, "I", DRAWABLE), "V")
        } == true
    } ?: refused("the Remove preview row's title is missing")
    val addAt = after.firstOrNull { i ->
        body[i].opcode == Opcode.INVOKE_VIRTUAL && body[i].call()?.controlShape(listOf(VIEW, LAYOUT_PARAMS), "V") == true
    } ?: refused("the Remove preview row's add call is missing")
    val listenerAt = (label + 1 until addAt).filter { i ->
        body[i].opcode == Opcode.INVOKE_DIRECT && body[i].call()?.let { it.name == "<init>" && it.controlShape(listOf(page, "I"), "V") } == true
    }.controlSingle("the Remove preview row's click listener")

    // The page and the row both have to still be in their registers where the hook goes.
    val added = body[addAt] as FiveRegisterInstruction
    val rowRegister = added.registerD
    val pageRegister = (body[listenerAt] as FiveRegisterInstruction).registerD
    controlShape((body[titleAt] as FiveRegisterInstruction).registerC == rowRegister &&
        flow.writesReaching(addAt, rowRegister) == flow.writesReaching(titleAt, rowRegister), "the row added isn't the row titled")
    controlShape(flow.writesReaching(addAt, pageRegister) == flow.writesReaching(listenerAt, pageRegister), "the link preview page's register changes before the add")

    // Remove preview's click: what it reads from the chat is what Send photo reads and clears.
    val listener = body[listenerAt].call()!!.origDefiningClass
    val click = tgMutableClassDefBy(listener).methods.filter { it.origName == "onClick" && it.controlShape(listOf(VIEW), "V") }
        .controlSingle("the link preview menu's click")
    val code = click.controlBody()
    val clear = code.indices.filter { code[it].reads(Opcode.IPUT_OBJECT, chat, WEB_PAGE) }.controlSingle("Remove preview's clear")
    val chatAt = (0 until clear).lastOrNull { i -> code[i].opcode == Opcode.IGET_OBJECT && code[i].controlField()?.origType == chat }
        ?: refused("Remove preview's chat is missing")
    val sub = code[chatAt].controlField()!!.origDefiningClass
    val castAt = (0 until chatAt).lastOrNull { code[it].opcode == Opcode.CHECK_CAST && code[it].controlRef() == sub }
        ?: refused("Remove preview's menu cast is missing")
    val outerAt = (0 until castAt).lastOrNull { code[it].reads(Opcode.IGET_OBJECT, page, outer) }
        ?: refused("the link preview page's menu is missing")
    controlShape(outer in superclassChain(sub).toList(), "the chat's link preview menu isn't the page's menu")

    val paramsAt = (clear + 1 until code.size).firstOrNull { code[it].reads(Opcode.IGET_OBJECT, chat, PREVIEW_PARAMS) }
        ?: refused("the chat's preview details are missing")
    val enterAt = (clear + 1 until paramsAt).firstOrNull { i ->
        code[i].opcode == Opcode.IGET_OBJECT && code[i].controlField()?.let {
            it.origDefiningClass == chat && ENTER_VIEW in superclassChain(it.type).toList()
        } == true
    } ?: refused("the chat's message box is missing")
    val updateAt = (paramsAt + 1 until code.size).firstOrNull { i ->
        code[i].opcode == Opcode.INVOKE_VIRTUAL_RANGE && code[i].call()?.let { m ->
            m.origDefiningClass == PREVIEW_PARAMS && m.origReturnType == "V" && m.origParameterTypes.let {
                it.size == 6 && it[0] == "I" && it[1] == WEB_PAGE && it[3] == MESSAGE && it[5] == MESSAGE
            }
        } == true
    } ?: refused("the link preview's update is missing")
    val quoteType = code[updateAt].call()!!.origParameterTypes[4]
    val between = (paramsAt + 1 until updateAt).map { code[it] }
    val messages = between.filter { it.reads(Opcode.IGET_OBJECT, chat, MESSAGE) }
    controlShape(messages.size == 3, "the chat's reply, thread and edited message changed")
    val quote = between.filter { it.reads(Opcode.IGET_OBJECT, chat, quoteType) }.controlSingle("the chat's quote")
    val dialog = code.filter { it.reads(Opcode.IGET_WIDE, chat, "J") }.map { it.controlRef()!! }.distinct().controlSingle("the chat's dialog")

    // The send, and the two values Telegram works out for it when it sends a picked photo.
    val send = resolveCopySends()?.second ?: refused("Telegram's photo send is missing")
    val sendTypes = send.method.origParameterTypes
    controlShape(sendTypes.size == 23 && sendTypes[5] == MESSAGE && sendTypes[6] == MESSAGE && sendTypes[7] == quoteType &&
        sendTypes[8] == LIST && sendTypes[12] == MESSAGE && sendTypes[21] == "J", "Telegram's photo send changed")
    val chatMethods = tgMutableClassDefBy(chat).methods.toList()
    val arguments = chatMethods.filter { it.parameterTypes.isEmpty() && it.origReturnType == sendTypes[18] && it.controlCallable(false) }
        .controlSingle("the chat's send arguments")
    val chatMode = arguments.controlBody().filter { it.reads(Opcode.IGET, chat, "I") }.map { it.controlRef()!! }.distinct().controlSingle("the chat's mode")
    val monoPeer = chatMethods.filter { m ->
        m.parameterTypes.isEmpty() && m.origReturnType == "J" && m.controlCallable(false) &&
            m.controlBody().any { it.controlField()?.origName == "saved_peer_id" }
    }.controlSingle("the chat's direct messages peer")

    val path = pathToAttach() ?: refused("FileLoader no longer says where a photo is kept")
    val site = LinkPreviewSite(
        constructor, addAt, pageRegister, rowRegister, page, chat,
        code[outerAt].controlRef()!!, sub, code[chatAt].controlRef()!!, body[providerAt].controlRef()!!,
        rowType, body[rowAt].controlRef()!!, body[titleAt].controlRef()!!,
        code[paramsAt].controlRef()!!, code[enterAt].controlRef()!!,
        messages[0].controlRef()!!, messages[1].controlRef()!!, quote.controlRef()!!, messages[2].controlRef()!!,
        dialog, arguments.origString(), chatMode, monoPeer.origString(), chatAccountGetter(chat),
        send, AccessFlags.STATIC.isSet(path.accessFlags),
    )
    for (reference in listOf(site.pageOuter, site.subChat, site.provider, site.rowInit, site.rowTitle, site.params, site.enter,
        site.reply, site.thread, site.quote, site.editing, site.dialog, site.arguments, site.chatMode, site.monoPeer)) {
        requireReachable(reference, false)
    }
    return site
}

/** Every stub Send photo calls. With [install] false they're only built and checked. */
private fun BytecodePatchContext.writeLinkPreviewStubs(site: LinkPreviewSite, install: Boolean) {
    fun stub(name: String, registers: Int, smali: String) = writeStub(LINK_PREVIEW_PHOTO, name, registers, smali, install)
    fun chatField(name: String, field: String) = stub(name, 2, """
        check-cast p0, ${site.chat}
        iget-object v0, p0, $field
        return-object v0
    """)
    val chat = site.chat

    stub("row", 10, """
        check-cast p0, ${site.page}
        iget-object v6, p0, ${site.pageOuter}
        new-instance v0, ${site.rowType}
        const/4 v1, 0x1
        move-object v2, p1
        iget-object v3, v6, ${site.provider}
        const/4 v4, 0x0
        const/4 v5, 0x0
        invoke-direct/range {v0 .. v5}, ${site.rowInit}
        sget v1, $DRAWABLES->msg_gallery:I
        const/4 v2, 0x0
        invoke-virtual {v0, p2, v1, v2}, ${site.rowTitle}
        return-object v0
    """)
    stub("chat", 3, """
        check-cast p0, ${site.page}
        iget-object v0, p0, ${site.pageOuter}
        instance-of v1, v0, ${site.sub}
        if-eqz v1, :hush_none
        check-cast v0, ${site.sub}
        iget-object v0, v0, ${site.subChat}
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """)
    stub("webPage", 2, """
        check-cast p0, $chat
        iget-object v0, p0, ${site.params}
        if-eqz v0, :hush_none
        iget-object v0, v0, $PREVIEW_PARAMS->webpage:$WEB_PAGE
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """)
    stub("photo", 2, """
        check-cast p0, $WEB_PAGE
        iget-object v0, p0, $WEB_PAGE->photo:$PHOTO
        return-object v0
    """)
    stub("bestSize", 6, """
        check-cast p0, $PHOTO
        iget-object v0, p0, $PHOTO->sizes:$LIST
        invoke-static {}, $UTILITIES->getPhotoSize()I
        move-result v1
        const/4 v2, 0x0
        const/4 v3, 0x0
        const/4 v4, 0x1
        invoke-static {v0, v1, v2, v3, v4}, $FILE_LOADER->$CLOSEST_SIZE
        move-result-object v0
        return-object v0
    """)
    val pathCall = if (site.staticPath) "invoke-static {p1, v1}" else "invoke-virtual {v0, p1, v1}"
    stub("path", 5, """
        check-cast p1, $PHOTO_SIZE
        invoke-static {p0}, $FILE_LOADER->getInstance(I)$FILE_LOADER
        move-result-object v0
        const/4 v1, 0x0
        if-eqz p2, :hush_call
        const/4 v1, 0x1
        :hush_call
        $pathCall, $FILE_LOADER->$PATH_TO_ATTACH
        move-result-object v0
        return-object v0
    """)
    stub("load", 10, """
        check-cast p1, $PHOTO_SIZE
        check-cast p2, $PHOTO
        invoke-static {p1, p2}, $IMAGE_LOCATION->$FOR_PHOTO
        move-result-object v1
        if-eqz v1, :hush_no
        invoke-static {p0}, $FILE_LOADER->getInstance(I)$FILE_LOADER
        move-result-object v0
        move-object v2, p3
        const/4 v3, 0x0
        const/4 v4, 0x1
        const/4 v5, 0x1
        invoke-virtual/range {v0 .. v5}, $FILE_LOADER->$LOAD_FILE
        const/4 v0, 0x1
        return v0
        :hush_no
        const/4 v0, 0x0
        return v0
    """)
    stub("account", 2, """
        check-cast p0, $chat
        invoke-virtual {p0}, ${site.account}
        move-result v0
        return v0
    """)
    stub("dialog", 3, """
        check-cast p0, $chat
        iget-wide v0, p0, ${site.dialog}
        return-wide v0
    """)
    stub("chatMode", 2, """
        check-cast p0, $chat
        iget v0, p0, ${site.chatMode}
        return v0
    """)
    chatField("editing", site.editing)
    chatField("reply", site.reply)
    chatField("thread", site.thread)
    chatField("quote", site.quote)
    stub("arguments", 2, """
        check-cast p0, $chat
        invoke-virtual {p0}, ${site.arguments}
        move-result-object v0
        return-object v0
    """)
    stub("monoPeer", 3, """
        check-cast p0, $chat
        invoke-virtual {p0}, ${site.monoPeer}
        move-result-wide v0
        return-wide v0
    """)
    stub("photoAllowed", 6, """
        invoke-static {p1, p2}, $DIALOG_OBJECT->isEncryptedDialog(J)Z
        move-result v0
        if-nez v0, :hush_no
        const-wide/16 v0, 0x0
        cmp-long v0, p1, v0
        if-ltz v0, :hush_chat
        const/4 v0, 0x1
        return v0
        :hush_chat
        neg-long v0, p1
        invoke-static {v0, v1}, $LONG_OBJECT->valueOf(J)$LONG_OBJECT
        move-result-object v0
        invoke-static {p0}, $CONTROLLER->getInstance(I)$CONTROLLER
        move-result-object v1
        invoke-virtual {v1, v0}, $CONTROLLER->$GET_CHAT
        move-result-object v0
        if-eqz v0, :hush_no
        invoke-static {v0}, $CHAT_OBJECT->canSendPhoto($TL_CHAT)Z
        move-result v0
        return v0
        :hush_no
        const/4 v0, 0x0
        return v0
    """)
    stub("captionLimit", 2, """
        invoke-static {p0}, $CONTROLLER->getInstance(I)$CONTROLLER
        move-result-object v0
        invoke-virtual {v0}, $CONTROLLER->getCaptionMaxLengthLimit()I
        move-result v0
        return v0
    """)
    stub("entities", 4, """
        invoke-static {p0}, $MEDIA_DATA->getInstance(I)$MEDIA_DATA
        move-result-object v0
        const/4 v1, 0x1
        invoke-virtual {v0, p1, v1, v1}, $MEDIA_DATA->$ENTITIES
        move-result-object v0
        return-object v0
    """)
    stub("text", 2, """
        check-cast p0, $chat
        iget-object v0, p0, ${site.enter}
        if-eqz v0, :hush_none
        invoke-virtual {v0}, $ENTER_VIEW->getFieldText()$CHAR_SEQUENCE
        move-result-object v0
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """)
    stub("clearText", 3, """
        check-cast p0, $chat
        iget-object v0, p0, ${site.enter}
        if-eqz v0, :hush_done
        const-string v1, ""
        invoke-virtual {v0, v1}, $ENTER_VIEW->setFieldText($CHAR_SEQUENCE)V
        :hush_done
        return-void
    """)
    stub("clearReply", 2, """
        check-cast p0, $chat
        const/4 v0, 0x0
        iput-object v0, p0, ${site.reply}
        iput-object v0, p0, ${site.quote}
        return-void
    """)

    // p0 account, p1 and p2 the chat, p3 path, p4 caption, p5 formatting, p6 to p9 the draft's
    // reply, thread, quote and send arguments, p10 and p11 the direct messages peer.
    val send = site.photoSend
    val types = send.method.origParameterTypes
    val sources = send.sources + mapOf(8 to "p5", 5 to "p6", 6 to "p7", 7 to "p8", 18 to "p9", 21 to "p10")
    val casts = """
        check-cast p6, ${types[5]}
        check-cast p7, ${types[6]}
        check-cast p8, ${types[7]}
        check-cast p9, ${types[18]}
    """.trimIndent()
    copyCall(CopySend(send.method, sources, send.literals), 12).let { (smali, registers) -> stub("sendPhoto", registers, "$casts\n$smali") }
}
