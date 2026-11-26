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
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

internal const val SYNTHETIC_DWELL_REPORT = "LX/S5K;->A02(LX/S5K;Ljava/lang/String;J)V"
private val DWELL_STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

/**
 * The session's end-of-session method cut to its shape as 587 wrote it: the live-session check, then the report under the gate that
 * asks whether it's sampled, then the journey copy under its own gate. The outer check comes before the report is
 * named, so the switch has to pass it over and take the next gate.
 */
private val DWELL_BODY = """
    invoke-static {}, LX/S5K;->A03()Z
    move-result v0
    if-eqz v0, :done
    const-string v1, "$DWELL_EVENT"
    invoke-static {v1}, LX/0IG;->A01(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :journey
    const-string v1, "$DWELL_TIMESTAMPS"
    invoke-static {v1}, LX/0IG;->Db2(Ljava/lang/String;)V
    :journey
    invoke-static {}, LX/18A;->A1Z()Z
    move-result v0
    if-eqz v0, :done
    const-string v1, "$DWELL_JOURNEY"
    invoke-static {v1}, LX/S68;->A0A(Ljava/lang/String;)V
    :done
    return-void
""".trimIndent()

/** 588's shape: the same report with no journey copy after it, so the report's gate is the only one. */
private val DWELL_BODY_588 = """
    invoke-static {}, LX/S5K;->A03()Z
    move-result v0
    if-eqz v0, :done
    const-string v1, "$DWELL_EVENT"
    invoke-static {v1}, LX/0IG;->A01(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :done
    const-string v1, "$DWELL_TIMESTAMPS"
    invoke-static {v1}, LX/0IG;->Db2(Ljava/lang/String;)V
    :done
    return-void
""".trimIndent()

private fun dwellReport(id: String = SYNTHETIC_DWELL_REPORT, body: String = DWELL_BODY, registers: Int = 6,
    flags: Int = DWELL_STATIC) = fixtureMethod(id, body, registers, flags)

/** The report beside a method of the same class that shares part of its shape and never gets a hook. */
internal fun dwellTrackingFixture(report: MutableMethod = dwellReport()): List<MutableClass> = listOf(
    fixtureClass("LX/S5K;", listOf(report,
        fixtureMethod("LX/S5K;->A01(LX/S5K;Ljava/lang/String;J)V",
            "const-string v1, \"$DWELL_EVENT\"\nreturn-void", 6, DWELL_STATIC))),
)

private fun Method.code() = implementation!!.instructions.toList()
private fun Instruction.ref() = (this as ReferenceInstruction).reference.toString()

class DwellTrackingTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(DWELL_TRACKING).map { it.hookId() }.toSet()

    @Test fun theReportIsFoundByItsShapeAndTheTwoNamesItFiles() {
        assertEquals(setOf(SYNTHETIC_DWELL_REPORT), found(dwellTrackingFixture()))
        validateControls(mirroredControls(dwellTrackingFixture()), setOf(DWELL_TRACKING))
    }

    @Test fun everyProfileHooksTheReport() {
        assertEquals(setOf("LX/ekt;->A02(LX/ekt;Ljava/lang/String;J)V"), BASE_PROFILE.hooks.getValue(DWELL_TRACKING))
        assertEquals(setOf(SYNTHETIC_DWELL_REPORT), SYNTHETIC_PROFILE.hooks.getValue(DWELL_TRACKING))
        for ((code, profile) in controlProfiles) {
            assertEquals(1, profile.hooks.getValue(DWELL_TRACKING).size, code.toString())
        }
    }

    @Test fun lookalikesAreNotTheDwellReport() {
        val cases = mapOf(
            "without the timestamps" to dwellReport(body = DWELL_BODY.replace(DWELL_TIMESTAMPS, "other_timestamps")),
            "without the report's name" to dwellReport(body = DWELL_BODY.replace(DWELL_EVENT, "fb_ads_other_dwell")),
            "as an instance method" to dwellReport(flags = AccessFlags.PUBLIC.value),
            "without its own class first" to dwellReport(id = "LX/S5K;->A02(Ljava/lang/String;Ljava/lang/String;J)V"),
            "with an int where the time goes" to dwellReport(id = "LX/S5K;->A02(LX/S5K;Ljava/lang/String;I)V", registers = 5),
            "returning a value" to dwellReport(id = "LX/S5K;->A02(LX/S5K;Ljava/lang/String;J)Z",
                body = DWELL_BODY.replace("return-void", "const/4 v0, 0x0\nreturn v0")),
        )
        for ((case, method) in cases) {
            assertEquals(emptySet(), found(dwellTrackingFixture(report = method)), case)
        }
    }

    @Test fun bothGatesAnswerThroughTheExtensionAndNothingElseMoves() {
        val method = dwellReport()
        val before = method.code()
        val gates = method.validateDwellTracking()
        assertEquals(listOf(6, 11), gates.map { it.branch })
        assertEquals(listOf(0, 0), gates.map { it.answer })
        injectControl(DWELL_TRACKING, mapOf(DWELL_TRACKING to listOf(method)))
        val code = method.code()
        for (at in listOf(6, 13)) {
            assertEquals(DWELL_HELPER, code[at].ref(), at.toString())
            assertEquals(Opcode.MOVE_RESULT, code[at + 1].opcode, at.toString())
            assertEquals(0, (code[at + 1] as OneRegisterInstruction).registerA, at.toString())
            assertEquals(Opcode.IF_EQZ, code[at + 2].opcode, at.toString())
        }
        // The outer live-session check keeps Messenger's own answer, and the rest of the method is untouched.
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        assertEquals("LX/S5K;->A03()Z", code[0].ref())
        assertEquals(before, code.take(6) + code.subList(8, 13) + code.drop(15))
    }

    @Test fun a588ReportWithNoJourneyCopyGatesTheReportAlone() {
        val method = dwellReport(body = DWELL_BODY_588)
        assertEquals(setOf(SYNTHETIC_DWELL_REPORT), found(dwellTrackingFixture(report = method)))
        val before = method.code()
        assertEquals(listOf(DwellGate(6, 0)), method.validateDwellTracking())
        injectControl(DWELL_TRACKING, mapOf(DWELL_TRACKING to listOf(method)))
        val code = method.code()
        assertEquals(DWELL_HELPER, code[6].ref())
        assertEquals(Opcode.MOVE_RESULT, code[7].opcode)
        assertEquals(0, (code[7] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_EQZ, code[8].opcode)
        assertEquals(1, code.count { (it as? ReferenceInstruction)?.reference?.toString() == DWELL_HELPER })
        // The live-session check keeps Messenger's answer, and the gate still skips the whole report.
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        assertEquals(Opcode.RETURN_VOID, code[code.branchTarget(8)].opcode)
        assertEquals(before, code.take(6) + code.drop(8))
        // A gate that doesn't skip the report is still refused with no copy behind it.
        val loose = dwellReport(body = DWELL_BODY_588.replace("if-eqz v0, :done\nconst-string v1, \"$DWELL_TIMESTAMPS\"",
            "if-eqz v0, :next\n:next\nconst-string v1, \"$DWELL_TIMESTAMPS\""))
        val refused = assertFailsWith<PatchException> { injectControl(DWELL_TRACKING, mapOf(DWELL_TRACKING to listOf(loose))) }
        assertTrue(refused.message!!.contains("the report's gate doesn't skip the report"), refused.message)
    }

    @Test fun aChangedReportRefusesBeforeAnyEdit() {
        // Each key is the reason the patch has to give, so a mutation that stops applying can't pass on another's refusal.
        val bodies = mapOf(
            "the journey copy comes before the report" to DWELL_BODY.replace("\"$DWELL_JOURNEY\"", "\"zz_journey\"")
                .replace("const-string v1, \"$DWELL_EVENT\"", "const-string v1, \"$DWELL_JOURNEY\"\nconst-string v1, \"$DWELL_EVENT\""),
            "$DWELL_EVENT is read 2 times" to DWELL_BODY.replace("const-string v1, \"$DWELL_TIMESTAMPS\"",
                "const-string v1, \"$DWELL_EVENT\"\nconst-string v1, \"$DWELL_TIMESTAMPS\""),
            "the report's gate sits inside its own block" to DWELL_BODY
                .replace("move-result v0\nif-eqz v0, :journey", "move-result v0\n:retry\nif-eqz v0, :journey")
                .replace("invoke-static {v1}, LX/S68;->A0A(Ljava/lang/String;)V",
                    "invoke-static {v1}, LX/S68;->A0A(Ljava/lang/String;)V\ngoto :retry"),
            "the report's gate doesn't skip the report" to DWELL_BODY.replace("if-eqz v0, :journey", "if-eqz v0, :named")
                .replace("const-string v1, \"$DWELL_EVENT\"", ":named\nconst-string v1, \"$DWELL_EVENT\""),
            "the journey copy's gate doesn't skip the copy" to DWELL_BODY.replace(
                "if-eqz v0, :done\nconst-string v1, \"$DWELL_JOURNEY\"",
                "if-eqz v0, :copy\n:copy\nconst-string v1, \"$DWELL_JOURNEY\""),
            "one gate answers for both blocks" to DWELL_BODY.replace("invoke-static {}, LX/18A;->A1Z()Z\nmove-result v0\nif-eqz v0, :done\n", ""),
        )
        for ((reason, body) in bodies) {
            assertTrue(body != DWELL_BODY, reason)
            val method = dwellReport(body = body)
            val before = method.code()
            val refused = assertFailsWith<PatchException>(reason) {
                injectControl(DWELL_TRACKING, mapOf(DWELL_TRACKING to listOf(method)))
            }
            assertTrue(refused.message!!.contains(reason), "$reason: ${refused.message}")
            assertEquals(before, method.code(), reason)
        }
    }

    @Test fun everySupportedBuildDropsTheReport() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val reports = findDwellTracking(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(DWELL_TRACKING), reports.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(DWELL_TRACKING to reports), setOf(DWELL_TRACKING))
            val method = MutableMethod(reports.single())
            val before = method.code()
            val gates = method.validateDwellTracking()
            injectControl(DWELL_TRACKING, mapOf(DWELL_TRACKING to listOf(method)))
            val after = method.code()
            // Each gate moved along by the two instructions every earlier gate took.
            val hooks = gates.mapIndexed { index, gate -> gate.branch + 2 * index }
            for ((at, gate) in hooks.zip(gates)) {
                assertEquals(DWELL_HELPER, after[at].ref(), "$code@$at")
                assertEquals(Opcode.MOVE_RESULT, after[at + 1].opcode, "$code@$at")
                assertEquals(gate.answer, (after[at + 1] as OneRegisterInstruction).registerA, "$code@$at")
                assertEquals(Opcode.IF_EQZ, after[at + 2].opcode, "$code@$at")
            }
            val added = hooks.flatMap { listOf(it, it + 1) }.toSet()
            assertEquals(before.map { it.opcode }, after.filterIndexed { i, _ -> i !in added }.map { it.opcode }, code)
        }
    }
}
