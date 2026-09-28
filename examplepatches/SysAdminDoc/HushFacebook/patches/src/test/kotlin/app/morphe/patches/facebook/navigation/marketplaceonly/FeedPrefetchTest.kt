/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.marketplaceonly

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.shared.redexOriginalName
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue
import org.junit.Assert.*
import org.junit.Test

class FeedPrefetchTest {
    private val type = "Lfixture/FeedWarmup;"

    private fun screenTask(consumesFlag: Boolean = true, mainFeed: Boolean = true, runnable: Boolean = true,
                           name: String = SCREEN_ON_PREFETCH): ClassDef {
        val run = MutableMethod(ImmutableMethod(type, "run", emptyList(), "V", AccessFlags.PUBLIC.value,
            null, null, ImmutableMethodImplementation(5, emptyList(), null, null))).apply {
            addInstructionsWithLabels(0, """
                iget-object v0, p0, $type->pending:Ljava/util/concurrent/atomic/AtomicBoolean;
                const/4 v1, 0x1
                const/4 v2, ${if (consumesFlag) "0x0" else "0x1"}
                invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z
                move-result v0
                const-string v3, "ScreenOnFeedPrefetchOrchestrator"
                if-nez v0, :ready
                const-string v0, "skip_foreground_cancelled"
                invoke-static {v0}, Lfixture/Log;->info(Ljava/lang/String;)V
                return-void
                :ready
                invoke-static {}, Lfixture/State;->foreground()Z
                move-result v0
                if-nez v0, :done
                const-string v0, "${if (mainFeed) "main_feed" else "marketplace"}"
                const-string v1, "SUPPLEMENTAL_FETCH_SCREEN_ON"
                invoke-static {v0, v1}, Lfixture/Fetch;->start(Ljava/lang/String;Ljava/lang/String;)V
                :done
                return-void
            """)
        }
        val flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value
        return ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;",
            if (runnable) listOf("Ljava/lang/Runnable;") else emptyList(), null, null,
            listOf(ImmutableField(type, "__redex_internal_original_name", "Ljava/lang/String;", flags,
                ImmutableStringEncodedValue(name), null, null)), listOf(run))
    }

    @Test
    fun `a changed task or flag operation cannot receive a skip guard`() {
        assertNotNull(feedPrefetchGuard(screenTask()))
        assertNull(feedPrefetchGuard(screenTask(consumesFlag = false)))
        assertNull(feedPrefetchGuard(screenTask(mainFeed = false)))
        assertNull(feedPrefetchGuard(screenTask(runnable = false)))
        assertNull(feedPrefetchGuard(screenTask(name = "OtherPrefetchTask")))
        assertThrows(PatchException::class.java) {
            marketplaceFeedPrefetchPatch.execute(PatchContexts.of(listOf(screenTask())))
        }
    }

    private fun checkInjection(owner: ClassDef) {
        val guard = feedPrefetchGuard(owner)!!
        val mutable = MutableMethod(guard.method)
        val before = mutable.implementation!!.instructions.toList()
        mutable.guardFeedPrefetch(guard)
        val after = mutable.implementation!!.instructions.toList()
        assertEquals(before.size + 5, after.size)
        assertEquals(SKIP_FEED_PREFETCH, (after[guard.index] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.RETURN_VOID, after[guard.index + 3].opcode)
        assertEquals(before[guard.index].opcode, after[guard.index + 5].opcode)
        if (redexOriginalName(owner) != SCREEN_ON_PREFETCH) return
        val addresses = after.scan(0) { address, instruction -> address + instruction.codeUnits }
        val branch = guard.index - 4
        assertEquals(Opcode.IF_NEZ, after[branch].opcode)
        val target = addresses[branch] + (after[branch] as OffsetInstruction).codeOffset
        assertEquals("the cancellation branch must enter the guard", addresses[guard.index], target)
        val cas = guard.index - 7
        assertTrue((after[cas] as ReferenceInstruction).reference.toString().contains("compareAndSet(ZZ)Z"))
        assertEquals("the scheduler's flag cleanup must precede the guard", before[cas].opcode, after[cas].opcode)
        assertEquals(Opcode.RETURN_VOID, after[guard.index - 1].opcode)
    }

    @Test
    fun `the screen-on guard follows cleanup and receives the original branch`() = checkInjection(screenTask())

    @Test
    fun `both supported builds have exactly the two guarded feed warm-ups`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (fixture in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val owners = mutableListOf<ClassDef>()
                FixtureDex.forEach(fixture) { dex ->
                    if (dex.stringSection.none { it == STARTUP_PREFETCH || it == SCREEN_ON_PREFETCH }) return@forEach
                    for (owner in dex.classes) {
                        if (redexOriginalName(owner) in setOf(STARTUP_PREFETCH, SCREEN_ON_PREFETCH)) {
                            owners += ImmutableClassDef.of(owner)
                        }
                    }
                }
                assertEquals(fixture.name, setOf(STARTUP_PREFETCH, SCREEN_ON_PREFETCH), owners.map(::redexOriginalName).toSet())
                assertEquals(fixture.name, 2, owners.size)
                owners.forEach { assertNotNull(fixture.name, feedPrefetchGuard(it)); checkInjection(it) }
                val context = PatchContexts.of(owners)
                marketplaceFeedPrefetchPatch.execute(context)
                owners.forEach { owner ->
                    val run = context.mutableClassDefBy(owner).methods.single { it.name == "run" }
                    assertEquals(1, run.implementation!!.instructions.count {
                        (it as? ReferenceInstruction)?.reference?.toString() == SKIP_FEED_PREFETCH
                    })
                }
                checked += version
            }
        }
        assertEquals(versions, checked)
    }
}
