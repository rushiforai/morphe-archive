/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.proxymenu

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.commerce.MENU_NEIGHBORS
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method

private const val PATCH = "Proxy in the chat list menu"
internal const val PROXY_MENU = "$EXTENSION_PACKAGE/misc/ProxyMenu;"
internal const val PROXY_MENU_SHOW = "$PROXY_MENU->show(I)Z"
internal const val BLOCKED_COUNTRY = "Lorg/telegram/messenger/MessagesController;->blockedCountry:Z"
internal const val PROXY_LIST = "Lorg/telegram/messenger/SharedConfig;->proxyList:Ljava/util/ArrayList;"
private const val LIST_EMPTY = "Ljava/util/ArrayList;->isEmpty()Z"
private const val PROXY_ENABLED = "proxy_enabled"
private const val PROXY_ROW_LABEL = "hush_proxy_row"

/**
 * Keeps Proxy in the chat list's menu (#67).
 *
 * Telegram builds that menu each time it opens and adds its Proxy row after either
 * `proxy_enabled` with a `proxy_ip`, or `MessagesController.blockedCountry` with a saved proxy in
 * `SharedConfig.proxyList`. The patch asks the extension right before the blockedCountry read, and
 * true jumps to the row's add, where both of Telegram's own paths arrive. Off by default.
 */
@Suppress("unused")
val proxyMenuPatch = bytecodePatch(
    name = PATCH,
    description = "Keeps Proxy in the chat list's menu, which Telegram only shows while a proxy is on or where " +
        "Telegram is blocked. Starts off. Turn it on in HushTelegram settings > Chat list.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveProxyMenu()
        val free = site.method.freeLocalsAt(PATCH, site.read, 1, listOf(site.row)).single()
        site.method.addInstructionsWithLabels(
            site.read,
            """
                const/4 v$free, 0x1
                invoke-static {v$free}, $PROXY_MENU_SHOW
                move-result v$free
                if-nez v$free, :$PROXY_ROW_LABEL
            """,
            ExternalLabel(PROXY_ROW_LABEL, site.method.getInstruction(site.row)),
        )
        enableStatus("proxyMenu")
    }
}

/** The chat list's menu, its blockedCountry read at [read], and [row], the first instruction of the Proxy row's add. */
internal class ProxyMenuSite(val method: MutableMethod, val read: Int, val row: Int)

internal fun BytecodePatchContext.resolveProxyMenu(): ProxyMenuSite {
    requireStatusMethod("proxyMenu")
    controlHook(PROXY_MENU, "show", listOf("I"), "Z")
    val menus = mutableListOf<Pair<String, Method>>()
    forEachClassMentioning(Mention.string(PROXY_ENABLED) and Mention.allReferences(MENU_NEIGHBORS)) { cls ->
        cls.methods.filter { method ->
            method.controlBody().let { body ->
                body.any { it.controlString() == PROXY_ENABLED } && body.any { it.controlRef() == BLOCKED_COUNTRY } &&
                    MENU_NEIGHBORS.all { label -> body.any { it.controlRef() == label } }
            }
        }.forEach { menus += cls.type to it }
    }
    val (type, found) = menus.controlSingle("the chat list's menu with a Proxy row")
    val method = tgMutableClassDefBy(type).methods.single {
        it.name == found.name && it.returnType == found.returnType &&
            it.parameterTypes.map(CharSequence::toString) == found.parameterTypes.map(CharSequence::toString)
    }
    val body = method.controlBody()
    val flow = ControlFlow.of(method)
    val read = body.indices.filter { body[it].opcode == Opcode.IGET_BOOLEAN && body[it].controlRef() == BLOCKED_COUNTRY }
        .controlSingle("the chat list menu's blocked country read")
    controlShape(read in 1 until body.size - 6, "the chat list menu's blocked country read has no Proxy row after it")
    val country = body[read].namedRegisters().first()
    val gate = read + 1
    controlShape(body[gate].opcode == Opcode.IF_EQZ && body[gate].namedRegisters() == listOf(country) &&
        flow.normal[gate].size == 2, "the chat list menu no longer branches on the blocked country at once")
    val skip = flow.normal[gate].single { it != gate + 1 }
    val list = body[gate + 1].namedRegisters().singleOrNull()
    controlShape(body[gate + 1].opcode == Opcode.SGET_OBJECT && body[gate + 1].controlRef() == PROXY_LIST &&
        body[gate + 2].controlRef() == LIST_EMPTY && body[gate + 2].namedRegisters() == listOf(list) &&
        body[gate + 3].opcode == Opcode.MOVE_RESULT, "the chat list menu no longer checks for a saved proxy after the blocked country")
    val empty = body[gate + 3].namedRegisters().single()
    val saved = gate + 4
    controlShape(body[saved].opcode == Opcode.IF_NEZ && body[saved].namedRegisters() == listOf(empty) &&
        flow.normal[saved].toSet() == setOf(saved + 1, skip), "the chat list menu no longer skips Proxy without a saved proxy")
    val row = saved + 1
    controlShape(skip > row, "the chat list menu's Proxy row no longer sits before where its checks skip to")
    // The read is reached only straight on from the controller it reads, so code put in front of it
    // runs on every path that asks about the blocked country, and the row is where the proxy_enabled
    // path arrives as well, so the jump takes a way in Telegram already takes.
    controlShape(body.indices.none { at -> at != read - 1 && read in flow.normal[at] } &&
        flow.normal[read - 1] == listOf(read), "the chat list menu's blocked country read has another way in")
    controlShape(body.indices.any { at -> at !in read..saved && row in flow.normal[at] },
        "the chat list menu's Proxy row is no longer shared with the proxy_enabled path")
    return ProxyMenuSite(method, read, row)
}
