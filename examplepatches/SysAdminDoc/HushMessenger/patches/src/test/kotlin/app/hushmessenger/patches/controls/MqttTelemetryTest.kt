package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val CLIENT = "LX/0mE;"
internal const val SYNTHETIC_MQTT_PUBLISH =
    "$CLIENT->A0R(LX/0rd;LX/0rI;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;[BIJ)LX/0qX;"
internal const val SYNTHETIC_MQTT_KEEPALIVE = "$CLIENT->A0N(Ljava/lang/String;)V"
private const val NOT_SENT = "LX/09t;->A00:LX/09t;"
private const val PLAIN_PING = "$CLIENT->A05(${CLIENT}LX/14Z;)V"

/**
 * The publish cut down to what Messenger keeps: with no connection it logs not_connected and returns the not-sent singleton,
 * otherwise it checks for the health report and writes. Twenty registers and ten parameter words, so p4 is v14.
 */
private val PUBLISH_BODY = """
    iget-object v2, p0, $CLIENT->A12:LX/14Z;
    if-nez v2, :connected
    const-string v3, "$NOT_CONNECTED"
    invoke-static {v3}, LX/160;->A0F(Ljava/lang/String;)V
    sget-object v0, $NOT_SENT
    return-object v0
    :connected
    const-string v3, "$HEALTH_STATS_TOPIC"
    invoke-virtual {v3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    const-string v3, "$PUBLISH_FAILED"
    const/4 v0, 0x0
    return-object v0
""".trimIndent()

/** The keepalive as Messenger writes it: a config flag picks the health report or, when it's off, the plain ping. */
private val KEEPALIVE_BODY = """
    iget-object v1, p0, $CLIENT->A08:LX/0C6;
    iget-object v2, p0, $CLIENT->A12:LX/14Z;
    iget-boolean v0, v1, LX/0C6;->A00:Z
    if-eqz v0, :plain_ping
    const-string v3, "$HEALTH_STATS_TOPIC"
    invoke-virtual {p0, v3}, $CLIENT->A0M(Ljava/lang/String;)V
    return-void
    :plain_ping
    invoke-static {p0, v2}, $PLAIN_PING
    const-string v3, "$KEEPALIVE_FAILED"
    return-void
""".trimIndent()

private fun publish(body: String = PUBLISH_BODY, registers: Int = 20, flags: Int = AccessFlags.PUBLIC.value, owner: String = CLIENT) =
    fixtureMethod(SYNTHETIC_MQTT_PUBLISH.replace(CLIENT, owner), body, registers, flags)

private fun keepalive(body: String = KEEPALIVE_BODY, owner: String = CLIENT) =
    fixtureMethod(SYNTHETIC_MQTT_KEEPALIVE.replace(CLIENT, owner), body.replace(CLIENT, owner))

/**
 * The client with its publish, keepalive and plain ping, and the subclass whose thin publish override only retries
 * message sends and hands every other topic to the client's own publish.
 */
internal fun mqttClientFixture(
    publishMethod: MutableMethod? = publish(),
    keepaliveMethod: MutableMethod? = keepalive(),
): List<MutableClass> = listOf(
    fixtureClass(CLIENT, listOfNotNull(publishMethod, keepaliveMethod,
        fixtureMethod(PLAIN_PING, "return-void", registers = 2, flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value))),
    fixtureClass("LX/WsL;", listOf(fixtureMethod(SYNTHETIC_MQTT_PUBLISH.replace(CLIENT, "LX/WsL;"),
        "invoke-super/range {p0 .. p9}, $SYNTHETIC_MQTT_PUBLISH\nmove-result-object v0\nreturn-object v0", registers = 11)),
        superclass = CLIENT),
)

private fun Method.code() = implementation!!.instructions.toList()

private fun Method.reference(at: Int) = (code()[at] as ReferenceInstruction).reference.toString()

/** An odd-length insertion can add or drop the nop that aligns a switch table further down, so nops don't count. */
private fun List<Instruction>.opcodes() = map { it.opcode }.filter { it != Opcode.NOP }

class MqttTelemetryTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(MQTT_TELEMETRY).map { it.hookId() }.toSet()

    @Test fun thePublishAndTheKeepaliveAreFoundInTheClientAndNotItsSubclass() {
        assertEquals(setOf(SYNTHETIC_MQTT_PUBLISH, SYNTHETIC_MQTT_KEEPALIVE), found(mqttClientFixture()))
        validateControls(mirroredControls(mqttClientFixture()), setOf(MQTT_TELEMETRY))
    }

    @Test fun eachProfileHooksOneClientsPublishAndKeepalive() {
        assertEquals(setOf(SYNTHETIC_MQTT_PUBLISH, SYNTHETIC_MQTT_KEEPALIVE), SYNTHETIC_PROFILE.hooks.getValue(MQTT_TELEMETRY))
        validateControls(mirroredControls(mqttClientFixture()), setOf(MQTT_TELEMETRY))
        // 585 renames the client and its argument types.
        assertEquals(setOf("LX/14U;->A0R(LX/0ss;LX/10G;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;[BIJ)LX/0zU;",
            "LX/14U;->A0N(Ljava/lang/String;)V"), BASE_PROFILE.hooks.getValue(MQTT_TELEMETRY))
    }

    // Dropping the report while the keepalive still sends it would leave the connection with no keepalive, so a
    // client missing either half gets neither hook.
    @Test fun bothHalvesOrNeither() {
        val cases = mapOf(
            "no keepalive" to mqttClientFixture(keepaliveMethod = null),
            "no publish" to mqttClientFixture(publishMethod = null),
            "keepalive without its flag" to mqttClientFixture(keepaliveMethod = keepalive(KEEPALIVE_BODY.replace(
                "iget-boolean v0, v1, LX/0C6;->A00:Z\nif-eqz v0, :plain_ping\n", ""))),
            "flag that doesn't pick the plain ping" to mqttClientFixture(keepaliveMethod = keepalive(KEEPALIVE_BODY.replace(
                "invoke-static {p0, v2}, $PLAIN_PING", "invoke-static {p0, v2}, LX/Other;->A05(${CLIENT}LX/14Z;)V"))),
            "publish without its not-connected answer" to mqttClientFixture(publishMethod = publish(PUBLISH_BODY.replace(
                "sget-object v0, $NOT_SENT", "const/4 v0, 0x0"))),
            "static publish" to mqttClientFixture(publishMethod = publish(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)),
            "two clients" to mqttClientFixture() + listOf(fixtureClass("LX/0bJ;", listOf(publish(owner = "LX/0bJ;"), keepalive(owner = "LX/0bJ;")))),
            "publish and keepalive in different classes" to listOf(fixtureClass(CLIENT, listOf(publish())),
                fixtureClass("LX/0bJ;", listOf(keepalive(owner = "LX/0bJ;")))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(MQTT_TELEMETRY)) }
        }
    }

    @Test fun aLoggingPublishGetsTheNotConnectedAnswerBeforeAnyStockWork() {
        val method = publish()
        val before = method.code()
        injectControl(MQTT_TELEMETRY, mapOf(MQTT_TELEMETRY to listOf(method)))
        val code = method.code()
        val ask = code[0] as RegisterRangeInstruction
        assertEquals(Opcode.INVOKE_STATIC_RANGE, ask.opcode)
        assertEquals(MQTT_PUBLISH_GATE, method.reference(0))
        assertEquals(listOf(1, 14), listOf(ask.registerCount, ask.startRegister))
        assertEquals(Opcode.MOVE_RESULT, code[1].opcode)
        assertEquals(0, (code[1] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        assertEquals(5, code.branchTarget(2))
        assertEquals(Opcode.SGET_OBJECT, code[3].opcode)
        assertEquals(NOT_SENT, method.reference(3))
        assertEquals(Opcode.RETURN_OBJECT, code[4].opcode)
        assertEquals(0, (code[4] as OneRegisterInstruction).registerA)
        // Off, Pause and safe mode, and every other topic, fall through to Messenger's own publish, unchanged.
        assertEquals(before, code.drop(5))
    }

    @Test fun theKeepaliveReadsItsFlagThroughTheSwitchAndKeepsBothBranches() {
        val method = keepalive()
        val before = method.code()
        injectControl(MQTT_TELEMETRY, mapOf(MQTT_TELEMETRY to listOf(method)))
        val code = method.code()
        val ask = code[3] as RegisterRangeInstruction
        assertEquals(MQTT_KEEPALIVE_GATE, method.reference(3))
        assertEquals(listOf(1, 0), listOf(ask.registerCount, ask.startRegister))
        assertEquals(Opcode.MOVE_RESULT, code[4].opcode)
        assertEquals(0, (code[4] as OneRegisterInstruction).registerA)
        assertEquals(before.take(3), code.take(3))
        assertEquals(before.drop(3), code.drop(5))
        // The test still lands on the plain ping.
        assertEquals(PLAIN_PING, method.reference(code.branchTarget(5)))
    }

    @Test fun anUnusableMethodRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            // Ten registers are exactly the parameter words, so v0 would be this.
            "no free register" to publish(registers = 10),
            "no not-connected answer" to publish(PUBLISH_BODY.replace("sget-object v0, $NOT_SENT", "const/4 v0, 0x0")),
            // Another path reaching the test would read Messenger's own flag.
            "a jump to the flag's test" to keepalive(KEEPALIVE_BODY.replace("iget-boolean v0, v1, LX/0C6;->A00:Z\n",
                "if-eqz v2, :test\niget-boolean v0, v1, LX/0C6;->A00:Z\n:test\n")),
            "two flags" to keepalive(KEEPALIVE_BODY.replace("iget-object v2, p0, $CLIENT->A12:LX/14Z;\n",
                "iget-object v2, p0, $CLIENT->A12:LX/14Z;\niget-boolean v0, v1, LX/0C6;->A01:Z\nif-eqz v0, :plain_ping\n")),
            "another method" to fixtureMethod("$CLIENT->A0D()V", "const-string v0, \"$HEALTH_STATS_TOPIC\"\nreturn-void"),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(MQTT_TELEMETRY, mapOf(MQTT_TELEMETRY to listOf(bad))) }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildHooksItsOnePublishAndKeepalive() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val hooks = findMqttTelemetry(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(MQTT_TELEMETRY), hooks.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(MQTT_TELEMETRY to hooks), setOf(MQTT_TELEMETRY))
            for (found in hooks) {
                val method = MutableMethod(found)
                val before = method.code()
                if (method.isMqttPublish()) {
                    val notSent = method.notSentAnswer().toString()
                    method.injectMqttTelemetry()
                    assertEquals(MQTT_PUBLISH_GATE, method.reference(0), code)
                    assertEquals(notSent, method.reference(3), code)
                    assertEquals(before.opcodes(), method.code().drop(5).opcodes(), code)
                } else {
                    val flag = method.healthKeepaliveFlag()!!
                    method.injectMqttTelemetry()
                    assertEquals(MQTT_KEEPALIVE_GATE, method.reference(flag + 1), code)
                    assertEquals(before.drop(flag + 1).opcodes(), method.code().drop(flag + 3).opcodes(), code)
                }
            }
        }
    }
}
