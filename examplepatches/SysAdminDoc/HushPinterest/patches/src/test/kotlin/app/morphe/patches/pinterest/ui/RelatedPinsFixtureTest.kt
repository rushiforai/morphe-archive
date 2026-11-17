/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertSame
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** The pin page presenters and the related pins lists they add, in each declared APK. */
@Category(FixtureTests::class)
class RelatedPinsFixtureTest {
    @Test
    fun `each declared APK skips only the calls that add a related pins list`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            hideRelatedPinsPatch.execute(context)
            for (flag in listOf("hideRelatedPins", "relatedPins")) assertEquals("${build.name}: $flag", 1, flag(context, flag))

            for ((type, expected) in EXPECTED) {
                val presenter = classes.single { it.type == type }
                val method = presenter.methods.single { it.name == CLOSEUP_ADD_SECTIONS }
                val clean = method.implementation!!.instructions.toList()
                val body = patched(context, method)
                val hooks = body.indices.filter { (body[it] as? ReferenceInstruction)?.reference?.toString() == RELATED_PINS_HOOK }
                assertEquals("${build.name}: ${presenter.type} related adds", expected.size, hooks.size)

                val skipped = hooks.map { at ->
                    val result = body[at + 1]
                    assertEquals(build.name, Opcode.MOVE_RESULT, result.opcode)
                    val skip = body[at + 2]
                    assertEquals(build.name, Opcode.IF_NEZ, skip.opcode)
                    assertEquals(build.name, (result as OneRegisterInstruction).registerA, (skip as OneRegisterInstruction).registerA)
                    val add = body[at + 3]
                    assertEquals(build.name, Opcode.INVOKE_VIRTUAL, add.opcode)
                    assertEquals(build.name, "V", ((add as ReferenceInstruction).reference as MethodReference).returnType)
                    assertSame("${build.name}: a yes jumps right past the add", body[at + 4],
                        (skip as BuilderOffsetInstruction).target.location.instruction)
                    // The list the add takes is the one the call right before it returned.
                    val list = (add as FiveRegisterInstruction).registerD
                    assertEquals(build.name, Opcode.MOVE_RESULT_OBJECT, body[at - 1].opcode)
                    assertEquals(build.name, list, (body[at - 1] as OneRegisterInstruction).registerA)
                    val source = ((body[at - 2] as ReferenceInstruction).reference as MethodReference)
                    if (source.name in RELATED_PIN_GETTERS) source.name else {
                        assertEquals(build.name, RELATED_REFINEMENT_GETTER, ((body[at - 4] as ReferenceInstruction).reference as MethodReference).name)
                        RELATED_REFINEMENT_GETTER
                    }
                }
                assertEquals("${build.name}: ${presenter.type}", expected, skipped)

                // Every skipped add is the page's one section adder, every other section is still
                // added through it, and nothing else changed.
                val sectionAdds = hooks.map { (body[it + 3] as ReferenceInstruction).reference.toString() }.toSet()
                assertEquals(build.name, 1, sectionAdds.size)
                val adds = { list: List<Instruction> -> list.count { (it as? ReferenceInstruction)?.reference?.toString() in sectionAdds } }
                assertTrue("${build.name}: the page adds other sections too", adds(clean) > hooks.size)
                assertEquals(build.name, adds(clean), adds(body))
                val without = body.filterIndexed { index, _ -> hooks.none { index in it..it + 2 } }
                assertEquals("${build.name}: Pinterest's own code is unchanged", clean.map { it.opcode }.filter { it != Opcode.NOP },
                    without.map { it.opcode }.filter { it != Opcode.NOP })
            }
            loadingEndsEarly(build.name, classes, context)
        }
    }

    /**
     * The loading indicator's start asks the hook first, and a yes sets both wait states to
     * COMPLETE, redraws the loading section when the section list is set, and returns before the
     * grid is followed. A no runs Pinterest's start unchanged.
     */
    private fun loadingEndsEarly(name: String, classes: List<ClassDef>, context: BytecodePatchContext) {
        val indicator = classes.single { owner -> owner.methods.any { LOADING_INDICATOR_CHECK in strings(it) } }
        val watch = indicator.methods.single { LOADING_INDICATOR_CHECK in strings(it) }
        val clean = watch.implementation!!.instructions.toList()
        val body = patched(context, watch)
        val all = classes.flatMap { owner -> owner.methods.filter { it.implementation != null } }
            .sumOf { method -> patched(context, method).count { (it as? ReferenceInstruction)?.reference?.toString() == RELATED_LOADING_HOOK } }
        assertEquals("$name: one loading hook", 1, all)
        assertEquals(name, RELATED_LOADING_HOOK, (body[0] as ReferenceInstruction).reference.toString())
        val scratch = (body[1] as OneRegisterInstruction).registerA
        assertEquals(name, Opcode.MOVE_RESULT, body[1].opcode)
        assertEquals(name, Opcode.IF_EQZ, body[2].opcode)
        assertEquals(name, scratch, (body[2] as OneRegisterInstruction).registerA)
        val injected = body.indexOfFirst { it === (body[2] as BuilderOffsetInstruction).target.location.instruction }
        assertEquals("$name: a no lands on Pinterest's first instruction", clean.map { it.opcode }, body.drop(injected).map { it.opcode })

        // Both wait states, the fields whose type has a COMPLETE of its own, end at COMPLETE.
        val self = watch.implementation!!.registerCount - watch.parameterTypes.size - 1
        val states = indicator.fields.filter { field -> classes.any { enum -> enum.type == field.type && enum.fields.any { it.name == "COMPLETE" } } }
        assertEquals("$name: two wait states", 2, states.size)
        val ended = (0 until 2).map { k ->
            val read = body[3 + 2 * k]
            val write = body[4 + 2 * k]
            assertEquals(name, Opcode.SGET_OBJECT, read.opcode)
            assertEquals(name, "COMPLETE", ((read as ReferenceInstruction).reference as FieldReference).name)
            assertEquals(name, Opcode.IPUT_OBJECT, write.opcode)
            assertEquals(name, scratch, (write as TwoRegisterInstruction).registerA)
            assertEquals(name, self, write.registerB)
            val field = (write as ReferenceInstruction).reference as FieldReference
            assertEquals(name, (read.reference as FieldReference).type, field.type)
            field.name
        }
        assertEquals(name, states.map { it.name }.toSet(), ended.toSet())

        // The redraw runs only when the section list the start checks is set, then the start returns.
        val sections = body[7]
        assertEquals(name, Opcode.IGET_OBJECT, sections.opcode)
        assertEquals(name, clean.first { it.opcode == Opcode.IGET_OBJECT }.let { (it as ReferenceInstruction).reference.toString() },
            (sections as ReferenceInstruction).reference.toString())
        assertEquals(name, self, (sections as TwoRegisterInstruction).registerB)
        val guard = body[8]
        assertEquals(name, Opcode.IF_EQZ, guard.opcode)
        val redraw = body[9] as FiveRegisterInstruction
        assertEquals(name, Opcode.INVOKE_VIRTUAL, body[9].opcode)
        assertEquals(name, listOf(self, self + 1), listOf(redraw.registerC, redraw.registerD))
        val refresh = (body[9] as ReferenceInstruction).reference as MethodReference
        assertEquals(name, indicator.type, refresh.definingClass)
        assertEquals(name, listOf(watch.parameterTypes.first().toString()), refresh.parameterTypes.map { it.toString() })
        assertTrue("$name: the redraw isn't the start", refresh.name != watch.name)
        assertEquals(name, Opcode.RETURN_VOID, body[10].opcode)
        assertSame("$name: no section list skips to the return", body[10], (guard as BuilderOffsetInstruction).target.location.instruction)
        assertEquals(name, 11, injected)
    }

    private fun strings(method: Method) = method.implementation?.instructions?.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    }.orEmpty()

    @Test
    fun `a missing presenter, related add or status stub refuses with the presenters untouched`() {
        val build = Fixtures.declaredBuilds().last()
        val classes = read(build)
        val extension = ExtensionDex.classes()
        fun without(stub: String) = classes + extension.map { owner -> if (owner.type != SETTINGS_STATUS) owner else
            ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
                owner.annotations, owner.fields, owner.methods.filterNot { it.name == stub }) }
        // A promoted presenter whose related list is added from a field read, as the other sections are.
        val promoted = classes.single { it.type == PROMOTED }
        val noRelated = ImmutableClassDef(promoted.type, promoted.accessFlags, promoted.superclass, promoted.interfaces,
            promoted.sourceFile, promoted.annotations, promoted.fields, promoted.methods.map { method ->
                if (method.name != CLOSEUP_ADD_SECTIONS) method else renamedGetters(method)
            })
        val indicator = classes.single { owner -> owner.methods.any { LOADING_INDICATOR_CHECK in strings(it) } }
        val cases = linkedMapOf(
            "missing presenters" to (extension + classes.filter { it.type != ORGANIC && it.type != PROMOTED } to "no pin page presenter"),
            "presenter with no related add" to (extension + classes.map { if (it.type == PROMOTED) noRelated else it } to "adds no related pins list"),
            "missing loading indicator" to (extension + classes.filter { it !== indicator } to "no single pin page loading indicator"),
            "missing hideRelatedPins stub" to (without("hideRelatedPins") to "hideRelatedPins"),
            "missing relatedPins stub" to (without("relatedPins") to "relatedPins"),
        )
        for ((reason, case) in cases) {
            val (input, message) = case
            val context = PatchContexts.of(input)
            val thrown = assertThrows(reason, PatchException::class.java) { hideRelatedPinsPatch.execute(context) }
            assertTrue("$reason: ${thrown.message}", thrown.message.orEmpty().contains(message))
            for (name in listOf("hideRelatedPins", "relatedPins")) {
                if (context.mutableClassDefBy(SETTINGS_STATUS).methods.any { it.name == name }) {
                    assertEquals("$reason left $name set", 0, flag(context, name))
                }
            }
            for (type in listOf(ORGANIC, PROMOTED)) {
                val owner = input.singleOrNull { it.type == type } ?: continue
                val method = owner.methods.single { it.name == CLOSEUP_ADD_SECTIONS }
                assertEquals("$reason changed $type", method.implementation!!.instructions.map { it.opcode },
                    patched(context, method).map { it.opcode })
            }
            if (indicator in input) for (method in indicator.methods.filter { it.implementation != null }) {
                assertEquals("$reason changed the loading indicator's ${method.name}", method.implementation!!.instructions.map { it.opcode },
                    patched(context, method).map { it.opcode })
            }
        }
    }

    /** [method] with its related getters called by another name, so no add takes a related list. */
    private fun renamedGetters(method: Method): Method {
        val implementation = method.implementation!!
        val instructions = implementation.instructions.map { instruction ->
            val called = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            if (called == null || called.name !in RELATED_PIN_GETTERS) instruction else {
                val renamed = com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference(
                    called.definingClass, "getSomethingElse", called.parameterTypes, called.returnType)
                val call = instruction as FiveRegisterInstruction
                com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c(instruction.opcode,
                    call.registerCount, call.registerC, call.registerD, call.registerE, call.registerF, call.registerG, renamed)
            }
        }
        return com.android.tools.smali.dexlib2.immutable.ImmutableMethod(method.definingClass, method.name, method.parameters,
            method.returnType, method.accessFlags, method.annotations, method.hiddenApiRestrictions,
            com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(implementation.registerCount, instructions,
                implementation.tryBlocks, implementation.debugItems))
    }

    private fun flag(context: BytecodePatchContext, name: String) =
        (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral

    private fun patched(context: BytecodePatchContext, method: Method) =
        context.mutableClassDefBy(method.definingClass).methods.single {
            it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
        }.implementation!!.instructions.toList()

    /** The two presenters, the loading indicator, and the types of the indicator's fields. */
    private fun read(build: java.io.File): List<ClassDef> {
        val found = FixtureDex.classes(build, setOf(ORGANIC, PROMOTED))
        check(ORGANIC in found) { "${build.name}: no organic pin page presenter" }
        check(PROMOTED in found) { "${build.name}: no promoted pin page presenter" }
        val indicator = FixtureDex.classesWhere(build, { true }) { LOADING_INDICATOR_CHECK in strings(it) }.singleOrNull()
            ?: error("${build.name}: no single loading indicator")
        val fieldTypes = FixtureDex.classes(build, indicator.fields.map { it.type }.toSet() - indicator.type)
        return found.values.toList() + indicator + fieldTypes.values
    }
}

private const val ORGANIC = "Lcom/pinterest/feature/pin/closeup/presenter/OrganicPinCloseupPresenter;"
private const val PROMOTED = "Lcom/pinterest/feature/pin/closeup/presenter/PromotedPinCloseupPresenter;"

/**
 * The related lists each presenter adds in the clean 14.44.0 dex, in order, read from its smali: the
 * organic page adds the grid, its filtered form and the refinement delegate's list, and the
 * promoted page the grid alone.
 */
private val EXPECTED = mapOf(
    ORGANIC to listOf("getRelatedPinsPagedList", "getFilteredRelatedPinsPagedList", RELATED_REFINEMENT_GETTER),
    PROMOTED to listOf("getRelatedPinsPagedList"),
)
