package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val MRL_HOST = "LX/MarkThreads;"
private const val MRL_CALLS = "LX/MarkCalls;"
private const val MRL_FIELDS = "Lcom/facebook/messaging/service/model/MarkThreadFields;"
private const val MRL_READ_CALL = "invoke-interface {v2, v4, v3, v0}, $MRL_CALLS->EGB$MARK_THREAD_READ_SHAPE"
private const val MRL_UNREAD_CALL = "invoke-interface {v2, v4, v0}, $MRL_CALLS->EGF$MARK_THREAD_UNREAD_SHAPE"
internal const val SYNTHETIC_MARK_READ_LOCALLY = "$MRL_HOST->A06(LX/4QM;${MRL_HOST}Ljava/lang/String;)$MARK_THREADS_RESULT"

/**
 * Build 347617503's mark_threads handler. Its top checks the operation and takes the parcel, then every chat in it goes
 * down one of two ways by what's being marked: archived or not (kept short here), or read or unread.
 */
private val MRL_HEAD = """
    const/4 v5, 0x0
    const-string v0, "mark_threads"
    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :wrong_operation
    const-string v0, "markThreadsParams"
    invoke-static {v8, v0}, LX/7Bt;->A0P(LX/4QM;Ljava/lang/String;)Landroid/os/Parcelable;
    move-result-object v1
    check-cast v1, $MARK_THREADS_PARAMS
    iget-object v6, v1, $MARK_THREADS_PARAMS->A02:Ljava/lang/Integer;
    if-eqz v6, :no_mark
    iget-object v0, v1, $MARK_THREADS_PARAMS->A00:Lcom/google/common/collect/ImmutableList;
    invoke-static {v0}, LX/18l;->A0V(Lcom/google/common/collect/ImmutableCollection;)LX/DPY;
    move-result-object v8
    :next
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z
    move-result v0
    if-eqz v0, :done
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, $MRL_FIELDS
    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I
    move-result v0
    invoke-static {v1}, LX/csz;->A0p(Ljava/lang/Object;)V
    if-eq v0, v5, :read_state
    iget-object v2, v1, $MRL_FIELDS->A05:$THREAD_KEY_TYPE
    iget-object v0, v9, $MRL_HOST->A07:LX/19I;
    invoke-static {v0}, LX/19I;->A0F(LX/19I;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, LX/2FU;
    invoke-virtual {v0, v2}, LX/2FU;->A07($THREAD_KEY_TYPE)V
    goto :next
    :read_state
    iget-object v4, v1, $MRL_FIELDS->A05:$THREAD_KEY_TYPE
    iget-boolean v0, v1, $MRL_FIELDS->A07:Z
""".trimIndent()

/** Mark as unread: the store's own interface is asked with the chat's key and a callback. */
private val MRL_UNREAD = """
    iget-object v0, v9, $MRL_HOST->A07:LX/19I;
    invoke-static {v0}, LX/19I;->A0F(LX/19I;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, LX/2FU;
    invoke-static {v4}, LX/csz;->A0p(Ljava/lang/Object;)V
    iget-object v0, v1, LX/2FU;->A01:LX/19I;
    invoke-static {v0}, LX/19I;->A0F(LX/19I;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, $MRL_CALLS
    const/4 v1, 0x7
    new-instance v0, LX/fvD;
    invoke-direct {v0, v1}, LX/fvD;-><init>(I)V
    $MRL_UNREAD_CALL
    goto/16 :next
""".trimIndent()

/** Mark as read: the pending read is noted, then the same interface is asked with the key, the time and a callback. */
private val MRL_READ = """
    iget-object v0, v9, $MRL_HOST->A01:LX/19I;
    invoke-static {v0}, LX/19I;->A0F(LX/19I;)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, LX/Att;
    invoke-static {v4}, LX/csz;->A0p(Ljava/lang/Object;)V
    sget-object v2, LX/0Rv;->A01:Ljava/lang/Integer;
    iget-wide v0, v1, $MRL_FIELDS->A04:J
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v3
    invoke-virtual {v7, v4, v2, v3}, LX/Att;->A01(${THREAD_KEY_TYPE}Ljava/lang/Integer;Ljava/lang/Long;)V
    iget-object v0, v9, $MRL_HOST->A07:LX/19I;
    invoke-static {v0}, LX/19I;->A0F(LX/19I;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, LX/2FU;
    invoke-static {v4}, $THREAD_KEY_TYPE->A0l($THREAD_KEY_TYPE)Z
    move-result v1
    if-eqz v1, :stamped
    const/4 v3, 0x0
    :stamped
    iget-object v0, v2, LX/2FU;->A01:LX/19I;
    invoke-static {v0}, LX/19I;->A0F(LX/19I;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, $MRL_CALLS
    const/16 v1, 0x8
    new-instance v0, LX/fvD;
    invoke-direct {v0, v1}, LX/fvD;-><init>(I)V
    $MRL_READ_CALL
    goto/16 :next
""".trimIndent()

private val MRL_TAIL = """
    :done
    sget-object v0, $MARK_THREADS_RESULT->A00:$MARK_THREADS_RESULT
    return-object v0
    :no_mark
    invoke-static {}, LX/001;->A0P()Ljava/lang/IllegalStateException;
    move-result-object v0
    throw v0
    :wrong_operation
    new-instance v0, Ljava/lang/AssertionError;
    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V
    throw v0
""".trimIndent()

/** The handler as Messenger writes it, unread before read, or the other way round as another build's Redex could. */
private fun mrlBody(readFirst: Boolean = false) =
    if (readFirst) listOf(MRL_HEAD, "if-eqz v0, :mark_unread", MRL_READ, ":mark_unread", MRL_UNREAD, MRL_TAIL).joinToString("\n")
    else listOf(MRL_HEAD, "if-nez v0, :mark_read", MRL_UNREAD, ":mark_read", MRL_READ, MRL_TAIL).joinToString("\n")

/** Smali bodies are flush left, so a pattern that carries indentation would quietly leave the body stock. */
private fun String.mrlChanged(target: String, replacement: String): String {
    assertTrue(contains(target), "the fixture body no longer contains: $target")
    return replace(target, replacement)
}

private fun mrlHandler(body: String = mrlBody(), id: String = SYNTHETIC_MARK_READ_LOCALLY,
    flags: Int = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value): MutableMethod = fixtureMethod(id, body, registers = 11, flags = flags)

internal fun markReadLocallyFixture(handlers: List<MutableMethod> = listOf(mrlHandler())): List<MutableClass> =
    handlers.groupBy { it.definingClass }.map { (type, methods) -> fixtureClass(type, methods) }

private fun MutableMethod.mrlCode() = implementation!!.instructions.toList()

private fun Instruction.mrlShape(): String? {
    if (opcode != Opcode.INVOKE_INTERFACE && opcode != Opcode.INVOKE_INTERFACE_RANGE) return null
    val call = (this as ReferenceInstruction).reference as MethodReference
    return "(${call.parameterTypes.joinToString("")})${call.returnType}"
}

/** [mrlHandler] with a catch-all try over the one instruction [at] picks. */
private fun mrlTried(at: (List<Instruction>) -> Int): MutableMethod {
    val plain = mrlHandler()
    val code = plain.mrlCode()
    val address = IntArray(code.size + 1).also { for (i in code.indices) it[i + 1] = it[i] + code[i].codeUnits }
    val index = at(code)
    val tried = ImmutableMethodImplementation(11, code, listOf(ImmutableTryBlock(address[index], address[index + 1] - address[index],
        listOf(ImmutableExceptionHandler(null, address[code.size - 1])))), null)
    return MutableMethod(ImmutableMethod(plain.definingClass, plain.name, plain.parameters, plain.returnType, plain.accessFlags, null, null, tried))
}

/**
 * The read call has the question, its answer and the skip in front of it, a yes landing on the instruction after the
 * call. The unread call has the note in front of it. Nothing stock moves or changes.
 */
private fun assertMarksHooked(before: List<Instruction>, after: List<Instruction>, scratch: Int, label: String) {
    val read = before.indexOfFirst { it.mrlShape() == MARK_THREAD_READ_SHAPE }
    val unread = before.indexOfFirst { it.mrlShape() == MARK_THREAD_UNREAD_SHAPE }
    assertTrue(read >= 0 && unread >= 0, label)
    val gate = read + if (unread < read) 1 else 0
    val note = unread + if (read < unread) 3 else 0
    assertEquals(before.size + 4, after.size, label)

    val ask = after[gate]
    assertEquals(Opcode.INVOKE_STATIC_RANGE, ask.opcode, label)
    assertEquals(MARKED_READ_HERE, (ask as ReferenceInstruction).reference.toString(), label)
    assertEquals((before[read] as FiveRegisterInstruction).registerD to 1,
        (ask as RegisterRangeInstruction).let { it.startRegister to it.registerCount }, label)
    assertEquals(Opcode.MOVE_RESULT, after[gate + 1].opcode, label)
    assertEquals(scratch, (after[gate + 1] as OneRegisterInstruction).registerA, label)
    assertEquals(Opcode.IF_NEZ, after[gate + 2].opcode, label)
    assertEquals(scratch, (after[gate + 2] as OneRegisterInstruction).registerA, label)
    assertTrue(after[gate + 3] === before[read], "$label: the stock read call follows the gate")
    assertEquals(gate + 4, (after[gate + 2] as BuilderOffsetInstruction).target.location.index, label)
    assertTrue(after[gate + 4] === before[read + 1], "$label: a yes lands right after the call it skips")
    val readRegisters = (before[read] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD, it.registerE, it.registerF) }
    assertTrue(scratch !in readRegisters, "$label: the answer overwrites nothing the call takes")

    val told = after[note]
    assertEquals(Opcode.INVOKE_STATIC_RANGE, told.opcode, label)
    assertEquals(MARKED_UNREAD_HERE, (told as ReferenceInstruction).reference.toString(), label)
    assertEquals((before[unread] as FiveRegisterInstruction).registerD to 1,
        (told as RegisterRangeInstruction).let { it.startRegister to it.registerCount }, label)
    assertTrue(after[note + 1] === before[unread], "$label: the stock unread call follows the note")

    assertStockKept(before, after.filterIndexed { i, _ -> i != note && i !in gate..gate + 2 }, label)
}

/** #222: Messenger's own Mark as read always told the other person, and its Mark as unread couldn't reach a chat read on this phone. */
class MarkReadLocallyTest {
    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(MARK_READ_LOCALLY).map { it.hookId() }.toSet()

    @Test fun theFinderAndItsMirrorTakeTheOneHandler() {
        assertEquals(setOf(SYNTHETIC_MARK_READ_LOCALLY), found(markReadLocallyFixture()))
        assertEquals(setOf(SYNTHETIC_MARK_READ_LOCALLY), found(markReadLocallyFixture(listOf(mrlHandler(mrlBody(readFirst = true))))))
        validateControls(mirroredControls(markReadLocallyFixture()), setOf(MARK_READ_LOCALLY))
        assertEquals(setOf(SYNTHETIC_MARK_READ_LOCALLY), SYNTHETIC_PROFILE.hooks.getValue(MARK_READ_LOCALLY))
        assertEquals(1, BASE_PROFILE.hooks.getValue(MARK_READ_LOCALLY).size)
    }

    @Test fun lookalikesAreNotTheHandler() {
        val second = "LX/Other;->A06(LX/4QM;LX/Other;Ljava/lang/String;)$MARK_THREADS_RESULT"
        val cases = mapOf(
            "not static" to listOf(mrlHandler(flags = AccessFlags.PUBLIC.value)),
            "answers something else" to listOf(mrlHandler(id = SYNTHETIC_MARK_READ_LOCALLY.replace(")$MARK_THREADS_RESULT", ")Ljava/lang/Object;"))),
            "another parcel" to listOf(mrlHandler(mrlBody().mrlChanged("check-cast v1, $MARK_THREADS_PARAMS", "check-cast v1, LX/OtherParams;"))),
            "no mark as unread" to listOf(mrlHandler(mrlBody().mrlChanged(MRL_UNREAD_CALL, "nop"))),
            "no mark as read" to listOf(mrlHandler(mrlBody().mrlChanged(MRL_READ_CALL, "nop"))),
            "the two calls on different interfaces" to listOf(mrlHandler(mrlBody()
                .mrlChanged(MRL_UNREAD_CALL, MRL_UNREAD_CALL.replace(MRL_CALLS, "LX/OtherCalls;")))),
            "a third call with the chat's key" to listOf(mrlHandler(mrlBody()
                .mrlChanged(MRL_UNREAD_CALL, "$MRL_UNREAD_CALL\n${MRL_UNREAD_CALL.replace("->EGF", "->EGH")}"))),
            "the read call without its time" to listOf(mrlHandler(mrlBody().mrlChanged(MRL_READ_CALL,
                "invoke-interface {v2, v4, v0}, $MRL_CALLS->EGB$MARK_THREAD_UNREAD_SHAPE"))),
            "two handlers" to listOf(mrlHandler(), mrlHandler(id = second)),
        )
        for ((case, handlers) in cases) {
            val classes = markReadLocallyFixture(handlers)
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(MARK_READ_LOCALLY)) }
        }
    }

    @Test fun aHandlerTheHooksCantGoIntoSafelyIsRefused() {
        val everyOtherRegisterRead = ":next\ninvoke-static {v1, v7, v10}, LX/csz;->A0q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V"
        val cases = mapOf(
            "a jump onto the read call" to mrlHandler(mrlBody().mrlChanged("const/16 v1, 0x8", "const/16 v1, 0x8\nif-eqz v1, :onto_read")
                .mrlChanged(MRL_READ_CALL, ":onto_read\n$MRL_READ_CALL")),
            "a jump onto the unread call" to mrlHandler(mrlBody().mrlChanged("const/4 v1, 0x7", "const/4 v1, 0x7\nif-eqz v1, :onto_unread")
                .mrlChanged(MRL_UNREAD_CALL, ":onto_unread\n$MRL_UNREAD_CALL")),
            "the read call in a try block" to mrlTried { code -> code.indexOfFirst { it.mrlShape() == MARK_THREAD_READ_SHAPE } },
            "the unread call in a try block" to mrlTried { code -> code.indexOfFirst { it.mrlShape() == MARK_THREAD_UNREAD_SHAPE } },
            "no register free for the answer" to mrlHandler(mrlBody().mrlChanged(":next", everyOtherRegisterRead)),
        )
        for ((case, handler) in cases) {
            // Still the handler by its outline, so it's the proof before the edit that stops it, with nothing written.
            assertEquals(setOf(SYNTHETIC_MARK_READ_LOCALLY), found(markReadLocallyFixture(listOf(handler))), case)
            assertFailsWith<PatchException>(case) { handler.validateMarkReadLocally() }
            val before = handler.mrlCode()
            assertFailsWith<PatchException>(case) { injectControl(MARK_READ_LOCALLY, mapOf(MARK_READ_LOCALLY to listOf(handler))) }
            assertEquals(before, handler.mrlCode(), case)
        }
    }

    @Test fun theAnswerTakesTheFirstRegisterNothingReadsAgain() {
        // v1 held the callback's number and v7 the read tracker, and the loop writes both again before reading either.
        assertEquals(1, mrlHandler().validateMarkReadLocally().scratch)
        val v1ReadAgain = mrlHandler(mrlBody().mrlChanged(":next", ":next\ninvoke-static {v1}, LX/csz;->A0p(Ljava/lang/Object;)V"))
        assertEquals(7, v1ReadAgain.validateMarkReadLocally().scratch)
    }

    @Test fun markAsReadAsksTheExtensionFirstAndMarkAsUnreadTellsIt() {
        for (readFirst in listOf(false, true)) {
            val method = mrlHandler(mrlBody(readFirst))
            val before = method.mrlCode()
            injectControl(MARK_READ_LOCALLY, mapOf(MARK_READ_LOCALLY to listOf(method)))
            assertMarksHooked(before, method.mrlCode(), scratch = 1, label = if (readFirst) "read first" else "unread first")
        }
    }

    @Test fun everySupportedBuildsHandlerTakesBothHooks() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val handlers = findMarkReadLocally(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(1, handlers.size, code)
            assertEquals(controlProfiles.getValue(code.toInt()).hooks.getValue(MARK_READ_LOCALLY), setOf(handlers.single().hookId()), code)
            val method = MutableMethod(handlers.single())
            val before = method.mrlCode()
            val scratch = method.validateMarkReadLocally().scratch
            method.injectMarkReadLocally()
            assertMarksHooked(before, method.mrlCode(), scratch, code)
        }
    }
}
