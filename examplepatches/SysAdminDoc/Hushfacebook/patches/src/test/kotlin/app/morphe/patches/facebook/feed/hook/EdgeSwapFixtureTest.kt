/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.hook

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.shared.AddNewEdgeToCollectionFingerprint
import app.morphe.patches.facebook.shared.FEED_UNIT_EDGE
import app.morphe.patches.facebook.shared.redexOriginalName
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.RegisterLiveness
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

/**
 * The swap guard on every Facebook build the bundle declares: exactly one class holding the swap
 * runnable's log line answers the guard's rule, it's the runnable Redex names
 * FeedUnitCollectionManager$onEdgeSwapped$1, and the feed guard's patch, run on it with the edge and
 * the funnel's class, asks the extension right after the cast, on registers nothing reads, before
 * the swap, leaving the rest of run() as it was. Reads the fixture bundles from
 * HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class EdgeSwapFixtureTest {
    /** The fingerprint keeps its last match, and each build brings a context of its own. */
    @Before
    fun forgetTheLastMatch() = AddNewEdgeToCollectionFingerprint.clearMatch()

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private fun Instruction.call(): String? = ((this as? ReferenceInstruction)?.reference)?.toString()

    @Test
    fun `each declared build has one swap runnable, and the guard goes in before its swap`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                AddNewEdgeToCollectionFingerprint.clearMatch()
                val owners = FixtureDex.classesHolding(bundle, EDGE_SWAP_DROPPED)
                val guards = owners.mapNotNull(::swapGuard)
                assertEquals("$name: swap runnables among ${owners.map { it.type }}", 1, guards.size)
                val guard = guards.single()
                val owner = owners.single { it.type == guard.method.definingClass }
                assertEquals("$name: the Redex name", "FeedUnitCollectionManager\$onEdgeSwapped\$1", redexOriginalName(owner))

                val funnel = FixtureDex.classesHolding(bundle, "Edge not added to FUC")
                val edge = FixtureDex.classes(bundle, setOf(FEED_UNIT_EDGE)).values
                val context = PatchContexts.of(owners + funnel + edge)
                feedFilterHookPatch.execute(context)

                val before = guard.method.body()
                val run = context.mutableClassDefBy(owner.type).methods.single { it.name == "run" && it.parameterTypes.isEmpty() }
                val after = run.body()
                val added = after.subList(guard.index, guard.index + 8)
                assertEquals("$name: the guard", HIDE_SWAPPED_EDGE, added[4].call())
                assertEquals("$name: what it returns", Opcode.RETURN_VOID, added[7].opcode)
                assertEquals("$name: one guard", 1, after.count { it.call() == HIDE_SWAPPED_EDGE })
                val asked = (added[4] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) }
                val live = RegisterLiveness.of(guard.method).liveInto(guard.index)
                assertTrue("$name: the guard borrows $asked, which run() still reads: $live", asked.none { it in live } && asked.all { it <= 15 })
                assertEquals("$name: the rest of run()", before.map { it.opcode },
                    after.filterIndexed { index, _ -> index !in guard.index until guard.index + 8 }.map { it.opcode })
                val swap = after.indexOfFirst {
                    it.opcode.name.startsWith("invoke-interface") && it.call()?.endsWith("(${FEED_UNIT_EDGE}Ljava/lang/String;)V") == true
                }
                assertTrue("$name: the guard comes before the swap at $swap", swap > guard.index + 7)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
