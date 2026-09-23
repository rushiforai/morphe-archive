package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import app.template.patches.shared.Constants.EXPERIMENTAL_COMPATIBILITY_NAME
import app.template.patches.steamlink.galaxyXrLegacyFoundationPatch
import app.template.patches.steamlink.galaxyXrRecommended5001712Patch
import app.template.patches.steamlink.galaxyXrRecommended5002363Patch
import kotlin.test.*

class BlueNoisePatchTest {
    @Test
    fun `blue noise is separate default off and restricted to exact pairs`() {
        assertFalse(fovealBlueNoisePatch.default)
        assertTrue(fovealBlueNoisePatch.dependencies.isEmpty())
        listOf(galaxyXrLegacyFoundationPatch, galaxyXrRecommended5001712Patch, galaxyXrRecommended5002363Patch)
            .forEach { assertFalse(fovealBlueNoisePatch in it.dependencies) }
        assertEquals(setOf("2.0.20" to 5001712, "2.0.22" to 5002244, "2.0.23" to 5002363),
            fovealBlueNoisePatch.compatibility.orEmpty().flatMap { compatibility ->
                assertEquals(EXPERIMENTAL_COMPATIBILITY_NAME, compatibility.name)
                compatibility.targets.map { target ->
                    assertNotNull(target.description)
                    target.version to target.versionCodes!!.values.distinct().single()
                }
            }.toSet())
        assertEquals(setOf("8-bit", "10-bit"), fovealBlueNoisePatch.options["inputDepth"].values!!.values.toSet())
    }

    @Test
    fun `payload configuration preserves source and recognizes only owned bytes`() {
        val payload = bundledBlueNoiseHelper()
        val before = payload.copyOf()
        val configuredHash = "0123456789abcdef".repeat(4)
        val configured = configureBlueNoiseHelper(payload, configuredHash, 0xf1c48L)
        assertContentEquals(before, payload)
        assertEquals(payload.size, configured.size)
        val text = configured.toString(Charsets.ISO_8859_1)
        assertTrue(text.contains(configuredHash + "\u0000"))
        assertTrue(text.contains(BLUE_NOISE_STOCK_MASKED_HASH + "\u0000"))
        assertTrue(text.contains("00000000000f1c48\u0000"))
        assertTrue(isConfiguredBlueNoiseHelper(configured))
        assertFalse(isConfiguredBlueNoiseHelper(byteArrayOf(1, 2, 3)))
        val corrupt = configured.copyOf().also { it[it.lastIndex] = (it.last().toInt() xor 1).toByte() }
        assertFalse(isConfiguredBlueNoiseHelper(corrupt))
        assertFailsWith<PatchException> { configureBlueNoiseHelper(payload, "invalid", 0xf1c48L) }
        assertFailsWith<PatchException> { configureBlueNoiseHelper(corrupt, configuredHash, 0xf1c48L) }
    }

    @Test
    fun `blue noise does not infer neighboring layouts from the build number`() {
        val unrelated = byteArrayOf(1, 2, 3)
        for (mode in FoveaMode.entries) for ((version, code) in listOf(
            "2.0.22" to "5002322", "2.0.22" to "5002363", "2.0.20" to "5001740",
        )) {
            val result = applyFovealBlueNoise(unrelated, version, code, mode)
            assertContentEquals(unrelated, result.scene)
            assertNull(result.helper)
        }
    }
}
