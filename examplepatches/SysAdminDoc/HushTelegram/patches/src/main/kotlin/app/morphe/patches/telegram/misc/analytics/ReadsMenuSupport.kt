/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.analytics

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.messagemenu.messageMenuBuilders
import app.morphe.patches.telegram.misc.translate.ChatHeader
import app.morphe.patches.telegram.misc.translate.resolveChatHeader
import app.morphe.util.names.addInstructions
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val READS_MENU = "$EXTENSION_PACKAGE/misc/ReadsMenu;"
private const val HEADER_MENU = "$READS_MENU->headerMenu(Ljava/lang/Object;)V"
private const val HEADER_CLICK = "$READS_MENU->headerClick(Ljava/lang/Object;I)Z"
private const val OBJECT = "Ljava/lang/Object;"

/** The item's number, which Telegram's header menu may never use, after Chat reveal's two. */
internal const val READS_MENU_ITEM = 0x4854540E

/** The chat screen [chat] and its menu at the top [header], where Send read receipts goes (#69). */
internal class ReadsMenuSite(val chat: String, val header: ChatHeader)

/** The hooks go in on copies first, so a refusal leaves the app untouched, then the stubs and the hooks. */
internal fun BytecodePatchContext.installReadsMenu(site: ReadsMenuSite) {
    insertHeaderMenu(MutableMethod(ImmutableMethod.of(site.header.visibility)))
    insertHeaderClick(MutableMethod(ImmutableMethod.of(site.header.delegate)))
    writeReadsMenuStubs(site)
    insertHeaderMenu(site.header.visibility)
    insertHeaderClick(site.header.delegate)
}

/**
 * The chat's menu at the top, found the way Outside translate and My messages find it: the chat
 * screen is the one that builds the message menu, and the menu is the one Telegram's own Translate
 * item is added to. Refuses with a PatchException for a build that moved any of it.
 */
internal fun BytecodePatchContext.resolveReadsMenu(patch: String): ReadsMenuSite {
    controlHook(READS_MENU, "headerMenu", listOf(OBJECT), "V")
    controlHook(READS_MENU, "headerClick", listOf(OBJECT, "I"), "Z")
    controlHook(READS_MENU, "hasHeader", listOf(OBJECT), "Z")
    controlHook(READS_MENU, "addHeaderItem", listOf(OBJECT, "I", "I", "Ljava/lang/String;"), OBJECT)
    controlHook(READS_MENU, "chatOf", listOf(OBJECT), OBJECT)
    controlHook(READS_MENU, "dialogId", listOf(OBJECT), "J")
    controlHook(READS_MENU, "account", listOf(OBJECT), "I")

    val (chat, _) = messageMenuBuilders().controlSingle("message menu builder")
    val chatClass = tgMutableClassDefBy(chat)
    controlShape(AccessFlags.PUBLIC.isSet(chatClass.accessFlags), "the chat screen is inaccessible")
    val header = resolveChatHeader(chat, chatClass, patch)
    val clicks = header.delegate.controlBody()
    controlShape(clicks.filterIsInstance<SwitchPayload>().none { p -> p.switchElements.any { it.key == READS_MENU_ITEM } } &&
        clicks.none { (it as? NarrowLiteralInstruction)?.narrowLiteral == READS_MENU_ITEM },
        "the header menu already uses the extension's number")
    return ReadsMenuSite(chat, header)
}

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

/** The stubs' bodies, from the members [site] found. */
private fun BytecodePatchContext.writeReadsMenuStubs(site: ReadsMenuSite) {
    val chat = site.chat
    val header = site.header
    // A null is no instance of anything, so a chat that built no item answers no.
    writeStub(READS_MENU, "hasHeader", 2, """
        check-cast p0, $chat
        iget-object v0, p0, ${header.translateItem}
        instance-of v0, v0, ${header.translateItem.type}
        return v0
    """)
    writeStub(READS_MENU, "addHeaderItem", 5, """
        check-cast p0, $chat
        iget-object v0, p0, ${header.headerItem}
        invoke-virtual {v0, p1, p2, p3}, ${header.lazyAdd}
        move-result-object v0
        return-object v0
    """)
    writeStub(READS_MENU, "chatOf", 2, """
        check-cast p0, ${header.outer.definingClass}
        iget-object v0, p0, ${header.outer}
        return-object v0
    """)
    // The dialog ID Ghost mode keeps a chat's held read under, as the chat numbers it.
    writeStub(READS_MENU, "dialogId", 3, """
        check-cast p0, $chat
        invoke-virtual {p0}, ${header.dialogGetter}
        move-result-wide v0
        return-wide v0
    """)
    writeStub(READS_MENU, "account", 2, """
        check-cast p0, $chat
        invoke-virtual {p0}, ${header.accountGetter}
        move-result v0
        return v0
    """)
}
