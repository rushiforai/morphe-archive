/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.privacy

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.stringRef
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import app.morphe.util.RegisterLiveness
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

/** The one place Tumblr builds a shared or copied link and appends source=share to it. */
@Category(FixtureTests::class)
class SanitizeSharingLinksFixtureTest {
    // Tumblr 47.0.0.108's name for the class holding the link builder. The patch finds it by its shape.
    private val builder = "Lokj;"

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, setOf(builder)).values)

    @Test fun `the hook asks before the tag goes on and on yes jumps to the untagged link`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val site = context.resolveShareLink("Sanitize sharing links")
            val before = site.method.instructionList().toList()
            val clean = Clean(before.map(::fingerprint), targets(before))
            assertEquals(build.name, SHARE_TAG_NAME, before[site.at].stringRef())
            assertEquals(build.name, SHARE_TAG_VALUE, before[site.at + 1].stringRef())
            assertEquals(build.name, "appendQueryParameter", before[site.at + 2].methodRef()!!.name)
            // The handler reads the link the same way the tagged path did, and both hand it on together.
            val read = before.indexOfFirst { it.methodRef()?.toString() == before[site.untagged].methodRef()?.toString() }
            assertTrue(build.name, read in 0 until site.at)
            assertEquals(build.name, before[read].namedRegisters(), before[site.untagged].namedRegisters())
            assertEquals(build.name, Opcode.GOTO, before[site.untagged - 1].opcode)
            assertEquals(build.name, site.untagged + 2, target(before, site.untagged - 1))
            val liveness = RegisterLiveness.of(site.method)
            assertTrue("${build.name}: the scratch is free where the hook goes", site.scratch !in liveness.liveInto(site.at))
            assertTrue("${build.name}: the scratch is free where a yes lands", site.scratch !in liveness.liveInto(site.untagged))
            val others = context.mutableClassDefBy(builder).methods
                .filter { it.toString() != site.method.toString() }
                .associate { it.toString() to it.instructionList().map(::fingerprint) }

            sanitizeSharingLinksPatch.execute(context)

            val after = site.method.instructionList()
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_NEZ), after.subList(site.at, site.at + 3).map { it.opcode })
            assertEquals(build.name, SHARE_TAG_HOOK, after[site.at].methodRef().toString())
            assertEquals(build.name, listOf(site.scratch), after[site.at + 1].namedRegisters())
            assertEquals(build.name, listOf(site.scratch), after[site.at + 2].namedRegisters())
            assertEquals("a yes lands on the handler's link read", site.untagged + 3, target(after, site.at + 2))
            assertOnlyHook(clean, after, site.at)
            for (method in context.mutableClassDefBy(builder).methods) {
                val key = method.toString()
                if (key in others) assertEquals("${build.name}: keep $key", others.getValue(key), method.instructionList().map(::fingerprint))
            }
            assertFlags(context, 1)
        }
    }

    @Test fun `a builder that changed shape is refused with the link left as it was`() {
        val faults = mapOf<String, (ShareLinkSite) -> Unit>(
            "no longer appends source=share in one call" to { site -> site.method.addInstructions(site.at + 2, "nop") },
            "handler no longer reads the link again" to { site ->
                site.method.replaceInstruction(site.untagged, "invoke-virtual { p0 }, Ljava/lang/Object;->toString()Ljava/lang/String;")
            },
            "tagged and untagged links no longer meet at one step" to { site ->
                site.method.replaceInstruction(site.untagged - 2, "move-result-object v${site.scratch}")
            },
            // Read both spare locals right after the paths meet, so the answer has nowhere to go. Inserting at the
            // join itself would leave Tumblr's goto landing past the read, a different refusal.
            "local register(s) up to v255 that nothing reads" to { site ->
                site.method.addInstructions(site.untagged + 3,
                    "invoke-static { v1, v2 }, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z")
            },
        )
        for (build in Fixtures.declaredBuilds()) for ((reason, fault) in faults) {
            val context = context(build)
            val site = context.resolveShareLink("Sanitize sharing links")
            fault(site)
            val body = site.method.instructionList().map(::fingerprint)
            val refused = assertThrows(PatchException::class.java) { sanitizeSharingLinksPatch.execute(context) }
            assertTrue("${build.name}: ${refused.message}", reason in refused.message!!)
            assertEquals(body, site.method.instructionList().map(::fingerprint))
            assertFlags(context, 0)
        }
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

    private fun assertFlags(context: BytecodePatchContext, expected: Int) {
        for (flag in listOf("shareLinkTag", "sanitizeSharingLinks")) assertEquals(flag, expected,
            (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.instructionList().first() as NarrowLiteralInstruction).narrowLiteral)
    }
}
