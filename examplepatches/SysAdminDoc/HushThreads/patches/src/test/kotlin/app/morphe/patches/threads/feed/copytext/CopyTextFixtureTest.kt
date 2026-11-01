/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.feed.copytext

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.PerBuild
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.threads.misc.extension.parameterRegisterNumber
import app.morphe.util.ControlFlow
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Copy text on long press on each declared build: each post row lambda's read of its long press
 * override goes through the extension, with the override's action, before it's checked, and PostText
 * asks the extension for its selection flag first thing. A jump straight to an override check, or
 * a selection flag written over before PostText reads it, is refused before anything changes.
 */
class CopyTextFixtureTest {
    @Test
    fun `each declared build hands the post row's overrides and PostText's selection flag to the extension`() {
        val extension = ExtensionDex.classDef(COPY_TEXT)
        val longPress = extension.methods.single { it.name == "longPress" }
        assertTrue(AccessFlags.STATIC.isSet(longPress.accessFlags) && AccessFlags.PUBLIC.isSet(longPress.accessFlags))
        assertEquals("Ljava/lang/Object;Ljava/lang/Object;", longPress.parameterTypes.joinToString(""))
        assertEquals("Ljava/lang/Object;", longPress.returnType)
        val selection = extension.methods.single { it.name == "selection" }
        assertTrue(AccessFlags.STATIC.isSet(selection.accessFlags) && AccessFlags.PUBLIC.isSet(selection.accessFlags))
        assertEquals("Z", selection.parameterTypes.joinToString(""))
        assertEquals("Z", selection.returnType)

        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val context = context(build)
            val overrides = context.longPressOverrides()
            val flag = context.selectionFlag()
            // The post's text and its link preview, each in a lambda of its own.
            assertEquals(where, 2, overrides.size)
            assertEquals(where, 2, overrides.map { it.method.definingClass }.distinct().size)
            val stock = overrides.map { it.method.body() }
            val registers = overrides.map { it.method.implementation!!.registerCount }
            val textStock = flag.method.body()

            for ((i, override) in overrides.withIndex()) {
                // Read apart from the patch: the lambda reads a field of its own and checks it for
                // null, and past that check it reads the override's Function0 and checks that.
                val read = stock[i][override.read]
                assertEquals(where, Opcode.IGET_OBJECT, read.opcode)
                val field = read.getReference<FieldReference>()!!
                assertEquals(where, override.method.definingClass, field.definingClass)
                assertEquals(where, field.type, override.action.definingClass)
                assertEquals(where, "Lkotlin/jvm/functions/Function0;", override.action.type)
                assertTrue(where, stock[i][override.guard].opcode in setOf(Opcode.IF_NEZ, Opcode.IF_EQZ))
                assertEquals(where, override.register, (stock[i][override.guard] as OneRegisterInstruction).registerA)
                assertEquals(where, override.register, (read as TwoRegisterInstruction).registerA)
                assertTrue(where, override.free != override.register)
            }
            assertEquals(where, 1, overrides.map { it.action.toString() }.distinct().size)
            // The selection flag is PostText's thirteenth boolean, copied once and then tested: 65 on 451,
            // and 68 on 452, which adds two lambdas and an int ahead of the booleans and one boolean after it.
            val booleans = flag.method.parameterTypes.indices.filter { flag.method.parameterTypes[it].toString() == "Z" }
            assertEquals(where, booleans[12], flag.parameter)
            assertEquals(where, "Z", flag.method.parameterTypes[flag.parameter].toString())
            assertEquals(where, Opcode.IF_EQZ, textStock[flag.check].opcode)
            val noteAt = textStock.indexOfFirst { it.getReference<StringReference>()?.string?.startsWith(SELECTION_NOTE) == true }
            assertTrue(where, noteAt in 0 until flag.check)
            assertEquals(where, flag.method.parameterRegisterNumber(flag.parameter),
                (textStock[flag.copy] as TwoRegisterInstruction).registerB)

            copyTextPatch.execute(context)

            for ((i, override) in overrides.withIndex()) {
                val row = context.mutable(override.method)
                val body = row.body()
                assertEquals(where, registers[i], row.implementation!!.registerCount)
                assertEquals(where, stock[i].size + 5, body.size)
                val at = override.guard
                assertEquals(where, Opcode.IF_EQZ, body[at].opcode)
                assertEquals(where, override.register, (body[at] as OneRegisterInstruction).registerA)
                // A null override skips straight to Threads' own check, untouched.
                assertTrue(where, at + 5 in ControlFlow.of(row).normal[at])
                assertEquals(where, Opcode.IGET_OBJECT, body[at + 1].opcode)
                assertEquals(where, override.action.toString(), body[at + 1].getReference<FieldReference>().toString())
                assertEquals(where, override.free, (body[at + 1] as TwoRegisterInstruction).registerA)
                assertEquals(where, override.register, (body[at + 1] as TwoRegisterInstruction).registerB)
                assertEquals(where, Opcode.INVOKE_STATIC, body[at + 2].opcode)
                assertEquals(where, LONG_PRESS, body[at + 2].getReference<MethodReference>().toString())
                val call = body[at + 2] as FiveRegisterInstruction
                assertEquals(where, listOf(override.register, override.free), listOf(call.registerC, call.registerD))
                assertEquals(where, Opcode.MOVE_RESULT_OBJECT, body[at + 3].opcode)
                assertEquals(where, override.register, (body[at + 3] as OneRegisterInstruction).registerA)
                assertEquals(where, Opcode.CHECK_CAST, body[at + 4].opcode)
                assertEquals(where, override.action.definingClass, body[at + 4].getReference<TypeReference>()!!.type)
                // Threads' check reads the answer.
                assertEquals(where, stock[i][at].opcode, body[at + 5].opcode)
                assertEquals(where, override.register, (body[at + 5] as OneRegisterInstruction).registerA)
                assertEquals(where, stock[i].map { it.opcode }, body.take(at).map { it.opcode } + body.drop(at + 5).map { it.opcode })
            }

            val text = context.mutable(flag.method)
            val textBody = text.body()
            val register = flag.method.parameterRegisterNumber(flag.parameter)
            assertEquals(where, textStock.size + 2, textBody.size)
            assertEquals(where, Opcode.INVOKE_STATIC_RANGE, textBody[0].opcode)
            assertEquals(where, SELECTION, textBody[0].getReference<MethodReference>().toString())
            assertEquals(where, register, (textBody[0] as RegisterRangeInstruction).startRegister)
            assertEquals(where, 1, (textBody[0] as RegisterRangeInstruction).registerCount)
            // The answer goes back in the flag's own register and nowhere else.
            assertEquals(where, Opcode.MOVE_RESULT, textBody[1].opcode)
            assertEquals(where, register, (textBody[1] as OneRegisterInstruction).registerA)
            assertEquals(where, textStock.map { it.opcode }, textBody.drop(2).map { it.opcode })
        }
    }

    @Test
    fun `a selection flag written over before PostText copies it is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val flag = context.selectionFlag()
            val register = flag.method.parameterRegisterNumber(flag.parameter)
            context.mutable(flag.method).addInstructions(flag.copy, "const/16 v$register, 0x1")
            val error = assertThrows(build.name, PatchException::class.java) { copyTextPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("writes over parameter ${flag.parameter}"))
            assertFalse(build.name, context.mutable(flag.method).body().any { it.calls(SELECTION) })
            // Refused before any lambda changed too.
            for (override in context.longPressOverrides()) {
                assertFalse(build.name, context.mutable(override.method).body().any { it.calls(LONG_PRESS) })
            }
        }
    }

    @Test
    fun `a jump straight to an override check is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val overrides = context.longPressOverrides()
            val method = overrides.first().method
            // In front of everything, a jump that lands on the check without the read before it.
            method.addInstructionsWithLabels(0, "goto :check", ExternalLabel("check", method.getInstruction(overrides.first().guard)))
            val error = assertThrows(build.name, PatchException::class.java) { copyTextPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("not only from the read"))
            for (override in overrides) {
                assertFalse(build.name, context.mutable(override.method).body().any { it.calls(LONG_PRESS) })
            }
            assertFalse(build.name, context.selectionFlag().method.body().any { it.calls(SELECTION) })
        }
    }
    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private fun Instruction.calls(method: String) = getReference<MethodReference>()?.toString() == method

    private fun BytecodePatchContext.mutable(method: Method) = mutableClassDefBy(method.definingClass).findMutableMethodOf(method)

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + classes(build))

    private fun classes(build: File): List<ClassDef> = fixtures.getOrPut(build) {
        FixtureDex.classesWhere(build, { dex -> dex.stringSection.any { it.startsWith(POST_ROW_NOTE) || it.startsWith(SELECTION_NOTE) } }) { method ->
            method.implementation?.instructions?.any { instruction ->
                instruction.getReference<StringReference>()?.string?.let { it.startsWith(POST_ROW_NOTE) || it.startsWith(SELECTION_NOTE) } == true
            } == true
        }
    }

    private companion object {
        /** One read of each build serves every test; each test patches its own copy. */
        val fixtures = PerBuild<List<ClassDef>>()
    }
}
