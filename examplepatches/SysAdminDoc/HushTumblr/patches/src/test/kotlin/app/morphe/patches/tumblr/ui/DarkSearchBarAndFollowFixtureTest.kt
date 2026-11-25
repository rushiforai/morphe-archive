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
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/**
 * #24: Explore's search bar and a blog's Follow item are each handed to the extension right after
 * Tumblr's own code keeps them, and nothing else moves.
 */
@Category(FixtureTests::class)
class DarkSearchBarAndFollowFixtureTest {
    private val flags = listOf("darkSearchBarAndFollow", "darkControls")

    private fun Instruction.loads(name: String): Boolean =
        opcode == Opcode.SGET && fieldRef()?.let { it.definingClass == VIEW_IDS && it.name == name } == true

    /** Every class that reads either id, so the bar's finder still has to be the only one in the app. */
    private fun context(build: java.io.File) = PatchContexts.of(
        ExtensionDex.classes() + FixtureDex.classesWhere(build, { true }) { method ->
            method.instructionList().any { it.loads(SEARCH_BAR_ID) || it.loads(FOLLOW_ITEM_ID) }
        },
    )

    /** The method's own steps, leaving out the one at [added]. */
    private fun opcodes(method: Method, added: Int = -1): List<Opcode> =
        method.instructionList().filterIndexed { at, _ -> at != added }.map { it.opcode }.filter { it != Opcode.NOP }

    private fun Instruction.hands(hook: String, register: Int): Boolean =
        opcode == Opcode.INVOKE_STATIC && methodRef()?.let {
            "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == hook
        } == true && (this as FiveRegisterInstruction).registerCount == 1 && registerC == register

    @Test fun `the search bar and the Follow item are handed over right after Tumblr keeps them, and nothing else moves`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val bar = context.resolveExploreSearchBar()
            val follow = context.resolveBlogFollowItem()
            assertEquals(BLOG_HEADER, follow.method.definingClass)
            val barSteps = opcodes(bar.method)
            val followSteps = opcodes(follow.method)

            darkSearchBarAndFollowPatch.execute(context)

            val sites = listOf(
                Triple(bar, EXPLORE_SEARCH_BAR_HOOK, SEARCH_BAR_ID to "findViewById"),
                Triple(follow, BLOG_FOLLOW_BUTTON_HOOK, FOLLOW_ITEM_ID to "findItem"),
            )
            for ((site, hook, lookup) in sites) {
                val (id, finder) = lookup
                val steps = site.method.instructionList()
                assertTrue("${build.name}: $hook takes what $finder found", steps[site.at].hands(hook, site.register))
                val kept = steps[site.at - 1]
                assertEquals("${build.name}: the hook comes right after $id is kept", Opcode.IPUT_OBJECT, kept.opcode)
                assertEquals(site.register, (kept as TwoRegisterInstruction).registerA)
                val load = steps.indices.single { steps[it].loads(id) }
                assertEquals(finder, steps[load + 1].methodRef()?.name)
                assertTrue("${build.name}: $id is kept within a few steps of its lookup", site.at - load in 4..6)
            }
            assertEquals("${build.name}: Explore's header keeps every step of its own", barSteps, opcodes(bar.method, bar.at))
            assertEquals("${build.name}: the blog's menu builder keeps every step of its own",
                followSteps, opcodes(follow.method, follow.at))
            assertFlags(context, 1)
        }
    }

    @Test fun `a Follow item the blog no longer keeps refuses before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val bar = context.resolveExploreSearchBar()
            val follow = context.resolveBlogFollowItem()
            // The item is found and dropped, where Tumblr's own code kept it in a field.
            follow.method.replaceInstruction(follow.at - 1, "nop")
            val barSteps = opcodes(bar.method)
            val followSteps = opcodes(follow.method)
            assertThrows(PatchException::class.java) { darkSearchBarAndFollowPatch.execute(context) }
            assertEquals("${build.name}: Explore's header was edited before the refusal", barSteps, opcodes(bar.method))
            assertEquals(followSteps, opcodes(follow.method))
            assertFlags(context, 0)
        }
    }

    private fun assertFlags(context: BytecodePatchContext, expected: Int) {
        for (flag in flags) assertEquals(flag, expected, (context.mutableClassDefBy(SETTINGS_STATUS).methods.single {
            it.name == flag }.instructionList().first() as NarrowLiteralInstruction).narrowLiteral)
    }
}
