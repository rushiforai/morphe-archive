/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.mymessages

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.translate.OUTSIDE_TRANSLATE
import app.morphe.patches.telegram.misc.translate.OutsideTranslateFixtureTest
import app.morphe.patches.telegram.misc.translate.outsideTranslatePatch
import app.morphe.util.ControlFlow
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
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/** The chat screen's instant search, its menu at the top and the click delegate My messages shares with Outside translate. */
class MyMessagesFixtureTest {
    private val user = "Lorg/telegram/tgnet/TLRPC\$User;"
    private val chat = "Lorg/telegram/tgnet/TLRPC\$Chat;"
    private val menu = "$MY_MESSAGES->headerMenu(Ljava/lang/Object;)V"
    private val click = "$MY_MESSAGES->headerClick(Ljava/lang/Object;I)Z"

    private fun Instruction.shape() = listOf(opcode, namedRegisters(), origRef())
    private fun Instruction.buildRef() = (this as? ReferenceInstruction)?.reference?.toString()

    /** Outside translate's slice of the chat screen, plus the user and chat classes the stubs read. */
    private fun hosts(build: File): List<ClassDef> =
        (OutsideTranslateFixtureTest().hosts(build) + FixtureDex.classes(build, setOf(user, chat)).values.map(ImmutableClassDef::of))
            .distinctBy { it.type }

    @Test fun `the header updater and click delegate ask first and the search takes Telegram's own steps`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val site = context.resolveMyMessages()
            if (name.contains("-73039")) {
                // Read from the build's own instant search: open the search, press the member button, pick the member.
                assertEquals("Lorg/telegram/ui/rn;", site.chat)
                assertEquals("Lorg/telegram/ui/rn;->Na(Ljava/lang/String;)V", site.openSearch.toString())
                assertEquals("Lorg/telegram/ui/rn;->i3:Landroid/widget/ImageView;", site.searchButton.toString())
                assertEquals("Lorg/telegram/ui/rn;->Cb($chat$user)V", site.searchUser.toString())
            }
            assertEquals("$name: the member button", "Landroid/widget/ImageView;", site.searchButton.type)
            val shownBefore = ImmutableMethod.of(site.header.visibility).controlBody()
            val clickBefore = ImmutableMethod.of(site.header.delegate).controlBody().filter { it.opcode != Opcode.NOP }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { myMessagesPatch.execute(context) })

            val shown = site.header.visibility.controlBody()
            assertEquals("$name: one instruction", shownBefore.size + 1, shown.size)
            assertEquals(menu, shown[0].controlRef())
            assertEquals("$name: the chat", listOf(site.header.visibility.implementation!!.registerCount - 1), shown[0].namedRegisters())
            for (i in shownBefore.indices) assertEquals("$name: stock updater $i", shownBefore[i].shape(), shown[i + 1].shape())

            val clicked = site.header.delegate.controlBody().filter { it.opcode != Opcode.NOP }
            val top = site.header.delegate.implementation!!.registerCount - 2
            assertEquals("$name: four instructions", clickBefore.size + 4, clicked.size)
            assertEquals(listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID), clicked.take(4).map { it.opcode })
            assertEquals(click, clicked[0].controlRef())
            assertEquals("$name: the delegate and the ID", listOf(top, top + 1), clicked[0].namedRegisters())
            for (i in clickBefore.indices) assertEquals("$name: stock click $i", clickBefore[i].shape(), clicked[i + 4].shape())

            val stub = { n: String -> context.tgMutableClassDefBy(MY_MESSAGES).methods.single { it.origName == n } }
            val search = stub("search")
            val steps = search.controlBody()
            val self = search.implementation!!.registerCount - 1
            val at = { ref: String -> steps.indexOfFirst { it.buildRef() == ref } }
            val order = listOf(at(site.openSearch.toString()), at(site.searchButton.toString()), at(site.searchUser.toString()))
            assertTrue("$name: open, press, pick, in Telegram's order: $order", order.all { it >= 0 } && order == order.sorted())
            assertTrue("$name: the account's own user", steps.indexOfFirst { it.controlRef() == "Lorg/telegram/messenger/MessagesController;->getUser(Ljava/lang/Long;)$user" } in 0 until order[0])
            assertTrue("$name: from the account's user ID", steps.any { it.controlRef() == "Lorg/telegram/messenger/UserConfig;->getClientUserId()J" })
            val pick = steps[order[2]]
            assertEquals("$name: the user goes in the user's place and no chat in the other",
                listOf(self) + site.searchUser.origParameterTypes.map { if (it == user) 0 else 1 }, pick.namedRegisters())
            val press = steps.indexOfFirst { it.controlRef() == "Landroid/view/View;->callOnClick()Z" }
            assertTrue("$name: the button is pressed only when the chat has one", press > order[1] &&
                steps[order[1] + 1].opcode == Opcode.IF_EQZ && order[2] - 1 in ControlFlow.of(search).normal[order[1] + 1])

            val group = stub("group").controlBody().mapNotNull { it.controlRef() }
            assertTrue("$name: the chat behind the dialog", "Lorg/telegram/messenger/MessagesController;->getChat(Ljava/lang/Long;)$chat" in group)
            assertTrue("$name: channels and direct messages answer no", "$chat->broadcast:Z" in group && "$chat->monoforum:Z" in group)
            assertEquals("$name: the delegate's chat", site.header.outer.toString(),
                stub("chatOf").controlBody().single { it.opcode == Opcode.IGET_OBJECT }.buildRef())
            assertEquals("$name: the item adder Telegram's own Translate uses", site.header.lazyAdd.toString(),
                stub("addHeaderItem").controlBody().single { it.opcode == Opcode.INVOKE_VIRTUAL }.buildRef())

            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "myMessages" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    /** Both patches put their calls at the top of the same updater and delegate, whichever runs first. */
    @Test fun `Outside translate and My messages share the header in either order`() {
        for (build in Fixtures.declaredBuilds()) for (mineFirst in listOf(true, false)) {
            val name = "${build.name} (${if (mineFirst) "My messages first" else "My messages last"})"
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val site = context.resolveMyMessages()
            val shownBefore = ImmutableMethod.of(site.header.visibility).controlBody()
            val clickBefore = ImmutableMethod.of(site.header.delegate).controlBody().filter { it.opcode != Opcode.NOP }
            for (patch in if (mineFirst) listOf(myMessagesPatch, outsideTranslatePatch) else listOf(outsideTranslatePatch, myMessagesPatch)) {
                assertEquals("$name: ${patch.name}", emptyList<String>(), PatchLogCapture.warnings { patch.execute(context) })
            }

            val shown = site.header.visibility.controlBody()
            assertEquals("$name: two calls", shownBefore.size + 2, shown.size)
            assertEquals(setOf(menu, "$OUTSIDE_TRANSLATE->headerMenu(Ljava/lang/Object;)V"), shown.take(2).map { it.controlRef() }.toSet())
            for (i in shownBefore.indices) assertEquals("$name: stock updater $i", shownBefore[i].shape(), shown[i + 2].shape())

            val clicked = site.header.delegate.controlBody().filter { it.opcode != Opcode.NOP }
            assertEquals("$name: two prefixes", clickBefore.size + 8, clicked.size)
            assertEquals(setOf(click, "$OUTSIDE_TRANSLATE->headerClick(Ljava/lang/Object;I)Z"), listOf(clicked[0], clicked[4]).map { it.controlRef() }.toSet())
            // Neither prefix holds padding, so their eight instructions sit at the top of the body as they are.
            val flow = ControlFlow.of(site.header.delegate)
            assertEquals("$name: a no from the first asks the second", setOf(3, 4), flow.normal[2].toSet())
            assertEquals("$name: a no from the second runs Telegram's code", setOf(7, 8), flow.normal[6].toSet())
            for (i in clickBefore.indices) assertEquals("$name: stock click $i", clickBefore[i].shape(), clicked[i + 8].shape())

            for (flag in listOf("myMessages", "outsideTranslate")) {
                val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.controlBody()
                assertEquals("$name: $flag", 1L, (status.first() as WideLiteralInstruction).wideLiteral)
            }
        }
    }

    @Test fun `a build without the chat's channel flags refuses before changing anything`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build).filter { it.type != chat })
            val refused = runCatching { context.resolveMyMessages() }.exceptionOrNull()
            assertTrue("${build.name}: resolving refuses", refused is PatchException)
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "myMessages" }.controlBody()
            assertThrows(PatchException::class.java) { myMessagesPatch.execute(context) }
            assertEquals("${build.name}: the switch stays off", status.map { it.opcode },
                context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "myMessages" }.controlBody().map { it.opcode })
            val stubs = context.tgMutableClassDefBy(MY_MESSAGES).methods.filter { it.origName in setOf("hasHeader", "group", "search") }
            assertTrue("${build.name}: the stubs keep their stock bodies", stubs.all { m -> m.controlBody().none { it.controlRef()?.startsWith("Lorg/telegram/") == true } })
        }
    }
}
