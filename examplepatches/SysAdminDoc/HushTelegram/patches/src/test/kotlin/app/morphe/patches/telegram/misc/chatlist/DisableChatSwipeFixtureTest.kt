/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.chatlist

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test

/** The swipe controller's class and the runtime are the whole context. */
class DisableChatSwipeFixtureTest {
    @Test
    fun `the swipe branch answers no movement when the switch is on and keeps its stock flow`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = contextFor(build)
            val site = context.resolveChatSwipeSite()
            val original = ImmutableMethod.of(site.method)
            val old = original.instructions()
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { disableChatSwipePatch.execute(context) })
            val name = build.name
            val after = site.method.instructions()
            val entry = site.entry

            // The hook: ask, and on true answer no movement, as Telegram's own refusals do.
            assertEquals("$name: hook", listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4,
                Opcode.RETURN, Opcode.NOP), after.subList(entry, entry + 6).map { it.opcode })
            assertEquals("$name: hook asks", "$CHAT_SWIPE->keepRowStill()Z", after[entry].reference())
            assertEquals("$name: no movement", 0, (after[entry + 3] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals("$name: returns the zero", after[entry + 3].namedRegisters(), after[entry + 4].namedRegisters())

            // Stock code and flow outside the hook, a jump to the branch now landing on the hook.
            assertEquals("$name: keeps every stock operation", old.map(::operation),
                after.filterIndexed { at, _ -> at !in entry until entry + 6 }.map(::operation))
            fun moved(index: Int) = if (index < entry) index else index + 6
            val oldFlow = ControlFlow.of(original)
            val newFlow = ControlFlow.of(site.method)
            for (index in old.indices) {
                assertEquals("$name: keeps stock flow from $index", oldFlow.normal[index].map { if (it == entry) entry else moved(it) },
                    newFlow.normal[moved(index)])
            }
            assertEquals("$name: false swipes as before", setOf(entry + 3, entry + 5), newFlow.normal[entry + 2].toSet())

            // Nothing is marked sliding before the hook, and the swipe can't be reached around it.
            assertTrue("$name: the row is marked sliding after the hook", moved(site.sliding) > entry + 5)
            assertFalse("$name: the swipe is reached without the hook", moved(site.swipeReturn) in reachable(newFlow, 0, entry))
            // The drag that reorders pinned chats returns its flags without passing the hook.
            val flags = old[site.sliding + 1].call()!!
            val drag = old.indices.single { it != site.sliding + 1 && old[it].call()?.let { call ->
                call.definingClass == flags.definingClass && call.name == flags.name } == true }
            assertTrue("$name: reorder drag doesn't pass the hook", moved(drag) in reachable(newFlow, 0, entry))
            assertTrue("$name: drag comes before the swipe branch", drag < entry)

            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "disableChatSwipe" }.instructions()
            assertEquals("$name: build fact", 1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
        }
    }

    @Test
    fun `before the row is marked sliding the swipe branch writes only the controller's own swipe state`() {
        for (build in Fixtures.declaredBuilds()) {
            val site = contextFor(build).resolveChatSwipeSite()
            val body = site.method.instructions()
            val self = site.method.implementation!!.registerCount - 3
            // Opcode.name is the smali name in Kotlin, "iput-boolean", not the enum constant's.
            val writes = (site.entry until site.sliding).filter { body[it].opcode.name.let { op -> op.startsWith("iput") || op.startsWith("sput") || op.startsWith("aput") } }
            assertTrue("${build.name}: Telegram resets its swipe state in the branch", writes.isNotEmpty())
            for (write in writes) {
                assertEquals("${build.name}: write at $write", Opcode.IPUT_BOOLEAN, body[write].opcode)
                assertEquals("${build.name}: write at $write is the controller's", self, body[write].namedRegisters()[1])
                assertTrue("${build.name}: write at $write is the controller's field",
                    body[write].reference()!!.startsWith(site.method.definingClass + "->"))
            }
        }
    }

    @Test
    fun `changed swipe geometry refuses before any partial mutation`() {
        for (build in Fixtures.declaredBuilds()) {
            val changes: List<Pair<String, (ChatSwipeSite) -> Unit>> = listOf(
                "row no longer marked sliding" to { site -> site.method.replaceInstruction(site.sliding, "nop") },
                "swipe moves right" to { site ->
                    val body = site.method.instructions()
                    val direction = body[site.sliding + 1].namedRegisters()[1]
                    val write = (site.entry until site.sliding).single { body[it].opcode == Opcode.CONST_4 && body[it].namedRegisters()[0] == direction }
                    site.method.replaceInstruction(write, "const/16 v$direction, 0x8")
                },
                "swipe branch gains a way out" to { site ->
                    val body = site.method.instructions()
                    val zero = body[site.sliding + 1].namedRegisters()[0]
                    site.method.replaceInstruction(site.sliding - 1, "return v$zero")
                },
            )
            for ((case, change) in changes) {
                val context = contextFor(build)
                change(context.resolveChatSwipeSite())
                assertRefusedUntouched(build, case, context)
            }
            assertRefusedUntouched(build, "no runtime", contextFor(build, runtime = false))
        }
    }

    private fun assertRefusedUntouched(file: java.io.File, case: String, context: BytecodePatchContext) {
        val build = file.name
        val owners = FixtureDex.classesWhere(file, { true }) { it.swipes() }.map { it.type }
        val before = owners.associateWith { type -> context.mutableClassDefBy(type).methods.map { it.instructions().map(::operation) } }
        try {
            disableChatSwipePatch.execute(context)
            fail("$build: $case was accepted")
        } catch (expected: PatchException) {
            assertTrue("$build: $case: ${expected.message}", expected.message.orEmpty().contains("before editing"))
        }
        assertEquals("$build: $case doesn't partly mutate the controller", before,
            owners.associateWith { type -> context.mutableClassDefBy(type).methods.map { it.instructions().map(::operation) } })
        val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "disableChatSwipe" }.instructions()
        assertEquals("$build: $case leaves the build fact false", 0, (status[0] as NarrowLiteralInstruction).narrowLiteral)
    }

    private fun contextFor(build: java.io.File, runtime: Boolean = true): BytecodePatchContext {
        val owners = FixtureDex.classesWhere(build, { true }) { it.swipes() }
        assertEquals("${build.name}: one class holds the chat list's swipe controller", 1, owners.size)
        val extension = ExtensionDex.classes().filter { runtime || it.type != CHAT_SWIPE }
        return PatchContexts.of(extension + owners)
    }

    private fun Method.swipes() = instructions().any { it.call()?.name == "getChatSwipeAction" } &&
        instructions().any { it.call()?.name == "setSliding" }

    private fun reachable(flow: ControlFlow, from: Int, blocked: Int): Set<Int> {
        val found = mutableSetOf<Int>()
        val pending = ArrayDeque<Int>()
        pending.add(from)
        while (pending.isNotEmpty()) {
            val index = pending.removeFirst()
            if (index == blocked || !found.add(index)) continue
            pending.addAll(flow.normal[index])
            pending.addAll(flow.exceptional[index])
        }
        return found
    }

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()
    private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
    private fun operation(instruction: Instruction) = instruction.opcode to instruction.reference()
}
