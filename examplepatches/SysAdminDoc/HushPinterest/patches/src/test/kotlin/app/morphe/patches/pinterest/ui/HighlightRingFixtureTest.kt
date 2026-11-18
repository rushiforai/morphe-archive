/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** The education ring, which only shows through the method that places it. */
@Category(FixtureTests::class)
class HighlightRingFixtureTest {
    private fun place(owner: ClassDef): Method = owner.methods.single { it.parameters() == listOf("I", "I", "[I") }

    @Test
    fun `each declared APK asks before placing the ring and the placement is what shows it`() {
        for (build in Fixtures.declaredBuilds()) {
            val owner = FixtureDex.classes(build, setOf(EDUCATION_PULSAR)).values.single()
            val stock = place(owner)
            val shows = stock.instructions().mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name }
            assertTrue("${build.name}: the placement makes the ring visible", "setVisibility" in shows)
            val context = PatchContexts.of(ExtensionDex.classes() + owner)
            hideHighlightRingPatch.execute(context)
            for (flag in listOf("hideHighlightRing", "highlightRing")) assertEquals("${build.name}: $flag", 1, PinPageKit.flag(context, flag))

            val body = PinPageKit.patched(context, stock)
            assertEquals(build.name, HIGHLIGHT_RING_HOOK, PinPageKit.target(body[0]))
            assertEquals(build.name, Opcode.MOVE_RESULT, body[1].opcode)
            assertEquals(build.name, Opcode.IF_EQZ, body[2].opcode)
            assertEquals(build.name, (body[1] as OneRegisterInstruction).registerA, (body[2] as OneRegisterInstruction).registerA)
            assertEquals(build.name, Opcode.RETURN_VOID, body[3].opcode)
            assertEquals("${build.name}: Pinterest's placement follows", PinPageKit.kinds(stock.instructions()), PinPageKit.kinds(body.drop(4)))
        }
    }

    @Test
    fun `a missing ring or status stub refuses with nothing changed`() {
        val owner = FixtureDex.classes(Fixtures.declaredBuilds().last(), setOf(EDUCATION_PULSAR)).values.single()
        val inputs = linkedMapOf(
            "no ring" to ExtensionDex.classes(),
            "no hideHighlightRing stub" to PinPageKit.extensionWithout("hideHighlightRing") + owner,
            "no highlightRing stub" to PinPageKit.extensionWithout("highlightRing") + owner,
        )
        for ((reason, input) in inputs) {
            val context = PatchContexts.of(input)
            assertThrows(reason, PatchException::class.java) { hideHighlightRingPatch.execute(context) }
            assertEquals(reason, 0, PinPageKit.flagOrZero(context, "hideHighlightRing"))
            assertEquals(reason, 0, PinPageKit.flagOrZero(context, "highlightRing"))
            if (input.any { it.type == EDUCATION_PULSAR }) {
                assertEquals(reason, place(owner).instructions().map { it.opcode }, PinPageKit.patched(context, place(owner)).map { it.opcode })
            }
        }
    }
}
