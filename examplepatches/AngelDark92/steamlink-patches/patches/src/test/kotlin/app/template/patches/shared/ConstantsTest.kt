package app.template.patches.shared

import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class ConstantsTest {
    @Test
    fun `compatibilities enumerate exact adapted versions and builds`() {
        assertEquals(
            listOf(
                "2.0.20" to 5001712,
                "2.0.22" to 5002244,
            ),
            Constants.COMPATIBILITIES_STEAM_LINK_LEGACY.targets(),
        )
        assertFalse(Constants.isNativeXrSteamLinkBuild("2.0.22", "5002318"))
        assertFalse(Constants.isNativeXrSteamLinkBuild("2.0.22", "5002322"))
        assertTrue(Constants.isNativeXrSteamLinkBuild("2.0.23", "5002363"))
        assertFalse(Constants.isNativeXrSteamLinkBuild("2.0.22", "5002363"))
        assertFalse(Constants.isNativeXrSteamLinkBuild("2.0.23", "5002322"))
        assertFalse(Constants.isNativeXrSteamLinkBuild("2.0.23", "5002364"))
        assertFalse(Constants.isNativeXrSteamLinkBuild("2.0.22", "5002296"))
        assertFalse(Constants.isNativeXrSteamLinkBuild("2.0.22", "5002313"))
        assertFalse(Constants.isNativeXrSteamLinkBuild("2.0.20", "5002318"))
        assertTrue(Constants.isHighResolutionSteamLinkBuild("2.0.20", "5001712"))
        assertTrue(Constants.isHighResolutionSteamLinkBuild("2.0.22", "5002244"))
        assertTrue(Constants.isHighResolutionSteamLinkBuild("2.0.23", "5002363"))
        assertFalse(Constants.isHighResolutionSteamLinkBuild("2.0.22", "5002363"))
        assertFalse(Constants.isHighResolutionSteamLinkBuild("2.0.23", "5002364"))
        assertFalse(Constants.isHighResolutionSteamLinkBuild("2.0.20", "5001740"))
        listOf(5002296, 5002313, 5002318, 5002322).forEach { versionCode ->
            assertFalse(Constants.isHighResolutionSteamLinkBuild("2.0.22", versionCode.toString()), "$versionCode")
        }
        assertFalse(Constants.isHighResolutionSteamLinkBuild("2.0.22", "5001712"))
        assertFalse(Constants.isHighResolutionSteamLinkBuild("2.0.20", "5002296"))
        assertTrue(Constants.isLegacyXrFoundationSteamLinkBuild("2.0.20", "5001712"))
        assertTrue(Constants.isLegacyXrFoundationSteamLinkBuild("2.0.22", "5002244"))
        assertFalse(Constants.isLegacyXrFoundationSteamLinkBuild("2.0.20", "5001740"))
        listOf(5002296, 5002313, 5002318, 5002322).forEach { versionCode ->
            assertFalse(Constants.isLegacyXrFoundationSteamLinkBuild("2.0.22", versionCode.toString()), "$versionCode")
        }
        assertFalse(Constants.isLegacyXrFoundationSteamLinkBuild("2.0.23", "5002363"))
        assertTrue(Constants.isEarlierStartupSteamLinkBuild("2.0.20", "5001712"))
        assertTrue(Constants.isEarlierStartupSteamLinkBuild("2.0.22", "5002244"))
        assertFalse(Constants.isEarlierStartupSteamLinkBuild("2.0.23", "5002363"))
        assertFalse(Constants.isEarlierStartupSteamLinkBuild("2.0.22", "5002322"))
        assertFalse(Constants.isLegacyXrFoundationSteamLinkBuild("2.0.22", "5001712"))
        assertEquals(
            listOf(5001712, 5002244, 5002363),
            Constants.COMPATIBILITIES_STEAM_LINK.versionCodes(),
        )
        assertEquals(
            listOf(5001712, 5002244, 5002363),
            Constants.COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL.versionCodes(),
        )
        assertEquals(
            listOf("2.0.23" to 5002363),
            Constants.COMPATIBILITIES_STEAM_LINK_5002363.targets(),
        )
        assertEquals(
            listOf(5001712, 5002244),
            Constants.COMPATIBILITIES_STEAM_LINK_FULL_FACEBRIDGE.versionCodes(),
        )
        assertEquals(
            listOf("2.0.23" to 5002363),
            Constants.COMPATIBILITIES_STEAM_LINK_MODERN_TONGUE_BRIDGE.targets(),
        )
        assertTrue(Constants.isFullFacebridgeSteamLinkBuild("2.0.20", "5001712"))
        assertTrue(Constants.isFullFacebridgeSteamLinkBuild("2.0.22", "5002244"))
        assertFalse(Constants.isFullFacebridgeSteamLinkBuild("2.0.22", "5002318"))
        assertFalse(Constants.isFullFacebridgeSteamLinkBuild("2.0.22", "5002322"))
        assertFalse(Constants.isFullFacebridgeSteamLinkBuild("2.0.23", "5002363"))
        assertFalse(Constants.isModernTongueBridgeSteamLinkBuild("2.0.22", "5002322"))
        assertTrue(Constants.isModernTongueBridgeSteamLinkBuild("2.0.23", "5002363"))
        assertFalse(Constants.isModernTongueBridgeSteamLinkBuild("2.0.22", "5002363"))
        assertFalse(Constants.isModernTongueBridgeSteamLinkBuild("2.0.23", "5002322"))
        assertFalse(Constants.isModernTongueBridgeSteamLinkBuild("2.0.23", "5002364"))
        assertFalse(Constants.isModernTongueBridgeSteamLinkBuild("2.0.22", "5002318"))
        assertEquals(
            listOf(5001712),
            Constants.COMPATIBILITIES_STEAM_LINK_5001712.versionCodes(),
        )
        assertEquals(
            listOf(5002244),
            Constants.COMPATIBILITIES_STEAM_LINK_LEGACY_RECOMMENDED.versionCodes(),
        )
        assertEquals(
            listOf(5001712, 5002244, 5002363),
            Constants.COMPATIBILITIES_STEAM_LINK_HIGH_RESOLUTION.versionCodes(),
        )
    }

    private fun List<app.morphe.patcher.patch.Compatibility>.versionCodes() = map { compatibility ->
        val target = compatibility.targets.single()
        target.versionCodes!!.values.toSet().single()
    }

    private fun List<app.morphe.patcher.patch.Compatibility>.targets() = map { compatibility ->
        val target = compatibility.targets.single()
        target.version to target.versionCodes!!.values.toSet().single()
    }
}
