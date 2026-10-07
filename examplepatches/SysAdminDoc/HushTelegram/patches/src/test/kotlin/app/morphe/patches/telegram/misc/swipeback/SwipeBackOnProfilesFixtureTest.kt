/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.swipeback

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
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
import org.junit.Test
import java.io.File
import java.lang.ref.SoftReference

/** The profile's swipe check, every other screen's swipe check, and the runtime. */
class SwipeBackOnProfilesFixtureTest {
    @Test fun `each hit test answer passes through the extension and every stock path stays`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val site = context.resolveSwipeBackOnProfiles()
            val old = ImmutableMethod.of(site.method)
            val untouched = hostState(build, context, setOf(key(site.method)))
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { swipeBackOnProfilesPatch.execute(context) })

            val before = old.controlBody()
            val after = site.method.controlBody()
            assertEquals("$name: register count", old.implementation!!.registerCount, site.method.implementation!!.registerCount)
            assertEquals("$name: two hit tests", 2, before.count { it.controlRef() == HIT_TEST })
            assertEquals("$name: two calls and two reads", before.size + 4, after.size)
            val moved = { i: Int -> i + 2 * site.results.count { it < i } }
            for (result in site.results) {
                val answer = before[result].namedRegisters()
                assertEquals("$name: the hit test is read", Opcode.MOVE_RESULT, before[result].opcode)
                assertEquals(HIT_TEST, before[result - 1].controlRef())
                val call = after[moved(result) + 1]
                assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
                assertEquals(TOUCH_BLOCKS, call.controlRef())
                assertEquals("$name: the answer goes in", answer, call.namedRegisters())
                assertEquals(Opcode.MOVE_RESULT, after[moved(result) + 2].opcode)
                assertEquals("$name: and comes back in the same register", answer, after[moved(result) + 2].namedRegisters())
            }
            val a = ControlFlow.of(old)
            val b = ControlFlow.of(site.method)
            for (i in before.indices) {
                assertEquals("$name: stock operand $i", before[i].operand(), after[moved(i)].operand())
                assertEquals("$name: stock exceptional path $i", a.exceptional[i].map(moved), b.exceptional[moved(i)])
                if (i in site.results) {
                    assertEquals("$name: answer $i goes to the extension", listOf(moved(i) + 1), b.normal[moved(i)])
                    assertEquals(listOf(moved(i) + 2), b.normal[moved(i) + 1])
                    assertEquals("$name: then on as before", a.normal[i].map(moved), b.normal[moved(i) + 2])
                    assertEquals("$name: only the answer reaches the call", listOf(moved(i)),
                        b.normal.indices.filter { moved(i) + 1 in b.normal[it] })
                } else {
                    assertEquals("$name: stock normal path $i", a.normal[i].map(moved), b.normal[moved(i)])
                }
            }
            assertEquals("$name: every other screen's swipe check", untouched, hostState(build, context, setOf(key(site.method))))
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "swipeBackOnProfiles" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `a changed swipe check or runtime refuses before any method changes`() {
        val swap = { m: MutableMethod, i: Int, ref: String -> m.replaceInstruction(i, "invoke-virtual {v${m.getInstruction(i).namedRegisters().first()}}, $ref") }
        val at = { m: MutableMethod, wanted: (String) -> Boolean -> m.controlBody().indexOfFirst { it.controlRef()?.let(wanted) == true } }
        for (build in Fixtures.declaredBuilds()) {
            val mutations: List<Pair<String, (BytecodePatchContext, SwipeBackSite) -> Unit>> = listOf(
                "one hit test" to { _, s -> swap(s.method, s.results.last() - 1, "Landroid/graphics/Rect;->isEmpty()Z") },
                "a hit test isn't read" to { _, s -> s.method.replaceInstruction(s.results.first(), "nop") },
                "no photo count" to { _, s -> swap(s.method, at(s.method) { it.endsWith("->getRealCount()I") }, "Landroid/view/View;->getId()I") },
                "no first tab" to { _, s -> swap(s.method, at(s.method) { it.endsWith("->getFirstTabId()I") }, "Landroid/view/View;->getId()I") },
                "a jump past the photo answer" to { _, s -> val m = s.method
                    m.addInstructionsWithLabels(0, "if-eqz p1, :hush_past", ExternalLabel("hush_past", m.getInstruction(s.results.first() + 1))) },
                "missing build flag" to { c, _ -> c.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == "swipeBackOnProfiles" } },
                "private swipe hook" to { c, _ -> val h = c.mutableClassDefBy(SWIPE_BACK).methods.single { it.name == "touchBlocks" }
                    h.accessFlags = h.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "missing swipe hook" to { c, _ -> c.mutableClassDefBy(SWIPE_BACK).methods.removeAll { it.name == "touchBlocks" } },
            )
            for ((case, change) in mutations) {
                val c = context(build)
                change(c, c.resolveSwipeBackOnProfiles())
                val before = completeState(build, c)
                assertThrows("${build.name}: $case", PatchException::class.java) { swipeBackOnProfilesPatch.execute(c) }
                assertEquals("${build.name}: $case preserves every method, path and build fact", before, completeState(build, c))
            }
        }
    }

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + hosts(build))
    private fun completeState(build: File, c: BytecodePatchContext) = (hosts(build).map { it.type } + listOf(SWIPE_BACK, SETTINGS_STATUS))
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

    /** Every screen with its own swipe check, the profile among them. */
    private fun loadHosts(build: File): List<ClassDef> =
        FixtureDex.classesWhere(build, { true }) { method -> method.name == "isSwipeBackEnabled" }.map(ImmutableClassDef::of)

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
