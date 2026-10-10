/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.profile

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
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import app.morphe.patches.threads.misc.extension.parameterRegisterNumber
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Hide the Instagram button on each declared build: the profile header's button row, the one
 * method that tags the Instagram button, asks the extension for the button's flag first thing, and
 * the check that skips the button still reads that flag. Anything that would make the hook miss
 * the check, or the check miss the button, is refused before the method changes.
 */
class HideInstagramButtonFixtureTest {
    @Test
    fun `each declared build asks the extension whether its profile header draws the Instagram button`() {
        val extension = ExtensionDex.classDef(INSTAGRAM_BUTTON).methods.single { it.name == "show" }
        assertTrue(AccessFlags.STATIC.isSet(extension.accessFlags) && AccessFlags.PUBLIC.isSet(extension.accessFlags))
        assertEquals("Z", extension.parameterTypes.joinToString(""))
        assertEquals("Z", extension.returnType)

        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            // Read apart from the patch: one method sets the tag, once, and the last branch in
            // front of it is an if-eqz on a boolean parameter that jumps past it.
            val holders = classes(build).flatMap { it.methods }.filter { method -> method.body().any { it.isInstagramButtonTag() } }
            assertEquals("$where: methods setting the tag", 1, holders.size)
            val stock = holders.single()
            val stockBody = stock.body()
            assertEquals("$where: tags", 1, stockBody.count { it.isInstagramButtonTag() })
            val tag = stockBody.indexOfFirst { it.isInstagramButtonTag() }
            val guard = (tag - 1 downTo 0).first { stockBody[it] is OffsetInstruction }
            assertEquals(where, Opcode.IF_EQZ, stockBody[guard].opcode)
            val register = (stockBody[guard] as OneRegisterInstruction).registerA
            val parameter = stock.parameterTypes.indices.single { stock.parameterRegisterNumber(it) == register }
            assertEquals("$where: the flag", "Z", stock.parameterTypes[parameter].toString())
            // The sixth of its nine booleans on 450.
            assertEquals(where, 24, parameter)

            val context = context(build)
            assertEquals(where, 0, status(context))
            val row = context.buttonRow()
            assertEquals(where, stock.signature(), row.method.signature())
            assertEquals(where, parameter, row.parameter)
            assertEquals(where, guard, row.guard)
            assertEquals(where, tag, row.tag)
            hideInstagramButtonPatch.execute(context)

            val patched = context.mutableClassDefBy(stock.definingClass).methods.single { it.signature() == stock.signature() }
            val body = patched.body()
            assertEquals(where, stock.implementation!!.registerCount, patched.implementation!!.registerCount)
            assertEquals(where, stockBody.size + 2, body.size)
            assertEquals(where, Opcode.INVOKE_STATIC_RANGE, body[0].opcode)
            assertEquals(where, SHOW, body[0].getReference<MethodReference>().toString())
            assertEquals(where, register, (body[0] as RegisterRangeInstruction).startRegister)
            assertEquals(where, 1, (body[0] as RegisterRangeInstruction).registerCount)
            // The answer goes back in the flag's own register and nowhere else.
            assertEquals(where, Opcode.MOVE_RESULT, body[1].opcode)
            assertEquals(where, register, (body[1] as OneRegisterInstruction).registerA)
            assertEquals(where, stockBody.map { it.opcode }, body.drop(2).map { it.opcode })
            // The check that skips the button reads the answer.
            assertEquals(where, Opcode.IF_EQZ, body[guard + 2].opcode)
            assertEquals(where, register, (body[guard + 2] as OneRegisterInstruction).registerA)
            assertEquals(where, 1, status(context))
        }
    }

    @Test
    fun `a flag written over before its check is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val row = context.buttonRow()
            val register = row.method.parameterRegisterNumber(row.parameter)
            context.mutable(row.method).addInstructions(row.guard, "const/16 v$register, 0x1")
            val error = assertThrows(build.name, PatchException::class.java) { hideInstagramButtonPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("writes over parameter ${row.parameter}"))
            assertEquals(build.name, 0, status(context))
            assertFalse(build.name, context.mutable(row.method).body().any { it.calls(SHOW) })
        }
    }

    @Test
    fun `a second Instagram button tag is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val row = context.buttonRow()
            val method = context.mutable(row.method)
            val register = (method.body()[row.tag] as OneRegisterInstruction).registerA
            method.addInstructions(row.tag + 1, "const-string v$register, \"$INSTAGRAM_BUTTON_TAG\"")
            val error = assertThrows(build.name, PatchException::class.java) { hideInstagramButtonPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("expected exactly one match, found 2"))
            assertEquals(build.name, 0, status(context))
        }
    }

    @Test
    fun `a jump into the button past its check is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val row = context.buttonRow()
            val method = context.mutable(row.method)
            method.addInstructionsWithLabels(0, "goto :button", ExternalLabel("button", method.getInstruction(row.tag)))
            val error = assertThrows(build.name, PatchException::class.java) { hideInstagramButtonPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("not only past the check"))
            assertEquals(build.name, 0, status(context))
        }
    }

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private fun Method.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    private fun Instruction.calls(method: String) = getReference<MethodReference>()?.toString() == method

    private fun BytecodePatchContext.mutable(method: Method) = mutableClassDefBy(method.definingClass).findMutableMethodOf(method)

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + classes(build))

    private fun classes(build: File): List<ClassDef> = fixtures.getOrPut(build) {
        FixtureDex.classesWhere(build, { dex -> INSTAGRAM_BUTTON_TAG in dex.stringSection }) { method ->
            method.implementation?.instructions?.any { it.isInstagramButtonTag() } == true
        }
    }

    private fun status(context: BytecodePatchContext) = (context.mutableClassDefBy(SETTINGS_STATUS).methods
        .single { it.name == "hideInstagramButton" }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral

    private companion object {
        /** One read of each build serves every test; each test patches its own copy. */
        val fixtures = mutableMapOf<File, List<ClassDef>>()
    }
}
