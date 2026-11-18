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
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test
import org.junit.experimental.categories.Category

/** The base closeup module, whose updatePin every section of a pin page passes through. */
@Category(FixtureTests::class)
class HidePinSectionsFixtureTest {
    private class Case(val patch: BytecodePatch, val hook: String, val status: String, val capability: String)

    private val cases = listOf(
        Case(hidePinDescriptionPatch, PIN_DESCRIPTION_HOOK, "hidePinDescription", "pinDescription"),
        Case(hidePinAuthorPatch, PIN_AUTHOR_HOOK, "hidePinAuthor", "pinAuthor"),
    )

    private fun update(owner: ClassDef): Method = owner.methods.single { it.name == "updatePin" && it.parameterTypes.size == 1 }

    private fun ask(body: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>) = body.indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == CLOSEUP_SHOULD_SHOW
    }

    @Test
    fun `each declared APK runs the module's answer through both hooks before it branches`() {
        for (build in Fixtures.declaredBuilds()) {
            val module = FixtureDex.classes(build, setOf(CLOSEUP_MODULE)).values.single()
            val context = PatchContexts.of(ExtensionDex.classes() + module)
            for (case in cases) case.patch.execute(context)
            for (case in cases) {
                assertEquals("${build.name}: ${case.status}", 1, PinPageKit.flag(context, case.status))
                assertEquals("${build.name}: ${case.capability}", 1, PinPageKit.flag(context, case.capability))
            }

            val stock = update(module)
            val was = stock.instructions()
            val at = ask(was)
            val answer = (was[at + 1] as OneRegisterInstruction).registerA
            val self = stock.implementation!!.registerCount - 2
            val body = PinPageKit.patched(context, stock)
            assertEquals(build.name, was.take(at + 2).map { it.opcode }, body.take(at + 2).map { it.opcode })
            val added = body.subList(at + 2, at + 6)
            assertEquals(
                "${build.name}: both hooks, each on the module and the answer",
                setOf(PIN_DESCRIPTION_HOOK, PIN_AUTHOR_HOOK),
                setOf(PinPageKit.target(added[0]), PinPageKit.target(added[2])),
            )
            for (index in listOf(0, 2)) {
                val call = added[index] as FiveRegisterInstruction
                assertEquals(build.name, Opcode.INVOKE_STATIC, added[index].opcode)
                assertEquals(build.name, listOf(self, answer), listOf(call.registerC, call.registerD))
                assertEquals(build.name, Opcode.MOVE_RESULT, added[index + 1].opcode)
                assertEquals(build.name, answer, (added[index + 1] as OneRegisterInstruction).registerA)
            }
            assertEquals(
                "${build.name}: Pinterest's own branch and the rest follow",
                PinPageKit.kinds(was.drop(at + 2)),
                PinPageKit.kinds(body.drop(at + 6)),
            )
        }
    }

    @Test
    fun `a missing module or status stub refuses with nothing changed`() {
        val build = Fixtures.declaredBuilds().last()
        val module = FixtureDex.classes(build, setOf(CLOSEUP_MODULE)).values.single()
        for (case in cases) {
            val inputs = linkedMapOf(
                "no closeup module" to ExtensionDex.classes(),
                "no ${case.status} stub" to PinPageKit.extensionWithout(case.status) + module,
                "no ${case.capability} stub" to PinPageKit.extensionWithout(case.capability) + module,
            )
            for ((reason, input) in inputs) {
                val context = PatchContexts.of(input)
                assertThrows(reason, PatchException::class.java) { case.patch.execute(context) }
                assertEquals("$reason left the flag set", 0, PinPageKit.flagOrZero(context, case.status))
                assertEquals("$reason left the capability set", 0, PinPageKit.flagOrZero(context, case.capability))
                if (input.any { it.type == CLOSEUP_MODULE }) {
                    assertEquals(reason, update(module).instructions().map { it.opcode },
                        PinPageKit.patched(context, update(module)).map { it.opcode })
                }
            }
        }
    }
}
