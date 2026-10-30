package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val DECIDER = "LX/Qcr;"
internal const val SYNTHETIC_RING_DECISION = "$DECIDER->run()V"
internal const val SYNTHETIC_CALL_POSTER = "$RTC_NOTIFICATION_SERVICE->A00(Landroid/app/Notification;Landroid/content/Context;${RTC_NOTIFICATION_SERVICE}I)V"
private const val ON_START = "$RTC_NOTIFICATION_SERVICE->onStartCommand(Landroid/content/Intent;II)I"
private const val START_FOREGROUND = "$RTC_NOTIFICATION_SERVICE->startForeground(ILandroid/app/Notification;)V"
private const val ENTRY = "LX/A4J;->A12(Ljava/lang/Object;Z)LX/0Bi;"
private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

/**
 * The decision as Messenger 585 writes it, cut down to two of its four flags: either one skips the ringtone and the
 * vibration, and the skip block logs both flags, each paired with its name.
 */
private val DECISION_BODY = """
    iget-boolean v1, p0, $DECIDER->A00:Z
    iget-boolean v2, p0, $DECIDER->A01:Z
    if-nez v1, :skip
    if-nez v2, :skip
    const-string v0, "$RING_MARK"
    const-string v0, "Maybe start vibrate"
    return-void
    :skip
    const-string v0, "$RINGTONE_DISABLED"
    invoke-static {v0, v1}, $ENTRY
    const-string v0, "$NOTIFICATIONS_BLOCKED"
    invoke-static {v0, v2}, $ENTRY
    return-void
""".trimIndent()

/** The same with the flag past v15, logged through invoke-static/range beside its name. */
private val RANGE_DECISION_BODY = DECISION_BODY
    .replace("iget-boolean v1, p0, $DECIDER->A00:Z", "const/4 v0, 0x0\nmove/from16 v24, v0")
    .replace("iget-boolean v2, p0, $DECIDER->A01:Z", "const/4 v2, 0x0")
    .replace("if-nez v1,", "if-nez v24,")
    .replace("const-string v0, \"$RINGTONE_DISABLED\"\ninvoke-static {v0, v1}, $ENTRY",
        "const-string v23, \"$RINGTONE_DISABLED\"\ninvoke-static/range {v23 .. v24}, $ENTRY")

/** The 32-bit builds' form: the flag past v15 is copied down beside the name and logged from the copy. */
private val COPY_DECISION_BODY = DECISION_BODY
    .replace("iget-boolean v1, p0, $DECIDER->A00:Z", "const/4 v0, 0x0\nmove/from16 v24, v0")
    .replace("if-nez v1,", "if-nez v24,")
    .replace("invoke-static {v0, v1}, $ENTRY", "move/from16 v3, v24\ninvoke-static {v0, v3}, $ENTRY")

/** The poster, with no local register at all: it posts with the call id it was given through the service it was handed. */
private const val POSTER_BODY = "invoke-virtual {p2, p3, p0}, $START_FOREGROUND\nreturn-void"

private fun decision(body: String = DECISION_BODY, id: String = SYNTHETIC_RING_DECISION, registers: Int = 4, flags: Int = AccessFlags.PUBLIC.value) =
    fixtureMethod(id, body, registers, flags)

private fun poster(body: String = POSTER_BODY, id: String = SYNTHETIC_CALL_POSTER, flags: Int = STATIC, registers: Int = 4) =
    fixtureMethod(id, body, registers = registers, flags = flags)

/** onStartCommand starts the foreground too, from an Intent, so it's never the poster. */
private fun onStart() = fixtureMethod(ON_START, "const/4 v0, 0x0\ninvoke-virtual {p0, p2, v0}, $START_FOREGROUND\nconst/4 v0, 0x2\nreturn v0", registers = 5)

/** A loop back to the poster's start would run the extension again on the notification it just returned. */
private fun loopingPoster() = poster(":top\n$POSTER_BODY".replace("return-void", "if-eqz p3, :top\nreturn-void"))

private fun service(methods: List<MutableMethod>) = fixtureClass(RTC_NOTIFICATION_SERVICE, methods, superclass = "Landroid/app/Service;")

/** The decision's Runnable and the call service with its poster beside onStartCommand. */
internal fun quietCallsFixture(
    decider: MutableMethod = decision(),
    posters: List<MutableMethod> = listOf(poster()),
): List<MutableClass> = listOf(fixtureClass(DECIDER, listOf(decider), interfaces = listOf("Ljava/lang/Runnable;")), service(posters + onStart()))

private fun Method.code() = implementation!!.instructions.toList()

class QuietCallsTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>, key: String) = mirroredControls(classes).getValue(key).map { it.hookId() }
    private val both = setOf(QUIET_CALL_RING, QUIET_CALL_NOTIFICATION)

    @Test fun theDecisionAndThePosterAreFoundByTheirShape() {
        assertEquals(listOf(SYNTHETIC_RING_DECISION), found(quietCallsFixture(), QUIET_CALL_RING))
        assertEquals(listOf(SYNTHETIC_CALL_POSTER), found(quietCallsFixture(), QUIET_CALL_NOTIFICATION))
        validateControls(mirroredControls(quietCallsFixture()), both)
        // A flag past v15 is logged through the range form.
        val range = quietCallsFixture(decision(RANGE_DECISION_BODY, registers = 26))
        assertEquals(listOf(SYNTHETIC_RING_DECISION), found(range, QUIET_CALL_RING))
        validateControls(mirroredControls(range), both)
        // The 32-bit builds log a copy of the flag made right before the entry.
        val copied = quietCallsFixture(decision(COPY_DECISION_BODY, registers = 26))
        assertEquals(listOf(SYNTHETIC_RING_DECISION), found(copied, QUIET_CALL_RING))
        validateControls(mirroredControls(copied), both)
    }

    @Test fun eachProfileHooksItsOwnDecisionAndPoster() {
        assertEquals(setOf(SYNTHETIC_RING_DECISION), SYNTHETIC_PROFILE.hooks.getValue(QUIET_CALL_RING))
        assertEquals(setOf(SYNTHETIC_CALL_POSTER), SYNTHETIC_PROFILE.hooks.getValue(QUIET_CALL_NOTIFICATION))
        assertEquals(setOf("LX/B7G;->run()V"), BASE_PROFILE.hooks.getValue(QUIET_CALL_RING))
        assertEquals(setOf("$RTC_NOTIFICATION_SERVICE->A00(Landroid/app/Notification;Landroid/content/Context;LX/BSH;LX/BgQ;LX/B90;" +
            "${RTC_NOTIFICATION_SERVICE}LX/HL1;Ljava/lang/Integer;Ljava/lang/String;IZZZ)V"), BASE_PROFILE.hooks.getValue(QUIET_CALL_NOTIFICATION))
    }

    // The switch says the phone stays quiet. A decision that skips the ringtone some other way could ring anyway, and a
    // branch on the wrong flag would mute calls the switch never meant to, so either gets no hook at all.
    @Test fun anyOtherDecisionLeavesTheControlUnapplied() {
        fun changed(from: String, to: String) = quietCallsFixture(decision(DECISION_BODY.replace(from, to).also { check(it != DECISION_BODY) }))
        val secondRinger = fixtureClass("LX/Zzr;", listOf(fixtureMethod("LX/Zzr;->A00()V", "const-string v0, \"$RING_MARK\"\nreturn-void")))
        val cases = mapOf(
            "no ringtone_disabled log" to changed("const-string v0, \"$RINGTONE_DISABLED\"\n", ""),
            "no notifications_blocked log" to changed("const-string v0, \"$NOTIFICATIONS_BLOCKED\"\n", ""),
            "a log that doesn't pair a flag" to changed("invoke-static {v0, v1}, $ENTRY", "invoke-static {v0, v1}, LX/A4J;->A13(Ljava/lang/Object;I)LX/0Bi;"),
            "an entry that doesn't take the name" to changed("invoke-static {v0, v1}, $ENTRY", "invoke-static {v2, v1}, $ENTRY"),
            "no branch on the flag" to changed("if-nez v1, :skip\n", ""),
            "two branches on the flag" to changed("if-nez v1, :skip", "if-nez v1, :skip\nif-nez v1, :skip"),
            "a branch past the log" to quietCallsFixture(decision(DECISION_BODY.replace("if-nez v1, :skip", "if-nez v1, :late")
                .replace("const-string v0, \"$NOTIFICATIONS_BLOCKED\"", ":late\nconst-string v0, \"$NOTIFICATIONS_BLOCKED\""))),
            "a way into the guard's spot" to changed("if-nez v1, :skip\nif-nez v2, :skip", "if-eqz v2, :blocked\nif-nez v1, :skip\n:blocked\nif-nez v2, :skip"),
            "a copy the entry doesn't log" to quietCallsFixture(decision(COPY_DECISION_BODY.replace("invoke-static {v0, v3}", "invoke-static {v0, v2}"), registers = 26)),
            "a copy over the name" to quietCallsFixture(decision(COPY_DECISION_BODY.replace("move/from16 v3, v24\ninvoke-static {v0, v3}",
                "move/from16 v0, v24\ninvoke-static {v0, v0}").also { check(it != COPY_DECISION_BODY) }, registers = 26)),
            "a static run" to quietCallsFixture(decision(DECISION_BODY.replace("p0", "v3"), flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)),
            "a run with a parameter" to quietCallsFixture(decision(id = "$DECIDER->run(I)V", registers = 5)),
            "a second method that rings" to quietCallsFixture() + secondRinger,
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes, QUIET_CALL_RING).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(QUIET_CALL_RING)) }
        }
    }

    @Test fun anyOtherPosterLeavesTheControlUnapplied() {
        val cases = mapOf(
            "no foreground start" to quietCallsFixture(posters = listOf(poster("return-void"))),
            "an instance poster" to quietCallsFixture(posters = listOf(poster(POSTER_BODY.replace("p2, p3, p0", "p0, p4, p1"),
                flags = AccessFlags.PUBLIC.value, registers = 5))),
            "no service handed in" to quietCallsFixture(posters = listOf(poster("new-instance v0, $RTC_NOTIFICATION_SERVICE\n" +
                POSTER_BODY.replace("p2, p3, p0", "v0, p2, p0"), id = "$RTC_NOTIFICATION_SERVICE->A00(Landroid/app/Notification;Landroid/content/Context;I)V"))),
            "the context first" to quietCallsFixture(posters = listOf(poster(POSTER_BODY.replace("p2, p3, p0", "p2, p3, p1"),
                id = "$RTC_NOTIFICATION_SERVICE->A00(Landroid/content/Context;Landroid/app/Notification;${RTC_NOTIFICATION_SERVICE}I)V"))),
            "a value returned" to quietCallsFixture(posters = listOf(poster(POSTER_BODY.replace("return-void", "return p3"),
                id = "$RTC_NOTIFICATION_SERVICE->A00(Landroid/app/Notification;Landroid/content/Context;${RTC_NOTIFICATION_SERVICE}I)I"))),
            "two posters" to quietCallsFixture(posters = listOf(poster(), poster(id = SYNTHETIC_CALL_POSTER.replace("->A00(", "->A01(")))),
            "another service" to listOf(fixtureClass(DECIDER, listOf(decision())),
                fixtureClass("Lcom/facebook/rtc/notification/OtherService;", listOf(poster(id = SYNTHETIC_CALL_POSTER.replace(RTC_NOTIFICATION_SERVICE, "Lcom/facebook/rtc/notification/OtherService;"))))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes, QUIET_CALL_NOTIFICATION).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(QUIET_CALL_NOTIFICATION)) }
        }
    }

    @Test fun theGuardTakesMessengersOwnRingtoneOffPath() {
        val method = decision()
        val before = method.code()
        injectControl(QUIET_CALLS, mapOf(QUIET_CALL_RING to listOf(method)))
        val code = method.code()
        // Both flags are read and the ringtone-off branch runs first, as in stock.
        assertEquals(before.take(3), code.take(3))
        assertEquals(10, code.branchTarget(2))
        assertEquals("$SETTINGS->quietIncomingCalls()Z", (code[3] as ReferenceInstruction).reference.toString())
        // On, the flag the skip block logs as ringtone_disabled turns true and the call takes that path.
        assertEquals(Opcode.MOVE_RESULT, code[4].opcode)
        assertEquals(1, (code[4] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_NEZ, code[5].opcode)
        assertEquals(1, (code[5] as OneRegisterInstruction).registerA)
        assertEquals(10, code.branchTarget(5))
        assertEquals(RINGTONE_DISABLED, ((code[10] as ReferenceInstruction).reference as StringReference).string)
        // Off, Pause and safe mode leave it false and Messenger rings and vibrates exactly as it wrote it.
        assertEquals(before.drop(3).map { it.opcode }, code.drop(6).map { it.opcode })
        assertEquals(10, code.branchTarget(6))
    }

    @Test fun theRangeFormGuardsTheHighFlagRegister() {
        val method = decision(RANGE_DECISION_BODY, registers = 26)
        injectControl(QUIET_CALLS, mapOf(QUIET_CALL_RING to listOf(method)))
        val code = method.code()
        val at = code.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == "$SETTINGS->quietIncomingCalls()Z" }
        assertEquals(24, (code[at + 1] as OneRegisterInstruction).registerA)
        assertEquals(24, (code[at + 2] as OneRegisterInstruction).registerA)
        assertEquals(code.branchTarget(at - 1), code.branchTarget(at + 2))
    }

    @Test fun theCopyFormGuardsTheFlagNotItsCopy() {
        val method = decision(COPY_DECISION_BODY, registers = 26)
        injectControl(QUIET_CALLS, mapOf(QUIET_CALL_RING to listOf(method)))
        val code = method.code()
        val at = code.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == "$SETTINGS->quietIncomingCalls()Z" }
        assertEquals(24, (code[at + 1] as OneRegisterInstruction).registerA)
        assertEquals(24, (code[at + 2] as OneRegisterInstruction).registerA)
        assertEquals(code.branchTarget(at - 1), code.branchTarget(at + 2))
    }

    @Test fun thePosterHandsItsNotificationToTheExtensionFirst() {
        val method = poster()
        val before = method.code()
        injectControl(QUIET_CALLS, mapOf(QUIET_CALL_NOTIFICATION to listOf(method)))
        val code = method.code()
        assertEquals(Opcode.INVOKE_STATIC_RANGE, code[0].opcode)
        assertEquals(QUIET_CALL_NOTIFICATION_CALL, (code[0] as ReferenceInstruction).reference.toString())
        // p0 and p1, the notification and the context, with no local register needed.
        assertEquals(listOf(0, 2), (code[0] as RegisterRangeInstruction).let { listOf(it.startRegister, it.registerCount) })
        assertEquals(Opcode.MOVE_RESULT_OBJECT, code[1].opcode)
        assertEquals(0, (code[1] as OneRegisterInstruction).registerA)
        assertEquals(before, code.drop(2))
    }

    @Test fun anUnusableMethodRefusesTheSwitchBeforeAnyEdit() {
        // Each bad method sits after a good one, so the good one would already be edited if the proof ran per method.
        val cases = mapOf(
            "a decision with no ringtone branch" to (poster() to (QUIET_CALL_RING to decision(DECISION_BODY.replace("if-nez v1, :skip\n", "")))),
            "a poster that loops back to its start" to (decision() to (QUIET_CALL_NOTIFICATION to loopingPoster())),
            "the poster as the decision" to (poster() to (QUIET_CALL_RING to poster())),
        )
        for ((case, pair) in cases) {
            val (good, badHook) = pair
            val (hook, bad) = badHook
            val goodHook = if (hook == QUIET_CALL_RING) QUIET_CALL_NOTIFICATION else QUIET_CALL_RING
            val goodBefore = good.code()
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(QUIET_CALLS, linkedMapOf(goodHook to listOf(good), hook to listOf(bad))) }
            assertEquals(goodBefore, good.code(), case)
            assertEquals(badBefore, bad.code(), case)
        }
        // The looping poster still looks like the poster, so discovery and the hook list take it and only the proof refuses it.
        val looping = quietCallsFixture(posters = listOf(loopingPoster()))
        assertEquals(listOf(SYNTHETIC_CALL_POSTER), found(looping, QUIET_CALL_NOTIFICATION))
        validateControls(mirroredControls(looping), setOf(QUIET_CALL_NOTIFICATION))
        assertFailsWith<PatchException> { loopingPoster().validateHook(QUIET_CALL_NOTIFICATION) }
    }

    @Test fun everySupportedBuildQuietsTheSameDecisionAndPoster() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val deciders = findQuietCallRing(classes)
            val posters = findQuietCallNotification(classes)
            assertEquals(activeProfile.hooks.getValue(QUIET_CALL_RING), deciders.map { it.hookId() }.toSet(), code)
            assertEquals(activeProfile.hooks.getValue(QUIET_CALL_NOTIFICATION), posters.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(QUIET_CALL_RING to deciders, QUIET_CALL_NOTIFICATION to posters), both)

            val decider = MutableMethod(deciders.single())
            val ring = decider.quietRing()!!
            val before = decider.code()
            decider.injectQuietCallRing()
            val after = decider.code()
            assertEquals("$SETTINGS->quietIncomingCalls()Z", (after[ring.index] as ReferenceInstruction).reference.toString(), code)
            assertEquals(ring.flag, (after[ring.index + 1] as OneRegisterInstruction).registerA, code)
            assertEquals(Opcode.IF_NEZ, after[ring.index + 2].opcode, code)
            assertEquals(after.branchTarget(ring.index - 1), after.branchTarget(ring.index + 2), code)
            assertEquals(before.map { it.opcode }.filter { it != Opcode.NOP },
                (after.take(ring.index) + after.drop(ring.index + 3)).map { it.opcode }.filter { it != Opcode.NOP }, code)

            val poster = MutableMethod(posters.single())
            val posterBefore = poster.code()
            poster.injectQuietCallNotification()
            val posterAfter = poster.code()
            assertEquals(QUIET_CALL_NOTIFICATION_CALL, (posterAfter[0] as ReferenceInstruction).reference.toString(), code)
            assertEquals(Opcode.MOVE_RESULT_OBJECT, posterAfter[1].opcode, code)
            assertEquals(posterBefore.map { it.opcode }.filter { it != Opcode.NOP }, posterAfter.drop(2).map { it.opcode }.filter { it != Opcode.NOP }, code)
        }
    }
}
