/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.extension

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * The extension patch on each declared build: SoLoader's flags reach the extension before SoLoader
 * reads them, with the method otherwise as Threads wrote it, and SoLoader still chooses its direct
 * read by the bit the extension clears.
 */
class SoLoaderFlagsFixtureTest {
    @Test
    fun `each declared build sends SoLoader's flags through the extension first`() {
        val helper = ExtensionDex.classDef(NATIVE_LIBRARIES).methods.single { it.name == "soLoaderFlags" }
        assertTrue(AccessFlags.STATIC.isSet(helper.accessFlags) && AccessFlags.PUBLIC.isSet(helper.accessFlags))
        assertEquals(SO_LOADER_FLAGS, "$NATIVE_LIBRARIES->soLoaderFlags(${helper.parameterTypes.joinToString("")})${helper.returnType}")

        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val classes = FixtureDex.classesWhere(build, { true }) { it.holdsBothMessages() }
            val inits = classes.flatMap { it.methods }.filter { it.holdsBothMessages() }
            assertEquals("$where: methods holding both messages", 1, inits.size)
            val stock = inits.single()
            assertTrue(where, AccessFlags.STATIC.isSet(stock.accessFlags))
            assertEquals(where, "Landroid/content/Context;", stock.parameterTypes.first().toString())
            assertEquals(where, "I", stock.parameterTypes.last().toString())
            assertEquals(where, 4, stock.parameterTypes.size)

            val registers = stock.implementation!!.registerCount
            val context = registers - 4
            val flags = registers - 1
            assertTrue("$where: SoLoader no longer tests the direct read", stock.testsDirectRead(flags))

            val patchContext = PatchContexts.of(ExtensionDex.classes() + classes + applicationChain(build))
            SoLoaderInitFingerprint.clearMatch()
            threadsExtensionPatch.execute(patchContext)

            val patched = patchContext.mutableClassDefBy(stock.definingClass).methods.single {
                it.name == stock.name && it.parameterTypes == stock.parameterTypes
            }
            assertEquals(where, registers, patched.implementation!!.registerCount)
            val body = patched.body()
            assertEquals(where, stock.body().size + 5, body.size)
            assertEquals(where, Opcode.MOVE_OBJECT_FROM16, body[0].opcode)
            assertEquals(where, context, (body[0] as TwoRegisterInstruction).registerB)
            assertEquals(where, Opcode.MOVE_FROM16, body[1].opcode)
            assertEquals(where, flags, (body[1] as TwoRegisterInstruction).registerB)
            assertEquals(where, Opcode.INVOKE_STATIC, body[2].opcode)
            assertEquals(where, SO_LOADER_FLAGS, body[2].getReference<MethodReference>().toString())
            assertEquals(
                where,
                listOf((body[0] as OneRegisterInstruction).registerA, (body[1] as OneRegisterInstruction).registerA),
                (body[2] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) },
            )
            assertEquals(where, Opcode.MOVE_RESULT, body[3].opcode)
            assertEquals(where, Opcode.MOVE_FROM16, body[4].opcode)
            assertEquals(where, flags, (body[4] as OneRegisterInstruction).registerA)
            assertEquals(where, (body[3] as OneRegisterInstruction).registerA, (body[4] as TwoRegisterInstruction).registerB)
            assertEquals(where, stock.body().map { it.opcode }, body.drop(5).map { it.opcode })
        }
    }

    /** The application and its parents in the APK, which the extension patch walks to find `onCreate()`. */
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

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private fun Method.holdsBothMessages() = holdsString(ALREADY_INITIALIZED) && holdsString(INITIALIZING)

    private fun Method.holdsString(text: String) = implementation?.instructions?.any { instruction ->
        (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
            instruction.getReference<StringReference>()?.string == text
    } ?: false

    private fun Method.testsDirectRead(flags: Int) = body().any { instruction ->
        instruction.opcode == Opcode.AND_INT_LIT16 && (instruction as TwoRegisterInstruction).registerB == flags &&
            (instruction as NarrowLiteralInstruction).narrowLiteral == DIRECT_READ
    }

    private companion object {
        const val ALREADY_INITIALIZED = "SoLoader already initialized"
        const val INITIALIZING = "Initializing SoLoader: "
        const val DIRECT_READ = 0x400
    }
}
