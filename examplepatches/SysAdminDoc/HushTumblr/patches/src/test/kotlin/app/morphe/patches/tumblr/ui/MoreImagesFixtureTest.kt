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
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** #21: the editor's image limit and the share screen's image cap go through the extension, and nothing else moves. */
@Category(FixtureTests::class)
class MoreImagesFixtureTest {
    private val flags = listOf("moreImagesPerPost", "imageLimit")

    private fun readsTheMessage(method: Method): Boolean = method.instructionList().any { step ->
        step.opcode == Opcode.SGET && step.fieldRef()?.let { it.definingClass == TUMBLR_ARRAYS && it.name == IMAGE_LIMIT_MESSAGE } == true
    }

    private fun context(build: java.io.File) =
        PatchContexts.of(ExtensionDex.classes() + FixtureDex.classesWhere(build, { true }, ::readsTheMessage))

    private fun opcodes(method: Method): List<Opcode> = method.instructionList().map { it.opcode }.filter { it != Opcode.NOP }

    private fun Instruction.callsTheHook(register: Int): Boolean =
        opcode == Opcode.INVOKE_STATIC && methodRef()?.let {
            "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == IMAGE_LIMIT_HOOK
        } == true && (this as FiveRegisterInstruction).registerCount == 1 && registerC == register

    private fun Instruction.takesTheAnswer(register: Int): Boolean =
        opcode == Opcode.MOVE_RESULT && (this as OneRegisterInstruction).registerA == register

    @Test fun `the editor's image limit and the share screen's cap go through the extension, and nothing else moves`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val plan = context.resolveImageLimits()
            assertEquals("${build.name}: Tumblr's image limit", 10, plan.stock)
            val limits = opcodes(plan.limits)
            val share = opcodes(plan.share)

            moreImagesPerPostPatch.execute(context)

            val built = plan.limits.instructionList()
            val limit = plan.limitRegister
            assertTrue("${build.name}: the hook before the image limit is built", built[plan.buildAt].callsTheHook(limit))
            assertTrue(built[plan.buildAt + 1].takesTheAnswer(limit))
            assertEquals("<init>", built[plan.buildAt + 2].methodRef()?.name)
            assertEquals((built[plan.buildAt + 2] as FiveRegisterInstruction).registerE, limit)
            assertEquals(Opcode.SPUT_OBJECT, built[plan.buildAt + 3].opcode)
            val back = built[plan.buildAt + 4]
            assertTrue("${build.name}: the link, video and audio limits get 10 back",
                back is OneRegisterInstruction && back.registerA == limit && (back as NarrowLiteralInstruction).narrowLiteral == 10)
            assertEquals("${build.name}: the limits keep every step of their own",
                limits, opcodes(plan.limits).toMutableList().apply {
                    removeAt(plan.buildAt + 4); removeAt(plan.buildAt + 1); removeAt(plan.buildAt)
                })

            val sharing = plan.share.instructionList()
            val cap = plan.capRegister
            assertTrue("${build.name}: the hook before the share screen reads its images", sharing[plan.readAt].callsTheHook(cap))
            assertTrue(sharing[plan.readAt + 1].takesTheAnswer(cap))
            assertEquals("getParcelableArrayListExtra", sharing[plan.readAt + 2].methodRef()?.name)
            assertEquals("${build.name}: the share screen keeps every step of its own",
                share, opcodes(plan.share).toMutableList().apply { removeAt(plan.readAt + 1); removeAt(plan.readAt) })
            assertFlags(context, 1)
        }
    }

    @Test fun `a share cap that isn't the editor's limit refuses before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val plan = context.resolveImageLimits()
            val sharing = plan.share.instructionList()
            val set = (plan.readAt downTo 0).first { at ->
                sharing[at].opcode == Opcode.CONST_16 && (sharing[at] as OneRegisterInstruction).registerA == plan.capRegister
            }
            plan.share.replaceInstruction(set, "const/16 v${plan.capRegister}, 0xb")
            val limits = opcodes(plan.limits)
            assertThrows(PatchException::class.java) { moreImagesPerPostPatch.execute(context) }
            assertEquals(limits, opcodes(plan.limits))
            assertFlags(context, 0)
        }
    }

    private fun assertFlags(context: BytecodePatchContext, expected: Int) {
        for (flag in flags) assertEquals(flag, expected, (context.mutableClassDefBy(SETTINGS_STATUS).methods.single {
            it.name == flag }.instructionList().first() as NarrowLiteralInstruction).narrowLiteral)
    }
}
