/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.pinch

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.media.taptoplay.FRAGMENT_ACTIVITY
import app.morphe.patches.facebook.media.taptoplay.touchDispatches
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Pinch to zoom's two hooks on every Facebook build the bundle declares: FbFragmentActivity's one
 * touch dispatch and ProfileFragment's one onViewCreated(View, Bundle). Then the patch itself, run
 * on those classes, with each call first and reading the registers the method keeps its arguments
 * in, and the touch call's yes returning true ahead of Facebook's own code. Reads the fixture
 * bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class PinchToZoomFixtureTest {
    private val Instruction.call: MethodReference?
        get() = (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun Instruction.registers(): List<Int> = when (this) {
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        else -> emptyList()
    }

    @Test
    fun `each declared build has both hooks once, and the patch puts each call first`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (fixture in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = fixture.name
                val classes = FixtureDex.classes(fixture, setOf(FRAGMENT_ACTIVITY, PROFILE_FRAGMENT))
                assertEquals("$name: classes missing", emptySet<String>(),
                    setOf(FRAGMENT_ACTIVITY, PROFILE_FRAGMENT) - classes.keys)
                val activity = classes.getValue(FRAGMENT_ACTIVITY)
                val fragment = classes.getValue(PROFILE_FRAGMENT)
                assertEquals("$name: touch dispatches", 1, touchDispatches(activity).size)
                assertEquals("$name: profile onViewCreated", 1, profileViewCreated(fragment).size)

                val context = PatchContexts.of(listOf(activity, fragment, ExtensionDex.classDef(SETTINGS_STATUS)))
                pinchToZoomPatch.execute(context)
                fun patched(method: Method) = context.mutableClassDefBy(method.definingClass).methods.single {
                    it.name == method.name && it.returnType == method.returnType &&
                        it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
                }

                // Every touch goes to the extension with the screen and the event. A yes returns
                // true there, in v0, which nothing holds yet; a no goes on to Facebook's own first
                // instruction, which hands the event on.
                val original = touchDispatches(activity).single()
                val dispatch = patched(original)
                val touch = dispatch.implementation!!.instructions.toList()
                assertEquals("$name: the pinch hook", PINCH_TOUCH, touch[0].call.toString())
                assertEquals("$name: the pinch hook's registers",
                    listOf(dispatch.localRegisterCount(), dispatch.localRegisterCount() + 1), touch[0].registers())
                assertTrue("$name: no local to borrow", dispatch.localRegisterCount() >= 1)
                assertEquals("$name: the answer", Opcode.MOVE_RESULT, touch[1].opcode)
                assertEquals("$name: the answer's register", 0, (touch[1] as OneRegisterInstruction).registerA)
                assertEquals("$name: the yes test", Opcode.IF_EQZ, touch[2].opcode)
                assertEquals("$name: the yes test's register", 0, (touch[2] as OneRegisterInstruction).registerA)
                assertSame("$name: a no doesn't go on to Facebook's code", touch[4],
                    (touch[2] as BuilderOffsetInstruction).target.location.instruction)
                assertEquals("$name: a yes doesn't return", Opcode.RETURN, touch[3].opcode)
                assertEquals("$name: a yes doesn't return the answer", 0, (touch[3] as OneRegisterInstruction).registerA)
                assertEquals("$name: dispatchTouchEvent lost its own code",
                    original.implementation!!.instructions.map { it.opcode }, touch.drop(4).map { it.opcode })
                assertTrue("$name: dispatchTouchEvent still hands the event on",
                    touch.drop(4).any { it.call?.name == "dispatchTouchEvent" })

                // The profile's root view, p1, goes to the extension before the fragment builds on it.
                val created = patched(profileViewCreated(fragment).single())
                val setup = created.implementation!!.instructions.toList()
                assertEquals("$name: the profile hook", PINCH_PROFILE, setup[0].call.toString())
                assertEquals("$name: the profile hook's register", listOf(created.localRegisterCount() + 1), setup[0].registers())
                assertEquals("$name: onViewCreated keeps its own code",
                    profileViewCreated(fragment).single().implementation!!.instructions.count() + 1, setup.size)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
