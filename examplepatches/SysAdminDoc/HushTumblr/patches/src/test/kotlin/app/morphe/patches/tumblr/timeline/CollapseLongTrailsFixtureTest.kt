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
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.stringRef
import app.morphe.patches.tumblr.misc.extension.PatchLogCapture
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import app.morphe.util.RegisterLiveness
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category
import java.io.File

/** A long entry in a reblog trail takes several screens, since only the post's own rows were cut. */
@Category(FixtureTests::class)
class CollapseLongTrailsFixtureTest {
    private val patch = "Collapse long posts"
    private val types = setOf(POST_COMPOSER, BLOCK_ROW, TIMELINE_SCREEN, TRAIL_ENTRY)

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, types).values)

    @Test fun `the hook hands the entry's cut, ask, rows and blocks to the extension and keeps its answer`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val site = context.resolveTrailSite(patch)
            val before = site.method.instructionList().toList()
            val clean = Clean(before.map(::fingerprint), targets(before))
            assertEquals(build.name, "$TRAIL_ENTRY->j:Ljava/lang/Integer;", before[site.at].fieldRef().toString())
            assertEquals(build.name, Opcode.INVOKE_DIRECT, before[site.at - 1].opcode)
            assertEquals("${build.name}: four distinct locals", 4, site.free.toSet().size)
            assertTrue(build.name, site.self !in site.free)
            val liveness = RegisterLiveness.of(site.method)
            assertTrue("${build.name}: the hook's locals are free where it goes", site.free.none { it in liveness.liveInto(site.at) })
            val others = context.mutableClassDefBy(TRAIL_ENTRY).methods
                .filter { it.toString() != site.method.toString() }
                .associate { it.toString() to it.instructionList().map(::fingerprint) }

            val warnings = PatchLogCapture.warnings { collapseLongPostsPatch.execute(context) }

            assertTrue(warnings.toString(), warnings.none { "trail" in it })
            val after = site.method.instructionList()
            val (cut, ask, rows, blocks) = site.free
            assertEquals(
                listOf(Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC,
                    Opcode.MOVE_RESULT_OBJECT, Opcode.IPUT_OBJECT),
                after.subList(site.at, site.at + 7).map { it.opcode },
            )
            val fields = listOf("j:Ljava/lang/Integer;", "o:$TRAIL_ASK_LAYOUT", "l:Ljava/util/List;", "h:Ljava/util/List;")
            for ((k, register) in listOf(cut, ask, rows, blocks).withIndex()) {
                assertEquals(build.name, "$TRAIL_ENTRY->${fields[k]}", after[site.at + k].fieldRef().toString())
                assertEquals(build.name, listOf(register, site.self), after[site.at + k].namedRegisters())
            }
            assertEquals(build.name, LONG_POSTS_TRAIL_HOOK, after[site.at + 4].methodRef().toString())
            assertEquals(build.name, listOf(cut, ask, rows, blocks), after[site.at + 4].namedRegisters())
            assertEquals(build.name, listOf(cut), after[site.at + 5].namedRegisters())
            assertEquals(build.name, "$TRAIL_ENTRY->j:Ljava/lang/Integer;", after[site.at + 6].fieldRef().toString())
            assertEquals(build.name, listOf(cut, site.self), after[site.at + 6].namedRegisters())
            assertOnlyHook(clean, after, site.at)
            for (method in context.mutableClassDefBy(TRAIL_ENTRY).methods) {
                val key = method.toString()
                if (key in others) assertEquals("${build.name}: keep $key", others.getValue(key), method.instructionList().map(::fingerprint))
            }
            assertFlag(context, "longTrailRows", 1)
            assertFlag(context, "longPostRows", 1)
            assertFlag(context, "collapseLongPosts", 1)
        }
    }

    @Test fun `an entry that no longer reads its cut right after building its rows stays whole`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val site = context.resolveTrailSite(patch)
            site.method.addInstructions(site.at, "const/4 v${site.free[0]}, 0x0")
            assertSkipped(context, site.method.toString(), "no longer reads its author's cut right after building its rows")
        }
    }

    @Test fun `an entry with no locals free for the hook stays whole`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val site = context.resolveTrailSite(patch)
            // Past the cut test, three of the free locals are read, which leaves fewer than four.
            val read = site.free.take(3).joinToString { "v$it" }
            site.method.addInstructions(site.at + 2, "invoke-static { $read }, Lhush/Probe;->reads(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V")
            assertSkipped(context, site.method.toString(), "local register(s) up to v15 that nothing reads")
        }
    }

    @Test fun `an entry that sets its cut again after reading it stays whole`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val site = context.resolveTrailSite(patch)
            site.method.addInstructions(site.at + 2, "iput-object v${site.free[0]}, v${site.self}, $TRAIL_ENTRY->j:Ljava/lang/Integer;")
            assertSkipped(context, site.method.toString(), "sets its cut again after reading it")
        }
    }

    @Test fun `an entry whose code can jump straight to the read of its cut stays whole`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val site = context.resolveTrailSite(patch)
            val parameter = site.method.implementation!!.registerCount - 1
            site.method.addInstructionsWithLabels(
                0,
                "if-eqz v$parameter, :hush_read",
                ExternalLabel("hush_read", site.method.getInstruction(site.at)),
            )
            assertSkipped(context, site.method.toString(), "can jump straight to the reblog trail entry's read of its cut")
        }
    }

    private fun assertSkipped(context: BytecodePatchContext, key: String, reason: String) {
        val method = context.mutableClassDefBy(TRAIL_ENTRY).methods.single { it.toString() == key }
        val body = method.instructionList().map(::fingerprint)
        val warnings = PatchLogCapture.warnings { collapseLongPostsPatch.execute(context) }
        assertTrue(warnings.toString(), warnings.any { reason in it && it.endsWith("so long reblog trail entries stay whole") })
        assertEquals(body, method.instructionList().map(::fingerprint))
        assertFlag(context, "longTrailRows", 0)
        // The post's own rows still collapse.
        assertFlag(context, "longPostRows", 1)
        assertFlag(context, "collapseLongPosts", 1)
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
        val cleanIndex = changed.indices.filter { it !in at until at + 7 }.withIndex().associate { (k, index) -> index to k }
        assertEquals(clean.prints, cleanIndex.keys.sorted().map { fingerprint(changed[it]) })
        for ((index, k) in cleanIndex) if (changed[index] is OffsetInstruction) {
            assertEquals("Tumblr's branch at $k", clean.targets.getValue(k), cleanIndex[target(changed, index)])
        }
    }

    private fun assertFlag(context: BytecodePatchContext, flag: String, expected: Int) {
        assertEquals(flag, expected, (context.mutableClassDefBy(SETTINGS_STATUS).methods.single {
            it.name == flag }.instructionList().first() as NarrowLiteralInstruction).narrowLiteral)
    }
}
