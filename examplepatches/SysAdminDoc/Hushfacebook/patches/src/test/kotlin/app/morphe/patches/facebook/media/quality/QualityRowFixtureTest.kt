/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.quality

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The reels Quality row keeper (#286) on every declared Facebook build: the one callback taking
 * (format, String, List, long, boolean) that builds the "%dkbps, %dx%d, %s (%s)" summary is found
 * once, nothing jumps to its first instruction, and the hook goes in ahead of everything with the
 * callback's own object and its list, taking the list's place with the answer. A context without
 * the callback finds nothing, and so does a method of another shape. Reads the fixture bundles from
 * HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class QualityRowFixtureTest {
    private fun Instruction.registers(): List<Int> = when (this) {
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        else -> emptyList()
    }

    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    @Test
    fun `each declared build has the callback once, and the hook goes in at its top`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        var checked = 0
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val holders = FixtureDex.classesHolding(bundle, FORMAT_SUMMARY)
                val stores = holders.flatMap { it.methods }.filter(::isQualityListStore)
                assertEquals("$name: callbacks storing the quality labels", 1, stores.size)
                val store = stores.single()
                val original = store.code()

                // Nothing branches onto the first instruction, so a hook there runs on every path.
                val addresses = original.runningFold(0) { address, instruction -> address + instruction.codeUnits }
                val jumpsToStart = original.indices.count { index ->
                    val branch = original[index] as? OffsetInstruction ?: return@count false
                    addresses[index] + branch.codeOffset == 0
                }
                assertEquals("$name: branches onto the callback's first instruction", 0, jumpsToStart)

                // Negative control: without the callback's class there is nothing to find, and an
                // method of another shape is not taken for it.
                val without = PatchContexts.of(listOf(ExtensionDex.classDef(QUALITY_LIST)))
                assertTrue("$name: found a callback in a build without it", with(without) { findQualityListStore() }.isFailure)
                assertFalse("$name: a method of another shape is taken for the callback", ExtensionDex.classDef(QUALITY_LIST).methods.any(::isQualityListStore))

                val context = PatchContexts.of(holders + listOf(ExtensionDex.classDef(QUALITY_LIST)))
                val found = with(context) { findQualityListStore() }.getOrThrow()
                assertEquals("$name: the callback found", store.toString(), found.toString())
                with(context) { keepQualityRow(found) }
                val patched = context.mutableClassDefBy(store.definingClass).methods.single {
                    it.name == store.name && it.parameterTypes.map(CharSequence::toString) == store.parameterTypes.map(CharSequence::toString)
                }.implementation!!.instructions.toList()

                val self = store.localRegisterCount()
                val list = self + 3
                assertEquals("$name: the hook's call", Opcode.INVOKE_STATIC, patched[0].opcode)
                assertEquals("$name: the hook's callee", KEEP_LIST, ((patched[0] as ReferenceInstruction).reference).toString())
                assertEquals("$name: the hook hands over the player and the list", listOf(self, list), patched[0].registers())
                assertEquals("$name: the answer takes the list's place", Opcode.MOVE_RESULT_OBJECT to list,
                    patched[1].opcode to (patched[1] as OneRegisterInstruction).registerA)
                assertEquals("$name: the callback grew by the hook alone", original.count { it.opcode != Opcode.NOP } + 2,
                    patched.count { it.opcode != Opcode.NOP })
                assertEquals("$name: the stock code follows the hook", original.filter { it.opcode != Opcode.NOP }.map { it.opcode },
                    patched.drop(2).filter { it.opcode != Opcode.NOP }.map { it.opcode })
                checked++
            }
        }
        assertTrue("no fixture bundle was checked", checked > 0)
    }
}
