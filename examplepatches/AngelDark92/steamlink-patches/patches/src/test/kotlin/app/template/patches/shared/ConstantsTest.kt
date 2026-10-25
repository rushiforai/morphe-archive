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
                "2.0.20" to 5001812,
                "2.0.21" to 5001968,
                "2.0.22" to 5002244,
            ),
            Constants.COMPATIBILITIES_STEAM_LINK_LEGACY.targets(),
        )
        assertFalse(Constants.isNativeXrSteamLinkBuild("2.0.22", "5002318"))
        assertFalse(Constants.isNativeXrSteamLinkBuild("2.0.22", "5002322"))
        assertTrue(Constants.isNativeXrSteamLinkBuild("2.0.23", "5002363"))
        assertTrue(Constants.isNativeXrSteamLinkBuild("2.0.24", "5002395"))
        assertFalse(Constants.isNativeXrSteamLinkBuild("2.0.24", "5002363"))
        assertFalse(Constants.isNativeXrSteamLinkBuild("2.0.24", "5002394"))
        assertFalse(Constants.isNativeXrSteamLinkBuild("2.0.22", "5002363"))
        assertFalse(Constants.isNativeXrSteamLinkBuild("2.0.23", "5002322"))
        assertFalse(Constants.isNativeXrSteamLinkBuild("2.0.23", "5002364"))
        assertFalse(Constants.isNativeXrSteamLinkBuild("2.0.22", "5002296"))
        assertFalse(Constants.isNativeXrSteamLinkBuild("2.0.22", "5002313"))
        assertFalse(Constants.isNativeXrSteamLinkBuild("2.0.20", "5002318"))
        listOf(
            "2.0.20" to "5001712", "2.0.20" to "5001812",
            "2.0.21" to "5001968", "2.0.22" to "5002244", "2.0.23" to "5002363",
            "2.0.24" to "5002395",
        ).forEach { (version, code) ->
            assertTrue(Constants.isHighResolutionSteamLinkBuild(version, code), "$version/$code")
        }
        assertFalse(Constants.isHighResolutionSteamLinkBuild("2.0.22", "5002363"))
        assertFalse(Constants.isHighResolutionSteamLinkBuild("2.0.23", "5002364"))
        assertFalse(Constants.isHighResolutionSteamLinkBuild("2.0.24", "5002363"))
        assertFalse(Constants.isHighResolutionSteamLinkBuild("2.0.20", "5001740"))
        listOf(5002296, 5002313, 5002318, 5002322).forEach { versionCode ->
            assertFalse(Constants.isHighResolutionSteamLinkBuild("2.0.22", versionCode.toString()), "$versionCode")
        }
        assertFalse(Constants.isHighResolutionSteamLinkBuild("2.0.22", "5001712"))
        assertFalse(Constants.isHighResolutionSteamLinkBuild("2.0.20", "5002296"))

        listOf(
            "2.0.20" to "5001712", "2.0.20" to "5001812",
            "2.0.21" to "5001968", "2.0.22" to "5002244",
        ).forEach { (version, code) ->
            assertTrue(Constants.isLegacyXrFoundationSteamLinkBuild(version, code), "$version/$code")
            assertTrue(Constants.isEarlierStartupSteamLinkBuild(version, code), "$version/$code")
            assertTrue(Constants.isFullFacebridgeSteamLinkBuild(version, code), "$version/$code")
        }
        assertFalse(Constants.isLegacyXrFoundationSteamLinkBuild("2.0.20", "5001740"))
        listOf(5002296, 5002313, 5002318, 5002322).forEach { versionCode ->
            assertFalse(Constants.isLegacyXrFoundationSteamLinkBuild("2.0.22", versionCode.toString()), "$versionCode")
        }
        assertFalse(Constants.isLegacyXrFoundationSteamLinkBuild("2.0.23", "5002363"))
        assertFalse(Constants.isEarlierStartupSteamLinkBuild("2.0.23", "5002363"))
        assertFalse(Constants.isEarlierStartupSteamLinkBuild("2.0.22", "5002322"))

        assertEquals(
            listOf(5001712, 5001812, 5001968, 5002244, 5002363, 5002395),
            Constants.COMPATIBILITIES_STEAM_LINK.versionCodes(),
        )
        assertEquals(
            listOf(5001712, 5001812, 5001968, 5002244, 5002363, 5002395),
            Constants.COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL.versionCodes(),
        )
        assertEquals(
            listOf(5001712, 5001812, 5001968, 5002244),
            Constants.COMPATIBILITIES_STEAM_LINK_LEGACY_EXPERIMENTAL.versionCodes(),
        )
        assertEquals(listOf(5002363, 5002395), Constants.COMPATIBILITIES_STEAM_LINK_NATIVE_XR_EXPERIMENTAL.versionCodes())
        assertEquals(listOf("2.0.23" to 5002363), Constants.COMPATIBILITIES_STEAM_LINK_5002363.targets())
        assertEquals(
            listOf(5001712, 5001812, 5001968, 5002244),
            Constants.COMPATIBILITIES_STEAM_LINK_FULL_FACEBRIDGE.versionCodes(),
        )
        assertEquals(
            listOf("2.0.23" to 5002363, "2.0.24" to 5002395),
            Constants.COMPATIBILITIES_STEAM_LINK_MODERN_TONGUE_BRIDGE.targets(),
        )
        assertTrue(Constants.isModernTongueBridgeSteamLinkBuild("2.0.23", "5002363"))
        assertTrue(Constants.isModernTongueBridgeSteamLinkBuild("2.0.24", "5002395"))
        assertFalse(Constants.isModernTongueBridgeSteamLinkBuild("2.0.24", "5002363"))
        assertFalse(Constants.isModernTongueBridgeSteamLinkBuild("2.0.22", "5002363"))
        assertFalse(Constants.isModernTongueBridgeSteamLinkBuild("2.0.23", "5002322"))
        assertFalse(Constants.isModernTongueBridgeSteamLinkBuild("2.0.23", "5002364"))
        assertFalse(Constants.isModernTongueBridgeSteamLinkBuild("2.0.22", "5002318"))
        assertEquals(listOf(5001712), Constants.COMPATIBILITIES_STEAM_LINK_5001712.versionCodes())
        assertEquals(listOf(5001812), Constants.COMPATIBILITIES_STEAM_LINK_5001812.versionCodes())
        assertEquals(listOf(5001968), Constants.COMPATIBILITIES_STEAM_LINK_5001968.versionCodes())
        assertEquals(listOf(5002244), Constants.COMPATIBILITIES_STEAM_LINK_LEGACY_RECOMMENDED.versionCodes())
        assertEquals(
            listOf(5001712, 5001812, 5001968, 5002244, 5002363, 5002395),
            Constants.COMPATIBILITIES_STEAM_LINK_HIGH_RESOLUTION.versionCodes(),
        )
        assertTrue(Constants.isLegacyRecommendedSteamLinkBuild("2.0.22", "5002244"))
        assertTrue(Constants.isTwoProjectionSteamLinkBuild("2.0.21", "5001968"))
        assertFalse(Constants.isTwoProjectionSteamLinkBuild("2.0.22", "5002244"))
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
