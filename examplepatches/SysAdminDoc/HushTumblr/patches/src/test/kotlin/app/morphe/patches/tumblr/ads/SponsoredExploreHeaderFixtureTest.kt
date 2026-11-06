/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ads

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.BytecodePatchContext
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

/** Explore's header, which a sponsor can pay to fill with its own image and takeover ad. */
@Category(FixtureTests::class)
class SponsoredExploreHeaderFixtureTest {
    // Tumblr 47.0.0.108's name for Explore's header presenter. The patch finds it by its log lines.
    private val presenter = "Lcom/tumblr/util/c;"

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, setOf(presenter)).values)

    @Test fun `the hook asks about the fetched header and on yes jumps to where a failed load ends`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val site = context.resolveExploreHeader("Hide ads")
            val before = site.method.instructionList().toList()
            val clean = Clean(before.map(::fingerprint), targets(before))
            assertEquals(build.name, Opcode.CHECK_CAST, before[site.at - 1].opcode)
            assertEquals(build.name, listOf(site.response), before[site.at].namedRegisters())
            assertEquals(build.name, listOf(RADAR_HEADER_RESPONSE), before[site.at].methodRef()!!.parameterTypes.map(CharSequence::toString))
            assertEquals(build.name, listOf(Opcode.SGET_OBJECT, Opcode.RETURN_OBJECT), before.subList(site.done, site.done + 2).map { it.opcode })
            assertTrue(build.name, site.scratch != site.response)
            val liveness = RegisterLiveness.of(site.method)
            assertTrue("${build.name}: the scratch is free where the hook goes", site.scratch !in liveness.liveInto(site.at))
            assertTrue("${build.name}: the scratch is free where a yes lands", site.scratch !in liveness.liveInto(site.done))
            val others = context.mutableClassDefBy(presenter).methods
                .filter { it.toString() != site.method.toString() }
                .associate { it.toString() to it.instructionList().map(::fingerprint) }

            val warnings = PatchLogCapture.warnings { hideAdsPatch.execute(context) }

            assertTrue(warnings.toString(), warnings.none { "Explore" in it })
            val after = site.method.instructionList()
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_NEZ), after.subList(site.at, site.at + 3).map { it.opcode })
            assertEquals(build.name, EXPLORE_HEADER_HOOK, after[site.at].methodRef().toString())
            assertEquals(build.name, listOf(site.response), after[site.at].namedRegisters())
            assertEquals(build.name, listOf(site.scratch), after[site.at + 1].namedRegisters())
            assertEquals(build.name, listOf(site.scratch), after[site.at + 2].namedRegisters())
            assertEquals("a yes lands on Tumblr's end", site.done + 3, target(after, site.at + 2))
            assertOnlyHook(clean, after, site.at)
            for (method in context.mutableClassDefBy(presenter).methods) {
                val key = method.toString()
                if (key in others) assertEquals("${build.name}: keep $key", others.getValue(key), method.instructionList().map(::fingerprint))
            }
            assertFlag(context, 1)
        }
    }

    @Test fun `a header no longer handed straight to its model call leaves the presenter as it was`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val site = context.resolveExploreHeader("Hide ads")
            site.method.addInstructions(site.at, "const/4 v${site.scratch}, 0x0")
            assertSkipped(context, site, "no longer hands the radar header straight to one static call")
        }
    }

    @Test fun `a presenter with no local free for the answer leaves it as it was`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val site = context.resolveExploreHeader("Hide ads")
            // Read the only free local right after the model call, so the answer has nowhere to go.
            site.method.addInstructions(site.at + 2, "invoke-static { v${site.scratch} }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;")
            assertSkipped(context, site, "local register(s) up to v255 that nothing reads")
        }
    }

    @Test fun `a presenter that no longer jumps to its end leaves it as it was`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val site = context.resolveExploreHeader("Hide ads")
            val body = site.method.instructionList()
            site.method.removeInstruction((site.at until body.size).first { body[it].opcode == Opcode.GOTO })
            assertSkipped(context, site, "no longer jumps to its end after drawing the header")
        }
    }

    @Test fun `a failed load that no longer ends where the drawn header does leaves the presenter as it was`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val site = context.resolveExploreHeader("Hide ads")
            val failed = site.method.instructionList().indexOfFirst { it.stringRef() == EXPLORE_HEADER_FAILED }
            site.method.addInstructions(failed + 1, "const/4 v${site.scratch}, 0x0\nreturn-object v${site.scratch}")
            assertSkipped(context, site, "failed-load path no longer ends where the drawn header does")
        }
    }

    private fun assertSkipped(context: BytecodePatchContext, site: ExploreHeaderSite, reason: String) {
        val body = site.method.instructionList().map(::fingerprint)
        val warnings = PatchLogCapture.warnings { hideAdsPatch.execute(context) }
        assertTrue(warnings.toString(), warnings.any { reason in it && it.endsWith("so Explore's sponsored header stays") })
        assertEquals(body, site.method.instructionList().map(::fingerprint))
        assertFlag(context, 0)
        // The rest of Hide ads still goes on.
        for (flag in listOf("timelineAds", "paidPostHeader", "hideAds")) assertFlag(context, 1, flag)
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
        val cleanIndex = changed.indices.filter { it !in at until at + 3 }.withIndex().associate { (k, index) -> index to k }
        assertEquals(clean.prints, cleanIndex.keys.sorted().map { fingerprint(changed[it]) })
        for ((index, k) in cleanIndex) if (changed[index] is OffsetInstruction) {
            assertEquals("Tumblr's branch at $k", clean.targets.getValue(k), cleanIndex[target(changed, index)])
        }
    }

    private fun assertFlag(context: BytecodePatchContext, expected: Int, flag: String = "exploreHeaderAd") {
        assertEquals(flag, expected, (context.mutableClassDefBy(SETTINGS_STATUS).methods.single {
            it.name == flag }.instructionList().first() as NarrowLiteralInstruction).narrowLiteral)
    }
}
