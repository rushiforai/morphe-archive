/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.seen

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.hook.feedFilterHookPatch
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Hide seen posts' anchor on every Facebook build the bundle declares: the viewport logger's one
 * persistSeenState, which loads its trace string and reads the unit's id through getCacheId, and
 * the one dwell runnable that calls it. Then the patch on that runnable: a range call to the
 * extension on the unit's register sits right after the dwell check's if-ltz, ahead of the News
 * Feed surface check, persistSeenState itself is untouched, and SettingsStatus says the patch is
 * in. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class HideSeenPostsFixtureTest {
    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    /**
     * The feed guard is what keeps a remembered post out, so the patch brings it. Picked on its own
     * without another feed patch, it used to remember posts and never hide one.
     */
    @Test
    fun `the patch brings the feed guard that hides what it remembers`() {
        assertTrue("Hide seen posts doesn't bring the feed guard", feedFilterHookPatch in hideSeenPostsPatch.dependencies)
    }

    private fun declaredBundles(): Map<String, List<File>> {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        return versions.associateWith { version -> Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") } }
    }

    @Test
    fun `each declared build hands the unit to the extension right after the dwell check, ahead of the News Feed skip`() {
        val checked = mutableSetOf<String>()
        for ((version, bundles) in declaredBundles()) {
            for (bundle in bundles) {
                val name = bundle.name
                val holders = FixtureDex.classesHolding(bundle, SEEN_TRACE).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
                val methods = holders.flatMap { holder -> holder.methods.filter(::isSeenMethod).map { holder to it } }
                assertEquals("$name: persistSeenState methods", 1, methods.size)
                val (holder, seen) = methods.single()
                val runnerHolders = FixtureDex.classesHolding(bundle, DWELL_TRACE).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
                val runners = runnerHolders.flatMap { runnerHolder ->
                    runnerHolder.methods.filter { isDwellRunner(it, seen) }.map { runnerHolder to it }
                }
                assertEquals("$name: dwell runnables calling persistSeenState", 1, runners.size)
                val (runnerHolder, runner) = runners.single()
                val gate = dwellGateIn(runner, seen)
                assertNotNull("$name: no dwell check before persistSeenState", gate)
                val original = runner.code()
                val seenSize = seen.code().size

                val context = PatchContexts.of(
                    listOf(holder, runnerHolder, ExtensionDex.classDef(SETTINGS_STATUS)).distinctBy { it.type },
                )
                hideSeenPostsPatch.execute(context)

                val patched = context.mutableClassDefBy(runner.definingClass).methods
                    .single { isDwellRunner(it, seen) }.code()
                assertEquals("$name: one instruction added", original.size + 1, patched.size)
                val call = patched[gate!!.index]
                assertEquals("$name: the dwell check comes first", Opcode.IF_LTZ, patched[gate.index - 1].opcode)
                assertEquals("$name: the added instruction", Opcode.INVOKE_STATIC_RANGE, call.opcode)
                assertEquals("$name: the call", SEEN,
                    ((call as ReferenceInstruction).reference as MethodReference).toString())
                val persist = original.first {
                    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == SEEN_METHOD
                } as FiveRegisterInstruction
                assertEquals("$name: the feed unit's register", persist.registerE, (call as RegisterRangeInstruction).startRegister)
                assertEquals("$name: one register handed over", 1, call.registerCount)
                assertEquals("$name: the News Feed surface check follows", original[gate.index].opcode, patched[gate.index + 1].opcode)
                assertEquals("$name: persistSeenState itself is untouched", seenSize,
                    context.mutableClassDefBy(seen.definingClass).methods.single { isSeenMethod(it) }.code().size)

                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "seenPosts" }
                assertEquals("$name: SettingsStatus.seenPosts() isn't switched on", 1,
                    (status.code()[0] as NarrowLiteralInstruction).narrowLiteral)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", declaredBundles().keys, checked)
    }
}
