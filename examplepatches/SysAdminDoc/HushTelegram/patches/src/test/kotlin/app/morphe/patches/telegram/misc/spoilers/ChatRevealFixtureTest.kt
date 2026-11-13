/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.spoilers

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.mymessages.MY_MESSAGES
import app.morphe.patches.telegram.misc.mymessages.myMessagesPatch
import app.morphe.patches.telegram.misc.translate.OUTSIDE_TRANSLATE
import app.morphe.patches.telegram.misc.translate.OutsideTranslateFixtureTest
import app.morphe.patches.telegram.misc.translate.outsideTranslatePatch
import app.morphe.util.ControlFlow
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origRef
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.AfterClass
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.lang.ref.SoftReference

private const val EXPANDED = "$MESSAGE_OBJECT->expandedQuotes:Ljava/util/HashSet;"
private val SEARCH_MARK = listOf("Z", "I", "Ljava/lang/String;", "Z")

/** The message row's search marking, the chat's search highlight and the chat's menu at the top. */
class ChatRevealFixtureTest {
    private val menuHook = "$CHAT_REVEAL->headerMenu(Ljava/lang/Object;)V"
    private val clickHook = "$CHAT_REVEAL->headerClick(Ljava/lang/Object;I)Z"
    private val searchHook = "$CHAT_REVEAL->searchHit(Ljava/lang/Object;IILjava/util/ArrayList;)V"

    private fun Instruction.shape() = listOf(opcode, namedRegisters(), origRef())
    private fun Instruction.buildRef() = (this as? ReferenceInstruction)?.reference?.toString()
    private fun BytecodePatchContext.flag(name: String) =
        (tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.controlBody().first() as WideLiteralInstruction).wideLiteral
    private fun BytecodePatchContext.stub(name: String) = tgMutableClassDefBy(CHAT_REVEAL).methods.single { it.origName == name }.controlBody()

    @Test fun `the chat menu and the search marking ask first and keep Telegram's own steps`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val site = context.resolveChatReveal()
            val menu = context.resolveChatMenu(site)
            if (name.contains("-73039")) {
                // Read from the build's own search marking, which opens a reply's quote, and the chat's search highlight.
                assertEquals("Lorg/telegram/ui/Cells/s1;", site.cell)
                assertEquals("t3", site.search.name)
                assertEquals("Lorg/telegram/ui/Cells/s1;->x6:Z", site.highlight.toString())
                assertEquals("Lorg/telegram/ui/Cells/s1;->Sa:Lorg/telegram/ui/Cells/n1;", site.delegate.toString())
                assertEquals("Lorg/telegram/ui/Cells/n1;->x1(Lorg/telegram/ui/Cells/s1;Z)V", site.expand.toString())
                assertEquals("y", site.blockSpoilers.name)
                assertEquals("Lorg/telegram/ui/rn;", menu.chat)
                assertEquals("Lorg/telegram/ui/rn;->L6:Ljava/util/ArrayList;", menu.messages.toString())
                assertEquals("A0", menu.list.name)
            }
            val marks = searchMarks(site)
            val searchBefore = ImmutableMethod.of(site.search).controlBody()
            val shownBefore = ImmutableMethod.of(menu.header.visibility).controlBody()
            val clickBefore = ImmutableMethod.of(menu.header.delegate).controlBody().filter { it.opcode != Opcode.NOP }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { context.applyChatReveal() })

            // Search: one call right before each of Telegram's two marks, with the mark's own registers.
            val search = site.search.controlBody()
            assertEquals("$name: two calls", searchBefore.size + 2, search.size)
            val placed = marks.mapIndexed { n, at -> at + n }
            for ((n, at) in placed.withIndex()) {
                val mark = searchBefore[marks[n]]
                assertEquals(searchHook, search[at].controlRef())
                assertEquals(if (mark.opcode == Opcode.INVOKE_VIRTUAL_RANGE) Opcode.INVOKE_STATIC_RANGE else Opcode.INVOKE_STATIC, search[at].opcode)
                assertEquals("$name: the row, the match and its blocks", mark.namedRegisters(), search[at].namedRegisters())
                assertEquals("$name: Telegram's mark follows", mark.shape(), search[at + 1].shape())
            }
            val stock = search.indices.filter { it !in placed }
            for ((i, at) in stock.withIndex()) assertEquals("$name: stock marking $i", searchBefore[i].shape(), search[at].shape())
            val flow = ControlFlow.of(site.search)
            for (at in placed) {
                assertEquals("$name: every way to the mark goes through the call", listOf(at), flow.normal.indices.filter { at + 1 in flow.normal[it] })
            }

            val shown = menu.header.visibility.controlBody()
            assertEquals("$name: one instruction", shownBefore.size + 1, shown.size)
            assertEquals(menuHook, shown[0].controlRef())
            assertEquals("$name: the chat", listOf(menu.header.visibility.implementation!!.registerCount - 1), shown[0].namedRegisters())
            for (i in shownBefore.indices) assertEquals("$name: stock updater $i", shownBefore[i].shape(), shown[i + 1].shape())

            val clicked = menu.header.delegate.controlBody().filter { it.opcode != Opcode.NOP }
            val top = menu.header.delegate.implementation!!.registerCount - 2
            assertEquals("$name: four instructions", clickBefore.size + 4, clicked.size)
            assertEquals(listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID), clicked.take(4).map { it.opcode })
            assertEquals(clickHook, clicked[0].controlRef())
            assertEquals("$name: the delegate and the ID", listOf(top, top + 1), clicked[0].namedRegisters())
            for (i in clickBefore.indices) assertEquals("$name: stock click $i", clickBefore[i].shape(), clicked[i + 4].shape())

            fun refs(stub: String, opcode: Opcode) = context.stub(stub).filter { it.opcode == opcode }.map { it.buildRef() }
            assertEquals("$name: the row's message", listOf(site.message), refs("cellMessage", Opcode.INVOKE_VIRTUAL))
            assertEquals("$name: the row's highlight", listOf(site.highlight.toString()), refs("highlighted", Opcode.IGET_BOOLEAN))
            assertEquals("$name: the row's delegate", listOf(site.delegate.toString()), refs("openCell", Opcode.IGET_OBJECT))
            assertEquals("$name: the call a quote's expand button makes", listOf(site.expand.toString()), refs("openCell", Opcode.INVOKE_INTERFACE))
            assertEquals("$name: a block's spoiler covers", listOf(site.blockSpoilers.toString()), refs("blockSpoilers", Opcode.IGET_OBJECT))
            assertEquals("$name: the chat's loaded messages", listOf(menu.messages.toString()), refs("messages", Opcode.IGET_OBJECT))
            assertEquals("$name: the chat's list", listOf(menu.list.toString()), refs("listView", Opcode.IGET_OBJECT))
            assertEquals("$name: the delegate's chat", listOf(menu.header.outer.toString()), refs("chatOf", Opcode.IGET_OBJECT))
            assertEquals("$name: the item adder Telegram's own Translate uses", listOf(menu.header.lazyAdd.toString()), refs("addHeaderItem", Opcode.INVOKE_VIRTUAL))
            assertEquals("$name: a collapsible quote that is collapsed", listOf("$TEXT_BLOCK->quoteCollapse:Z", "$TEXT_BLOCK->collapsed()Z"),
                context.stub("collapsedQuote").filter { it.opcode != Opcode.CHECK_CAST }.mapNotNull { it.controlRef() })
            assertEquals("$name: the set Telegram's own marking writes", listOf(EXPANDED),
                context.stub("setExpandedQuotes").filter { it.opcode == Opcode.IPUT_OBJECT }.map { it.controlRef() })

            for (flag in listOf("chatRevealMenu", "searchHitQuotes")) assertEquals("$name: $flag", 1L, context.flag(flag))
        }
    }

    /** All three put their calls at the top of the same updater and delegate, whichever runs first. */
    @Test fun `the chat menu shares the header with Outside translate and My messages`() {
        for (build in Fixtures.declaredBuilds()) for (mineFirst in listOf(true, false)) {
            val name = "${build.name} (${if (mineFirst) "chat menu first" else "chat menu last"})"
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val header = context.resolveChatMenu(context.resolveChatReveal()).header
            val shownBefore = ImmutableMethod.of(header.visibility).controlBody()
            val clickBefore = ImmutableMethod.of(header.delegate).controlBody().filter { it.opcode != Opcode.NOP }
            val steps: List<Pair<String, () -> Unit>> = listOf("Outside translate" to { outsideTranslatePatch.execute(context) },
                "My messages" to { myMessagesPatch.execute(context) })
            val chatMenu = "chat menu" to { context.applyChatReveal() }
            for ((step, run) in if (mineFirst) listOf(chatMenu) + steps else steps + chatMenu) {
                assertEquals("$name: $step", emptyList<String>(), PatchLogCapture.warnings(run))
            }

            val shown = header.visibility.controlBody()
            assertEquals("$name: three calls", shownBefore.size + 3, shown.size)
            assertEquals(setOf(menuHook, "$OUTSIDE_TRANSLATE->headerMenu(Ljava/lang/Object;)V", "$MY_MESSAGES->headerMenu(Ljava/lang/Object;)V"),
                shown.take(3).map { it.controlRef() }.toSet())
            for (i in shownBefore.indices) assertEquals("$name: stock updater $i", shownBefore[i].shape(), shown[i + 3].shape())

            val clicked = header.delegate.controlBody().filter { it.opcode != Opcode.NOP }
            assertEquals("$name: three prefixes", clickBefore.size + 12, clicked.size)
            assertEquals(setOf(clickHook, "$OUTSIDE_TRANSLATE->headerClick(Ljava/lang/Object;I)Z", "$MY_MESSAGES->headerClick(Ljava/lang/Object;I)Z"),
                listOf(clicked[0], clicked[4], clicked[8]).map { it.controlRef() }.toSet())
            // No prefix holds padding, so their twelve instructions sit at the top of the body as they are.
            val flow = ControlFlow.of(header.delegate)
            for (prefix in 0 until 3) {
                assertEquals("$name: a no from prefix $prefix goes on", setOf(4 * prefix + 3, 4 * prefix + 4), flow.normal[4 * prefix + 2].toSet())
            }
            for (i in clickBefore.indices) assertEquals("$name: stock click $i", clickBefore[i].shape(), clicked[i + 12].shape())
            for (flag in listOf("chatRevealMenu", "searchHitQuotes", "outsideTranslate", "myMessages")) assertEquals("$name: $flag", 1L, context.flag(flag))
        }
    }

    @Test fun `a part that doesn't fit leaves the other part and the rest of the app as they were`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val full = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val found = full.resolveChatReveal()
            val chat = full.resolveChatMenu(found).chat

            // No text block class: neither part goes in, and nothing changes.
            val bare = PatchContexts.of(ExtensionDex.classes() + hosts(build).filter { it.type != full.tgMutableClassDefBy(TEXT_BLOCK).type })
            val cell = bare.tgMutableClassDefBy(found.cell)
            val before = cell.methods.associate { it.name + it.parameterTypes to it.controlBody().map { i -> i.shape() } }
            val chatBefore = bare.tgMutableClassDefBy(chat).methods.associate { it.name + it.parameterTypes to it.controlBody().map { i -> i.shape() } }
            val warned = PatchLogCapture.warnings { bare.applyChatReveal() }
            assertEquals("$name: one warning", 1, warned.size)
            assertTrue("$name: $warned", warned.single().endsWith("goes on without Show all spoilers, Expand all quotes or quotes opening on search hits."))
            assertEquals("$name: the row as it was", before, cell.methods.associate { it.name + it.parameterTypes to it.controlBody().map { i -> i.shape() } })
            assertEquals("$name: the chat as it was", chatBefore,
                bare.tgMutableClassDefBy(chat).methods.associate { it.name + it.parameterTypes to it.controlBody().map { i -> i.shape() } })
            for (flag in listOf("chatRevealMenu", "searchHitQuotes")) assertEquals("$name: $flag stays off", 0L, bare.flag(flag))
            assertTrue("$name: the stubs keep their stock bodies", bare.tgMutableClassDefBy(CHAT_REVEAL).methods
                .all { m -> m.controlBody().none { it.controlRef()?.startsWith("Lorg/telegram/") == true } })

            // No chat screen: the search hits still go in, the menu doesn't.
            val noChat = PatchContexts.of(ExtensionDex.classes() + hosts(build).filter { it.type != chat })
            val site = noChat.resolveChatReveal()
            val marking = site.search.controlBody().size
            val partial = PatchLogCapture.warnings { noChat.applyChatReveal() }
            assertEquals("$name: one warning", 1, partial.size)
            assertTrue("$name: $partial", partial.single().endsWith("goes on without Show all spoilers and Expand all quotes."))
            assertEquals("$name: the search hits", marking + 2, site.search.controlBody().size)
            assertEquals("$name: no menu", 0L, noChat.flag("chatRevealMenu"))
            assertEquals("$name: search hits on", 1L, noChat.flag("searchHitQuotes"))
            assertTrue("$name: the menu stubs keep their stock bodies", noChat.tgMutableClassDefBy(CHAT_REVEAL).methods
                .filter { it.origName in setOf("hasHeader", "addHeaderItem", "chatOf", "messages", "listView") }
                .all { m -> m.controlBody().none { it.controlRef()?.startsWith("Lorg/telegram/") == true } })
        }
    }

    private fun hosts(build: File): List<ClassDef> {
        val identity = FixtureDex.inputIdentity(build)
        return HOSTS[identity]?.get() ?: loadHosts(build).also {
            if (HOSTS.size >= 2) HOSTS.clear()
            HOSTS[identity] = SoftReference(it)
        }
    }

    /**
     * Outside translate's slice of the chat screen, the message row with its search marking and its
     * delegate, MessageObject's text layout, and what My messages reads for the shared header test.
     */
    private fun loadHosts(build: File): List<ClassDef> {
        val rows = FixtureDex.classesWhere(build, { true }) { m ->
            m.origParameterTypes == SEARCH_MARK && m.controlBody().any { it.opcode == Opcode.IPUT_OBJECT && it.controlRef() == EXPANDED }
        }
        // The row's delegate is the interface the marking asks to lay the row out once it has opened a reply's quote.
        val delegates = rows.flatMap { row -> row.methods.filter { it.origParameterTypes == SEARCH_MARK } }.mapNotNull { m ->
            val body = m.controlBody()
            val opened = body.indexOfFirst { it.opcode == Opcode.IPUT_OBJECT && it.controlRef() == EXPANDED }
            if (opened < 0) null else body.drop(opened + 1).mapNotNull { it.takeIf { i -> i.opcode == Opcode.INVOKE_INTERFACE }?.call() }
                .firstOrNull { it.returnType == "V" && it.parameterTypes.map { p -> p.toString() } == listOf(m.definingClass, "Z") }?.definingClass
        }.toSet()
        val types = setOf(MESSAGE_OBJECT, TEXT_BLOCKS, TEXT_BLOCK, "Lorg/telegram/tgnet/TLRPC\$User;", "Lorg/telegram/tgnet/TLRPC\$Chat;") + delegates
        return (OutsideTranslateFixtureTest().hosts(build) + (rows + FixtureDex.classes(build, types).values).map(ImmutableClassDef::of))
            .distinctBy { it.type }
    }

    companion object {
        private val HOSTS = mutableMapOf<String, SoftReference<List<ClassDef>>>()
        @AfterClass @JvmStatic fun releaseFixtures() { HOSTS.clear() }
    }
}
