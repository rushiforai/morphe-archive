/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.spoilers

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.translate.ChatHeader
import app.morphe.patches.telegram.misc.translate.resolveChatHeader
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.names.addInstructions
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val CHAT_REVEAL = "$EXTENSION_PACKAGE/misc/ChatReveal;"
internal const val TEXT_BLOCK = "Lorg/telegram/messenger/MessageObject\$TextLayoutBlock;"
private const val EXPANDED = "$MESSAGE_OBJECT->expandedQuotes:Ljava/util/HashSet;"
private const val HEADER_MENU = "$CHAT_REVEAL->headerMenu(Ljava/lang/Object;)V"
private const val HEADER_CLICK = "$CHAT_REVEAL->headerClick(Ljava/lang/Object;I)Z"
private const val SEARCH_HIT = "$CHAT_REVEAL->searchHit(Ljava/lang/Object;IILjava/util/ArrayList;)V"
private const val OBJECT = "Ljava/lang/Object;"
private const val LIST = "Ljava/util/ArrayList;"
private const val CHILD_COUNT = "Landroid/view/ViewGroup;->getChildCount()I"
private const val INDEX_OF = "Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I"
private const val PATCH = "Reveal spoilers"

/** The parameter types of the message row's search marking. */
private val SEARCH_MARK = listOf("Z", "I", "Ljava/lang/String;", "Z")

/** The extension's item numbers, which Telegram's header menu may never use. */
internal const val SPOILERS_ITEM = 0x4854540C
internal const val QUOTES_ITEM = 0x4854540D

/**
 * The message row [cell] and its search marking [search], which marks a match in the row's text
 * blocks. [message] is the row's message, [highlight] whether the row is the highlighted hit, and
 * the row lays itself out again through [expand] on its chat's [delegate]. [blockSpoilers] is a
 * text block's list of spoiler covers.
 */
internal class ChatRevealSite(
    val cell: String, val search: MutableMethod, val message: String, val highlight: FieldReference,
    val delegate: FieldReference, val expand: MethodReference, val blockSpoilers: FieldReference,
)

/** The chat screen [chat], its menu at the top [header], its loaded [messages] and its message [list]. */
internal class ChatMenuSite(val chat: String, val header: ChatHeader, val messages: FieldReference, val list: FieldReference)

/** Which of the chat's [menu] items and quotes opening on [searchHits] went in. */
internal class ChatRevealParts(val menu: Boolean, val searchHits: Boolean)

/**
 * Show all spoilers and Expand all quotes in a chat's menu at the top, and collapsed quotes that
 * open on a search hit. Each goes in on its own, and one that doesn't fit this build leaves the
 * rest of Reveal spoilers as it is.
 */
internal fun BytecodePatchContext.insertChatReveal(): ChatRevealParts {
    val site = try {
        resolveChatReveal()
    } catch (unfit: PatchException) {
        patchLog.warning("$PATCH: ${unfit.message}. The patch goes on without Show all spoilers, Expand all quotes " +
            "or quotes opening on search hits.")
        return ChatRevealParts(menu = false, searchHits = false)
    }
    val menu = try {
        resolveChatMenu(site).also {
            // Assembled on copies first, so a refusal leaves the app untouched.
            insertHeaderMenu(MutableMethod(ImmutableMethod.of(it.header.visibility)))
            insertHeaderClick(MutableMethod(ImmutableMethod.of(it.header.delegate)))
        }
    } catch (unfit: PatchException) {
        patchLog.warning("$PATCH: ${unfit.message}. The patch goes on without Show all spoilers and Expand all quotes.")
        null
    }
    val marks = try {
        searchMarks(site).also { insertSearchHits(MutableMethod(ImmutableMethod.of(site.search)), it) }
    } catch (unfit: PatchException) {
        patchLog.warning("$PATCH: ${unfit.message}. The patch goes on without quotes opening on search hits.")
        null
    }
    if (menu == null && marks == null) return ChatRevealParts(menu = false, searchHits = false)
    writeChatRevealStubs(site)
    if (menu != null) {
        writeChatMenuStubs(menu)
        insertHeaderMenu(menu.header.visibility)
        insertHeaderClick(menu.header.delegate)
    }
    if (marks != null) insertSearchHits(site.search, marks)
    return ChatRevealParts(menu = menu != null, searchHits = marks != null)
}

/**
 * The message row's search marking is the one method of its shape that gives the message a new set
 * of open quotes, which it does for a reply's quote, and then asks the chat's delegate to lay the
 * row out again. The extension opens a quote the same way.
 */
internal fun BytecodePatchContext.resolveChatReveal(): ChatRevealSite {
    requireStatusMethod("chatRevealMenu")
    requireStatusMethod("searchHitQuotes")
    controlHook(CHAT_REVEAL, "headerMenu", listOf(OBJECT), "V")
    controlHook(CHAT_REVEAL, "headerClick", listOf(OBJECT, "I"), "Z")
    controlHook(CHAT_REVEAL, "searchHit", listOf(OBJECT, "I", "I", LIST), "V")
    controlHook(CHAT_REVEAL, "addHeaderItem", listOf(OBJECT, "I", "I", "Ljava/lang/String;"), OBJECT)
    for (name in listOf("hasHeader", "highlighted", "collapsedQuote", "spoilersRevealed")) controlHook(CHAT_REVEAL, name, listOf(OBJECT), "Z")
    for (name in listOf("chatOf", "listView", "cellMessage", "blockMessage")) controlHook(CHAT_REVEAL, name, listOf(OBJECT), OBJECT)
    for (name in listOf("messages", "textBlocks", "blockSpoilers")) controlHook(CHAT_REVEAL, name, listOf(OBJECT), LIST)
    for (name in listOf("blockStart", "blockEnd", "blockIndex")) controlHook(CHAT_REVEAL, name, listOf(OBJECT), "I")
    for (name in listOf("openCell", "revealSpoilers", "forceUpdate")) controlHook(CHAT_REVEAL, name, listOf(OBJECT), "V")
    controlHook(CHAT_REVEAL, "caption", listOf(OBJECT), "Ljava/lang/CharSequence;")
    controlHook(CHAT_REVEAL, "expandedQuotes", listOf(OBJECT), "Ljava/util/HashSet;")
    controlHook(CHAT_REVEAL, "setExpandedQuotes", listOf(OBJECT, "Ljava/util/HashSet;"), "V")
    controlMembers(MESSAGE_OBJECT, "textLayoutBlocks:$LIST", "expandedQuotes:Ljava/util/HashSet;", "forceUpdate:Z",
        "caption:Ljava/lang/CharSequence;", "isSpoilersRevealed:Z")
    controlMembers(TEXT_BLOCK, "charactersOffset:I", "charactersEnd:I", "index:I", "messageObject:$MESSAGE_OBJECT",
        "quoteCollapse:Z", "collapsed()Z")

    // A block's spoiler covers: the list the text layout hands SpoilerEffect once it has checked
    // that the message's spoilers aren't revealed.
    val blocks = tgMutableClassDefByOrNull(TEXT_BLOCKS)
    controlShape(blocks != null, "MessageObject.TextLayoutBlocks is missing")
    val layout = blocks!!.methods.filter { it.origName == "<init>" && it.origParameterTypes.firstOrNull() == MESSAGE_OBJECT }
        .controlSingle("text layout constructor").controlBody()
    val revealed = layout.indexOfFirst { it.controlRef() == SPOILERS_REVEALED }
    val add = (maxOf(revealed, 0) until layout.size).firstOrNull { i ->
        layout[i].call()?.let { it.origParameterTypes == ADD && it.origReturnType == "V" } == true
    }
    controlShape(revealed >= 0 && add != null, "the text layout no longer covers spoilers after checking")
    val blockSpoilers = (revealed until add!!).mapNotNull { i ->
        layout[i].takeIf { it.opcode == Opcode.IGET_OBJECT }?.controlField()?.takeIf { it.origDefiningClass == TEXT_BLOCK && it.type == LIST }
    }.distinctBy { it.toString() }.controlSingle("a text block's spoiler covers")
    requireField(blockSpoilers, "a text block's spoiler covers")

    val found = mutableListOf<Pair<String, String>>()
    forEachClassMentioning(Mention.reference(EXPANDED)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.forEach { m ->
            if (!AccessFlags.STATIC.isSet(m.accessFlags) && m.origParameterTypes == SEARCH_MARK && m.origReturnType == "Z" &&
                m.controlBody().any { it.opcode == Opcode.IPUT_OBJECT && it.controlRef() == EXPANDED }
            ) found += cls.type to signature(m)
        }
    }
    val (cell, markName) = found.controlSingle("the message row's search marking")
    val cellClass = tgMutableClassDefBy(cell)
    controlShape(AccessFlags.PUBLIC.isSet(cellClass.accessFlags), "the message row is inaccessible")
    val search = cellClass.methods.single { signature(it) == markName }

    // After the new set goes in, the row's delegate field is read and asked to lay the row out again.
    // Other row fields are read in between (13.2.2 adds the opened quotes to the set first), so the
    // call is found by its shape and the delegate by the read that feeds it.
    val marks = search.controlBody()
    val opened = marks.indexOfFirst { it.opcode == Opcode.IPUT_OBJECT && it.controlRef() == EXPANDED }
    val asked = (opened + 1 until marks.size).firstOrNull { i ->
        val call = marks[i].takeIf { it.opcode == Opcode.INVOKE_INTERFACE }?.call()
        call != null && call.returnType == "V" && call.parameterTypes.map { it.toString() } == listOf(cell, "Z")
    }
    controlShape(asked != null, "the search marking no longer asks the chat to lay the row out again")
    val expand = marks[asked!!].call()!!
    val held = marks[asked].namedRegisters().firstOrNull()
    val read = (asked - 1 downTo opened + 1).firstOrNull { i ->
        marks[i].opcode == Opcode.IGET_OBJECT && (marks[i] as OneRegisterInstruction).registerA == held
    }?.takeIf { marks[it].controlField()?.definingClass == cell }
    controlShape(read != null && marks[read].controlField()!!.type == expand.definingClass,
        "the search marking no longer tells the chat about the quotes it opened")
    val delegate = marks[read!!].controlField()!!
    requireField(delegate, "the message row's delegate")
    val delegateClass = tgClassDefByOrNull(delegate.type)
    controlShape(delegateClass != null && AccessFlags.PUBLIC.isSet(delegateClass.accessFlags) &&
        AccessFlags.INTERFACE.isSet(delegateClass.accessFlags), "the message row's delegate is inaccessible")

    val getter = cellClass.methods.filter { it.origName == "getMessageObject" && it.parameterTypes.isEmpty() && it.origReturnType == MESSAGE_OBJECT }
        .controlSingle("the message row's message")
    val setter = cellClass.methods.filter { it.origName == "setHighlighted" && it.parameterTypes.map { p -> p.toString() } == listOf("Z") && it.returnType == "V" }
        .controlSingle("the message row's highlight setter")
    for (method in listOf(getter, setter)) {
        controlShape(AccessFlags.PUBLIC.isSet(method.accessFlags) && !AccessFlags.STATIC.isSet(method.accessFlags), "${method.name} is inaccessible")
    }
    // The highlight is the flag the setter compares the new value with and then stores.
    val flags = setter.controlBody()
    fun own(opcode: Opcode) = flags.filter { it.opcode == opcode }.mapNotNull { it.controlField() }.filter { it.definingClass == cell }
    val stored = own(Opcode.IPUT_BOOLEAN).map { it.toString() }
    val highlight = own(Opcode.IGET_BOOLEAN).filter { it.toString() in stored }.distinctBy { it.toString() }
        .controlSingle("the message row's highlight")
    requireField(highlight, "the message row's highlight")
    return ChatRevealSite(cell, search, reference(getter), highlight, delegate, expand!!, blockSpoilers)
}

/**
 * The chat screen is the one that highlights a search hit: it looks the hit up in its loaded
 * messages, walks its list's rows, highlights the hit's row and has the row mark the match. The
 * menu at the top is the one Translate with an outside service adds to.
 */
internal fun BytecodePatchContext.resolveChatMenu(site: ChatRevealSite): ChatMenuSite {
    val found = mutableListOf<Pair<String, String>>()
    val searchParameters = site.search.parameterTypes.map { it.toString() }
    forEachClassMentioning(Mention.member(site.cell, site.search.name) and Mention.member(site.cell, "setHighlighted")) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.forEach { m ->
            val calls = m.controlBody().mapNotNull { it.call() }
            if (!AccessFlags.STATIC.isSet(m.accessFlags) && m.parameterTypes.map { it.toString() } == listOf("Z") && m.returnType == "V" &&
                calls.any { it.definingClass == site.cell && it.name == "setHighlighted" } &&
                calls.any { it.definingClass == site.cell && it.name == site.search.name && it.parameterTypes.map { p -> p.toString() } == searchParameters } &&
                calls.any { it.toString() == CHILD_COUNT } && calls.any { it.toString() == INDEX_OF }
            ) found += cls.type to signature(m)
        }
    }
    val (chat, highlighterName) = found.controlSingle("the chat's search highlight")
    val chatClass = tgMutableClassDefBy(chat)
    controlShape(AccessFlags.PUBLIC.isSet(chatClass.accessFlags), "the chat screen is inaccessible")
    val steps = chatClass.methods.single { signature(it) == highlighterName }.controlBody()

    // The list and the rows each come from one of the chat's fields.
    fun read(at: Int): FieldReference? {
        val register = steps[at].namedRegisters().firstOrNull() ?: return null
        val source = (at - 1 downTo 0).firstOrNull { i -> steps[i].opcode.setsRegister() && (steps[i] as? OneRegisterInstruction)?.registerA == register }
        return source?.let { steps[it] }?.takeIf { it.opcode == Opcode.IGET_OBJECT }?.controlField()?.takeIf { it.definingClass == chat }
    }
    fun from(ref: String, what: String): FieldReference {
        val uses = steps.indices.filter { steps[it].call()?.toString() == ref }
        controlShape(uses.isNotEmpty(), "the chat's search highlight no longer reads $what")
        return uses.map { read(it) }.distinctBy { it.toString() }.controlSingle(what)
            ?: throw PatchException("Local controls: $what isn't one of the chat's fields (before editing)")
    }
    val messages = from(INDEX_OF, "the chat's loaded messages")
    val list = from(CHILD_COUNT, "the chat's message list")
    controlShape(messages.type == LIST, "the chat's loaded messages aren't a list")
    requireField(messages, "the chat's loaded messages")
    requireField(list, "the chat's message list")

    val header = resolveChatHeader(chat, chatClass, PATCH)
    val clicks = header.delegate.controlBody()
    for (item in listOf(SPOILERS_ITEM, QUOTES_ITEM)) {
        controlShape(clicks.filterIsInstance<SwitchPayload>().none { p -> p.switchElements.any { it.key == item } } &&
            clicks.none { (it as? NarrowLiteralInstruction)?.narrowLiteral == item }, "the header menu already uses the extension's number")
    }
    return ChatMenuSite(chat, header, messages, list)
}

/** The row's two calls that mark a match: one in the caption's blocks, one in the text's. */
internal fun searchMarks(site: ChatRevealSite): List<Int> {
    val body = site.search.controlBody()
    val marks = body.indices.filter { i ->
        body[i].opcode in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE) && body[i].call()?.let {
            it.definingClass == site.cell && it.origParameterTypes == listOf("I", "I", LIST) && it.returnType == "V"
        } == true
    }
    controlShape(marks.size == 2, "the search marking no longer marks a match in the caption and the text")
    return marks
}

/** The match and its blocks go to the extension right before the row marks it, with the same registers. */
private fun insertSearchHits(target: MutableMethod, marks: List<Int>) {
    for (at in marks.sortedDescending()) {
        val call = target.getInstruction(at)
        val registers = call.namedRegisters()
        target.addInstructions(at, if (call.opcode == Opcode.INVOKE_VIRTUAL_RANGE) {
            "invoke-static/range {v${registers.first()} .. v${registers.last()}}, $SEARCH_HIT"
        } else {
            "invoke-static {${registers.joinToString { "v$it" }}}, $SEARCH_HIT"
        })
    }
}

/** The chat updates its Translate item when it's built, and the extension adds its own beside it. */
private fun insertHeaderMenu(target: MutableMethod) {
    val self = target.implementation!!.registerCount - 1
    target.addInstructions(0, "invoke-static/range {v$self .. v$self}, $HEADER_MENU")
}

/** The header's choices go to the extension first, and its own items stop there. */
private fun insertHeaderClick(target: MutableMethod) {
    val first = target.implementation!!.registerCount - 2
    target.addInstructionsWithLabels(0, """
        invoke-static/range {v$first .. v${first + 1}}, $HEADER_CLICK
        move-result v0
        if-eqz v0, :hush_stock
        return-void
    """, ExternalLabel("hush_stock", target.getInstruction(0)))
}

/** The stubs both items and the search hits use, from the members [site] found. */
internal fun BytecodePatchContext.writeChatRevealStubs(site: ChatRevealSite) {
    val cell = site.cell
    writeStub(CHAT_REVEAL, "cellMessage", 2, """
        instance-of v0, p0, $cell
        if-eqz v0, :hush_none
        check-cast p0, $cell
        invoke-virtual {p0}, ${site.message}
        move-result-object v0
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """)
    writeStub(CHAT_REVEAL, "highlighted", 1, """
        check-cast p0, $cell
        iget-boolean p0, p0, ${site.highlight}
        return p0
    """)
    // What a tap on a quote's expand button does once the message has its new set of open quotes.
    writeStub(CHAT_REVEAL, "openCell", 3, """
        check-cast p0, $cell
        iget-object v0, p0, ${site.delegate}
        if-eqz v0, :hush_none
        const/4 v1, 0x0
        invoke-interface {v0, p0, v1}, ${site.expand}
        :hush_none
        return-void
    """)
    writeStub(CHAT_REVEAL, "blockSpoilers", 1, """
        check-cast p0, $TEXT_BLOCK
        iget-object p0, p0, ${site.blockSpoilers}
        return-object p0
    """)
    for ((name, field) in listOf("blockStart" to "charactersOffset", "blockEnd" to "charactersEnd", "blockIndex" to "index")) {
        writeStub(CHAT_REVEAL, name, 1, """
            check-cast p0, $TEXT_BLOCK
            iget p0, p0, $TEXT_BLOCK->$field:I
            return p0
        """)
    }
    writeStub(CHAT_REVEAL, "blockMessage", 1, """
        check-cast p0, $TEXT_BLOCK
        iget-object p0, p0, $TEXT_BLOCK->messageObject:$MESSAGE_OBJECT
        return-object p0
    """)
    writeStub(CHAT_REVEAL, "collapsedQuote", 2, """
        check-cast p0, $TEXT_BLOCK
        iget-boolean v0, p0, $TEXT_BLOCK->quoteCollapse:Z
        if-eqz v0, :hush_no
        invoke-virtual {p0}, $TEXT_BLOCK->collapsed()Z
        move-result v0
        :hush_no
        return v0
    """)
    for ((name, field) in listOf("textBlocks" to "textLayoutBlocks:$LIST", "caption" to "caption:Ljava/lang/CharSequence;",
        "expandedQuotes" to "expandedQuotes:Ljava/util/HashSet;")) {
        writeStub(CHAT_REVEAL, name, 1, """
            check-cast p0, $MESSAGE_OBJECT
            iget-object p0, p0, $MESSAGE_OBJECT->$field
            return-object p0
        """)
    }
    writeStub(CHAT_REVEAL, "spoilersRevealed", 1, """
        check-cast p0, $MESSAGE_OBJECT
        iget-boolean p0, p0, $SPOILERS_REVEALED
        return p0
    """)
    writeStub(CHAT_REVEAL, "setExpandedQuotes", 2, """
        check-cast p0, $MESSAGE_OBJECT
        iput-object p1, p0, $EXPANDED
        return-void
    """)
    for ((name, field) in listOf("revealSpoilers" to SPOILERS_REVEALED, "forceUpdate" to "$MESSAGE_OBJECT->forceUpdate:Z")) {
        writeStub(CHAT_REVEAL, name, 2, """
            check-cast p0, $MESSAGE_OBJECT
            const/4 v0, 0x1
            iput-boolean v0, p0, $field
            return-void
        """)
    }
}

/** The menu's stubs, from the members [menu] found. */
internal fun BytecodePatchContext.writeChatMenuStubs(menu: ChatMenuSite) {
    val chat = menu.chat
    val header = menu.header
    // A null is no instance of anything, so a chat that built no item answers no.
    writeStub(CHAT_REVEAL, "hasHeader", 2, """
        check-cast p0, $chat
        iget-object v0, p0, ${header.translateItem}
        instance-of v0, v0, ${header.translateItem.type}
        return v0
    """)
    writeStub(CHAT_REVEAL, "addHeaderItem", 5, """
        check-cast p0, $chat
        iget-object v0, p0, ${header.headerItem}
        invoke-virtual {v0, p1, p2, p3}, ${header.lazyAdd}
        move-result-object v0
        return-object v0
    """)
    writeStub(CHAT_REVEAL, "chatOf", 2, """
        check-cast p0, ${header.outer.definingClass}
        iget-object v0, p0, ${header.outer}
        return-object v0
    """)
    for ((name, field) in listOf("messages" to menu.messages, "listView" to menu.list)) {
        writeStub(CHAT_REVEAL, name, 1, """
            check-cast p0, $chat
            iget-object p0, p0, $field
            return-object p0
        """)
    }
}

/** Throws unless [field] is a public instance field the extension can read. */
private fun BytecodePatchContext.requireField(field: FieldReference, what: String) {
    val declared = tgClassDefByOrNull(field.definingClass)?.fields?.singleOrNull { it.name == field.name && it.type == field.type }
    controlShape(declared != null && AccessFlags.PUBLIC.isSet(declared.accessFlags) && !AccessFlags.STATIC.isSet(declared.accessFlags),
        "$what is inaccessible")
}

private fun signature(method: Method) = "${method.name}(${method.parameterTypes.joinToString("")})${method.returnType}"
private fun reference(method: Method) = "${method.definingClass}->${signature(method)}"
