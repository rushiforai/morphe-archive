package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val CHANNEL = "Landroid/app/NotificationChannel;"
private const val SESSION = "Lcom/facebook/auth/usersession/FbUserSession;"
private const val MANAGER = "LX/1yZ;"
private const val RECREATE_RETURN = "Ljava/lang/String;"
internal const val SYNTHETIC_CHAT_RECREATE = "$MANAGER->A09($CHANNEL$SESSION${MANAGER}Ljava/lang/String;IZ)$RECREATE_RETURN"
internal const val SYNTHETIC_CHAT_RAISE = "LX/7uR;->run()V"
private const val KEEP_SINK = "Lapp/hushmessenger/extension/ChatPopups;->keepChannel(${CHANNEL}I)Z"
private const val RAISE_SINK = "Lapp/hushmessenger/extension/ChatPopups;->raiseChannel($CHANNEL)Z"
private val STATIC_PUBLIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

private val RECREATE_BODY = """
    const-string v0, "recreateChannel for updating channel importance"
    const/4 v0, 0x0
    return-object v0
""".trimIndent()

private const val GATE = "move-object v0, v4"
private const val RAISE_LOAD = "invoke-virtual {v14}, $CHANNEL->getImportance()I"
private val RAISE_BODY = """
    const-string v0, "chats_channel_banner_state"
    $RAISE_LOAD
    move-result v1
    const/4 v0, 0x3
    if-lt v1, v0, :done
    $GATE
    const/4 v1, 0x1
    if-nez v1, :done
    $RAISE_LOAD
    move-result v7
    move-object v15, v13
    move/from16 v19, v5
    move-object/from16 v16, v4
    move-object/from16 v17, v9
    move/from16 v18, v8
    invoke-static/range {v14 .. v19}, $SYNTHETIC_CHAT_RECREATE
    :done
    return-void
""".trimIndent()

internal fun chatRecreateMethod(body: String = RECREATE_BODY, flags: Int = STATIC_PUBLIC, registers: Int = 8) =
    fixtureMethod(SYNTHETIC_CHAT_RECREATE, body, registers, flags)

internal fun chatRaiseMethod(body: String = RAISE_BODY) = fixtureMethod(SYNTHETIC_CHAT_RAISE, body, 22)

class ChatPopupsTest {
    private fun MutableMethod.code() = implementation!!.instructions.toList()

    private fun raiseClasses(body: String = RAISE_BODY) = listOf(fixtureClass("LX/7uR;", listOf(chatRaiseMethod(body))))
    private fun keepClasses(method: MutableMethod = chatRecreateMethod()) = listOf(fixtureClass(MANAGER, listOf(method)))

    @Test fun theRaiseHookSkipsTheGatesToMessengersOwnRaise() {
        val method = chatRaiseMethod()
        val before = method.code()
        assertEquals(listOf(SYNTHETIC_CHAT_RAISE), findChatChannelRaise(raiseClasses()).map { it.hookId() })
        method.injectChatChannelRaise()
        val after = method.code()
        assertEquals(before.size + 3, after.size)
        val at = after.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == RAISE_SINK }
        assertEquals(5, at, "the hook goes right after the bound check, before the first gate")
        assertEquals(14, (after[at] as RegisterRangeInstruction).startRegister, "it reads the channel")
        assertEquals(0, (after[at + 1] as OneRegisterInstruction).registerA, "the bound's own register holds the answer")
        assertEquals(Opcode.IF_NEZ, after[at + 2].opcode)
        // The jump lands on the raise's own importance read, past the gates.
        val target = after.take(at + 2).sumOf { it.codeUnits } + (after[at + 2] as OffsetInstruction).codeOffset
        val raise = after.indexOfLast { (it as? ReferenceInstruction)?.reference?.toString() == "$CHANNEL->getImportance()I" }
        assertEquals(after.take(raise).sumOf { it.codeUnits }, target)
        // Every original instruction is still there, in order.
        assertEquals(before.map { it.opcode }, after.filterIndexed { index, _ -> index !in at..at + 2 }.map { it.opcode })
    }

    @Test fun theKeepHookReturnsNullBeforeTheRecreate() {
        val method = chatRecreateMethod()
        assertEquals(listOf(SYNTHETIC_CHAT_RECREATE), findChatChannelKeep(keepClasses()).map { it.hookId() })
        method.injectChatChannelKeep()
        val after = method.code()
        val call = after[0] as FiveRegisterInstruction
        assertEquals(KEEP_SINK, (after[0] as ReferenceInstruction).reference.toString())
        // Eight registers with six parameters (nothing wide) put p0 at v2 and the importance, p4, at v6.
        assertEquals(listOf(2, 6), listOf(call.registerC, call.registerD))
        assertEquals(Opcode.IF_EQZ, after[2].opcode)
        assertEquals(Opcode.RETURN_OBJECT, after[4].opcode)
        assertEquals(5, after.size - RECREATE_BODY.lines().size, "the hook adds five instructions")
    }

    @Test fun aChangedRaiseIsRefusedBeforeAnyEdit() {
        val cases = mapOf(
            "no banner report" to RAISE_BODY.replace("chats_channel_banner_state", "something_else"),
            "the bound isn't 3" to RAISE_BODY.replace("const/4 v0, 0x3", "const/4 v0, 0x2"),
            "the first gate leaves the bound's register alone" to RAISE_BODY.replace(GATE, "move-object v2, v4"),
            "a jump lands on the first gate" to RAISE_BODY.replace(GATE, ":gate\n$GATE").replace("const-string v0,", "if-eqz v5, :gate\nconst-string v0,"),
            "a gate writes what the raise reads" to RAISE_BODY.replace(GATE, "$GATE\nconst/4 v9, 0x0"),
            "the channel changes in the gates" to RAISE_BODY.replace(GATE, "$GATE\nmove-object/from16 v14, v9"),
            "two recreates" to RAISE_BODY.replace("\n:done\n", "\ninvoke-static/range {v14 .. v19}, $SYNTHETIC_CHAT_RECREATE\n:done\n"),
            "no recreate" to RAISE_BODY.replace("invoke-static/range {v14 .. v19}, $SYNTHETIC_CHAT_RECREATE\n", ""),
        )
        for ((case, body) in cases) {
            assertTrue(findChatChannelRaise(raiseClasses(body)).isEmpty(), case)
            val method = chatRaiseMethod(body)
            val before = method.code().size
            assertFailsWith<PatchException>(case) { method.injectChatChannelRaise() }
            assertEquals(before, method.code().size, case)
        }
    }

    @Test fun aChangedRecreateIsRefusedBeforeAnyEdit() {
        val cases = mapOf(
            "no importance log" to chatRecreateMethod(RECREATE_BODY.replace("recreateChannel", "something")),
            "an instance method" to chatRecreateMethod(flags = AccessFlags.PUBLIC.value),
            "no local register for the answer" to chatRecreateMethod(registers = 6),
            "registers out of the short call's reach" to chatRecreateMethod(registers = 17),
        )
        for ((case, method) in cases) {
            val before = method.code().size
            assertFailsWith<PatchException>(case) { method.injectChatChannelKeep() }
            assertEquals(before, method.code().size, case)
        }
    }

    @Test fun everySupportedBuildTakesBothHooks() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val hooks = controlProfiles.getValue(code.toInt()).hooks
            val raise = findChatChannelRaise(classes)
            val keep = findChatChannelKeep(classes)
            assertEquals(hooks.getValue(CHAT_CHANNEL_RAISE).toList(), raise.map { it.hookId() }, code)
            assertEquals(hooks.getValue(CHAT_CHANNEL_KEEP).toList(), keep.map { it.hookId() }, code)
            MutableMethod(raise.single()).injectChatChannelRaise()
            MutableMethod(keep.single()).injectChatChannelKeep()
        }
    }
}
