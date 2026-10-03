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
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Disable analytics on each declared build: the messages controller's `logDeviceStats()` and the
 * channel view's read metrics sender are there, found by what they read and build rather than by
 * name, and the patch, run over the build's own classes, puts the extension's question in front of
 * each and leaves the rest of the method alone.
 */
class DisableAnalyticsFixtureTest {
    private val analytics = "Lapp/hushtelegram/extension/telegram/misc/Analytics;"

    @Test
    fun storageReportEncodesRootClassificationAsBooleanAndPeerZeroOrOne() {
        for (build in Fixtures.declaredBuilds()) {
            val controller = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER)).getValue(MESSAGES_CONTROLLER)
            val method = controller.methods.single {
                it.name == "logDeviceStats" && it.parameterTypes.isEmpty() && it.returnType == "V"
            }
            val body = method.instructions()
            val references = body.map { (it as? ReferenceInstruction)?.reference?.toString() }
            val json = "Lorg/telegram/tgnet/TLRPC\$TL_jsonBool;"
            val event = "Lorg/telegram/tgnet/TLRPC\$TL_inputAppEvent;"
            val classification = references.indices.single {
                references[it] == "Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z"
            }
            assertEquals("emulated-storage classification, not existence or paths", "/storage/emulated/",
                references[classification - 1])
            assertEquals(Opcode.CONST_STRING, body[classification - 1].opcode)
            assertEquals(body[classification - 1].namedRegisters().single(),
                body[classification].namedRegisters()[1])
            assertEquals(Opcode.MOVE_RESULT, body[classification + 1].opcode)
            val booleanRegister = body[classification + 1].namedRegisters().single()
            val value = references.indices.single { references[it] == "$json->value:Z" }
            assertEquals(Opcode.IPUT_BOOLEAN, body[value].opcode)
            assertEquals(booleanRegister, body[value].namedRegisters()[0])
            val jsonRegister = body[value].namedRegisters()[1]
            val allocation = references.indices.single { references[it] == json && body[it].opcode == Opcode.NEW_INSTANCE }
            assertEquals(jsonRegister, body[allocation].namedRegisters().single())
            val data = references.indices.single {
                references[it] == "$event->data:Lorg/telegram/tgnet/TLRPC\$JSONValue;"
            }
            assertEquals(Opcode.IPUT_OBJECT, body[data].opcode)
            assertEquals("only the boolean object becomes event data", jsonRegister, body[data].namedRegisters()[0])
            assertTrue(value in classification + 2 until data)
            assertTrue("the computed boolean survives until serialization", body.subList(classification + 2, value).none {
                it.opcode.setsRegister() && (it.namedRegisters().firstOrNull() == booleanRegister ||
                    it.opcode.setsWideRegister() && it.namedRegisters().firstOrNull()?.plus(1) == booleanRegister)
            })
            val peer = references.indices.single { references[it] == "$event->peer:J" }
            assertEquals(Opcode.IF_EQZ, body[peer - 4].opcode)
            assertEquals(booleanRegister, body[peer - 4].namedRegisters().single())
            assertEquals(1L, (body[peer - 3] as WideLiteralInstruction).wideLiteral)
            assertEquals(0L, (body[peer - 1] as WideLiteralInstruction).wideLiteral)
            val peerRegister = body[peer].namedRegisters()[0]
            assertEquals(peerRegister, body[peer - 3].namedRegisters().single())
            assertEquals(peerRegister, body[peer - 1].namedRegisters().single())
            val flow = ControlFlow.of(method)
            assertEquals(listOf(peer - 1, peer - 3), flow.normal[peer - 4])
            assertEquals(listOf(peer), flow.normal[peer - 2])
            assertEquals(Opcode.IPUT_WIDE, body[peer].opcode)
            assertTrue(references.contains("android_sdcard_exists"))
        }
    }

    @Test
    fun `each declared build has both reports, and the patch hooks both with nothing left to warn about`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val classes = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER))
            assertEquals("$where: the messages controller", setOf(MESSAGES_CONTROLLER), classes.keys)
            val controller = classes.getValue(MESSAGES_CONTROLLER)
            val requested = controller.fields.single { it.name == "collectDeviceStats" }
            assertEquals("$where: the request flag is boolean", "Z", requested.type)
            assertTrue("$where: getField can read the public request flag", AccessFlags.PUBLIC.isSet(requested.accessFlags))
            assertFalse("$where: the request flag belongs to each controller", AccessFlags.STATIC.isSet(requested.accessFlags))
            val reported = controller.fields.single { it.name == "loggedDeviceStats" }
            assertEquals("$where: the once-per-start guard is boolean", "Z", reported.type)
            assertFalse("$where: the guard belongs to each controller", AccessFlags.STATIC.isSet(reported.accessFlags))
            val metricsClass = FixtureDex.classesWhere(build, { true }, ::sendsReadMetrics).single()

            val original = classes.getValue(MESSAGES_CONTROLLER).methods.single {
                it.name == "logDeviceStats" && it.parameterTypes.isEmpty() && it.returnType == "V"
            }
            val metrics = metricsClass.methods.single(::sendsReadMetrics)

            val appLogClasses = FixtureDex.classesWhere(build, { true }) { method ->
                method.instructions().any { it.opcode == Opcode.NEW_INSTANCE &&
                    (it as? ReferenceInstruction)?.reference?.toString() == SAVE_APP_LOG }
            }
            val context = PatchContexts.of(ExtensionDex.classes() +
                (classes.values + metricsClass + appLogClasses).distinctBy { it.type })
            val warnings = PatchLogCapture.warnings { disableAnalyticsPatch.execute(context) }
            assertEquals("$where: the patch log", emptyList<String>(), warnings)

            val patched = context.mutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.sameSignatureAs(original) }
            val before = original.instructions()
            val after = patched.instructions()
            assertEquals("$where: instructions added", before.size + 4, after.size)
            assertEquals("$where: asks the extension first with the controller", Opcode.INVOKE_STATIC_RANGE, after[0].opcode)
            assertEquals("$analytics->skipDeviceStats(Ljava/lang/Object;)Z", (after[0] as ReferenceInstruction).reference.toString())
            val receiver = after[0] as RegisterRangeInstruction
            assertEquals("$where: passes exactly one controller", 1, receiver.registerCount)
            assertEquals("$where: passes the original this register", original.implementation!!.registerCount - 1, receiver.startRegister)
            assertEquals("$where: register allocation stays stock", original.implementation!!.registerCount, patched.implementation!!.registerCount)
            assertEquals(Opcode.MOVE_RESULT, after[1].opcode)
            assertEquals(Opcode.IF_EQZ, after[2].opcode)
            assertEquals("$where: the early return", Opcode.RETURN_VOID, after[3].opcode)
            assertEquals("$where: nothing else moved", before.map { it.opcode }, after.subList(4, after.size).map { it.opcode })
            assertEquals("$where: the stock field and call references stay intact",
                before.filterIsInstance<ReferenceInstruction>().map { it.reference.toString() },
                after.subList(4, after.size).filterIsInstance<ReferenceInstruction>().map { it.reference.toString() })
            val oldFlow = ControlFlow.of(original)
            val newFlow = ControlFlow.of(patched)
            assertEquals("$where: false reaches the original first instruction", setOf(3, 4), newFlow.normal[2].toSet())
            for (index in before.indices) {
                assertEquals("$where: original branch $index stays stock", oldFlow.normal[index], newFlow.normal[index + 4].map { it - 4 })
                assertEquals("$where: original handler $index stays stock", oldFlow.exceptional[index], newFlow.exceptional[index + 4].map { it - 4 })
            }

            assertReadMetricsHooked(
                "$where: read metrics", metrics,
                context.mutableClassDefBy(metricsClass.type).methods.single { it.sameSignatureAs(metrics) },
            )

            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods
                .single { it.name == "disableAnalytics" }.instructions()
            assertEquals("$where: SettingsStatus.disableAnalytics() answers true first", Opcode.CONST_4, status[0].opcode)
            assertEquals(1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.RETURN, status[1].opcode)
            // A family flag alone can't prove both independent targets were inserted.
            for (target in listOf("deviceStats", "readMetrics")) {
                val capability = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == target }.instructions()
                assertEquals("$where: $target is an injected build fact", Opcode.CONST_4, capability[0].opcode)
                assertEquals("$where: missing $target coverage", 1, (capability[0] as NarrowLiteralInstruction).narrowLiteral)
                assertEquals(Opcode.RETURN, capability[1].opcode)
            }
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
