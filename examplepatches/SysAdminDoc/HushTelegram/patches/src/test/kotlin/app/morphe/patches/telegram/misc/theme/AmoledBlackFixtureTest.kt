/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.theme

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlCall
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
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.AfterClass
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.lang.ref.SoftReference
import java.util.zip.ZipFile

/** The classes that parse theme files, Telegram's key lookup, and the runtime. */
class AmoledBlackFixtureTest {
    @Test fun `one hook where the theme reader returns its colors and every stock path stays`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val site = context.resolveBlackTheme()
            val reader = key(site.method)
            val old = ImmutableMethod.of(site.method)
            val wallpaper = key(site.wallpaper)
            val oldWallpaper = ImmutableMethod.of(site.wallpaper)
            val untouched = hostState(build, context, setOf(reader, wallpaper))
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { amoledBlackPatch.execute(context) })

            val before = old.controlBody()
            val after = site.method.controlBody()
            assertEquals("$name: register count", old.implementation!!.registerCount, site.method.implementation!!.registerCount)
            assertEquals("$name: one way out", 1, site.returns.size)
            val at = site.returns.single()
            assertEquals("$name: three instructions", before.size + 3, after.size)
            val asset = old.implementation!!.registerCount - 2
            val (a, b) = after[at + 2].namedRegisters()
            assertEquals(Opcode.MOVE_OBJECT_FROM16, after[at].opcode)
            assertEquals("$name: the asset name", listOf(a, asset), after[at].namedRegisters())
            assertEquals(Opcode.MOVE_OBJECT_FROM16, after[at + 1].opcode)
            assertEquals("$name: the color set", listOf(b, site.colors), after[at + 1].namedRegisters())
            assertEquals(Opcode.INVOKE_STATIC, after[at + 2].opcode)
            assertEquals("$BLACK_THEME->loaded(Ljava/lang/String;$SPARSE_INT_ARRAY)V", after[at + 2].controlRef())
            assertTrue("$name: the copies take two locals of their own", a != b && a < 16 && b < 16 && site.colors !in setOf(a, b))
            assertEquals(Opcode.RETURN_OBJECT, after[at + 3].opcode)
            assertEquals(listOf(site.colors), after[at + 3].namedRegisters())

            // Everything that reached the return now reaches the hook in front of it.
            val a0 = ControlFlow.of(old)
            val b0 = ControlFlow.of(site.method)
            fun from(i: Int) = if (i < at) i else i + 3
            fun to(i: Int) = if (i <= at) i else i + 3
            for (i in before.indices) {
                assertEquals("$name: stock operand $i", before[i].operand(), after[from(i)].operand())
                assertEquals("$name: stock normal path $i", a0.normal[i].map(::to), b0.normal[from(i)])
                assertEquals("$name: stock exceptional path $i", a0.exceptional[i].map(::to), b0.exceptional[from(i)])
            }
            assertEquals(listOf(at + 1), b0.normal[at])
            assertEquals(listOf(at + 2), b0.normal[at + 1])
            assertEquals(listOf(at + 3), b0.normal[at + 2])
            assertTrue("$name: some stock path reaches the hook", (0 until at).any { at in b0.normal[it] })
            assertEquals("$name: every caller and every other host method", untouched, hostState(build, context, setOf(reader, wallpaper)))

            // The chat background builder hands its pattern strength, colors and picked wallpaper to the extension first.
            val shown = site.wallpaper.controlBody()
            val stock = oldWallpaper.controlBody()
            assertEquals("$name: six instructions in front", stock.size + 6, shown.size)
            val p = { i: Int -> site.wallpaper.parameterRegisterNumber(i) }
            assertEquals(listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_FROM16, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.MOVE_FROM16),
                shown.take(6).map { it.opcode })
            assertEquals(listOf(p(WALLPAPER_COLORS), p(WALLPAPER_PICKED), p(WALLPAPER_INTENSITY)), shown.take(3).map { it.namedRegisters()[1] })
            assertEquals(PATTERN_INTENSITY, shown[3].controlRef())
            assertEquals(shown.take(3).map { it.namedRegisters()[0] }, shown[3].namedRegisters())
            assertEquals("$name: the answer replaces the strength", listOf(p(WALLPAPER_INTENSITY), shown[4].namedRegisters()[0]), shown[5].namedRegisters())
            assertEquals("$name: stock body", stock.map { it.operand() }, shown.drop(6).map { it.operand() })

            // The stub asks Telegram's own lookup, the one the reader uses for every key.
            val stub = context.mutableClassDefBy(BLACK_THEME).methods.single { it.name == "keyId" }.controlBody()
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.RETURN), stub.map { it.opcode })
            assertEquals(site.keyLookup.toString(), stub[0].controlRef())
            assertTrue("$name: the lookup is the one before the color put", before.indices.any { i ->
                before[i].controlRef() == SPARSE_PUT && before.subList(maxOf(0, i - 4), i).any { it.controlCall()?.toString() == site.keyLookup.toString() } })
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "amoledBlack" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `Night and Dark carry every surface and the light themes stay light`() {
        val surfaces = ExtensionDex.classes().single { it.type == BLACK_THEME }.methods.single { it.name == "<clinit>" }
            .controlBody().mapNotNull { it.controlString() }.toSet()
        assertEquals(16, surfaces.size)
        // The runtime's own test pins this one first, as the surface that decides.
        val window = "windowBackgroundWhite"
        assertTrue(window in surfaces)
        for (build in Fixtures.declaredBuilds()) {
            val themes = ZipFile(build).use { zip -> listOf("night", "darkblue", "day", "arctic", "bluebubbles").associateWith { theme ->
                zip.getInputStream(zip.getEntry("assets/$theme.attheme")).bufferedReader().readLines()
                    .takeWhile { !it.startsWith("WPS") }.mapNotNull { line -> line.split('=', limit = 2).takeIf { it.size == 2 } }
                    .associate { (k, v) -> k to (if (v.startsWith("#")) v.substring(1).toLong(16).toInt() else v.trim().toInt()) } } }
            for (dark in listOf("night", "darkblue")) {
                assertEquals("${build.name}: $dark has every surface", emptyList<String>(), surfaces.filter { it !in themes.getValue(dark) })
                assertTrue("${build.name}: $dark reads as dark", dark(themes.getValue(dark).getValue(window)))
            }
            for (light in listOf("day", "arctic", "bluebubbles")) {
                themes.getValue(light)[window]?.let { assertFalse("${build.name}: $light reads as light", dark(it)) }
            }
            // Bubbles stay the theme's own, so they still stand out on black.
            assertNotEquals(0xFF000000.toInt(), themes.getValue("night").getValue("chat_inBubble"))
            val reader = hosts(build).flatMap { it.methods }.single { it.returnType == SPARSE_INT_ARRAY &&
                it.parameterTypes.map { p -> p.toString() } == THEME_FILE_PARAMETERS && it.controlBody().any { i -> i.controlString() == "WLS=" } }
            val named = hosts(build).single { it.type == reader.definingClass }.methods.flatMap { m -> m.controlBody().mapNotNull { it.controlString() } }
            assertTrue("${build.name}: Telegram's theme class names both dark assets", "night.attheme" in named && "darkblue.attheme" in named)
        }
    }

    @Test fun `a changed reader or runtime refuses before any method changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val mutations: List<Pair<String, (BytecodePatchContext, BlackThemeSite) -> Unit>> = listOf(
                "reader no longer static" to { _, s -> s.method.accessFlags = s.method.accessFlags and AccessFlags.STATIC.value.inv() },
                "asset no longer opened" to { _, s -> s.method.replaceInstruction(s.method.controlBody().indexOfFirst { i ->
                    i.controlCall()?.let { it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;") && it.returnType == "Ljava/io/File;" } == true }, "nop") },
                "keys go in without the lookup" to { _, s -> s.method.replaceInstruction(s.method.controlBody().indexOfFirst {
                    it.controlCall()?.toString() == s.keyLookup.toString() }, "nop") },
                "reader returns another set" to { _, s -> s.method.replaceInstruction(s.returns.single(), "return-object v${(s.colors + 1) % 16}") },
                "set swapped on the way out" to { _, s -> s.method.replaceInstruction(close(s), "move-object v${s.colors}, v${(s.colors + 1) % 16}") },
                "asset parameter overwritten" to { _, s -> s.method.replaceInstruction(close(s),
                    "move-object/from16 v${s.method.implementation!!.registerCount - 2}, v${s.colors}") },
                "lookup no longer public" to { c, s -> val m = c.mutableClassDefBy(s.keyLookup.definingClass).methods.single {
                    it.name == s.keyLookup.name && it.returnType == "I" && it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;") }
                    m.accessFlags = m.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "missing build flag" to { c, _ -> c.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == "amoledBlack" } },
                "private loaded hook" to { c, _ -> val h = c.mutableClassDefBy(BLACK_THEME).methods.single { it.name == "loaded" }
                    h.accessFlags = h.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "missing keyId stub" to { c, _ -> c.mutableClassDefBy(BLACK_THEME).methods.removeAll { it.name == "keyId" } },
            )
            for ((case, change) in mutations) {
                val c = context(build)
                change(c, c.resolveBlackTheme())
                val before = completeState(build, c)
                assertThrows("${build.name}: $case", PatchException::class.java) { amoledBlackPatch.execute(c) }
                assertEquals("${build.name}: $case preserves every method, path and build fact", before, completeState(build, c))
            }
        }
    }

    /** The stream close on the reader's normal way to its return. */
    private fun close(s: BlackThemeSite) = s.method.controlBody().indexOfFirst { it.controlRef() == "Ljava/io/FileInputStream;->close()V" }

    private fun dark(color: Int): Boolean {
        if ((color ushr 24) != 0xFF) return false
        return 0.2126 * ((color shr 16) and 0xFF) + 0.7152 * ((color shr 8) and 0xFF) + 0.0722 * (color and 0xFF) < 64
    }

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + hosts(build))
    private fun completeState(build: File, c: BytecodePatchContext) = (hosts(build).map { it.type } + listOf(BLACK_THEME, SETTINGS_STATUS))
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

    /** Every class with a method that parses theme text, and the owner of each String-to-int lookup the reader calls. */
    private fun loadHosts(build: File): List<ClassDef> {
        val parsers = FixtureDex.classesWhere(build, { true }) { method -> method.controlBody().any { it.controlString() == "WLS=" } }
        val lookups = parsers.flatMap { it.methods }.filter { it.returnType == SPARSE_INT_ARRAY }.flatMap { it.controlBody() }
            .mapNotNull { it.controlCall() }.filter { it.returnType == "I" && it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;") }
            .map { it.definingClass }.filter { it.startsWith("Lorg/telegram/") }.toSet()
        return (parsers + FixtureDex.classes(build, lookups).values).associateBy { it.type }.values.map(ImmutableClassDef::of)
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
