/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.apps

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
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
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test

/** The loader's class, the Apps tab's class and the runtime are the whole context. */
class HidePopularAppsFixtureTest {
    @Test
    fun `the loader and the Apps tab are gated and keep their stock flow`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = contextFor(build)
            val sites = context.resolvePopularAppsSites()
            val load = ImmutableMethod.of(sites.load)
            val section = ImmutableMethod.of(sites.section)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hidePopularAppsPatch.execute(context) })
            val name = build.name

            // The loader returns before its cache read and its request.
            val loadAfter = sites.load.instructions()
            assertEquals("$name: loader hook", listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID, Opcode.NOP),
                loadAfter.take(5).map { it.opcode })
            assertEquals("$name: loader asks", "$POPULAR_APPS->skipLoad()Z", loadAfter[0].reference())
            assertKeepsStock("$name: loader", load, sites.load, 0, 5)
            assertEquals("$name: false loads as before", setOf(3, 4), ControlFlow.of(sites.load).normal[2].toSet())
            val loadFlow = ControlFlow.of(sites.load)
            val request = loadAfter.indexOfFirst { it.opcode == Opcode.NEW_INSTANCE && it.reference() == GET_POPULAR_APP_BOTS }
            assertFalse("$name: the request is reached without the hook", request in reachable(loadFlow, 0, 2))

            // The Apps tab jumps from the list read to where a finished, empty list goes.
            val sectionAfter = sites.section.instructions()
            val gate = sites.read
            assertEquals("$name: section gate", listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_NEZ),
                sectionAfter.subList(gate, gate + 3).map { it.opcode })
            assertEquals("$name: section asks", "$POPULAR_APPS->hideSection()Z", sectionAfter[gate].reference())
            val moved = assertKeepsStock("$name: Apps tab", section, sites.section, gate, 3)
            val sectionFlow = ControlFlow.of(sites.section)
            assertEquals("$name: hidden goes to the finished, empty list; shown reads the list", setOf(gate + 3, moved.getValue(sites.empty)),
                sectionFlow.normal[gate + 2].toSet())
            // In stock, that point is where an empty list that isn't loading and has nothing more goes.
            val stock = section.instructions()
            val emptyBranch = stock.indices.single { stock[it].opcode == Opcode.IGET_BOOLEAN && it > sites.read + 3 &&
                ControlFlow.of(section).normal[sites.read + 3].contains(it) }
            assertTrue("$name: a finished, empty list reaches it in stock", sites.empty in ControlFlow.of(section).normal[emptyBranch + 3])
            // Skipping from the read to there skips no write but the reads Telegram makes on its way.
            for (at in listOf(sites.read, sites.read + 1, sites.read + 2, sites.read + 3, emptyBranch, emptyBranch + 1, emptyBranch + 2, emptyBranch + 3)) {
                assertFalse("$name: stock empty path at $at writes a field", stock[at].opcode.name.let { op -> op.startsWith("iput") || op.startsWith("sput") })
            }
            // No heading, bot row or placeholder can be added between the gate and that point unless the gate let it through.
            val heading = stock.indexOfFirst { it.opcode == Opcode.SGET && (it as ReferenceInstruction).reference.let { ref ->
                ref is FieldReference && ref.name == "SearchAppsPopular" } }
            assertTrue("$name: the heading is inside the gated section", heading in sites.read until sites.empty)
            assertFalse("$name: the heading is reached around the gate", moved.getValue(heading) in reachable(sectionFlow, 0, gate))

            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hidePopularApps" }.instructions()
            assertEquals("$name: build fact", 1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
        }
    }

    @Test
    fun `the loader is the only code that asks for popular apps and the Apps tab the only one that names them`() {
        for (build in Fixtures.declaredBuilds()) {
            val builders = FixtureDex.methodsWhere(build, { true }) { method ->
                method.instructions().any { it.opcode == Opcode.NEW_INSTANCE && it.reference() == GET_POPULAR_APP_BOTS } }
            assertEquals("${build.name}: one getPopularAppBots builder", 1, builders.size)
            val headings = FixtureDex.methodsWhere(build, { true }) { method -> method.instructions().any { it.opcode == Opcode.SGET &&
                (it as ReferenceInstruction).reference.let { ref -> ref is FieldReference && ref.name == "SearchAppsPopular" } } }
            assertEquals("${build.name}: one place draws the Popular apps heading", 1, headings.size)
        }
    }

    @Test
    fun `changed popular apps geometry refuses before any partial mutation`() {
        for (build in Fixtures.declaredBuilds()) {
            val changes: List<Pair<String, (BytecodePatchContext, PopularAppsSites) -> Unit>> = listOf(
                "finished list shows a footer" to { _, sites ->
                    val register = sites.section.instructions()[sites.empty].namedRegisters()[0]
                    sites.section.replaceInstruction(sites.empty, "const/4 v$register, 0x1")
                },
                "empty list stops checking it is finished" to { _, sites ->
                    val emptyBranch = ControlFlow.of(sites.section).normal[sites.read + 3].single { it != sites.read + 4 }
                    sites.section.replaceInstruction(emptyBranch + 2, "nop")
                },
                "a second request builder" to { context, sites ->
                    val other = context.mutableClassDefBy(sites.section.definingClass).methods.first { it != sites.section &&
                        (it.implementation?.registerCount ?: 0) > 0 }
                    other.addInstructions(0, "new-instance v0, $GET_POPULAR_APP_BOTS")
                },
            )
            for ((case, change) in changes) {
                val context = contextFor(build)
                change(context, context.resolvePopularAppsSites())
                assertRefusedUntouched(build, case, context)
            }
            assertRefusedUntouched(build, "no runtime", contextFor(build, runtime = false))
        }
    }

    private fun assertRefusedUntouched(file: java.io.File, case: String, context: BytecodePatchContext) {
        val build = file.name
        val owners = owners(file).map { it.type }
        val before = owners.associateWith { type -> context.mutableClassDefBy(type).methods.map { it.instructions().map(::operation) } }
        try {
            hidePopularAppsPatch.execute(context)
            fail("$build: $case was accepted")
        } catch (expected: PatchException) {
            assertTrue("$build: $case: ${expected.message}", expected.message.orEmpty().contains("before editing"))
        }
        assertEquals("$build: $case doesn't partly mutate the loader or the Apps tab", before,
            owners.associateWith { type -> context.mutableClassDefBy(type).methods.map { it.instructions().map(::operation) } })
        val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hidePopularApps" }.instructions()
        assertEquals("$build: $case leaves the build fact false", 0, (status[0] as NarrowLiteralInstruction).narrowLiteral)
    }

    /**
     * The edited method holds the stock one's operations outside the [size] instructions inserted
     * at [at], switch padding aside, and every stock jump still goes where it went, a jump to the
     * hooked instruction now landing on the hook. Returns where each stock index moved.
     */
    private fun assertKeepsStock(what: String, original: Method, after: Method, at: Int, size: Int): Map<Int, Int> {
        val old = original.instructions()
        val now = after.instructions()
        val kept = old.indices.filterNot { old.isPadding(it) }
        val moved = now.indices.filterNot { now.isPadding(it) || it in at until at + size }
        assertEquals("$what keeps every stock operation", kept.map { operation(old[it]) }, moved.map { operation(now[it]) })
        val to = kept.zip(moved).toMap()
        val oldFlow = ControlFlow.of(original)
        val newFlow = ControlFlow.of(after)
        for (index in kept) {
            assertEquals("$what keeps stock flow from $index", oldFlow.normal[index].map { if (it == at) at else to.getValue(it) },
                newFlow.normal[to.getValue(index)])
        }
        return to
    }

    private fun owners(build: java.io.File) = FixtureDex.classesWhere(build, { true }) { method ->
        method.instructions().any { (it.opcode == Opcode.NEW_INSTANCE && it.reference() == GET_POPULAR_APP_BOTS) ||
            (it.opcode == Opcode.SGET && (it as ReferenceInstruction).reference.let { ref -> ref is FieldReference && ref.name == "SearchAppsPopular" }) }
    }

    private fun contextFor(build: java.io.File, runtime: Boolean = true): BytecodePatchContext {
        val owners = owners(build)
        assertEquals("${build.name}: the loader and the Apps tab", 2, owners.size)
        val extension = ExtensionDex.classes().filter { runtime || it.type != POPULAR_APPS }
        return PatchContexts.of(extension + owners)
    }

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
    private fun List<Instruction>.isPadding(index: Int) = this[index].opcode == Opcode.NOP && getOrNull(index + 1)?.opcode in
        setOf(Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD)
    private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()
    @Suppress("unused")
    private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
    private fun operation(instruction: Instruction) = instruction.opcode to instruction.reference()
}
