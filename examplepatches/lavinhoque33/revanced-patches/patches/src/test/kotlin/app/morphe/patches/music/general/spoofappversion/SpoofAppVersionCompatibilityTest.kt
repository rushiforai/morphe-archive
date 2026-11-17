/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-16
 */

package app.morphe.patches.music.general.spoofappversion

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class SpoofAppVersionCompatibilityTest {
    @Test
    fun oldClientsKeepTheAcceptedReleasedBrowseVersion() {
        listOf("6.20.51", "6.29.59", "7.16.53").forEach {
            assertTrue(it, supportsSpoofAppVersion(it))
            assertEquals("8.04.51", spoofAppVersionTarget(it))
        }
    }

    @Test
    fun intermediateClientsKeepTheirExistingSpoofSupport() {
        listOf("7.17.52", "7.25.53", "8.00.51", "8.02.51").forEach {
            assertTrue(it, supportsSpoofAppVersion(it))
            assertEquals("8.05.50", spoofAppVersionTarget(it))
        }
    }

    @Test
    fun modernClientsKeepTheirExistingVersionGate() {
        listOf("8.03.00", "8.12.54", "8.28.54", "8.30.54", "9.15.51", "9.40.51", "9.45.51").forEach {
            assertFalse(it, supportsSpoofAppVersion(it))
        }
    }

    @Test
    fun legacyCompatibilityPreservesLyricsAndIgnoresStaleGeneralPreferences() {
        val method = ImmutableMethod(
            "LTest;", "browse", listOf(ImmutableMethodParameter("Ljava/lang/String;", emptySet(), null)),
            "Ljava/lang/String;", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
            MutableMethodImplementation(1),
        ).toMutable().apply {
            addInstructions(0, "const/4 p0, 0x0\nreturn-object p0")
            useLegacyBrowseVersion("8.04.51")
        }

        val code = method.implementation!!.instructions

        assertEquals(
            "getLyricsVersionOverride",
            code[0].getReference<MethodReference>()?.name,
        )
        assertEquals(Opcode.IF_NEZ, code[2].opcode)
        assertEquals("8.04.51", code[3].getReference<StringReference>()?.string)
        assertEquals(Opcode.RETURN_OBJECT, code[4].opcode)
    }
}
