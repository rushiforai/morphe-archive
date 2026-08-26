package app.template.patches.shared

import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class ConstantsTest {
    @Test
    fun `compatibilities enumerate exact verified 2_0_22 builds`() {
        assertEquals(
            listOf(5001712, 5002172, 5002206, 5002244, 5002313),
            Constants.COMPATIBILITIES_STEAM_LINK_LEGACY.versionCodes(),
        )
        assertTrue(Constants.isNativeXrSteamLinkBuild("5002318"))
        assertTrue(Constants.isNativeXrSteamLinkBuild("5002322"))
        assertFalse(Constants.isNativeXrSteamLinkBuild("5002313"))
        assertEquals(
            listOf(5001712, 5002172, 5002206, 5002244, 5002313, 5002318, 5002322),
            Constants.COMPATIBILITIES_STEAM_LINK.versionCodes(),
        )
        assertEquals(
            listOf(5001712, 5002172, 5002206, 5002244, 5002313, 5002318, 5002322),
            Constants.COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL.versionCodes(),
        )
    }

    private fun List<app.morphe.patcher.patch.Compatibility>.versionCodes() = map { compatibility ->
        val target = compatibility.targets.single()
        assertEquals("2.0.22", target.version)
        target.versionCodes!!.values.toSet().single()
    }
}
