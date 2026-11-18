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
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test
import org.junit.experimental.categories.Category
import java.io.File

/** #19: a tall video opened full screen filled the screen's height and lost its sides. */
@Category(FixtureTests::class)
class FitFullScreenVideosFixtureTest {
    private val flags = listOf("fitFullScreenVideos", "fullScreenVideoFit")

    private fun hosts(build: File): List<ClassDef> = FixtureDex.classesWhere(build, { true }) { method ->
        method.name == "<init>" && method.instructionList().any { step ->
            step.fieldRef()?.let { it.definingClass == VIDEO_HUB_IDS && it.name == VIDEO_BACKDROP } == true
        }
    }

    @Test fun `only a tall video's answer goes through the extension on its way to the player`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val plan = context.resolveVideoFit()
            val before = plan.constructor.instructionList().toList()
            assertEquals(build.name, Opcode.CONST_4, before[plan.at - 1].opcode)
            assertEquals(build.name, plan.tall, (before[plan.at - 1] as OneRegisterInstruction).registerA)
            assertEquals(build.name, 1, (before[plan.at - 1] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(build.name, Opcode.MOVE, before[plan.at].opcode)

            fitFullScreenVideosPatch.execute(context)

            val after = plan.constructor.instructionList()
            assertEquals(build.name, VIDEO_FIT_HOOK, after[plan.at].methodRef().toString())
            assertEquals(build.name, listOf(plan.tall), after[plan.at].namedRegisters())
            assertEquals(build.name, Opcode.MOVE_RESULT, after[plan.at + 1].opcode)
            assertEquals(build.name, plan.tall, (after[plan.at + 1] as OneRegisterInstruction).registerA)
            val taken = after[plan.at + 2] as TwoRegisterInstruction
            assertEquals("${build.name}: the flag takes the extension's answer", plan.flag, taken.registerA)
            assertEquals("${build.name}: the flag takes the extension's answer", plan.tall, taken.registerB)
            assertEquals("${build.name}: every other step", before.map { it.opcode },
                after.filterIndexed { at, _ -> at != plan.at && at != plan.at + 1 }.map { it.opcode })
            assertFlags(context, 1)
        }
    }

    @Test fun `a page that changes the flag before it builds the player refuses before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveVideoFit()
            plan.constructor.addInstructions(plan.at + 4, "const/4 v${plan.flag}, 0x1")
            val steps = plan.constructor.instructionList().map { it.opcode }
            assertThrows(PatchException::class.java) { fitFullScreenVideosPatch.execute(context) }
            assertEquals(build.name, steps, plan.constructor.instructionList().map { it.opcode })
            assertFlags(context, 0)
        }
    }

    private fun assertFlags(context: BytecodePatchContext, expected: Int) {
        for (flag in flags) assertEquals(flag, expected, (context.mutableClassDefBy(SETTINGS_STATUS).methods.single {
            it.name == flag }.instructionList().first() as NarrowLiteralInstruction).narrowLiteral)
    }
}
