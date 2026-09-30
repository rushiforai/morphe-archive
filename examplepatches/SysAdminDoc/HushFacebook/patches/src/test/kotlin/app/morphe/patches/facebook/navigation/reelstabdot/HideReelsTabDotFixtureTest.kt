/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.reelstabdot

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Hide the Reels tab dot's anchor on every Facebook build the bundle declares: the jewel
 * controller's count, the one static (FbUserSession, controller, TabTag, int) -> int method loading
 * its log name. Then the patch on its class: the extension first, handed the tab, its yes returning
 * 0 and anything else jumping to Facebook's own first instruction. Reads the fixture bundles from
 * HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class HideReelsTabDotFixtureTest {
    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    private fun declaredBundles(): Map<String, List<File>> {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        return versions.associateWith { version -> Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") } }
    }

    private fun List<Instruction>.target(index: Int): Int {
        var address = 0
        val addresses = map { instruction -> address.also { address += instruction.codeUnits } }
        return addresses.indexOf(addresses[index] + (this[index] as OffsetInstruction).codeOffset)
    }

    @Test
    fun `each declared build has the count once, and the extension goes first in it`() {
        val checked = mutableSetOf<String>()
        for ((version, bundles) in declaredBundles()) {
            for (bundle in bundles) {
                val name = bundle.name
                val holders = FixtureDex.classesHolding(bundle, JEWEL_COUNT).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
                val counts = holders.flatMap { holder -> holder.methods.filter(::isJewelCount) }
                assertEquals("$name: jewel counts loading \"$JEWEL_COUNT\"", 1, counts.size)
                val count = counts.single()
                val original = count.code()
                val holder = holders.single { it.type == count.definingClass }

                val context = PatchContexts.of(listOf(holder, ExtensionDex.classDef(SETTINGS_STATUS)))
                hideReelsTabDotPatch.execute(context)

                val patched = context.mutableClassDefBy(count.definingClass).methods.single { it.name == count.name && isJewelCount(it) }.code()
                val first = patched[0]
                assertEquals("$name: the count's first instruction", Opcode.INVOKE_STATIC_RANGE, first.opcode)
                assertEquals("$name: the count's first call", CLEAR, ((first as ReferenceInstruction).reference as MethodReference).toString())
                assertEquals("$name: the register handed over is the tab", count.localRegisterCount() + 2,
                    (first as RegisterRangeInstruction).startRegister)
                assertEquals("$name: one register handed over", 1, first.registerCount)
                assertEquals("$name: the yes branch", Opcode.IF_EQZ, patched[2].opcode)
                assertEquals("$name: a no runs Facebook's first instruction", 5, patched.target(2))
                assertEquals("$name: the yes answers 0", 0, (patched[3] as NarrowLiteralInstruction).narrowLiteral)
                assertEquals("$name: the yes returns", Opcode.RETURN, patched[4].opcode)
                assertEquals("$name: Facebook's count is kept after the hook", original.size + 5, patched.size)

                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "reelsTabDot" }
                assertEquals("$name: SettingsStatus.reelsTabDot() isn't switched on", 1,
                    (status.code()[0] as NarrowLiteralInstruction).narrowLiteral)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", declaredBundles().keys, checked)
    }
}
