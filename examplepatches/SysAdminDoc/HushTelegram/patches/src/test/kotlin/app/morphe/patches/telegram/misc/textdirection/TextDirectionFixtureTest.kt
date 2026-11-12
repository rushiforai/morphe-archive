/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.textdirection

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.hostsOf
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import java.util.concurrent.ConcurrentHashMap
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

private val TEXT_DIRECTION_HOSTS = ConcurrentHashMap<String, List<ClassDef>>()

/** The message box's two startActionMode overrides and the method its text menu's choices go to first. */
class TextDirectionFixtureTest {
    private val menu = "$TEXT_DIRECTION->menu(Ljava/lang/Object;Landroid/view/ActionMode;)V"
    private val chosen = "$TEXT_DIRECTION->chosen(Ljava/lang/Object;I)Z"

    private fun kind(opcode: Opcode) = if (opcode == Opcode.GOTO_16 || opcode == Opcode.GOTO_32) Opcode.GOTO else opcode
    private fun Instruction.shape() = listOf(kind(opcode), namedRegisters(), origRef())
    private fun Method.code() = controlBody().filter { it.opcode != Opcode.NOP }

    /** Every class that starts a text menu or closes one from a chosen item, the editor base, and the extension. */
    private fun hosts(build: File): List<ClassDef> = (ExtensionDex.classes() + TEXT_DIRECTION_HOSTS.hostsOf(build.path) {
        FixtureDex.classesWhere(build, { true }) { m ->
            m.name == "startActionMode" ||
                m.name == "onActionItemClicked" && m.controlBody().any { it.controlRef() == "Landroid/view/ActionMode;->finish()V" }
        } + FixtureDex.classes(build, setOf(EDIT_TEXT)).values
    }).distinctBy { it.type }

    @Test fun `both overrides hand the menu over at their return and the box's choices ask first`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(hosts(build))
            val site = context.resolveTextDirection()
            if (name.contains("-72919")) {
                assertEquals("Lorg/telegram/ui/Components/ft;", site.box)
                assertEquals("G", site.choose.name)
            }
            assertEquals("$name: both overloads", setOf(1, 2), site.starts.map { it.parameterTypes.size }.toSet())
            val startsBefore = site.starts.map { ImmutableMethod.of(it).code() }
            val chooseBefore = ImmutableMethod.of(site.choose).code()
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { textDirectionPatch.execute(context) })

            for ((start, before) in site.starts.zip(startsBefore)) {
                val after = start.code()
                val at = before.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
                assertEquals("$name: one instruction", before.size + 1, after.size)
                assertEquals(menu, after[at].controlRef())
                val self = start.implementation!!.registerCount - start.parameterTypes.size - 1
                assertEquals("$name: the box and its menu", listOf(self, (before[at] as OneRegisterInstruction).registerA),
                    after[at].namedRegisters())
                assertEquals("$name: then the return", before[at].shape(), after[at + 1].shape())
                for (i in 0 until at) assertEquals("$name: stock start $i", before[i].shape(), after[i].shape())
            }

            val handled = site.choose.code()
            val top = site.choose.implementation!!.registerCount - 2
            assertEquals("$name: four instructions", chooseBefore.size + 4, handled.size)
            assertEquals(listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN), handled.take(4).map { it.opcode })
            assertEquals(chosen, handled[0].controlRef())
            assertEquals("$name: the box and the item's number", listOf(top, top + 1), handled[0].namedRegisters())
            assertEquals("$name: a no runs Telegram's code", setOf(3, 4), ControlFlow.of(site.choose).normal[2].toSet())
            for (i in chooseBefore.indices) assertEquals("$name: stock choice $i", chooseBefore[i].shape(), handled[i + 4].shape())

            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "textDirection" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    /** Both 13.2 builds fall into the return. A copy with a test that jumps onto it shows a jump lands on the hook too. */
    @Test fun `a branch onto a start's return reaches the hook too`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val start = PatchContexts.of(hosts(build)).resolveTextDirection().starts.first()
            val end = start.code().indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
            val early = MutableMethod(ImmutableMethod.of(start)).apply {
                addInstructionsWithLabels(end, "if-eqz p0, :hush_return\nnop", ExternalLabel("hush_return", getInstruction(end)))
            }
            val jump = end
            val stockEnd = end + 2
            assertTrue("$name: the copy jumps onto the return", stockEnd in ControlFlow.of(ImmutableMethod.of(early)).normal[jump])
            insertMenu(early)
            assertEquals(menu, early.controlBody()[stockEnd].controlRef())
            assertTrue("$name: the jump lands on the hook", stockEnd in ControlFlow.of(early).normal[jump])
        }
    }

    @Test fun `a build whose menu wrapper no longer closes the menu refuses before changing anything`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(hosts(build).filter { clicked ->
                clicked.methods.none { m -> m.name == "onActionItemClicked" && m.controlBody().any { it.controlRef() == "Landroid/view/ActionMode;->finish()V" } &&
                    m.controlBody().any { it.controlRef()?.endsWith("(I)Z") == true } }
            })
            assertTrue("$name: resolving refuses", runCatching { context.resolveTextDirection() }.exceptionOrNull() is PatchException)
            val status = { context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "textDirection" }.controlBody().map { it.opcode } }
            val before = status()
            assertThrows(PatchException::class.java) { textDirectionPatch.execute(context) }
            assertEquals("$name: the switch stays off", before, status())
        }
    }
}
