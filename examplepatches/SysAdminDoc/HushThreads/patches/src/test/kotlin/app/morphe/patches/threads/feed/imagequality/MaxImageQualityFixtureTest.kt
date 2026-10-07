/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.feed.imagequality

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import app.morphe.util.RegisterLiveness
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Max image quality on each declared build: Threads' one photo size chooser, found the way the
 * patch finds it, asks the extension for its target width first thing, and everything after reads
 * that answer where it read Threads' own width.
 */
class MaxImageQualityFixtureTest {
    @Test
    fun `each declared build hands its photo size chooser's target width to the extension first`() {
        val extension = ExtensionDex.classDef(IMAGE_QUALITY).methods.single { it.name == "targetWidth" }
        assertTrue(AccessFlags.STATIC.isSet(extension.accessFlags) && AccessFlags.PUBLIC.isSet(extension.accessFlags))
        assertEquals("I", extension.parameterTypes.joinToString(""))
        assertEquals("I", extension.returnType)

        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val classes = FixtureDex.classesWhere(build, { true }) { it.isSizeChooserShape() }
            // Read apart from the patch: one method has the chooser's signature, and it aims a
            // twentieth past its last parameter.
            val choosers = classes.flatMap { it.methods }.filter { it.isSizeChooserShape() }
            assertEquals("$where: choosers", 1, choosers.size)
            val stock = choosers.single()
            val width = stock.implementation!!.registerCount - 1
            val stockBody = stock.body()
            assertEquals("$where: one twentieth of the width", 1, stockBody.count {
                it.opcode == Opcode.DIV_INT_LIT8 && (it as TwoRegisterInstruction).registerB == width &&
                    (it as NarrowLiteralInstruction).narrowLiteral == 20
            })
            // The width the hook rewrites is read later, so its answer is the one Threads aims at.
            assertTrue(where, width in RegisterLiveness.of(stock).liveInto(0))

            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            assertEquals(where, 0, status(context))
            assertEquals(where, stock.signature(), context.sizeChooser().signature())
            maxImageQualityPatch.execute(context)

            val patched = context.mutableClassDefBy(stock.definingClass).methods.single { it.signature() == stock.signature() }
            val body = patched.body()
            assertEquals(where, stock.implementation!!.registerCount, patched.implementation!!.registerCount)
            assertEquals(where, stockBody.size + 2, body.size)
            assertEquals(where, Opcode.INVOKE_STATIC_RANGE, body[0].opcode)
            assertEquals(where, TARGET_WIDTH, body[0].getReference<MethodReference>().toString())
            assertEquals(where, width, (body[0] as RegisterRangeInstruction).startRegister)
            assertEquals(where, 1, (body[0] as RegisterRangeInstruction).registerCount)
            // The answer goes back in the width's own register and nowhere else.
            assertEquals(where, Opcode.MOVE_RESULT, body[1].opcode)
            assertEquals(where, width, (body[1] as OneRegisterInstruction).registerA)
            assertEquals(where, stockBody.map { it.opcode }, body.drop(2).map { it.opcode })
            assertEquals(where, 1, status(context))
        }
    }

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private fun Method.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    private fun status(context: BytecodePatchContext) = (context.mutableClassDefBy(SETTINGS_STATUS).methods
        .single { it.name == "maxImageQuality" }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral
}
