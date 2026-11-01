/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.ads

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.PerBuild
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.RegisterLiveness
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.argumentRegister
import app.morphe.util.findMutableMethodOf
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
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
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
 * What the Search part of Hide suggested users reads on a build: every class with a note of
 * Search's screen or of the suggested accounts row, the method holding the carousel's key, and
 * every other class that calls into the row's class, so a test can show those come through
 * unchanged. Read once per build; each test patches its own copy.
 */
internal object SearchSuggestionsFixture {
    private val loaded = PerBuild<List<ClassDef>>()

    fun classes(build: File): List<ClassDef> = loaded.getOrPut(build) {
        val noted = FixtureDex.classesWhere(build, { true }) { method ->
            method.strings().any { it.startsWith(SUGGESTED_ROW_NOTE) || it.startsWith(DISCOVERY_UI) || it == SEARCH_CAROUSEL_KEY }
        }
        val rows = noted.filter { classDef -> classDef.methods.any { method -> method.strings().any { it.startsWith(SUGGESTED_ROW_NOTE) } } }
            .map { it.type }.toSet()
        // Profiles, Activity, topic pages and the rest of the row's callers.
        val callers = FixtureDex.classesWhere(build, { dex -> dex.methodSection.any { it.definingClass in rows } }) { method ->
            method.implementation?.instructions?.any { it.getReference<MethodReference>()?.definingClass in rows } == true
        }
        (noted + callers).distinctBy { it.type }
    }

    private fun Method.strings(): List<String> =
        implementation?.instructions?.mapNotNull { it.getReference<StringReference>()?.string }.orEmpty()
}

/**
 * Hide suggested users in Search, on each declared build: the method that builds Search's list asks
 * the extension first thing past its check that the Follow suggestions list isn't empty, and leaves
 * by that check's other side. Nothing else changes, Search's other call to the same row, the one in
 * its trends list, included. Anything that would make the hook miss Threads' own path, or land on
 * another screen's row or another list, is refused before a method changes.
 */
class SearchSuggestionsFixtureTest {
    @Test
    fun `each declared build keeps the Follow suggestions carousel out of Search and changes nothing else`() {
        val method = ExtensionDex.classDef(SEARCH_SUGGESTIONS).methods.single { it.signature() == SHOW_SEARCH_CAROUSEL }
        assertTrue(SHOW_SEARCH_CAROUSEL, AccessFlags.STATIC.isSet(method.accessFlags) && AccessFlags.PUBLIC.isSet(method.accessFlags))

        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val classes = SearchSuggestionsFixture.classes(build)
            val context = context(build)
            val targets = context.searchSuggestionTargets()

            // Search calls the row twice, each under its own note. The carousel's call is the one in
            // the lambda the keyed item draws; the other draws suggestions mixed into the trends list.
            assertEquals(where, 2, targets.calls.size)
            assertTrue(where, targets.row.note.orEmpty().endsWith("($DISCOVERY_FILE:375)"))
            assertEquals(where, targets.lambda, targets.row.method.definingClass)
            val trends = targets.calls.single { it !== targets.row && it.method.definingClass != targets.lambda }
            assertTrue(where, trends.note.orEmpty().endsWith("($DISCOVERY_FILE:432)"))

            // Read off each 453 build apart from the patch: Search's list builder reads the
            // suggestions list at 188, asks whether it's empty at 189, checks the answer at 191,
            // builds the carousel from 192 on, constructs it at 209 with that list, adds it under
            // its key at 213 and 214, and goes to 215 for an empty list. What the check compared,
            // and the hook's register, are dead there.
            val stock = classes.original(targets.method)
            assertEquals(where, 188, targets.read)
            assertEquals(where, 191, targets.guard)
            assertEquals(where, 192, targets.start)
            assertEquals(where, 209, targets.init)
            assertEquals(where, 213, targets.key)
            assertEquals(where, 215, targets.away)
            assertEquals(where, Opcode.IGET_OBJECT, stock[targets.read].opcode)
            assertEquals(where, targets.list, (stock[targets.read] as OneRegisterInstruction).registerA)
            assertEquals(where, "isEmpty", stock[targets.read + 1].getReference<MethodReference>()?.name)
            assertEquals(where, Opcode.IF_NEZ, stock[targets.guard].opcode)
            assertEquals(where, targets.away, stock.jumpTarget(targets.guard))
            assertEquals(where, SEARCH_CAROUSEL_KEY, stock[targets.key].getReference<StringReference>()?.string)
            assertTrue(where, (targets.init downTo 0).any { stock[it].isNewInstanceOf(targets.lambda) })
            val arguments = (0 until 9).mapNotNull { stock[targets.init].argumentRegister(it) }
            assertTrue(where, arguments.contains(targets.list) || stock.take(targets.init).any { instruction ->
                instruction is TwoRegisterInstruction && instruction.registerB == targets.list && instruction.registerA in arguments
            })
            val live = RegisterLiveness.of(targets.method)
            assertFalse(where, targets.free in live.liveInto(targets.start))
            assertFalse(where, targets.free in live.liveInto(targets.away))
            assertTrue(where, stock[targets.guard].namedRegisters().none { it in live.liveInto(targets.away) })
            val registers = targets.method.implementation!!.registerCount

            hookSearchSuggestions(targets)

            // The carousel's path asks first, and leaves for where the check sends an empty list.
            val patched = targets.method.body()
            assertEquals(where, stock.size + 3, patched.size)
            assertEquals(where, registers, targets.method.implementation!!.registerCount)
            assertEquals(where, Opcode.INVOKE_STATIC, patched[targets.start].opcode)
            assertEquals(where, SHOW_SEARCH_CAROUSEL, patched[targets.start].getReference<MethodReference>().toString())
            assertEquals(where, Opcode.MOVE_RESULT, patched[targets.start + 1].opcode)
            assertEquals(where, targets.free, (patched[targets.start + 1] as OneRegisterInstruction).registerA)
            assertEquals(where, Opcode.IF_EQZ, patched[targets.start + 2].opcode)
            assertEquals(where, targets.free, (patched[targets.start + 2] as OneRegisterInstruction).registerA)
            assertEquals(where, targets.away + 3, patched.jumpTarget(targets.start + 2))
            // Threads' own check still falls into the hook and still jumps where it did.
            assertEquals(where, Opcode.IF_NEZ, patched[targets.guard].opcode)
            assertEquals(where, targets.start, targets.guard + 1)
            assertEquals(where, targets.away + 3, patched.jumpTarget(targets.guard))
            assertEquals(where, stock.map { it.text(offsets = false) },
                (patched.take(targets.start) + patched.drop(targets.start + 3)).map { it.text(offsets = false) })

            // Every other method of every class read, the lambda and every other caller of the row
            // included, is exactly what Threads shipped.
            val hooked = targets.method.signature()
            for (original in classes) {
                val mutable = context.mutableClassDefBy(original.type).methods.associateBy { it.signature() }
                assertEquals("$where: ${original.type}", original.methods.map { it.signature() }.toSet(), mutable.keys)
                for (each in original.methods) {
                    if (each.signature() == hooked) continue
                    assertEquals("$where: ${each.signature()}", each.body().map { it.text() },
                        mutable.getValue(each.signature()).body().map { it.text() })
                }
            }
        }
    }

    @Test
    fun `a second method holding the carousel's key is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val builder = context(build).searchSuggestionTargets().method
            val stock = SearchSuggestionsFixture.classes(build).single { it.type == builder.definingClass }
            val context = context(build, copy(stock, "Lapp/morphe/patches/threads/ads/DecoySearchList;"))
            val error = assertThrows(build.name, PatchException::class.java) { context.searchSuggestionTargets() }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("expected exactly one match, found 2"))
        }
    }

    @Test
    fun `a jump onto the carousel's path past its check is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val targets = context.searchSuggestionTargets()
            val method = targets.method
            method.addInstructionsWithLabels(0, "goto/32 :carousel", ExternalLabel("carousel", method.getInstruction(targets.start)))
            val error = assertThrows(build.name, PatchException::class.java) { context.searchSuggestionTargets() }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("not through one check"))
            assertFalse(build.name, method.body().any { it.calls(SHOW_SEARCH_CAROUSEL) })
        }
    }

    @Test
    fun `a check that jumps onto the carousel's path gets the same hook`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val context = context(build)
            val stock = context.searchSuggestionTargets()
            val method = stock.method
            // 451's check turned around, the other way D8 lays out the same test: an if-eqz that
            // jumps onto the carousel's path for a list that isn't empty, and a goto to the empty
            // side right below it.
            val compared = (method.body()[stock.guard] as OneRegisterInstruction).registerA
            method.addInstructionsWithLabels(stock.guard, """
                if-eqz v$compared, :carousel
                goto/32 :empty
            """, ExternalLabel("carousel", method.getInstruction(stock.start)), ExternalLabel("empty", method.getInstruction(stock.away)))
            method.removeInstruction(stock.guard + 2)
            val turned = method.body()
            val targets = context.searchSuggestionTargets()
            assertEquals(where, stock.guard, targets.guard)
            assertEquals(where, Opcode.IF_EQZ, turned[targets.guard].opcode)
            assertEquals(where, stock.start + 1, targets.start)
            assertEquals(where, targets.start, turned.jumpTarget(targets.guard))
            assertEquals(where, stock.guard + 1, targets.away)
            assertEquals(where, stock.away + 1, turned.jumpTarget(targets.away))

            hookSearchSuggestions(targets)

            // The check's jump lands on the hook, and a false answer leaves by the goto.
            val patched = method.body()
            assertEquals(where, turned.size + 3, patched.size)
            assertEquals(where, targets.start, patched.jumpTarget(targets.guard))
            assertTrue(where, patched[targets.start].calls(SHOW_SEARCH_CAROUSEL))
            assertEquals(where, targets.free, (patched[targets.start + 1] as OneRegisterInstruction).registerA)
            assertEquals(where, Opcode.IF_EQZ, patched[targets.start + 2].opcode)
            assertEquals(where, targets.away, patched.jumpTarget(targets.start + 2))
            assertEquals(where, stock.away + 4, patched.jumpTarget(targets.away))
            assertEquals(where, turned.map { it.text(offsets = false) },
                (patched.take(targets.start) + patched.drop(targets.start + 3)).map { it.text(offsets = false) })
        }
    }

    @Test
    fun `a check that isn't whether the list is empty is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val targets = context.searchSuggestionTargets()
            val compared = (targets.method.body()[targets.guard] as OneRegisterInstruction).registerA
            targets.method.addInstructions(targets.guard, "const/16 v$compared, 0x0")
            val error = assertThrows(build.name, PatchException::class.java) { context.searchSuggestionTargets() }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("only past a check that the list it reads isn't empty"))
        }
    }

    @Test
    fun `a carousel built from a list other than the one checked is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val targets = context.searchSuggestionTargets()
            val body = targets.method.body()
            val copy = (0 until targets.init).last { at ->
                (body[at] as? TwoRegisterInstruction)?.registerB == targets.list
            }
            targets.method.addInstructions(copy, "const/16 v${targets.list}, 0x0")
            val error = assertThrows(build.name, PatchException::class.java) { context.searchSuggestionTargets() }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("the one ${targets.method.descriptor()} checks"))
        }
    }

    @Test
    fun `a row handed a list the lambda wasn't built with is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val targets = context.searchSuggestionTargets()
            val row = targets.row
            val listType = (targets.method.body()[targets.read].getReference<FieldReference>())!!.type
            val lambda = context.mutableClassDefBy(targets.lambda).findMutableMethodOf(row.method)
            val call = lambda.body()[row.call]
            val lists = row.callee.parameterTypes.indices.filter { row.callee.parameterTypes[it].toString() == listType }
                .map { call.argumentRegister(row.callee.wordOffset(it))!! }
            assertTrue(build.name, lists.isNotEmpty())
            lambda.addInstructions(row.call, lists.joinToString("\n") { "const/16 v$it, 0x0" })
            val error = assertThrows(build.name, PatchException::class.java) { context.searchSuggestionTargets() }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("the list ${targets.lambda} hands the row"))
        }
    }

    @Test
    fun `a carousel lambda that draws the row under another screen's note is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val targets = context.searchSuggestionTargets()
            val lambda = context.mutableClassDefBy(targets.lambda).findMutableMethodOf(targets.row.method)
            val body = lambda.body()
            val note = (targets.row.call - 1 downTo 0).first { body[it].getReference<StringReference>()?.string == targets.row.note }
            val register = (body[note] as OneRegisterInstruction).registerA
            lambda.replaceInstruction(note,
                "const-string v$register, \"com.instagram.barcelona.profile.ui.ProfileScreen.<anonymous> (ProfileScreen.kt:1)\"")
            val error = assertThrows(build.name, PatchException::class.java) { context.searchSuggestionTargets() }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("draws under a $DISCOVERY_FILE note"))
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("found 0"))
        }
    }

    @Test
    fun `a check whose registers are read where it leads is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val targets = context.searchSuggestionTargets()
            val compared = targets.method.body()[targets.guard].namedRegisters().last()
            targets.method.addInstructionsAtControlFlowLabel(targets.away, "move/16 v$compared, v$compared")
            val error = assertThrows(build.name, PatchException::class.java) { context.searchSuggestionTargets() }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("again past its check"))
        }
    }

    private fun context(build: File, vararg extra: ClassDef): BytecodePatchContext =
        PatchContexts.of(ExtensionDex.classes() + SearchSuggestionsFixture.classes(build) + extra)

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
