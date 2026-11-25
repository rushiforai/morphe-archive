package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
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

private const val REACTION_TABLE = "LX/W0T;->A00(I)Ljava/lang/String;"
private const val REACTION_SENDER = "LX/AaE;"
internal const val SYNTHETIC_REACTION = "$REACTION_SENDER->Eoq(${THREAD_KEY_TYPE}Ljava/lang/String;Ljava/lang/String;IZ)V"
internal const val SYNTHETIC_REACTION_V2 = "$REACTION_SENDER->Eor(${THREAD_KEY_TYPE}Ljava/lang/String;ZZZ)V"
/** Wide enough that the chat's key sits above v15, as it does in 587's sends. */
private const val REACTION_REGISTERS = 22

/** 587's mutation names, looked up by number like every Redex string table. */
private fun reactionTable() = fixtureClass("LX/W0T;", listOf(fixtureMethod(REACTION_TABLE, """
    packed-switch p0, :keys
    const-string v0, ""
    return-object v0
    :react
    const-string v0, "react_to_message"
    return-object v0
    :react_v2
    const-string v0, "react_to_message_v2"
    return-object v0
    :keys
    .packed-switch 0x20
        :react
        :react_v2
    .end packed-switch
""".trimIndent(), 1, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)))

/** A send as 587 has it: the mutation's name looked up first, then the work that sends it. */
private fun reactionSend(id: String, key: Int, head: String = "", flags: Int = AccessFlags.PUBLIC.value) = fixtureMethod(id, """
    $head
    const/16 v0, 0x${key.toString(16)}
    invoke-static {v0}, $REACTION_TABLE
    move-result-object v1
    invoke-virtual/range {p0 .. p1}, $REACTION_SENDER->A01($THREAD_KEY_TYPE)V
    return-void
""".trimIndent(), REACTION_REGISTERS, flags)

internal fun reactionFixture(sends: List<MutableMethod> = listOf(reactionSend(SYNTHETIC_REACTION, 0x20), reactionSend(SYNTHETIC_REACTION_V2, 0x21))):
    List<MutableClass> = listOf(reactionTable()) + sends.groupBy { it.definingClass }.map { (owner, methods) -> fixtureClass(owner, methods) }

class ReactionReadTest {
    @AfterTest fun reset() { activeStringTables = emptyMap() }

    private fun found(classes: List<MutableClass>) = findReactionRead(classes, redexStringTables(classes)).map { it.hookId() }

    @Test fun bothReactionSendsAreFoundThroughTheStringTable() {
        assertEquals(listOf(SYNTHETIC_REACTION, SYNTHETIC_REACTION_V2), found(reactionFixture()))
    }

    @Test fun theChatsKeyGoesToTheExtensionBeforeTheReactionIsSent() {
        val classes = reactionFixture()
        activeStringTables = redexStringTables(classes)
        val sends = findReactionRead(classes, activeStringTables)
        assertEquals(2, sends.size)
        for (send in sends) {
            val method = send as MutableMethod
            val before = method.implementation!!.instructions.map { it.opcode }
            method.injectReactionRead()
            val code = method.implementation!!.instructions.toList()
            val call = code[0]
            assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode, send.hookId())
            assertEquals(REACTION_READ_CALL, (call as ReferenceInstruction).reference.toString())
            assertEquals(method.parameterRegister(1), (call as RegisterRangeInstruction).startRegister)
            assertTrue(call.startRegister > 15, "the key sits above v15, so only the range form can pass it")
            assertEquals(1, call.registerCount)
            assertEquals(before, code.drop(1).map { it.opcode })
        }
    }

    @Test fun aChangedSenderIsNotTakenForTheReactionSends() {
        val elsewhere = reactionSend("LX/Other;->Eor(${THREAD_KEY_TYPE}Ljava/lang/String;ZZZ)V", 0x21)
        val cases = mapOf(
            "only one of the two mutations" to reactionFixture(listOf(reactionSend(SYNTHETIC_REACTION, 0x20))),
            "the sends in two classes" to reactionFixture(listOf(reactionSend(SYNTHETIC_REACTION, 0x20), elsewhere)),
            "the same mutation twice" to reactionFixture(listOf(reactionSend(SYNTHETIC_REACTION, 0x20), reactionSend(SYNTHETIC_REACTION_V2, 0x20))),
            "a static send" to reactionFixture(listOf(reactionSend(SYNTHETIC_REACTION, 0x20),
                reactionSend(SYNTHETIC_REACTION_V2, 0x21, flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value))),
            "a send without the chat's key first" to reactionFixture(listOf(reactionSend(SYNTHETIC_REACTION, 0x20),
                reactionSend("$REACTION_SENDER->Eor(Ljava/lang/String;${THREAD_KEY_TYPE}ZZZ)V", 0x21))),
        )
        for ((label, classes) in cases) assertEquals(emptyList(), found(classes), label)
    }

    @Test fun aSendThatJumpsBackToItsStartIsRefusedBeforeAnyEdit() {
        val method = reactionSend(SYNTHETIC_REACTION, 0x20, head = ":top\nif-eqz p2, :top")
        activeStringTables = redexStringTables(reactionFixture(listOf(method)))
        val before = method.implementation!!.instructions.map { it.opcode }
        val failure = assertFailsWith<PatchException> { method.injectReactionRead() }
        assertTrue(failure.message!!.contains("jumps back to its start"), failure.message)
        assertEquals(before, method.implementation!!.instructions.map { it.opcode })
    }

    @Test fun aMethodThatIsntAReactionSendIsRefusedBeforeAnyEdit() {
        val method = reactionSend("$REACTION_SENDER->Eoq(${THREAD_KEY_TYPE}Ljava/lang/String;Ljava/lang/String;IZ)V", 0x22)
        activeStringTables = redexStringTables(reactionFixture(listOf(method)))
        assertFailsWith<PatchException> { method.injectReactionRead() }
    }

    @Test fun everySupportedBuildSendsReactionsFromTheTwoRecordedMethods() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        try {
            for (apk in apks) {
                val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
                activeProfile = controlProfileFor(code)
                val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
                val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
                activeStringTables = redexStringTables(classes)
                val sends: List<Method> = findReactionRead(classes, activeStringTables)
                assertEquals(activeProfile.hooks.getValue(REACTION_READ), sends.map { it.hookId() }.toSet(), code)
                assertEquals(2, sends.size, code)
                for (send in sends) {
                    val method = MutableMethod(send)
                    val before = method.implementation!!.instructions.map { it.opcode }
                    method.injectReactionRead()
                    assertEquals(before, method.implementation!!.instructions.drop(1).map { it.opcode }, code)
                }
            }
        } finally {
            activeProfile = SYNTHETIC_PROFILE
        }
    }
}
