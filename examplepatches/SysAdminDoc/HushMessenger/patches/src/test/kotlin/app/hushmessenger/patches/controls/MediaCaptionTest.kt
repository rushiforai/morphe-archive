package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
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
private const val KIND = "LX/5GM;"
private const val MAP = "Lcom/google/common/collect/ImmutableMap;"
private const val EMPTY_MAP = "Lcom/google/common/collect/RegularImmutableMap;->A03:$MAP"
internal const val SYNTHETIC_MEDIA_CAPTION = "$COMPOSER->A0L($COMPOSER)V"
private const val TEXT_SEND = "$COMPOSER->A0T($COMPOSER${IMMUTABLE_LIST}${MAP}Ljava/lang/String;Ljava/util/List;)V"
private const val TYPED_TEXT = "$COMPOSER->A0B()Ljava/lang/String;"
private const val MEDIA_SEND = "$COMPOSER->A0I($KIND${COMPOSER}LX/ABT;Lcom/facebook/messaging/model/messages/MessageRepliedTo;" +
    "$MAP${MAP}Ljava/lang/String;Ljava/util/List;)V"
private const val PARAMS_INIT = "$PARAMS-><init>($COMPOSER${IMMUTABLE_LIST}${MAP}Ljava/lang/String;)V"
private const val NOTHING_TO_SEND = "$COMPOSER->A2H()Z"
private const val MEDIA_GUARD = "if-nez v0, :flag"
private const val FLAG = "if-eqz v5, :check"
private const val PLAIN_MEDIA = "sget-object v7, $KIND->A07:$KIND"
private const val SEND_TEXT = "invoke-static {v8, v0, v1, v0, v2}, $TEXT_SEND"
private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

/**
 * onSendClicked as Messenger 587 and 588 write it, cut to the part that matters: the media from the composer, the
 * flag for a send whose mentions take the words along with the media (a question to Meta AI about the photo), that
 * send, the plain media send, and the text send the plain path ends with.
 */
private val SEND_BODY = """
    const-string v1, "ComposeFragment.onSendClicked"
    move-object v8, p0
    invoke-static {v8}, $COMPOSER->A0M($COMPOSER)Ljava/util/ArrayList;
    move-result-object v1
    invoke-static {v8}, $COMPOSER->A0N($COMPOSER)Z
    move-result v5
    sget-object v11, $EMPTY_MAP
    if-eqz v5, :plain
    invoke-direct {v8}, $TYPED_TEXT
    move-result-object v2
    invoke-static {v8}, $COMPOSER->A0C($COMPOSER)$IMMUTABLE_LIST
    move-result-object v0
    new-instance v9, $PARAMS
    invoke-direct {v9, v8, v0, v11, v2}, $PARAMS_INIT
    invoke-static {v8, v9, v1}, $COMPOSER->A0J(${COMPOSER}${PARAMS}Ljava/util/List;)V
    :plain
    invoke-virtual {v1}, Ljava/util/AbstractCollection;->isEmpty()Z
    move-result v0
    $MEDIA_GUARD
    $PLAIN_MEDIA
    const/4 v9, 0x0
    move-object v10, v9
    move-object v12, v11
    move-object v13, v9
    move-object v14, v1
    invoke-static/range {v7 .. v14}, $MEDIA_SEND
    :flag
    $FLAG
    goto :clear
    :check
    invoke-virtual {v8}, $NOTHING_TO_SEND
    move-result v0
    if-nez v0, :done
    invoke-static {}, LX/001;->A0z()Ljava/util/ArrayList;
    move-result-object v2
    sget-object v1, $EMPTY_MAP
    const/4 v0, 0x0
    $SEND_TEXT
    goto :done
    :clear
    invoke-virtual {v8}, $COMPOSER->A1n()V
    :done
    return-void
""".trimIndent()

private fun send(body: String = SEND_BODY) = fixtureMethod(SYNTHETIC_MEDIA_CAPTION, body, 16, STATIC)

/** The send with the first [from] swapped for [to]. */
private fun changed(from: String, to: String) =
    send(SEND_BODY.replaceFirst(from, to).also { check(it != SEND_BODY) })

internal fun mediaCaptionFixture(method: MutableMethod = send()): List<MutableClass> =
    listOf(fixtureClass(COMPOSER, listOf(method)))

private fun Method.code() = implementation!!.instructions.toList()

private fun Instruction.called() = ((this as? ReferenceInstruction)?.reference as? MethodReference)
    ?.let { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }

private fun Method.helperCalls() = code().let { code ->
    code.indices.filter { ((code[it] as? ReferenceInstruction)?.reference as? MethodReference)?.name == MEDIA_CAPTION_HELPER }
}

class MediaCaptionTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(MEDIA_CAPTION).map { it.hookId() }.toSet()

    @Test fun theSendIsFoundWhereThePlainMediaSendStarts() {
        assertEquals(setOf(SYNTHETIC_MEDIA_CAPTION), found(mediaCaptionFixture()))
        validateControls(mirroredControls(mediaCaptionFixture()), setOf(MEDIA_CAPTION))
        val method = send()
        val code = method.code()
        val site = method.validateMediaCaption()
        assertEquals(code.indexOfFirst { it.opcode == Opcode.SGET_OBJECT && "$KIND->A07" in (it as ReferenceInstruction).reference.toString() }, site.at)
        assertEquals(8, site.fragment)
        assertEquals(5, site.sent)
        assertEquals(MediaCaptionCalls(TEXT_SEND, TYPED_TEXT, EMPTY_MAP), site.calls)
    }

    // #236: the hook sat on the media parameters only the words-with-the-media branch builds, which a plain photo
    // never takes, so a plain send still put the media first and the words after it.
    @Test fun theWordsGoOutRightBeforeThePlainMediaSend() {
        val method = send()
        val before = method.code()
        injectControl(MEDIA_CAPTION, mapOf(MEDIA_CAPTION to listOf(method)))
        val code = method.code()
        val at = method.helperCalls().single()
        // Right after the branch taken with no media left, and ahead of the plain media send.
        assertEquals(Opcode.IF_NEZ, code[at - 1].opcode)
        assertEquals(MEDIA_SEND, code.drop(at).firstNotNullOf { insn -> insn.called()?.takeIf { insn.opcode == Opcode.INVOKE_STATIC_RANGE } })
        // The helper gets the fragment and the flag, and its answer goes back into the flag.
        assertEquals(listOf(8, 5), (code[at] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) })
        assertEquals(Opcode.MOVE_RESULT, code[at + 1].opcode)
        assertEquals(5, (code[at + 1] as OneRegisterInstruction).registerA)
        // The words-with-the-media branch is left as Messenger wrote it.
        assertTrue(at > code.indexOfFirst { it.opcode == Opcode.NEW_INSTANCE })
        assertEquals(before.map { it.opcode }, code.filterIndexed { i, _ -> i != at && i != at + 1 }.map { it.opcode })
    }

    // The words go out on their own send, so a send whose shape could put them somewhere else, or out twice, gets no
    // hook and the switch stays unapplied rather than moving a message.
    @Test fun anyOtherShapeLeavesTheControlUnapplied() {
        val cases = mapOf(
            "a send that isn't the composer's" to changed("const-string v1, \"ComposeFragment.onSendClicked\"", "const-string v1, \"ComposeFragment.onCreate\""),
            "no flag for words that already went" to changed("$FLAG\ngoto :clear", "if-nez v5, :clear"),
            "a flag with no jump to clear the composer" to changed("$FLAG\ngoto :clear", "$FLAG\nnop\ngoto :clear"),
            "a text send handed the typed text" to changed(SEND_TEXT, "invoke-static {v8, v0, v1, v2, v2}, $TEXT_SEND"),
            "a text send handed a map that isn't the empty one" to changed("sget-object v1, $EMPTY_MAP",
                "invoke-static {}, $COMPOSER->A0P()$MAP\nmove-result-object v1"),
            "a branch between the question and the text send" to changed("move-result-object v2\nsget-object v1",
                "move-result-object v2\nif-eqz v2, :done\nsget-object v1"),
            "two text sends" to changed("$SEND_TEXT\ngoto :done", "$SEND_TEXT\n$SEND_TEXT\ngoto :done"),
            "something between the media send and the flag" to changed("invoke-static/range {v7 .. v14}, $MEDIA_SEND",
                "invoke-static/range {v7 .. v14}, $MEDIA_SEND\nnop"),
            "a media send that writes over the flag" to changed("move-object v14, v1", "move-object v14, v1\nconst/4 v5, 0x0"),
            "a jump into the media send" to send(SEND_BODY.replaceFirst(PLAIN_MEDIA, ":again\n$PLAIN_MEDIA")
                .replaceFirst("invoke-virtual {v8}, $COMPOSER->A1n()V", "invoke-virtual {v8}, $COMPOSER->A1n()V\nif-nez v6, :again")),
            "no reader of the typed text" to changed("invoke-direct {v8}, $TYPED_TEXT", "invoke-static {v8}, $COMPOSER->A0B($COMPOSER)Ljava/lang/String;"),
        )
        for ((case, method) in cases) {
            val classes = mediaCaptionFixture(method)
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(MEDIA_CAPTION)) }
        }
    }

    @Test fun theHelperSendsTheWordsTheStockWayAndRaisesTheFlag() {
        val helper = mediaCaptionHelper(COMPOSER, MediaCaptionCalls(TEXT_SEND, TYPED_TEXT, EMPTY_MAP))
        assertEquals(MEDIA_CAPTION_HELPER, helper.name)
        assertTrue(AccessFlags.STATIC.isSet(helper.accessFlags))
        assertEquals("I", helper.returnType)
        assertEquals(listOf(COMPOSER, "I"), helper.parameterTypes.map { it.toString() })
        val code = helper.code()
        val calls = code.mapNotNull { it.called() }
        assertEquals(listOf(TYPED_TEXT, "$SETTINGS->captionBeforeMedia(Ljava/lang/String;)Z", "Ljava/util/ArrayList;-><init>()V", TEXT_SEND), calls)
        // The text send gets the fragment, no mentions, the empty map, no text and a fresh list, as Messenger's own.
        val sendAt = code.indexOfFirst { it.called() == TEXT_SEND }
        assertEquals(listOf(3, 0, 1, 0, 2), (code[sendAt] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD, it.registerE, it.registerF, it.registerG) })
        assertTrue(code.any { it.opcode == Opcode.SGET_OBJECT && (it as ReferenceInstruction).reference.toString() == EMPTY_MAP })
        // A flag that's already up, or the switch's no, skips straight to the answer; a sent text raises it.
        val answer = code.indexOfLast { it.opcode == Opcode.RETURN }
        assertEquals(answer, code.lastIndex)
        assertEquals(4, (code[answer] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_NEZ, code[0].opcode)
        assertEquals(4, (code[0] as OneRegisterInstruction).registerA)
        assertEquals(answer, (code[0] as BuilderOffsetInstruction).target.location.index)
        val no = code.indexOfFirst { it.opcode == Opcode.IF_EQZ }
        assertEquals(answer, (code[no] as BuilderOffsetInstruction).target.location.index)
        assertEquals(Opcode.CONST_4, code[answer - 1].opcode)
        assertEquals(4, (code[answer - 1] as OneRegisterInstruction).registerA)
        assertEquals(1, (code[answer - 1] as NarrowLiteralInstruction).narrowLiteral)
    }

    @Test fun theComposerTakesTheHelperOnlyOnce() {
        val calls = MediaCaptionCalls(TEXT_SEND, TYPED_TEXT, EMPTY_MAP)
        val host = fixtureClass(COMPOSER, listOf(send()))
        host.addMediaCaptionHelper(mediaCaptionHelper(COMPOSER, calls))
        assertTrue(host.methods.any { it.name == MEDIA_CAPTION_HELPER })
        assertFailsWith<PatchException> { host.addMediaCaptionHelper(mediaCaptionHelper(COMPOSER, calls)) }
    }

    @Test fun anUnusableSendRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            "a method that sends nothing" to fixtureMethod("$COMPOSER->A00()V", "return-void", 1),
            "a text send handed the typed text" to changed(SEND_TEXT, "invoke-static {v8, v0, v1, v2, v2}, $TEXT_SEND"),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(MEDIA_CAPTION, mapOf(MEDIA_CAPTION to listOf(bad))) }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildSendsTheWordsBeforeItsPlainMediaSend() {
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
            val before = method.code()
            val site = method.validateMediaCaption()
            assertTrue(site.calls.typedText.endsWith("()Ljava/lang/String;"), code)
            assertTrue(site.calls.emptyMap.endsWith(":$MAP"), code)
            method.injectMediaCaption()
            val after = method.code()
            val at = method.helperCalls().single()
            assertEquals(site.at, at, code)
            assertEquals(Opcode.IF_NEZ, after[at - 1].opcode, code)
            assertEquals(listOf(site.fragment, site.sent), (after[at] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) }, code)
            assertEquals(Opcode.MOVE_RESULT, after[at + 1].opcode, code)
            assertEquals(site.sent, (after[at + 1] as OneRegisterInstruction).registerA, code)
            assertEquals(before[site.at].opcode, after[at + 2].opcode, code)
            // The words-with-the-media branch, the one that builds the media parameters, comes before the hook.
            val host = hooks.single().definingClass
            val parameters = (0 until at).filter { i ->
                after[i].opcode == Opcode.NEW_INSTANCE &&
                    after.getOrNull(i + 1)?.called()?.endsWith("-><init>($host$IMMUTABLE_LIST${MAP}Ljava/lang/String;)V") == true
            }
            assertEquals(1, parameters.size, code)
        }
    }
}
