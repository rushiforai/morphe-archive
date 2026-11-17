/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.fonts

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.AfterClass
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.lang.ref.SoftReference

/**
 * A font file of your own (#79) on the real builds: every TextPaint and TextView Telegram and its
 * libraries make, and every plain face they read by name, goes through CustomFont right after,
 * and nothing else in the code moves.
 */
class CustomFontFixtureTest {
    @Test fun `every new text paint, text view and plain face goes through the font file right after it's made`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            assertEquals("$name: execute", emptyList<String>(), PatchLogCapture.warnings { useSystemFontPatch.execute(context) })
            val telegram = telegramTypes(build)
            val before = snapshot(context, telegram)
            val extension = extensionState(context)
            assertEquals("$name: finalize", emptyList<String>(), PatchLogCapture.warnings { useSystemFontPatch.finalize(context) })

            val hooked = mutableMapOf<String, Int>()
            for (type in telegram) {
                val old = before.getValue(type)
                val now = context.tgMutableClassDefBy(type).methods.toList()
                assertEquals("$name: $type keeps its methods", old.keys, now.map { key(it) }.toSet())
                for (method in now) compare("$name: ${key(method)}", old.getValue(key(method)), method, hooked)
            }
            for (hook in listOf("paint", "view", "regular", "bold")) {
                assertTrue("$name: Telegram still makes some for $hook: $hooked", (hooked[hook] ?: 0) > 0)
            }
            assertEquals("$name: the runtime keeps its code", extension, extensionState(context))
            assertEquals("$name: the build says it has the font file", 1L, status(context, "customFont"))
            assertEquals("$name: and the switch", 1L, status(context, "useSystemFont"))
        }
    }

    @Test fun `a runtime without a hook leaves Telegram's text alone and the rest of the switch on`() {
        for (build in Fixtures.declaredBuilds()) {
            val mutations: List<Pair<String, (BytecodePatchContext) -> Unit>> = listOf(
                "no paint hook" to { c -> c.tgMutableClassDefBy(CUSTOM_FONT).methods.removeAll { it.origName == "paint" } },
                "no bold hook" to { c -> c.tgMutableClassDefBy(CUSTOM_FONT).methods.removeAll { it.origName == "bold" } },
            )
            for ((what, mutate) in mutations) {
                val name = "${build.name}: $what"
                val context = context(build)
                mutate(context)
                val warnings = PatchLogCapture.warnings { useSystemFontPatch.execute(context) }
                assertEquals(name, 1, warnings.size)
                assertTrue("$name: $warnings", warnings.single().contains("The patch goes on without a font file of your own."))
                val telegram = telegramTypes(build)
                val before = state(snapshot(context, telegram))
                assertEquals(name, emptyList<String>(), PatchLogCapture.warnings { useSystemFontPatch.finalize(context) })
                assertEquals("$name: no site changes", before, state(snapshot(context, telegram)))
                assertEquals("$name: the font file stays off", 0L, status(context, "customFont"))
                assertEquals("$name: the switch stays on", 1L, status(context, "useSystemFont"))
            }
        }
    }

    @Test fun `Telegram making its text views another way leaves every site alone`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            assertEquals(name, emptyList<String>(), PatchLogCapture.warnings { useSystemFontPatch.execute(context) })
            val telegram = telegramTypes(build)
            var removed = 0
            for (type in telegram) {
                val methods = context.tgMutableClassDefBy(type).methods
                val gone = methods.filter { m -> m.controlBody().any { spec(it) == "view" } }
                removed += gone.size
                methods.removeAll(gone.toSet())
            }
            assertTrue("$name: some methods made text views", removed > 0)
            val before = state(snapshot(context, telegram))
            val warnings = PatchLogCapture.warnings { useSystemFontPatch.finalize(context) }
            assertEquals(name, 1, warnings.size)
            assertTrue("$name: $warnings", warnings.single().contains("no longer builds its text paints and views the known way"))
            assertEquals("$name: not even the paints change", before, state(snapshot(context, telegram)))
            assertEquals("$name: the font file stays off", 0L, status(context, "customFont"))
            assertEquals("$name: the switch stays on", 1L, status(context, "useSystemFont"))
        }
    }

    /**
     * [now] is [old] with the hook after each site [spec] names and nothing else: the same
     * instructions and registers, every branch and handler landing where it did, and the hook
     * reached only from its site. Nops are left out on both sides: the ones padding a switch or
     * array payload move when code goes in ahead of it.
     */
    private fun compare(where: String, old: Method, now: Method, hooked: MutableMap<String, Int>) {
        val rawA = old.controlBody()
        val rawB = now.controlBody()
        val ia = rawA.indices.filter { rawA[it].opcode != Opcode.NOP }
        val ib = rawB.indices.filter { rawB[it].opcode != Opcode.NOP }
        val a = ia.map { rawA[it] }
        val b = ib.map { rawB[it] }
        assertEquals("$where: register count", old.implementation?.registerCount, now.implementation?.registerCount)
        val pos = IntArray(a.size)
        var j = 0
        for ((i, instruction) in a.withIndex()) {
            pos[i] = j
            assertEquals("$where: stock instruction $i", instruction.operand(), b.getOrNull(j)?.operand())
            j++
            val hook = spec(instruction) ?: continue
            val register = instruction.namedRegisters().first()
            val face = hook == "regular" || hook == "bold"
            val parameter = when (hook) { "paint" -> "Landroid/graphics/Paint;"; "view" -> "Landroid/widget/TextView;"; else -> FACE }
            val call = b.getOrNull(j)
            assertNotNull("$where: a hook after $i", call)
            assertEquals("$where: hook after $i", Opcode.INVOKE_STATIC_RANGE, call!!.opcode)
            assertEquals("$where: hook after $i", "$CUSTOM_FONT->$hook($parameter)${if (face) FACE else "V"}", call.controlRef())
            assertEquals("$where: hook after $i hands over what the site made", listOf(register), call.namedRegisters())
            j++
            if (face) {
                assertEquals("$where: the answer after $i", Opcode.MOVE_RESULT_OBJECT, b.getOrNull(j)?.opcode)
                assertEquals("$where: back into the site's register", listOf(register), b[j].namedRegisters())
                j++
            }
            hooked.merge(hook, 1, Int::plus)
        }
        assertEquals("$where: nothing else added", b.size, j)
        if (a.size == b.size) return

        val fa = ControlFlow.of(old)
        val fb = ControlFlow.of(now)
        val fromA = unpadded(rawA.size, ia)
        val fromB = unpadded(rawB.size, ib)
        fun stock(edges: List<Int>) = edges.map { pos[fromA[it]] }.sorted()
        fun patched(edges: List<Int>) = edges.map { fromB[it] }.sorted()
        for (i in a.indices) {
            val next = if (i + 1 < a.size) pos[i + 1] else b.size
            val added = next - pos[i] - 1
            assertEquals("$where: handlers of $i", stock(fa.exceptional[ia[i]]), patched(fb.exceptional[ib[pos[i]]]))
            if (added == 0) {
                assertEquals("$where: paths from $i", stock(fa.normal[ia[i]]), patched(fb.normal[ib[pos[i]]]))
                continue
            }
            assertEquals("$where: a site falls through", listOf(i + 1), fa.normal[ia[i]].map { fromA[it] })
            for (h in 0 until added) {
                assertEquals("$where: through the hook after $i", listOf(pos[i] + h + 1), patched(fb.normal[ib[pos[i] + h]]))
            }
            assertEquals("$where: back to the code after $i", listOf(next), patched(fb.normal[ib[next - 1]]))
        }
    }

    /** For each index into a body of [size], the index of the first instruction at or after it once nops are left out. */
    private fun unpadded(size: Int, kept: List<Int>): IntArray {
        val map = IntArray(size + 1)
        var k = 0
        for (raw in 0..size) {
            while (k < kept.size && kept[k] < raw) k++
            map[raw] = k
        }
        return map
    }

    /** The CustomFont hook an instruction's result goes to, by Android's API, or null for none. */
    private fun spec(instruction: Instruction): String? {
        val ref = instruction.controlRef() ?: return null
        return when (instruction.opcode) {
            Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE -> when {
                ref == "Landroid/text/TextPaint;-><init>()V" || ref == "Landroid/text/TextPaint;-><init>(I)V" -> "paint"
                ref.substringBefore("->") in TEXT_VIEW_FAMILY && ref.substringAfter("->").startsWith("<init>(") -> "view"
                else -> null
            }
            Opcode.SGET_OBJECT -> when (ref) {
                "$FACE->DEFAULT:$FACE", "$FACE->SANS_SERIF:$FACE" -> "regular"
                "$FACE->DEFAULT_BOLD:$FACE" -> "bold"
                else -> null
            }
            else -> null
        }
    }

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + classes(build))
    private fun telegramTypes(build: File) = classes(build).map { it.type }

    private fun snapshot(c: BytecodePatchContext, types: List<String>) = types.associateWith { type ->
        c.tgMutableClassDefBy(type).methods.associate { key(it) to ImmutableMethod.of(it) as Method } }

    private fun state(snapshot: Map<String, Map<String, Method>>) = snapshot.mapValues { (_, methods) ->
        methods.mapValues { (_, m) -> listOf(m.implementation?.registerCount, m.controlBody().map { it.operand() }) } }

    /** Every runtime class but the build flags, whose customFont is checked on its own. */
    private fun extensionState(c: BytecodePatchContext) = ExtensionDex.classes().map { it.type }.filter { it != SETTINGS_STATUS }
        .associateWith { type -> c.tgMutableClassDefBy(type).methods.associate { m ->
            key(m) to listOf(m.accessFlags, m.implementation?.registerCount, m.controlBody().map { it.operand() }) } }

    private fun status(c: BytecodePatchContext, flag: String) = (c.tgMutableClassDefBy(SETTINGS_STATUS).methods
        .single { it.origName == flag }.controlBody().first() as WideLiteralInstruction).wideLiteral

    private fun classes(build: File): List<ClassDef> {
        val identity = FixtureDex.inputIdentity(build)
        return CLASSES[identity]?.get() ?: load(build).also {
            if (CLASSES.size >= 2) CLASSES.clear()
            CLASSES[identity] = SoftReference(it)
        }
    }

    /** AndroidUtilities and the font file loaders the switch needs, and every class with a site. */
    private fun load(build: File): List<ClassDef> {
        val named = FixtureDex.classesWhere(build, { true }) { method ->
            method.controlBody().any { it.controlString()?.startsWith("fonts/") == true || spec(it) != null } }
        val utilities = FixtureDex.classes(build, setOf(ANDROID_UTILITIES)).values
        return (named + utilities).associateBy { it.type }.values.map(ImmutableClassDef::of)
    }

    private fun Instruction.operand() = listOf(opcode, namedRegisters(), origRef(), (this as? WideLiteralInstruction)?.wideLiteral)
    private fun key(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"

    companion object {
        private const val FACE = "Landroid/graphics/Typeface;"

        /** TextView and every android.widget class built on it, from Android's reference. */
        private val TEXT_VIEW_FAMILY = listOf("TextView", "Button", "CheckedTextView", "Chronometer", "DigitalClock",
            "EditText", "TextClock", "AutoCompleteTextView", "MultiAutoCompleteTextView", "CompoundButton", "CheckBox",
            "RadioButton", "Switch", "ToggleButton").map { "Landroid/widget/$it;" }.toSet() +
            "Landroid/inputmethodservice/ExtractEditText;"

        private val CLASSES = mutableMapOf<String, SoftReference<List<ClassDef>>>()
        @AfterClass @JvmStatic fun releaseFixtures() { CLASSES.clear() }
    }
}
