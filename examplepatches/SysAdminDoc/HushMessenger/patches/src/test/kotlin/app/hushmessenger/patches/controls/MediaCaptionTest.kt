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
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val COMPOSER = "LX/9CF;"
private const val PARAMS = "LX/9Cd;"
private const val MAP = "Lcom/google/common/collect/ImmutableMap;"
internal const val SYNTHETIC_MEDIA_CAPTION = "$COMPOSER->A0L($COMPOSER)V"
private const val TEXT_SEND = "$COMPOSER->A0T($COMPOSER${IMMUTABLE_LIST}${MAP}Ljava/lang/String;Ljava/util/List;)V"
private const val PARAMS_INIT = "$PARAMS-><init>($COMPOSER${IMMUTABLE_LIST}${MAP}Ljava/lang/String;)V"
private const val BUILD_PARAMS = "new-instance v5, $PARAMS"
private const val FILL_PARAMS = "invoke-direct {v5, v4, v1, v2, v3}, $PARAMS_INIT"
private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

/**
 * onSendClicked as Messenger 587 writes it, cut to the part that matters: the marker, the composer's text and its
 * mentions, the media parameters built from both, the media send, and the text send the no-media path takes.
 */
private val SEND_BODY = """
    const-string v0, "ComposeFragment.onSendClicked"
    move-object v4, p0
    invoke-direct {v4}, $COMPOSER->A0B()Ljava/lang/String;
    move-result-object v3
    invoke-static {v4}, $COMPOSER->A0C($COMPOSER)$IMMUTABLE_LIST
    move-result-object v1
    const/4 v2, 0x0
    $BUILD_PARAMS
    $FILL_PARAMS
    invoke-static {v4, v5}, $COMPOSER->A0J($COMPOSER$PARAMS)V
    const/4 v6, 0x0
    invoke-static {v4, v1, v2, v6, v6}, $TEXT_SEND
    return-void
""".trimIndent()

private fun send(body: String = SEND_BODY) = fixtureMethod(SYNTHETIC_MEDIA_CAPTION, body, 10, STATIC)

/** The send with the first [from] swapped for [to]. */
private fun changed(from: String, to: String) =
    send(SEND_BODY.replaceFirst(from, to).also { check(it != SEND_BODY) })

internal fun mediaCaptionFixture(method: MutableMethod = send()): List<MutableClass> =
    listOf(fixtureClass(COMPOSER, listOf(method)))

private fun Method.code() = implementation!!.instructions.toList()

private fun Method.helperCalls() = code().let { code ->
    code.indices.filter { ((code[it] as? ReferenceInstruction)?.reference as? MethodReference)?.name == MEDIA_CAPTION_HELPER }
}

class MediaCaptionTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(MEDIA_CAPTION).map { it.hookId() }.toSet()

    @Test fun theSendIsFoundWhereItHandsTheTypedTextToTheMediaParameters() {
        assertEquals(setOf(SYNTHETIC_MEDIA_CAPTION), found(mediaCaptionFixture()))
        validateControls(mirroredControls(mediaCaptionFixture()), setOf(MEDIA_CAPTION))
        val site = send().validateMediaCaption()
        assertEquals(4, site.fragment)
        assertEquals(1, site.mentions)
        assertEquals(2, site.params)
        assertEquals(3, site.text)
        assertEquals(TEXT_SEND, site.textSend)
    }

    // The words go out on their own send, so a composer whose text takes another road, or a send the words could land
    // in twice, gets no hook and the switch stays unapplied rather than putting a message somewhere else.
    @Test fun anyOtherShapeLeavesTheControlUnapplied() {
        val cases = mapOf(
            "a send that isn't the composer's" to changed("const-string v0, \"ComposeFragment.onSendClicked\"", "const-string v0, \"ComposeFragment.onCreate\""),
            "two sets of media parameters" to changed(FILL_PARAMS, "$FILL_PARAMS\n    $BUILD_PARAMS\n    $FILL_PARAMS"),
            "parameters built over the text" to changed(FILL_PARAMS, "invoke-direct {v5, v4, v1, v2, v5}, $PARAMS_INIT"),
            "parameters built in a range call" to changed("$BUILD_PARAMS\n$FILL_PARAMS",
                "new-instance v3, $PARAMS\ninvoke-direct/range {v3 .. v7}, $PARAMS_INIT"),
            "no text send to pass the words to" to
                changed(TEXT_SEND, "$COMPOSER->A0T($COMPOSER${IMMUTABLE_LIST}${MAP}Ljava/lang/String;Ljava/util/Set;)V"),
            "a second text send" to changed("invoke-static {v4, v1, v2, v6, v6}, $TEXT_SEND",
                "invoke-static {v4, v1, v2, v6, v6}, $TEXT_SEND\n    invoke-static {v4, v1, v2, v6, v6}, $COMPOSER->A0U($COMPOSER${IMMUTABLE_LIST}${MAP}Ljava/lang/String;Ljava/util/List;)V"),
            "a jump onto the parameters" to send(SEND_BODY.replaceFirst(BUILD_PARAMS, ":again\n    $BUILD_PARAMS")
                .replaceFirst("const/4 v6, 0x0", "const/4 v6, 0x0\n    if-nez v6, :again")),
        )
        for ((case, method) in cases) {
            val classes = mediaCaptionFixture(method)
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(MEDIA_CAPTION)) }
        }
    }

    @Test fun theTypedTextGoesThroughTheHelperBeforeTheMediaParametersAreBuilt() {
        val method = send()
        val before = method.code()
        val site = method.validateMediaCaption()
        injectControl(MEDIA_CAPTION, mapOf(MEDIA_CAPTION to listOf(method)))
        val code = method.code()
        val calls = method.helperCalls()
        assertEquals(1, calls.size)
        val at = calls.single()
        assertEquals(site.at, at)
        assertEquals(Opcode.INVOKE_STATIC, code[at].opcode)
        assertEquals(Opcode.MOVE_RESULT_OBJECT, code[at + 1].opcode)
        // The helper's answer comes back to the register the parameters are built from.
        assertEquals(site.text, (code[at + 1] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.NEW_INSTANCE, code[at + 2].opcode)
        // Everything else runs as Messenger wrote it.
        assertEquals(before.map { it.opcode }, code.filterIndexed { i, _ -> i != at && i != at + 1 }.map { it.opcode })
    }

    @Test fun theHelperSendsTheWordsFirstAndLeavesAnEmptyCaption() {
        val helper = mediaCaptionHelper(COMPOSER, TEXT_SEND)
        assertEquals(MEDIA_CAPTION_HELPER, helper.name)
        assertTrue(AccessFlags.STATIC.isSet(helper.accessFlags))
        assertEquals("Ljava/lang/String;", helper.returnType)
        assertEquals(listOf(COMPOSER, IMMUTABLE_LIST, MAP, "Ljava/lang/String;"), helper.parameterTypes.map { it.toString() })
        val calls = helper.code().mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .map { "${it.definingClass}->${it.name}" }
        assertTrue(calls.contains("$SETTINGS->captionBeforeMedia"), calls.toString())
        assertTrue(calls.contains("$COMPOSER->A0T"), calls.toString())
        assertEquals(Opcode.RETURN_OBJECT, helper.code().last().opcode)
        assertTrue(helper.code().any { it.opcode == Opcode.CONST_STRING })
    }

    @Test fun theComposerTakesTheHelperOnlyOnce() {
        val host = fixtureClass(COMPOSER, listOf(send()))
        host.addMediaCaptionHelper(mediaCaptionHelper(COMPOSER, TEXT_SEND))
        assertTrue(host.methods.any { it.name == MEDIA_CAPTION_HELPER })
        assertFailsWith<PatchException> { host.addMediaCaptionHelper(mediaCaptionHelper(COMPOSER, TEXT_SEND)) }
    }

    @Test fun anUnusableSendRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            "a method that sends nothing" to fixtureMethod("$COMPOSER->A00()V", "return-void", 1),
            "a send that hands the text somewhere else" to changed(FILL_PARAMS, "invoke-direct {v5, v4, v1, v2, v5}, $PARAMS_INIT"),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(MEDIA_CAPTION, mapOf(MEDIA_CAPTION to listOf(bad))) }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildHandsItsCaptionToTheHelper() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val hooks = findMediaCaption(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(MEDIA_CAPTION), hooks.map { it.hookId() }.toSet(), code)
            assertEquals(1, hooks.size, code)
            validateControls(mapOf(MEDIA_CAPTION to hooks), setOf(MEDIA_CAPTION))
            val method = MutableMethod(hooks.single())
            val site = method.validateMediaCaption()
            method.injectMediaCaption()
            val after = method.code()
            val at = method.helperCalls().single()
            assertEquals(site.at, at, code)
            assertEquals(Opcode.MOVE_RESULT_OBJECT, after[at + 1].opcode, code)
            assertEquals(site.text, (after[at + 1] as OneRegisterInstruction).registerA, code)
            assertEquals(Opcode.NEW_INSTANCE, after[at + 2].opcode, code)
        }
    }
}
