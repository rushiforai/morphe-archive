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
private const val BUILDER_CLASS = "LX/Cpb;"
private const val BUILDER = "$BUILDER_CLASS->A00()Z"
private const val GATE = "LX/Cpg;->A00()Z"
private const val PREVIEW_READ = "invoke-static {v4, v2, v3}, LX/18A;->A1Z(Ljava/lang/Object;J)Z"
private const val ENCRYPTED_READ = "invoke-static {v0, v4, v2, v3}, LX/18A;->A1X(LX/30w;Ljava/lang/Object;J)Z"

/**
 * The long-press handler as Messenger 587 writes it, cut down: an encrypted chat asks the encrypted-chat flag first,
 * every chat asks the preview flag and branches on the answer a little later, an encrypted chat asks its flag again,
 * and only then does it call the static method that builds the preview. Any no falls back to the plain menu.
 */
private val HANDLER_BODY = """
    const/4 v4, 0x0
    invoke-virtual {p0}, $HANDLER->A00()Z
    move-result v1
    if-eqz v1, :preview_flag
    sget-object v0, LX/30w;->A0A:LX/30w;
    const-wide v2, ${CHAT_PREVIEW_ENCRYPTED_FLAG}L
    $ENCRYPTED_READ
    move-result v0
    if-eqz v0, :menu
    :preview_flag
    const-wide v2, ${CHAT_PREVIEW_FLAG}L
    $PREVIEW_READ
    move-result v6
    invoke-virtual {p0}, $HANDLER->A00()Z
    move-result v0
    if-eqz v6, :menu
    if-eqz v1, :show
    sget-object v0, LX/30w;->A0A:LX/30w;
    const-wide v2, ${CHAT_PREVIEW_ENCRYPTED_FLAG}L
    $ENCRYPTED_READ
    move-result v0
    if-nez v0, :show
    goto :menu
    :show
    invoke-static {}, $BUILDER
    move-result v0
    return-void
    :menu
    invoke-virtual {p0}, $MENU
    return-void
""".trimIndent()

/** 586's handler, which builds the preview itself behind the same reads. */
private val HANDLER_586_BODY = HANDLER_BODY.replace("invoke-static {}, $BUILDER\nmove-result v0",
    "new-instance v5, $CHAT_PREVIEW_FRAGMENT\ninvoke-direct {v5}, $CHAT_PREVIEW_FRAGMENT-><init>()V")

/** The chat list's other gate, which asks the preview flag through the config's interface right after a cast to it. */
private val GATE_BODY = """
    const/4 v4, 0x0
    sget-object v0, LX/30w;->A0A:LX/30w;
    const-wide v2, ${CHAT_PREVIEW_FLAG}L
    check-cast v4, Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;
    invoke-interface {v4, v0, v2, v3}, Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;->B3e(LX/30w;J)Z
    move-result v0
    return v0
""".trimIndent()

private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

private fun handler(body: String = HANDLER_BODY) = fixtureMethod(SYNTHETIC_CHAT_PREVIEW, body, 8)

private fun gate(body: String = GATE_BODY) = fixtureMethod(GATE, body, 5, STATIC)

/** The handler with the first [from] swapped for [to]. */
private fun changed(from: String, to: String) = handler(HANDLER_BODY.replaceFirst(from, to).also { check(it != HANDLER_BODY) })

private val ENCRYPTED = "const-wide v2, ${CHAT_PREVIEW_ENCRYPTED_FLAG}L"
private val PREVIEW = "const-wide v2, ${CHAT_PREVIEW_FLAG}L"

private fun builderClass() = fixtureClass(BUILDER_CLASS, listOf(fixtureMethod(BUILDER,
    "new-instance v0, $CHAT_PREVIEW_FRAGMENT\ninvoke-direct {v0}, $CHAT_PREVIEW_FRAGMENT-><init>()V\nconst/4 v0, 0x1\nreturn v0", 1, STATIC)))

/** The chat list's click handler with its long-press method, the plain menu it falls back to and the preview's builder. */
internal fun chatPreviewFixture(method: MutableMethod = handler()): List<MutableClass> =
    listOf(fixtureClass(HANDLER, listOf(method, fixtureMethod(MENU, "return-void", 1))), builderClass())

private fun gateClass(method: MutableMethod = gate()) = fixtureClass("LX/Cpg;", listOf(method))

private fun Method.code() = implementation!!.instructions.toList()

private fun Method.helperCalls() = code().indices.filter { (code()[it] as? ReferenceInstruction)?.reference?.toString() == CHAT_PREVIEW_HELPER }

class ChatPreviewTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(CHAT_PREVIEW).map { it.hookId() }.toSet()

    @Test fun theLongPressHandlerIsFoundWhenItCallsTheBuilderBehindBothFlags() {
        assertEquals(setOf(SYNTHETIC_CHAT_PREVIEW), found(chatPreviewFixture()))
        validateControls(mirroredControls(chatPreviewFixture()), setOf(CHAT_PREVIEW))
        assertEquals(listOf(CHAT_PREVIEW_ENCRYPTED_FLAG, CHAT_PREVIEW_FLAG, CHAT_PREVIEW_ENCRYPTED_FLAG), handler().chatPreviewSites().map { it.flag })
    }

    @Test fun everyOtherReaderOfThePreviewFlagIsTakenWithIt() {
        assertEquals(setOf(SYNTHETIC_CHAT_PREVIEW, GATE), found(chatPreviewFixture() + gateClass()))
        activeProfile = syntheticProfileWith(CHAT_PREVIEW to setOf(SYNTHETIC_CHAT_PREVIEW, GATE))
        validateControls(mirroredControls(chatPreviewFixture() + gateClass()), setOf(CHAT_PREVIEW))
        assertEquals(listOf(CHAT_PREVIEW_FLAG), gate().chatPreviewSites().map { it.flag })
    }

    @Test fun a586HandlerThatBuildsThePreviewItselfIsStillFound() {
        val classes = listOf(fixtureClass(HANDLER, listOf(handler(HANDLER_586_BODY), fixtureMethod(MENU, "return-void", 1))))
        assertEquals(setOf(SYNTHETIC_CHAT_PREVIEW), found(classes))
    }

    @Test fun eachMappingHooksItsOwnHandler() {
        assertEquals(setOf(SYNTHETIC_CHAT_PREVIEW), SYNTHETIC_PROFILE.hooks.getValue(CHAT_PREVIEW))
        assertEquals(setOf("LX/37H;->A05(LX/37H;I)Ljava/lang/Object;", "LX/37M;->A00(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
            "LX/37S;->A07(ILjava/lang/Object;)Ljava/lang/Object;"), BASE_PROFILE.hooks.getValue(CHAT_PREVIEW))
    }

    // The switch says a long press opens the preview. Readers that ask other questions, or ask these some other way,
    // could turn on something that isn't the preview, so they get no hook at all.
    @Test fun anyOtherShapeLeavesTheControlUnapplied() {
        val second = fixtureClass("LX/Zzq;", listOf(fixtureMethod("LX/Zzq;->A00()V", "new-instance v0, $CHAT_PREVIEW_FRAGMENT\nreturn-void", 1)))
        val cases = mapOf(
            "no preview built" to chatPreviewFixture().filter { it.type != BUILDER_CLASS },
            "a second place that builds the preview" to chatPreviewFixture() + second,
            "a builder no reader calls" to chatPreviewFixture(changed("invoke-static {}, $BUILDER", "invoke-static {}, $BUILDER_CLASS->A01()Z")),
            "the preview flag read twice" to chatPreviewFixture(changed(ENCRYPTED, PREVIEW)),
            "no encrypted-chat read" to chatPreviewFixture(handler(HANDLER_BODY.replace(ENCRYPTED, "const-wide v2, 0x1L"))),
            "a read that isn't static" to chatPreviewFixture(changed(PREVIEW_READ, "invoke-virtual {v4, v2, v3}, LX/18A;->A1Z(J)Z")),
            "a read that doesn't take the flag last" to chatPreviewFixture(changed(PREVIEW_READ, "invoke-static {v2, v3, v4}, LX/18A;->A1Z(JLjava/lang/Object;)Z")),
            "a read that isn't a yes or no" to chatPreviewFixture(changed(PREVIEW_READ, "invoke-static {v4, v2, v3}, LX/18A;->A1Z(Ljava/lang/Object;J)I")),
            "an answer nothing takes" to chatPreviewFixture(changed("$PREVIEW_READ\nmove-result v6", "$PREVIEW_READ\nconst/4 v6, 0x1")),
            "a jump into the read" to chatPreviewFixture(handler(HANDLER_BODY.replaceFirst("if-eqz v1, :preview_flag", "if-eqz v1, :preview_read")
                .replaceFirst("$PREVIEW\n$PREVIEW_READ", "$PREVIEW\n:preview_read\n$PREVIEW_READ"))),
            "a cast read asked on another register" to chatPreviewFixture() + gateClass(gate(GATE_BODY.replace("invoke-interface {v4,", "invoke-interface {v1,"))),
            "a cast to another type than the check's" to chatPreviewFixture() + gateClass(gate(GATE_BODY.replaceFirst(
                "check-cast v4, Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;", "check-cast v4, LX/4qO;"))),
            "an interface read with no cast" to chatPreviewFixture() + gateClass(gate(GATE_BODY.replace(
                "check-cast v4, Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;\n", ""))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(CHAT_PREVIEW)) }
        }
    }

    @Test fun everyAnswerPassesThroughTheSwitchBeforeAnythingReadsIt() {
        val method = handler()
        val before = method.code()
        injectControl(CHAT_PREVIEW, mapOf(CHAT_PREVIEW to listOf(method)))
        val code = method.code()
        val calls = method.helperCalls()
        assertEquals(3, calls.size)
        for (at in calls) {
            // The flag's own answer goes in, and the switch's answer comes back to the same register.
            val answer = (code[at - 1] as OneRegisterInstruction).registerA
            assertEquals(Opcode.MOVE_RESULT, code[at - 1].opcode)
            assertEquals(Opcode.INVOKE_STATIC_RANGE, code[at].opcode)
            assertEquals(Opcode.MOVE_RESULT, code[at + 1].opcode)
            assertEquals(answer, (code[at + 1] as OneRegisterInstruction).registerA)
        }
        // The preview's answer is still what the delayed branch reads, and a no still lands on Messenger's plain menu.
        val branch = code.indexOfFirst { it.opcode == Opcode.IF_EQZ && (it as OneRegisterInstruction).registerA == 6 }
        assertTrue(branch > calls[1])
        assertEquals(MENU, (code[code.branchTarget(branch)] as ReferenceInstruction).reference.toString())
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

    @Test fun everySupportedBuildPassesEveryPreviewReadThroughTheSwitch() {
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
            // The long-press handler asks the encrypted-chat flag around its preview read.
            assertTrue(hooks.any { MutableMethod(it).chatPreviewSites().map { s -> s.flag } ==
                listOf(CHAT_PREVIEW_ENCRYPTED_FLAG, CHAT_PREVIEW_FLAG, CHAT_PREVIEW_ENCRYPTED_FLAG) }, code)
            for (hook in hooks) {
                val method = MutableMethod(hook)
                val sites = method.chatPreviewSites().size
                val before = method.code()
                method.injectChatPreview()
                val calls = method.helperCalls()
                assertEquals(sites, calls.size, code)
                val after = method.code()
                assertTrue(calls.all { after[it - 1].opcode == Opcode.MOVE_RESULT && after[it + 1].opcode == Opcode.MOVE_RESULT }, code)
                assertEquals(before.map { it.opcode }.filter { it != Opcode.NOP },
                    after.filterIndexed { i, _ -> calls.none { i == it || i == it + 1 } }.map { it.opcode }.filter { it != Opcode.NOP }, code)
            }
        }
    }
}
