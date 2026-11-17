/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.theme

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.origRef
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.ControlFlow
import app.morphe.util.call
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
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

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
            val lists = context.resolveListBackground(site.method)
            val fade = context.resolveBarFade()
            val hooked = setOf(reader, wallpaper, key(lists.refresh), key(lists.colors), key(lists.holders), key(fade.draw))
            val untouched = hostState(build, context, hooked)
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
            assertEquals("$name: every caller and every other host method", untouched, hostState(build, context, hooked))

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
            val stub = context.tgMutableClassDefBy(BLACK_THEME).methods.single { it.origName == "keyId" }.controlBody()
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.RETURN), stub.map { it.opcode })
            assertEquals(site.keyLookup.toString(), stub[0].controlRef())
            assertTrue("$name: the lookup is the one before the color put", before.indices.any { i ->
                before[i].controlRef() == SPARSE_PUT && before.subList(maxOf(0, i - 4), i).any { it.call()?.toString() == site.keyLookup.toString() } })
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "amoledBlack" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `the picture behind the lists hooks the color refresh, getColor and the page holders`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val site = context.resolveBlackTheme()
            val lists = context.resolveListBackground(site.method)
            val refresh = ImmutableMethod.of(lists.refresh)
            val colors = ImmutableMethod.of(lists.colors)
            val holders = ImmutableMethod.of(lists.holders)
            val fade = context.resolveBarFade()
            val draw = ImmutableMethod.of(fade.draw)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { amoledBlackPatch.execute(context) })

            // The bar fade's plain color goes through the extension with the fade, before anything reads it.
            val stockDraw = draw.controlBody()
            val drawn = fade.draw.controlBody()
            val f = fade.at
            assertEquals("$name: two instructions after the color read", stockDraw.size + 2, drawn.size)
            assertEquals(Opcode.IGET, stockDraw[f - 1].opcode)
            assertEquals("$name: the color is an int of the source the fade checked for", "I", stockDraw[f - 1].controlField()!!.type)
            assertEquals((stockDraw.first { it.opcode == Opcode.INSTANCE_OF } as ReferenceInstruction).reference.toString(),
                stockDraw[f - 1].controlField()!!.definingClass)
            assertEquals(listOf(fade.color), stockDraw[f - 1].namedRegisters().take(1))
            assertEquals(Opcode.INVOKE_STATIC, drawn[f].opcode)
            assertEquals("$LIST_BACKGROUND->fade(Ljava/lang/Object;I)I", drawn[f].controlRef())
            assertEquals("$name: the fade, then its color", listOf(draw.implementation!!.registerCount - 2, fade.color), drawn[f].namedRegisters())
            assertEquals(Opcode.MOVE_RESULT, drawn[f + 1].opcode)
            assertEquals(listOf(fade.color), drawn[f + 1].namedRegisters())
            assertEquals("$name: stock draw", stockDraw.map { it.operand() }, (drawn.take(f) + drawn.drop(f + 2)).map { it.operand() })
            val builder = stockDraw.drop(f).first { it.opcode == Opcode.INVOKE_STATIC }
            assertEquals("$name: the gradient is built from the answer", "Landroid/graphics/LinearGradient;", builder.call()!!.returnType)
            assertEquals(fade.color, builder.namedRegisters().first())
            val d0 = ControlFlow.of(draw)
            assertTrue("$name: only the color read reaches the hook", d0.normal.withIndex().none { (i, next) -> i != f - 1 && f in next })

            // The colors in use are worked out after the extension has had the theme's own set.
            val refreshed = lists.refresh.controlBody()
            assertEquals("$name: one call in front", refresh.controlBody().size + 1, refreshed.size)
            assertEquals(Opcode.INVOKE_STATIC, refreshed[0].opcode)
            assertEquals("$LIST_BACKGROUND->refreshing()V", refreshed[0].controlRef())
            assertEquals("$name: stock refresh", refresh.controlBody().map { it.operand() }, refreshed.drop(1).map { it.operand() })
            assertEquals("$name: it reads the set the reader's result goes in", lists.table.toString(), refreshed[1].controlRef())

            // The holders are handed over once they're made, on every way to the end.
            val stock = holders.controlBody()
            val made = lists.holders.controlBody()
            val at = lists.holderReturn
            assertEquals("$name: one call before the return", stock.size + 1, made.size)
            assertEquals(Opcode.INVOKE_STATIC, made[at].opcode)
            assertEquals("$LIST_BACKGROUND->laidOut(Ljava/lang/Object;)V", made[at].controlRef())
            assertEquals("$name: this", listOf(holders.implementation!!.registerCount - 2), made[at].namedRegisters())
            assertEquals(Opcode.RETURN_VOID, made[at + 1].opcode)
            val a0 = ControlFlow.of(holders)
            val b0 = ControlFlow.of(lists.holders)
            fun from(i: Int) = if (i < at) i else i + 1
            fun to(i: Int) = if (i <= at) i else i + 1
            for (i in stock.indices) {
                assertEquals("$name: stock operand $i", stock[i].operand(), made[from(i)].operand())
                assertEquals("$name: stock normal path $i", a0.normal[i].map(::to), b0.normal[from(i)])
            }
            assertTrue("$name: a branch reaches the hook", (0 until at).any { at in b0.normal[it] && it != at - 1 })

            // getColor's answer from the colors in use goes through the extension with its key, and nothing else changes.
            val stockColors = colors.controlBody()
            val answered = lists.colors.controlBody()
            val ret = lists.colorReturn
            assertEquals("$name: two instructions before the return", stockColors.size + 2, answered.size)
            assertEquals(Opcode.INVOKE_STATIC, answered[ret].opcode)
            assertEquals("$LIST_BACKGROUND->mark(II)I", answered[ret].controlRef())
            assertEquals("$name: the key, then the answer", listOf(lists.colorKey, lists.colorResult), answered[ret].namedRegisters())
            assertEquals(Opcode.MOVE_RESULT, answered[ret + 1].opcode)
            assertEquals(listOf(lists.colorResult), answered[ret + 1].namedRegisters())
            assertEquals(Opcode.RETURN, answered[ret + 2].opcode)
            assertEquals(listOf(lists.colorResult), answered[ret + 2].namedRegisters())
            assertEquals("$name: stock getColor", stockColors.map { it.operand() },
                (answered.take(ret) + answered.drop(ret + 2)).map { it.operand() })
            // Read from the stock code: the lookup about the colors in use, asked with getColor's own key.
            val inUse = stockColors[ret - 3]
            val asked = stockColors[ret - 2]
            assertEquals(Opcode.SGET_OBJECT, inUse.opcode)
            assertEquals("$name: the colors in use, then the key", listOf(inUse.namedRegisters().single(), lists.colorKey),
                asked.namedRegisters().take(2))
            assertEquals(listOf(SPARSE_INT_ARRAY, "I", "[Z"), asked.call()!!.parameterTypes.map { it.toString() })
            assertEquals(listOf(lists.colorResult), stockColors[ret - 1].namedRegisters())
            assertNotEquals("$name: not the theme's own set", lists.table.toString(), inUse.controlRef())
            assertTrue("$name: the refresh writes the colors in use", refresh.controlBody()
                .any { it.opcode == Opcode.SPUT_OBJECT && it.controlRef() == inUse.controlRef() })
            val parameters = colors.parameterTypes.map { it.toString() }
            assertEquals("$name: getColor's int parameter", colors.implementation!!.registerCount - parameters.size + parameters.indexOf("I"),
                lists.colorKey)
            val c0 = ControlFlow.of(colors)
            assertTrue("$name: only the lookup's answer reaches the return", c0.normal.withIndex().none { (i, next) -> i != ret - 1 && ret in next })

            // The stubs reach the refresh, the two page holders and the rebuild.
            fun stub(named: String) = context.tgMutableClassDefBy(LIST_BACKGROUND).methods.single { it.origName == named }.controlBody()
            val recolor = stub("recolor")
            assertEquals(listOf(0L, 1L), recolor.take(2).map { (it as WideLiteralInstruction).wideLiteral })
            assertEquals(key(lists.refresh), recolor[2].controlRef())
            val pages = stub("pages").filter { it.opcode == Opcode.IGET_OBJECT }.map { it.controlRef() }
            assertEquals(lists.pages.map { it.toString() }, pages)
            assertEquals("$name: the two page holders, not the sheet's", 2, pages.distinct().size)
            assertTrue("$name: holders are fields of the layout", lists.pages.all { it.definingClass == ACTION_BAR_LAYOUT })
            assertEquals(key(lists.rebuild), stub("rebuild").single { it.opcode == Opcode.INVOKE_VIRTUAL }.controlRef())
            assertTrue("$name: the rebuild clears each screen", lists.rebuild.controlBody().any { it.call()?.name == "clearViews" })
            for (flag in listOf("amoledBlack", "listBackground")) {
                val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.controlBody()
                assertEquals("$name: $flag", 1L, (status.first() as WideLiteralInstruction).wideLiteral)
            }
        }
    }

    @Test fun `a build without the list targets keeps black themes and goes on without the picture`() {
        for (build in Fixtures.declaredBuilds()) {
            val mutations: List<Pair<String, (BytecodePatchContext, ListBackgroundSite) -> Unit>> = listOf(
                "rebuild turned static" to { c, s -> c.tgMutableClassDefBy(ACTION_BAR_LAYOUT).methods.single { it.name == s.rebuild.name &&
                    it.parameterTypes.map { p -> p.toString() } == listOf("Z", "Z") }.let { it.accessFlags = it.accessFlags or AccessFlags.STATIC.value } },
                "holders made another way" to { _, s -> s.holders.replaceInstruction(s.holders.controlBody().indexOfFirst {
                    it.opcode == Opcode.IPUT_OBJECT && it.controlField()?.toString() == s.pages[1].toString() }, "nop") },
                "refresh no longer copies the theme's set" to { _, s -> s.refresh.replaceInstruction(1, "nop") },
                "getColor answers another way" to { _, s -> s.colors.replaceInstruction(s.colorReturn - 2, "nop") },
                "missing build flag" to { c, _ -> c.tgMutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.origName == "listBackground" } },
                "missing pages stub" to { c, _ -> c.tgMutableClassDefBy(LIST_BACKGROUND).methods.removeAll { it.origName == "pages" } },
            )
            for ((case, change) in mutations) {
                val c = context(build)
                val site = c.resolveBlackTheme()
                val lists = c.resolveListBackground(site.method)
                change(c, lists)
                val refresh = ImmutableMethod.of(lists.refresh).state()
                val holders = ImmutableMethod.of(lists.holders).state()
                val colors = ImmutableMethod.of(lists.colors).state()
                val warnings = PatchLogCapture.warnings { amoledBlackPatch.execute(c) }
                assertEquals("${build.name}: $case warns once", 1, warnings.size)
                assertTrue("${build.name}: $case names what's missing: $warnings", warnings.single().startsWith("AMOLED black: ") &&
                    warnings.single().endsWith("The patch goes on without the picture behind the lists."))
                assertEquals("${build.name}: $case leaves the refresh", refresh, lists.refresh.state())
                assertEquals("${build.name}: $case leaves the holders", holders, lists.holders.state())
                assertEquals("${build.name}: $case leaves getColor", colors, lists.colors.state())
                val status = c.tgMutableClassDefBy(SETTINGS_STATUS).methods
                assertEquals("${build.name}: $case keeps black themes", 1L,
                    (status.single { it.origName == "amoledBlack" }.controlBody().first() as WideLiteralInstruction).wideLiteral)
                status.singleOrNull { it.origName == "listBackground" }?.let {
                    assertEquals("${build.name}: $case leaves the picture off", 0L, (it.controlBody().first() as WideLiteralInstruction).wideLiteral)
                }
            }
        }
    }

    @Test fun `a build without the bar fade still shows the picture and says so`() {
        for (build in Fixtures.declaredBuilds()) {
            val mutations: List<Pair<String, (BytecodePatchContext, BarFadeSite) -> Unit>> = listOf(
                "fade reads its color another way" to { _, s -> s.draw.replaceInstruction(s.at - 1, "const/4 v${s.color}, 0x0") },
                "missing fade hook" to { c, _ -> c.tgMutableClassDefBy(LIST_BACKGROUND).methods.removeAll { it.origName == "fade" } },
            )
            for ((case, change) in mutations) {
                val c = context(build)
                val site = c.resolveBlackTheme()
                val lists = c.resolveListBackground(site.method)
                val fade = c.resolveBarFade()
                change(c, fade)
                val draw = ImmutableMethod.of(fade.draw).state()
                val refresh = ImmutableMethod.of(lists.refresh).controlBody().size
                val warnings = PatchLogCapture.warnings { amoledBlackPatch.execute(c) }
                assertEquals("${build.name}: $case warns once", 1, warnings.size)
                assertTrue("${build.name}: $case names what's missing: $warnings", warnings.single().startsWith("AMOLED black: ") &&
                    warnings.single().endsWith("The picture behind the lists shows with Telegram's bar fades."))
                assertEquals("${build.name}: $case leaves the fade", draw, fade.draw.state())
                assertEquals("${build.name}: $case still hooks the refresh", refresh + 1, lists.refresh.controlBody().size)
                val status = c.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "listBackground" }
                assertEquals("${build.name}: $case keeps the picture", 1L, (status.controlBody().first() as WideLiteralInstruction).wideLiteral)
            }
        }
    }

    @Test fun `Night and Dark carry every surface and the light themes stay light`() {
        val surfaces = ExtensionDex.classes().single { it.origType == BLACK_THEME }.methods.single { it.origName == "<clinit>" }
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
            val reader = hosts(build).flatMap { it.methods }.single { it.origReturnType == SPARSE_INT_ARRAY &&
                it.parameterTypes.map { p -> p.toString() } == THEME_FILE_PARAMETERS && it.controlBody().any { i -> i.controlString() == "WLS=" } }
            val named = hosts(build).single { it.origType == reader.origDefiningClass }.methods.flatMap { m -> m.controlBody().mapNotNull { it.controlString() } }
            assertTrue("${build.name}: Telegram's theme class names both dark assets", "night.attheme" in named && "darkblue.attheme" in named)
        }
    }

    @Test fun `a changed reader or runtime refuses before any method changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val mutations: List<Pair<String, (BytecodePatchContext, BlackThemeSite) -> Unit>> = listOf(
                "reader no longer static" to { _, s -> s.method.accessFlags = s.method.accessFlags and AccessFlags.STATIC.value.inv() },
                "asset no longer opened" to { _, s -> s.method.replaceInstruction(s.method.controlBody().indexOfFirst { i ->
                    i.call()?.let { it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;") && it.origReturnType == "Ljava/io/File;" } == true }, "nop") },
                "keys go in without the lookup" to { _, s -> s.method.replaceInstruction(s.method.controlBody().indexOfFirst {
                    it.call()?.toString() == s.keyLookup.toString() }, "nop") },
                "reader returns another set" to { _, s -> s.method.replaceInstruction(s.returns.single(), "return-object v${(s.colors + 1) % 16}") },
                "set swapped on the way out" to { _, s -> s.method.replaceInstruction(close(s), "move-object v${s.colors}, v${(s.colors + 1) % 16}") },
                "asset parameter overwritten" to { _, s -> s.method.replaceInstruction(close(s),
                    "move-object/from16 v${s.method.implementation!!.registerCount - 2}, v${s.colors}") },
                "lookup no longer public" to { c, s -> val m = c.tgMutableClassDefBy(s.keyLookup.definingClass).methods.single {
                    it.origName == s.keyLookup.origName && it.origReturnType == "I" && it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;") }
                    m.accessFlags = m.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "missing build flag" to { c, _ -> c.tgMutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.origName == "amoledBlack" } },
                "private loaded hook" to { c, _ -> val h = c.tgMutableClassDefBy(BLACK_THEME).methods.single { it.origName == "loaded" }
                    h.accessFlags = h.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "missing keyId stub" to { c, _ -> c.tgMutableClassDefBy(BLACK_THEME).methods.removeAll { it.origName == "keyId" } },
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
    private fun completeState(build: File, c: BytecodePatchContext) = (hosts(build).map { it.type } + listOf(BLACK_THEME, LIST_BACKGROUND, SETTINGS_STATUS))
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

    /**
     * Every class with a method that parses theme text, the owner of each String-to-int lookup the
     * reader calls, the page layout with the classes its holder setup makes, and the bar fade.
     */
    private fun loadHosts(build: File): List<ClassDef> {
        fun Instruction.fadeStep() = opcode == Opcode.DIV_INT_LIT16 && (this as WideLiteralInstruction).wideLiteral == 285L
        val found = FixtureDex.classesWhere(build, { true }) { method ->
            method.controlBody().any { it.controlString() == "WLS=" || it.fadeStep() }
        }
        val fades = found.filter { cls -> cls.methods.any { m -> m.controlBody().any { it.fadeStep() } } }
        val parsers = found - fades.toSet()
        val lookups = parsers.flatMap { it.methods }.filter { it.origReturnType == SPARSE_INT_ARRAY }.flatMap { it.controlBody() }
            .mapNotNull { it.call() }.filter { it.origReturnType == "I" && it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;") }
            .map { it.definingClass }.filter { it.startsWith("Lorg/telegram/") }.toSet()
        val layout = FixtureDex.classes(build, setOf(ACTION_BAR_LAYOUT)).values
        val holders = layout.flatMap { it.methods }.filter { it.name == "setFragmentStack" }.flatMap { it.controlBody() }
            .filter { it.opcode == Opcode.NEW_INSTANCE }.map { (it as ReferenceInstruction).reference.toString() }
            .filter { it.startsWith("Lorg/telegram/") }.toSet()
        return (parsers + FixtureDex.classes(build, lookups).values + layout + FixtureDex.classes(build, holders).values + fades)
            .associateBy { it.type }.values.map(ImmutableClassDef::of)
    }

    private fun Method.state(): List<Any?> {
        val body = controlBody(); val flow = if (body.isEmpty()) null else ControlFlow.of(this)
        return listOf(accessFlags, implementation?.registerCount, body.map { it.operand() }, body.map { listOf(it.codeUnits, (it as? OffsetInstruction)?.codeOffset) },
            flow?.normal?.toList(), flow?.exceptional?.toList())
    }
    private fun Instruction.operand() = listOf(opcode, namedRegisters(), origRef(),
        (this as? WideLiteralInstruction)?.wideLiteral)
    private fun key(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"

    companion object {
        private val HOSTS = mutableMapOf<String, SoftReference<List<ClassDef>>>()
        @AfterClass @JvmStatic fun releaseFixtures() { HOSTS.clear() }
    }
}
