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
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category
import java.io.File

@Category(FixtureTests::class)
class LineBetweenPostsFixtureTest {
    private val flags = listOf("lineBetweenPosts", "postLine")

    /** The spacing decoration, and the timeline item class its gap size picker takes. */
    private fun hosts(build: File): List<ClassDef> {
        val spacing = FixtureDex.classesWhere(build, { true }) { POST_SPACING_DEBUG in it.strings() }
        val cards = spacing.flatMap { it.methods }.flatMap { it.instructionList() }.mapNotNull { it.methodRef() }
            .filter { it.returnType == "I" && it.parameterTypes.size == 2 && it.parameterTypes[0].toString() == it.parameterTypes[1].toString() }
            .map { it.parameterTypes[0].toString() }.toSet()
        return spacing + FixtureDex.classesWhere(build, { true }) { it.definingClass in cards }
    }

    @Test fun `the debug answer, the painted gap and each row go through the extension and nothing else moves`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val plan = context.resolvePostGaps()
            val before = plan.draw.instructionList().toList()
            val offsetsBefore = plan.offsets.instructionList().map { it.opcode }
            val debugKept = before[plan.debugRead + 1] as OneRegisterInstruction
            val paint = before[plan.paint] as RegisterRangeInstruction
            assertEquals("${build.name}: the canvas, four floats and the paint", 6, paint.registerCount)
            assertEquals("${build.name}: the row's view", "Landroid/view/View;", plan.offsets.parameterTypes[1].toString())
            assertTrue("${build.name}: scratch apart from the items", plan.scratch.none { it == plan.above || it == plan.here || it == plan.row })
            assertTrue("${build.name}: the payload is the item's Timelineable", plan.payload.endsWith("()Lcom/tumblr/rumblr/model/Timelineable;"))
            val others = classes.flatMap { it.methods }.filter { it.toString() != plan.draw.toString() && it.toString() != plan.offsets.toString() }
                .associate { it.toString() to it.instructionList().map { step -> step.opcode } }

            lineBetweenPostsPatch.execute(context)

            val after = plan.draw.instructionList()
            val hookAt = plan.debugRead + 2
            assertEquals(build.name, POST_GAPS_HOOK, after[hookAt].methodRef().toString())
            assertEquals(build.name, listOf(debugKept.registerA), after[hookAt].namedRegisters())
            assertEquals(build.name, debugKept.registerA, (after[hookAt + 1] as OneRegisterInstruction).registerA)
            assertEquals(build.name, Opcode.MOVE_RESULT, after[hookAt + 1].opcode)
            val rowAt = plan.drawnRowAt + 2
            assertEquals(build.name, POST_DRAWN_ROW_HOOK, after[rowAt].methodRef().toString())
            assertEquals(build.name, listOf(plan.drawnRow), after[rowAt].namedRegisters())
            assertEquals("${build.name}: the row is the child just taken", Opcode.MOVE_RESULT_OBJECT, after[rowAt - 1].opcode)
            val painted = after[plan.paint + 3] as RegisterRangeInstruction
            assertEquals(build.name, POST_GAP_HOOK, after[plan.paint + 3].methodRef().toString())
            assertEquals(build.name, paint.startRegister, painted.startRegister)
            assertEquals(build.name, paint.registerCount, painted.registerCount)
            assertEquals("${build.name}: every other step of the loop", before.map { it.opcode }.mapIndexed { at, opcode ->
                if (at == plan.paint) Opcode.INVOKE_STATIC_RANGE else opcode
            }, after.filterIndexed { at, _ -> at != hookAt && at != hookAt + 1 && at != rowAt }.map { it.opcode })

            val offsets = plan.offsets.instructionList()
            assertEquals(build.name, POST_ROW_HOOK, offsets[0].methodRef().toString())
            assertEquals(build.name, listOf(plan.row), offsets[0].namedRegisters())
            val block = plan.neighborsAt + 1
            assertEquals(
                "${build.name}: both payloads read when there's an item, then handed over",
                listOf(Opcode.CONST_4, Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT,
                    Opcode.CONST_4, Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_STATIC),
                offsets.subList(block, block + 9).map { it.opcode },
            )
            val (aboveKind, hereKind) = plan.scratch
            assertEquals(build.name, listOf(plan.above), offsets[block + 1].namedRegisters())
            assertEquals(build.name, listOf(plan.above), offsets[block + 2].namedRegisters())
            assertEquals(build.name, plan.payload, offsets[block + 2].methodRef().toString())
            assertEquals(build.name, listOf(aboveKind), offsets[block + 3].namedRegisters())
            assertEquals(build.name, listOf(plan.here), offsets[block + 6].namedRegisters())
            assertEquals(build.name, plan.payload, offsets[block + 6].methodRef().toString())
            assertEquals(build.name, listOf(hereKind), offsets[block + 7].namedRegisters())
            assertEquals(build.name, POST_NEIGHBORS_HOOK, offsets[block + 8].methodRef().toString())
            assertEquals(build.name, listOf(aboveKind, hereKind), offsets[block + 8].namedRegisters())
            assertEquals("${build.name}: every other step of the offsets", offsetsBefore,
                offsets.filterIndexed { at, _ -> at != 0 && at !in block until block + 9 }.map { it.opcode })

            for (owner in classes) for (method in context.mutableClassDefBy(owner.type).methods) {
                if (method.toString() != plan.draw.toString() && method.toString() != plan.offsets.toString()) {
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
            val offsets = plan.offsets.instructionList().map { it.opcode }
            assertThrows(PatchException::class.java) { lineBetweenPostsPatch.execute(context) }
            assertEquals(before, plan.draw.instructionList().map { it.opcode })
            assertEquals(offsets, plan.offsets.instructionList().map { it.opcode })
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

    /** #15: with the items handed over the other way round, the line could land beside a heading. */
    @Test fun `a gap size picker that doesn't take the items as read refuses before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolvePostGaps()
            val steps = plan.offsets.instructionList()
            val picker = steps.indexOfFirst { it.namedRegisters().drop(1) == listOf(plan.above, plan.here) && it.methodRef() != null }
            val ref = steps[picker].methodRef()!!
            val receiver = steps[picker].namedRegisters().first()
            plan.offsets.replaceInstruction(picker, "invoke-virtual { v$receiver, v${plan.here}, v${plan.above} }, $ref")
            val offsets = plan.offsets.instructionList().map { it.opcode }
            val draw = plan.draw.instructionList().map { it.opcode }
            assertThrows(PatchException::class.java) { lineBetweenPostsPatch.execute(context) }
            assertEquals(offsets, plan.offsets.instructionList().map { it.opcode })
            assertEquals(draw, plan.draw.instructionList().map { it.opcode })
            assertFlags(context, 0)
        }
    }

    private fun assertFlags(context: BytecodePatchContext, expected: Int) {
        for (flag in flags) assertEquals(flag, expected, (context.mutableClassDefBy(SETTINGS_STATUS).methods.single {
            it.name == flag }.instructionList().first() as NarrowLiteralInstruction).narrowLiteral)
    }
}
