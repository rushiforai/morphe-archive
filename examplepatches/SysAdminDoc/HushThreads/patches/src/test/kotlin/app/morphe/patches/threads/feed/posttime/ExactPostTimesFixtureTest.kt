/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.feed.posttime

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.PerBuild
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Show exact post times on each declared build: the static function next to the post header's
 * time composable, the one that writes "3h", "2d" or a date, asks the extension first thing and
 * returns its answer unless that's null, when Threads' own code runs untouched. A second candidate
 * for the function, a second holder of the note, or a function that doesn't build a date is
 * refused before anything changes.
 */
class ExactPostTimesFixtureTest {
    @Test
    fun `each declared build asks the extension for a post header's time first`() {
        val extension = ExtensionDex.classDef(POST_TIME).methods.single { it.name == "exact" }
        assertTrue(AccessFlags.STATIC.isSet(extension.accessFlags) && AccessFlags.PUBLIC.isSet(extension.accessFlags))
        assertEquals("Landroid/content/Context;D", extension.parameterTypes.joinToString(""))
        assertEquals("Ljava/lang/String;", extension.returnType)
        val spokenExtension = ExtensionDex.classDef(POST_TIME).methods.single { it.name == "spoken" }
        assertTrue(AccessFlags.STATIC.isSet(spokenExtension.accessFlags) && AccessFlags.PUBLIC.isSet(spokenExtension.accessFlags))
        assertEquals("Ljava/lang/String;Landroid/content/Context;D", spokenExtension.parameterTypes.joinToString(""))
        assertEquals("Ljava/lang/String;", spokenExtension.returnType)

        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            // Read apart from the patch: one method holds the note, and it calls one static
            // function of its own class that takes a context and a double, answers a string
            // and builds a date from milliseconds.
            val holders = classes(build).flatMap { it.methods }.filter { method -> method.body().any { it.isNote() } }
            assertEquals("$where: methods holding the note", 1, holders.size)
            val composable = holders.single()
            val owned = composable.body().mapNotNull { it.getReference<MethodReference>() }.filter {
                it.definingClass == composable.definingClass &&
                    it.parameterTypes.joinToString("") == "Landroid/content/Context;D" && it.returnType == "Ljava/lang/String;"
            }.map { it.toString() }.distinct()
            assertEquals("$where: the composable's own time calls", 1, owned.size)
            val stock = classes(build).single { it.type == composable.definingClass }.methods.single { it.signature() == owned.single() }
            assertTrue(where, AccessFlags.STATIC.isSet(stock.accessFlags))
            assertTrue("$where: builds a date", stock.body().any { it.getReference<MethodReference>()?.toString() == DATE_FROM_MILLIS })
            val stockBody = stock.body()
            val locals = stock.implementation!!.registerCount - 3
            // A recent post's spoken time: the composable's one call of that shape into another
            // class, its answer kept by the move-result right after it.
            val composableBody = composable.body()
            val spokenCalls = composableBody.indices.filter { i ->
                val reference = composableBody[i].getReference<MethodReference>()
                reference != null && reference.definingClass != composable.definingClass &&
                    reference.parameterTypes.joinToString("") == "Landroid/content/Context;D" && reference.returnType == "Ljava/lang/String;"
            }
            assertEquals("$where: spoken time calls", 1, spokenCalls.size)
            val spokenCall = composableBody[spokenCalls.single()] as FiveRegisterInstruction
            val spokenArguments = when (spokenCall.opcode) {
                Opcode.INVOKE_VIRTUAL -> listOf(spokenCall.registerD, spokenCall.registerE, spokenCall.registerF)
                Opcode.INVOKE_STATIC -> listOf(spokenCall.registerC, spokenCall.registerD, spokenCall.registerE)
                else -> throw AssertionError("$where: the spoken time call is ${spokenCall.opcode}")
            }
            // It speaks for the same post the header shows: the header's own call got the same
            // context and the same two halves of the time.
            val headerCall = composableBody.single { it.getReference<MethodReference>()?.toString() == owned.single() } as FiveRegisterInstruction
            assertEquals(where, Opcode.INVOKE_STATIC, headerCall.opcode)
            assertEquals(where, listOf(headerCall.registerC, headerCall.registerD, headerCall.registerE), spokenArguments)
            assertEquals(where, spokenArguments[1] + 1, spokenArguments[2])
            val kept = composableBody[spokenCalls.single() + 1]
            assertEquals(where, Opcode.MOVE_RESULT_OBJECT, kept.opcode)
            val spokenResult = (kept as OneRegisterInstruction).registerA

            val context = context(build)
            assertEquals(where, 0, status(context))
            assertEquals(where, composable.signature(), context.postTimestampComposable().signature())
            assertEquals(where, stock.signature(), context.postTimeFormatter().signature())
            exactPostTimesPatch.execute(context)

            val patched = context.mutable(stock)
            val body = patched.body()
            assertEquals(where, stock.implementation!!.registerCount, patched.implementation!!.registerCount)
            assertEquals(where, stockBody.size + 4, body.size)
            // The context and both halves of the time, as the function got them.
            assertEquals(where, Opcode.INVOKE_STATIC_RANGE, body[0].opcode)
            assertEquals(where, EXACT, body[0].getReference<MethodReference>().toString())
            assertEquals(where, locals, (body[0] as RegisterRangeInstruction).startRegister)
            assertEquals(where, 3, (body[0] as RegisterRangeInstruction).registerCount)
            assertEquals(where, Opcode.MOVE_RESULT_OBJECT, body[1].opcode)
            assertEquals(where, 0, (body[1] as OneRegisterInstruction).registerA)
            // A null answer jumps over the return to Threads' first instruction.
            assertEquals(where, Opcode.IF_EQZ, body[2].opcode)
            assertEquals(where, 0, (body[2] as OneRegisterInstruction).registerA)
            assertEquals(where, 3, (body[2] as OffsetInstruction).codeOffset)
            assertEquals(where, Opcode.RETURN_OBJECT, body[3].opcode)
            assertEquals(where, 0, (body[3] as OneRegisterInstruction).registerA)
            assertEquals(where, stockBody.map { it.opcode }, body.drop(4).map { it.opcode })

            // The spoken time goes through the extension with the context and time Threads used,
            // and lands back in the register Threads reads it from. Nothing else in the composable moves.
            val patchedComposable = context.mutable(composable).body()
            assertEquals(where, composableBody.size + 2, patchedComposable.size)
            val hook = patchedComposable[spokenCalls.single() + 2] as FiveRegisterInstruction
            assertEquals(where, Opcode.INVOKE_STATIC, hook.opcode)
            assertEquals(where, SPOKEN, hook.getReference<MethodReference>().toString())
            assertEquals(where, listOf(spokenResult) + spokenArguments, listOf(hook.registerC, hook.registerD, hook.registerE, hook.registerF))
            assertEquals(where, 4, hook.registerCount)
            assertEquals(where, Opcode.MOVE_RESULT_OBJECT, patchedComposable[spokenCalls.single() + 3].opcode)
            assertEquals(where, spokenResult, (patchedComposable[spokenCalls.single() + 3] as OneRegisterInstruction).registerA)
            assertEquals(
                where,
                composableBody.map { it.opcode },
                patchedComposable.filterIndexed { i, _ -> i != spokenCalls.single() + 2 && i != spokenCalls.single() + 3 }.map { it.opcode },
            )
            assertEquals(where, 1, status(context))
        }
    }

    @Test
    fun `a second spoken time call is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val composable = context.mutable(context.postTimestampComposable())
            composable.addInstructions(
                0,
                "invoke-virtual { v0, v1, v2, v3 }, LX/HushThreadsOther;->other(Landroid/content/Context;D)Ljava/lang/String;",
            )
            val error = assertThrows(build.name, PatchException::class.java) { exactPostTimesPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("spoken time: expected exactly one match, found 2"))
            assertEquals(build.name, 0, status(context))
            assertFalse(build.name, context.postTimeFormatter().body().any { it.getReference<MethodReference>()?.toString() == EXACT })
            assertFalse(build.name, composable.body().any { it.getReference<MethodReference>()?.toString() == SPOKEN })
        }
    }

    @Test
    fun `a second time call of the composable's own is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val composable = context.mutable(context.postTimestampComposable())
            composable.addInstructions(
                0,
                "invoke-static { v0, v1, v2 }, ${composable.definingClass}->other(Landroid/content/Context;D)Ljava/lang/String;",
            )
            val error = assertThrows(build.name, PatchException::class.java) { exactPostTimesPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("expected exactly one match, found 2"))
            assertEquals(build.name, 0, status(context))
        }
    }

    @Test
    fun `a second holder of the note is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val formatter = context.mutable(context.postTimeFormatter())
            formatter.addInstructions(0, "const-string v0, \"${POST_TIMESTAMP_NOTE}99)\"")
            val error = assertThrows(build.name, PatchException::class.java) { exactPostTimesPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("expected exactly one match, found 2"))
            assertEquals(build.name, 0, status(context))
            assertFalse(build.name, formatter.body().any { it.getReference<MethodReference>()?.toString() == EXACT })
        }
    }

    @Test
    fun `a function that builds no date is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val formatter = context.mutable(context.postTimeFormatter())
            val date = formatter.body().indexOfFirst { it.getReference<MethodReference>()?.toString() == DATE_FROM_MILLIS }
            assertTrue(build.name, date >= 0)
            formatter.removeInstruction(date)
            val error = assertThrows(build.name, PatchException::class.java) { exactPostTimesPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("doesn't build a date"))
            assertEquals(build.name, 0, status(context))
            assertFalse(build.name, formatter.body().any { it.getReference<MethodReference>()?.toString() == EXACT })
        }
    }

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private fun Method.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    private fun Instruction.isNote() =
        opcode == Opcode.CONST_STRING && getReference<StringReference>()?.string?.startsWith(POST_TIMESTAMP_NOTE) == true

    private fun BytecodePatchContext.mutable(method: Method) = mutableClassDefBy(method.definingClass).findMutableMethodOf(method)

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + classes(build))

    private fun classes(build: File): List<ClassDef> = fixtures.getOrPut(build) {
        FixtureDex.classesWhere(build, { dex -> dex.stringSection.any { it.startsWith(POST_TIMESTAMP_NOTE) } }) { method ->
            method.implementation?.instructions?.any { it.isNote() } == true
        }
    }

    private fun status(context: BytecodePatchContext) = (context.mutableClassDefBy(SETTINGS_STATUS).methods
        .single { it.name == "exactPostTimes" }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral

    private companion object {
        /** One read of each build serves every test; each test patches its own copy. */
        val fixtures = PerBuild<List<ClassDef>>()
    }
}
