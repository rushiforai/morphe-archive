package app.hushmessenger.patches.controls

import app.hushmessenger.patches.CompatMirror
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
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

/** The compose fragment mediaCaptionFixture builds, and the send of the editor's result in it (#236). */
private const val RESULT_COMPOSER = "LX/9CF;"
private const val RESULT_MESSAGE = "Lcom/facebook/messaging/model/messages/Message;"
internal const val SYNTHETIC_MEDIA_CAPTION_RESULT = "$RESULT_COMPOSER->onActivityResult(IILandroid/content/Intent;)V"
private const val RESULT_SEND = "$RESULT_COMPOSER->A22(LX/5GM;$RESULT_MESSAGE)V"
private const val RESULT_HELPER_CALL = "$RESULT_COMPOSER->$MEDIA_CAPTION_EDITOR_HELPER(${RESULT_COMPOSER}Ljava/lang/String;)V"
private const val MESSAGE_KEY = "const-string v0, \"extra_message\""
private const val MESSAGE_READ = "invoke-virtual {v3, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;"
private const val MESSAGE_CHECK = "if-eqz v1, :missing"
private const val MESSAGE_CAST = "check-cast v1, $RESULT_MESSAGE"
private const val SEND_KIND_READ = "sget-object v0, LX/5GM;->A0x:LX/5GM;"
private const val RESULT_SEND_CALL = "invoke-virtual {v4, v0, v1}, $RESULT_SEND"
private const val DATA_CHECK = "if-nez v11, :message"

/**
 * The compose fragment's activity result as 588 writes it (12 registers here, p0 is v8 and the intent p3 is v11), cut
 * down to the editor's request: a result with data reads the message out of it and sends it through the fragment's
 * general message send, and a result without the message throws.
 */
private val RESULT_BODY = """
    move-object v4, v8
    move-object v3, v11
    const/16 v0, 0x1cd0
    if-ne v9, v0, :done
    const/4 v0, -0x1
    if-ne v10, v0, :done
    $DATA_CHECK
    return-void
    :message
    $MESSAGE_KEY
    $MESSAGE_READ
    move-result-object v1
    $MESSAGE_CHECK
    $MESSAGE_CAST
    $SEND_KIND_READ
    $RESULT_SEND_CALL
    return-void
    :missing
    const-string v0, "Required value was null."
    invoke-static {v0}, LX/001;->A0Q(Ljava/lang/String;)Ljava/lang/IllegalStateException;
    move-result-object v0
    throw v0
    :done
    return-void
""".trimIndent()

/**
 * The same result with the send as a range call: the fragment in v[base], the enum read in v[base + 1] and the message
 * in v[base + 2] (24 registers, p0 is v20 and the intent p3 is v23).
 */
private fun rangeResultBody(base: Int) = """
    move-object/from16 v$base, v20
    move-object/from16 v3, v23
    if-nez v3, :message
    return-void
    :message
    $MESSAGE_KEY
    $MESSAGE_READ
    move-result-object v${base + 2}
    if-eqz v${base + 2}, :missing
    check-cast v${base + 2}, $RESULT_MESSAGE
    sget-object v${base + 1}, LX/5GM;->A0x:LX/5GM;
    invoke-virtual/range {v$base .. v${base + 2}}, $RESULT_SEND
    return-void
    :missing
    const-string v0, "Required value was null."
    invoke-static {v0}, LX/001;->A0Q(Ljava/lang/String;)Ljava/lang/IllegalStateException;
    move-result-object v0
    throw v0
""".trimIndent()

/** The send of the editor's result, which mediaCaptionFixture puts in the compose fragment. */
internal fun mediaCaptionResultMethod(body: String = RESULT_BODY, registers: Int = 12, id: String = SYNTHETIC_MEDIA_CAPTION_RESULT,
    flags: Int = AccessFlags.PUBLIC.value): MutableMethod = fixtureMethod(id, body, registers, flags)

/** [RESULT_BODY] with each first `from` swapped for the `to` after it, every swap checked to change something. */
private fun resultChanged(vararg swaps: String) = mediaCaptionResultMethod(swaps.toList().chunked(2).fold(RESULT_BODY) { body, (from, to) ->
    body.replaceFirst(from, to).also { check(it != body) { "no $from" } }
})

/** The result with a catch-all try over its send. */
private fun triedResult(): MutableMethod {
    val plain = mediaCaptionResultMethod()
    val code = plain.implementation!!.instructions.toList()
    val address = IntArray(code.size + 1).also { for (i in code.indices) it[i + 1] = it[i] + code[i].codeUnits }
    val at = code.indexOfFirst { it.opcode == Opcode.SGET_OBJECT }
    val tried = ImmutableMethodImplementation(12, code, listOf(ImmutableTryBlock(address[at], address[at + 2] - address[at],
        listOf(ImmutableExceptionHandler(null, address[code.size - 1])))), null)
    return MutableMethod(ImmutableMethod(plain.definingClass, plain.name, plain.parameters, plain.returnType, plain.accessFlags, null, null, tried))
}

/** The compose fragment with [result] in place of its own, and without its editor send unless [editor]. */
private fun composer(result: Method? = mediaCaptionResultMethod(), editor: Boolean = true): List<MutableClass> =
    mediaCaptionFixture().map { cls ->
        fixtureClass(cls.type, cls.methods.filter { it.hookId() != SYNTHETIC_MEDIA_CAPTION_RESULT && (editor || it.hookId() != SYNTHETIC_MEDIA_CAPTION_EDITOR) } +
            listOfNotNull(result))
    }

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

/** The instruction the branch at [at] lands on. */
private fun List<Instruction>.landing(at: Int) = this[(this[at] as BuilderOffsetInstruction).target.location.index]

class MediaCaptionResultTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(MEDIA_CAPTION_RESULT).map { it.hookId() }.toSet()

    @Test fun theEditorsResultSendIsFoundBesideTheEditorsSend() {
        val classes = mediaCaptionFixture()
        assertEquals(setOf(SYNTHETIC_MEDIA_CAPTION_RESULT), found(classes))
        validateControls(mirroredControls(classes), setOf(MEDIA_CAPTION, MEDIA_CAPTION_EDITOR, MEDIA_CAPTION_RESULT))
        assertEquals(listOf(SYNTHETIC_MEDIA_CAPTION_RESULT), CompatMirror.controls(classes).getValue(MEDIA_CAPTION_RESULT))
        // The site is the enum read in front of the send, with the registers the stock send takes.
        val method = mediaCaptionResultMethod()
        val code = method.code()
        val site = assertNotNull(method.validateMediaCaptionResult())
        assertEquals(code.indexOfFirst { it.opcode == Opcode.SGET_OBJECT }, site.at)
        assertEquals(RESULT_SEND, code[site.at + 1].called())
        assertEquals(listOf(code[site.at + 1].argument(0), code[site.at + 1].argument(2), (code[site.at] as OneRegisterInstruction).registerA),
            listOf(site.fragment, site.message, site.scratch))
        assertEquals(listOf(4, 1, 0), listOf(site.fragment, site.message, site.scratch))
        // Other registers, read from the same instructions.
        val moved = resultChanged("move-object v4, v8", "move-object v6, v8", "move-result-object v1", "move-result-object v2",
            MESSAGE_CHECK, "if-eqz v2, :missing", MESSAGE_CAST, "check-cast v2, $RESULT_MESSAGE",
            SEND_KIND_READ, "sget-object v5, LX/5GM;->A0x:LX/5GM;", RESULT_SEND_CALL, "invoke-virtual {v6, v5, v2}, $RESULT_SEND")
        assertEquals(listOf(6, 2, 5), assertNotNull(moved.mediaCaptionResultSite()).let { listOf(it.fragment, it.message, it.scratch) })
        // 588 loads the extra's name with const-string/jumbo, and a range send with the message in v16 is fine too.
        assertEquals(setOf(SYNTHETIC_MEDIA_CAPTION_RESULT), found(composer(resultChanged(MESSAGE_KEY, "const-string/jumbo v0, \"extra_message\""))))
        val ranged = mediaCaptionResultMethod(rangeResultBody(14), 24)
        assertEquals(listOf(14, 16, 15), assertNotNull(ranged.validateMediaCaptionResult()).let { listOf(it.fragment, it.message, it.scratch) })
        assertEquals(setOf(SYNTHETIC_MEDIA_CAPTION_RESULT), found(composer(mediaCaptionResultMethod(rangeResultBody(14), 24))))
    }

    // #236: the editor a chat opens from the "Attachment 1 of 1 selected" chip hands the photo back as a result, and the
    // fragment sent it without reading the box, so the words stayed behind.
    @Test fun theWordsGoOutRightBeforeTheResultsSend() {
        val host = mediaCaptionFixture().single()
        val send = host.methods.single { it.hookId() == SYNTHETIC_MEDIA_CAPTION }
        val editor = host.methods.single { it.hookId() == SYNTHETIC_MEDIA_CAPTION_EDITOR }
        val result = mediaCaptionResultMethod()
        val before = result.code()
        val landings = result.landings()
        val key = before.indexOfFirst { it.loaded() == "extra_message" }
        val sget = before.indexOfFirst { it.opcode == Opcode.SGET_OBJECT }
        injectControl(MEDIA_CAPTION, mapOf(MEDIA_CAPTION to listOf(send), MEDIA_CAPTION_EDITOR to listOf(editor), MEDIA_CAPTION_RESULT to listOf(result)))
        val code = result.code()
        val at = code.indices.single { code[it].called() == RESULT_KIND_CALL }
        // Right where the enum read was: the message's kind into the read's register, then the helper with the fragment.
        assertEquals(sget, at)
        assertEquals(Opcode.INVOKE_STATIC, code[at].opcode)
        assertEquals(listOf(1, 1), (code[at] as FiveRegisterInstruction).let { listOf(it.registerCount, it.registerC) })
        assertEquals(Opcode.MOVE_RESULT_OBJECT, code[at + 1].opcode)
        assertEquals(0, (code[at + 1] as OneRegisterInstruction).registerA)
        assertEquals(RESULT_HELPER_CALL, code[at + 2].called())
        assertEquals(Opcode.INVOKE_STATIC, code[at + 2].opcode)
        assertEquals(listOf(2, 4, 0), (code[at + 2] as FiveRegisterInstruction).let { listOf(it.registerCount, it.registerC, it.registerD) })
        assertTrue(code[at + 3] === before[sget])
        assertEquals(RESULT_SEND, code[at + 4].called())
        assertStockKept(before, code.filterIndexed { i, _ -> i !in at..at + 2 }, "result")
        // Every branch lands where it did: the data check on the extra's name, the null check on the throw, and
        // nothing on the hook.
        val after = result.landings()
        assertEquals(landings.size, after.size)
        landings.zip(after).forEach { (old, new) -> assertTrue(old === new, "a branch moved to ${new.opcode}") }
        assertTrue(code.landing(code.indexOfFirst { it.opcode == Opcode.IF_NEZ }) === before[key])
        assertEquals("Required value was null.", code.landing(code.indices.single { it > key && code[it].opcode == Opcode.IF_EQZ }).loaded())
        assertTrue((at..at + 3).none { it in result.jumpTargets() })
        // The composer's send and the editor's send took their own hooks in the same pass.
        assertEquals(1, editor.code().count { it.called() == RESULT_HELPER_CALL })
        assertEquals(1, send.code().count { it.called() == "$RESULT_COMPOSER->$MEDIA_CAPTION_HELPER(${RESULT_COMPOSER}I)I" })
    }

    @Test fun aMessageAboveV15TakesTheRangeFormAndAFragmentOrFreeRegisterAboveV15IsRefused() {
        val ranged = mediaCaptionResultMethod(rangeResultBody(14), 24)
        ranged.injectMediaCaptionResult()
        val code = ranged.code()
        val at = code.indices.single { code[it].called() == RESULT_KIND_CALL }
        assertEquals(Opcode.INVOKE_STATIC_RANGE, code[at].opcode)
        assertEquals(listOf(16, 1), (code[at] as RegisterRangeInstruction).let { listOf(it.startRegister, it.registerCount) })
        assertEquals(15, (code[at + 1] as OneRegisterInstruction).registerA)
        assertEquals(listOf(14, 15), (code[at + 2] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) })
        for (base in listOf(15, 16)) {
            val method = mediaCaptionResultMethod(rangeResultBody(base), 24)
            val before = method.code()
            // Found by its shape, so the refusal says why instead of only that the hooks differ.
            assertEquals(setOf(SYNTHETIC_MEDIA_CAPTION_RESULT), found(composer(method)), "v$base")
            assertEquals(null, CompatMirror.controls(composer(method))[MEDIA_CAPTION_RESULT], "v$base")
            val refused = assertFailsWith<PatchException>("v$base") { injectControl(MEDIA_CAPTION, mapOf(MEDIA_CAPTION_RESULT to listOf(method))) }
            assertTrue(refused.message!!.contains("past the v15"), refused.message)
            assertEquals(before, method.code(), "v$base")
        }
    }

    @Test fun aSecondPassLeavesTheHookAlone() {
        val result = mediaCaptionResultMethod()
        result.injectMediaCaptionResult()
        val hooked = result.code()
        assertEquals(null, result.validateMediaCaptionResult())
        result.validateHook(MEDIA_CAPTION_RESULT)
        result.injectMediaCaptionResult()
        assertEquals(hooked, result.code())
        assertEquals(1, result.code().count { it.called() == RESULT_KIND_CALL })
        assertEquals(1, result.code().count { it.called() == RESULT_HELPER_CALL })
    }

    @Test fun anyOtherResultShapeGetsNoHook() {
        val cases = mapOf(
            "another extra" to composer(resultChanged(MESSAGE_KEY, "const-string v0, \"extra_media\"")),
            "two message extras" to composer(resultChanged("const/16 v0, 0x1cd0", "$MESSAGE_KEY\nconst/16 v0, 0x1cd0")),
            "another read" to composer(resultChanged(MESSAGE_READ,
                "invoke-virtual {v3, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;")),
            "a read of another name" to composer(resultChanged(MESSAGE_READ, MESSAGE_READ.replace("{v3, v0}", "{v3, v2}"))),
            "no null check" to composer(resultChanged(MESSAGE_CHECK, "nop")),
            "a null check of something else" to composer(resultChanged(MESSAGE_CHECK, "if-eqz v3, :missing")),
            "a cast to another type" to composer(resultChanged(MESSAGE_CAST, "check-cast v1, Landroid/os/Bundle;")),
            "something between the cast and the send" to composer(resultChanged(SEND_KIND_READ, "const/4 v2, 0x0\n$SEND_KIND_READ")),
            "a send of another class" to composer(resultChanged(RESULT_SEND_CALL, RESULT_SEND_CALL.replace("$RESULT_COMPOSER->A22", "LX/9CG;->A22"))),
            "a send of another kind" to composer(resultChanged(RESULT_SEND_CALL, RESULT_SEND_CALL.replace("A22(LX/5GM;", "A22(LX/5GN;"))),
            "a send of something else than the read" to composer(resultChanged(RESULT_SEND_CALL, "invoke-virtual {v4, v2, v1}, $RESULT_SEND")),
            "a send of another message" to composer(resultChanged(RESULT_SEND_CALL, "invoke-virtual {v4, v0, v3}, $RESULT_SEND")),
            "something after the send" to composer(resultChanged("$RESULT_SEND_CALL\nreturn-void", "$RESULT_SEND_CALL\nnop\nreturn-void")),
            "a jump onto the send" to composer(resultChanged(SEND_KIND_READ, ":again\n$SEND_KIND_READ", DATA_CHECK, "if-eqz v10, :again\n$DATA_CHECK")),
            "a try over the send" to composer(triedResult()),
            "a static result" to composer(mediaCaptionResultMethod(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)),
            "another method" to composer(mediaCaptionResultMethod(id = "$RESULT_COMPOSER->onActivityReenter(IILandroid/content/Intent;)V")),
            "a compose fragment whose editor send wasn't found" to composer(editor = false),
            "a result in another class" to composer(result = null) + fixtureClass("LX/9CG;", listOf(mediaCaptionResultMethod(
                RESULT_BODY.replace(RESULT_COMPOSER, "LX/9CG;"), id = "LX/9CG;->onActivityResult(IILandroid/content/Intent;)V"))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(MEDIA_CAPTION_RESULT)) }
        }
        // The editor's own hook stays when only the result changed.
        assertEquals(setOf(SYNTHETIC_MEDIA_CAPTION_EDITOR),
            mirroredControls(composer(resultChanged(MESSAGE_CHECK, "nop"))).getValue(MEDIA_CAPTION_EDITOR).map { it.hookId() }.toSet())
    }

    @Test fun anUnusableResultRefusesTheSwitchBeforeAnyEdit() {
        val host = mediaCaptionFixture().single()
        val send = host.methods.single { it.hookId() == SYNTHETIC_MEDIA_CAPTION }
        val editor = host.methods.single { it.hookId() == SYNTHETIC_MEDIA_CAPTION_EDITOR }
        val result = resultChanged(MESSAGE_CAST, "check-cast v1, Landroid/os/Bundle;")
        val sendBefore = send.code()
        val editorBefore = editor.code()
        val resultBefore = result.code()
        assertFailsWith<PatchException> {
            injectControl(MEDIA_CAPTION, mapOf(MEDIA_CAPTION to listOf(send), MEDIA_CAPTION_EDITOR to listOf(editor), MEDIA_CAPTION_RESULT to listOf(result)))
        }
        assertEquals(sendBefore, send.code())
        assertEquals(editorBefore, editor.code())
        assertEquals(resultBefore, result.code())
    }

    @Test fun everySupportedBuildSendsTheWordsBeforeTheEditorsResult() {
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
            val results = findMediaCaptionResult(classes, editors)
            assertEquals(activeProfile.hooks.getValue(MEDIA_CAPTION_RESULT), results.map { it.hookId() }.toSet(), code)
            assertEquals(1, results.size, code)
            validateControls(mapOf(MEDIA_CAPTION_RESULT to results), setOf(MEDIA_CAPTION_RESULT))
            // In the compose fragment the editor's send is in, which gets the editor helper.
            assertEquals(editors.single().definingClass, results.single().definingClass, code)
            val result = MutableMethod(results.single())
            val before = result.code()
            val site = assertNotNull(result.validateMediaCaptionResult(), code)
            val key = site.at - 5
            assertEquals("extra_message", before[key].loaded(), code)
            assertEquals(Opcode.CHECK_CAST, before[site.at - 1].opcode, code)
            assertEquals(Opcode.SGET_OBJECT, before[site.at].opcode, code)
            assertEquals((before[site.at] as OneRegisterInstruction).registerA, site.scratch, code)
            assertEquals(listOf(site.fragment, site.scratch, site.message), (0..2).map { before[site.at + 1].argument(it) }, code)
            assertEquals(Opcode.RETURN_VOID, before[site.at + 2].opcode, code)
            assertTrue(site.fragment <= 15 && site.scratch <= 15, code)
            val landings = result.landings()
            val data = before.indices.filter { i ->
                (before[i] as? BuilderOffsetInstruction)?.takeIf { it.opcode !in TABLES }?.target?.location?.index == key
            }
            assertTrue(data.isNotEmpty(), code)
            val missing = before.landing(site.at - 2)
            result.injectMediaCaptionResult()
            val after = result.code()
            assertEquals(RESULT_KIND_CALL, after[site.at].called(), code)
            assertEquals(site.message, after[site.at].argument(0), code)
            assertEquals(Opcode.MOVE_RESULT_OBJECT, after[site.at + 1].opcode, code)
            assertEquals(site.scratch, (after[site.at + 1] as OneRegisterInstruction).registerA, code)
            val helper = "${result.definingClass}->$MEDIA_CAPTION_EDITOR_HELPER(${result.definingClass}Ljava/lang/String;)V"
            assertEquals(helper, after[site.at + 2].called(), code)
            assertEquals(listOf(site.fragment, site.scratch), listOf(after[site.at + 2].argument(0), after[site.at + 2].argument(1)), code)
            assertTrue(after[site.at + 3] === before[site.at], code)
            assertStockKept(before.withoutPadding(), after.filterIndexed { i, _ -> i !in site.at..site.at + 2 }.withoutPadding(), "$code result")
            val moved = result.landings()
            assertEquals(landings.size, moved.size, code)
            landings.zip(moved).forEach { (old, new) -> assertTrue(old === new, "$code: a branch moved to ${new.opcode}") }
            // The data check still lands on the extra's name and the null check on the throw.
            data.forEach { assertTrue(after.landing(after.indexOf(before[it])) === before[key], code) }
            assertTrue(after.landing(after.indexOf(before[site.at - 2])) === missing, code)
            // A second pass leaves it alone.
            result.injectMediaCaptionResult()
            assertEquals(after, result.code(), code)
        }
    }
}
