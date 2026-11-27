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
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.test.assertTrue

/** The chat fragment, the editor's own send and the compose fragment mediaCaptionFixture builds (#236). */
private const val DIRECT_CHAT = "LX/7dm;"
private const val DIRECT_COMPOSER = "LX/9CF;"
private const val DIRECT_EDITOR = "LX/PaT;"
private const val DIRECT_QUEUE = "LX/9QC;"
private const val DIRECT_MESSAGE = "Lcom/facebook/messaging/model/messages/Message;"
internal const val SYNTHETIC_MEDIA_CAPTION_CHAT = "$DIRECT_CHAT->A1p(${THREAD_KEY_TYPE}LX/53l;$EDITOR_BUILDER$NAVIGATION_TRIGGER)V"
internal const val SYNTHETIC_MEDIA_CAPTION_DIRECT = "$DIRECT_EDITOR->EqH(Landroid/os/Bundle;$DIRECT_MESSAGE$NAVIGATION_TRIGGER)V"
private const val DIRECT_SEND = "$DIRECT_QUEUE->A0L(LX/5GM;$DIRECT_MESSAGE${NAVIGATION_TRIGGER}Ljava/lang/String;)Lcom/google/common/util/concurrent/ListenableFuture;"
private const val OWN_TASK_BUILDER = "$MONTAGE_ACTIVITY->A1H(Landroid/content/Context;$MONTAGE_PARAMS$NAVIGATION_TRIGGER)Landroid/content/Intent;"
private const val DIRECT_MEDIA = "$DIRECT_MESSAGE->A1L:$IMMUTABLE_LIST"
private const val DIRECT_FLAG = "$MONTAGE_PARAMS->A0V:Z"
private const val BUBBLE_FLAG = "iput-boolean v0, v11, $EDITOR_BUILDER->A0V:Z"
private const val GUARD_READ = "iget-boolean v0, v1, $DIRECT_FLAG"
private const val PLACE = "const-string v0, \"thread_view\""
private const val SEND_TO_CHAT = "invoke-virtual {v5, v1, v12, v3, v0}, $DIRECT_SEND"
private const val SEND_KIND = "sget-object v1, LX/5GM;->A0J:LX/5GM;"
private const val RESULT = "invoke-static {v11}, LX/bKj;"
private const val OWN_TASK = "const/high16 v0, 0x14000000"

/** The chat fragment's opening of the editor as 588 writes it (13 registers, p0 is v8), cut down. */
private val CHAT_OPENER_BODY = """
    move-object v4, v10
    sget-object v1, LX/1yv;->A02:LX/1yv;
    iget-object v0, v8, $DIRECT_CHAT->A1O:LX/1yv;
    invoke-static {v1, v0}, LX/001;->A1W(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v0
    move-object v5, v11
    $BUBBLE_FLAG
    invoke-virtual {v8}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;
    move-result-object v0
    if-eqz v0, :done
    move-object v3, v9
    move-object v6, v12
    invoke-static {v0, v3, v4, v5, v6}, LX/6gv;->A00(Landroid/content/Context;${THREAD_KEY_TYPE}LX/53l;$EDITOR_BUILDER$NAVIGATION_TRIGGER)V
    :done
    return-void
""".trimIndent()

/** MontageComposerActivity's intent builder: a task of its own when the parameters say the chat is a bubble. */
private val OWN_TASK_BODY = """
    const-class v0, $MONTAGE_ACTIVITY
    new-instance v2, Landroid/content/Intent;
    invoke-direct {v2, v3, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    iget-object v1, v4, $MONTAGE_PARAMS->A05:$THREAD_KEY_TYPE
    const-string v0, "fragment_thread_key_param"
    invoke-virtual {v2, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;
    iget-boolean v1, v4, $DIRECT_FLAG
    const/high16 v0, 0x4000000
    if-eqz v1, :flags
    $OWN_TASK
    :flags
    invoke-virtual {v2, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;
    return-object v2
""".trimIndent()

/**
 * The editor's send as 588 writes it (14 registers, p0 is v10, the message p2 is v12), cut down: for a chat in a bubble,
 * a message with media goes straight to the chat's send queue; otherwise the editor hands it back as a result.
 */
private val DIRECT_BODY = """
    iget-object v1, v10, $DIRECT_EDITOR->A00:$MONTAGE_PARAMS
    iget-object v3, v10, $DIRECT_EDITOR->A01:LX/b22;
    iget-object v7, v10, $DIRECT_EDITOR->A02:LX/NSb;
    if-eqz v1, :result
    $GUARD_READ
    if-eqz v0, :result
    if-eqz v3, :result
    if-eqz v7, :result
    iget-object v0, v12, $DIRECT_MEDIA
    if-eqz v0, :done
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z
    move-result v0
    if-nez v0, :done
    invoke-static {v7}, LX/Nc2;->A0d(LX/NSb;)$DIRECT_QUEUE
    move-result-object v5
    iget-object v3, v3, LX/b22;->A01:$NAVIGATION_TRIGGER
    $SEND_KIND
    $PLACE
    $SEND_TO_CHAT
    goto :done
    :result
    $RESULT->A03(Landroid/os/Bundle;)Ljava/util/HashMap;
    :done
    return-void
""".trimIndent()

/**
 * The same send as a range call over v[base] to v[base + 4], the message copied into v[base + 2] and the place string in
 * v[base + 4] (22 registers, p0 is v18, the message p2 is v20).
 */
private fun rangeBody(base: Int) = """
    move-object/from16 v6, v18
    move-object/from16 v${base + 2}, v20
    iget-object v1, v6, $DIRECT_EDITOR->A00:$MONTAGE_PARAMS
    iget-object v3, v6, $DIRECT_EDITOR->A01:LX/b22;
    iget-object v7, v6, $DIRECT_EDITOR->A02:LX/NSb;
    if-eqz v1, :result
    $GUARD_READ
    if-eqz v0, :result
    if-eqz v3, :result
    if-eqz v7, :result
    iget-object v0, v${base + 2}, $DIRECT_MEDIA
    if-eqz v0, :done
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z
    move-result v0
    if-nez v0, :done
    invoke-static {v7}, LX/Nc2;->A0d(LX/NSb;)$DIRECT_QUEUE
    move-result-object v$base
    sget-object v${base + 1}, LX/5GM;->A0J:LX/5GM;
    iget-object v3, v3, LX/b22;->A01:$NAVIGATION_TRIGGER
    move-object/from16 v${base + 3}, v3
    const-string v${base + 4}, "thread_view"
    invoke-virtual/range {v$base .. v${base + 4}}, $DIRECT_SEND
    goto :done
    :result
    return-void
    :done
    return-void
""".trimIndent()

private fun chatOpener(body: String = CHAT_OPENER_BODY, flags: Int = AccessFlags.PUBLIC.value) =
    fixtureMethod(SYNTHETIC_MEDIA_CAPTION_CHAT, body, 13, flags)

private fun ownTaskBuilder(body: String = OWN_TASK_BODY) =
    fixtureMethod(OWN_TASK_BUILDER, body, 6, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)

private fun directSend(body: String = DIRECT_BODY, registers: Int = 14) = fixtureMethod(SYNTHETIC_MEDIA_CAPTION_DIRECT, body, registers)

/** [base] with each first `from` swapped for the `to` after it, every swap checked to change something. */
private fun swapped(base: String, vararg swaps: String) = swaps.toList().chunked(2).fold(base) { body, (from, to) ->
    body.replaceFirst(from, to).also { check(it != body) { "no $from" } }
}

private fun bubbleChatClass(opener: MutableMethod = chatOpener(), field: String? = DIRECT_COMPOSER) =
    fixtureClass(DIRECT_CHAT, listOf(opener), superclass = "Landroidx/fragment/app/Fragment;",
        extraFields = listOfNotNull(field?.let { ImmutableField(DIRECT_CHAT, "A0J", it, AccessFlags.PRIVATE.value, null, null, null) }))

/** The chat, the editor's send and the editor's intent builder. Goes with [mediaCaptionFixture], which has the composer. */
internal fun mediaCaptionDirectFixture(
    chat: MutableClass = bubbleChatClass(),
    send: MutableMethod = directSend(),
    builder: MutableMethod? = ownTaskBuilder(),
): List<MutableClass> =
    listOf(chat, fixtureClass(DIRECT_EDITOR, listOf(send))) + listOfNotNull(builder?.let { fixtureClass(MONTAGE_ACTIVITY, listOf(it)) })

private fun Method.code() = implementation!!.instructions.toList()

/** The code without the nop that pads a payload, which an insert ahead of it can add or drop. */
private fun List<Instruction>.withoutPadding() = filter { it.opcode != Opcode.NOP }

private fun Instruction.called() = ((this as? ReferenceInstruction)?.reference as? MethodReference)
    ?.let { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }

private fun Instruction.loaded() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

/** A call's [n]th argument register, from either form of the call. */
private fun Instruction.argument(n: Int) = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG)[n]
    is RegisterRangeInstruction -> startRegister + n
    else -> error("not a call: $opcode")
}

private val TABLES = setOf(Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH, Opcode.FILL_ARRAY_DATA)

/** Each branch's landing, as the instruction it lands on, so a check survives the hook moving indexes. */
private fun Method.landings(): List<Instruction> = code().let { code ->
    code.filterIsInstance<BuilderOffsetInstruction>().filter { it.opcode !in TABLES }.map { code[it.target.location.index] }
}

class MediaCaptionDirectTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun all(direct: List<MutableClass> = mediaCaptionDirectFixture()) = mediaCaptionFixture() + direct

    private fun found(key: String, classes: List<MutableClass>) = mirroredControls(classes).getValue(key).map { it.hookId() }.toSet()

    @Test fun theChatsOpeningAndTheEditorsOwnSendAreFound() {
        val classes = all()
        assertEquals(setOf(SYNTHETIC_MEDIA_CAPTION_CHAT), found(MEDIA_CAPTION_CHAT, classes))
        assertEquals(setOf(SYNTHETIC_MEDIA_CAPTION_DIRECT), found(MEDIA_CAPTION_DIRECT, classes))
        validateControls(mirroredControls(classes), setOf(MEDIA_CAPTION, MEDIA_CAPTION_EDITOR, MEDIA_CAPTION_CHAT, MEDIA_CAPTION_DIRECT))
        assertEquals(DIRECT_FLAG, editorOwnTaskFlag(classes))
        // The site's registers are the ones the stock place string and send use.
        val method = directSend()
        val code = method.code()
        val site = assertNotNull(method.mediaCaptionDirectSite())
        assertEquals(code.indexOfFirst { it.loaded() == "thread_view" }, site.at)
        assertEquals((code[site.at] as OneRegisterInstruction).registerA, site.media)
        assertEquals(code[site.at + 1].argument(2), site.message)
        assertEquals(listOf(0, 12), listOf(site.media, site.message))
        assertEquals(DIRECT_MEDIA, site.mediaList)
        assertEquals(DIRECT_FLAG, site.flag)
        // Other registers, read from the same instructions, the range form of the send included.
        val moved = directSend("move-object v9, v12\n" + DIRECT_BODY.replace("v12", "v9")
            .replace(PLACE, "const-string v4, \"thread_view\"").replace("v3, v0}, $DIRECT_SEND", "v3, v4}, $DIRECT_SEND"))
        assertEquals(listOf(4, 9), assertNotNull(moved.mediaCaptionDirectSite()).let { listOf(it.media, it.message) })
        val ranged = directSend(rangeBody(9), 22)
        assertEquals(listOf(13, 11), assertNotNull(ranged.mediaCaptionDirectSite()).let { listOf(it.media, it.message) })
        assertEquals(setOf(SYNTHETIC_MEDIA_CAPTION_DIRECT), found(MEDIA_CAPTION_DIRECT, all(mediaCaptionDirectFixture(send = directSend(rangeBody(9), 22)))))
    }

    // #236: a chat in a bubble opens the editor in a task of its own, so the editor sends the photo to the chat by itself
    // and the composer's editor send never runs. The words stayed in the box.
    @Test fun theChatHandsItselfOverAndTheMediaGoesToTheExtensionRightBeforeTheEditorsSend() {
        val composer = mediaCaptionFixture().single()
        val send = composer.methods.single { it.hookId() == SYNTHETIC_MEDIA_CAPTION }
        val editor = composer.methods.single { it.hookId() == SYNTHETIC_MEDIA_CAPTION_EDITOR }
        val chat = chatOpener()
        val direct = directSend()
        val chatBefore = chat.code()
        val directBefore = direct.code()
        val landings = direct.landings()
        injectControl(MEDIA_CAPTION, mapOf(MEDIA_CAPTION to listOf(send), MEDIA_CAPTION_EDITOR to listOf(editor),
            MEDIA_CAPTION_CHAT to listOf(chat), MEDIA_CAPTION_DIRECT to listOf(direct)))
        // The chat fragment, p0, at the entry.
        val opened = chat.code()
        assertEquals(EDITOR_OPENING_CALL, opened[0].called())
        assertEquals(Opcode.INVOKE_STATIC_RANGE, opened[0].opcode)
        assertEquals(listOf(8, 1), (opened[0] as RegisterRangeInstruction).let { listOf(it.startRegister, it.registerCount) })
        assertStockKept(chatBefore, opened.drop(1), "chat")
        // The message's media, read from the register the send takes into the place string's register, right before
        // the place string.
        val code = direct.code()
        val at = code.indices.single { code[it].called() == EDITOR_SENDING_CALL }
        assertEquals(Opcode.IGET_OBJECT, code[at - 1].opcode)
        assertEquals(DIRECT_MEDIA, (code[at - 1] as ReferenceInstruction).reference.toString())
        assertEquals(listOf(0, 12), (code[at - 1] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
        assertEquals(listOf(1, 0), (code[at] as FiveRegisterInstruction).let { listOf(it.registerCount, it.registerC) })
        assertEquals("thread_view", code[at + 1].loaded())
        assertEquals(DIRECT_SEND, code[at + 2].called())
        assertStockKept(directBefore, code.filterIndexed { i, _ -> i != at - 1 && i != at }, "editor's send")
        // Every branch lands where it did, nothing lands on the hook, and the flag's branch skips it with the send.
        val after = direct.landings()
        assertEquals(landings.size, after.size)
        landings.zip(after).forEach { (old, new) -> assertTrue(old === new, "a branch moved to ${new.opcode}") }
        assertTrue(at - 1 !in direct.jumpTargets() && at !in direct.jumpTargets())
        val guard = code.indices.single { code[it].opcode == Opcode.IGET_BOOLEAN } + 1
        val skip = (code[guard] as BuilderOffsetInstruction).target.location.index
        assertEquals("LX/bKj;->A03(Landroid/os/Bundle;)Ljava/util/HashMap;", code[skip].called())
        assertTrue(skip > at + 2)
    }

    @Test fun aSecondPassLeavesBothHooksAlone() {
        val chat = chatOpener()
        val direct = directSend()
        chat.injectMediaCaptionChat()
        direct.injectMediaCaptionDirect()
        val opened = chat.code()
        val sending = direct.code()
        // Hooked, the methods still pass, and nothing is added twice.
        chat.validateMediaCaptionChat()
        direct.validateMediaCaptionDirect()
        chat.injectMediaCaptionChat()
        direct.injectMediaCaptionDirect()
        assertEquals(opened, chat.code())
        assertEquals(sending, direct.code())
        assertEquals(1, chat.code().count { it.called() == EDITOR_OPENING_CALL })
        assertEquals(1, direct.code().count { it.called() == EDITOR_SENDING_CALL })
    }

    @Test fun aChatThatCantHandItselfOverGetsNoHook() {
        val cases = mapOf(
            "no compose fragment in the chat" to all(mediaCaptionDirectFixture(chat = bubbleChatClass(field = null))),
            "a compose fragment of another type" to all(mediaCaptionDirectFixture(chat = bubbleChatClass(field = "LX/9CG;"))),
            "a static opening" to all(mediaCaptionDirectFixture(chat = bubbleChatClass(chatOpener(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)))),
            "an opening that sets no flag on the builder" to all(mediaCaptionDirectFixture(chat = bubbleChatClass(chatOpener(swapped(CHAT_OPENER_BODY,
                BUBBLE_FLAG, "iput-object v4, v11, $EDITOR_BUILDER->A0B:LX/53l;"))))),
            "a compose fragment whose editor send wasn't found" to
                mediaCaptionFixture().map { cls -> fixtureClass(cls.type, cls.methods.filter { it.hookId() != SYNTHETIC_MEDIA_CAPTION_EDITOR }) } +
                    mediaCaptionDirectFixture(),
        )
        for ((case, classes) in cases) {
            assertTrue(found(MEDIA_CAPTION_CHAT, classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(MEDIA_CAPTION_CHAT)) }
        }
    }

    @Test fun anyOtherSendShapeGetsNoHook() {
        fun send(vararg swaps: String) = all(mediaCaptionDirectFixture(send = directSend(swapped(DIRECT_BODY, *swaps))))
        val cases = mapOf(
            "a jump into the block" to send(SEND_KIND, ":into\n$SEND_KIND", RESULT, "if-nez v11, :into\n$RESULT"),
            "a jump onto the send" to send(SEND_TO_CHAT, ":again\n$SEND_TO_CHAT", RESULT, "if-nez v11, :again\n$RESULT"),
            "another flag" to send(GUARD_READ, "iget-boolean v0, v1, $MONTAGE_PARAMS->A0W:Z"),
            "a block that leaves by a goto" to send("move-result-object v5", "move-result-object v5\ngoto :done"),
            "another place" to send(PLACE, "const-string v0, \"montage\""),
            "a send that doesn't take the place string" to send(SEND_TO_CHAT, "invoke-virtual {v5, v1, v12, v3, v4}, $DIRECT_SEND"),
            "a send that takes no message" to send(SEND_TO_CHAT,
                "invoke-virtual {v5, v1, v12, v3, v0}, ${DIRECT_SEND.replace("LX/5GM;$DIRECT_MESSAGE", "LX/5GM;Ljava/lang/Object;")}"),
            "a second read of the media" to send(SEND_KIND, "iget-object v4, v12, $DIRECT_MEDIA\n$SEND_KIND"),
            "an unchecked read of the media" to send("if-eqz v0, :done\ninvoke-virtual {v0}, Ljava/util/AbstractCollection;",
                "invoke-virtual {v0}, Ljava/util/AbstractCollection;"),
            "the message written over" to send(SEND_KIND, "move-object v12, v4\n$SEND_KIND"),
            "the place string in a register above v15" to all(mediaCaptionDirectFixture(send = directSend(rangeBody(13), 22))),
            "an editor without a task of its own" to all(mediaCaptionDirectFixture(builder = ownTaskBuilder(swapped(OWN_TASK_BODY,
                OWN_TASK, "const/high16 v0, 0x10000000")))),
            "an intent builder reading two flags" to all(mediaCaptionDirectFixture(builder = ownTaskBuilder(swapped(OWN_TASK_BODY,
                "iget-boolean v1, v4, $DIRECT_FLAG", "iget-boolean v1, v4, $MONTAGE_PARAMS->A0W:Z\niget-boolean v1, v4, $DIRECT_FLAG")))),
            "no intent builder" to all(mediaCaptionDirectFixture(builder = null)),
        )
        for ((case, classes) in cases) {
            assertTrue(found(MEDIA_CAPTION_DIRECT, classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(MEDIA_CAPTION_DIRECT)) }
        }
        // With the place string in v17 the hook couldn't read the media into it; in v13 the same send is fine.
        assertNull(directSend(rangeBody(13), 22).mediaCaptionDirectSite())
        assertNotNull(directSend(rangeBody(9), 22).mediaCaptionDirectSite())
    }

    @Test fun anUnusableMethodRefusesTheSwitchBeforeAnyEdit() {
        val chat = chatOpener(swapped(CHAT_OPENER_BODY, BUBBLE_FLAG, "nop"))
        val direct = directSend(swapped(DIRECT_BODY, PLACE, "const-string v0, \"montage\""))
        val good = chatOpener()
        val chatBefore = chat.code()
        val goodBefore = good.code()
        val directBefore = direct.code()
        assertFailsWith<PatchException> { injectControl(MEDIA_CAPTION, mapOf(MEDIA_CAPTION_CHAT to listOf(good), MEDIA_CAPTION_DIRECT to listOf(direct))) }
        assertFailsWith<PatchException> { injectControl(MEDIA_CAPTION, mapOf(MEDIA_CAPTION_CHAT to listOf(chat))) }
        assertEquals(chatBefore, chat.code())
        assertEquals(goodBefore, good.code())
        assertEquals(directBefore, direct.code())
    }

    @Test fun everySupportedBuildHooksTheChatAndTheEditorsOwnSend() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val editors = findMediaCaptionEditor(classes, findMediaCaption(classes))
            val chats = findMediaCaptionChat(classes, editors)
            val directs = findMediaCaptionDirect(classes)
            assertEquals(activeProfile.hooks.getValue(MEDIA_CAPTION_CHAT), chats.map { it.hookId() }.toSet(), code)
            assertEquals(activeProfile.hooks.getValue(MEDIA_CAPTION_DIRECT), directs.map { it.hookId() }.toSet(), code)
            assertEquals(1, chats.size, code)
            assertEquals(1, directs.size, code)
            validateControls(mapOf(MEDIA_CAPTION_CHAT to chats, MEDIA_CAPTION_DIRECT to directs), setOf(MEDIA_CAPTION_CHAT, MEDIA_CAPTION_DIRECT))
            // The chat holds exactly one of the compose fragment the extension sends the words through.
            val composer = editors.single().definingClass
            assertEquals(1, classes.single { it.type == chats.single().definingClass }.instanceFields.count { it.type == composer }, code)
            // At the chat's entry, which nothing branches back onto, p0 goes to the extension.
            val chat = MutableMethod(chats.single())
            assertTrue(0 !in chat.jumpTargets(), code)
            val chatBefore = chat.code()
            chat.injectMediaCaptionChat()
            val opened = chat.code()
            assertEquals(EDITOR_OPENING_CALL, opened[0].called(), code)
            val p0 = chat.implementation!!.registerCount - chat.parameterTypes.size - 1
            assertEquals(listOf(p0, 1), (opened[0] as RegisterRangeInstruction).let { listOf(it.startRegister, it.registerCount) }, code)
            assertStockKept(chatBefore.withoutPadding(), opened.drop(1).withoutPadding(), "$code chat")
            // Right before the place string, the media of the message the send takes, in the place string's register.
            val direct = MutableMethod(directs.single())
            val before = direct.code()
            val site = assertNotNull(direct.mediaCaptionDirectSite(), code)
            assertEquals("thread_view", before[site.at].loaded(), code)
            assertEquals((before[site.at] as OneRegisterInstruction).registerA, site.media, code)
            assertEquals(before[site.at + 1].argument(2), site.message, code)
            assertEquals(editorOwnTaskFlag(classes), site.flag, code)
            val landings = direct.landings()
            direct.injectMediaCaptionDirect()
            val after = direct.code()
            assertEquals(Opcode.IGET_OBJECT, after[site.at].opcode, code)
            assertEquals(site.mediaList, (after[site.at] as ReferenceInstruction).reference.toString(), code)
            assertEquals(listOf(site.media, site.message), (after[site.at] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) }, code)
            assertEquals(EDITOR_SENDING_CALL, after[site.at + 1].called(), code)
            assertEquals(site.media, after[site.at + 1].argument(0), code)
            assertEquals("thread_view", after[site.at + 2].loaded(), code)
            assertStockKept(before.withoutPadding(), after.filterIndexed { i, _ -> i != site.at && i != site.at + 1 }.withoutPadding(), "$code editor's send")
            val moved = direct.landings()
            assertEquals(landings.size, moved.size, code)
            landings.zip(moved).forEach { (old, new) -> assertTrue(old === new, "$code: a branch moved to ${new.opcode}") }
        }
    }
}
