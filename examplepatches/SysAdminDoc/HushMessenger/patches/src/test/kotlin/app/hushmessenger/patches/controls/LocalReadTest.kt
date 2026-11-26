package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val UNREAD_OWNER = "LX/2ac;"
private const val SNIPPET_READ = "$UNREAD_SNIPPET->A00($THREAD_SUMMARY)LX/2zS;"
internal const val SYNTHETIC_LOCAL_READ = "$UNREAD_OWNER->A0J($THREAD_SUMMARY)Z"

/**
 * Build 347415354's unread answer, whole: the muted branch that answers on its own, then the newest message taken as
 * the later of the last message and the last snippet, compared against the time the chat was read.
 */
private val UNREAD_BODY = """
    const/4 v5, 0x0
    invoke-static {v7, v5}, LX/cLd;->A0i(Ljava/lang/Object;I)V
    iget-object v0, v7, $THREAD_SUMMARY->A0e:$THREAD_KEY_TYPE
    invoke-virtual {v0}, $THREAD_KEY_TYPE->A1i()Z
    move-result v0
    const-wide/16 v3, 0x0
    const/4 v6, 0x1
    if-nez v0, :folder
    iget-object v1, v7, $THREAD_SUMMARY->A10:LX/19t;
    if-eqz v1, :messages
    sget-object v0, LX/19t;->A0G:LX/19t;
    if-ne v1, v0, :messages
    :folder
    iget-wide v1, v7, $THREAD_SUMMARY->A0N:J
    cmp-long v0, v3, v1
    if-lez v0, :read
    return v6
    :messages
    invoke-static {v7}, $UNREAD_OWNER->A0B($THREAD_SUMMARY)Z
    move-result v0
    if-nez v0, :read
    iget-boolean v0, v7, $THREAD_SUMMARY->A2E:Z
    if-nez v0, :read
    iget-wide v3, v7, $THREAD_SUMMARY->A0A:J
    const-wide/16 v1, -0x1
    cmp-long v0, v3, v1
    if-nez v0, :newest
    iget-wide v3, v7, $THREAD_SUMMARY->A0M:J
    :newest
    iget-wide v0, v7, $THREAD_SUMMARY->A0D:J
    invoke-static {v3, v4, v0, v1}, Ljava/lang/Math;->max(JJ)J
    move-result-wide v3
    iget-wide v1, v7, $THREAD_SUMMARY->A0C:J
    cmp-long v0, v1, v3
    if-gez v0, :read
    return v6
    :read
    return v5
""".trimIndent()

/** The snippet's own method, which asks the answer before it builds anything. */
private val SNIPPET_BODY = """
    invoke-static {p1}, $SYNTHETIC_LOCAL_READ
    move-result v0
    const/4 v0, 0x0
    return-object v0
""".trimIndent()

/** Smali bodies are trimmed flush left, so a pattern that carries indentation would quietly leave the body stock. */
private fun String.changedTo(target: String, replacement: String): String {
    assertTrue(contains(target), "the fixture body no longer contains: $target")
    return replace(target, replacement)
}

private fun unread(body: String = UNREAD_BODY, id: String = SYNTHETIC_LOCAL_READ, registers: Int = 8): MutableMethod =
    fixtureMethod(id, body, registers = registers, flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)

private fun snippet(body: String = SNIPPET_BODY, id: String = SNIPPET_READ): MutableMethod =
    fixtureMethod(id, body, registers = 3)

internal fun localReadFixture(
    answers: List<MutableMethod> = listOf(unread()),
    snippets: List<MutableMethod> = listOf(snippet()),
): List<MutableClass> = (answers + snippets).groupBy { it.definingClass }
    .map { (type, methods) -> fixtureClass(type, methods) }

class LocalReadTest {
    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(LOCAL_READ).map { it.hookId() }.toSet()

    @Test fun theSnippetNamesTheOneUnreadAnswerTheChatListShares() {
        assertEquals(setOf(SYNTHETIC_LOCAL_READ), found(localReadFixture()))
        validateControls(mirroredControls(localReadFixture()), setOf(LOCAL_READ))
        assertEquals(setOf(SYNTHETIC_LOCAL_READ), SYNTHETIC_PROFILE.hooks.getValue(LOCAL_READ))
        assertEquals(1, BASE_PROFILE.hooks.getValue(LOCAL_READ).size)
    }

    @Test fun lookalikesAreNotTheAnswer() {
        val cases = mapOf(
            "no snippet class" to localReadFixture(snippets = emptyList()),
            "the snippet asks two answers" to localReadFixture(
                answers = listOf(unread(), unread(id = "LX/Other;->A0J($THREAD_SUMMARY)Z")),
                snippets = listOf(snippet(SNIPPET_BODY.changedTo("move-result v0",
                    "move-result v0\ninvoke-static {p1}, LX/Other;->A0J($THREAD_SUMMARY)Z"))),
            ),
            "the snippet asks nothing" to localReadFixture(snippets = listOf(snippet("const/4 v0, 0x0\nreturn-object v0"))),
            "an answer that isn't static" to localReadFixture(answers = listOf(
                fixtureMethod(SYNTHETIC_LOCAL_READ, UNREAD_BODY, registers = 8))),
            "one comparison gone" to localReadFixture(answers = listOf(unread(UNREAD_BODY
                .changedTo("cmp-long v0, v3, v1\nif-lez v0, :read", "const/4 v0, 0x0\nif-eqz v0, :read")))),
            "no newest message" to localReadFixture(answers = listOf(unread(UNREAD_BODY
                .changedTo("invoke-static {v3, v4, v0, v1}, Ljava/lang/Math;->max(JJ)J\nmove-result-wide v3",
                    "move-wide v3, v0")))),
            "a time field fewer" to localReadFixture(answers = listOf(unread(UNREAD_BODY
                .changedTo("iget-wide v3, v7, $THREAD_SUMMARY->A0M:J", "iget-wide v3, v7, $THREAD_SUMMARY->A0A:J")))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(LOCAL_READ)) }
        }
    }

    @Test fun aChangedComparisonIsRefused() {
        val cases = mapOf(
            "the watermark read somewhere else" to UNREAD_BODY
                .changedTo("iget-wide v1, v7, $THREAD_SUMMARY->A0C:J\ncmp-long v0, v1, v3",
                    "iget-wide v1, v7, $THREAD_SUMMARY->A0C:J\nnop\ncmp-long v0, v1, v3"),
            "the comparison branching the other way" to UNREAD_BODY.changedTo("if-gez v0, :read", "if-ltz v0, :read"),
            "a jump into the seam" to UNREAD_BODY.changedTo("if-nez v0, :read\niget-wide v3", "if-nez v0, :late\niget-wide v3")
                .changedTo("iget-wide v1, v7, $THREAD_SUMMARY->A0C:J", ":late\niget-wide v1, v7, $THREAD_SUMMARY->A0C:J"),
            "the newest message overwritten" to UNREAD_BODY
                .changedTo("iget-wide v1, v7, $THREAD_SUMMARY->A0C:J", "const-wide/16 v3, 0x1\niget-wide v1, v7, $THREAD_SUMMARY->A0C:J"),
            // The chat's key goes in the watermark's pair, so the watermark can't be wanted after the comparison.
            "the watermark read after the comparison" to UNREAD_BODY.changedTo("if-gez v0, :read\nreturn v6", "if-gez v0, :read\nmove-wide v3, v1\nreturn v6"),
            "the answer sharing the watermark's pair" to UNREAD_BODY.changedTo("cmp-long v0, v1, v3\nif-gez v0, :read", "cmp-long v2, v1, v3\nif-gez v2, :read"),
            // The summary goes to the extension straight out of its parameter register.
            "the summary register reused" to UNREAD_BODY.changedTo(":read\nreturn v5", ":read\nconst/4 v7, 0x0\nreturn v5"),
        )
        for ((case, body) in cases) assertFailsWith<PatchException>(case) { unread(body).validateLocalRead() }
    }

    @Test fun messengersAnswerGoesToTheExtensionRightAfterTheComparison() {
        val method = unread()
        val before = method.implementation!!.instructions.toList()
        val comparison = before.indices.last { before[it].opcode == Opcode.CMP_LONG }
        val compare = before[comparison] as ThreeRegisterInstruction
        val answer = compare.registerA
        val watermark = compare.registerB
        val newest = compare.registerC
        injectControl(LOCAL_READ, mapOf(LOCAL_READ to listOf(method)))
        val code = method.implementation!!.instructions.toList()
        // The stock comparison runs first, for every chat.
        assertTrue(code[comparison] === before[comparison])
        val key = code[comparison + 1] as TwoRegisterInstruction
        assertEquals(Opcode.IGET_OBJECT, key.opcode)
        assertEquals("$THREAD_SUMMARY->A0e:$THREAD_KEY_TYPE", (key as ReferenceInstruction).reference.toString())
        assertEquals(watermark, key.registerA, "the chat's key takes the watermark's register, done with by now")
        val call = code[comparison + 2] as ReferenceInstruction
        assertEquals(Opcode.INVOKE_STATIC, (call as com.android.tools.smali.dexlib2.iface.instruction.Instruction).opcode)
        assertEquals(READ_LOCALLY_HELPER, call.reference.toString())
        // #222: the summary goes along so a row drawn before a mark keeps its answer, and Messenger's answer so the
        // extension knows which chats it still counts on the badge.
        val passed = call as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
        val summary = method.implementation!!.registerCount - 1
        assertEquals(listOf(watermark, summary, newest, newest + 1, answer),
            listOf(passed.registerC, passed.registerD, passed.registerE, passed.registerF, passed.registerG))
        assertEquals(Opcode.MOVE_RESULT, code[comparison + 3].opcode)
        assertEquals(answer, (code[comparison + 3] as OneRegisterInstruction).registerA)
        // Messenger's own branch reads what comes back, and nothing stock moves or changes.
        assertEquals(Opcode.IF_GEZ, code[comparison + 4].opcode)
        assertEquals(answer, (code[comparison + 4] as OneRegisterInstruction).registerA)
        assertStockKept(before, code.take(comparison + 1) + code.drop(comparison + 4), "fixture")
    }

    /** #222: Mark as read stays on this phone asks for the same hook, and it has to go in once however many patches do. */
    @Test fun aSecondPatchFindsTheHookAlreadyIn() {
        val method = unread()
        injectControl(LOCAL_READ, mapOf(LOCAL_READ to listOf(method)))
        val once = method.implementation!!.instructions.toList()
        assertTrue(method.localReadHooked())
        injectControl(MARK_READ_LOCALLY, mapOf(LOCAL_READ to listOf(method)))
        assertEquals(once, method.implementation!!.instructions.toList())
    }
}
