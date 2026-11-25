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
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/**
 * #24: a related tag's fixed height and the box's tint on both blog search screens each go through
 * the extension on their way to where Tumblr stores them, and nothing else moves.
 */
@Category(FixtureTests::class)
class FixHardToReadTextFixtureTest {
    private val flags = listOf("fixHardToReadText", "readableText")

    private fun context(build: java.io.File) =
        PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, setOf(TAG_CAROUSEL, BLOG_SEARCH, BLOG_SEARCH_TYPING)).values)

    /** The method's own steps, leaving out the ones at [added]. */
    private fun opcodes(method: Method, added: Set<Int> = emptySet()): List<Opcode> =
        method.instructionList().filterIndexed { at, _ -> at !in added }.map { it.opcode }.filter { it != Opcode.NOP }

    private fun Instruction.hands(hook: String, registers: List<Int>): Boolean {
        if (opcode != Opcode.INVOKE_STATIC) return false
        val called = methodRef() ?: return false
        if ("${called.definingClass}->${called.name}(${called.parameterTypes.joinToString("")})${called.returnType}" != hook) return false
        val call = this as FiveRegisterInstruction
        return listOf(call.registerC, call.registerD, call.registerE).take(call.registerCount) == registers
    }

    private fun Instruction.takesTheAnswer(register: Int): Boolean =
        opcode == Opcode.MOVE_RESULT && (this as OneRegisterInstruction).registerA == register

    @Test fun `a tag's height and both search boxes' tints go through the extension, and nothing else moves`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val tag = context.resolveRelatedTagHeight()
            val boxes = context.resolveBlogSearchBoxes()
            assertEquals(TAG_CAROUSEL, tag.method.definingClass)
            assertEquals("${build.name}: the typing screen and the results screen",
                listOf(BLOG_SEARCH_TYPING, BLOG_SEARCH), boxes.map { it.method.definingClass })
            val tagSteps = opcodes(tag.method)
            val boxSteps = boxes.map { opcodes(it.method) }

            fixHardToReadTextPatch.execute(context)

            val built = tag.method.instructionList()
            assertTrue("${build.name}: the hook takes the tag and its fixed height",
                built[tag.at].hands(RELATED_TAG_HEIGHT_HOOK, listOf(tag.tag, tag.height)))
            assertTrue(built[tag.at + 1].takesTheAnswer(tag.height))
            val store = built[tag.at + 2]
            assertEquals("${build.name}: the answer goes into the params' height", Opcode.IPUT, store.opcode)
            assertEquals("height", store.fieldRef()?.name)
            assertEquals(tag.height, (store as TwoRegisterInstruction).registerA)
            val handed = built.drop(tag.at + 3).first { it.methodRef()?.name == "setLayoutParams" } as FiveRegisterInstruction
            assertEquals("${build.name}: the tag is the view that gets those params", tag.tag, handed.registerC)
            assertEquals(store.registerB, handed.registerD)
            assertEquals("${build.name}: the tag row keeps every step of its own",
                tagSteps, opcodes(tag.method, setOf(tag.at, tag.at + 1)))

            for ((box, steps) in boxes.zip(boxSteps)) {
                val screen = "${build.name} ${box.method.definingClass}"
                val tinted = box.method.instructionList()
                assertTrue("$screen: the hook takes the box, the text color and Tumblr's tint",
                    tinted[box.at].hands(BLOG_SEARCH_BOX_HOOK, listOf(box.box, box.text, box.tint)))
                assertTrue(tinted[box.at + 1].takesTheAnswer(box.tint))
                val set = tinted[box.at + 2]
                assertEquals("$screen: the answer is the tint the box gets", "setTint", set.methodRef()?.name)
                assertEquals(box.box, (set as FiveRegisterInstruction).registerC)
                assertEquals(box.tint, set.registerD)
                assertEquals("$screen: the search screen keeps every step of its own",
                    steps, opcodes(box.method, setOf(box.at, box.at + 1)))
            }
            assertFlags(context, 1)
        }
    }

    @Test fun `a search box tinted at another strength refuses before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val tag = context.resolveRelatedTagHeight()
            val boxes = context.resolveBlogSearchBoxes()
            // The last one looked at, so everything before it has already passed its checks.
            val box = boxes.last()
            val strength = box.method.instructionList()[box.at - 3]
            assertEquals(SEARCH_BOX_TINT, (strength as NarrowLiteralInstruction).narrowLiteral)
            // Half strength where Tumblr's 20% was: the box is no longer the one the fix was made for.
            box.method.replaceInstruction(box.at - 3, "const v${(strength as OneRegisterInstruction).registerA}, 0x3f000000")
            val tagSteps = opcodes(tag.method)
            val boxSteps = boxes.map { opcodes(it.method) }
            assertThrows(PatchException::class.java) { fixHardToReadTextPatch.execute(context) }
            assertEquals("${build.name}: the tag row was edited before the refusal", tagSteps, opcodes(tag.method))
            assertEquals("${build.name}: a search screen was edited before the refusal",
                boxSteps, boxes.map { opcodes(it.method) })
            assertFlags(context, 0)
        }
    }

    private fun assertFlags(context: BytecodePatchContext, expected: Int) {
        for (flag in flags) assertEquals(flag, expected, (context.mutableClassDefBy(SETTINGS_STATUS).methods.single {
            it.name == flag }.instructionList().first() as NarrowLiteralInstruction).narrowLiteral)
    }
}
