/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-13.
 */
package app.morphe.patches.music.interaction.crossfade

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Test

class NativeBoundaryDiscoveryTest {
    private val setter = "$EXO_PLAYER_TYPE->volume(F)V"

    private fun method(body: String, registers: Int = 5) = ImmutableMethod(
        "LCoordinator;", "volume", listOf(ImmutableMethodParameter("F", null, null)), "V",
        AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(registers),
    ).toMutable().apply { addInstructions(0, body) }

    @Test fun normalizationCacheIsNotTheLaterUserVolumeField() {
        val native = method("""
            iget v1, p0, LCoordinator;->normalization:F
            invoke-interface {v0, v1}, $setter
            iput v1, p0, LCoordinator;->normalization:F
            iput p1, p0, LCoordinator;->userVolume:F
            return-void
        """)
        assertEquals("LCoordinator;->normalization:F", native.discoverNormalizationField("volume").toString())
    }

    @Test fun compactNativeSetterCanStoreTheParameterDirectly() {
        val native = method("""
            invoke-interface {v0, p1}, $setter
            iput p1, p0, LCoordinator;->normalization:F
            return-void
        """)
        assertEquals("LCoordinator;->normalization:F", native.discoverNormalizationField("volume").toString())
    }

    @Test fun rangeNativeSetterFollowsItsOwnValueRegister() {
        val native = method("""
            invoke-interface/range {v0 .. v1}, $setter
            iput v1, p0, LCoordinator;->normalization:F
            return-void
        """)
        assertEquals("LCoordinator;->normalization:F", native.discoverNormalizationField("volume").toString())
    }

    @Test(expected = IllegalStateException::class)
    fun overwrittenValueCannotBecomeANormalizationCache() {
        method("""
            invoke-interface {v0, v1}, $setter
            const/4 v1, 0x0
            iput v1, p0, LCoordinator;->userVolume:F
            return-void
        """).discoverNormalizationField("volume")
    }

    @Test(expected = IllegalArgumentException::class)
    fun multipleNativeSettersAreNotAnUnambiguousBoundary() {
        method("""
            invoke-interface {v0, v1}, $setter
            invoke-interface {v0, p1}, $setter
            iput p1, p0, LCoordinator;->userVolume:F
            return-void
        """).discoverNormalizationField("volume")
    }
}
