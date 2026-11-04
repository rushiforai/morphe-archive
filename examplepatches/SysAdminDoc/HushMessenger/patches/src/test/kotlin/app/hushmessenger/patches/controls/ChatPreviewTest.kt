package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
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

private const val HANDLER = "LX/Cph;"
internal const val SYNTHETIC_CHAT_PREVIEW = "$HANDLER->A02()V"
private const val MENU = "$HANDLER->A01()V"
private const val PREVIEW_READ = "invoke-static {v4, v2, v3}, LX/17j;->A1Y(Ljava/lang/Object;J)Z"
private const val ENCRYPTED_READ = "invoke-static {v0, v4, v2, v3}, LX/17j;->A1W(LX/2xU;Ljava/lang/Object;J)Z"

/**
 * The long-press handler as Messenger 586 writes it, cut down: an encrypted chat asks the encrypted-chat flag first,
 * every chat asks the preview flag, an encrypted chat asks its flag again, and only then is the preview built. Any no
 * falls back to the plain menu.
 */
private val HANDLER_BODY = """
    const/4 v4, 0x0
    invoke-virtual {p0}, $HANDLER->A00()Z
    move-result v1
    if-eqz v1, :preview_flag
    sget-object v0, LX/2xU;->A0A:LX/2xU;
    const-wide v2, ${CHAT_PREVIEW_ENCRYPTED_FLAG}L
    $ENCRYPTED_READ
    move-result v0
    if-eqz v0, :menu
    :preview_flag
    const-wide v2, ${CHAT_PREVIEW_FLAG}L
    $PREVIEW_READ
    move-result v0
    if-eqz v0, :menu
    if-eqz v1, :show
    sget-object v0, LX/2xU;->A0A:LX/2xU;
    const-wide v2, ${CHAT_PREVIEW_ENCRYPTED_FLAG}L
    $ENCRYPTED_READ
    move-result v0
    if-eqz v0, :menu
    :show
    new-instance v5, $CHAT_PREVIEW_FRAGMENT
    invoke-direct {v5}, $CHAT_PREVIEW_FRAGMENT-><init>()V
    return-void
    :menu
    invoke-virtual {p0}, $MENU
    return-void
""".trimIndent()

private fun handler(body: String = HANDLER_BODY) = fixtureMethod(SYNTHETIC_CHAT_PREVIEW, body, 8)

/** The handler with the first [from] swapped for [to]. */
private fun changed(from: String, to: String) = handler(HANDLER_BODY.replaceFirst(from, to).also { check(it != HANDLER_BODY) })

private val ENCRYPTED = "const-wide v2, ${CHAT_PREVIEW_ENCRYPTED_FLAG}L"
private val PREVIEW = "const-wide v2, ${CHAT_PREVIEW_FLAG}L"

/** The chat list's click handler with its long-press method and the plain menu it falls back to. */
internal fun chatPreviewFixture(method: MutableMethod = handler()): List<MutableClass> =
    listOf(fixtureClass(HANDLER, listOf(method, fixtureMethod(MENU, "return-void", 1))))

private fun Method.code() = implementation!!.instructions.toList()

private fun Method.helperCalls() = code().indices.filter { (code()[it] as? ReferenceInstruction)?.reference?.toString() == CHAT_PREVIEW_HELPER }

class ChatPreviewTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(CHAT_PREVIEW).map { it.hookId() }.toSet()

    @Test fun theLongPressHandlerIsFoundWhenItBuildsThePreviewBehindBothFlags() {
        assertEquals(setOf(SYNTHETIC_CHAT_PREVIEW), found(chatPreviewFixture()))
        validateControls(mirroredControls(chatPreviewFixture()), setOf(CHAT_PREVIEW))
        assertEquals(3, handler().chatPreviewSites().size)
    }

    @Test fun eachMappingHooksItsOwnHandler() {
        assertEquals(setOf(SYNTHETIC_CHAT_PREVIEW), SYNTHETIC_PROFILE.hooks.getValue(CHAT_PREVIEW))
        assertEquals(setOf("Lcom/facebook/messaging/threadlist/plugins/core/clickhandler/DefaultThreadListClickHandler;->A02()V"),
            BASE_PROFILE.hooks.getValue(CHAT_PREVIEW))
    }

    // The switch says a long press opens the preview. A handler that asks other questions, or asks these some other way,
    // could turn on something that isn't the preview, so it gets no hook at all.
    @Test fun anyOtherShapeLeavesTheControlUnapplied() {
        val second = fixtureClass("LX/Zzq;", listOf(fixtureMethod("LX/Zzq;->A00()V", "new-instance v0, $CHAT_PREVIEW_FRAGMENT\nreturn-void", 1)))
        val cases = mapOf(
            "no preview built" to chatPreviewFixture(changed("new-instance v5, $CHAT_PREVIEW_FRAGMENT\n", "")),
            "a second place that builds the preview" to chatPreviewFixture() + second,
            "the preview flag read twice" to chatPreviewFixture(changed(ENCRYPTED, PREVIEW)),
            "no encrypted-chat read" to chatPreviewFixture(handler(HANDLER_BODY.replace(ENCRYPTED, "const-wide v2, 0x1L"))),
            "a read that isn't static" to chatPreviewFixture(changed(PREVIEW_READ, "invoke-virtual {v4, v2, v3}, LX/17j;->A1Y(J)Z")),
            "a read that doesn't take the flag last" to chatPreviewFixture(changed(PREVIEW_READ, "invoke-static {v2, v3, v4}, LX/17j;->A1Y(JLjava/lang/Object;)Z")),
            "an answer nothing branches on" to chatPreviewFixture(changed("$PREVIEW_READ\nmove-result v0\nif-eqz v0", "$PREVIEW_READ\nmove-result v0\nif-nez v0")),
            "a branch on another register" to chatPreviewFixture(changed("$PREVIEW_READ\nmove-result v0\nif-eqz v0", "$PREVIEW_READ\nmove-result v0\nif-eqz v1")),
            "a jump into the read" to chatPreviewFixture(handler(HANDLER_BODY.replaceFirst("if-eqz v1, :preview_flag", "if-eqz v1, :preview_read")
                .replaceFirst("$PREVIEW\n$PREVIEW_READ", "$PREVIEW\n:preview_read\n$PREVIEW_READ"))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(CHAT_PREVIEW)) }
        }
    }

    @Test fun everyAnswerPassesThroughTheSwitchRightBeforeItsBranch() {
        val method = handler()
        val before = method.code()
        injectControl(CHAT_PREVIEW, mapOf(CHAT_PREVIEW to listOf(method)))
        val code = method.code()
        val calls = method.helperCalls()
        assertEquals(3, calls.size)
        for (at in calls) {
            // The flag's own answer goes in, and the switch's answer comes back to the same register the branch reads.
            assertEquals(Opcode.MOVE_RESULT, code[at - 1].opcode)
            assertEquals(Opcode.INVOKE_STATIC_RANGE, code[at].opcode)
            assertEquals(Opcode.MOVE_RESULT, code[at + 1].opcode)
            assertEquals(0, (code[at + 1] as OneRegisterInstruction).registerA)
            assertEquals(Opcode.IF_EQZ, code[at + 2].opcode)
            assertEquals(0, (code[at + 2] as OneRegisterInstruction).registerA)
            // A no from the switch still lands on Messenger's plain menu.
            assertEquals(MENU, (code[code.branchTarget(at + 2)] as ReferenceInstruction).reference.toString())
        }
        // Everything else runs as Messenger wrote it.
        assertEquals(before.map { it.opcode }, code.filterIndexed { i, _ -> calls.none { i == it || i == it + 1 } }.map { it.opcode })
    }

    @Test fun anUnusableMethodRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            "the plain menu" to fixtureMethod(MENU, "return-void", 1),
            "a handler with the preview flag read twice" to changed(ENCRYPTED, PREVIEW),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(CHAT_PREVIEW, mapOf(CHAT_PREVIEW to listOf(bad))) }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildPassesTheSameThreeReadsThroughTheSwitch() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val hooks = findChatPreview(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(CHAT_PREVIEW), hooks.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(CHAT_PREVIEW to hooks), setOf(CHAT_PREVIEW))
            val method = MutableMethod(hooks.single())
            assertEquals(listOf(CHAT_PREVIEW_ENCRYPTED_FLAG, CHAT_PREVIEW_FLAG, CHAT_PREVIEW_ENCRYPTED_FLAG), method.chatPreviewSites().map { it.flag }, code)
            val before = method.code()
            method.injectChatPreview()
            val calls = method.helperCalls()
            assertEquals(3, calls.size, code)
            val after = method.code()
            assertTrue(calls.all { after[it + 2].opcode == Opcode.IF_EQZ }, code)
            assertEquals(before.map { it.opcode }.filter { it != Opcode.NOP },
                after.filterIndexed { i, _ -> calls.none { i == it || i == it + 1 } }.map { it.opcode }.filter { it != Opcode.NOP }, code)
        }
    }
}
