/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.fonts

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.origRef
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
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
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

/** AndroidUtilities, every class that names a bundled font file, and the runtime. */
class UseSystemFontFixtureTest {
    @Test fun `one hook at the start of the asset font loader and every stock path stays`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val site = context.resolveSystemFont()
            val loader = key(site.method)
            val old = ImmutableMethod.of(site.method)
            val builders = site.built.map { key(it.method) }.toSet()
            val oldBuilders = site.built.associate { key(it.method) to ImmutableMethod.of(it.method) }
            val untouched = hostState(build, context, setOf(loader) + builders)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { useSystemFontPatch.execute(context) })
            assertWalletBuilders(name, site.built, oldBuilders)

            val before = old.controlBody()
            val after = site.method.controlBody()
            assertEquals("$name: register count", old.implementation!!.registerCount, site.method.implementation!!.registerCount)
            assertEquals("$name: four instructions", before.size + 4, after.size)
            assertEquals("$name: the path is the only parameter", old.implementation!!.registerCount - 1, site.asset)
            assertEquals(Opcode.INVOKE_STATIC_RANGE, after[0].opcode)
            assertEquals("$SYSTEM_FONT->typeface(Ljava/lang/String;)Landroid/graphics/Typeface;", after[0].controlRef())
            assertEquals(listOf(site.asset), after[0].namedRegisters())
            val result = after[1].namedRegisters().single()
            assertEquals(Opcode.MOVE_RESULT_OBJECT, after[1].opcode)
            assertEquals(Opcode.IF_EQZ, after[2].opcode)
            assertEquals(listOf(result), after[2].namedRegisters())
            assertEquals(Opcode.RETURN_OBJECT, after[3].opcode)
            assertEquals(listOf(result), after[3].namedRegisters())
            assertTrue("$name: the answer lands in a local Telegram writes before reading", result < site.asset &&
                before.first().opcode == Opcode.CONST_STRING && before.first().namedRegisters() == listOf(result))

            val a = ControlFlow.of(old)
            val b = ControlFlow.of(site.method)
            assertEquals("$name: no answer falls through to Telegram's loader", listOf(3, 4), b.normal[2].sorted())
            assertEquals("$name: an answer returns at once", emptyList<Int>(), b.normal[3])
            for (i in before.indices) {
                assertEquals("$name: stock operand $i", before[i].operand(), after[i + 4].operand())
                assertEquals("$name: stock normal path $i", a.normal[i].map { it + 4 }, b.normal[i + 4])
                assertEquals("$name: stock exceptional path $i", a.exceptional[i].map { it + 4 }, b.exceptional[i + 4])
            }
            assertTrue("$name: nothing jumps into the hook", (0 until b.normal.size).filter { it != 0 && it != 1 && it != 2 }
                .none { from -> b.normal[from].any { it in 1..3 } })
            assertEquals("$name: every caller and every other host method", untouched, hostState(build, context, setOf(loader) + builders))
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "useSystemFont" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `every Roboto file is still bundled and the faces left alone are the known ones`() {
        for (build in Fixtures.declaredBuilds()) {
            val named = hosts(build).flatMap { it.methods }.flatMap { m -> m.controlBody().mapNotNull { it.controlString() } }
                .filter { it.startsWith("fonts/") && (it.endsWith(".ttf") || it.endsWith(".otf")) }.toSet()
            assertEquals("${build.name}: the switch's files", ROBOTO_ASSETS, named.intersect(ROBOTO_ASSETS))
            // Telegram 13.0's Wallet builds a variable Roboto Mono straight from its assets, which
            // the switch follows too. Its Gram face carries the Gram currency sign no phone font
            // has, so it stays as bundled, like the digits face.
            assertEquals("${build.name}: Wallet's own builds", BUILT_ASSETS, named.intersect(BUILT_ASSETS))
            assertEquals("${build.name}: digits, Instant View and the Gram sign keep Telegram's files", setOf("fonts/num.otf",
                "fonts/mw_bold.ttf", "fonts/mw_bolditalic.ttf", "fonts/gram.ttf"), named - ROBOTO_ASSETS - BUILT_ASSETS)
            val built = context(build).resolveSystemFont().built
            assertEquals("${build.name}: Wallet's three builds", 3, built.size)
            assertEquals("${build.name}: one build per method", 3, built.map { key(it.method) }.toSet().size)
            // bold() is the medium face most of Telegram draws with.
            val bold = hosts(build).single { it.origType == ANDROID_UTILITIES }.methods.single { it.origName == "bold" && it.parameterTypes.isEmpty() }.controlBody()
            assertTrue("${build.name}: bold() loads the medium file through the loader", bold.any { it.controlString() == "fonts/rmedium.ttf" } &&
                bold.any { it.controlRef() == GET_TYPEFACE })
        }
    }

    @Test fun `a changed loader or runtime refuses before any method changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val mutations: List<Pair<String, (BytecodePatchContext, SystemFontSite) -> Unit>> = listOf(
                "loader stops caching" to { _, s -> s.method.replaceInstruction(index(s, CACHE_HAS), "nop") },
                "cache keyed by another value" to { _, s -> val at = index(s, CACHE_HAS)
                    s.method.replaceInstruction(at, "invoke-virtual {v${s.method.controlBody()[at].namedRegisters()[0]}, v0}, $CACHE_HAS") },
                "loader opens another file" to { _, s -> val at = index(s, BUILDER_FROM_ASSET); val r = s.method.controlBody()[at].namedRegisters()
                    s.method.replaceInstruction(at, "invoke-direct {v${r[0]}, v${r[1]}, v0}, $BUILDER_FROM_ASSET") },
                "loader no longer static" to { _, s -> s.method.accessFlags = s.method.accessFlags and AccessFlags.STATIC.value.inv() },
                "bold() loads its file elsewhere" to { c, _ -> val bold = c.tgMutableClassDefBy(ANDROID_UTILITIES).methods.single { it.origName == "bold" && it.parameterTypes.isEmpty() }
                    bold.replaceInstruction(bold.controlBody().indexOfFirst { it.controlRef() == GET_TYPEFACE }, "nop") },
                "missing build flag" to { c, _ -> c.tgMutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.origName == "useSystemFont" } },
                "private typeface hook" to { c, _ -> val h = c.tgMutableClassDefBy(SYSTEM_FONT).methods.single { it.origName == "typeface" }
                    h.accessFlags = h.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "empty typeface hook" to { c, _ -> val owner = c.tgMutableClassDefBy(SYSTEM_FONT); val h = owner.methods.single { it.origName == "typeface" }
                    owner.methods.remove(h)
                    owner.methods.add(ImmutableMethod(h.definingClass, h.name, h.parameters, h.returnType, h.accessFlags, h.annotations,
                        h.hiddenApiRestrictions, ImmutableMethodImplementation(1, emptyList(), emptyList(), emptyList())).toMutable()) },
                "missing built hook" to { c, _ -> c.tgMutableClassDefBy(SYSTEM_FONT).methods.removeAll { it.origName == "built" } },
                "Wallet font built elsewhere" to { _, s -> val b = s.built.first()
                    b.method.replaceInstruction(b.method.controlBody().indexOfFirst { it.controlRef() == BUILDER_FROM_ASSET }, "nop") },
                "Wallet builder runs other code" to { _, s -> val b = s.built.first()
                    b.method.replaceInstruction(b.result - 1, "nop") },
                "Wallet builder drops its face" to { _, s -> val b = s.built.first()
                    b.method.replaceInstruction(b.result, "nop") },
                // The weight constant before setWeight now lands in the path's register instead.
                "Wallet path overwritten" to { _, s -> val b = s.built.first()
                    assertEquals(Opcode.CONST_16, b.method.controlBody()[b.result - 4].opcode)
                    b.method.replaceInstruction(b.result - 4, "const/16 v${b.asset}, 0x1f4") },
                "Wallet builder jumped into" to { _, s -> val b = s.built.first()
                    b.method.addInstructionsWithLabels(0, "goto/32 :hush_built", ExternalLabel("hush_built", b.method.getInstruction(b.result - 1))) },
            )
            for ((case, change) in mutations) {
                val c = context(build)
                change(c, c.resolveSystemFont())
                val before = completeState(build, c)
                assertThrows("${build.name}: $case", PatchException::class.java) { useSystemFontPatch.execute(c) }
                assertEquals("${build.name}: $case preserves every method, path and build fact", before, completeState(build, c))
            }
        }
    }

    private fun index(s: SystemFontSite, ref: String) = s.method.controlBody().indexOfFirst { it.controlRef() == ref }

    /** Each Wallet build gains two instructions right after its face lands, with the path it was built from. */
    private fun assertWalletBuilders(name: String, sites: List<BuiltFontSite>, old: Map<String, Method>) {
        assertEquals("$name: Wallet's three builds", 3, sites.size)
        for (site in sites) {
            val where = "$name ${key(site.method)}"
            val original = old.getValue(key(site.method))
            val before = original.controlBody()
            val after = site.method.controlBody()
            val at = site.result + 1
            assertEquals("$where: two instructions", before.size + 2, after.size)
            assertEquals("$where: register count", original.implementation!!.registerCount, site.method.implementation!!.registerCount)
            assertEquals("$where: the face comes from build()", "$BUILDER->build()Landroid/graphics/Typeface;", before[site.result - 1].controlRef())
            val path = (0 until site.result).last { before[it].opcode.setsRegister() && before[it].namedRegisters().firstOrNull() == site.asset }
            assertEquals("$where: the path register holds Wallet's file", "fonts/rmono_var.ttf", before[path].controlString())
            assertEquals(Opcode.INVOKE_STATIC, after[at].opcode)
            assertEquals("$SYSTEM_FONT->built(Ljava/lang/String;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;", after[at].controlRef())
            assertEquals(listOf(site.asset, site.face), after[at].namedRegisters())
            assertEquals(Opcode.MOVE_RESULT_OBJECT, after[at + 1].opcode)
            assertEquals("$where: the answer replaces the face", listOf(site.face), after[at + 1].namedRegisters())
            val a = ControlFlow.of(original)
            val b = ControlFlow.of(site.method)
            fun moved(index: Int) = if (index > site.result) index + 2 else index
            for (i in before.indices) {
                assertEquals("$where: stock operand $i", before[i].operand(), after[moved(i)].operand())
                val normal = if (i == site.result) listOf(at) else a.normal[i].map(::moved)
                assertEquals("$where: stock normal path $i", normal, b.normal[moved(i)])
                assertEquals("$where: stock exceptional path $i", a.exceptional[i].map(::moved), b.exceptional[moved(i)])
            }
            assertEquals(listOf(at + 1), b.normal[at])
            assertEquals(listOf(at + 2), b.normal[at + 1])
        }
    }

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + hosts(build))
    private fun completeState(build: File, c: BytecodePatchContext) = (hosts(build).map { it.type } + listOf(SYSTEM_FONT, SETTINGS_STATUS))
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

    /** AndroidUtilities, and every class with a method that names a bundled font file. */
    private fun loadHosts(build: File): List<ClassDef> {
        val named = FixtureDex.classesWhere(build, { true }) { method -> method.controlBody().any { it.controlString()?.startsWith("fonts/") == true } }
        val utilities = FixtureDex.classes(build, setOf(ANDROID_UTILITIES)).values
        return (named + utilities).associateBy { it.type }.values.map(ImmutableClassDef::of)
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
        private const val CACHE_HAS = "Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z"
        private const val BUILDER = "Landroid/graphics/Typeface\$Builder;"
        private const val BUILDER_FROM_ASSET = "$BUILDER-><init>(Landroid/content/res/AssetManager;Ljava/lang/String;)V"
        private val HOSTS = mutableMapOf<String, SoftReference<List<ClassDef>>>()
        @AfterClass @JvmStatic fun releaseFixtures() { HOSTS.clear() }
    }
}
