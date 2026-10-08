/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.bottomtabbar

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * The bottom tab bar's scroll-away on every Facebook build the bundle declares: the one check the
 * main screen's start asks before it builds the bar's scroll-away entry, the bar's position check
 * inside it (the class's own Activity check that reads the TriState override), and room for the
 * hook's one register. Then the patch on that class: the extension right after the position check
 * passes, its yes returned, its no going on to Facebook's next instruction, and nothing else in the
 * method moved. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class TabBarScrollAwayFixtureTest {
    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    private fun declaredBundles(): Map<String, List<File>> {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        return versions.associateWith { version -> Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") } }
    }

    private fun Method.sameAs(other: MethodReference) = name == other.name && returnType == other.returnType &&
        parameterTypes.map(CharSequence::toString) == other.parameterTypes.map(CharSequence::toString)

    private fun Instruction.calls() = ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()

    @Test
    fun `each declared build gates the bar's scroll-away once, and the extension goes after the position check`() {
        val checked = mutableSetOf<String>()
        for ((version, bundles) in declaredBundles()) {
            for (bundle in bundles) {
                val name = bundle.name
                val holders = FixtureDex.classesHolding(bundle, BOTTOM_TABS_CONTAINER).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
                assertTrue("$name: nothing loads \"$BOTTOM_TABS_CONTAINER\"", holders.isNotEmpty())
                val gateReference = scrollAwayGate(holders)
                val gateClass = FixtureDex.classes(bundle, setOf(gateReference.definingClass)).values.single()
                val gate = gateClass.methods.single { it.sameAs(gateReference) }
                assertEquals("$name: the check takes the Activity and answers a boolean", listOf(ACTIVITY),
                    gate.parameterTypes.map(CharSequence::toString))

                val at = barAtBottomCheck(gate, gateClass)
                val original = gate.code()
                val position = original[at - 3]
                val positionCheck = gateClass.methods.single {
                    it.sameAs((position as ReferenceInstruction).reference as MethodReference)
                }
                assertTrue("$name: the position check doesn't read Facebook's override",
                    positionCheck.code().any { it.calls()?.startsWith(FB_SHARED_PREFERENCES) == true && it.calls()!!.endsWith(TRI_STATE) })
                assertEquals("$name: the branch that leaves when the bar isn't at the bottom", Opcode.IF_EQZ, original[at - 1].opcode)
                // The hook borrows one register, a local: this and the Activity are the two parameter registers.
                assertTrue("$name: ${gate.definingClass}->${gate.name} has no local register for the hook",
                    gate.implementation!!.registerCount - 2 >= 1)

                val context = PatchContexts.of(FixtureDex.classes(bundle, holders.map { it.type }.toSet() + gateClass.type).values)
                tabBarScrollAwayPatch.execute(context)
                val patched = context.mutableClassDefBy(gateClass.type).methods.single { it.sameAs(gateReference) }.code()
                val where = "$name: ${gate.definingClass}->${gate.name}"
                assertEquals("$where gains four instructions", original.size + 4, patched.size)
                assertEquals("$where: Facebook's code up to the position check stays", original.take(at).map { it.opcode },
                    patched.take(at).map { it.opcode })
                assertEquals("$where: the extension is asked", Opcode.INVOKE_STATIC, patched[at].opcode)
                assertEquals("$where: the extension is asked", SLIDES_AWAY, patched[at].calls())
                assertEquals("$where: its answer is kept", Opcode.MOVE_RESULT, patched[at + 1].opcode)
                val register = (patched[at + 1] as OneRegisterInstruction).registerA
                assertTrue("$where: the hook writes v$register, which isn't a local", register < gate.localRegisterCount())
                assertEquals("$where: a no goes on to Facebook", Opcode.IF_EQZ, patched[at + 2].opcode)
                assertEquals("$where: a no goes on to Facebook", register, (patched[at + 2] as OneRegisterInstruction).registerA)
                assertEquals("$where: a yes is returned", Opcode.RETURN, patched[at + 3].opcode)
                assertEquals("$where: a yes is returned", register, (patched[at + 3] as OneRegisterInstruction).registerA)
                assertEquals("$where: Facebook's code after the hook stays", original.drop(at).map { it.opcode },
                    patched.drop(at + 4).map { it.opcode })

                val patchedMethod = context.mutableClassDefBy(gateClass.type).methods.single { it.sameAs(gateReference) }
                val flow = ControlFlow.of(patchedMethod)
                assertEquals("$where: a no lands on Facebook's next instruction", setOf(at + 3, at + 4),
                    flow.normal[at + 2].toSet())
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", declaredBundles().keys, checked)
    }
}
