/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.channelpull

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Test
import java.io.File

class DisableChannelPullFixtureTest {
    @Test fun `both hooks retain every stock operand edge handler and explicit channel opener`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = contextFor(build)
            val sites = context.resolveChannelPullSites()
            val scroll = ImmutableMethod.of(sites.scroll)
            val touch = ImmutableMethod.of(sites.touch)
            val opener = context.mutableClassDefBy(sites.transition.definingClass).methods.single { it.name == sites.transition.name }
            val beforeOpener = opener.state()
            val beforeOthers = hosts(build).flatMap { owner -> context.mutableClassDefBy(owner.type).methods }
                .filter { it !== sites.scroll && it !== sites.touch }.associate { key(it) to it.state() }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { disableChannelPullPatch.execute(context) })
            assertStock(build.name, scroll, sites.scroll, sites.scrollGate, 6)
            assertStock(build.name, touch, sites.touch, sites.releaseGate, 6)
            assertEquals("${build.name}: direct opening and its saved state aren't changed", beforeOpener, opener.state())
            assertEquals("${build.name}: all other host methods are untouched", beforeOthers,
                hosts(build).flatMap { owner -> context.mutableClassDefBy(owner.type).methods }
                    .filter { it !== sites.scroll && it !== sites.touch }.associate { key(it) to it.state() })
            val scrolling = sites.scroll.instructions()
            assertEquals(sites.topic, scrolling[sites.scrollGate].field())
            assertEquals("$CHANNEL_PULL->stopBottomPull()Z", scrolling[sites.scrollGate + 2].ref())
            assertEquals(Opcode.IGET, scrolling[sites.scrollGate + 6].opcode)
            assertEquals(sites.offset, scrolling[sites.scrollGate + 6].field())
            val scrollFlow = ControlFlow.of(sites.scroll)
            assertEquals("eligible non-topic pull uses stock overscroll cleanup", setOf(sites.scrollGate + 5, sites.scrollExit + 6),
                scrollFlow.normal[sites.scrollGate + 4].toSet())
            val released = sites.touch.instructions()
            assertEquals(sites.topic, released[sites.releaseGate].field())
            assertEquals(listOf(Opcode.IGET_BOOLEAN, Opcode.IF_NEZ, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_NEZ, Opcode.NOP),
                released.subList(sites.releaseGate, sites.releaseGate + 6).map { it.opcode })
            assertEquals("$CHANNEL_PULL->keepChannelStill()Z", released[sites.releaseGate + 2].ref())
            val releaseFlow = ControlFlow.of(sites.touch)
            assertEquals("topic release resumes stock", setOf(sites.releaseGate + 2, sites.releaseGate + 5),
                releaseFlow.normal[sites.releaseGate + 1].toSet())
            assertEquals("channel suppression takes stock retraction", setOf(sites.releaseGate + 5, sites.retract + 6),
                releaseFlow.normal[sites.releaseGate + 4].toSet())
            assertFalse("retraction can't open the next channel", sites.transitionCall + 6 in reachable(releaseFlow, sites.retract + 6))
            assertFlag(context, true)
        }
    }

    @Test fun `stock channel group topic and bot choices survive and only broadcast bottom pulls stop`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = contextFor(build)
            val sites = context.resolveChannelPullSites()
            val stock = ImmutableMethod.of(sites.scroll)
            disableChannelPullPatch.execute(context)
            for (channel in listOf(false, true)) for (group in listOf(false, true)) {
                for (topic in listOf(false, true)) for (bot in listOf(false, true)) {
                    val expectedStock = channel && !group || topic && !bot
                    assertEquals("${build.name}: stock positive/negative controls", expectedStock,
                        eligible(stock, sites, false, false, channel, group, topic, bot))
                    assertEquals("${build.name}: disabled preserves every stock choice", expectedStock,
                        eligible(sites.scroll, sites, true, false, channel, group, topic, bot))
                    assertEquals("${build.name}: enabled keeps the complete topic fallback", expectedStock && topic,
                        eligible(sites.scroll, sites, true, true, channel, group, topic, bot))
                }
            }
            for (enabled in listOf(false, true)) for (topic in listOf(false, true)) {
                assertEquals("${build.name}: an existing non-topic pull retracts only when enabled", enabled && !topic,
                    retracts(sites, enabled, topic))
            }
        }
    }

    @Test fun `changed structural bindings refuse without any host runtime or build fact mutation`() {
        val changes: List<Pair<String, (BytecodePatchContext, ChannelPullSites) -> Unit>> = listOf(
            "missing channel predicate" to { _, sites -> sites.scroll.replaceInstruction(sites.channelCall, "nop") },
            "missing megagroup read" to { _, sites -> sites.scroll.replaceInstruction(sites.channelCall + 4, "nop") },
            "no positive drag requirement" to { _, sites -> sites.scroll.replaceInstruction(sites.channelCall - 3, "nop") },
            "no zero ordinary scroll requirement" to { _, sites -> sites.scroll.replaceInstruction(sites.channelCall - 2, "nop") },
            "different topic state" to { context, sites ->
                val owner = context.mutableClassDefBy(sites.topic.definingClass)
                val other = owner.fields.first { it.type == "Z" && it.name != sites.topic.name }
                val operands = sites.scroll.instructions()[sites.topicEntry].namedRegisters()
                sites.scroll.replaceInstruction(sites.topicEntry, "iget-boolean v${operands[0]}, v${operands[1]}, ${other.definingClass}->${other.name}:Z")
            },
            "missing offset accumulation" to { _, sites -> sites.scroll.replaceInstruction(sites.offsetWrite, "nop") },
            "different release offset" to { context, sites ->
                val owner = context.mutableClassDefBy(sites.offset.definingClass)
                val other = owner.fields.first { it.type == "F" && it.name != sites.offset.name }
                val at = sites.touch.instructions().indexOfFirst { it.call()?.toString() == "Ljava/lang/Math;->min(FF)F" } - 7
                val operands = sites.touch.instructions()[at].namedRegisters()
                sites.touch.replaceInstruction(at, "iget v${operands[0]}, v${operands[1]}, ${other.definingClass}->${other.name}:F")
            },
            "different drawn drawable" to { context, sites ->
                val draw = context.mutableClassDefBy(sites.list.type).methods.single { it.name == "onDraw" }
                val at = draw.instructions().indices.single { draw.instructions()[it].opcode == Opcode.IPUT_OBJECT && draw.instructions()[it].field() == sites.drawable }
                draw.replaceInstruction(at, "nop")
            },
            "release lost next-chat transition" to { _, sites -> sites.touch.replaceInstruction(sites.transitionCall, "nop") },
            "no free release local after the scroll insertion trial" to { _, sites ->
                sites.touch.replaceInstruction(sites.releaseGate,
                    "invoke-static/range {v0 .. v15}, Lfixture/ChannelPullRefusal;->readAll(IIIIIIIIIIIIIIII)V")
            },
            "private injected topic read" to { context, sites ->
                val field = context.mutableClassDefBy(sites.topic.definingClass).fields.single { it.name == sites.topic.name }
                field.accessFlags = field.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value
            },
            "static injected topic read" to { context, sites ->
                val field = context.mutableClassDefBy(sites.topic.definingClass).fields.single { it.name == sites.topic.name }
                field.accessFlags = field.accessFlags or AccessFlags.STATIC.value
            },
            "duplicate scroll candidate" to { context, sites ->
                val old = sites.scroll
                context.mutableClassDefBy(old.definingClass).methods.add(ImmutableMethod(old.definingClass, old.name + "Duplicate", old.parameters,
                    old.returnType, old.accessFlags, old.annotations, old.hiddenApiRestrictions, old.implementation).toMutable())
            },
        )
        for (build in Fixtures.declaredBuilds()) for ((case, change) in changes) {
            val context = contextFor(build)
            change(context, context.resolveChannelPullSites())
            refusedUntouched(build, case, context)
        }
    }

    @Test fun `noncallable runtime or build fact refuses before either insertion`() {
        for (build in Fixtures.declaredBuilds()) {
            val absent = contextFor(build, runtime = false)
            refusedUntouched(build, "absent runtime", absent)
            for (name in listOf("stopBottomPull", "keepChannelStill")) for (mutation in 0..6) {
                val context = contextFor(build)
                val runtime = context.mutableClassDefBy(CHANNEL_PULL)
                val method = runtime.methods.single { it.name == name }
                when (mutation) {
                    0 -> runtime.accessFlags = runtime.accessFlags and AccessFlags.PUBLIC.value.inv()
                    1 -> method.accessFlags = method.accessFlags and AccessFlags.PUBLIC.value.inv()
                    2 -> method.accessFlags = method.accessFlags and AccessFlags.STATIC.value.inv()
                    3 -> method.accessFlags = method.accessFlags or AccessFlags.NATIVE.value
                    4 -> method.accessFlags = method.accessFlags or AccessFlags.ABSTRACT.value
                    5 -> {
                        runtime.methods.remove(method)
                        runtime.methods.add(ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType, method.accessFlags,
                            method.annotations, method.hiddenApiRestrictions, ImmutableMethodImplementation(method.implementation!!.registerCount,
                                emptyList(), emptyList(), emptyList())).toMutable())
                    }
                    6 -> {
                        runtime.methods.remove(method)
                        runtime.methods.add(ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType, method.accessFlags,
                            method.annotations, method.hiddenApiRestrictions, ImmutableMethodImplementation(0,
                                method.implementation!!.instructions, emptyList(), emptyList())).toMutable())
                    }
                }
                refusedUntouched(build, "$name mutation $mutation", context)
            }
            val status = contextFor(build)
            status.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == "disableChannelPull" }
            refusedUntouched(build, "missing build fact", status, statusPresent = false)
        }
    }

    private fun refusedUntouched(build: File, case: String, context: BytecodePatchContext, statusPresent: Boolean = true) {
        val types = (hosts(build).map { it.type } + CHANNEL_PULL + SETTINGS_STATUS).filter { context.classDefByOrNull(it) != null }
        val before = types.associateWith { context.mutableClassDefBy(it).state() }
        assertThrows("${build.name}: $case", PatchException::class.java) { disableChannelPullPatch.execute(context) }
        assertEquals("${build.name}: $case keeps the complete prior state", before,
            types.associateWith { context.mutableClassDefBy(it).state() })
        if (statusPresent) assertFlag(context, false)
    }

    private fun assertStock(where: String, original: Method, patched: Method, entry: Int, inserted: Int) {
        val old = original.instructions()
        val after = patched.instructions()
        val kept = after.indices.filter { it !in entry until entry + inserted }
        assertEquals("$where: all stock operands", old.map(::operands), kept.map { operands(after[it]) })
        assertEquals("$where: register frame", original.implementation!!.registerCount, patched.implementation!!.registerCount)
        fun moved(index: Int) = if (index < entry) index else index + inserted
        fun target(index: Int) = if (index == entry) entry else moved(index)
        val oldFlow = ControlFlow.of(original)
        val newFlow = ControlFlow.of(patched)
        for (at in old.indices) {
            assertEquals("$where: normal edge $at", oldFlow.normal[at].map(::target), newFlow.normal[moved(at)])
            assertEquals("$where: exception edge $at", oldFlow.exceptional[at].map(::target), newFlow.exceptional[moved(at)])
        }
    }

    /** Executes the fixture's channel/topic predicate region with concrete stock and hook answers. */
    private fun eligible(method: Method, sites: ChannelPullSites, patched: Boolean, enabled: Boolean,
                         channel: Boolean, group: Boolean, topic: Boolean, bot: Boolean): Boolean {
        val body = method.instructions()
        val flow = ControlFlow.of(method)
        val extra = if (patched) 6 else 0
        val joined = sites.scrollGate + extra
        val exit = sites.scrollExit + extra
        val registers = IntArray(method.implementation!!.registerCount)
        var answer = 0
        var at = sites.channelCall - 1
        for (instruction in body.take(at)) {
            if (instruction is NarrowLiteralInstruction && instruction.opcode.setsRegister()) {
                registers[instruction.namedRegisters().first()] = instruction.narrowLiteral
            }
        }
        repeat(80) {
            if (at == joined) return true
            if (at == exit) return false
            val instruction = body[at]
            val regs = instruction.namedRegisters()
            when (instruction.opcode) {
                Opcode.IGET_OBJECT -> registers[regs[0]] = 1
                Opcode.IGET_BOOLEAN -> registers[regs[0]] = if (when {
                    instruction.field() == sites.topic -> topic
                    instruction.field()?.name == "megagroup" -> group
                    else -> false
                }) 1 else 0
                Opcode.IGET -> registers[regs[0]] = 0 // Normal chat mode.
                Opcode.CONST_4, Opcode.CONST_16 -> registers[regs[0]] = (instruction as NarrowLiteralInstruction).narrowLiteral
                Opcode.INVOKE_STATIC, Opcode.INVOKE_VIRTUAL -> answer = when (instruction.call()!!.name) {
                    "isChannel" -> if (channel) 1 else 0
                    "isBotForum" -> if (bot) 1 else 0
                    "stopBottomPull" -> if (enabled) 1 else 0
                    "getScrollState" -> 1 // The caller is dragging.
                    else -> 0 // Telegram's report predicate refuses no movement here.
                }
                Opcode.MOVE_RESULT -> registers[regs.single()] = answer
                Opcode.IF_EQZ, Opcode.IF_NEZ -> {
                    val zero = registers[regs.single()] == 0
                    at = if (zero == (instruction.opcode == Opcode.IF_EQZ)) flow.normal[at].single { it != at + 1 } else at + 1
                    return@repeat
                }
                Opcode.IF_EQ, Opcode.IF_NE -> {
                    val same = registers[regs[0]] == registers[regs[1]]
                    at = if (same == (instruction.opcode == Opcode.IF_EQ)) flow.normal[at].single { it != at + 1 } else at + 1
                    return@repeat
                }
                Opcode.NOP -> Unit
                else -> error("unexpected predicate opcode ${instruction.opcode}")
            }
            at++
        }
        error("predicate never leaves its region")
    }

    /** Topic and disabled controls fall through the hook. A true channel guard takes stock bounce. */
    private fun retracts(sites: ChannelPullSites, enabled: Boolean, topic: Boolean): Boolean {
        val flow = ControlFlow.of(sites.touch)
        val body = sites.touch.instructions()
        var at = sites.releaseGate
        var value = false
        repeat(6) {
            if (at == sites.releaseGate + 5) return false
            if (at == sites.retract + 6) return true
            when (body[at].opcode) {
                Opcode.IGET_BOOLEAN -> value = topic
                Opcode.INVOKE_STATIC -> value = enabled
                Opcode.MOVE_RESULT -> Unit
                Opcode.IF_NEZ -> {
                    at = if (value) flow.normal[at].single { it != at + 1 } else at + 1
                    return@repeat
                }
                else -> error("unexpected release opcode")
            }
            at++
        }
        error("release hook never leaves")
    }

    private fun hosts(build: File): List<ClassDef> = HOSTS.getOrPut(build.absolutePath) {
        val layouts = FixtureDex.classesWhere(build, { true }) { it.isChannelPullScroll() }
        assertEquals("${build.name}: one bottom-pull layout manager", 1, layouts.size)
        val scroll = layouts.single().methods.single { it.isChannelPullScroll() }.instructions()
        val fields = scroll.mapNotNull { it.field() }
        val activity = scroll[scroll.indexOfFirst { it.call()?.name == "isChannel" } - 1].field()!!.definingClass
        val needed = fields.filter { it.definingClass == activity && it.type.startsWith("Lorg/telegram/ui/") }.map { it.type }.toSet() + activity
        val dependencies = FixtureDex.classes(build, needed)
        assertEquals("${build.name}: structural binding classes", needed, dependencies.keys)
        val parents = mutableListOf<ClassDef>()
        val superOwner = scroll.first { it.opcode == Opcode.INVOKE_SUPER }.call()!!.definingClass
        var parent = layouts.single().superclass
        while (parent != null && parent !in parents.map { it.type }) {
            val definition = FixtureDex.classes(build, setOf(parent)).getValue(parent)
            parents += definition
            if (parent == superOwner) break
            parent = definition.superclass
        }
        assertEquals("${build.name}: inherited scrolling implementation", superOwner, parents.last().type)
        layouts + dependencies.values + parents
    }

    private fun contextFor(build: File, runtime: Boolean = true) = PatchContexts.of(
        ExtensionDex.classes().filter { runtime || it.type != CHANNEL_PULL } + hosts(build))
    private fun assertFlag(context: BytecodePatchContext, expected: Boolean) {
        val body = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "disableChannelPull" }.instructions()
        assertEquals(if (expected) 1 else 0, (body[0] as NarrowLiteralInstruction).narrowLiteral)
    }
    private fun reachable(flow: ControlFlow, from: Int): Set<Int> {
        val reached = mutableSetOf<Int>()
        val pending = ArrayDeque(listOf(from))
        while (pending.isNotEmpty()) {
            val at = pending.removeFirst()
            if (reached.add(at)) pending.addAll(flow.normal[at] + flow.exceptional[at])
        }
        return reached
    }
    private fun Method.state(): List<Any?> {
        val body = instructions()
        val flow = if (body.isEmpty()) null else ControlFlow.of(this)
        return listOf(accessFlags, implementation?.registerCount, body.map(::operands),
            body.map { listOf(it.codeUnits, (it as? OffsetInstruction)?.codeOffset) }, flow?.normal?.toList(), flow?.exceptional?.toList(),
            implementation?.tryBlocks?.map { listOf(it.startCodeAddress, it.codeUnitCount,
                it.exceptionHandlers.map { handler -> handler.exceptionType to handler.handlerCodeAddress }) })
    }
    private fun ClassDef.state() = listOf(accessFlags, fields.map { listOf(it.name, it.type, it.accessFlags, it.initialValue) },
        methods.map { key(it) to it.state() })
    private fun operands(instruction: Instruction): List<Any?> = listOf(instruction.opcode, instruction.namedRegisters(), instruction.ref(),
        (instruction as? WideLiteralInstruction)?.wideLiteral, (instruction as? SwitchPayload)?.switchElements?.map { it.key })
    private fun key(method: Method) = "${method.definingClass}->${method.name}(${method.parameterTypes.joinToString("")})${method.returnType}"
    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun Instruction.ref() = (this as? ReferenceInstruction)?.reference?.toString()
    private fun Instruction.field(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference
    private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
    private companion object { val HOSTS = mutableMapOf<String, List<ClassDef>>() }
}
