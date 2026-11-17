/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-16
 */
package app.morphe.patches.music.navigation.components

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class NavigationThemeCompatibilityTest {
    private fun fields(vararg names: String) = names.map {
        ImmutableField("LTheme;", it, "Ljava/util/EnumMap;", AccessFlags.PRIVATE.value, null, null, null)
    }

    @Test
    fun legacyThreeMapThemeDoesNotInstallTheFourMapHook() {
        assertFalse(supportsNavigationThemeIconMaps("6.20.51", fields("b", "c", "d")))
    }

    @Test
    fun compatibleLegacyThemeKeepsItsIconHook() {
        assertTrue(supportsNavigationThemeIconMaps("7.16.53", fields("b", "c", "e", "f")))
    }

    @Test
    fun modernClientsKeepTheirExistingHook() {
        listOf("7.17.52", "8.12.54", "8.28.54", "8.30.54", "9.15.51", "9.40.51", "9.45.51").forEach {
            assertTrue(it, supportsNavigationThemeIconMaps(it, emptyList()))
        }
    }
}
