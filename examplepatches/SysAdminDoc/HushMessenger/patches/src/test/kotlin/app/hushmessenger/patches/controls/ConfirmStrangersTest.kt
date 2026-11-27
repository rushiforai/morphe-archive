package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertSame
import kotlin.test.assertTrue

private const val HOST = "LX/ConfirmStrangers;"
private const val PARAMS = "LX/ConfirmStrangersParams;"
internal const val SYNTHETIC_CONFIRM_STRANGERS = "$HOST->A0K($HOST)V"
private const val PARAMS_FIELD = "$HOST->A0D:$PARAMS"
private const val SESSION_FIELD = "$HOST->A00:Lcom/facebook/auth/usersession/FbUserSession;"
private const val KEY_FIELD = "$PARAMS->A01:$THREAD_KEY_TYPE"
private const val STRANGER_MARK = "const-string v1, \"ComposeFragment.onSendClicked\""
private const val STRANGER_KEY_READ = "iget-object v0, v0, $KEY_FIELD"
private val STRANGER_STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
private val STRANGER_HOLDS = listOf(THREAD_KEY_TYPE, "Lcom/facebook/user/model/User;", "Lcom/facebook/messaging/model/messages/MessagesCollection;")
private val STRANGER_TABLES = setOf(Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH, Opcode.FILL_ARRAY_DATA)

/**
 * The compose fragment's send as 588 writes it (15 registers, so p0 is v14), cut to its start: the trace mark, the
 * session and parameters checks and the thread key read off the parameters, then the text send and the trace's end.
 */
private val STRANGER_SEND_BODY = """
    $STRANGER_MARK
    const v0, 0x135bab
    invoke-static {v1, v0}, LX/02k;->A05(Ljava/lang/String;I)V
    iget-object v0, p0, $SESSION_FIELD
    if-eqz v0, :done
    iget-object v0, p0, $PARAMS_FIELD
    if-eqz v0, :done
    $STRANGER_KEY_READ
    invoke-static {v0}, LX/690;->A02($THREAD_KEY_TYPE)Z
    move-result v0
    if-eqz v0, :done
    invoke-static {p0}, $HOST->A0S($HOST)V
    :done
    invoke-static {}, LX/02k;->A00()V
    return-void
""".trimIndent()

private fun strangerField(owner: String, name: String, type: String): Field =
    ImmutableField(owner, name, type, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null, null)

private val STRANGER_PARAMS_FIELDS = listOf(
    strangerField(PARAMS, "A00", "Lcom/facebook/messaging/model/messages/MessagesCollection;"),
    strangerField(PARAMS, "A01", THREAD_KEY_TYPE),
    strangerField(PARAMS, "A02", "Lcom/facebook/messaging/model/threads/ThreadSummary;"),
    strangerField(PARAMS, "A03", "Lcom/facebook/user/model/User;"),
)

private fun strangerSend(body: String = STRANGER_SEND_BODY, id: String = SYNTHETIC_CONFIRM_STRANGERS, flags: Int = STRANGER_STATIC, registers: Int = 15) =
    fixtureMethod(id, body, registers, flags)

/** The send in its fragment, and the chat view's parameters with the thread key, the person and the messages. */
internal fun confirmStrangersFixture(
    send: MutableMethod = strangerSend(),
    params: List<Field> = STRANGER_PARAMS_FIELDS,
): List<MutableClass> = listOf(
    fixtureClass(HOST, listOf(send), extraFields = listOf(strangerField(HOST, "A0D", PARAMS))),
    fixtureClass(PARAMS, extraFields = params),
)

private fun MutableMethod.strangerCode() = implementation!!.instructions.toList()

private fun List<Instruction>.strangerNoNops() = filter { it.opcode != Opcode.NOP }

private fun List<Instruction>.strangerCalls() =
    count { it.opcode == Opcode.INVOKE_STATIC && (it as ReferenceInstruction).reference.toString() == STRANGER_SEND_CALL }

/** Where each branch lands, by index. A switch's or array fill's own offset names its table, so it's left out. */
private fun List<Instruction>.strangerBranches() = indices
    .filter { this[it] is BuilderOffsetInstruction && this[it].opcode !in STRANGER_TABLES }
    .associateWith { (this[it] as BuilderOffsetInstruction).target.location.index }

/**
 * The gate went in at the top as six instructions, reading the fragment's own register into the one the stock trace
 * mark loads and the chat view's [params] off it, and every stock instruction and branch is where it was, six further on.
 */
private fun assertStrangerGate(method: MutableMethod, before: List<Instruction>, beforeBranches: Map<Int, Int>, params: String, label: String) {
    val after = method.strangerCode()
    val scratch = (before[0] as OneRegisterInstruction).registerA
    val fragment = method.implementation!!.registerCount - 1
    assertEquals(before.strangerNoNops().size + 6, after.strangerNoNops().size, label)
    assertEquals(Opcode.MOVE_OBJECT_FROM16, after[0].opcode, label)
    assertEquals(listOf(scratch, fragment), (after[0] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) }, label)
    assertEquals(Opcode.IGET_OBJECT, after[1].opcode, label)
    assertEquals(listOf(scratch, scratch), (after[1] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) }, label)
    assertEquals(params, (after[1] as ReferenceInstruction).reference.toString(), label)
    assertEquals(Opcode.INVOKE_STATIC, after[2].opcode, label)
    assertEquals(STRANGER_SEND_CALL, (after[2] as ReferenceInstruction).reference.toString(), label)
    assertEquals(listOf(1, scratch), (after[2] as FiveRegisterInstruction).let { listOf(it.registerCount, it.registerC) }, label)
    assertEquals(Opcode.MOVE_RESULT, after[3].opcode, label)
    assertEquals(scratch, (after[3] as OneRegisterInstruction).registerA, label)
    assertEquals(Opcode.IF_EQZ, after[4].opcode, label)
    assertEquals(scratch, (after[4] as OneRegisterInstruction).registerA, label)
    assertEquals(6, (after[4] as BuilderOffsetInstruction).target.location.index, "$label: false goes on at the trace mark")
    assertSame(before[0], after[6], label)
    assertEquals(Opcode.RETURN_VOID, after[5].opcode, label)
    assertStockKept(before.strangerNoNops(), after.drop(6).strangerNoNops(), label)
    val afterBranches = after.strangerBranches()
    assertEquals(beforeBranches.mapKeys { it.key + 6 }.mapValues { it.value + 6 }, afterBranches - 4, "$label: stock branches")
    assertEquals(1, after.strangerCalls(), label)
}

class ConfirmStrangersTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    @Test fun theFinderAndItsMirrorTakeTheStockSend() {
        assertEquals(setOf(SYNTHETIC_CONFIRM_STRANGERS), mirroredControls(confirmStrangersFixture()).getValue(CONFIRM_STRANGERS).map { it.hookId() }.toSet())
        validateControls(mirroredControls(confirmStrangersFixture()), setOf(CONFIRM_STRANGERS))
    }

    @Test fun theGateHoldsAtEntryAndOtherwiseRunsTheStockSend() {
        val send = strangerSend()
        val before = send.strangerCode()
        val branches = before.strangerBranches()
        assertTrue(branches.isNotEmpty())
        injectControl(CONFIRM_STRANGERS, mapOf(CONFIRM_STRANGERS to listOf(send)))
        assertStrangerGate(send, before, branches, PARAMS_FIELD, "fixture")
        assertEquals(14, (send.strangerCode()[0] as TwoRegisterInstruction).registerB)
    }

    @Test fun theGateBorrowsWhateverRegisterTheTraceMarkLoads() {
        val send = strangerSend(STRANGER_SEND_BODY.replace(STRANGER_MARK, "const-string v3, \"ComposeFragment.onSendClicked\"")
            .replace("invoke-static {v1, v0}, LX/02k", "invoke-static {v3, v0}, LX/02k"), registers = 12)
        val before = send.strangerCode()
        val branches = before.strangerBranches()
        send.injectConfirmStrangers()
        assertStrangerGate(send, before, branches, PARAMS_FIELD, "v3 and p0 in v11")
        assertEquals(3, (send.strangerCode()[0] as TwoRegisterInstruction).registerA)
        assertEquals(11, (send.strangerCode()[0] as TwoRegisterInstruction).registerB)
    }

    @Test fun aSecondPassLeavesTheGateAlone() {
        val send = strangerSend()
        injectControl(CONFIRM_STRANGERS, mapOf(CONFIRM_STRANGERS to listOf(send)))
        val once = send.strangerCode()
        injectControl(CONFIRM_STRANGERS, mapOf(CONFIRM_STRANGERS to listOf(send)))
        send.injectConfirmStrangers()
        val twice = send.strangerCode()
        assertEquals(once.size, twice.size)
        once.zip(twice).forEachIndexed { i, (a, b) -> assertSame(a, b, "instruction $i") }
        assertEquals(1, twice.strangerCalls())
    }

    @Test fun aSendOfAnotherShapeIsRefusedAndLeftAsItWas() {
        fun changed(from: String, to: String): String {
            assertEquals(1, STRANGER_SEND_BODY.split(from).size - 1, from)
            return STRANGER_SEND_BODY.replace(from, to)
        }
        val cases = listOf(
            "not static" to strangerSend(flags = AccessFlags.PUBLIC.value, id = "$HOST->A0K($HOST)V"),
            "another parameter" to strangerSend(id = "$HOST->A0K(Landroid/view/View;)V"),
            "two parameters" to strangerSend(id = "$HOST->A0K(${HOST}I)V", registers = 16),
            "an answer" to strangerSend(STRANGER_SEND_BODY.replace("return-void", "const/4 v0, 0x0\n    return v0"), id = "$HOST->A0K($HOST)Z"),
            "something before the trace mark" to strangerSend(changed(STRANGER_MARK, "const/4 v2, 0x0\n    $STRANGER_MARK")),
            "another trace mark" to strangerSend(changed(STRANGER_MARK, "const-string v1, \"ComposeFragment.onSendLongClicked\"")),
            "a branch onto the trace mark" to strangerSend(changed(STRANGER_MARK, ":top\n    $STRANGER_MARK")
                .replace("invoke-static {p0}, $HOST->A0S($HOST)V", "goto :top")),
            "the trace mark in the fragment's register" to strangerSend(changed(STRANGER_MARK, "const-string v14, \"ComposeFragment.onSendClicked\"")
                .replace("invoke-static {v1, v0}, LX/02k", "invoke-static {v14, v0}, LX/02k")),
            "the parameters read off another register" to strangerSend(changed("iget-object v0, p0, $PARAMS_FIELD", "iget-object v0, v5, $PARAMS_FIELD")),
            "no thread key read off the parameters" to strangerSend(changed(STRANGER_KEY_READ, "iget-object v0, v0, $PARAMS->A02:Lcom/facebook/messaging/model/threads/ThreadSummary;")),
            "the thread key read much later" to strangerSend(changed(STRANGER_KEY_READ, "nop\n    nop\n    $STRANGER_KEY_READ")),
            "two parameter fields" to strangerSend(changed(STRANGER_KEY_READ, "$STRANGER_KEY_READ\n    iget-object v2, p0, $HOST->A0E:$PARAMS\n    iget-object v2, v2, $KEY_FIELD")),
        )
        for ((case, bad) in cases) {
            val before = bad.strangerCode()
            assertEquals(emptyList(), findConfirmStrangers(confirmStrangersFixture(bad)).map { it.hookId() }, case)
            assertFailsWith<PatchException>(case) { injectControl(CONFIRM_STRANGERS, mapOf(CONFIRM_STRANGERS to listOf(bad))) }
            assertEquals(before, bad.strangerCode(), case)
        }
    }

    @Test fun parametersWithoutThePersonOrTheMessagesAreNotTheChatView() {
        for (missing in listOf("A00", "A03")) {
            val fields = STRANGER_PARAMS_FIELDS.filter { it.name != missing }
            assertEquals(emptyList(), mirroredControls(confirmStrangersFixture(params = fields)).getValue(CONFIRM_STRANGERS), missing)
        }
        val doubled = STRANGER_PARAMS_FIELDS + strangerField(PARAMS, "A04", "Lcom/facebook/user/model/User;")
        assertEquals(emptyList(), mirroredControls(confirmStrangersFixture(params = doubled)).getValue(CONFIRM_STRANGERS))
    }

    @Test fun everySupportedBuildGetsTheGateAtTheTopOfItsSend() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val hooks = findConfirmStrangers(classes)
            assertEquals(activeProfile.hooks.getValue(CONFIRM_STRANGERS), hooks.map { it.hookId() }.toSet(), code)
            assertEquals(1, hooks.size, code)
            validateControls(mapOf(CONFIRM_STRANGERS to hooks), setOf(CONFIRM_STRANGERS))
            // The send the caption control hooks too, further down.
            assertEquals(activeProfile.hooks.getValue(MEDIA_CAPTION), hooks.map { it.hookId() }.toSet(), code)
            // The fragment's one field the stock send reads whose class holds the chat's key, the other person and the
            // messages. Some builds keep a second field of that class on the fragment, which the send never reads.
            val byType = classes.associateBy { it.type }
            val readBySend = hooks.single().implementation!!.instructions.filter { it.opcode == Opcode.IGET_OBJECT }
                .mapNotNull { ((it as ReferenceInstruction).reference as? FieldReference)?.let { f -> "${f.definingClass}->${f.name}:${f.type}" } }.toSet()
            val params = byType.getValue(hooks.single().definingClass).fields.filter { field ->
                byType[field.type]?.fields?.map { it.type }?.let { types -> STRANGER_HOLDS.all { held -> types.count { it == held } == 1 } } == true
            }.map { "${it.definingClass}->${it.name}:${it.type}" }.filter { it in readBySend }.single()
            val send = MutableMethod(hooks.single())
            val before = send.strangerCode()
            val branches = before.strangerBranches()
            injectControl(CONFIRM_STRANGERS, mapOf(CONFIRM_STRANGERS to listOf(send)))
            assertStrangerGate(send, before, branches, params, code)
            send.injectConfirmStrangers()
            assertEquals(before.strangerNoNops().size + 6, send.strangerCode().strangerNoNops().size, "$code second pass")
            // The caption control still finds its site behind the gate, and the gate stays first behind its hook.
            send.injectMediaCaption()
            assertEquals(1, send.strangerCode().strangerCalls(), code)
            assertEquals(Opcode.MOVE_OBJECT_FROM16, send.strangerCode()[0].opcode, code)
            val captionFirst = MutableMethod(hooks.single())
            captionFirst.injectMediaCaption()
            val captioned = captionFirst.strangerCode()
            val captionedBranches = captioned.strangerBranches()
            captionFirst.injectConfirmStrangers()
            assertStrangerGate(captionFirst, captioned, captionedBranches, params, "$code after the caption hook")
        }
    }
}
