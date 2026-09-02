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
                "2.0.20" to 5001740,
                "2.0.20" to 5001712,
                "2.0.22" to 5002172,
                "2.0.22" to 5002206,
                "2.0.22" to 5002244,
                "2.0.22" to 5002313,
            ),
            Constants.COMPATIBILITIES_STEAM_LINK_LEGACY.targets(),
        )
        assertTrue(Constants.isNativeXrSteamLinkBuild("2.0.22", "5002318"))
        assertTrue(Constants.isNativeXrSteamLinkBuild("2.0.22", "5002322"))
        assertFalse(Constants.isNativeXrSteamLinkBuild("2.0.22", "5002313"))
        assertFalse(Constants.isNativeXrSteamLinkBuild("2.0.20", "5002318"))
        assertEquals(
            listOf(5001740, 5001712, 5002172, 5002206, 5002244, 5002313, 5002318, 5002322),
            Constants.COMPATIBILITIES_STEAM_LINK.versionCodes(),
        )
        assertEquals(
            listOf(5001740, 5001712, 5002172, 5002206, 5002244, 5002313, 5002318, 5002322),
            Constants.COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL.versionCodes(),
        )
        assertEquals(
            listOf(5002322),
            Constants.COMPATIBILITIES_STEAM_LINK_5002322_EXPERIMENTAL.versionCodes(),
        )
        assertEquals(
            listOf(5002322),
            Constants.COMPATIBILITIES_STEAM_LINK_5002322.versionCodes(),
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
