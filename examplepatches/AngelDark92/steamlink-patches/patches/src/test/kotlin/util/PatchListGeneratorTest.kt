package util

import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class PatchListGeneratorTest {
    @Test
    fun `stable compatibility emits exact build target only`() {
        val latest = COMPATIBILITIES_STEAM_LINK.last()
        assertEquals(
            listOf("2.0.22"),
            targetsForReleaseChannel(latest, ReleaseChannel.STABLE).map { it.version },
        )
        assertEquals(
            listOf("2.0.22"),
            targetsForReleaseChannel(latest, ReleaseChannel.EXPERIMENTAL).map { it.version },
        )
        assertEquals(5002322, latest.targets.single().versionCodes!!.values.toSet().single())
    }

    @Test
    fun `projection experiments stay out of stable release channel`() {
        assertTrue(
            targetsForReleaseChannel(
                COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL.last(),
                ReleaseChannel.STABLE,
            ).isEmpty(),
        )
        assertEquals(
            listOf("2.0.22"),
            targetsForReleaseChannel(
                COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL.last(),
                ReleaseChannel.EXPERIMENTAL,
            ).map { it.version },
        )
        assertEquals(
            5002322,
            COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL.last()
                .targets.single().versionCodes!!.values.toSet().single(),
        )
    }
}
