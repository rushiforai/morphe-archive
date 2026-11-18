package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

/** The report's id, which every 587 build keeps, and the two publishers under one build's names for them. */
internal const val SYNTHETIC_PRESENCE_REPORT = "$PRESENCE_MANAGER->A0f(Z)V"
internal const val SYNTHETIC_AVAILABILITY_LEGACY = "LX/2QW;->onSharedPreferenceChanged(${FB_SHARED_PREFERENCES}LX/2w2;)V"
internal const val SYNTHETIC_AVAILABILITY_LITE = "LX/3uv;->onSharedPreferenceChanged(${FB_SHARED_PREFERENCES}LX/2w2;)V"

private const val MAILBOX = "LX/OBU;"
private const val STATUS = "LX/0RH;"
private const val ACTIVE_STATUS = "LX/1TS;"
private const val JSON_PUT = "Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;"

/** The self-report as 587 has it: the traced mailbox call, with the boolean picking which status goes out. */
private val REPORT_BODY = """
    iget-object v0, p0, $PRESENCE_MANAGER->A0A:$MAILBOX
    const-string v1, "$REPORT_USER_STATUS"
    invoke-static {v1}, LX/0mU;->A00(Ljava/lang/String;)V
    if-eqz p1, :away
    sget-object v2, $STATUS->A01:$STATUS
    goto :report
    :away
    sget-object v2, $STATUS->A00:$STATUS
    :report
    invoke-virtual {v0, v2}, $MAILBOX->reportUserStatus($STATUS)V
    return-void
""".trimIndent()

/** A client-settings publisher cut down: Messenger's own setting read, put in the JSON, then published. */
private val SETTING_BODY = """
    new-instance v0, Lorg/json/JSONObject;
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V
    invoke-virtual {p1}, $ACTIVE_STATUS->A0H()Z
move-result v1
    const-string v2, "$FOREGROUND_AVAILABILITY"
    invoke-virtual {v0, v2, v1}, $JSON_PUT
    const-string v3, "$CLIENT_SETTINGS_TOPIC"
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-static {v3, v4}, LX/2QX;->A00(Ljava/lang/String;Ljava/lang/String;)V
    return-void
""".trimIndent()

private val STATIC_FLAGS = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

private fun report(body: String = REPORT_BODY, id: String = SYNTHETIC_PRESENCE_REPORT, registers: Int = 6,
    flags: Int = AccessFlags.PUBLIC.value) = fixtureMethod(id, body, registers, flags)

private fun setting(id: String = SYNTHETIC_AVAILABILITY_LEGACY, body: String = SETTING_BODY, registers: Int = 8,
    flags: Int = AccessFlags.PUBLIC.value) = fixtureMethod(id, body, registers, flags)

private fun fixture(vararg methods: MutableMethod = arrayOf(report(), setting(), setting(SYNTHETIC_AVAILABILITY_LITE))):
    List<MutableClass> = methods.groupBy { it.definingClass }.map { (type, group) -> fixtureClass(type, group) }

/** The report and both publishers, for the complete discovery fixture. */
internal fun appearOfflineFixture(): List<MutableClass> = fixture()

private fun Method.offlineCode() = implementation!!.instructions.toList()
private fun Instruction.offlineRef() = (this as? ReferenceInstruction)?.reference?.toString()

class AppearOfflineTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes)

    private fun ids(classes: List<MutableClass>, key: String) = found(classes)[key].orEmpty().map { it.hookId() }

    @Test fun findsTheReportAndBothPublishers() {
        assertEquals(listOf(SYNTHETIC_PRESENCE_REPORT), ids(fixture(), APPEAR_OFFLINE))
        assertEquals(setOf(SYNTHETIC_AVAILABILITY_LEGACY, SYNTHETIC_AVAILABILITY_LITE), ids(fixture(), AVAILABILITY_SETTING).toSet())
        validateControls(found(fixture()), setOf(APPEAR_OFFLINE, AVAILABILITY_SETTING))
        assertEquals(setOf(SYNTHETIC_PRESENCE_REPORT), SYNTHETIC_PROFILE.hooks.getValue(APPEAR_OFFLINE))
    }

    /** The report's class and name are the same in every supported build, and each build has both publishers. */
    @Test fun everySupportedBuildReportsThroughTheSameMethod() {
        for ((code, profile) in controlProfiles) {
            assertEquals(setOf(SYNTHETIC_PRESENCE_REPORT), profile.hooks.getValue(APPEAR_OFFLINE), "$code")
            val publishers = profile.hooks.getValue(AVAILABILITY_SETTING)
            assertEquals(2, publishers.size, "$code")
            assertTrue(publishers.all { it.contains("->onSharedPreferenceChanged($FB_SHARED_PREFERENCES") && it.endsWith(")V") }, "$code")
        }
    }

    @Test fun lookalikesAreNotFound() {
        val cases = mapOf(
            "a report with no mailbox trace" to fixture(report(REPORT_BODY.replace(REPORT_USER_STATUS, "PresenceLogger"))),
            "a report that is static" to fixture(report(flags = STATIC_FLAGS)),
            "a report on another class" to fixture(report(id = SYNTHETIC_PRESENCE_REPORT.replace(PRESENCE_MANAGER, "LX/2Pe;"))),
            "a publisher that sends another topic" to fixture(setting(body = SETTING_BODY.replace(CLIENT_SETTINGS_TOPIC, "/t_p"))),
            "a publisher that doesn't read the flag" to fixture(setting(body = SETTING_BODY.replace(FOREGROUND_AVAILABILITY, "is_foreground"))),
            "a publisher that is static" to fixture(setting(flags = STATIC_FLAGS)),
            "a listener for something else" to fixture(setting(id = SYNTHETIC_AVAILABILITY_LEGACY.replace(FB_SHARED_PREFERENCES, "LX/2w3;"))),
        )
        for ((case, classes) in cases) {
            assertEquals(emptyList(), ids(classes, APPEAR_OFFLINE) + ids(classes, AVAILABILITY_SETTING), case)
        }
    }

    @Test fun aChangedReportIsRefusedAndLeftAsItWas() {
        val cases = mapOf(
            "a jump back to the start" to report(":top\n" + REPORT_BODY.replace("return-void", "if-eqz p1, :top\nreturn-void")),
            "the status out of a four-bit register" to report(registers = 20),
        )
        for ((case, method) in cases) {
            val before = method.offlineCode()
            assertFailsWith<PatchException>(case) { method.injectAppearOffline() }
            assertEquals(before, method.offlineCode(), case)
        }
    }

    @Test fun aChangedPublisherIsRefusedAndLeftAsItWas() {
        val flag = "const-string v2, \"$FOREGROUND_AVAILABILITY\""
        val cases = mapOf(
            "the flag loaded twice" to SETTING_BODY.replace("return-void", "$flag\nreturn-void"),
            "the flag not put in the JSON" to SETTING_BODY.replace("invoke-virtual {v0, v2, v1}, $JSON_PUT",
                "invoke-virtual/range {v0 .. v2}, $JSON_PUT"),
            "the put not right after the flag" to SETTING_BODY.replace(flag, "$flag\nnop"),
            "a jump onto the put" to SETTING_BODY.replace(flag, "if-eqz v1, :put\n$flag\n:put"),
            "the flag made up instead of read" to SETTING_BODY.replace("invoke-virtual {p1}, $ACTIVE_STATUS->A0H()Z\nmove-result v1",
                "const/4 v1, 0x1"),
            "the flag read for one chat" to SETTING_BODY.replace("invoke-virtual {p1}, $ACTIVE_STATUS->A0H()Z",
                "invoke-virtual {p1, v3}, $ACTIVE_STATUS->A0I(Ljava/lang/String;)Z"),
        )
        for ((case, body) in cases) {
            val method = setting(body = body)
            assertTrue(method.isAvailabilitySetting(), case)
            val before = method.offlineCode()
            assertFailsWith<PatchException>(case) { method.injectAppearOffline() }
            assertEquals(before, method.offlineCode(), case)
        }
    }

    @Test fun anotherMethodIsRefused() {
        assertFailsWith<PatchException> { fixtureMethod("LX/2Pe;->A01(Z)V", "return-void", 4).injectAppearOffline() }
    }

    @Test fun theReportAsksBeforeItPicksAStatus() {
        val method = report()
        val before = method.offlineCode()
        injectControl(APPEAR_OFFLINE, mapOf(APPEAR_OFFLINE to listOf(method)))
        val code = method.offlineCode()
        assertEquals(AVAILABLE_CALL, code[0].offlineRef())
        assertEquals(Opcode.MOVE_RESULT, code[1].opcode)
        // The answer goes back in the register the report reads, so the status it picks is the one the switch allows.
        assertEquals(method.parameterRegister(1), (code[1] as OneRegisterInstruction).registerA)
        assertEquals(before.map { it.opcode }, code.drop(2).map { it.opcode })
    }

    @Test fun eachPublisherAsksRightBeforeItsPut() {
        for (id in listOf(SYNTHETIC_AVAILABILITY_LEGACY, SYNTHETIC_AVAILABILITY_LITE)) {
            val method = setting(id)
            val put = method.availabilityPut()
            val before = method.offlineCode()
            injectControl(AVAILABILITY_SETTING, mapOf(AVAILABILITY_SETTING to listOf(method)))
            val code = method.offlineCode()
            assertEquals(AVAILABLE_CALL, code[put.index].offlineRef(), id)
            assertEquals(Opcode.MOVE_RESULT, code[put.index + 1].opcode, id)
            assertEquals(put.register, (code[put.index + 1] as OneRegisterInstruction).registerA, id)
            // The put that follows reads the answer, and the analytics event after it reads the same register.
            assertEquals(JSON_PUT, code[put.index + 2].offlineRef(), id)
            assertEquals(before.map { it.opcode }, (code.take(put.index) + code.drop(put.index + 2)).map { it.opcode }, id)
        }
    }
}
