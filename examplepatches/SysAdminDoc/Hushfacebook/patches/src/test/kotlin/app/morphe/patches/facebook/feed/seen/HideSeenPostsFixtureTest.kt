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
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Hide seen posts' anchor on every Facebook build the bundle declares: the viewport logger's one
 * persistSeenState, which loads its trace string and reads the unit's id through getCacheId. Then
 * the patch on that method: a range call to the extension on the feed unit's own register is the
 * first instruction, with the original first instruction right behind it, and SettingsStatus says
 * the patch is in. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
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
    fun `each declared build has one persistSeenState and the unit goes to the extension on its own register`() {
        val checked = mutableSetOf<String>()
        for ((version, bundles) in declaredBundles()) {
            for (bundle in bundles) {
                val name = bundle.name
                val holders = FixtureDex.classesHolding(bundle, SEEN_TRACE).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
                val methods = holders.flatMap { holder -> holder.methods.filter(::isSeenMethod).map { holder to it } }
                assertEquals("$name: persistSeenState methods", 1, methods.size)
                val (holder, seen) = methods.single()
                val original = seen.code()
                val registers = seen.implementation!!.registerCount
                // this, the session and the feed unit: the unit is the last register.
                val unitRegister = registers - 1

                val context = PatchContexts.of(listOf(holder, ExtensionDex.classDef(SETTINGS_STATUS)))
                hideSeenPostsPatch.execute(context)

                val patched = context.mutableClassDefBy(seen.definingClass).methods
                    .single { it.name == seen.name && isSeenMethod(it) }.code()
                assertEquals("$name: one instruction added", original.size + 1, patched.size)
                val call = patched[0]
                assertEquals("$name: the first instruction", Opcode.INVOKE_STATIC_RANGE, call.opcode)
                assertEquals("$name: the call", SEEN,
                    ((call as ReferenceInstruction).reference as MethodReference).toString())
                assertEquals("$name: the feed unit's register", unitRegister, (call as RegisterRangeInstruction).startRegister)
                assertEquals("$name: one register handed over", 1, call.registerCount)
                assertEquals("$name: the original first instruction follows", original[0].opcode, patched[1].opcode)

                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "seenPosts" }
                assertEquals("$name: SettingsStatus.seenPosts() isn't switched on", 1,
                    (status.code()[0] as NarrowLiteralInstruction).narrowLiteral)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", declaredBundles().keys, checked)
    }
}
