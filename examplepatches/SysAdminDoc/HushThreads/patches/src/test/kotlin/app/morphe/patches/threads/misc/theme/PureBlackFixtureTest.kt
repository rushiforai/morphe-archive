/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.theme

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Pure black dark mode on each declared build: Threads' theme loads #101010 for dark mode, its
 * dark color scheme passes #101010 where the light one passes white, each of those asks the
 * extension first, and the light scheme and the rest of both methods stay as Threads wrote them.
 */
class PureBlackFixtureTest {
    private val argb = "$PURE_BLACK->argb(J)J"
    private val color = "$PURE_BLACK->color(J)J"

    @Test
    fun `the extension answers with a color for a color`() {
        for (name in listOf("argb", "color")) {
            val method = ExtensionDex.classDef(PURE_BLACK).methods.single { it.name == name }
            assertTrue(name, AccessFlags.STATIC.isSet(method.accessFlags) && AccessFlags.PUBLIC.isSet(method.accessFlags))
            assertEquals(name, listOf("J"), method.parameterTypes.map { it.toString() })
            assertEquals(name, "J", method.returnType)
        }
    }

    @Test
    fun `every declared build loads the dark gray in its theme and passes it to its dark scheme as a background`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            // 450 moved the theme's dark literals into a helper it calls; 448 and 449 load them in the theme.
            val loaders = fixture.builders.filter { it.darkLoads().isNotEmpty() }.map { it.signature() }
            if (build.name.startsWith("threads-450.")) {
                assertEquals(build.name, 1, loaders.size)
                assertTrue(build.name, loaders.single() in fixture.helpers.map { it.signature() })
            } else {
                assertEquals(build.name, listOf(fixture.theme.signature()), loaders)
            }
            val scheme = context(fixture).darkScheme(fixture.theme)
            assertEquals(build.name, fixture.holder, scheme.holder)
            // Threads 448 and 449 each pass the gray twice: the screen's background and the feed's.
            assertEquals(build.name, 2, scheme.registers.size)
            val body = scheme.initializer.body()
            val calls = body.indices.filter { body[it].isSchemeCall(fixture.scheme) }
            assertEquals(build.name, 2, calls.size)
            // The light scheme passes the gray too, as a dark color on light backgrounds. It isn't touched.
            val light = calls.single { it != scheme.call }
            val lightRange = (body[light] as RegisterRangeInstruction).let { it.startRegister until it.startRegister + it.registerCount }
            assertTrue(build.name, body.take(light).any { it.isWide(THREADS_DARK) })
            assertTrue(build.name, scheme.registers.none { it in lightRange })
            val darkRange = (body[scheme.call] as RegisterRangeInstruction).let { it.startRegister until it.startRegister + it.registerCount }
            assertTrue(build.name, scheme.registers.all { it in darkRange && it + 1 in darkRange })
        }
    }

    @Test
    fun `each dark load and each dark background asks the extension, and nothing else changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val context = context(fixture)
            val scheme = context.darkScheme(fixture.theme)
            pureBlackPatch.execute(context)

            for (builder in fixture.builders) {
                val label = "${build.name} ${builder.signature()}"
                val loads = builder.darkLoads()
                val before = builder.body()
                val after = context.method(builder)
                fun moved(index: Int) = index + 2 * loads.count { it < index }
                assertEquals(label, before.size + 2 * loads.size, after.size)
                for (load in loads) {
                    val register = (before[load] as OneRegisterInstruction).registerA
                    assertTrue(label, after[moved(load)].isWide(THREADS_DARK))
                    after[moved(load) + 1].assertAsks(label, argb, register)
                }
                val hooks = loads.flatMap { listOf(moved(it) + 1, moved(it) + 2) }.toSet()
                assertEquals(label, before.map { it.opcode }, after.filterIndexed { i, _ -> i !in hooks }.map { it.opcode })
            }

            val initializer = scheme.initializer.body()
            val patched = context.method(scheme.initializer)
            assertEquals(build.name, initializer.size + 2 * scheme.registers.size, patched.size)
            assertEquals(build.name, initializer.take(scheme.call).map { it.opcode }, patched.take(scheme.call).map { it.opcode })
            scheme.registers.forEachIndexed { n, register ->
                patched[scheme.call + 2 * n].assertAsks(build.name, color, register)
            }
            val call = patched[scheme.call + 2 * scheme.registers.size]
            assertEquals(build.name, initializer[scheme.call].reference(), call.reference())
            assertEquals(build.name, initializer.drop(scheme.call).map { it.opcode },
                patched.drop(scheme.call + 2 * scheme.registers.size).map { it.opcode })
            assertEquals(build.name, 1, status(context))
        }
    }

    @Test
    fun `a theme with no dark gray is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val context = context(fixture)
            for (builder in fixture.builders) {
                val method = context.mutableMethod(builder)
                for (load in builder.darkLoads()) {
                    method.replaceInstruction(load, "const-wide v${(method.body()[load] as OneRegisterInstruction).registerA}, 0xff121212L")
                }
            }
            val error = assertThrows(build.name, PatchException::class.java) { pureBlackPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("no longer loads #101010"))
        }
    }

    @Test
    fun `a dark scheme with no dark gray where the light one is white is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val context = context(fixture)
            val initializer = context.mutableMethod(context.darkScheme(fixture.theme).initializer)
            initializer.body().withIndex().filter { it.value.isWide(THREADS_DARK) }.forEach { (index, load) ->
                initializer.replaceInstruction(index, "const-wide v${(load as OneRegisterInstruction).registerA}, 0xff121212L")
            }
            val error = assertThrows(build.name, PatchException::class.java) { pureBlackPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("has no #101010 where its light one has white"))
        }
    }

    @Test
    fun `a dark background read again after the dark scheme is built is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val context = context(fixture)
            val scheme = context.darkScheme(fixture.theme)
            val register = scheme.registers.first()
            context.mutableMethod(scheme.initializer).addInstructions(scheme.call + 1, "move-wide/from16 v0, v$register")
            val error = assertThrows(build.name, PatchException::class.java) { pureBlackPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("reads v$register again after building its dark scheme"))
        }
    }

    @Test
    fun `a theme that reads one scheme for both modes is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val context = context(fixture)
            val theme = context.mutableMethod(fixture.theme)
            val reads = theme.body().withIndex().filter { (_, it) ->
                it.opcode == Opcode.SGET_OBJECT && it.getReference<FieldReference>()?.type == fixture.scheme
            }
            val dark = reads.first().value.getReference<FieldReference>()!!
            for ((index, read) in reads) {
                theme.replaceInstruction(index, "sget-object v${(read as OneRegisterInstruction).registerA}, $dark")
            }
            val error = assertThrows(build.name, PatchException::class.java) { pureBlackPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("the class holding Threads' dark and light color schemes"))
        }
    }

    @Test
    fun `before the patch runs, nothing asks and the status says it isn't in`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val context = context(fixture)
            val scheme = context.darkScheme(fixture.theme)
            for (method in fixture.builders + scheme.initializer) {
                assertFalse(build.name, context.method(method).any {
                    (it as? ReferenceInstruction)?.reference?.toString()?.startsWith(PURE_BLACK) == true
                })
            }
            assertEquals(build.name, 0, status(context))
        }
    }

    private data class Fixture(
        val classes: Collection<ClassDef>,
        val theme: Method,
        val helpers: List<Method>,
        val holder: String,
        val scheme: String,
    ) {
        /** The theme and the helpers it builds its colors in. */
        val builders get() = listOf(theme) + helpers
    }

    private fun fixture(build: File): Fixture = fixtures.getOrPut(build) {
        val themeClasses = FixtureDex.classesWhere(build, { true }) { it.holdsNote(BDS_THEME) }
        val theme = themeClasses.flatMap { it.methods }.single { it.holdsNote(BDS_THEME) }
        val helperReferences = theme.themeHelpers()
        val helperClasses = FixtureDex.classes(build, helperReferences.map { it.definingClass }.toSet())
        val helpers = helperReferences.mapNotNull { reference ->
            helperClasses[reference.definingClass]?.methods?.single { it.signature() == reference.toString() }
        }
        // Every class the theme reads a static field of, and every type it reads: the scheme
        // holder and the scheme among them, and the others the patch has to tell apart from them.
        val fields = theme.body().filter { it.opcode == Opcode.SGET_OBJECT }.mapNotNull { it.getReference<FieldReference>() }
        val types = fields.flatMap { listOf(it.definingClass, it.type) }.filter { it.startsWith("L") }.toSet()
        val read = FixtureDex.classes(build, types)
        val scheme = fields.map { it.type }.distinct().single { type ->
            read[type]?.methods?.any { m -> m.name == "<init>" && m.parameterTypes.size >= 20 && m.parameterTypes.all { it.toString() == "J" } } == true
        }
        val holder = fields.filter { it.type == scheme }.map { it.definingClass }.distinct().single()
        Fixture((themeClasses + read.values + helperClasses.values).distinctBy { it.type }, theme, helpers, holder, scheme)
    }

    private fun Method.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    private fun context(fixture: Fixture) = PatchContexts.of(ExtensionDex.classes() + fixture.classes)

    private fun Instruction.assertAsks(label: String, method: String, register: Int) {
        val hook = this as RegisterRangeInstruction
        assertEquals(label, method, (hook as ReferenceInstruction).reference.toString())
        assertEquals(label, register, hook.startRegister)
        assertEquals(label, 2, hook.registerCount)
    }

    private fun Instruction.isWide(value: Long) = this is WideLiteralInstruction && wideLiteral == value && opcode in
        setOf(Opcode.CONST_WIDE, Opcode.CONST_WIDE_32, Opcode.CONST_WIDE_16, Opcode.CONST_WIDE_HIGH16)

    private fun Instruction.isSchemeCall(scheme: String) = opcode == Opcode.INVOKE_DIRECT_RANGE &&
        getReference<MethodReference>()?.let { it.definingClass == scheme && it.name == "<init>" } == true

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private fun Instruction.reference() = getReference<MethodReference>()?.toString()

    private fun BytecodePatchContext.mutableMethod(method: Method) = mutableClassDefBy(method.definingClass).methods.single {
        it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
    }

    private fun BytecodePatchContext.method(method: Method): List<Instruction> = mutableMethod(method).body()

    private fun status(context: BytecodePatchContext) = (context.mutableClassDefBy(SETTINGS_STATUS).methods
        .single { it.name == "pureBlack" }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral

    private companion object {
        /** One read of each build serves every test; each test patches its own copy. */
        val fixtures = mutableMapOf<File, Fixture>()
    }
}
