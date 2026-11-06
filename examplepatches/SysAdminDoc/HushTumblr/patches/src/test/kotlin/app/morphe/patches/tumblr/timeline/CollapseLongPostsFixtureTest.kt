/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.timeline

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
import app.morphe.patches.tumblr.lookup.stringRef
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category
import java.io.File

/** A long post nobody cut takes several screens of the timeline. */
@Category(FixtureTests::class)
class CollapseLongPostsFixtureTest {
    private val flags = listOf("collapseLongPosts", "longPostRows")
    private val types = setOf(POST_COMPOSER, BLOCK_ROW, TIMELINE_SCREEN)

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, types).values)

    @Test fun `the hook hands the post's rows to the extension and Tumblr cuts where it answers`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val post = context.resolveCollapseLongPosts().post
            val postBefore = post.method.instructionList().toList()
            // The patch edits these same instructions, so their prints and branch targets are read now.
            val postClean = Clean(postBefore.map(::fingerprint), targets(postBefore))
            assertEquals("${build.name}: the post's every-row list", "g", postBefore[post.at - 2].methodRef()?.name)
            assertEquals(build.name, listOf(post.composer, postBefore[post.at].namedRegisters()[1], post.rows),
                postBefore[post.at].namedRegisters())
            val others = context.mutableClassDefBy(POST_COMPOSER).methods
                .filter { it.toString() != post.method.toString() }
                .associate { it.toString() to it.instructionList().map(::fingerprint) }
            val rowMethods = context.mutableClassDefBy(BLOCK_ROW).methods.map { it.toString() }

            collapseLongPostsPatch.execute(context)

            val postAfter = post.method.instructionList()
            hook(postAfter, post.at, post.scratch, post.rows, post.cut)
            assertEquals(build.name, listOf(post.scratch, post.composer), postAfter[post.at].namedRegisters())
            assertEquals(build.name, listOf(post.post, post.scratch, post.rows), postAfter[post.at + 3].namedRegisters())
            assertEquals(build.name, LONG_POSTS_POST_HOOK, postAfter[post.at + 3].methodRef().toString())
            assertOnlyHook(postClean, postAfter, post.at)

            val row = context.mutableClassDefBy(BLOCK_ROW)
            assertTrue(build.name, HUSH_BLOCK_ROW in row.interfaces)
            val bridge = row.methods.single { it.toString() !in rowMethods }
            assertEquals("$BLOCK_ROW->hushBlocks()Ljava/util/List;", bridge.toString())
            assertEquals(listOf(Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT), bridge.instructionList().map { it.opcode })
            assertEquals("$BLOCK_ROW->a:Lcom/google/common/collect/ImmutableList;", bridge.instructionList()[0].fieldRef().toString())
            for (method in context.mutableClassDefBy(POST_COMPOSER).methods) {
                val key = method.toString()
                if (key in others) assertEquals("${build.name}: keep $key", others.getValue(key), method.instructionList().map(::fingerprint))
            }
            assertFlags(context, 1)
        }
    }

    @Test fun `a block row already bridged refuses before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val plan = context.resolveCollapseLongPosts()
            context.mutableClassDefBy(BLOCK_ROW).interfaces.add(HUSH_BLOCK_ROW)
            assertRefused(context, plan, "already bridged")
        }
    }

    @Test fun `a block row without its one list of blocks refuses before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val plan = context.resolveCollapseLongPosts()
            context.mutableClassDefBy(BLOCK_ROW).fields.removeAll { it.name == "a" }
            assertRefused(context, plan, "no longer keeps its blocks in one list")
        }
    }

    @Test fun `a timeline that can't say whether it draws a Read more cut refuses before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val plan = context.resolveCollapseLongPosts()
            context.mutableClassDefBy(TIMELINE_SCREEN).methods.removeAll { it.name == "n" && it.parameterTypes.isEmpty() }
            assertRefused(context, plan, "no longer answers whether it draws a Read more cut")
        }
    }

    @Test fun `a post whose cut flag no longer adds the Read more row refuses before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val plan = context.resolveCollapseLongPosts()
            plan.post.method.addInstructions(plan.post.at + 2, "const/4 v${plan.post.cut}, 0x0")
            assertRefused(context, plan, "no longer adds its Read more row")
        }
    }

    @Test fun `a post whose rows are read again after the append refuses before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val plan = context.resolveCollapseLongPosts()
            plan.post.method.addInstructions(plan.post.at + 1, "invoke-interface {v${plan.post.rows}}, Ljava/util/List;->size()I")
            assertRefused(context, plan, "reads the post's rows or its cut flag again further down")
        }
    }

    /** The eight steps the hook puts in front of [at]: ask the extension, and on a list, cut with it. */
    private fun hook(body: List<Instruction>, at: Int, scratch: Int, rows: Int, cut: Int) {
        assertEquals(
            listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT,
                Opcode.IF_EQZ, Opcode.CONST_4, Opcode.MOVE_OBJECT),
            body.subList(at, at + 8).map { it.opcode },
        )
        assertEquals("$POST_COMPOSER->m:$TIMELINE_SCREEN", body[at].fieldRef().toString())
        assertEquals("$TIMELINE_SCREEN->n()Z", body[at + 1].methodRef().toString())
        assertEquals(listOf(scratch), body[at + 1].namedRegisters())
        assertEquals(listOf(scratch), body[at + 2].namedRegisters())
        assertEquals(listOf(scratch), body[at + 4].namedRegisters())
        assertEquals(listOf(scratch), body[at + 5].namedRegisters())
        assertEquals("no list keeps Tumblr's own step", at + 8, target(body, at + 5))
        assertEquals(listOf(cut), body[at + 6].namedRegisters())
        assertEquals(1, (body[at + 6] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(listOf(rows, scratch), body[at + 7].namedRegisters())
        assertTrue("the rows aren't the scratch register", rows != scratch && cut != scratch)
    }

    private fun fingerprint(i: Instruction): String = listOf(i.opcode, i.namedRegisters(), i.methodRef()?.toString(),
        i.fieldRef()?.toString(), i.stringRef(), (i as? NarrowLiteralInstruction)?.narrowLiteral).toString()

    private fun target(body: List<Instruction>, index: Int): Int {
        val addresses = body.runningFold(0) { address, i -> address + i.codeUnits }
        return addresses.indexOf(addresses[index] + (body[index] as OffsetInstruction).codeOffset)
    }

    /** A method's instructions before the patch: what each one is, and where each branch lands. */
    private class Clean(val prints: List<String>, val targets: Map<Int, Int>)

    private fun targets(body: List<Instruction>): Map<Int, Int> {
        val targets = body.indices.filter { body[it] is OffsetInstruction }.associateWith { target(body, it) }
        assertTrue("every branch lands on an instruction", targets.values.none { it < 0 })
        return targets
    }

    /** Every original step is still there, and every original branch lands where it did, never on the hook. */
    private fun assertOnlyHook(clean: Clean, changed: List<Instruction>, at: Int) {
        val cleanIndex = changed.indices.filter { it !in at until at + 8 }.withIndex().associate { (k, index) -> index to k }
        assertEquals(clean.prints, cleanIndex.keys.sorted().map { fingerprint(changed[it]) })
        for ((index, k) in cleanIndex) if (changed[index] is OffsetInstruction) {
            assertEquals("Tumblr's branch at $k", clean.targets.getValue(k), cleanIndex[target(changed, index)])
        }
    }

    private fun assertRefused(context: BytecodePatchContext, plan: CollapseLongPostsPlan, reason: String) {
        val post = plan.post.method.instructionList().map(::fingerprint)
        val row = context.mutableClassDefBy(BLOCK_ROW)
        val interfaces = row.interfaces.toList()
        val methods = row.methods.map { it.toString() }
        val refusal = assertThrows(PatchException::class.java) { collapseLongPostsPatch.execute(context) }
        assertTrue(refusal.message, refusal.message.orEmpty().contains(reason))
        assertEquals(post, plan.post.method.instructionList().map(::fingerprint))
        assertEquals(interfaces, row.interfaces.toList())
        assertEquals(methods, row.methods.map { it.toString() })
        assertFlags(context, 0)
    }

    private fun assertFlags(context: BytecodePatchContext, expected: Int) {
        for (flag in flags) assertEquals(flag, expected, (context.mutableClassDefBy(SETTINGS_STATUS).methods.single {
            it.name == flag }.instructionList().first() as NarrowLiteralInstruction).narrowLiteral)
    }
}
