package app.hushmessenger.patches.controls

import app.hushmessenger.patches.CompatMirror
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val SUMMARY_CHECKS = "LX/5lp;"
private const val PILL_HANDLER = "LX/AMT;"
private const val SUMMARY_PARAMS = "$THREAD_KEY_TYPE${CAPABILITIES}JZZ"
internal const val SYNTHETIC_AI_SUMMARY = "$SUMMARY_CHECKS->A04($SUMMARY_PARAMS)Z"
/** The stricter check the top jump pill asks, which asks [SYNTHETIC_AI_SUMMARY] first. */
private const val NARROW_CHECK = "$SUMMARY_CHECKS->A03($THREAD_KEY_TYPE${CAPABILITIES}JZ)Z"
private const val OTHER_CHECK = "$SUMMARY_CHECKS->A05($SUMMARY_PARAMS)Z"
private const val PILL_EVENT = "$PILL_HANDLER->DDz($SUMMARY_CHECKS$THREAD_KEY_TYPE${CAPABILITIES}J)V"

/** The eligibility check cut down: no capabilities, or a chat that lacks the summary capability, gets a no. */
private fun summaryCheck(id: String = SYNTHETIC_AI_SUMMARY, registers: Int = 9) = fixtureMethod(id, """
    const/4 v0, 0x0
    if-eqz p2, :no
    const/16 v1, 0x100
    invoke-virtual {p2, v1}, $CAPABILITIES->A00(I)Z
    move-result v0
    :no
    return v0
""".trimIndent(), registers, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value)

/** The floating pill's event handler: it logs under its own name and asks each of [checks] before it shows the pill. */
private fun pillHandler(type: String = PILL_HANDLER, name: String = AI_SUMMARY_PILL, checks: List<String> = listOf(SYNTHETIC_AI_SUMMARY)) =
    fixtureClass(type, listOf(
        fixtureMethod("$type->Coe()Ljava/lang/String;", "const-string v0, \"$name\"\nreturn-object v0", 1),
        fixtureMethod(PILL_EVENT.replace(PILL_HANDLER, type), checks.joinToString("\n") { check ->
            "invoke-virtual/range {v0 .. v${parameterWords(check.substringAfter('(').substringBefore(')'))}}, $check\nmove-result v0"
        } + "\nreturn-void", 16),
    ))

/** Register words a check's parameters take, the receiver left out. */
private fun parameterWords(params: String) =
    Regex("\\[*(?:L[^;]+;|[ZBSCIJFD])").findAll(params).sumOf { if (it.value == "J" || it.value == "D") 2 else 1 }

private fun checks(vararg methods: Method): MutableClass = fixtureClass(SUMMARY_CHECKS, methods.toList())

/** The pill handler and the class holding the summary checks. */
internal fun aiSummaryFixture(check: Method = summaryCheck()): List<MutableClass> = listOf(pillHandler(), checks(check))

private fun Method.code() = implementation!!.instructions.toList()

class AiSummaryTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(AI_SUMMARY).map { it.hookId() }.toSet()

    @Test fun theCheckThePillHandlerAsksIsFound() {
        assertEquals(setOf(SYNTHETIC_AI_SUMMARY), found(aiSummaryFixture()))
        validateControls(mirroredControls(aiSummaryFixture()), setOf(AI_SUMMARY))
    }

    @Test fun theMappingHooksTheEligibilityCheck() {
        assertEquals(setOf(SYNTHETIC_AI_SUMMARY), SYNTHETIC_PROFILE.hooks.getValue(AI_SUMMARY))
        assertEquals(setOf("LX/5fQ;->A04(Lcom/facebook/messaging/model/threadkey/ThreadKey;" +
            "Lcom/facebook/xapp/messaging/capability/vector/Capabilities;JZZ)Z"), BASE_PROFILE.hooks.getValue(AI_SUMMARY))
        assertTrue(AI_SUMMARY in controlHooks.getValue("meta_ai"))
    }

    // Hide Meta AI answers no in place of the whole check. A check that isn't the pill's own, or one picked out of
    // several, could be something else Messenger asks, so none of them gets a hook.
    @Test fun anyOtherShapeLeavesTheControlUnapplied() {
        val abstractCheck = ImmutableMethod(SUMMARY_CHECKS, "A04",
            listOf(THREAD_KEY_TYPE, CAPABILITIES, "J", "Z", "Z").map { ImmutableMethodParameter(it, null, null) }, "Z",
            AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value, null, null, null)
        val cases = mapOf(
            "no pill handler" to listOf(pillHandler(name = "AiSummaryBottomSheet"), checks(summaryCheck())),
            "a second class naming the pill handler" to aiSummaryFixture() + pillHandler(type = "LX/AMU;"),
            "two different checks" to listOf(pillHandler(checks = listOf(SYNTHETIC_AI_SUMMARY, OTHER_CHECK)),
                checks(summaryCheck(), summaryCheck(OTHER_CHECK))),
            "only the narrower check" to listOf(pillHandler(checks = listOf(NARROW_CHECK)), checks(summaryCheck(NARROW_CHECK, 8))),
            "a check outside these classes" to listOf(pillHandler()),
            "a check with no code" to listOf(pillHandler(), checks(abstractCheck)),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(AI_SUMMARY)) }
        }
    }

    @Test fun aCheckWithNoLocalRegisterIsFoundButCompatReportRefusesItToo() {
        // Seven words: the receiver, the chat, its capabilities, the timestamp pair and the two states. Nothing is left for v0,
        // so the patch refuses it at injection, and CompatReport has to fail the build up front.
        val classes = aiSummaryFixture(summaryCheck(registers = 7))
        assertEquals(setOf(SYNTHETIC_AI_SUMMARY), found(classes))
        assertTrue(CompatMirror.controls(classes)[AI_SUMMARY].orEmpty().isEmpty())
        assertEquals(listOf(SYNTHETIC_AI_SUMMARY), CompatMirror.controls(aiSummaryFixture())[AI_SUMMARY])
    }

    @Test fun theSwitchAnswersNoBeforeTheCheckRuns() {
        val method = summaryCheck()
        val before = method.code()
        injectControl("meta_ai", mapOf(AI_SUMMARY to listOf(method)))
        val code = method.code()
        assertEquals("$SETTINGS->hideMetaAi()Z", (code[0] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.MOVE_RESULT, code[1].opcode)
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        assertEquals(Opcode.CONST_4, code[3].opcode)
        assertEquals(0, (code[3] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, code[4].opcode)
        assertEquals((code[3] as OneRegisterInstruction).registerA, (code[4] as OneRegisterInstruction).registerA)
        // Off, the branch lands on Messenger's own check, which runs as it was written.
        assertEquals(5, code.branchTarget(2))
        assertEquals(before.map { it.opcode }, code.drop(5).map { it.opcode })
    }

    @Test fun anUnusableMethodRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            "a check with no local register" to summaryCheck(registers = 7),
            "the narrower check" to summaryCheck(NARROW_CHECK, 8),
            "the pill's event handler" to MutableMethod(pillHandler().methods.single { it.name == "DDz" }),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl("meta_ai", mapOf(AI_SUMMARY to listOf(bad))) }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildHooksTheCheckEveryOfferAsks() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val hooks = findAiSummary(classes)
            assertEquals(activeProfile.hooks.getValue(AI_SUMMARY), hooks.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(AI_SUMMARY to hooks), setOf(AI_SUMMARY))
            val check = hooks.single().hookId()
            // The pill over the chat, the Summarize link on the unread divider and the inbox's summary pill all ask
            // this one check, directly or through the stricter one, so a no from it covers every offer.
            val callers = classes.flatMap { cls -> cls.methods.filter { method ->
                method.implementation?.instructions?.any { (it as? ReferenceInstruction)?.reference?.toString() == check } == true
            } }
            assertTrue(callers.size >= 4, "$code: ${callers.map { it.hookId() }}")
            val method = MutableMethod(hooks.single())
            val before = method.code()
            injectControl("meta_ai", mapOf(AI_SUMMARY to listOf(method)))
            assertEquals("$SETTINGS->hideMetaAi()Z", (method.code()[0] as ReferenceInstruction).reference.toString(), code)
            assertEquals(before.map { it.opcode }, method.code().drop(5).map { it.opcode }, code)
        }
    }
}
