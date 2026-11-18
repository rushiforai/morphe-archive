/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.hostsOf
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origRef
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.util.concurrent.ConcurrentHashMap

private val AVATAR_HOSTS = ConcurrentHashMap<String, List<ClassDef>>()

/** The chat row, whose layout alone loads "PsaType_", and ImageReceiver, whose round radius the stubs read and set. */
internal fun chatListAvatarHosts(build: File): List<ClassDef> = AVATAR_HOSTS.hostsOf(build.path) {
    FixtureDex.classesWhere(build, { true }) { m ->
        m.origDefiningClass == "Lorg/telegram/messenger/ImageReceiver;" || m.controlBody().any { it.controlString() == "PsaType_" }
    }.map(ImmutableClassDef::of)
}

/** The chat row's layout, ImageReceiver and the runtime. */
class ChatListAvatarFixtureTest {
    @Test fun `the extension gets the avatar's square right after each layout sets it`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of((ExtensionDex.classes() + chatListAvatarHosts(build)).distinctBy { it.type })
            val plan = context.resolveChatListAvatar()
            assertTrue("$name: ${plan.cellType}", plan.cellType.startsWith("Lorg/telegram/ui/Cells/"))
            // Each square and its row as the stock layout names them: the set's RectF, read off the row's params. Both
            // layouts use the same pair (v11 off v1 on Telegram's own builds, v12 off v1 on Plus Messenger).
            val stock = plan.method.controlBody()
            fun loadOf(register: Int, before: Int) = (before - 1 downTo 0).first { stock[it].opcode == Opcode.IGET_OBJECT && stock[it].namedRegisters().first() == register }
            for (square in plan.squares) {
                assertEquals(name, RECT_SET, stock[square.index].controlRef())
                val rect = stock[square.index].namedRegisters().first()
                val load = loadOf(rect, square.index)
                val params = loadOf(stock[load].namedRegisters()[1], load)
                assertEquals(name, rect to stock[params].namedRegisters()[1], square.rect to square.cell)
            }
            assertEquals(name, 2, plan.squares.size)
            assertEquals(name, 1, plan.squares.map { it.rect to it.cell }.distinct().size)
            val pairs = plan.squares.sortedBy { it.index }.map { listOf(it.rect, it.cell) }
            val old = ImmutableMethod.of(plan.method)
            context.writeChatListAvatarStubs(plan)
            plan.apply()

            val before = old.controlBody()
            val after = plan.method.controlBody()
            assertEquals("$name: two calls", before.size + 2, after.size)
            val sets = plan.squares.map { it.index }.sorted()
            val hooks = sets.mapIndexed { i, set -> set + 1 + i }
            assertEquals(name, hooks, after.indices.filter { after[it].controlRef() == AVATAR_RESIZE })
            val flow = ControlFlow.of(plan.method)
            for ((i, at) in hooks.withIndex()) {
                assertEquals(Opcode.INVOKE_STATIC, after[at].opcode)
                assertEquals("$name: the square and the row", pairs[i], after[at].namedRegisters())
                assertEquals(RECT_SET, after[at - 1].controlRef())
                assertEquals("$name: only the set reaches the hook", listOf(at - 1), flow.normal.indices.filter { at in flow.normal[it] })
            }
            for (i in before.indices) {
                val shift = sets.count { it < i }
                assertEquals("$name: stock $i", operands(before[i]), operands(after[i + shift]))
            }

            val stubs = context.tgMutableClassDefBy(CHAT_LIST_AVATAR).methods.associateBy { it.name }
            assertTrue("$name: avatarOf reads the row's avatar",
                stubs.getValue("avatarOf").controlBody().any { it.opcode == Opcode.IGET_OBJECT && it.controlRef() == plan.avatar })
            assertTrue("$name: radii asks ImageReceiver", stubs.getValue("radii").controlBody()
                .any { it.origRef() == "Lorg/telegram/messenger/ImageReceiver;->getRoundRadius()[I" })
            assertTrue("$name: setRadius tells it", stubs.getValue("setRadius").controlBody()
                .any { it.origRef() == "Lorg/telegram/messenger/ImageReceiver;->setRoundRadius(I)V" })
        }
    }

    @Test fun `a layout something jumps into stays as it was and only warns`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of((ExtensionDex.classes() + folderCounterHosts(build) + chatListAvatarHosts(build)).distinctBy { it.type })
            val plan = context.resolveChatListAvatar()
            val first = plan.squares.minOf { it.index }
            plan.method.addInstructionsWithLabels(plan.method.controlBody().size, "goto/16 :hush_in",
                ExternalLabel("hush_in", plan.method.getInstruction(first)))
            val layout = plan.method.controlBody().map(::operands)
            val warnings = PatchLogCapture.warnings { hideFolderCountersPatch.execute(context) }
            val left = warnings.single { "without Change avatar size" in it }
            assertTrue("$name: $left", "the avatar square's two layouts are missing or ambiguous" in left)
            assertEquals(name, layout, plan.method.controlBody().map(::operands))
            assertTrue("$name: avatarOf stays a stub", context.tgMutableClassDefBy(CHAT_LIST_AVATAR).methods
                .single { it.name == "avatarOf" }.controlBody().none { it.opcode == Opcode.IGET_OBJECT })
        }
    }

    private fun operands(instruction: Instruction): List<Any?> = listOf(instruction.opcode, instruction.namedRegisters(), instruction.origRef())
}
