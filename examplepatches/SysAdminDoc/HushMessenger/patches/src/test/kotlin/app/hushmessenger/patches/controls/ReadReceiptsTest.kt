package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val SEEN_HANDLER = "LX/4lQ;"
internal const val SYNTHETIC_CHAT_SEEN = "$SEEN_HANDLER->A00($FB_USER_SESSION${SEEN_HANDLER}Ljava/lang/String;)V"
internal const val SYNTHETIC_SEND_EVENT = "LX/Send;->A01(${FB_USER_SESSION}LX/A;LX/B;LX/Capabilities;LX/Dispatch;LX/C;LX/D;LX/ThreadProvider;LX/E;LX/F;LX/G;${SEND_MESSAGE_EVENT}LX/Map;LX/H;Ljava/lang/String;)V"
private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
private val FINAL = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value
private val SEEN_BODY = "const-string v0, \"$CHAT_SEEN_JOB\"\nconst-string v1, \"$CHAT_SEEN_TRACE\"\nreturn-void"
private const val DISPATCH = "LX/Dispatch;->send(${FB_USER_SESSION}LX/Enum;LX/Message;Ljava/lang/String;Ljava/lang/String;)V"

/** Keep the native instruction positions while omitting unrelated composer logic. The default is 585's arm64 body. */
private fun sendBody(changes: Map<Int, String> = emptyMap(), shape: ReplyReadShape = REPLY_READ_SHAPE, size: Int = shape.sizes.max()): String {
    val c = MutableList(size) { "nop" }
    val n = shape.nullThread
    val d = shape.dispatch
    val s = d - shape.stage
    mapOf(
        1 to "const-string v0, \"AdapterSender\"", 2 to "const-string v0, \"meta_ai_invocation\"",
        4 to "move-object/from16 v7, p11", shape.composer to "move-object/from16 v${shape.composerReg}, p4", shape.session to "move-object/from16 v10, p0",
        n to "const/4 v5, 0x0", n + 1 to "if-eqz p7, :null_thread",
        n + 2 to "invoke-interface/range {p7 .. p7}, LX/ThreadProvider;->thread()$THREAD_KEY_TYPE", n + 3 to "move-result-object v12",
        n + 4 to ":thread_ready\nnop", n + 5 to "goto/16 :send_stage", shape.absent - 1 to "goto :thread_ready",
        shape.absent to ":null_thread\nmove-object v12, v5", shape.absent + 1 to "goto :thread_ready",
        s - 3 to ":send_stage\nnop", s - 1 to "move-object/from16 v11, v${shape.composerReg}", s to "move-object v12, v10", d - 2 to "move-object v15, v0",
        d to "invoke-interface/range {v11 .. v16}, $DISPATCH", d + 1 to "const/4 v0, 0x0", d + 2 to "const/4 v1, 0x0", d + 33 to "return-void",
        size - 1 to "return-void",
    ).plus(changes).forEach { (i, value) -> c[i] = value }
    return c.joinToString("\n")
}
private fun seen(body: String = SEEN_BODY, registers: Int = 9) = fixtureMethod(SYNTHETIC_CHAT_SEEN, body, registers, STATIC)
private fun send(changes: Map<Int, String> = emptyMap(), shape: ReplyReadShape = REPLY_READ_SHAPE) =
    fixtureMethod(SYNTHETIC_SEND_EVENT, sendBody(changes, shape), 35, STATIC)
private fun Method.code() = implementation!!.instructions.map { ImmutableInstruction.of(it) }
private fun assertStockCode(before: List<Instruction>, after: List<Instruction>, inserted: Set<Int>, label: String) {
    val positions = after.indices.filter { it !in inserted }
    // Smali widens a short goto when insertion pushes its existing destination beyond the encoded distance.
    fun opcode(i: Instruction) = if (i.opcode in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)) Opcode.GOTO else i.opcode
    assertEquals(before.map(::opcode), positions.map { opcode(after[it]) }, label)
    before.indices.forEach { i ->
        if (before[i] is OffsetInstruction) assertEquals(before.branchTarget(i), positions.indexOf(after.branchTarget(positions[i])), label)
        if (before[i] is ReferenceInstruction) assertEquals((before[i] as ReferenceInstruction).reference.toString(), (after[positions[i]] as ReferenceInstruction).reference.toString(), label)
    }
}
private fun field(owner: String, name: String, type: String, flags: Int = FINAL) = ImmutableField(owner, name, type, flags, null, null, null)

internal fun readReceiptsFixture(seenMethod: MutableMethod = seen(), sendMethod: MutableMethod = send()): List<MutableClass> = listOf(
    fixtureClass(SEEN_HANDLER, listOf(seenMethod, fixtureMethod("$SEEN_HANDLER-><init>($FB_USER_SESSION$THREAD_KEY_TYPE)V", """
        invoke-direct {p0}, Ljava/lang/Object;-><init>()V
        iput-object p2, p0, $SEEN_HANDLER->A04:$THREAD_KEY_TYPE
        return-void
    """.trimIndent(), 4, AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value)), extraFields = listOf(field(SEEN_HANDLER, "A04", THREAD_KEY_TYPE))),
    fixtureClass(sendMethod.definingClass, listOf(sendMethod)),
    fixtureClass(THREAD_KEY_TYPE, listOf(fixtureMethod("$THREAD_KEY_TYPE->equals(Ljava/lang/Object;)Z", "iget v0, p0, $THREAD_KEY_TYPE->key:I\nreturn v0", 3)),
        extraFields = listOf(field(THREAD_KEY_TYPE, "key", "I")), flags = FINAL),
    fixtureClass("LX/AX0;", listOf(fixtureMethod("LX/AX0;->run()V", "return-void")), "ReadThreadManager\$1"),
)

class ReadReceiptsTest {
    @AfterTest fun reset() { activeProfile = SYNTHETIC_PROFILE; readReceiptThreadFields = emptyMap() }

    @Test fun discoveryFindsTheTypedSendPathAndLeavesTheReadManagerAlone() {
        val hooks = mirroredControls(readReceiptsFixture())
        assertEquals(listOf(SYNTHETIC_CHAT_SEEN), hooks.getValue(HIDE_READ_RECEIPTS).map { it.hookId() })
        assertEquals(listOf(SYNTHETIC_SEND_EVENT), hooks.getValue(REPLY_READ).map { it.hookId() })
        validateControls(hooks, setOf(HIDE_READ_RECEIPTS, REPLY_READ))
        assertTrue(hooks.values.flatten().none { it.definingClass == "LX/AX0;" })
    }

    @Test fun eventConstructionDoesNotCountAsSending() {
        val ctor = fixtureMethod("$SEND_MESSAGE_EVENT-><init>(LX/Enum;LX/Payload;Ljava/lang/String;Ljava/lang/String;Z)V", "return-void", 6)
        assertTrue(findReplyRead(listOf(fixtureClass(SEND_MESSAGE_EVENT, listOf(ctor)))).isEmpty())
    }

    @Test fun seenReceivesTheTypedAccountAndHandlerThreadBeforeAnyStockWork() {
        val method = seen()
        mirroredControls(readReceiptsFixture(seenMethod = method))
        val before = method.code()
        method.injectChatSeen()
        val c = method.code()
        assertEquals("$SEEN_HANDLER->A04:$THREAD_KEY_TYPE", (c[0] as ReferenceInstruction).reference.toString())
        assertEquals("$SETTINGS->hideChatSeen(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Z", (c[1] as ReferenceInstruction).reference.toString())
        // The account, the chat, then the handler and message id the Mark as read button replays.
        assertEquals(listOf(method.parameterRegister(0), 0, method.parameterRegister(1), method.parameterRegister(2)),
            (c[1] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD, it.registerE, it.registerF) })
        assertEquals(5, c.branchTarget(3))
        assertStockCode(before, c, (0..4).toSet(), "seen handler")
    }

    @Test fun replyIsRecordedOnlyAfterDispatchWithThePreservedThread() {
        val n = REPLY_READ_SHAPE.nullThread
        val d = REPLY_READ_SHAPE.dispatch
        val s = d - REPLY_READ_SHAPE.stage
        val method = send()
        val before = method.code()
        assertEquals(Opcode.INVOKE_INTERFACE_RANGE, before[n + 2].opcode)
        assertEquals("LX/ThreadProvider;->thread()$THREAD_KEY_TYPE", (before[n + 2] as ReferenceInstruction).reference.toString())
        assertEquals(method.parameterRegister(7), (before[n + 2] as RegisterRangeInstruction).startRegister)
        assertEquals(1, (before[n + 2] as RegisterRangeInstruction).registerCount)
        assertEquals(method.parameterTypes[7], ((before[n + 2] as ReferenceInstruction).reference as MethodReference).definingClass)
        assertEquals(emptyList(), ((before[n + 2] as ReferenceInstruction).reference as MethodReference).parameterTypes)
        assertEquals(THREAD_KEY_TYPE, ((before[n + 2] as ReferenceInstruction).reference as MethodReference).returnType)
        assertEquals(Opcode.MOVE_RESULT_OBJECT, before[n + 3].opcode)
        assertEquals(12, (before[n + 3] as OneRegisterInstruction).registerA)
        assertEquals(d, method.validateReplyRead())
        method.injectReplyRead()
        val c = method.code()
        assertEquals(Opcode.MOVE_OBJECT_16, c[s].opcode)
        assertEquals(DISPATCH, (c[d + 1] as ReferenceInstruction).reference.toString())
        assertEquals("$SETTINGS->noteMessageSent(Ljava/lang/Object;Ljava/lang/Object;)V", (c[d + 4] as ReferenceInstruction).reference.toString())
        assertStockCode(before, c, setOf(s, d + 2, d + 3, d + 4), "send dispatcher")
    }

    /** The 32-bit builds end four instructions sooner with the seam at the same indices. */
    @Test fun theShorter32BitBodyKeepsTheSameSeam() {
        val method = fixtureMethod(SYNTHETIC_SEND_EVENT, sendBody(size = REPLY_READ_SHAPE.sizes.min()), 35, STATIC)
        val before = method.code()
        val d = REPLY_READ_SHAPE.dispatch
        assertEquals(d, method.validateReplyRead())
        method.injectReplyRead()
        assertStockCode(before, method.code(), setOf(d - REPLY_READ_SHAPE.stage, d + 2, d + 3, d + 4), "32-bit send dispatcher")
    }

    /** Messenger 582's dispatcher had one more parameter check, so the same seam sat four instructions later. It's refused. */
    @Test fun a582DispatcherOrABodyOfAnotherSizeIsRefused() {
        val shape582 = ReplyReadShape(sizes = setOf(402), composer = 13, session = 25, nullThread = 31, absent = 73, dispatch = 239)
        for ((label, method) in listOf(
            "582 send dispatcher" to send(shape = shape582),
            "one more instruction" to fixtureMethod(SYNTHETIC_SEND_EVENT, sendBody() + "\nnop", 35, STATIC),
            "between the two sizes" to fixtureMethod(SYNTHETIC_SEND_EVENT, sendBody(size = 395), 35, STATIC),
        )) {
            val before = method.code()
            assertFailsWith<PatchException>(label) { method.injectReplyRead() }
            assertStockCode(before, method.code(), emptySet(), label)
        }
    }

    @Test fun changedIdentityFlowOrLiveScratchRefusesBothHooksBeforeAnyEdit() {
        val n = REPLY_READ_SHAPE.nullThread
        val d = REPLY_READ_SHAPE.dispatch
        val mutations = mapOf(
            "wrong account" to mapOf(REPLY_READ_SHAPE.session to "move-object/from16 v10, p1"),
            "changed provider" to mapOf(n + 2 to "invoke-interface/range {p7 .. p7}, LX/Other;->thread()$THREAD_KEY_TYPE"),
            "wrong thread type" to mapOf(n + 2 to "invoke-interface/range {p7 .. p7}, LX/ThreadProvider;->thread()Ljava/lang/Object;"),
            "thread overwritten" to mapOf(d - REPLY_READ_SHAPE.stage - 2 to "move-object v12, v10"),
            "branch into send" to mapOf(d - REPLY_READ_SHAPE.stage - 2 to "goto :bad_send", d to ":bad_send\ninvoke-interface/range {v11 .. v16}, $DISPATCH"),
            "saved parameter still used" to mapOf(d + 11 to "invoke-virtual/range {p13 .. p13}, LX/H;->use()V"),
            "scratch read on alternate path" to mapOf(d + 1 to "if-eqz v5, :scratch_use", d + 11 to ":scratch_use\ninvoke-static {v1}, LX/H;->use(Ljava/lang/Object;)V"),
        )
        for ((case, changes) in mutations) {
            val good = seen()
            val bad = send(changes)
            val hooks = mirroredControls(readReceiptsFixture(good, bad)).mapValues { (_, methods) -> methods.map { it as MutableMethod } }
            val before = listOf(good.code(), bad.code())
            assertFailsWith<PatchException>(case) { injectControl(HIDE_READ_RECEIPTS, hooks) }
            assertStockCode(before[0], good.code(), emptySet(), case)
            assertStockCode(before[1], bad.code(), emptySet(), case)
        }
    }

    @Test fun missingImmutableThreadContractOrCrampedRegistersRefuseSeen() {
        val fixture = readReceiptsFixture()
        mirroredControls(fixture.filter { it.type != THREAD_KEY_TYPE })
        assertFailsWith<PatchException> { seen().validateChatSeen() }
        mirroredControls(fixture)
        assertFailsWith<PatchException> { seen(SEEN_BODY.replace("v1", "v0"), 3).validateChatSeen() }
        val thread = fixture.single { it.type == THREAD_KEY_TYPE }
        val mutableKey = fixtureClass(THREAD_KEY_TYPE, thread.methods.toList(), extraFields = listOf(field(THREAD_KEY_TYPE, "key", "I", AccessFlags.PUBLIC.value)), flags = FINAL)
        mirroredControls(fixture.filter { it.type != THREAD_KEY_TYPE } + mutableKey)
        assertFailsWith<PatchException> { seen().validateChatSeen() }
    }

    @Test fun aThrowingScratchWriteDoesNotHideItsCatchRead() {
        val d = REPLY_READ_SHAPE.dispatch
        val method = send(mapOf(3 to "const-string v1, \"original scratch\"", d + 2 to "nop", d + 4 to "new-instance v1, Ljava/lang/Object;",
            300 to "move-exception v3", 301 to "invoke-static {v1}, LX/H;->use(Ljava/lang/Object;)V", 302 to "throw v3"))
        method.implementation!!.apply { addCatch(newLabelForIndex(d + 4), newLabelForIndex(d + 5), newLabelForIndex(300)) }
        val before = method.code()
        val failure = assertFailsWith<PatchException> { method.injectReplyRead() }
        assertTrue(failure.message!!.contains("identity flow"))
        assertStockCode(before, method.code(), emptySet(), "catch read")
    }

    @Test fun theNewCallbackCannotExtendANativeTryOverClobberedRegisters() {
        val method = send(mapOf(300 to "move-exception v3", 301 to "invoke-static {v0}, LX/H;->use(Ljava/lang/String;)V", 302 to "throw v3"))
        val d = REPLY_READ_SHAPE.dispatch
        method.implementation!!.apply { addCatch(newLabelForIndex(d), newLabelForIndex(d + 1), newLabelForIndex(300)) }
        val before = method.code()
        val failure = assertFailsWith<PatchException> { method.injectReplyRead() }
        assertTrue(failure.message!!.contains("unprotected send seam"))
        assertStockCode(before, method.code(), emptySet(), "callback catch")
    }

    @Test fun everySupportedBuildHasTheSameTypedContractAndPreservesStockInstructions() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            readReceiptThreadFields = resolveReadReceiptThreadFields(classes)
            val seens = findChatSeen(classes)
            val sends = findReplyRead(classes)
            assertEquals(activeProfile.hooks.getValue(HIDE_READ_RECEIPTS), seens.map { it.hookId() }.toSet(), code)
            assertEquals(activeProfile.hooks.getValue(REPLY_READ), sends.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(HIDE_READ_RECEIPTS to seens, REPLY_READ to sends), setOf(HIDE_READ_RECEIPTS, REPLY_READ))
            val seen = MutableMethod(seens.single())
            val seenBefore = seen.code().map { it.opcode }
            seen.injectChatSeen()
            assertEquals(seenBefore, seen.code().drop(5).map { it.opcode }, code)
            val send = MutableMethod(sends.single())
            val sendBefore = send.code()
            val d = send.validateReplyRead()
            send.injectReplyRead()
            assertStockCode(sendBefore, send.code(), setOf(d - REPLY_READ_SHAPE.stage, d + 2, d + 3, d + 4), code)
            assertTrue(lifecycleDex(listOf(fixtureClass(seen.definingClass, listOf(seen)), fixtureClass(send.definingClass, listOf(send)))).isNotEmpty(), code)
        }
    }
}
