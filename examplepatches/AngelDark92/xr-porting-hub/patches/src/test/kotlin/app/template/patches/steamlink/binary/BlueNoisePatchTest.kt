package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import kotlin.test.*

class BlueNoisePatchTest {
    private val markers = listOf(
        "SLBN_CONFIGURED_HASH_____________________________________________",
        "SLBN_STOCK_HASH__________________________________________________",
        "SLBN_FOVEA_PC____",
        "SLBN_BACKGROUND_HASH____________________________________________",
        "SLBN_BACKGROUND_STOCK___________________________________________",
        "SLBN_BASE_PC____",
    )

    @Test
    fun `blue noise is default on with both layers on the exact pairs`() {
        assertEquals("Blue-noise dithering", blueNoisePatch.name)
        assertTrue(blueNoisePatch.default)
        assertTrue(blueNoisePatch.dependencies.isEmpty())
        assertEquals(true, blueNoisePatch.options["fovea"].default)
        assertEquals(true, blueNoisePatch.options["background"].default)
        assertTrue("inputDepth" !in blueNoisePatch.options.keys)
        assertEquals(setOf(
                "2.0.20" to 5001712, "2.0.20" to 5001812,
                "2.0.21" to 5001968, "2.0.22" to 5002244, "2.0.23" to 5002363,
                "2.0.24" to 5002395),
            blueNoisePatch.compatibility.orEmpty().flatMap { compatibility ->
                assertEquals("Steam Link", compatibility.name)
                compatibility.targets.map { target ->
                    assertFalse(target.description.isNullOrBlank())
                    target.version to assertNotNull(target.versionCodes).values.distinct().single()
                }
            }.toSet())
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
            "2.0.20" to "5002363", "2.0.23" to "5001712", "2.0.20" to "5001740",
        )) {
            val result = applyFovealBlueNoise(unrelated, version, code, mode)
            assertContentEquals(unrelated, result.scene)
            assertNull(result.helper)
        }
    }

    @Test
    fun `real decoded renderers accept both restored legacy layouts`() {
        val bases = listOf(
            Triple("2.0.20", "5001712", 2_221_072),
            Triple("2.0.20", "5001812", 2_220_872),
            Triple("2.0.21", "5001968", 2_234_048),
            Triple("2.0.22", "5002244", 2_251_920),
            Triple("2.0.23", "5002363", 2_292_008),
            Triple("2.0.24", "5002395", 2_301_432),
        )
        bases.forEach { (version, code, size) ->
            val file = java.io.File("android-steamlinkvr-release-base-$version-$code/lib/arm64-v8a/libvrlink_scene.so")
            org.junit.Assume.assumeTrue("BLOCKED: decoded $version/$code scene is absent", file.isFile)
            val stock = file.readBytes()
            assertEquals(size, stock.size, "$version/$code")
            listOf(BlueNoiseLayer.FOVEA, BlueNoiseLayer.BACKGROUND).forEach { layer ->
                val patched = applyBlueNoiseLayer(stock, version, code, FoveaMode.INPUT_10BIT, layer).scene
                assertFalse(stock.contentEquals(patched), "$version/$code $layer")
                assertContentEquals(patched,
                    applyBlueNoiseLayer(patched, version, code, FoveaMode.INPUT_10BIT, layer).scene,
                    "$version/$code $layer reapply")
            }
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
                "2.0.20" to "5002363", "2.0.23" to "5001712", "2.0.20" to "5001740",
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
