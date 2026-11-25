/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.theme

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.PerBuild
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import app.morphe.patches.threads.misc.extension.SoLoaderInitFingerprint
import app.morphe.patches.threads.misc.extension.THREADS_APPLICATION
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.declaredInHierarchy
import app.morphe.util.getReference
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Custom font (#28) on each declared build: right after the extension gets its context in the
 * application's onCreate, the extension puts the picked font in Android's font table, and right
 * after each of the font repository's three loads, the typeface goes to the extension with what it
 * was loaded by, and the answer takes its place. Every read of Typeface.DEFAULT, SANS_SERIF and
 * DEFAULT_BOLD in Threads' code reads the extension's stand-in instead. The three loads and the
 * Compose resolver's two reads are read by hand on 512708508, apart from how the patch finds them.
 */
class CustomFontFixtureTest {
    @Test
    fun `each declared build hands every repository load to the extension`() {
        val extension = ExtensionDex.classDef(CUSTOM_FONT)
        for ((name, signature) in listOf(
            "assetFont" to "(Landroid/graphics/Typeface;Ljava/lang/String;)Landroid/graphics/Typeface;",
            "systemFont" to "(Landroid/graphics/Typeface;Ljava/lang/String;)Landroid/graphics/Typeface;",
            "resourceFont" to "(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;",
            "onThreadsStart" to "(Landroid/content/Context;)V",
        )) {
            val method = extension.methods.single { it.name == name }
            assertTrue(name, AccessFlags.STATIC.isSet(method.accessFlags) && AccessFlags.PUBLIC.isSet(method.accessFlags))
            assertEquals(name, signature, "(${method.parameterTypes.joinToString("")})${method.returnType}")
        }

        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val context = context(build)
            assertEquals(where, 0, status(context))
            val repository = repository(build)
            val loads = context.fontLoads(repository)
            assertEquals(where, listOf("assetFont", "systemFont", "resourceFont"), loads.map { it.hook.substringBefore('(') })
            val stock = repository.body()
            for (load in loads) {
                // What each load is loaded by, read from the call itself.
                val call = stock[load.call].getReference<MethodReference>()!!
                assertEquals(where, Opcode.MOVE_RESULT_OBJECT, stock[load.call + 1].opcode)
                assertEquals(where, load.result, (stock[load.call + 1] as OneRegisterInstruction).registerA)
                val argument = if (load.hook.startsWith("systemFont")) 0 else 1
                assertEquals(where, stock[load.call].namedRegisters()[argument], load.name)
                assertEquals(where, "Landroid/graphics/Typeface;", call.returnType)
            }

            BY_HAND[where.substringAfterLast('-').substringBefore('.')]?.let { expected ->
                assertEquals(where, expected, listOf(repository.toString()) +
                    loads.map { "${it.call}: v${it.result} from v${it.name}" })
            }

            val onCreate = context.declaredInHierarchy(THREADS_APPLICATION, "onCreate")
            val startBefore = onCreate.body()
            customFontPatch.execute(context)
            // Threads' text mostly asks Android for its fonts, so the start goes in right after the context.
            val start = onCreate.body()
            assertEquals(where, startBefore.size + 1, start.size)
            val setContext = start.indexOfFirst {
                it.getReference<MethodReference>()?.toString() == "Lapp/morphe/extension/shared/Utils;->setContext(Landroid/content/Context;)V"
            }
            assertTrue(where, setContext >= 0)
            val hook = start[setContext + 1]
            assertEquals(where, Opcode.INVOKE_STATIC_RANGE, hook.opcode)
            assertEquals(where, "$CUSTOM_FONT->onThreadsStart(Landroid/content/Context;)V", hook.getReference<MethodReference>().toString())
            // p0, the application itself.
            assertEquals(where, onCreate.implementation!!.registerCount - 1, (hook as RegisterRangeInstruction).startRegister)
            assertEquals(where, 1, hook.registerCount)
            assertEquals(where, startBefore.map { it.kind() }, start.filterIndexed { index, _ -> index != setContext + 1 }.map { it.kind() })
            val patched = context.mutableClassDefBy(repository.definingClass).methods.single { it.same(repository) }.body()
            assertEquals(where, stock.size + 2 * loads.size, patched.size)
            // Each hook lands right after its load's move-result, shifted by the hooks above it.
            loads.sortedBy { it.call }.forEachIndexed { above, load ->
                val at = load.call + 2 + 2 * above
                assertEquals(where, Opcode.INVOKE_STATIC, patched[at].opcode)
                assertEquals(where, "$CUSTOM_FONT->${load.hook}", patched[at].getReference<MethodReference>().toString())
                assertEquals(where, listOf(load.result, load.name), patched[at].namedRegisters())
                assertEquals(where, Opcode.MOVE_RESULT_OBJECT, patched[at + 1].opcode)
                assertEquals(where, load.result, (patched[at + 1] as OneRegisterInstruction).registerA)
            }
            // Threads' own code is all still there, in order.
            val hooks = loads.sortedBy { it.call }.mapIndexed { above, load -> load.call + 2 + 2 * above }
                .flatMap { listOf(it, it + 1) }.toSet()
            assertEquals(where, stock.map { it.kind() }, patched.indices.filter { it !in hooks }.map { patched[it].kind() })
            assertEquals(where, 1, status(context))
        }
    }

    @Test
    fun `a second asset load is refused before anything changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val repository = repository(build)
            val mutable = context.mutableClassDefBy(repository.definingClass).methods.single { it.same(repository) }
            val first = mutable.body().indexOfFirst {
                it.getReference<MethodReference>()?.name == "createFromAsset"
            }
            val loaded = (mutable.body()[first + 1] as OneRegisterInstruction).registerA
            val call = mutable.body()[first].namedRegisters()
            mutable.addInstructions(first, """
                invoke-static { v${call[0]}, v${call[1]} }, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;
                move-result-object v$loaded
            """)
            val before = mutable.body().size
            val error = assertThrows(build.name, PatchException::class.java) { customFontPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("loads 2 asset fonts, not 1"))
            assertEquals(build.name, before, mutable.body().size)
            assertEquals(build.name, 0, status(context))
        }
    }

    @Test
    fun `a resource load from a class that isn't ResourcesCompat is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val repository = repository(build)
            val loader = context.fontLoads(repository).single { it.hook.startsWith("resourceFont") }
            val owner = repository.body()[loader.call].getReference<MethodReference>()!!.definingClass
            // Without its message, nothing says the class loads font resources.
            context.mutableClassDefBy(owner).methods.forEach { method ->
                val strings = method.body().withIndex().filter {
                    it.value.getReference<StringReference>()?.string?.startsWith(FONT_RESOURCE) == true
                }
                strings.forEach { (index, instruction) ->
                    method.implementation!!.replaceInstruction(index,
                        com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c(
                            Opcode.CONST_STRING, (instruction as OneRegisterInstruction).registerA,
                            com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference("other"),
                        ))
                }
            }
            val error = assertThrows(build.name, PatchException::class.java) { customFontPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("loads 0 resource fonts, not 1"))
            assertEquals(build.name, 0, status(context))
        }
    }

    @Test
    fun `an application that never gets the context is refused before anything changes`() {
        for (build in Fixtures.declaredBuilds()) {
            // The extension patch never ran, so onCreate has no context call to follow.
            val context = context(build, withContext = false)
            val repository = repository(build)
            val mutable = context.mutableClassDefBy(repository.definingClass).methods.single { it.same(repository) }
            val before = mutable.body().size
            val error = assertThrows(build.name, PatchException::class.java) { customFontPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("sets the extension's context 0 times, not once"))
            assertEquals(build.name, before, mutable.body().size)
            assertEquals(build.name, 0, status(context))
        }
    }

    @Test
    fun `each declared build reads the extension's fonts wherever it read Android's default`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val context = context(build)
            // Every read in Threads' classes, found here apart from the patch.
            val stock = mutableListOf<Pair<Method, List<Instruction>>>()
            context.classDefForEach { classDef ->
                if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
                classDef.methods.map { it to it.body() }.filterTo(stock) { (_, body) -> body.any { it.androidDefault() != null } }
            }
            assertTrue(where, stock.isNotEmpty())

            BY_HAND_DEFAULTS[where.substringAfterLast('-').substringBefore('.')]?.let { (method, reads) ->
                val body = stock.single { (found, _) -> found.toString() == method }.second
                assertEquals(where, reads, body.withIndex().filter { it.value.androidDefault() != null }
                    .map { (index, read) -> "$index: v${(read as OneRegisterInstruction).registerA} ${read.androidDefault()}" })
            }

            customFontPatch.execute(context)

            var swapped = 0
            for ((method, before) in stock) {
                val after = context.mutableClassDefBy(method.definingClass).methods.single { it.same(method) }.body()
                assertEquals("$where $method", before.map { it.kind() }, after.map { it.kind() })
                for (index in before.indices) {
                    val android = before[index].androidDefault() ?: continue
                    val read = after[index].getReference<FieldReference>().toString()
                    assertEquals("$where $method @$index", "$CUSTOM_FONT->${STAND_INS[android]}:Landroid/graphics/Typeface;", read)
                    assertEquals("$where $method @$index", (before[index] as OneRegisterInstruction).registerA,
                        (after[index] as OneRegisterInstruction).registerA)
                    swapped++
                }
                assertTrue("$where $method", after.none { it.androidDefault() != null })
            }
            assertTrue(where, swapped >= stock.size)
            // The extension keeps Android's own as its starting point.
            val own = context.mutableClassDefBy(CUSTOM_FONT).methods.single { it.name == "<clinit>" }.body()
            assertEquals(where, 3, own.count { it.androidDefault() != null })
            assertEquals(where, 1, status(context))
        }

        val extension = ExtensionDex.classDef(CUSTOM_FONT)
        for (name in STAND_INS.values) {
            val field = extension.fields.single { it.name == name }
            assertTrue(name, AccessFlags.STATIC.isSet(field.accessFlags) && AccessFlags.PUBLIC.isSet(field.accessFlags))
            assertEquals(name, "Landroid/graphics/Typeface;", field.type)
        }
    }

    private fun repository(build: File): Method = fixture(build).classes.flatMap { it.methods }.single { method ->
        method.returnType == "Landroid/graphics/Typeface;" && method.parameterTypes.size == 1 &&
            method.body().any { it.string() == LOAD_TYPEFACE }
    }

    private class Fixture(val classes: List<ClassDef>, val application: List<ClassDef>)

    /**
     * The repository's class and ResourcesCompat, each found by its own string, and every class
     * that reads one of Android's default fonts, read once per build.
     */
    private fun fixture(build: File): Fixture = fixtures.getOrPut(build) {
        val wanted = { method: Method ->
            method.body().any { instruction ->
                instruction.androidDefault() != null ||
                    instruction.string()?.let { it.startsWith(LOAD_TYPEFACE) || it.startsWith(FONT_RESOURCE) } == true
            }
        }
        Fixture(FixtureDex.classesWhere(build, { true }, wanted).distinctBy { it.type }, applicationChain(build))
    }

    /** The application and its parents in the APK, where the extension gets its context. */
    private fun applicationChain(build: File): List<ClassDef> {
        val chain = mutableListOf<ClassDef>()
        var type: String? = THREADS_APPLICATION
        while (type != null) {
            val found = FixtureDex.classes(build, setOf(type))[type] ?: break
            chain += found
            type = found.superclass
        }
        return chain
    }

    /** The build's classes, after the extension patch [withContext], as every patch sees them. */
    private fun context(build: File, withContext: Boolean = true): BytecodePatchContext {
        TypefaceRepositoryFingerprint.clearMatch()
        SoLoaderInitFingerprint.clearMatch()
        val fixture = fixture(build)
        val context = PatchContexts.of((ExtensionDex.classes() + fixture.classes + fixture.application).distinctBy { it.type })
        if (withContext) threadsExtensionPatch.execute(context)
        return context
    }

    private fun status(context: BytecodePatchContext) = (context.mutableClassDefBy(SETTINGS_STATUS).methods
        .single { it.name == "customFont" }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral

    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Method.same(other: Method) = definingClass == other.definingClass && name == other.name &&
        returnType == other.returnType && parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }

    private fun Instruction.string() =
        if (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) getReference<StringReference>()?.string else null

    /** Which of Android's default fonts this reads, DEFAULT, SANS_SERIF or DEFAULT_BOLD, or null. */
    private fun Instruction.androidDefault(): String? {
        if (opcode != Opcode.SGET_OBJECT) return null
        val field = getReference<FieldReference>() ?: return null
        if (field.definingClass != "Landroid/graphics/Typeface;" || field.type != "Landroid/graphics/Typeface;") return null
        return field.name.takeIf { it in setOf("DEFAULT", "SANS_SERIF", "DEFAULT_BOLD") }
    }

    /** An insert can push a branch past a plain goto's reach, and dexlib2 widens it. */
    private fun Instruction.kind() = when (opcode) {
        Opcode.GOTO_16, Opcode.GOTO_32 -> Opcode.GOTO
        else -> opcode
    }

    private companion object {
        /** 512708508's repository, by hand from its dump: createFromAsset, Typeface.create and ResourcesCompat.getFont. */
        val BY_HAND = mapOf(
            "512708508" to listOf(
                "LX/9qj;->A03(LX/9qg;)Landroid/graphics/Typeface;",
                "164: v5 from v1", "66: v5 from v2", "75: v5 from v1",
            ),
        )

        /**
         * 512708508's Compose font resolver, by hand from its dump: text with no font family, or the
         * default one at a weight, starts from Typeface.DEFAULT.
         */
        val BY_HAND_DEFAULTS = mapOf(
            "512708508" to ("LX/0NG;->AeX(LX/0VP;LX/3nS;I)Landroid/graphics/Typeface;" to listOf("11: v0 DEFAULT", "14: v3 DEFAULT")),
        )

        /** The extension's field each of Android's default fonts is read from instead. */
        val STAND_INS = mapOf("DEFAULT" to "androidDefault", "SANS_SERIF" to "androidSansSerif", "DEFAULT_BOLD" to "androidDefaultBold")

        /** One read of each build serves every test; each test patches its own copy. */
        val fixtures = PerBuild<Fixture>()
    }
}
