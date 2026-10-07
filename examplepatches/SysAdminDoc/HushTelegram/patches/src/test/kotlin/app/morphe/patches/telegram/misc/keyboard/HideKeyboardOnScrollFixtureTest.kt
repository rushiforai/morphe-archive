/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.keyboard

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
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
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.AfterClass
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.lang.ref.SoftReference

/** The chat list's scroll listener, every other class that pauses spoilers, and the runtime. */
class HideKeyboardOnScrollFixtureTest {
    @Test fun `one call at the start of the chat list's scroll listener and every stock path stays`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val listener = context.resolveHideKeyboardOnScroll()
            val old = ImmutableMethod.of(listener)
            val untouched = hostState(build, context, setOf(key(listener)))
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideKeyboardOnScrollPatch.execute(context) })

            val before = old.controlBody()
            val after = listener.controlBody()
            val registers = listener.implementation!!.registerCount
            assertEquals("$name: register count", old.implementation!!.registerCount, registers)
            assertEquals("$name: one instruction", before.size + 1, after.size)
            assertEquals(Opcode.INVOKE_STATIC_RANGE, after[0].opcode)
            assertEquals("$SCROLL_KEYBOARD->chatScrolled(Landroid/view/View;I)V", after[0].controlRef())
            assertEquals("$name: the list and the state", listOf(registers - 2, registers - 1), after[0].namedRegisters())
            assertEquals(listOf(RECYCLER_VIEW, "I"), listener.parameterTypes.map { it.toString() })
            val a = ControlFlow.of(old)
            val b = ControlFlow.of(listener)
            assertEquals("$name: the call falls through to Telegram's listener", listOf(1), b.normal[0])
            for (i in before.indices) {
                assertEquals("$name: stock operand $i", before[i].operand(), after[i + 1].operand())
                assertEquals("$name: stock normal path $i", a.normal[i].map { it + 1 }, b.normal[i + 1])
                assertEquals("$name: stock exceptional path $i", a.exceptional[i].map { it + 1 }, b.exceptional[i + 1])
            }
            assertTrue("$name: nothing jumps back to the call", (1 until b.normal.size).none { from -> 0 in b.normal[from] })
            assertEquals("$name: every other listener and spoiler pause", untouched, hostState(build, context, setOf(key(listener))))
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hideKeyboardOnScroll" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `a changed listener or runtime refuses before any method changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val mutations: List<Pair<String, (BytecodePatchContext, MutableMethod) -> Unit>> = listOf(
                "no search keyboard close" to { _, l -> l.replaceInstruction(l.controlBody().indexOfFirst { it.controlRef()?.contains("->hideKeyboard(") == true }, "nop") },
                "no spoiler pause" to { _, l -> l.replaceInstruction(l.controlBody().indexOfFirst { it.controlRef() == STOP_SPOILERS }, "nop") },
                "missing build flag" to { c, _ -> c.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == "hideKeyboardOnScroll" } },
                "private scroll hook" to { c, _ -> val h = c.mutableClassDefBy(SCROLL_KEYBOARD).methods.single { it.name == "chatScrolled" }
                    h.accessFlags = h.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "missing scroll hook" to { c, _ -> c.mutableClassDefBy(SCROLL_KEYBOARD).methods.removeAll { it.name == "chatScrolled" } },
            )
            for ((case, change) in mutations) {
                val c = context(build)
                change(c, c.resolveHideKeyboardOnScroll())
                val before = completeState(build, c)
                assertThrows("${build.name}: $case", PatchException::class.java) { hideKeyboardOnScrollPatch.execute(c) }
                assertEquals("${build.name}: $case preserves every method, path and build fact", before, completeState(build, c))
            }
        }
    }

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + hosts(build))
    private fun completeState(build: File, c: BytecodePatchContext) = (hosts(build).map { it.type } + listOf(SCROLL_KEYBOARD, SETTINGS_STATUS))
        .filter { c.classDefByOrNull(it) != null }.associateWith { type -> c.mutableClassDefBy(type).let { cls ->
            listOf(cls.accessFlags, cls.methods.map { key(it) to it.state() }) } }
    private fun hostState(build: File, c: BytecodePatchContext, except: Set<String>) = hosts(build)
        .flatMap { c.mutableClassDefBy(it.type).methods }.filter { key(it) !in except }.associate { key(it) to it.state() }

    private fun hosts(build: File): List<ClassDef> {
        val identity = FixtureDex.inputIdentity(build)
        return HOSTS[identity]?.get() ?: loadHosts(build).also {
            if (HOSTS.size >= 2) HOSTS.clear()
            HOSTS[identity] = SoftReference(it)
        }
    }

    /** Every class that starts or stops spoiler animations: the chat list's listener and the message cells. */
    private fun loadHosts(build: File): List<ClassDef> =
        FixtureDex.classesWhere(build, { true }) { method -> method.controlBody().any { it.controlRef() == START_SPOILERS || it.controlRef() == STOP_SPOILERS } }
            .filter { it.type != "Lorg/telegram/messenger/NotificationCenter;" }.map(ImmutableClassDef::of)

    private fun Method.state(): List<Any?> {
        val body = controlBody(); val flow = if (body.isEmpty()) null else ControlFlow.of(this)
        return listOf(accessFlags, implementation?.registerCount, body.map { it.operand() }, body.map { listOf(it.codeUnits, (it as? OffsetInstruction)?.codeOffset) },
            flow?.normal?.toList(), flow?.exceptional?.toList())
    }
    private fun Instruction.operand() = listOf(opcode, namedRegisters(), (this as? ReferenceInstruction)?.reference?.toString(),
        (this as? WideLiteralInstruction)?.wideLiteral)
    private fun key(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"

    companion object {
        private val HOSTS = mutableMapOf<String, SoftReference<List<ClassDef>>>()
        @AfterClass @JvmStatic fun releaseFixtures() { HOSTS.clear() }
    }
}
