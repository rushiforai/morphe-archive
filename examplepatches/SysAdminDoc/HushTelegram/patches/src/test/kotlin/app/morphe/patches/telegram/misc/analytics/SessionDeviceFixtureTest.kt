/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.analytics

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.extension.CONNECTIONS_MANAGER
import app.morphe.patches.telegram.misc.extension.parameterRegister
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origString
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The device in Active sessions on each declared build (#79): ConnectionsManager.init takes the
 * device name and system version its constructor built and moves both straight into native_init,
 * and the patch runs each through the extension at init's top, in the parameter's own register.
 */
class SessionDeviceFixtureTest {
    @Test
    fun `each declared build passes init's device name and system version through the extension first`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + ghostModeHosts(build))
            val site = context.resolveSessionDevice()
            assertEquals(where, CONNECTIONS_MANAGER, site.method.origDefiningClass)
            assertEquals(where, "init", site.method.origName)
            val model = site.method.parameterRegisterNumber(INIT_MODEL_PARAMETER)
            val system = site.method.parameterRegisterNumber(INIT_SYSTEM_PARAMETER)
            assertEquals("$where: the system version is the next register", model + 1, system)
            // this, then the build number: the first declared parameter sits right past the locals plus one.
            val version = site.method.parameterRegisterNumber(INIT_VERSION_PARAMETER)
            assertEquals("$where: the build number is three registers before the device name", model - 3, version)
            val before = site.method.instructions()

            site.apply()
            val after = site.method.instructions()
            assertEquals(where, before.size + 6, after.size)
            for ((at, register, hook, result) in listOf(
                Hooked(0, model, SESSION_DEVICE_MODEL, Opcode.MOVE_RESULT_OBJECT),
                Hooked(2, system, SESSION_DEVICE_SYSTEM, Opcode.MOVE_RESULT_OBJECT),
                Hooked(4, version, SESSION_DEVICE_VERSION, Opcode.MOVE_RESULT))) {
                val call = after[at]
                assertEquals("$where: $hook", Opcode.INVOKE_STATIC_RANGE, call.opcode)
                assertEquals(hook, (call as ReferenceInstruction).reference.origString())
                assertEquals("$where: the hook gets init's own value", register, (call as RegisterRangeInstruction).startRegister)
                assertEquals(1, call.registerCount)
                assertEquals("$where: $hook", result, after[at + 1].opcode)
                assertEquals("$where: the answer replaces it", register, (after[at + 1] as OneRegisterInstruction).registerA)
            }
            assertEquals("$where: stock code kept in order", before.map { it.opcode }, after.drop(6).map { it.opcode })
        }
    }

    @Test
    fun `an init that writes over the device name before the native call is left alone`() {
        val build = Fixtures.declaredBuilds().first()
        val context = PatchContexts.of(ExtensionDex.classes() + ghostModeHosts(build))
        val init = context.resolveSessionDevice().method
        init.addInstructions(0, "const-string ${init.parameterRegister(INIT_MODEL_PARAMETER)}, \"stock\"")
        assertThrows(PatchException::class.java) { context.resolveSessionDevice() }
    }

    @Test
    fun `an init that writes over the build number before the native call is left alone`() {
        val build = Fixtures.declaredBuilds().first()
        val context = PatchContexts.of(ExtensionDex.classes() + ghostModeHosts(build))
        val init = context.resolveSessionDevice().method
        // init has more registers than a 4-bit or 8-bit form can name, so the layer goes over it with move/16.
        init.addInstructions(0, "move/16 ${init.parameterRegister(INIT_VERSION_PARAMETER)}, ${init.parameterRegister(1)}")
        val refused = assertThrows(PatchException::class.java) { context.resolveSessionDevice() }
        assertTrue(refused.message, "build number" in refused.message.orEmpty())
    }

    private data class Hooked(val at: Int, val register: Int, val hook: String, val result: Opcode)

    @Test
    fun `the whole patch claims the device in Active sessions, and a build without ConnectionsManager goes on without it`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val metrics = FixtureDex.classesWhere(build, { true }) { method ->
                method.instructions().any { it.opcode == Opcode.NEW_INSTANCE &&
                    (it as ReferenceInstruction).reference.origString() == REPORT_READ_METRICS }
            }
            val context = PatchContexts.of(ExtensionDex.classes() + (metrics + ghostModeHosts(build)).distinctBy { it.type })
            val warnings = PatchLogCapture.warnings { disableAnalyticsPatch.execute(context) }
            assertTrue("$where: $warnings", warnings.none { "Active sessions" in it })
            assertFlag(context, "sessionDevice", true)

            val without = PatchContexts.of(ExtensionDex.classes() + metrics)
            val missing = PatchLogCapture.warnings { disableAnalyticsPatch.execute(without) }
            assertTrue("$where: $missing", missing.any { "ConnectionsManager is missing" in it && "without the device in Active sessions" in it })
            assertFlag(without, "sessionDevice", false)
        }
    }

    private fun assertFlag(context: BytecodePatchContext, name: String, expected: Boolean) {
        val body = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.instructions()
        assertEquals(name, if (expected) 1 else 0, (body[0] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, body[1].opcode)
    }

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
}
