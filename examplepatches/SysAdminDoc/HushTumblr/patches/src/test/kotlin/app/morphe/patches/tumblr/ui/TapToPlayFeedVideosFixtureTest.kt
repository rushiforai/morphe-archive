/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category
import java.io.File

/** #19: with auto-play off, a tap on a feed video could only open the full-screen player. */
@Category(FixtureTests::class)
class TapToPlayFeedVideosFixtureTest {
    private val flags = listOf("tapToPlayFeedVideos", "feedVideoTap")

    /** The overlay, the player, and every tap callback, so the composer's and the ads' are there to be passed over. */
    private fun hosts(build: File): List<ClassDef> {
        val named = FixtureDex.classesWhere(build, { true }) { method ->
            method.name == "seekTo" || method.instructionList().any { step ->
                step.fieldRef()?.let { it.definingClass == TUMBLR_IDS && it.name == REPLAY_BUTTON } == true
            }
        }
        val callbacks = named.flatMap { owner ->
            owner.methods.mapNotNull { tapCallbackField(it, owner.type)?.type }
        }.toSet()
        val found = mutableListOf<ClassDef>()
        FixtureDex.forEach(build) { dex ->
            for (owner in dex.classes) if (owner.interfaces.any { it in callbacks }) found += ImmutableClassDef.of(owner)
        }
        return named + found
    }

    @Test fun `a tap asks the extension first and skips Tumblr's callback only when the video started`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveFeedVideoTap()
            val before = plan.tap.instructionList().toList()

            tapToPlayFeedVideosPatch.execute(context)

            val after = plan.tap.instructionList()
            assertEquals(build.name, FEED_VIDEO_TAP_HOOK, after[0].methodRef().toString())
            assertEquals(build.name, listOf(plan.self), after[0].namedRegisters())
            assertEquals(build.name, Opcode.MOVE_RESULT, after[1].opcode)
            assertEquals(build.name, plan.spare, (after[1] as OneRegisterInstruction).registerA)
            assertEquals(build.name, Opcode.IF_NEZ, after[2].opcode)
            assertEquals(build.name, plan.spare, (after[2] as OneRegisterInstruction).registerA)
            assertEquals("${build.name}: Tumblr's own steps", before.map { it.opcode }, after.drop(3).map { it.opcode })
            assertEquals("${build.name}: the frame stays", 2, plan.tap.implementation!!.registerCount)
            assertFlags(context, 1)
        }
    }

    @Test fun `only the callback that opens the full-screen player gives up its tap`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val plan = context.resolveFeedVideoTap()
            val callback = plan.tap.instructionList()[2].methodRef()!!.definingClass
            val all = classes.filter { callback in it.interfaces }.map { it.type }.toSet()
            assertTrue("${build.name}: the composer and ads have callbacks of their own, found $all", all.size >= 3)
            assertTrue(build.name, plan.opener in all)

            tapToPlayFeedVideosPatch.execute(context)

            val overlay = context.mutableClassDefBy(plan.overlay)
            assertTrue(build.name, HUSH_FEED_VIDEO in overlay.interfaces)
            val play = overlay.methods.single { it.name == FEED_VIDEO_PLAY }.instructionList()
            val tested = play.filter { it.opcode == Opcode.INSTANCE_OF }
                .map { ((it as ReferenceInstruction).reference as TypeReference).type }
            assertEquals(build.name, listOf(plan.opener), tested)
            assertEquals("${build.name}: ads first", Opcode.IGET_BOOLEAN, play[0].opcode)
            assertEquals("${build.name}: play and replay", 2, play.count { it.opcode == Opcode.INVOKE_DIRECT })
            assertTrue(build.name, overlay.methods.any { it.name == FEED_VIDEO_PAUSE })
        }
    }

    @Test fun `a tap handler that does anything more refuses before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveFeedVideoTap()
            plan.tap.addInstructions(plan.done, "nop")
            val steps = plan.tap.instructionList().map { it.opcode }
            assertThrows(PatchException::class.java) { tapToPlayFeedVideosPatch.execute(context) }
            assertEquals(build.name, steps, plan.tap.instructionList().map { it.opcode })
            val overlay = context.mutableClassDefBy(plan.overlay)
            assertFalse(build.name, HUSH_FEED_VIDEO in overlay.interfaces)
            assertFalse(build.name, overlay.methods.any { it.name == FEED_VIDEO_PLAY })
            assertFlags(context, 0)
        }
    }

    private fun assertFlags(context: BytecodePatchContext, expected: Int) {
        for (flag in flags) assertEquals(flag, expected, (context.mutableClassDefBy(SETTINGS_STATUS).methods.single {
            it.name == flag }.instructionList().first() as NarrowLiteralInstruction).narrowLiteral)
    }
}
