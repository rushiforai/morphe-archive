package app.template.patches.steamlink.binary

import app.template.patches.shared.Constants.EXPERIMENTAL_COMPATIBILITY_NAME
import app.template.patches.steamlink.galaxyXrLegacyFoundationPatch
import app.template.patches.steamlink.galaxyXrRecommended5001712Patch
import app.template.patches.steamlink.galaxyXrRecommended5002363Patch
import kotlin.test.*

class BackgroundBlueNoisePatchTest {
    private val markers = listOf(
        "SLBN_CONFIGURED_HASH_____________________________________________",
        "SLBN_STOCK_HASH__________________________________________________",
        "SLBN_FOVEA_PC____",
        "SLBN_BACKGROUND_HASH____________________________________________",
        "SLBN_BACKGROUND_STOCK___________________________________________",
        "SLBN_BASE_PC____",
    )

    @Test
    fun `background and foveal patches are independently selectable exact experiments`() {
        assertEquals("Background blue-noise dithering (experimental)", backgroundBlueNoisePatch.name)
        assertEquals("Foveal blue-noise dithering (experimental)", fovealBlueNoisePatch.name)
        assertNotSame(backgroundBlueNoisePatch, fovealBlueNoisePatch)
        assertNotSame(backgroundBlueNoisePatch.options["inputDepth"], fovealBlueNoisePatch.options["inputDepth"])
        for (patch in listOf(backgroundBlueNoisePatch, fovealBlueNoisePatch)) {
            assertFalse(patch.default)
            assertTrue(patch.dependencies.isEmpty())
            listOf(galaxyXrLegacyFoundationPatch, galaxyXrRecommended5001712Patch, galaxyXrRecommended5002363Patch)
                .forEach { assertFalse(patch in it.dependencies) }
            assertEquals(setOf("2.0.20" to 5001712, "2.0.22" to 5002244, "2.0.23" to 5002363),
                patch.compatibility.orEmpty().flatMap { compatibility ->
                    assertEquals(EXPERIMENTAL_COMPATIBILITY_NAME, compatibility.name)
                    compatibility.targets.map { target ->
                        assertFalse(target.description.isNullOrBlank())
                        target.version to assertNotNull(target.versionCodes).values.distinct().single()
                    }
                }.toSet())
            assertEquals(setOf("8-bit", "10-bit"), patch.options["inputDepth"].values!!.values.toSet())
        }
    }

    @Test
    fun `canonical payload has distinct bounded configurations for both layers`() {
        val payload = bundledBlueNoiseHelper()
        val text = payload.toString(Charsets.ISO_8859_1)
        assertEquals(BLUE_NOISE_PAYLOAD_SHA256, blueNoiseHash(payload))
        // Existing foveal slots retain 1 padding NUL after their configured value.
        assertEquals(listOf(65, 65, 17, 64, 64, 16), markers.map { it.length })
        val offsets = markers.map { marker ->
            val offset = text.indexOf(marker)
            assertTrue(offset >= 0, marker)
            assertEquals(offset, text.lastIndexOf(marker), marker)
            assertEquals(0, payload[offset + marker.length].toInt(), marker)
            offset
        }
        assertEquals(6, offsets.distinct().size)
        val foveal = configureBlueNoiseHelper(payload, "0123456789abcdef".repeat(4), 0xf1c48L)
        markers.drop(3).forEach { marker ->
            assertTrue(foveal.toString(Charsets.ISO_8859_1).contains(marker + "\u0000"))
        }
        assertEquals(BLUE_NOISE_PAYLOAD_SHA256, blueNoiseHash(payload))
    }

    @Test
    fun `owned helper rejects malformed configuration in either layer`() {
        val payload = bundledBlueNoiseHelper()
        val offsets = markers.map { payload.toString(Charsets.ISO_8859_1).indexOf(it) }
        val both = configureBlueNoiseHelper(payload, "0123456789abcdef".repeat(4), 0xf1c48L)
        listOf("fedcba9876543210".repeat(4), BLUE_NOISE_STOCK_BACKGROUND_HASH, "00000000000f1d28")
            .forEachIndexed { index, value -> value.toByteArray(Charsets.US_ASCII).copyInto(both, offsets[index + 3]) }
        assertTrue(isConfiguredBlueNoiseHelper(both))
        for (index in markers.indices) {
            val malformed = both.copyOf().apply { this[offsets[index]] = '!'.code.toByte() }
            assertFalse(isConfiguredBlueNoiseHelper(malformed), "Invalid field $index accepted")
            val partial = both.copyOf().apply { markers[index].toByteArray(Charsets.US_ASCII).copyInto(this, offsets[index]) }
            assertFalse(isConfiguredBlueNoiseHelper(partial), "Partial layer field $index accepted")
            val unterminated = both.copyOf().apply { this[offsets[index] + markers[index].length] = 1 }
            assertFalse(isConfiguredBlueNoiseHelper(unterminated), "Unterminated field $index accepted")
        }
        for (index in listOf(2, 5)) {
            val zeroCaller = both.copyOf().apply { "0".repeat(16).toByteArray().copyInto(this, offsets[index]) }
            assertFalse(isConfiguredBlueNoiseHelper(zeroCaller), "Zero caller field $index accepted")
        }
        val corruptBody = both.copyOf().apply { this[0] = (this[0].toInt() xor 1).toByte() }
        assertFalse(isConfiguredBlueNoiseHelper(corruptBody))
        assertFalse(isConfiguredBlueNoiseHelper(both.copyOf(both.size - 1)))
    }

    @Test
    fun `both layers leave excluded version pairs unchanged before helper validation`() {
        val scene = byteArrayOf(1, 2, 3)
        val foreign = byteArrayOf(4, 5, 6)
        for (layer in BlueNoiseLayer.entries) for (mode in FoveaMode.entries) {
            for ((version, code) in listOf(
                "2.0.22" to "5002322", "2.0.22" to "5002363", "2.0.20" to "5001740",
            )) {
                val result = applyBlueNoiseLayer(scene, version, code, mode, layer,
                    payload = foreign, existingHelper = foreign)
                assertContentEquals(byteArrayOf(1, 2, 3), scene)
                assertContentEquals(scene, result.scene)
                assertNull(result.helper)
                assertContentEquals(byteArrayOf(4, 5, 6), foreign)
            }
        }
    }
}
