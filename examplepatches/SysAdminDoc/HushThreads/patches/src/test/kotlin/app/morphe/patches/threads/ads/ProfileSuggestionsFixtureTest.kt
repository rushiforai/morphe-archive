/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.ads

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.RegisterLiveness
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.getReference
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * What the profile part of Hide suggested users reads on a build: every class with a profile
 * screen note or the suggested accounts row's note, the profile view model, and every other class
 * that calls into the row's class, so a test can show those come through unchanged. Read once per
 * build; each test patches its own copy.
 */
internal object ProfileSuggestionsFixture {
    private val loaded = mutableMapOf<File, List<ClassDef>>()

    fun classes(build: File): List<ClassDef> = loaded.getOrPut(build) {
        val noted = FixtureDex.classesWhere(build, { true }) { method ->
            method.strings().any { it.startsWith(SUGGESTED_ROW_NOTE) || it.startsWith(PROFILE_UI) }
        }
        val rows = noted.filter { classDef -> classDef.methods.any { method -> method.strings().any { it.startsWith(SUGGESTED_ROW_NOTE) } } }
            .map { it.type }.toSet()
        // Search, Activity, topic pages and the rest of the row's callers.
        val callers = FixtureDex.classesWhere(build, { dex -> dex.methodSection.any { it.definingClass in rows } }) { method ->
            method.implementation?.instructions?.any { it.getReference<MethodReference>()?.definingClass in rows } == true
        }
        val viewModel = FixtureDex.classes(build, setOf(PROFILE_VIEW_MODEL)).values
        (noted + callers + viewModel).distinctBy { it.type }
    }

    private fun Method.strings(): List<String> =
        implementation?.instructions?.mapNotNull { it.getReference<StringReference>()?.string }.orEmpty()
}

/**
 * Hide suggested users on profiles, on each declared build: the profile screen hands its carousel
 * list to the extension right where it reads it, ahead of its own null check, and the profile view
 * model asks the extension first thing on the path that adds the suggestions row, leaving by its
 * own check's other side. Nothing else changes, Search's and Activity's calls to the same row
 * included. Anything that would make either hook miss Threads' own path is refused before a method
 * changes.
 */
class ProfileSuggestionsFixtureTest {
    @Test
    fun `each declared build keeps suggested accounts off profiles and changes nothing else`() {
        val extension = ExtensionDex.classDef(PROFILE_SUGGESTIONS).methods
        for (hook in listOf(CAROUSEL, SHOW_ROW)) {
            val method = extension.single { it.signature() == hook }
            assertTrue(hook, AccessFlags.STATIC.isSet(method.accessFlags) && AccessFlags.PUBLIC.isSet(method.accessFlags))
        }

        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val classes = ProfileSuggestionsFixture.classes(build)
            val context = context(build)
            val targets = context.profileSuggestionTargets()

            // One call under each profile file's note, both to the same overload of the row. Merged
            // lambdas that also hold profile code call the row for Search and Activity, and those
            // calls keep the notes right above them.
            assertTrue(where, targets.screen.note.orEmpty().contains("($PROFILE_SCREEN_FILE:"))
            assertTrue(where, targets.infoRows.note.orEmpty().contains("($PROFILE_INFO_ROWS_FILE:"))
            assertEquals(where, targets.screen.callee.toString(), targets.infoRows.callee.toString())
            assertTrue(where, targets.calls.any { it.note.orEmpty().endsWith("(DiscoveryContent.kt:354)") })
            assertTrue(where, targets.calls.any { it.note.orEmpty().endsWith("(ActivityFeedContent.kt:888)") })

            // Read off 450 apart from the patch: the profile screen reads the profile's carousel
            // list at 538, the only read of that field outside its own class, checks it at 539,
            // and builds the carousel from 1009 on.
            val carousel = targets.carousel
            val screenStock = classes.original(carousel.method)
            assertEquals(where, 538, carousel.read)
            assertEquals(where, 539, carousel.guard)
            assertEquals(where, Opcode.IGET_OBJECT, screenStock[carousel.read].opcode)
            assertEquals(where, carousel.register, (screenStock[carousel.read] as OneRegisterInstruction).registerA)
            assertEquals(where, Opcode.IF_NEZ, screenStock[carousel.guard].opcode)
            assertEquals(where, carousel.register, (screenStock[carousel.guard] as OneRegisterInstruction).registerA)
            val landing = screenStock.jumpTarget(carousel.guard)
            assertEquals(where, 1009, landing)
            assertTrue(where, screenStock[landing + 2].isNewInstanceOf(targets.screen.method.definingClass))

            // The view model checks for Threads' suggestions at 311, makes the row from 312 on, and
            // goes to 325 without them. What the check compared, and the hook's register, are dead there.
            val row = targets.headerRow
            val rowStock = classes.original(row.method)
            assertEquals(where, 311, row.guard)
            assertEquals(where, 312, row.start)
            assertEquals(where, 325, row.away)
            assertEquals(where, Opcode.IF_NE, rowStock[row.guard].opcode)
            assertEquals(where, row.away, rowStock.jumpTarget(row.guard))
            val live = RegisterLiveness.of(row.method)
            assertFalse(where, row.free in live.liveInto(row.start))
            assertFalse(where, row.free in live.liveInto(row.away))
            assertTrue(where, rowStock[row.guard].namedRegisters().none { it in live.liveInto(row.away) })
            val screenRegisters = carousel.method.implementation!!.registerCount
            val rowRegisters = row.method.implementation!!.registerCount

            hookProfileSuggestions(targets)

            // The list goes through the extension and back into its own register, as its own type,
            // and Threads' check reads the answer and still lands on the carousel.
            val screen = carousel.method.body()
            assertEquals(where, screenStock.size + 3, screen.size)
            assertEquals(where, screenRegisters, carousel.method.implementation!!.registerCount)
            val call = screen[carousel.guard]
            assertEquals(where, Opcode.INVOKE_STATIC_RANGE, call.opcode)
            assertEquals(where, CAROUSEL, call.getReference<MethodReference>().toString())
            assertEquals(where, listOf(carousel.register), call.namedRegisters())
            assertEquals(where, Opcode.MOVE_RESULT_OBJECT, screen[carousel.guard + 1].opcode)
            assertEquals(where, carousel.register, (screen[carousel.guard + 1] as OneRegisterInstruction).registerA)
            assertEquals(where, Opcode.CHECK_CAST, screen[carousel.guard + 2].opcode)
            assertEquals(where, carousel.register, (screen[carousel.guard + 2] as OneRegisterInstruction).registerA)
            assertEquals(where, carousel.list.type, screen[carousel.guard + 2].getReference<TypeReference>()?.type)
            assertEquals(where, Opcode.IF_NEZ, screen[carousel.guard + 3].opcode)
            assertEquals(where, carousel.register, (screen[carousel.guard + 3] as OneRegisterInstruction).registerA)
            assertEquals(where, landing + 3, screen.jumpTarget(carousel.guard + 3))
            assertEquals(where, screenStock.map { it.text(offsets = false) },
                (screen.take(carousel.guard) + screen.drop(carousel.guard + 3)).map { it.text(offsets = false) })

            // The row's path asks first, and leaves for where the check sends Threads without suggestions.
            val header = row.method.body()
            assertEquals(where, rowStock.size + 3, header.size)
            assertEquals(where, rowRegisters, row.method.implementation!!.registerCount)
            assertEquals(where, Opcode.INVOKE_STATIC, header[row.start].opcode)
            assertEquals(where, SHOW_ROW, header[row.start].getReference<MethodReference>().toString())
            assertEquals(where, Opcode.MOVE_RESULT, header[row.start + 1].opcode)
            assertEquals(where, row.free, (header[row.start + 1] as OneRegisterInstruction).registerA)
            assertEquals(where, Opcode.IF_EQZ, header[row.start + 2].opcode)
            assertEquals(where, row.free, (header[row.start + 2] as OneRegisterInstruction).registerA)
            assertEquals(where, row.away + 3, header.jumpTarget(row.start + 2))
            // Threads' own check still falls into the hook and still jumps where it did.
            assertEquals(where, Opcode.IF_NE, header[row.guard].opcode)
            assertEquals(where, row.start, row.guard + 1)
            assertEquals(where, row.away + 3, header.jumpTarget(row.guard))
            assertEquals(where, rowStock.map { it.text(offsets = false) },
                (header.take(row.start) + header.drop(row.start + 3)).map { it.text(offsets = false) })

            // Every other method of every class read, every other caller of the row included, is
            // exactly what Threads shipped.
            val hooked = setOf(carousel.method.signature(), row.method.signature())
            for (stock in classes) {
                val patched = context.mutableClassDefBy(stock.type).methods.associateBy { it.signature() }
                assertEquals("$where: ${stock.type}", stock.methods.map { it.signature() }.toSet(), patched.keys)
                for (method in stock.methods) {
                    if (method.signature() in hooked) continue
                    assertEquals("$where: ${method.signature()}", method.body().map { it.text() },
                        patched.getValue(method.signature()).body().map { it.text() })
                }
            }
        }
    }

    @Test
    fun `a second suggested accounts row under a profile note is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val targets = context(build).profileSuggestionTargets()
            for (call in listOf(targets.screen, targets.infoRows)) {
                val stock = ProfileSuggestionsFixture.classes(build).single { it.type == call.method.definingClass }
                val context = context(build, copy(stock, "Lapp/morphe/patches/threads/ads/DecoyProfileRow;"))
                val error = assertThrows(build.name, PatchException::class.java) { context.profileSuggestionTargets() }
                assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("expected exactly one match, found 2"))
            }
        }
    }

    @Test
    fun `a second way onto the carousel past its check is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val carousel = context.profileSuggestionTargets().carousel
            val method = carousel.method
            val landing = method.body().jumpTarget(carousel.guard)
            method.addInstructionsWithLabels(carousel.guard, "goto/32 :carousel", ExternalLabel("carousel", method.getInstruction(landing)))
            val error = assertThrows(build.name, PatchException::class.java) { context.profileSuggestionTargets() }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("not through one check"))
            assertFalse(build.name, method.body().any { it.calls(CAROUSEL) })
        }
    }

    @Test
    fun `a carousel list that isn't the one read from the profile is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val carousel = context.profileSuggestionTargets().carousel
            carousel.method.addInstructions(carousel.guard, "const/16 v${carousel.register}, 0x0")
            val error = assertThrows(build.name, PatchException::class.java) { context.profileSuggestionTargets() }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("doesn't hand the carousel a list it reads from a field"))
        }
    }

    @Test
    fun `a carousel check that doesn't follow the read is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val carousel = context.profileSuggestionTargets().carousel
            carousel.method.addInstructions(carousel.guard, "nop")
            val error = assertThrows(build.name, PatchException::class.java) { context.profileSuggestionTargets() }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("only past a null check of the list it reads"))
        }
    }

    @Test
    fun `a jump onto the profile row past its check is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val row = context.profileSuggestionTargets().headerRow
            row.method.addInstructionsWithLabels(0, "goto/32 :row", ExternalLabel("row", row.method.getInstruction(row.start)))
            val error = assertThrows(build.name, PatchException::class.java) { context.profileSuggestionTargets() }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("not through one check"))
            assertFalse(build.name, row.method.body().any { it.calls(SHOW_ROW) })
        }
    }

    @Test
    fun `a check whose registers are read where it leads is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val row = context.profileSuggestionTargets().headerRow
            val compared = row.method.body()[row.guard].namedRegisters().last()
            row.method.addInstructionsAtControlFlowLabel(row.away, "move-object/16 v$compared, v$compared")
            val error = assertThrows(build.name, PatchException::class.java) { context.profileSuggestionTargets() }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("again past its check"))
        }
    }

    private fun context(build: File, vararg extra: ClassDef): BytecodePatchContext =
        PatchContexts.of(ExtensionDex.classes() + ProfileSuggestionsFixture.classes(build) + extra)

    /** The same class under another name, as a second copy of Threads' code would look. */
    private fun copy(stock: ClassDef, type: String): ClassDef = ImmutableClassDef(
        type, stock.accessFlags, stock.superclass, stock.interfaces, stock.sourceFile, stock.annotations,
        emptyList<Field>(),
        stock.methods.map {
            ImmutableMethod(type, it.name, it.parameters, it.returnType, it.accessFlags, it.annotations,
                it.hiddenApiRestrictions, it.implementation)
        },
    )

    /** The fixture's own copy of [method], which no test changes. */
    private fun List<ClassDef>.original(method: Method): List<Instruction> =
        single { it.type == method.definingClass }.methods.single { it.signature() == method.signature() }.body()

    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Method.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    private fun Instruction.calls(method: String) = getReference<MethodReference>()?.toString() == method

    private fun Instruction.isNewInstanceOf(type: String) =
        opcode == Opcode.NEW_INSTANCE && getReference<TypeReference>()?.type == type

    /** The index the branch at [at] jumps to. */
    private fun List<Instruction>.jumpTarget(at: Int): Int {
        val addresses = runningFold(0) { address, instruction -> address + instruction.codeUnits }
        return addresses.indexOf(addresses[at] + (this[at] as OffsetInstruction).codeOffset)
    }

    /** An instruction as text, so two copies compare; branch offsets only when nothing moved. */
    private fun Instruction.text(offsets: Boolean = true): String = listOf(
        opcode.name,
        namedRegisters().joinToString(","),
        (this as? ReferenceInstruction)?.reference?.toString().orEmpty(),
        (this as? WideLiteralInstruction)?.wideLiteral?.toString().orEmpty(),
        if (offsets) (this as? OffsetInstruction)?.codeOffset?.toString().orEmpty() else "",
    ).joinToString(" ")
}
