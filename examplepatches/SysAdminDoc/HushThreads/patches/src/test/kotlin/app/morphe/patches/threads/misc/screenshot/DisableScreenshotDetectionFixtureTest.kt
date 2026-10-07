/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.screenshot

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
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Disable screenshot detection on each declared build: one photo library observer, one screenshot
 * folder report and Threads' screen capture registrations, each found the way the patch finds
 * them, and each asking the extension with everything else left as Threads wrote it.
 */
class DisableScreenshotDetectionFixtureTest {
    @Test
    fun `each declared build asks the extension first in both watchers and routes its capture calls`() {
        for ((name, parameters, returns) in listOf(
            Triple("ignoresChange", "", "Z"),
            Triple("ignoresScreenshotFile", "", "Z"),
            Triple("registerScreenCaptureCallback", "Landroid/app/Activity;Ljava/util/concurrent/Executor;Landroid/app/Activity\$ScreenCaptureCallback;", "V"),
        )) {
            val method = ExtensionDex.classDef(SCREENSHOT_DETECTION).methods.single { it.name == name }
            assertTrue(name, AccessFlags.STATIC.isSet(method.accessFlags) && AccessFlags.PUBLIC.isSet(method.accessFlags))
            assertEquals(name, parameters, method.parameterTypes.joinToString(""))
            assertEquals(name, returns, method.returnType)
        }

        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val classes = FixtureDex.classesWhere(build, { true }) { method ->
                method.holdsString(SCREENSHOT_SELECTION) || method.holdsString(PATH_PARSE_FAIL) ||
                    captureIndices(method) { it == ACTIVITY }.isNotEmpty()
            }
            val methods = classes.flatMap { it.methods }
            // Read apart from the patch: the observer is a direct ContentObserver, the report the one
            // static method logging both of its messages, and every build asks Android once.
            val observers = methods.filter { it.holdsString(SCREENSHOT_SELECTION) }
            assertEquals("$where: observers", 1, observers.size)
            val observer = observers.single()
            assertEquals(where, "Landroid/database/ContentObserver;", classes.single { it.type == observer.definingClass }.superclass)
            assertTrue(where, observer.isObserverChange())
            val reports = methods.filter { it.holdsString(PATH_PARSE_FAIL) && it.holdsString(REPORTING) }
            assertEquals("$where: reports", 1, reports.size)
            val report = reports.single()
            assertTrue(where, report.isFolderReport())
            val callers = methods.filter { captureIndices(it) { type -> type == ACTIVITY }.isNotEmpty() }
            assertEquals("$where: capture callers", 1, callers.size)
            val caller = callers.single()
            val call = captureIndices(caller) { it == ACTIVITY }.single()
            val stockCall = caller.body()[call]

            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            assertEquals(where, 0, status(context))
            assertEquals(where, observer.signature(), context.libraryObserver().signature())
            assertEquals(where, report.signature(), context.folderReport().signature())
            disableScreenshotDetectionPatch.execute(context)

            for ((stock, check) in listOf(observer to IGNORES_CHANGE, report to IGNORES_FILE)) {
                val label = "$where ${stock.signature()}"
                // v0, which the check borrows, holds nothing Threads reads at the method's start.
                assertFalse(label, 0 in RegisterLiveness.of(stock).liveInto(0))
                val patched = context.mutable(stock)
                val body = patched.body()
                assertEquals(label, stock.implementation!!.registerCount, patched.implementation!!.registerCount)
                assertEquals(label, stock.body().size + 4, body.size)
                assertEquals(label, Opcode.INVOKE_STATIC, body[0].opcode)
                assertEquals(label, check, body[0].getReference<MethodReference>().toString())
                assertEquals(label, Opcode.MOVE_RESULT, body[1].opcode)
                assertEquals(label, 0, (body[1] as OneRegisterInstruction).registerA)
                assertEquals(label, Opcode.IF_EQZ, body[2].opcode)
                assertEquals(label, 0, (body[2] as OneRegisterInstruction).registerA)
                assertEquals(label, Opcode.RETURN_VOID, body[3].opcode)
                assertEquals(label, stock.body().map { it.opcode }, body.drop(4).map { it.opcode })
            }

            val routed = context.mutable(caller).body()
            assertEquals(where, caller.body().size, routed.size)
            assertEquals(where, Opcode.INVOKE_STATIC, routed[call].opcode)
            assertEquals(where, REGISTER_CAPTURE, routed[call].getReference<MethodReference>().toString())
            assertEquals(where, stockCall.registers(), routed[call].registers())
            assertTrue(where, captureIndices(context.mutable(caller)) { it == ACTIVITY }.isEmpty())
            assertEquals(where, 1, status(context))
        }
    }

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private fun Method.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    private fun Instruction.registers(): List<Int> = when (this) {
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        else -> error("$opcode has no argument registers")
    }

    private fun BytecodePatchContext.mutable(method: Method) = mutableClassDefBy(method.definingClass).methods.single {
        it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
    }

    private fun status(context: BytecodePatchContext) = (context.mutableClassDefBy(SETTINGS_STATUS).methods
        .single { it.name == "disableScreenshotDetection" }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral
}
