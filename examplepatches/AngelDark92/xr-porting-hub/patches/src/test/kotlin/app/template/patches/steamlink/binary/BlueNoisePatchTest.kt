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
                "2.0.24" to 5002395, "2.0.24" to 5002527),
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
            Triple("2.0.24", "5002527", 2_333_472),
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

    // ---- 2.0.24/5002527: inner-fade helper payload (helper slots 16/17, stock vInnerFade untouched) ----

    private fun decodedScene5002527(): ByteArray? {
        val root = generateSequence(java.io.File(System.getProperty("user.dir")).canonicalFile) { it.parentFile }
            .firstOrNull { java.io.File(it, "patches/src/main/kotlin").isDirectory } ?: return null
        val file = java.io.File(root, "android-steamlinkvr-release-base-2.0.24-5002527/lib/arm64-v8a/libvrlink_scene.so")
        return file.takeIf { it.isFile }?.readBytes()
    }

    private val layout5002527 get() = BLUE_NOISE_LAYOUTS.single { it.code == "5002527" }

    @Test
    fun `inner-fade payload is a pinned separate resource and prior payload bytes are unchanged`() {
        val standard = bundledBlueNoiseHelper()
        val variant = bundledBlueNoiseInnerFadeHelper()
        assertEquals("5c30791621cc94a3f2f358e9b98e8029bc0765c1a0d44f6d1bc4690b2f45e858", blueNoiseHash(standard))
        assertEquals(BLUE_NOISE_PAYLOAD_SHA256, blueNoiseHash(standard))
        assertEquals("95e3d478c3bfa364c9b5ebe3439096cc2b3e90ada71733ecef7a01a30b9f3ebf", blueNoiseHash(variant))
        assertEquals(BLUE_NOISE_INNER_FADE_PAYLOAD_SHA256, blueNoiseHash(variant))
        val standardText = standard.toString(Charsets.ISO_8859_1)
        val variantText = variant.toString(Charsets.ISO_8859_1)
        // Appended GLSL declares only the helper-owned slots; the stock slot 14 is never claimed by the variant.
        assertTrue(standardText.contains("layout(location=14) uniform highp sampler2D SL_blueNoise;"))
        assertTrue(standardText.contains("layout(location=15) uniform bool SL_enabled;"))
        assertTrue(variantText.contains("layout(location=16) uniform highp sampler2D SL_blueNoise;"))
        assertTrue(variantText.contains("layout(location=17) uniform bool SL_enabled;"))
        assertFalse(variantText.contains("layout(location=14) uniform highp sampler2D SL_blueNoise;"))
        assertFalse(variantText.contains("layout(location=15) uniform bool SL_enabled;"))
        // Same six owned configuration markers, each exactly once, so one config path serves both.
        for (marker in markers) {
            assertEquals(1, Regex(Regex.escape(marker)).findAll(variantText).count(), marker)
        }
        assertFalse(isConfiguredBlueNoiseHelper(byteArrayOf(1, 2, 3)))
        // Only the 5002527 layout selects the variant; every earlier layout keeps the standard payload.
        BLUE_NOISE_LAYOUTS.forEach { layout ->
            val expected = if (layout.code == "5002527") BlueNoiseHelperVariant.INNER_FADE else BlueNoiseHelperVariant.STANDARD
            assertEquals(expected, layout.helper, layout.code)
        }
    }

    @Test
    fun `either payload variant configures and rejects the other as a foreign helper`() {
        val hash = "0123456789abcdef".repeat(4)
        val standard = configureBlueNoiseHelper(bundledBlueNoiseHelper(), hash, 0xf6668L)
        val variant = configureBlueNoiseHelper(bundledBlueNoiseInnerFadeHelper(), hash, 0xf6668L)
        assertTrue(isConfiguredBlueNoiseHelper(standard))
        assertTrue(isConfiguredBlueNoiseHelper(variant))
        assertFalse(isConfiguredBlueNoiseHelper(variant.copyOf().also { it[it.lastIndex] = (it.last().toInt() xor 1).toByte() }))
        assertFalse(isConfiguredBlueNoiseHelper(variant.copyOf(variant.size - 1)))
        assertFailsWith<PatchException> { configureBlueNoiseHelper(variant.copyOf().also { it[0] = 0 }, hash, 0xf6668L) }
        // A standard helper presented to the 5002527 layout (and vice versa) is refused, atomically.
        val scene = ByteArray(layout5002527.size)
        assertFailsWith<PatchException> {
            applyBlueNoiseLayer(scene, "2.0.24", "5002527", FoveaMode.INPUT_10BIT, BlueNoiseLayer.FOVEA, payload = bundledBlueNoiseHelper())
        }
        assertFailsWith<PatchException> {
            applyBlueNoiseLayer(ByteArray(2_301_432), "2.0.24", "5002395", FoveaMode.INPUT_10BIT, BlueNoiseLayer.FOVEA,
                payload = bundledBlueNoiseInnerFadeHelper())
        }
        // Synthetic buffers of the right size but wrong bytes fail closed for every mode and layer.
        for (layer in BlueNoiseLayer.entries) for (mode in FoveaMode.entries) {
            val snapshot = scene.copyOf()
            // The import names are neither stock nor hooked, so even OFF refuses to touch the buffer.
            assertFailsWith<PatchException>("$layer/$mode") { applyBlueNoiseLayer(scene, "2.0.24", "5002527", mode, layer) }
            assertContentEquals(snapshot, scene)
        }
        assertFailsWith<PatchException> { applyBlueNoiseLayer(ByteArray(64), "2.0.24", "5002527", FoveaMode.INPUT_10BIT, BlueNoiseLayer.FOVEA) }
        // Neighbouring pairs never infer this layout.
        for ((version, code) in listOf("2.0.24" to "5002526", "2.0.23" to "5002527", "2.0.24" to "5002528")) {
            val unrelated = byteArrayOf(9, 8, 7)
            val result = applyBlueNoiseLayer(unrelated, version, code, FoveaMode.INPUT_10BIT, BlueNoiseLayer.FOVEA)
            assertContentEquals(unrelated, result.scene)
            assertNull(result.helper)
        }
    }

    @Test
    fun `5002527 real decoded renderer hooks only the eleven import names and configures the inner-fade helper`() {
        val stock = decodedScene5002527()
        org.junit.Assume.assumeTrue("BLOCKED: decoded 2.0.24/5002527 scene is absent", stock != null)
        stock!!
        val layout = layout5002527
        assertEquals("cfa9a9081afe9f011d50088642b11c04c8c386f393231d434621121e2c65ea03", blueNoiseHash(stock))
        // The configured stock hashes must be the real prefix+suffix sources, not synthetic values.
        val prefix = stock.copyOfRange(layout.prefix, layout.prefix + layout.shaderSize)
        assertEquals(layout.stockPrefixHash, blueNoiseHash(prefix))
        assertEquals(layout.maskedStockHash, blueNoiseHash(prefix + stock.copyOfRange(layout.suffix, layout.suffix + layout.maskedSize)))
        assertEquals(layout.backgroundStockHash, blueNoiseHash(prefix + stock.copyOfRange(0x9b2c0, 0x9b2c0 + 29)))
        val stockUniform = "layout(location = 14) uniform vec4 vInnerFade;"
        assertTrue(prefix.toString(Charsets.ISO_8859_1).contains(stockUniform))

        val siteBytes = layout.sites.flatMap { site -> (site.offset until site.offset + site.stock.length + 1).toList() }.toSet()
        val fovea = applyBlueNoiseLayer(stock, "2.0.24", "5002527", FoveaMode.INPUT_10BIT, BlueNoiseLayer.FOVEA)
        val both = applyBlueNoiseLayer(fovea.scene, "2.0.24", "5002527", FoveaMode.INPUT_10BIT, BlueNoiseLayer.BACKGROUND,
            existingHelper = fovea.helper)
        for (result in listOf(fovea, both)) {
            val scene = result.scene
            assertEquals(stock.size, scene.size)
            val changed = stock.indices.filter { stock[it] != scene[it] }
            assertTrue(changed.isNotEmpty())
            assertTrue(changed.all { it in siteBytes }, "Only import-name bytes may change; stock vInnerFade code/shader stays intact")
            layout.sites.forEach { site ->
                val hooked = (site.hooked + "\u0000").toByteArray(Charsets.US_ASCII)
                assertContentEquals(hooked.copyOf(site.stock.length + 1), scene.copyOfRange(site.offset, site.offset + site.stock.length + 1))
            }
            // Stock vInnerFade shader declaration and RenderSpecific consumer (mov w1,#14) are untouched.
            assertContentEquals(stock.copyOfRange(layout.prefix, layout.prefix + layout.shaderSize),
                scene.copyOfRange(layout.prefix, layout.prefix + layout.shaderSize))
            assertContentEquals(byteArrayOf(0xc1.toByte(), 0x01, 0x80.toByte(), 0x52), scene.copyOfRange(0xf661c, 0xf6620))
            val helper = assertNotNull(result.helper)
            assertEquals(bundledBlueNoiseInnerFadeHelper().size, helper.size)
            assertTrue(isConfiguredBlueNoiseHelper(helper))
            val text = helper.toString(Charsets.ISO_8859_1)
            assertTrue(text.contains(layout.maskedStockHash + "\u0000"))
            assertTrue(text.contains("00000000000f6668\u0000"))
        }
        assertTrue(both.helper!!.toString(Charsets.ISO_8859_1).let {
            it.contains(layout.backgroundStockHash + "\u0000") && it.contains("00000000000f6748\u0000")
        })
        assertFalse(fovea.helper!!.toString(Charsets.ISO_8859_1).contains("00000000000f6748"))
        // Idempotence, order independence and exact restoration through every transition.
        val again = applyBlueNoiseLayer(both.scene, "2.0.24", "5002527", FoveaMode.INPUT_10BIT, BlueNoiseLayer.BACKGROUND,
            existingHelper = both.helper)
        assertContentEquals(both.scene, again.scene)
        assertContentEquals(both.helper, again.helper)
        val reversed = applyBlueNoiseLayer(
            applyBlueNoiseLayer(stock, "2.0.24", "5002527", FoveaMode.INPUT_10BIT, BlueNoiseLayer.BACKGROUND).let {
                applyBlueNoiseLayer(it.scene, "2.0.24", "5002527", FoveaMode.INPUT_10BIT, BlueNoiseLayer.FOVEA, existingHelper = it.helper)
            }.scene, "2.0.24", "5002527", FoveaMode.INPUT_10BIT, BlueNoiseLayer.FOVEA)
        assertContentEquals(both.scene, reversed.scene)
        val onlyBackground = applyBlueNoiseLayer(both.scene, "2.0.24", "5002527", FoveaMode.OFF, BlueNoiseLayer.FOVEA, existingHelper = both.helper)
        assertTrue(onlyBackground.helper != null && isConfiguredBlueNoiseHelper(onlyBackground.helper!!))
        assertFalse(onlyBackground.helper!!.toString(Charsets.ISO_8859_1).contains(layout.maskedStockHash + "\u0000"))
        val off = applyBlueNoiseLayer(onlyBackground.scene, "2.0.24", "5002527", FoveaMode.OFF, BlueNoiseLayer.BACKGROUND,
            existingHelper = onlyBackground.helper)
        assertContentEquals(stock, off.scene, "Disabling both layers must restore the exact stock library")
        assertNull(off.helper)
        // The standard payload and a foreign existing helper are refused without side effects.
        assertFailsWith<PatchException> {
            applyBlueNoiseLayer(stock, "2.0.24", "5002527", FoveaMode.INPUT_10BIT, BlueNoiseLayer.FOVEA, payload = bundledBlueNoiseHelper())
        }
        val standardConfigured = configureBlueNoiseHelper(bundledBlueNoiseHelper(), "0123456789abcdef".repeat(4), 0xf6668L)
        assertFailsWith<PatchException> {
            applyBlueNoiseLayer(fovea.scene, "2.0.24", "5002527", FoveaMode.INPUT_10BIT, BlueNoiseLayer.BACKGROUND, existingHelper = standardConfigured)
        }
    }

    @Test
    fun `5002527 real decoded renderer accepts calibration but rejects unknown prefixes and route changes`() {
        val stock = decodedScene5002527()
        org.junit.Assume.assumeTrue("BLOCKED: decoded 2.0.24/5002527 scene is absent", stock != null)
        stock!!
        val layout = layout5002527
        // Calibrated prefix (OLED, VD-like off) is a supported input for both layers.
        val calibrated = stock.copyOf().also {
            paddedVideoShader(1.2f, 1.45f, VideoOutputPrecision.SRGB8_HIGHP, innerFade = true).copyInto(it, layout.prefix)
        }
        for (layer in BlueNoiseLayer.entries) {
            val result = applyBlueNoiseLayer(calibrated, "2.0.24", "5002527", FoveaMode.INPUT_10BIT, layer)
            assertTrue(isConfiguredBlueNoiseHelper(assertNotNull(result.helper)))
            val restored = applyBlueNoiseLayer(result.scene, "2.0.24", "5002527", FoveaMode.OFF, layer, existingHelper = result.helper)
            assertContentEquals(calibrated, restored.scene)
        }
        // Already-dithered, altered or wrong-size prefixes, changed suffixes/stubs/tables never stack.
        val unknownPrefixes = listOf(
            calibrated.copyOf().also { it[layout.prefix + 300] = '!'.code.toByte() },
            stock.copyOf().also { paddedVideoShader(1.2f, 1.45f, VideoOutputPrecision.SRGB8_HIGHP, VideoDitherMode.STANDARD, innerFade = true).copyInto(it, layout.prefix) },
            stock.copyOf().also { it[layout.prefix + layout.shaderSize] = 1 },
        )
        for (source in unknownPrefixes) {
            val snapshot = source.copyOf()
            assertFailsWith<PatchException> { applyBlueNoiseLayer(source, "2.0.24", "5002527", FoveaMode.INPUT_10BIT, BlueNoiseLayer.FOVEA) }
            assertContentEquals(snapshot, source)
        }
        val corruptions = layout.guards.flatMap { listOf(it.offset, it.offset + it.size - 1) } +
            layout.sites.map { it.offset } + listOf(0x9b2c0 - 1, 0x9b2c0 + 29, layout.suffix - 1, layout.suffix + layout.maskedSize)
        for (offset in corruptions) {
            val corrupt = stock.copyOf().also { it[offset] = (it[offset].toInt() xor 1).toByte() }
            val snapshot = corrupt.copyOf()
            assertFailsWith<PatchException>("0x${offset.toString(16)}") {
                applyBlueNoiseLayer(corrupt, "2.0.24", "5002527", FoveaMode.INPUT_10BIT, BlueNoiseLayer.FOVEA)
            }
            assertContentEquals(snapshot, corrupt)
        }
        // A mixed import state (one site hooked) is refused.
        val mixed = stock.copyOf().also {
            val site = layout.sites.first()
            (site.hooked + "\u0000").toByteArray(Charsets.US_ASCII).copyOf(site.stock.length + 1).copyInto(it, site.offset)
        }
        assertFailsWith<PatchException> { applyBlueNoiseLayer(mixed, "2.0.24", "5002527", FoveaMode.INPUT_10BIT, BlueNoiseLayer.FOVEA) }
        // The shaders must still carry the stock uniform at the audited location for every hooked state.
        val hooked = applyBlueNoiseLayer(stock, "2.0.24", "5002527", FoveaMode.INPUT_10BIT, BlueNoiseLayer.FOVEA).scene
        assertEquals(1, Regex(Regex.escape("layout(location = 14) uniform vec4 vInnerFade;"))
            .findAll(hooked.copyOfRange(layout.prefix, layout.prefix + layout.shaderSize).toString(Charsets.ISO_8859_1)).count())
    }
}
