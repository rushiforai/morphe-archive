/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.PackedSwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutablePackedSwitchPayload
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableSwitchElement
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.File
import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/** Pinterest's closeup section binder, the topic row's interface, its one view class and that view's own ancestors, in both APKs. */
class TopicSuggestionsFixtureTest {
    private class Build(val name: String, val binder: ClassDef, val face: ClassDef, val row: ClassDef, val ancestors: List<ClassDef>) {
        val classes get() = listOf(binder, face, row) + ancestors
        val method get() = binder.methods.single { it.isTopicBinder() }
    }

    @Test
    fun `each declared original APK hides the topic row at its switch fall-through and measures it through the hook`() {
        for (build in Fixtures.declaredBuilds().map(::read)) {
            val context = PatchContexts.of(ExtensionDex.classes() + build.classes)
            hideTopicSuggestionsPatch.execute(context)
            for (flag in listOf("hideTopicSuggestions", "topicSuggestions")) {
                assertEquals("${build.name}: $flag", 1, flag(context, flag))
            }
            // Payload alignment nops come and go with the layout, so they aren't compared.
            val original = build.method.implementation!!.instructions.map { it.opcode }.filter { it != Opcode.NOP }
            val body = patched(context, build.method)
            assertEquals("${build.name}: everything but the hook stays", original,
                body.filterIndexed { at, _ -> at != TOPIC_FALL_THROUGH }.map { it.opcode }.filter { it != Opcode.NOP })
            val hook = body[TOPIC_FALL_THROUGH]
            assertEquals(build.name, TOPIC_ROW_HOOK, (hook as ReferenceInstruction).reference.toString())
            val view = build.method.implementation!!.registerCount - build.method.parameterTypes.size
            assertEquals("${build.name}: the hook reads the view parameter", listOf(view),
                (hook as RegisterRangeInstruction).let { (it.startRegister until it.startRegister + it.registerCount).toList() })
            val cast = body[TOPIC_FALL_THROUGH + 1]
            assertEquals(build.name, Opcode.CHECK_CAST, cast.opcode)
            assertEquals(build.name, view, (cast as OneRegisterInstruction).registerA)
            assertEquals(build.name, build.face.type, ((cast as ReferenceInstruction).reference as TypeReference).type)

            val measure = context.mutableClassDefBy(build.row.type).methods.single { it.name == "onMeasure" }
            assertEquals(build.name, listOf("I", "I"), measure.parameterTypes.map(CharSequence::toString))
            val code = measure.implementation!!.instructions.toList()
            assertEquals(build.name, listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT,
                Opcode.INVOKE_SUPER_RANGE, Opcode.RETURN_VOID), code.map { it.opcode })
            for ((at, spec) in listOf(0 to 1, 2 to 2)) {
                assertEquals(build.name, TOPIC_MEASURE_HOOK, (code[at] as ReferenceInstruction).reference.toString())
                assertEquals("${build.name}: the row and its spec", listOf(0, spec), registers(code[at]))
                assertEquals("${build.name}: the answer replaces the spec", spec, (code[at + 1] as OneRegisterInstruction).registerA)
            }
            val inherited = (code[4] as ReferenceInstruction).reference as MethodReference
            assertEquals(build.name, "${build.row.superclass}->onMeasure(II)V",
                "${inherited.definingClass}->${inherited.name}(${inherited.parameterTypes.joinToString("")})${inherited.returnType}")
            assertEquals(build.name, 0, (code[4] as RegisterRangeInstruction).startRegister)
            assertEquals(build.name, 3, (code[4] as RegisterRangeInstruction).registerCount)
        }
    }

    @Test
    fun `a changed binder, row view or status stub refuses before any change`() {
        val build = read(Fixtures.declaredBuilds().last())
        val extension = ExtensionDex.classes()
        val method = build.method
        val view = method.implementation!!.registerCount - method.parameterTypes.size
        // A switch arm landing on the fall-through would run the hook for another section too.
        val labelled = replace(build.binder, { it.isTopicBinder() }) { instructions ->
            val switch = instructions[1] as OffsetInstruction
            val payloadAt = address(instructions, 1) + switch.codeOffset
            instructions.mapIndexed { at, instruction ->
                if (address(instructions, at) != payloadAt) instruction else {
                    val payload = instruction as PackedSwitchPayload
                    ImmutablePackedSwitchPayload(payload.switchElements.mapIndexed { k, element ->
                        ImmutableSwitchElement(element.key, if (k == 0) address(instructions, 2) - address(instructions, 1) else element.offset)
                    })
                }
            }
        }
        // The discriminator read into the view's register leaves the hook an int.
        val overwritten = replace(build.binder, { it.isTopicBinder() }) { instructions ->
            val read = instructions[0] as TwoRegisterInstruction
            val switch = instructions[1] as OffsetInstruction
            listOf(ImmutableInstruction22c(Opcode.IGET, view, read.registerB, (read as ReferenceInstruction).reference),
                ImmutableInstruction31t(Opcode.PACKED_SWITCH, view, switch.codeOffset)) + instructions.drop(2)
        }
        val otherCast = replace(build.binder, { it.isTopicBinder() }) { instructions ->
            val read = instructions[0] as TwoRegisterInstruction
            instructions.toMutableList().apply {
                set(2, ImmutableInstruction21c(Opcode.CHECK_CAST, read.registerA, (instructions[2] as ReferenceInstruction).reference))
            }
        }
        // A second method of the same shape, logging the same line, leaves no one binder to choose.
        val secondBinder = ImmutableClassDef(build.binder.type, build.binder.accessFlags, build.binder.superclass, build.binder.interfaces,
            build.binder.sourceFile, build.binder.annotations, build.binder.fields, build.binder.methods + ImmutableMethod(build.binder.type,
                "bindAgain", method.parameters, method.returnType, method.accessFlags, null, null, method.implementation))
        val secondRow = rename(build.row, "Lapp/hushpinterest/test/SecondRow;")
        val measuring = ImmutableClassDef(build.row.type, build.row.accessFlags, build.row.superclass, build.row.interfaces,
            build.row.sourceFile, build.row.annotations, build.row.fields, build.row.methods + onMeasure(build.row.type, AccessFlags.PUBLIC.value))
        val top = build.ancestors.last()
        val finalAncestor = ImmutableClassDef(top.type, top.accessFlags, top.superclass, top.interfaces, top.sourceFile,
            top.annotations, top.fields, top.methods + onMeasure(top.type, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value))
        val notAView = ImmutableClassDef(top.type, top.accessFlags, "Ljava/lang/Object;", top.interfaces, top.sourceFile,
            top.annotations, top.fields, top.methods)
        val notAnInterface = ImmutableClassDef(build.face.type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null,
            build.face.sourceFile, build.face.annotations, build.face.fields, emptyList())
        fun with(vararg swaps: ClassDef) = extension + build.classes.map { owner -> swaps.firstOrNull { it.type == owner.type } ?: owner }
        // Each case and the refusal it has to give, so none passes on another check's account.
        val cases = linkedMapOf(
            "missing binder" to (extension + build.classes - build.binder to "topic row binder: expected one exact target, found 0"),
            "two binders" to (with(secondBinder) to "topic row binder: expected one exact target, found 2"),
            "fall-through is also a switch target" to (with(labelled) to "also a branch target"),
            "view parameter written before the fall-through" to (with(overwritten) to "writes over parameter 0"),
            "fall-through casts another register" to (with(otherCast) to "no longer starts by casting"),
            "cast to a class" to (with(notAnInterface) to "which is not an interface"),
            "no row view" to (extension + build.classes - build.row to "topic row view: expected one exact target, found 0"),
            "two row views" to (extension + build.classes + secondRow to "topic row view: expected one exact target, found 2"),
            "row view measures itself" to (with(measuring) to "measures itself"),
            "final onMeasure above the row view" to (with(finalAncestor) to "cannot override final"),
            "row view outside Android's views" to (with(notAView) to "is not an Android view"),
            "missing status stub" to (build.classes + extension.map { owner -> if (owner.type != SETTINGS_STATUS) owner else
                ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
                    owner.annotations, owner.fields, owner.methods.filterNot { it.name == "topicSuggestions" }) }
                to "no boolean method topicSuggestions()"),
        )
        for ((reason, case) in cases) {
            val (input, message) = case
            val context = PatchContexts.of(input)
            val before = snapshot(context, input)
            val refusal = assertThrows(reason, PatchException::class.java) { hideTopicSuggestionsPatch.execute(context) }
            assertTrue("$reason refused for another reason: ${refusal.message}", refusal.message.orEmpty().contains(message))
            assertArrayEquals("$reason left retained edits", before, snapshot(context, input))
            assertEquals("$reason left the family flag set", 0, flag(context, "hideTopicSuggestions"))
        }
    }

    @Test
    fun `the topic row view is the only class in each APK implementing its interface`() {
        for (build in Fixtures.declaredBuilds().map(::read)) {
            assertTrue("${build.name}: ${build.face.type} is an interface", AccessFlags.INTERFACE.isSet(build.face.accessFlags))
            assertTrue("${build.name}: the row view declares no onMeasure", build.row.methods.none { it.name == "onMeasure" })
            assertTrue("${build.name}: ${build.ancestors.last().superclass} is a framework view",
                build.ancestors.last().superclass!!.startsWith("Landroid/widget/") || build.ancestors.last().superclass!!.startsWith("Landroid/view/"))
        }
    }

    private fun flag(context: BytecodePatchContext, name: String) =
        (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.implementation!!.instructions.first()
            as NarrowLiteralInstruction).narrowLiteral

    private fun snapshot(context: BytecodePatchContext, classes: List<ClassDef>): ByteArray {
        val pool = DexPool(Opcodes.getDefault())
        classes.forEach { pool.internClass(context.mutableClassDefBy(it.type)) }
        val store = MemoryDataStore()
        try {
            pool.writeTo(store)
            return store.data
        } finally {
            store.close()
        }
    }

    private fun patched(context: BytecodePatchContext, method: Method) =
        context.mutableClassDefBy(method.definingClass).methods.single {
            it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
        }.implementation!!.instructions.toList()

    private fun registers(instruction: Instruction): List<Int> {
        val call = instruction as FiveRegisterInstruction
        return listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG).take(call.registerCount)
    }

    /** The code unit address of instruction [at]. */
    private fun address(instructions: List<Instruction>, at: Int) = instructions.take(at).sumOf { it.codeUnits }

    private fun onMeasure(type: String, flags: Int) = ImmutableMethod(type, "onMeasure",
        listOf(ImmutableMethodParameter("I", null, null), ImmutableMethodParameter("I", null, null)), "V", flags, null, null,
        ImmutableMethodImplementation(3, listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), null, null))

    private fun rename(owner: ClassDef, type: String) = ImmutableClassDef(type, owner.accessFlags, owner.superclass, owner.interfaces,
        owner.sourceFile, owner.annotations, emptyList(), owner.methods.map { method ->
            ImmutableMethod(type, method.name, method.parameters, method.returnType, method.accessFlags, method.annotations,
                method.hiddenApiRestrictions, method.implementation)
        })

    /** A copy of [owner] whose methods matching [which] carry [change]d instructions. */
    private fun replace(owner: ClassDef, which: (Method) -> Boolean, change: (List<Instruction>) -> List<Instruction>) =
        ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
            owner.annotations, owner.fields, owner.methods.map { method ->
                val instructions = method.implementation?.instructions?.toList()
                if (!which(method) || instructions == null) method else ImmutableMethod(method.definingClass, method.name, method.parameters,
                    method.returnType, method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                    ImmutableMethodImplementation(method.implementation!!.registerCount, change(instructions), null, null))
            })

    /**
     * The binder's class, the interface its topic arm casts the view to, the one class implementing
     * it, and that class's ancestors up to the first one outside the APK.
     */
    private fun read(build: File): Build {
        val binders = mutableListOf<ClassDef>()
        val parents = mutableMapOf<String, String?>()
        val implementers = mutableMapOf<String, MutableList<String>>()
        FixtureDex.forEach(build) { dex ->
            for (classDef in dex.classes) {
                parents.putIfAbsent(classDef.type, classDef.superclass)
                classDef.interfaces.forEach { implementers.getOrPut(it) { mutableListOf() } += classDef.type }
                if (classDef.methods.any { it.isTopicBinder() }) binders += ImmutableClassDef.of(classDef)
            }
        }
        val binder = binders.singleOrNull() ?: error("${build.name}: ${binders.size} topic row binders")
        val start = binder.methods.single { it.isTopicBinder() }.implementation!!.instructions.toList()[TOPIC_FALL_THROUGH]
        check(start.opcode == Opcode.CHECK_CAST) { "${build.name}: the topic arm starts with ${start.opcode}" }
        val face = ((start as ReferenceInstruction).reference as TypeReference).type
        val row = implementers[face]?.singleOrNull() ?: error("${build.name}: ${implementers[face]} implement $face")
        val ancestors = generateSequence(parents[row]) { parents[it] }.filter { it in parents }.toList()
        val classes = FixtureDex.classes(build, setOf(face, row) + ancestors)
        return Build(build.name, binder, classes.getValue(face), classes.getValue(row), ancestors.map(classes::getValue))
    }
}
