/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.analytics

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.ads.MESSAGES_CONTROLLER
import app.morphe.patches.telegram.misc.extension.CONNECTIONS_MANAGER
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SEND_REQUEST_INTERNAL
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Disable analytics on each declared build: the channel view's read metrics sender is there, found
 * by what it builds rather than by name, and the patch, run over the build's own classes, puts the
 * extension's question in front of it and leaves the rest of the method alone. Telegram 13.0
 * dropped the old storage report, and a test here keeps watch in case it comes back.
 */
class DisableAnalyticsFixtureTest {
    private val analytics = "Lapp/hushtelegram/extension/telegram/misc/Analytics;"

    @Test
    fun `the old storage report is gone from each declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val controller = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER)).getValue(MESSAGES_CONTROLLER)
            assertTrue("${build.name}: logDeviceStats is back", controller.methods.none { it.name == "logDeviceStats" })
            val senders = FixtureDex.classesWhere(build, { true }) { method ->
                method.instructions().any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "android_sdcard_exists" }
            }
            assertEquals("${build.name}: nothing builds the storage event", emptyList<String>(), senders.map { it.type })
        }
    }

    @Test
    fun `each declared build has the read metrics report, and the patch hooks it with nothing left to warn about`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val metricsClass = FixtureDex.classesWhere(build, { true }, ::sendsReadMetrics).single()
            val metrics = metricsClass.methods.single(::sendsReadMetrics)

            val appLogClasses = FixtureDex.classesWhere(build, { true }) { method ->
                method.instructions().any { it.opcode == Opcode.NEW_INSTANCE &&
                    (it as? ReferenceInstruction)?.reference?.toString() == SAVE_APP_LOG }
            }
            val context = PatchContexts.of(ExtensionDex.classes() + (appLogClasses + metricsClass + ghostModeHosts(build)).distinctBy { it.type })
            val warnings = PatchLogCapture.warnings { disableAnalyticsPatch.execute(context) }
            assertEquals("$where: the patch log", emptyList<String>(), warnings)

            assertReadMetricsHooked(
                "$where: read metrics", metrics,
                context.mutableClassDefBy(metricsClass.type).methods.single { it.sameSignatureAs(metrics) },
            )

            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods
                .single { it.name == "disableAnalytics" }.instructions()
            assertEquals("$where: SettingsStatus.disableAnalytics() answers true first", Opcode.CONST_4, status[0].opcode)
            assertEquals(1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.RETURN, status[1].opcode)
            // A family flag alone can't prove the target was inserted.
            val capability = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "readMetrics" }.instructions()
            assertEquals("$where: readMetrics is an injected build fact", Opcode.CONST_4, capability[0].opcode)
            assertEquals("$where: missing readMetrics coverage", 1, (capability[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.RETURN, capability[1].opcode)

            val connections = ghostModeHosts(build).single()
            GhostModeFixtureTest.assertGhostGate(
                "$where: request send", connections.methods.single { it.name == SEND_REQUEST_INTERNAL },
                context.mutableClassDefBy(CONNECTIONS_MANAGER).methods.single { it.name == SEND_REQUEST_INTERNAL },
            )
            val ghost = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "ghostMode" }.instructions()
            assertEquals("$where: ghostMode is an injected build fact", 1, (ghost[0] as NarrowLiteralInstruction).narrowLiteral)
        }
    }
    /**
     * [patched] hands the extension the batch it just found not empty, the same register the
     * emptiness check read, right before building the request, and returns on true. Nothing else
     * moved.
     */
    private fun assertReadMetricsHooked(where: String, original: Method, patched: Method) {
        val before = original.instructions()
        val after = patched.instructions()
        assertEquals("$where: instructions added", before.size + 5, after.size)
        val hook = after.indexOfFirst {
            it.opcode == Opcode.INVOKE_STATIC && (it as ReferenceInstruction).reference.toString() == "$analytics->skipReadMetrics(Ljava/util/List;)Z"
        }
        assertTrue("$where: asks the extension", hook > 0)
        assertEquals(
            listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID, Opcode.NOP, Opcode.NEW_INSTANCE),
            after.subList(hook + 1, hook + 6).map { it.opcode },
        )
        assertEquals(REPORT_READ_METRICS, (after[hook + 5] as ReferenceInstruction).reference.toString())
        val check = after.subList(0, hook).indexOfLast {
            it.opcode == Opcode.INVOKE_VIRTUAL && (it as ReferenceInstruction).reference.toString() == "Ljava/util/ArrayList;->isEmpty()Z"
        }
        assertTrue("$where: the batch was checked just before", check in hook - 3 until hook)
        assertEquals(
            "$where: the hook gets the batch the check read",
            (after[check] as FiveRegisterInstruction).registerC, (after[hook] as FiveRegisterInstruction).registerC,
        )
        assertEquals("$where: nothing else moved", before.map { it.opcode }, (after.subList(0, hook) + after.subList(hook + 5, after.size)).map { it.opcode })
    }

    private fun sendsReadMetrics(method: Method) = method.parameterTypes.isEmpty() && method.returnType == "V" &&
        method.instructions().any { it.opcode == Opcode.NEW_INSTANCE && (it as ReferenceInstruction).reference.toString() == REPORT_READ_METRICS }

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Method.sameSignatureAs(other: Method) = name == other.name && returnType == other.returnType &&
        parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }
}
