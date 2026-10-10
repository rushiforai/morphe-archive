/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.comments.summaries.descriptor
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.media.resume.VIDEO_PLAYER_PARAMS
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Clean up Reels' Play reels once hook on every Facebook build the bundle declares: the one method
 * that runs at a video's end, FbGrootPlayer's completion step, hands the extension its read of the
 * params' shouldLoopVideo with the params, right after the read, and the extension's reel check is
 * filled with the params' isFbShorts. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and
 * skips without it.
 */
class ReelLoopFixtureTest {
    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    private fun Instruction.called() = ((this as? ReferenceInstruction)?.reference as? MethodReference)?.descriptor()

    private fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference

    @Test
    fun `each declared build's loop check at a video's end answers through the extension`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val holders = FixtureDex.classesHolding(bundle, VIDEO_COMPLETE_ANCHOR)
                    .filterNot { it.type.startsWith(EXTENSION_PACKAGE) }.distinctBy { it.type }
                val completes = videoCompletes(holders)
                assertEquals("$name: methods holding \"$VIDEO_COMPLETE_ANCHOR\"", 1, completes.size)
                val complete = completes.single()
                val code = complete.code()

                val params = FixtureDex.classes(bundle, setOf(VIDEO_PLAYER_PARAMS)).getValue(VIDEO_PLAYER_PARAMS)
                val loop = reportedFlag(params, SHOULD_LOOP_VIDEO)
                val shorts = reportedFlag(params, IS_FB_SHORTS)
                assertNotNull("$name: $VIDEO_PLAYER_PARAMS doesn't report $SHOULD_LOOP_VIDEO from one public boolean", loop)
                assertNotNull("$name: $VIDEO_PLAYER_PARAMS doesn't report $IS_FB_SHORTS from one public boolean", shorts)
                assertNotEquals("$name: the two flags are one field", loop!!.name, shorts!!.name)

                val reads = loopReads(complete, loop)
                assertEquals("$name: reads of $SHOULD_LOOP_VIDEO at a video's end", 1, reads.size)
                val read = reads.single()
                assertTrue("$name: the flag and the params below v16", read.answer <= 15 && read.params <= 15)

                // Positive control: this is the loop decision. The answer goes straight into a branch,
                // and the same params' shouldPreventExcessiveLooping is read in the same method, the
                // check Facebook makes before it lets a video loop again.
                val branch = code[read.at + 1]
                assertTrue("$name: the loop flag doesn't decide a branch straight away",
                    branch.opcode.name.startsWith("if-") && (
                        (branch as OneRegisterInstruction).registerA == read.answer ||
                            (branch as? TwoRegisterInstruction)?.registerB == read.answer))
                val excessive = reportedFlag(params, "shouldPreventExcessiveLooping")
                assertNotNull("$name: $VIDEO_PLAYER_PARAMS doesn't report shouldPreventExcessiveLooping", excessive)
                val guards = loopReads(complete, excessive!!)
                assertTrue("$name: the end of a video doesn't check for excessive looping on the same params",
                    guards.isNotEmpty() && guards.all { it.params == read.params && it.at < read.at })

                val completeClass = holders.single { it.type == complete.definingClass }
                val pool = listOf(completeClass, params, ExtensionDex.classDef(REEL_LOOP)).associateBy { it.type }.values
                val context = PatchContexts.of(pool)
                reelLoopPatch.execute(context)

                val patched = context.mutableClassDefBy(complete.definingClass).methods
                    .single { it.descriptor() == complete.descriptor() }.code()
                assertEquals("$name: two instructions at a video's end", code.size + 2, patched.size)
                assertEquals("$name: Facebook's read stays first", Opcode.IGET_BOOLEAN, patched[read.at].opcode)
                val ask = patched[read.at + 1]
                assertEquals("$name: the read is followed by $LOOPS", LOOPS, ask.called())
                assertEquals("$name: handed the loop flag, then the params",
                    listOf(2, read.answer, read.params),
                    listOf((ask as FiveRegisterInstruction).registerCount, ask.registerC, ask.registerD))
                assertEquals("$name: its answer back where the flag was",
                    listOf(Opcode.MOVE_RESULT, read.answer),
                    listOf(patched[read.at + 2].opcode, (patched[read.at + 2] as OneRegisterInstruction).registerA))
                assertEquals("$name: Facebook's branch follows", branch.opcode, patched[read.at + 3].opcode)

                val stub = context.mutableClassDefBy(REEL_LOOP).methods.single { it.name == REEL_LOOP_FB_SHORTS }.code()
                assertEquals("$name: the reel check casts to the params first",
                    VIDEO_PLAYER_PARAMS, ((stub[0] as ReferenceInstruction).reference as TypeReference).type)
                assertEquals("$name: the reel check reads isFbShorts",
                    listOf(Opcode.IGET_BOOLEAN, shorts.name), listOf(stub[1].opcode, stub[1].field()?.name))
                assertEquals("$name: the reel check answers it", Opcode.RETURN, stub[2].opcode)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    @Test
    fun `the extension has the hook and the reel check`() {
        val reelLoop = ExtensionDex.classDef(REEL_LOOP)
        val hook = reelLoop.methods.singleOrNull { it.name == "loops" }
        assertTrue("the extension has no ReelLoop.loops", hook != null)
        assertEquals("loops' shape", LOOPS, hook!!.descriptor())
        val stub = reelLoop.methods.singleOrNull { it.name == REEL_LOOP_FB_SHORTS }
        assertTrue("the extension has no ReelLoop.fbShorts", stub != null)
        assertEquals("fbShorts' shape", "$REEL_LOOP->$REEL_LOOP_FB_SHORTS(Ljava/lang/Object;)Z", stub!!.descriptor())
    }
}
