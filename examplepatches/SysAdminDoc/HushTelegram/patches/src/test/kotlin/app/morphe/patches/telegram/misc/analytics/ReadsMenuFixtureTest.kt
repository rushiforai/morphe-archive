/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.analytics

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.hostsOf
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.mymessages.MY_MESSAGES
import app.morphe.patches.telegram.misc.mymessages.myMessagesPatch
import app.morphe.patches.telegram.misc.translate.OutsideTranslateFixtureTest
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Test
import java.io.File
import java.util.concurrent.ConcurrentHashMap

private val READS_MENU_HOST_CACHE = ConcurrentHashMap<String, List<ClassDef>>()

/**
 * The chat screen's slice Send read receipts in a chat's menu needs from [build] (#69), the one Outside
 * translate reads. A test that runs Disable analytics and expects nothing to warn about adds these, or
 * the patch says Ghost mode goes on without the item.
 */
internal fun readsMenuHosts(build: File): List<ClassDef> = READS_MENU_HOST_CACHE.hostsOf(build.path) {
    OutsideTranslateFixtureTest().hosts(build)
}

/** Send read receipts in a chat's menu at the top (#69), on the header My messages and Outside translate share. */
class ReadsMenuFixtureTest {
    private val menu = "$READS_MENU->headerMenu(Ljava/lang/Object;)V"
    private val click = "$READS_MENU->headerClick(Ljava/lang/Object;I)Z"

    private fun Instruction.shape() = listOf(opcode, namedRegisters(), origRef())
    private fun Instruction.buildRef() = (this as? ReferenceInstruction)?.reference?.toString()

    /** The chat screen's slice, plus the user and chat classes My messages reads. */
    private fun hosts(build: File): List<ClassDef> =
        (readsMenuHosts(build) + FixtureDex.classes(build,
            setOf("Lorg/telegram/tgnet/TLRPC\$User;", "Lorg/telegram/tgnet/TLRPC\$Chat;")).values.map(ImmutableClassDef::of))
            .distinctBy { it.type }

    @Test fun `the header updater and click delegate ask first and the stubs read the chat's own members`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val site = context.resolveReadsMenu("Disable analytics")
            val shownBefore = ImmutableMethod.of(site.header.visibility).controlBody()
            val clickBefore = ImmutableMethod.of(site.header.delegate).controlBody().filter { it.opcode != Opcode.NOP }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { context.installReadsMenu(site) })

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

            val stub = { n: String -> context.tgMutableClassDefBy(READS_MENU).methods.single { it.origName == n }.controlBody() }
            assertEquals("$name: the chat's ID getter Ghost mode's keys follow", site.header.dialogGetter.toString(),
                stub("dialogId").single { it.opcode == Opcode.INVOKE_VIRTUAL }.buildRef())
            assertEquals("$name: wide", Opcode.RETURN_WIDE, stub("dialogId").last().opcode)
            assertEquals("$name: the chat's own account", site.header.accountGetter,
                stub("account").single { it.opcode == Opcode.INVOKE_VIRTUAL }.buildRef())
            assertEquals("$name: the delegate's chat", site.header.outer.toString(),
                stub("chatOf").single { it.opcode == Opcode.IGET_OBJECT }.buildRef())
            assertEquals("$name: the item adder Telegram's own Translate uses", site.header.lazyAdd.toString(),
                stub("addHeaderItem").single { it.opcode == Opcode.INVOKE_VIRTUAL }.buildRef())
            assertEquals("$name: the Translate item says the menu is built", site.header.translateItem.toString(),
                stub("hasHeader").single { it.opcode == Opcode.IGET_OBJECT }.buildRef())
        }
    }

    /** Both put their calls at the top of the same updater and delegate, and a no from either asks the next. */
    @Test fun `Send read receipts and My messages share the header`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val site = context.resolveReadsMenu("Disable analytics")
            val clickBefore = ImmutableMethod.of(site.header.delegate).controlBody().filter { it.opcode != Opcode.NOP }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { myMessagesPatch.execute(context) })
            val again = context.resolveReadsMenu("Disable analytics")
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { context.installReadsMenu(again) })

            val shown = site.header.visibility.controlBody()
            assertEquals("$name: both ask", listOf(menu, "$MY_MESSAGES->headerMenu(Ljava/lang/Object;)V"), shown.take(2).map { it.controlRef() })
            val clicked = site.header.delegate.controlBody().filter { it.opcode != Opcode.NOP }
            assertEquals("$name: two prefixes", clickBefore.size + 8, clicked.size)
            assertEquals(listOf(click, "$MY_MESSAGES->headerClick(Ljava/lang/Object;I)Z"), listOf(clicked[0], clicked[4]).map { it.controlRef() })
            val flow = ControlFlow.of(site.header.delegate)
            assertEquals("$name: a no from the first asks the second", setOf(3, 4), flow.normal[2].toSet())
            assertEquals("$name: a no from the second runs Telegram's code", setOf(7, 8), flow.normal[6].toSet())
        }
    }
}
