/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.mymessages

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
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
import app.morphe.patches.telegram.misc.translate.ChatHeader
import app.morphe.patches.telegram.misc.translate.resolveChatHeader
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.names.addInstructions
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val MY_MESSAGES = "$EXTENSION_PACKAGE/misc/MyMessages;"
private const val HEADER_MENU = "$MY_MESSAGES->headerMenu(Ljava/lang/Object;)V"
private const val HEADER_CLICK = "$MY_MESSAGES->headerClick(Ljava/lang/Object;I)Z"
private const val FROM_USER = "search_from_user_id"
private const val ACCOUNT_CONFIG = "Lorg/telegram/messenger/UserConfig;"
private const val MESSAGES = "Lorg/telegram/messenger/MessagesController;"
private const val TL_USER = "Lorg/telegram/tgnet/TLRPC\$User;"
private const val TL_CHAT = "Lorg/telegram/tgnet/TLRPC\$Chat;"
private const val GET_USER = "$MESSAGES->getUser(Ljava/lang/Long;)$TL_USER"
private const val GET_CHAT = "$MESSAGES->getChat(Ljava/lang/Long;)$TL_CHAT"
private const val CALL_ON_CLICK = "Landroid/view/View;->callOnClick()Z"
private const val OBJECT = "Ljava/lang/Object;"
private const val NAME = "My messages"

/** The extension's item number, which Telegram's header menu may never use. */
internal const val MY_MESSAGES_ITEM = 0x48545408

@Suppress("unused")
val myMessagesPatch = bytecodePatch(
    name = NAME,
    description = "Adds My messages to a group's menu at the top, which searches the group for the messages you sent. " +
        "Starts off. Turn it on in HushTelegram settings > Conversations.",
    default = true,
) {
    category("Search")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveMyMessages()
        // Assembled on copies first, so a refusal leaves the app untouched.
        insertHeaderMenu(MutableMethod(ImmutableMethod.of(site.header.visibility)))
        insertHeaderClick(MutableMethod(ImmutableMethod.of(site.header.delegate)))
        writeMyMessagesStubs(site)
        insertHeaderMenu(site.header.visibility)
        insertHeaderClick(site.header.delegate)
        enableStatus("myMessages")
    }
}

/**
 * The chat screen [chat], its menu at the top [header], and the three steps Telegram's own instant
 * search takes to show one member's messages: open the search [openSearch], press the search-by-member
 * button [searchButton], and pick the member [searchUser].
 */
internal class MyMessagesSite(
    val chat: String, val header: ChatHeader, val openSearch: MethodReference, val searchButton: FieldReference,
    val searchUser: MethodReference,
)

/** The chat updates its Translate item when it's built, and the extension adds its own beside it. */
private fun insertHeaderMenu(target: MutableMethod) {
    val self = target.implementation!!.registerCount - 1
    target.addInstructions(0, "invoke-static/range {v$self .. v$self}, $HEADER_MENU")
}

/** The header's choices go to the extension first, and its own item stops there. */
private fun insertHeaderClick(target: MutableMethod) {
    val first = target.implementation!!.registerCount - 2
    target.addInstructionsWithLabels(0, """
        invoke-static/range {v$first .. v${first + 1}}, $HEADER_CLICK
        move-result v0
        if-eqz v0, :hush_stock
        return-void
    """, ExternalLabel("hush_stock", target.getInstruction(0)))
}

/**
 * The chat screen opened with a `search_from_user_id` argument searches that member's messages as
 * soon as it shows, in one method that reads the argument. Telegram writes it with putLong and reads
 * it with getInt, which always comes back 0, so the extension calls that method's steps itself with
 * the account's own user. The header menu is the one Translate with an outside service adds to.
 */
internal fun BytecodePatchContext.resolveMyMessages(): MyMessagesSite {
    requireStatusMethod("myMessages")
    controlHook(MY_MESSAGES, "headerMenu", listOf(OBJECT), "V")
    controlHook(MY_MESSAGES, "headerClick", listOf(OBJECT, "I"), "Z")
    for (name in listOf("hasHeader", "group", "search")) controlHook(MY_MESSAGES, name, listOf(OBJECT), "Z")
    controlHook(MY_MESSAGES, "addHeaderItem", listOf(OBJECT, "I", "I", "Ljava/lang/String;"), OBJECT)
    controlHook(MY_MESSAGES, "chatOf", listOf(OBJECT), OBJECT)

    // The instant search: the one method of a screen that reads the argument from its bundle.
    val readers = mutableListOf<Pair<String, String>>()
    forEachClassMentioning(Mention.string(FROM_USER)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.forEach { m ->
            val body = m.controlBody()
            if (!AccessFlags.STATIC.isSet(m.accessFlags) && m.origReturnType == "V" && m.parameterTypes.isEmpty() &&
                body.indices.any { i -> body[i].controlString() == FROM_USER && body.drop(i + 1).take(3).any { it.readsBundleId() } }
            ) readers += cls.type to "${m.name}()V"
        }
    }
    val (chat, readerName) = readers.controlSingle("the instant search")
    val chatClass = tgMutableClassDefBy(chat)
    controlShape(AccessFlags.PUBLIC.isSet(chatClass.accessFlags), "the chat screen is inaccessible")
    val reader = chatClass.methods.single { "${it.name}()V" == readerName && it.parameterTypes.isEmpty() }
    val steps = reader.controlBody()
    controlShape(steps.any { it.controlRef() == GET_USER } && steps.any { it.controlRef() == GET_CHAT },
        "the instant search no longer looks up the member it searches for")

    val ownCalls = steps.mapNotNull { it.call() }.filter { it.definingClass == chat }.distinctBy { it.toString() }
    val openSearch = ownCalls.filter { it.origParameterTypes == listOf("Ljava/lang/String;") && it.origReturnType == "V" }
        .controlSingle("the instant search's search opener")
    val searchUser = ownCalls.filter { it.origReturnType == "V" && it.origParameterTypes.sorted() == listOf(TL_CHAT, TL_USER).sorted() }
        .controlSingle("the instant search's member pick")
    val presses = steps.indices.filter { steps[it].controlRef() == CALL_ON_CLICK }
    val searchButton = presses.mapNotNull { at ->
        val pressed = steps[at].namedRegisters().firstOrNull()
        (at - 1 downTo 0).firstOrNull { i -> steps[i].opcode.setsRegister() && (steps[i] as? OneRegisterInstruction)?.registerA == pressed }
            ?.let { steps[it] }?.takeIf { it.opcode == Opcode.IGET_OBJECT }?.controlField()
    }.distinctBy { it.toString() }.controlSingle("the instant search's search-by-member button")
    controlShape(presses.isNotEmpty() && searchButton.definingClass == chat, "the search-by-member button isn't the chat's own")

    // The extension calls all three from its own class, as Telegram does in that order.
    for (step in listOf(openSearch, searchUser)) {
        val declared = chatClass.methods.filter { it.name == step.name && it.parameterTypes == step.parameterTypes && it.returnType == step.returnType }
            .controlSingle("${step.name} in the chat screen")
        controlShape(AccessFlags.PUBLIC.isSet(declared.accessFlags) && !AccessFlags.STATIC.isSet(declared.accessFlags),
            "${step.name} is inaccessible")
    }
    val button = chatClass.fields.filter { it.name == searchButton.name && it.type == searchButton.type }.controlSingle("${searchButton.name} field")
    controlShape(AccessFlags.PUBLIC.isSet(button.accessFlags) && !AccessFlags.STATIC.isSet(button.accessFlags), "${searchButton.name} is inaccessible")

    val header = resolveChatHeader(chat, chatClass, NAME)
    val clicks = header.delegate.controlBody()
    controlShape(clicks.filterIsInstance<SwitchPayload>().none { p -> p.switchElements.any { it.key == MY_MESSAGES_ITEM } } &&
        clicks.none { (it as? NarrowLiteralInstruction)?.narrowLiteral == MY_MESSAGES_ITEM },
        "the header menu already uses the extension's number")

    controlMembers(ACCOUNT_CONFIG, "static getInstance(I)$ACCOUNT_CONFIG", "getClientUserId()J")
    controlMembers(MESSAGES, "static getInstance(I)$MESSAGES", "getUser(Ljava/lang/Long;)$TL_USER", "getChat(Ljava/lang/Long;)$TL_CHAT")
    controlMembers(TL_CHAT, "broadcast:Z", "monoforum:Z")
    return MyMessagesSite(chat, header, openSearch, searchButton, searchUser)
}

/** BaseBundle.getInt or getLong, either of which the instant search has used for the member's ID. */
private fun Instruction.readsBundleId() = controlRef().let {
    it == "Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I" || it == "Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J" ||
        it == "Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I" || it == "Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J"
}

/** The stubs' bodies, from the members [site] found. */
internal fun BytecodePatchContext.writeMyMessagesStubs(site: MyMessagesSite) {
    val chat = site.chat
    val header = site.header
    // A null is no instance of anything, so a chat that built no item answers no.
    writeStub(MY_MESSAGES, "hasHeader", 2, """
        check-cast p0, $chat
        iget-object v0, p0, ${header.translateItem}
        instance-of v0, v0, ${header.translateItem.type}
        return v0
    """)
    // A group's ID is negative, and the chat behind it is neither a channel nor a channel's direct messages.
    writeStub(MY_MESSAGES, "group", 5, """
        check-cast p0, $chat
        invoke-virtual {p0}, ${header.dialogGetter}
        move-result-wide v0
        const-wide/16 v2, 0x0
        cmp-long v2, v0, v2
        if-gez v2, :no
        neg-long v0, v0
        invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v1
        invoke-virtual {p0}, ${header.accountGetter}
        move-result v0
        invoke-static {v0}, $MESSAGES->getInstance(I)$MESSAGES
        move-result-object v0
        invoke-virtual {v0, v1}, $GET_CHAT
        move-result-object v0
        if-eqz v0, :no
        iget-boolean v1, v0, $TL_CHAT->broadcast:Z
        if-nez v1, :no
        iget-boolean v1, v0, $TL_CHAT->monoforum:Z
        if-nez v1, :no
        const/4 v0, 0x1
        return v0
        :no
        const/4 v0, 0x0
        return v0
    """)
    writeStub(MY_MESSAGES, "addHeaderItem", 5, """
        check-cast p0, $chat
        iget-object v0, p0, ${header.headerItem}
        invoke-virtual {v0, p1, p2, p3}, ${header.lazyAdd}
        move-result-object v0
        return-object v0
    """)
    writeStub(MY_MESSAGES, "chatOf", 2, """
        check-cast p0, ${header.outer.definingClass}
        iget-object v0, p0, ${header.outer}
        return-object v0
    """)
    // The instant search's steps with the account's own user: open the search, press the
    // search-by-member button where the chat has one, then pick the user.
    val pick = site.searchUser.origParameterTypes.joinToString(", ") { if (it == TL_USER) "v0" else "v1" }
    writeStub(MY_MESSAGES, "search", 4, """
        check-cast p0, $chat
        invoke-virtual {p0}, ${header.accountGetter}
        move-result v0
        invoke-static {v0}, $ACCOUNT_CONFIG->getInstance(I)$ACCOUNT_CONFIG
        move-result-object v1
        invoke-virtual {v1}, $ACCOUNT_CONFIG->getClientUserId()J
        move-result-wide v1
        invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v1
        invoke-static {v0}, $MESSAGES->getInstance(I)$MESSAGES
        move-result-object v0
        invoke-virtual {v0, v1}, $GET_USER
        move-result-object v0
        if-nez v0, :found
        const/4 v0, 0x0
        return v0
        :found
        const-string v1, ""
        invoke-virtual {p0, v1}, ${site.openSearch}
        iget-object v1, p0, ${site.searchButton}
        if-eqz v1, :picked
        invoke-virtual {v1}, $CALL_ON_CLICK
        :picked
        const/4 v1, 0x0
        invoke-virtual {p0, $pick}, ${site.searchUser}
        const/4 v0, 0x1
        return v0
    """)
}
