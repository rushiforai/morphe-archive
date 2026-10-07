/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.translate

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
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

/** TranslateController, MessageObject, the chat screen, and the runtime. */
class HideTranslateBarFixtureTest {
    @Test fun `the chat screen's two reads ask the runtime and message translation stays Telegram's`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val sites = context.resolveTranslateBar()
            assertEquals("$name: the top bar and the menu", 2, sites.size)
            val changed = sites.map { key(it.method) }.toSet()
            val old = sites.associate { key(it.method) to ImmutableMethod.of(it.method) }
            val untouched = hostState(build, context, changed)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideTranslateBarPatch.execute(context) })

            for (site in sites) {
                val before = old.getValue(key(site.method)).controlBody()
                val after = site.method.controlBody()
                assertEquals("$name: same length", before.size, after.size)
                assertEquals(Opcode.INVOKE_STATIC, after[site.index].opcode)
                assertEquals("$TRANSLATE_BAR->hidden(Ljava/lang/Object;J)Z", after[site.index].controlRef())
                assertEquals("$name: the controller and the chat id", before[site.index].namedRegisters(), after[site.index].namedRegisters())
                assertEquals(BAR_HIDDEN, before[site.index].controlRef())
                for (i in before.indices) if (i != site.index) assertEquals("$name: stock operand $i", before[i].operand(), after[i].operand())
                val a = ControlFlow.of(old.getValue(key(site.method)))
                val b = ControlFlow.of(site.method)
                assertEquals("$name: same paths", a.normal.toList(), b.normal.toList())
                assertEquals("$name: same handlers", a.exceptional.toList(), b.exceptional.toList())
            }
            // Message translation and the controller itself keep Telegram's answer.
            assertEquals("$name: every other method, MessageObject's included", untouched, hostState(build, context, changed))
            val readers = hosts(build).flatMap { it.methods }.filter { m -> m.controlBody().any { it.controlRef() == BAR_HIDDEN } }
                .map { it.definingClass }.toSet()
            assertTrue("$name: message translation still asks", MESSAGE_OBJECT in readers && TRANSLATE_CONTROLLER in readers)

            for ((stub, target) in listOf("stockHidden" to BAR_HIDDEN, "translating" to TRANSLATING)) {
                val body = context.mutableClassDefBy(TRANSLATE_BAR).methods.single { it.name == stub }.controlBody()
                assertEquals(listOf(Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.RETURN), body.map { it.opcode })
                assertEquals(target, body[1].controlRef())
            }
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hideTranslateBar" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `a changed screen or runtime refuses before any method changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val mutations: List<Pair<String, (BytecodePatchContext, List<TranslateBarSite>) -> Unit>> = listOf(
                "the answer isn't read" to { _, s -> s.first().method.replaceInstruction(s.first().index + 1, "nop") },
                "no read left" to { _, s -> s.forEach { it.method.replaceInstruction(it.index, "nop") } },
                "translating check private" to { c, _ -> val m = c.mutableClassDefBy(TRANSLATE_CONTROLLER).methods.single { it.toString() == TRANSLATING }
                    m.accessFlags = m.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "missing build flag" to { c, _ -> c.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == "hideTranslateBar" } },
                "private hidden hook" to { c, _ -> val h = c.mutableClassDefBy(TRANSLATE_BAR).methods.single { it.name == "hidden" }
                    h.accessFlags = h.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "missing stock stub" to { c, _ -> c.mutableClassDefBy(TRANSLATE_BAR).methods.removeAll { it.name == "stockHidden" } },
            )
            for ((case, change) in mutations) {
                val c = context(build)
                change(c, c.resolveTranslateBar())
                val before = completeState(build, c)
                assertThrows("${build.name}: $case", PatchException::class.java) { hideTranslateBarPatch.execute(c) }
                assertEquals("${build.name}: $case preserves every method, path and build fact", before, completeState(build, c))
            }
        }
    }

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + hosts(build))
    private fun completeState(build: File, c: BytecodePatchContext) = (hosts(build).map { it.type } + listOf(TRANSLATE_BAR, SETTINGS_STATUS))
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

    /** Every class that asks whether a chat's translate bar is hidden, and the controller. */
    private fun loadHosts(build: File): List<ClassDef> {
        val readers = FixtureDex.classesWhere(build, { true }) { method -> method.controlBody().any { it.controlRef() == BAR_HIDDEN } }
        return (readers + FixtureDex.classes(build, setOf(TRANSLATE_CONTROLLER, MESSAGE_OBJECT)).values)
            .associateBy { it.type }.values.map(ImmutableClassDef::of)
    }

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
