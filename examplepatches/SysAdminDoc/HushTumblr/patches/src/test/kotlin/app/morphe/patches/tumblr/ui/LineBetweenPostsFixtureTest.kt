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
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.strings
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test
import org.junit.experimental.categories.Category
import java.io.File

@Category(FixtureTests::class)
class LineBetweenPostsFixtureTest {
    private val flags = listOf("lineBetweenPosts", "postLine")

    private fun hosts(build: File): List<ClassDef> =
        FixtureDex.classesWhere(build, { true }) { POST_SPACING_DEBUG in it.strings() }

    @Test fun `the debug answer and the painted gap go through the extension and nothing else moves`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val plan = context.resolvePostGaps()
            val before = plan.draw.instructionList().toList()
            val debugKept = before[plan.debugRead + 1] as OneRegisterInstruction
            val paint = before[plan.paint] as RegisterRangeInstruction
            assertEquals("${build.name}: the canvas, four floats and the paint", 6, paint.registerCount)
            val others = classes.flatMap { it.methods }.filter { it.toString() != plan.draw.toString() }
                .associate { it.toString() to it.instructionList().map { step -> step.opcode } }

            lineBetweenPostsPatch.execute(context)

            val after = plan.draw.instructionList()
            val hookAt = plan.debugRead + 2
            assertEquals(build.name, POST_GAPS_HOOK, after[hookAt].methodRef().toString())
            assertEquals(build.name, listOf(debugKept.registerA), after[hookAt].namedRegisters())
            assertEquals(build.name, debugKept.registerA, (after[hookAt + 1] as OneRegisterInstruction).registerA)
            assertEquals(build.name, Opcode.MOVE_RESULT, after[hookAt + 1].opcode)
            val painted = after[plan.paint + 2] as RegisterRangeInstruction
            assertEquals(build.name, POST_GAP_HOOK, after[plan.paint + 2].methodRef().toString())
            assertEquals(build.name, paint.startRegister, painted.startRegister)
            assertEquals(build.name, paint.registerCount, painted.registerCount)
            assertEquals("${build.name}: every other step of the loop", before.map { it.opcode }.mapIndexed { at, opcode ->
                if (at == plan.paint) Opcode.INVOKE_STATIC_RANGE else opcode
            }, after.filterIndexed { at, _ -> at != hookAt && at != hookAt + 1 }.map { it.opcode })
            for (owner in classes) for (method in context.mutableClassDefBy(owner.type).methods) {
                if (method.toString() != plan.draw.toString()) {
                    assertEquals("${build.name}: keep $method", others.getValue(method.toString()), method.instructionList().map { it.opcode })
                }
            }
            assertFlags(context, 1)
        }
    }

    @Test fun `a draw that paints its gaps some other way refuses before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolvePostGaps()
            val first = (plan.draw.instructionList()[plan.paint] as RegisterRangeInstruction).startRegister
            plan.draw.replaceInstruction(plan.paint, "invoke-virtual/range { v$first .. v$first }, Ljava/lang/Object;->hashCode()I")
            val before = plan.draw.instructionList().map { it.opcode }
            assertThrows(PatchException::class.java) { lineBetweenPostsPatch.execute(context) }
            assertEquals(before, plan.draw.instructionList().map { it.opcode })
            assertFlags(context, 0)
        }
    }

    @Test fun `another decoration holding the key without the draw can't bind`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolvePostGaps()
            plan.draw.replaceInstruction(plan.debugRead, "invoke-virtual { p0 }, Ljava/lang/Object;->hashCode()I")
            val before = plan.draw.instructionList().map { it.opcode }
            assertThrows(PatchException::class.java) { lineBetweenPostsPatch.execute(context) }
            assertEquals(before, plan.draw.instructionList().map { it.opcode })
            assertFlags(context, 0)
        }
    }

    private fun assertFlags(context: BytecodePatchContext, expected: Int) {
        for (flag in flags) assertEquals(flag, expected, (context.mutableClassDefBy(SETTINGS_STATUS).methods.single {
            it.name == flag }.instructionList().first() as NarrowLiteralInstruction).narrowLiteral)
    }
}
