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
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val CONFIG = "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;"
private const val THREAD_KEY = "Lcom/facebook/messaging/model/threadkey/ThreadKey;"
internal const val SYNTHETIC_CHAT_BAR_TEST = "LX/Cbt;->A00($THREAD_KEY)Z"
internal const val SYNTHETIC_CHAT_BAR_MENU = "LX/Cbo;->A1C()LX/Cbn;"
internal const val SYNTHETIC_CHAT_BAR_MIC = "LX/Cbo;->A8E(LX/Cbp;)V"
internal const val SYNTHETIC_CHAT_BAR_LAZIES = "LX/Cbr;->A04(LX/Cbr;I)Ljava/lang/Object;"
private const val OTHER_CHECK = "LX/Cbt;->A01($THREAD_KEY)Z"

/** The check every chat asks, as 588 writes it: the chat's kind first, then the server test's own flag. */
private val TEST_BODY = """
    const/4 v3, 0x0
    invoke-static {p1}, LX/Cbu;->A00($THREAD_KEY)Z
    move-result v0
    if-eqz v0, :no
    invoke-static {}, LX/Cbc;->A06()LX/Cbs;
    move-result-object v2
    const-wide v0, ${CHAT_BAR_MENU_FLAG}L
    check-cast v2, $CONFIG
    invoke-interface {v2, v0, v1}, $CONFIG->BA3(J)Z
    move-result v0
    if-eqz v0, :no
    const/4 v3, 0x1
    :no
    return v3
""".trimIndent()

/** The + menu's builder cut down: the gallery row behind the check and its flag, the camera's notice, the mic's row behind both. */
private val MENU_BODY = """
    invoke-static {}, LX/Cbc;->A06()LX/Cbs;
    move-result-object v4
    iget-object v6, p0, LX/Cbo;->A0o:$THREAD_KEY
    iget-object v1, p0, LX/Cbo;->A0p:LX/Cbt;
    invoke-virtual {v1, v6}, $SYNTHETIC_CHAT_BAR_TEST
    move-result v0
    if-eqz v0, :camera
    sget-object v0, LX/Cbd;->A0A:LX/Cbd;
    const-wide v2, ${CHAT_BAR_GALLERY_FLAG}L
    check-cast v4, $CONFIG
    invoke-interface {v4, v0, v2, v3}, $CONFIG->BAE(LX/Cbd;J)Z
    move-result v0
    if-eqz v0, :camera
    const-string v5, "gallery"
    :camera
    const-string v5, "upload_video_interstitial"
    invoke-virtual {v1, v6}, $SYNTHETIC_CHAT_BAR_TEST
    move-result v0
    if-eqz v0, :done
    sget-object v0, LX/Cbd;->A0A:LX/Cbd;
    const-wide v2, ${CHAT_BAR_VOICE_FLAG}L
    check-cast v4, $CONFIG
    invoke-interface {v4, v0, v2, v3}, $CONFIG->BAE(LX/Cbd;J)Z
    move-result v0
    if-eqz v0, :done
    const-string v5, "upload_audio_interstitial"
    :done
    const/4 v0, 0x0
    return-object v0
""".trimIndent()

/** The mic's composer setup, behind the check and the mic's flag. */
private val MIC_BODY = """
    iget-object v1, p0, LX/Cbo;->A0p:LX/Cbt;
    iget-object v3, p0, LX/Cbo;->A0o:$THREAD_KEY
    invoke-virtual {v1, v3}, $SYNTHETIC_CHAT_BAR_TEST
    move-result v0
    if-eqz v0, :done
    invoke-static {}, LX/Cbc;->A06()LX/Cbs;
    move-result-object v2
    sget-object v3, LX/Cbd;->A0A:LX/Cbd;
    const-wide v0, ${CHAT_BAR_VOICE_FLAG}L
    check-cast v2, $CONFIG
    invoke-interface {v2, v3, v0, v1}, $CONFIG->BAE(LX/Cbd;J)Z
    move-result v0
    if-eqz v0, :done
    invoke-interface {p1}, LX/Cbp;->FeL()V
    :done
    return-void
""".trimIndent()

/** The bar's lazy answers, one per button, as Redex merges them: the mic's and the gallery's. */
private val LAZIES_BODY = """
    if-nez p1, :gallery
    invoke-static {}, LX/Cbc;->A06()LX/Cbs;
    move-result-object v2
    const-wide v0, ${CHAT_BAR_VOICE_FLAG}L
    check-cast v2, $CONFIG
    invoke-interface {v2, v0, v1}, $CONFIG->BA3(J)Z
    move-result v1
    const/4 v0, 0x1
    if-nez v1, :voice
    const/4 v0, 0x0
    :voice
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v0
    return-object v0
    :gallery
    invoke-static {}, LX/Cbc;->A06()LX/Cbs;
    move-result-object v2
    const-wide v0, ${CHAT_BAR_GALLERY_FLAG}L
    check-cast v2, $CONFIG
    invoke-interface {v2, v0, v1}, $CONFIG->BA3(J)Z
    move-result v1
    const/4 v0, 0x1
    if-nez v1, :gallery_yes
    const/4 v0, 0x0
    :gallery_yes
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v0
    return-object v0
""".trimIndent()

private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

private fun test(body: String = TEST_BODY) = fixtureMethod(SYNTHETIC_CHAT_BAR_TEST, body, 6)
private fun menu(body: String = MENU_BODY) = fixtureMethod(SYNTHETIC_CHAT_BAR_MENU, body, 8)
private fun mic(body: String = MIC_BODY) = fixtureMethod(SYNTHETIC_CHAT_BAR_MIC, body, 6)
private fun lazies(body: String = LAZIES_BODY) = fixtureMethod(SYNTHETIC_CHAT_BAR_LAZIES, body, 5, STATIC)

/** [body] with the first [from] swapped for [to], which has to be there. */
private fun String.swap(from: String, to: String) = replaceFirst(from, to).also { check(it != this) }

internal fun chatBarMenuFixture(
    test: MutableMethod = test(),
    menu: MutableMethod = menu(),
    mic: MutableMethod = mic(),
    lazies: MutableMethod = lazies(),
): List<MutableClass> = listOf(
    fixtureClass("LX/Cbt;", listOf(test, fixtureMethod(OTHER_CHECK, "const/4 v0, 0x0\nreturn v0", 6))),
    fixtureClass("LX/Cbo;", listOf(menu, mic)),
    fixtureClass("LX/Cbr;", listOf(lazies)),
)

private val ALL = setOf(SYNTHETIC_CHAT_BAR_TEST, SYNTHETIC_CHAT_BAR_MENU, SYNTHETIC_CHAT_BAR_MIC, SYNTHETIC_CHAT_BAR_LAZIES)

private fun Method.code() = implementation!!.instructions.toList()

private fun Method.helperCalls() = code().indices.filter { (code()[it] as? ReferenceInstruction)?.reference?.toString() == CHAT_BAR_PLUS_MENU_CALL }

/** #241: on 588 the switch answers Messenger's own flags for moving the chat bar's buttons into the + menu. */
class ChatBarPlusMenuTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(CHAT_BAR_PLUS_MENU).map { it.hookId() }.toSet()

    @Test fun everyReaderIsTakenWhenTheBuilderAsksTheCheck() {
        assertEquals(ALL, found(chatBarMenuFixture()))
        validateControls(mirroredControls(chatBarMenuFixture()), setOf(CHAT_BAR_PLUS_MENU))
        assertEquals(listOf(CHAT_BAR_MENU_FLAG), test().chatBarMenuSites().map { it.flag })
        assertEquals(listOf(CHAT_BAR_GALLERY_FLAG, CHAT_BAR_VOICE_FLAG), menu().chatBarMenuSites().map { it.flag })
        assertEquals(listOf(CHAT_BAR_VOICE_FLAG), mic().chatBarMenuSites().map { it.flag })
        assertEquals(listOf(CHAT_BAR_VOICE_FLAG, CHAT_BAR_GALLERY_FLAG), lazies().chatBarMenuSites().map { it.flag })
    }

    @Test fun eachMappingHooksItsOwnFourMethods() {
        assertEquals(ALL, SYNTHETIC_PROFILE.hooks.getValue(CHAT_BAR_PLUS_MENU))
        assertEquals(setOf("LX/5os;->A1C()LX/4nM;", "LX/5os;->A8E(LX/6Be;)V", "LX/5yl;->A00($THREAD_KEY)Z",
            "LX/6Br;->A04(LX/6Br;I)Ljava/lang/Object;"), PROFILE_347617503.hooks.getValue(CHAT_BAR_PLUS_MENU))
        assertEquals(setOf("LX/5s9;->A1C()LX/4qd;", "LX/5s9;->A8E(LX/6F1;)V", "LX/622;->A00($THREAD_KEY)Z",
            "LX/6FA;->A04(LX/6FA;I)Ljava/lang/Object;"), PROFILE_347617497.hooks.getValue(CHAT_BAR_PLUS_MENU))
    }

    // The switch says the buttons move into the + menu. A reader that asks some other way, or a set that doesn't tie
    // back to the menu's builder, could turn on something else, so nothing gets a hook.
    @Test fun anyOtherShapeLeavesTheControlUnapplied() {
        val interstitials = "const-string v0, \"upload_video_interstitial\"\nconst-string v0, \"upload_audio_interstitial\"\n"
        val cases = mapOf(
            "no builder" to chatBarMenuFixture(menu = menu(MENU_BODY.swap("upload_audio_interstitial", "audio"))),
            "a second builder" to chatBarMenuFixture(mic = mic(interstitials + MIC_BODY)),
            "the test's flag read in the builder" to chatBarMenuFixture(menu = menu(MENU_BODY.swap("${CHAT_BAR_GALLERY_FLAG}L", "${CHAT_BAR_MENU_FLAG}L"))),
            "the test's flag read in a second method" to chatBarMenuFixture(lazies = lazies(LAZIES_BODY.swap("${CHAT_BAR_VOICE_FLAG}L", "${CHAT_BAR_MENU_FLAG}L"))),
            "a check that reads another flag too" to chatBarMenuFixture(test = test(TEST_BODY.swap("const/4 v3, 0x1",
                "const-wide v0, ${CHAT_BAR_VOICE_FLAG}L\ncheck-cast v2, $CONFIG\ninvoke-interface {v2, v0, v1}, $CONFIG->BA3(J)Z\nmove-result v3\nconst/4 v3, 0x1"))),
            "a builder that doesn't ask the check" to chatBarMenuFixture(menu = menu(MENU_BODY.replace(SYNTHETIC_CHAT_BAR_TEST, OTHER_CHECK))),
            "the gallery flag read twice by the builder" to chatBarMenuFixture(menu = menu(MENU_BODY.swap("${CHAT_BAR_VOICE_FLAG}L", "${CHAT_BAR_GALLERY_FLAG}L"))),
            "no gallery read in the builder" to chatBarMenuFixture(menu = menu(MENU_BODY.swap("${CHAT_BAR_GALLERY_FLAG}L", "0x1L"))),
            "a read with no cast" to chatBarMenuFixture(lazies = lazies(LAZIES_BODY.swap("check-cast v2, $CONFIG\n", ""))),
            "a cast to another type than the check's" to chatBarMenuFixture(test = test(TEST_BODY.swap("check-cast v2, $CONFIG", "check-cast v2, LX/Cbs;"))),
            "a read asked on another register than the cast" to chatBarMenuFixture(test = test(TEST_BODY.swap("invoke-interface {v2, v0, v1}", "invoke-interface {v3, v0, v1}"))),
            "a static read" to chatBarMenuFixture(test = test(TEST_BODY.swap("invoke-interface {v2, v0, v1}, $CONFIG->BA3(J)Z",
                "invoke-static {v2, v0, v1}, $CONFIG->BA3(Ljava/lang/Object;J)Z"))),
            "a read that isn't a yes or no" to chatBarMenuFixture(test = test(TEST_BODY.swap("$CONFIG->BA3(J)Z", "$CONFIG->BA3(J)I"))),
            "a read that doesn't take the flag last" to chatBarMenuFixture(test = test(TEST_BODY.swap("invoke-interface {v2, v0, v1}, $CONFIG->BA3(J)Z",
                "invoke-interface {v2, v0, v1, v3}, $CONFIG->BA3(JI)Z"))),
            "an answer nothing takes" to chatBarMenuFixture(lazies = lazies(LAZIES_BODY.swap("move-result v1", "const/4 v1, 0x1"))),
            "a jump into the read" to chatBarMenuFixture(lazies = lazies(LAZIES_BODY.swap("if-nez p1, :gallery", "if-nez p1, :into")
                .swap("${CHAT_BAR_GALLERY_FLAG}L\ncheck-cast v2, $CONFIG\n", "${CHAT_BAR_GALLERY_FLAG}L\ncheck-cast v2, $CONFIG\n:into\n"))),
            "a jump onto the instruction after the read" to chatBarMenuFixture(test = test(TEST_BODY.swap("if-eqz v0, :no\ninvoke-static {}", "if-eqz v0, :after\ninvoke-static {}")
                .swap("$CONFIG->BA3(J)Z\nmove-result v0\n", "$CONFIG->BA3(J)Z\nmove-result v0\n:after\n"))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(CHAT_BAR_PLUS_MENU)) }
        }
    }

    @Test fun everyAnswerPassesThroughTheSwitchBeforeAnythingReadsIt() {
        for (method in listOf(test(), menu(), mic(), lazies())) {
            val sites = method.chatBarMenuSites()
            val before = method.code()
            injectControl(CHAT_BAR_PLUS_MENU, mapOf(CHAT_BAR_PLUS_MENU to listOf(method)))
            val code = method.code()
            val calls = method.helperCalls()
            assertEquals(sites.size, calls.size, method.hookId())
            for ((site, at) in sites.zip(calls)) {
                // The flag's own answer goes in, and the switch's answer comes back to the same register.
                assertEquals(Opcode.MOVE_RESULT, code[at - 1].opcode)
                assertEquals(site.register, (code[at - 1] as OneRegisterInstruction).registerA)
                assertEquals(Opcode.INVOKE_STATIC_RANGE, code[at].opcode)
                assertEquals(listOf(site.register, 1), (code[at] as RegisterRangeInstruction).let { listOf(it.startRegister, it.registerCount) })
                assertEquals(Opcode.MOVE_RESULT, code[at + 1].opcode)
                assertEquals(site.register, (code[at + 1] as OneRegisterInstruction).registerA)
            }
            // Everything else runs as Messenger wrote it.
            assertEquals(before.map { it.opcode }, code.filterIndexed { i, _ -> calls.none { i == it || i == it + 1 } }.map { it.opcode }, method.hookId())
        }
        // The mic's bar answer still branches on what the switch handed back.
        val method = lazies()
        injectControl(CHAT_BAR_PLUS_MENU, mapOf(CHAT_BAR_PLUS_MENU to listOf(method)))
        val code = method.code()
        val first = method.helperCalls().first()
        assertEquals(Opcode.IF_NEZ, code[first + 3].opcode)
        assertEquals((code[first + 1] as OneRegisterInstruction).registerA, (code[first + 3] as OneRegisterInstruction).registerA)
    }

    @Test fun anUnusableMethodRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            "a method with no read" to fixtureMethod(OTHER_CHECK, "const/4 v0, 0x0\nreturn v0", 6),
            "a read with no cast" to lazies(LAZIES_BODY.swap("check-cast v2, $CONFIG\n", "")),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(CHAT_BAR_PLUS_MENU, mapOf(CHAT_BAR_PLUS_MENU to listOf(bad))) }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildPassesEveryFlagReadThroughTheSwitch() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val hooks = findChatBarPlusMenu(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(CHAT_BAR_PLUS_MENU), hooks.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(CHAT_BAR_PLUS_MENU to hooks), setOf(CHAT_BAR_PLUS_MENU))
            // The test's flag once, in the check, and the gallery's and the mic's wherever the bar and the menu read them.
            val flags = hooks.flatMap { MutableMethod(it).chatBarMenuSites().map { s -> s.flag } }
            assertEquals(1, flags.count { it == CHAT_BAR_MENU_FLAG }, code)
            assertEquals(setOf(CHAT_BAR_MENU_FLAG, CHAT_BAR_GALLERY_FLAG, CHAT_BAR_VOICE_FLAG), flags.toSet(), code)
            for (hook in hooks) {
                val method = MutableMethod(hook)
                val sites = method.chatBarMenuSites()
                val before = method.code()
                method.injectChatBarPlusMenu()
                val calls = method.helperCalls()
                val after = method.code()
                assertEquals(sites.size, calls.size, code)
                for ((site, at) in sites.zip(calls)) {
                    assertEquals(Opcode.MOVE_RESULT, after[at - 1].opcode, code)
                    assertEquals(site.register, (after[at - 1] as OneRegisterInstruction).registerA, code)
                    assertEquals(Opcode.MOVE_RESULT, after[at + 1].opcode, code)
                    assertEquals(site.register, (after[at + 1] as OneRegisterInstruction).registerA, code)
                }
                assertEquals(before.map { it.opcode }.filter { it != Opcode.NOP },
                    after.filterIndexed { i, _ -> calls.none { i == it || i == it + 1 } }.map { it.opcode }.filter { it != Opcode.NOP }, code)
            }
        }
    }
}
