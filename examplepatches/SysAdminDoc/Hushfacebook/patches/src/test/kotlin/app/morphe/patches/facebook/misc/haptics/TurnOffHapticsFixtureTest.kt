/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.haptics

import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Turn off haptics on every Facebook build the bundle declares: every View haptic call is one the
 * patch can send, none goes through a subclass reference it would miss, and the vibrator's effect
 * calls are there to send too. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips
 * without it.
 */
class TurnOffHapticsFixtureTest {
    private fun hapticCalls(method: Method) = (method.implementation?.instructions ?: emptyList()).mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf { call ->
            call.name == "performHapticFeedback" && call.returnType == "Z"
        }
    }

    @Test
    fun `each declared build sends every View haptic and the vibrator effects`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val callers = FixtureDex.methodsWhere(bundle, { true }) { hapticCalls(it).isNotEmpty() }
                val calls = callers.flatMap(::hapticCalls)
                assertTrue("${bundle.name}: ${calls.size} haptic calls", calls.size > 40)
                assertEquals(
                    "${bundle.name}: haptic calls on another class the patch would miss",
                    emptyList<String>(),
                    calls.filter { it.definingClass != VIEW }.map { "${it.definingClass}->${it.name}" }.distinct(),
                )
                val vibrations = FixtureDex.methodsWhere(bundle, { true }) { method ->
                    method.implementation?.instructions?.any { vibrateCall(it) != null } == true
                }.sumOf { method -> method.implementation!!.instructions.count { vibrateCall(it) != null } }
                assertTrue("${bundle.name}: $vibrations vibrator effect calls", vibrations > 20)
                println("${bundle.name}: ${calls.size} View haptic calls, $vibrations vibrator effect calls")
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
