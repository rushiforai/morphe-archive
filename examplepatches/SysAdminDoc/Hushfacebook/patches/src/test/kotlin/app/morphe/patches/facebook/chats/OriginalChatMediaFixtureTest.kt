/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.chats

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Send chat photos and videos at original quality on every declared build: the transcoder with one
 * transcodeImage, one transcodeImageAsync and one video skip check holding a single size check, then
 * the patch on that class. Photos: each method calls the extension first with its arguments as one
 * range of parameter registers (past v15 in transcodeImage on all three builds, so a plain invoke would be dropped),
 * and returns what the extension hands back. Videos: the size check's answer goes through a plain
 * invoke on the compare's register, the size pair and the video's address (the method's first
 * parameter, never written in it), with the branch still after it. Reads the fixture bundles from
 * HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 *
 * Read from 581 (2026-10-07): the transcoder is `Lcom/facebook/msys/mci/transcoder/DefaultMediaTranscoder;`
 * and its size check sits in `extractMimeTypeAndCheckCanSkipVideoTranscoding` at index 27, a compare
 * of `LX/MUh;->A09` (size) with the limit, 577 and 580 alike. The method has 20 registers and its
 * first parameter, the `file://` address the transcoder's worker checked, is v9 on all three.
 */
class OriginalChatMediaFixtureTest {
    private val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()

    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Instruction.target() = (this as? ReferenceInstruction)?.reference?.toString()

    private fun patched(context: BytecodePatchContext, method: Method): Method =
        context.mutableClassDefBy(method.definingClass).methods.single {
            it.name == method.name && it.returnType == method.returnType &&
                it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
        }

    /** The register holding the first parameter after `this`: registers minus the parameters' width, plus one. */
    private fun firstArgument(method: Method): Int {
        val width = 1 + method.parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
        return method.implementation!!.registerCount - width + 1
    }

    private fun checkPhoto(name: String, method: Method, context: BytecodePatchContext, hook: String, arguments: Int, isAsync: Boolean) {
        val before = method.body()
        val after = patched(context, method).body()
        val where = "$name ${method.name}"
        assertTrue("$where: a free local for the answer", firstArgument(method) - 1 >= 1)
        assertEquals("$where: four instructions in", before.size + 4, after.size)
        assertEquals("$where: the hook call", Opcode.INVOKE_STATIC_RANGE, after[0].opcode)
        assertEquals("$where: the hook", hook, after[0].target())
        val range = after[0] as RegisterRangeInstruction
        assertEquals("$where: registers handed over", arguments, range.registerCount)
        assertEquals("$where: from the first parameter after this", firstArgument(method), range.startRegister)
        assertEquals("$where: the answer", if (isAsync) Opcode.MOVE_RESULT else Opcode.MOVE_RESULT_OBJECT, after[1].opcode)
        assertEquals("$where: lands in v0", 0, (after[1] as OneRegisterInstruction).registerA)
        assertEquals("$where: tested", Opcode.IF_EQZ, after[2].opcode)
        assertEquals("$where: returns it", if (isAsync) Opcode.RETURN_VOID else Opcode.RETURN_OBJECT, after[3].opcode)
        assertEquals("$where: stock code follows", before[0].opcode, after[4].opcode)
    }

    @Test
    fun `the transcoder's photo methods and video size check are hooked, on each declared build`() {
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val transcoder = FixtureDex.classes(bundle, setOf(MEDIA_TRANSCODER))[MEDIA_TRANSCODER]
                    ?: error("$name: no $MEDIA_TRANSCODER")
                val anchors = transcoderAnchors(transcoder)
                val context = PatchContexts.of(listOf(transcoder, ExtensionDex.classDef(SETTINGS_STATUS)))
                val found = context.findOriginalMediaAnchors()
                assertEquals("$name: the same size check from the context", anchors.sizeCheck, found.sizeCheck)

                val videoBefore = anchors.video.body()
                val cmp = videoBefore[anchors.sizeCheck] as ThreeRegisterInstruction
                assertEquals("$name: a compare", Opcode.CMP_LONG, cmp.opcode)
                assertEquals("$name: branches on the compare", Opcode.IF_LTZ, videoBefore[anchors.sizeCheck + 1].opcode)
                assertTrue("$name: the compare's answer is in v0 to v15, which a plain invoke can name", cmp.registerA <= 15)
                assertTrue("$name: the size's other half is in v0 to v15", cmp.registerB + 1 <= 15)

                originalChatMediaPatch.execute(context)

                checkPhoto(name, anchors.photo, context, PHOTO_HOOK, 7, false)
                checkPhoto(name, anchors.photoAsync, context, PHOTO_ASYNC_HOOK, 8, true)

                val video = patched(context, anchors.video).body()
                val at = anchors.sizeCheck
                val where = "$name ${anchors.video.name}"
                assertEquals("$where: two instructions in", videoBefore.size + 2, video.size)
                assertEquals("$where: the compare stays put", Opcode.CMP_LONG, video[at].opcode)
                assertEquals("$where: the hook call", Opcode.INVOKE_STATIC, video[at + 1].opcode)
                assertEquals("$where: the hook", VIDEO_HOOK, video[at + 1].target())
                val call = video[at + 1] as FiveRegisterInstruction
                assertEquals("$where: four registers", 4, call.registerCount)
                assertEquals("$where: the compare's answer", cmp.registerA, call.registerC)
                assertEquals("$where: the size", cmp.registerB, call.registerD)
                assertEquals("$where: the size's other half", cmp.registerB + 1, call.registerE)
                assertEquals("$where: the video's address, the first parameter", firstArgument(anchors.video), call.registerF)
                assertEquals("$where: the address is a String", "Ljava/lang/String;", anchors.video.parameterTypes.first().toString())
                assertTrue("$where: a plain invoke names only v0 to v15",
                    listOf(call.registerC, call.registerD, call.registerE, call.registerF).all { it <= 15 })
                assertEquals("$where: the answer", Opcode.MOVE_RESULT, video[at + 2].opcode)
                assertEquals("$where: lands where the compare did", cmp.registerA, (video[at + 2] as OneRegisterInstruction).registerA)
                assertEquals("$where: the branch is still next", Opcode.IF_LTZ, video[at + 3].opcode)
                assertEquals("$where: on the compare's register", cmp.registerA, (video[at + 3] as OneRegisterInstruction).registerA)

                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "originalChatMedia" }
                assertEquals("$name: SettingsStatus.originalChatMedia() isn't switched on", 1,
                    (status.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
