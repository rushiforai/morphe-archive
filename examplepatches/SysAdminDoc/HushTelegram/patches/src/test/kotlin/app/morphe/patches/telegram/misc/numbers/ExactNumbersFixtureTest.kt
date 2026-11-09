/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.numbers

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.origRef
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import org.junit.AfterClass
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.lang.ref.SoftReference
import app.morphe.util.names.origName
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

/** LocaleController, every class that shortens a count, and the runtime. */
class ExactNumbersFixtureTest {
    @Test fun `one hook at the start of the short number formatter and every stock path stays`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val site = context.resolveExactNumbers()
            val formatter = key(site.method)
            val old = ImmutableMethod.of(site.method)
            val untouched = hostState(build, context, setOf(formatter))
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { exactNumbersPatch.execute(context) })

            val before = old.controlBody()
            val after = site.method.controlBody()
            assertEquals("$name: register count", old.implementation!!.registerCount, site.method.implementation!!.registerCount)
            assertEquals("$name: four instructions", before.size + 4, after.size)
            val registers = old.implementation!!.registerCount
            assertEquals("$name: the count and the array are the parameters", setOf(registers - 2, registers - 1), setOf(site.count, site.array))
            assertEquals("$name: the count", registers - 2 + old.parameterTypes.map { it.toString() }.indexOf("I"), site.count)
            assertEquals(if (site.array == site.count + 1) Opcode.INVOKE_STATIC_RANGE else Opcode.INVOKE_STATIC, after[0].opcode)
            assertEquals("$EXACT_NUMBERS->format(I[I)Ljava/lang/String;", after[0].controlRef())
            assertEquals(listOf(site.count, site.array), after[0].namedRegisters())
            val result = after[1].namedRegisters().single()
            assertEquals(Opcode.MOVE_RESULT_OBJECT, after[1].opcode)
            assertEquals(Opcode.IF_EQZ, after[2].opcode)
            assertEquals(Opcode.RETURN_OBJECT, after[3].opcode)
            assertEquals(listOf(result), after[3].namedRegisters())
            assertTrue("$name: the answer lands in a local Telegram writes before reading", result < minOf(site.count, site.array) &&
                before.first().opcode == Opcode.NEW_INSTANCE && before.first().namedRegisters() == listOf(result))

            val a = ControlFlow.of(old)
            val b = ControlFlow.of(site.method)
            assertEquals("$name: no answer falls through to Telegram's formatter", listOf(3, 4), b.normal[2].sorted())
            for (i in before.indices) {
                assertEquals("$name: stock operand $i", before[i].operand(), after[i + 4].operand())
                assertEquals("$name: stock normal path $i", a.normal[i].map { it + 4 }, b.normal[i + 4])
                assertEquals("$name: stock exceptional path $i", a.exceptional[i].map { it + 4 }, b.exceptional[i + 4])
            }
            assertTrue("$name: nothing jumps into the hook", (3 until b.normal.size).none { from -> b.normal[from].any { it in 1..3 } })
            assertEquals("$name: every caller and every other host method", untouched, hostState(build, context, setOf(formatter)))
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "exactNumbers" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `the callers are the twelve reviewed count displays`() {
        // Reviewed 2026-10-06: member, subscriber and bot-user counts, views, replies, reactions and
        // Premium limit previews. Reviewed 2026-11-07: 13.2 adds the view count an embedded page block
        // measures. A new caller fails here so it gets the same review.
        for (build in Fixtures.declaredBuilds()) {
            val callers = hosts(build).flatMap { it.methods }.filter { m -> m.controlBody().any { it.callsShortNumber() } }
            assertEquals("${build.name}: calling methods", 12, callers.size)
        }
    }

    @Test fun `a changed formatter or runtime refuses before any method changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val mutations: List<Pair<String, (BytecodePatchContext, ExactNumbersSite) -> Unit>> = listOf(
                "formatter no longer static" to { _, s -> s.method.accessFlags = s.method.accessFlags and AccessFlags.STATIC.value.inv() },
                "formatter no longer writes K" to { _, s -> s.method.replaceInstruction(s.method.controlBody().indexOfFirst { it.controlString() == "K" },
                    "const-string v${s.method.controlBody().first { it.controlString() == "K" }.namedRegisters().single()}, \"k\"") },
                "missing build flag" to { c, _ -> c.tgMutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.origName == "exactNumbers" } },
                "private format hook" to { c, _ -> val h = c.tgMutableClassDefBy(EXACT_NUMBERS).methods.single { it.origName == "format" }
                    h.accessFlags = h.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "empty format hook" to { c, _ -> val owner = c.tgMutableClassDefBy(EXACT_NUMBERS); val h = owner.methods.single { it.origName == "format" }
                    owner.methods.remove(h)
                    owner.methods.add(ImmutableMethod(h.definingClass, h.name, h.parameters, h.returnType, h.accessFlags, h.annotations,
                        h.hiddenApiRestrictions, ImmutableMethodImplementation(2, emptyList(), emptyList(), emptyList())).toMutable()) },
            )
            for ((case, change) in mutations) {
                val c = context(build)
                change(c, c.resolveExactNumbers())
                val before = completeState(build, c)
                assertThrows("${build.name}: $case", PatchException::class.java) { exactNumbersPatch.execute(c) }
                assertEquals("${build.name}: $case preserves every method, path and build fact", before, completeState(build, c))
            }
        }
    }

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + hosts(build))
    private fun completeState(build: File, c: BytecodePatchContext) = (hosts(build).map { it.type } + listOf(EXACT_NUMBERS, SETTINGS_STATUS))
        .filter { c.tgClassDefByOrNull(it) != null }.associateWith { type -> c.tgMutableClassDefBy(type).let { cls ->
            listOf(cls.accessFlags, cls.methods.map { key(it) to it.state() }) } }
    private fun hostState(build: File, c: BytecodePatchContext, except: Set<String>) = hosts(build)
        .flatMap { c.tgMutableClassDefBy(it.type).methods }.filter { key(it) !in except }.associate { key(it) to it.state() }

    private fun hosts(build: File): List<ClassDef> {
        val identity = FixtureDex.inputIdentity(build)
        return HOSTS[identity]?.get() ?: loadHosts(build).also {
            if (HOSTS.size >= 2) HOSTS.clear()
            HOSTS[identity] = SoftReference(it)
        }
    }

    /** LocaleController, and every class with a method that shortens a count. */
    private fun loadHosts(build: File): List<ClassDef> {
        val callers = FixtureDex.classesWhere(build, { true }) { method -> method.controlBody().any { it.callsShortNumber() } }
        return (callers + FixtureDex.classes(build, setOf(LOCALE_CONTROLLER)).values).associateBy { it.type }.values.map(ImmutableClassDef::of)
    }

    private fun Method.state(): List<Any?> {
        val body = controlBody(); val flow = if (body.isEmpty()) null else ControlFlow.of(this)
        return listOf(accessFlags, implementation?.registerCount, body.map { it.operand() }, body.map { listOf(it.codeUnits, (it as? OffsetInstruction)?.codeOffset) },
            flow?.normal?.toList(), flow?.exceptional?.toList())
    }
    private fun Instruction.operand() = listOf(opcode, namedRegisters(), origRef(),
        (this as? WideLiteralInstruction)?.wideLiteral)
    private fun key(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"
    private fun Instruction.callsShortNumber() =
        ((this as? ReferenceInstruction)?.reference as? MethodReference)?.isShortNumber() == true

    companion object {
        private val HOSTS = mutableMapOf<String, SoftReference<List<ClassDef>>>()
        @AfterClass @JvmStatic fun releaseFixtures() { HOSTS.clear() }
    }
}
