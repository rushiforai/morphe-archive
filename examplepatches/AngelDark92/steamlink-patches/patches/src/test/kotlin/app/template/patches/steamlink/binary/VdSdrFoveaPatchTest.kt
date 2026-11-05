package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import org.junit.Assume.assumeTrue
import java.io.File
import java.security.MessageDigest
import java.util.Locale
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertNotSame
import kotlin.test.assertTrue

class VdSdrFoveaPatchTest {
    private data class DecodedBase(
        val version: String, val code: String, val size: Int, val sha256: String,
        val masked: Int, val opaque: Int, val constructor: Int, val renderer: Int,
    )

    // Independent decoded-input identities and mutation intervals, not synthetic library fixtures.
    private val bases = listOf(
        DecodedBase("2.0.20", "5001712", 2221072,
            "80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495",
            0xa6582, 0x9d23d, 0xf13f4, 0xf1af4),
        DecodedBase("2.0.23", "5002363", 2292008,
            "628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0",
            0xa31bb, 0x99013, 0xf1350, 0xf1a50),
        DecodedBase("2.0.24", "5002395", 2301432,
            "5fab23a7eac1429c93520bdd4d7c579b75a6d55525a755379d15388272571a4b",
            0xa3ceb, 0x99a51, 0xf25a0, 0xf2ca0),
    )

    private fun withDecoded(action: (DecodedBase, ByteArray) -> Unit) {
        val working = File(System.getProperty("user.dir")).canonicalFile
        val root = generateSequence(working) { it.parentFile }
            .firstOrNull { File(it, "patches/src/main/kotlin").isDirectory }
        assumeTrue("Real decoded-input audit requires the repository workspace", root != null)
        val inputs = bases.map { base -> base to File(root,
            "decoded-apk-android-steamlinkvr-release-base-${base.version}-${base.code}/lib/arm64-v8a/libvrlink_scene.so") }
        val missing = inputs.filterNot { it.second.isFile }.map { "${it.first.version}/${it.first.code}" }
        assumeTrue("Real decoded-input audit BLOCKED: ${missing.joinToString()}; no synthetic replacement", missing.isEmpty())
        inputs.forEach { (base, file) ->
            val original = file.readBytes()
            assertEquals(base.size, original.size, base.code)
            assertEquals(base.sha256, original.hash(), base.code)
            action(base, original)
            assertEquals(base.sha256, file.readBytes().hash(), "Decoded input changed: ${base.code}")
        }
    }

    @Test
    fun `both declarations change only the masked suffix on all real decoded bases`() = withDecoded { base, input ->
        val before = input.copyOf()
        val eight = applyVdSdrFovea(input, base.version, base.code, FoveaMode.INPUT_8BIT)
        val ten = applyVdSdrFovea(input, base.version, base.code, FoveaMode.INPUT_10BIT)
        assertContentEquals(before, input, "Caller input mutated")
        assertNotSame(input, eight)
        assertContentEquals(eight, ten, "Depth declarations must select the same neutral SDR processing")
        assertEquals(input.size, eight.size)
        val changes = input.indices.filter { input[it] != eight[it] }
        assertTrue(changes.isNotEmpty(), "Masked program was not changed")
        assertTrue(changes.all { it in base.masked until base.masked + 296 }, "Out-of-scope mutation")
        assertContentEquals(input.copyOfRange(base.opaque, base.opaque + 30),
            eight.copyOfRange(base.opaque, base.opaque + 30), "Opaque/base suffix or terminator changed")
        val prefix = findVideoShader(input)
        assertContentEquals(input.copyOfRange(prefix, prefix + VIDEO_SHADER_SIZE + 1),
            eight.copyOfRange(prefix, prefix + VIDEO_SHADER_SIZE + 1), "Common prefix or terminator changed")
        assertEquals(0, eight[base.masked - 1].toInt())
        assertEquals(0, eight[base.masked + 296].toInt())
    }

    @Test
    fun `all mode transitions are idempotent and off restores exact source`() = withDecoded { base, input ->
        for (mode in FoveaMode.entries) {
            val first = applyVdSdrFovea(input, base.version, base.code, mode)
            assertContentEquals(first, applyVdSdrFovea(first, base.version, base.code, mode))
            for (next in FoveaMode.entries) {
                assertContentEquals(applyVdSdrFovea(input, base.version, base.code, next),
                    applyVdSdrFovea(first, base.version, base.code, next), "${base.code}: $mode -> $next")
            }
            assertContentEquals(input, applyVdSdrFovea(first, base.version, base.code, FoveaMode.OFF),
                "OFF must restore the exact original masked suffix")
        }
    }

    @Test
    fun `neutral suffix preserves exact stock alpha tokens and has no extra color processing`() = withDecoded { base, input ->
        val patched = applyVdSdrFovea(input, base.version, base.code, FoveaMode.INPUT_10BIT)
        val stockSuffix = input.copyOfRange(base.masked, base.masked + 296).toString(Charsets.US_ASCII)
        val suffix = patched.copyOfRange(base.masked, base.masked + 296).toString(Charsets.US_ASCII)
        fun alphaTokens(source: String) = source.substring(source.indexOf("vec2 placeInSection"))
            .replace(Regex("\\s+"), "")
        assertEquals(alphaTokens(stockSuffix), alphaTokens(suffix), "Valve alpha math changed")
        assertTrue(suffix.contains("color.rgb=clamp(_valve1_d2020d709*texture(tex0,uv).rgb,0.,1.)*fFadeAmount;"))
        assertFalse(suffix.contains("UniDitherOffsets"))
        assertFalse(suffix.contains("floor("))
        assertFalse(suffix.contains("mix("))
        assertEquals(1, Regex("color\\.rgb=").findAll(suffix).count())
        assertEquals(1, suffix.count { it == '}' })
        assertEquals(0, suffix.count { it == '{' })
        assertEquals(296, suffix.length)
    }

    @Test
    fun `all gamma slider suffixes preserve alpha and legacy neutral bytes`() {
        // Golden hashes from the pre-adjustment 296-byte stock and VD suffixes.
        assertEquals("2bad22b297f2016866482551483c0ecd44f629ce4d9df1848eb55d6a03008623",
            vdSdrFoveaSuffix(FoveaMode.OFF, 1f).hash())
        for (mode in listOf(FoveaMode.INPUT_8BIT, FoveaMode.INPUT_10BIT)) {
            assertEquals("f9c11d9c689087850d467561923dcfa3aa0c789d721658779abe0eca10815555",
                vdSdrFoveaSuffix(mode, 1f).hash())
        }
        fun alphaTokens(source: String): String = source.substring(source.indexOf("vec2 "))
            .replace(Regex("\\bgp\\b"), "placeInSection")
            .replace(Regex("\\bgd\\b"), "distCenter")
            .replace(Regex("\\s+"), "")
        val originalAlpha = alphaTokens(vdSdrFoveaSuffix(FoveaMode.OFF).toString(Charsets.US_ASCII))
        for (step in 100..130) {
            val extraGamma = step / 100f
            for (mode in FoveaMode.entries) {
                val bytes = vdSdrFoveaSuffix(mode, extraGamma)
                val suffix = bytes.toString(Charsets.US_ASCII)
                assertEquals(296, bytes.size, "$mode / $extraGamma")
                assertFalse(bytes.contains(0.toByte()), "Embedded NUL: $mode / $extraGamma")
                assertEquals(originalAlpha, alphaTokens(suffix), "Alpha changed: $mode / $extraGamma")
                assertEquals(1, suffix.count { it == '}' })
                assertEquals(0, suffix.count { it == '{' })
                if (step == 100) {
                    assertContentEquals(vdSdrFoveaSuffix(mode), bytes)
                } else {
                    val rgb = if (mode == FoveaMode.OFF) "c" else
                        "clamp(_valve1_d2020d709*texture(tex0,uv).rgb,0.,1.)"
                    val exponent = String.format(Locale.US, "%.2f", extraGamma)
                    assertTrue(suffix.startsWith("\ncolor.rgb=pow($rgb,vec3($exponent))*fFadeAmount;\n"),
                        "Gamma must operate on clamped pre-fade RGB: $mode / $extraGamma")
                    assertEquals(1, Regex("color\\.rgb=").findAll(suffix).count())
                    assertEquals(1, Regex("fFadeAmount").findAll(suffix).count())
                }
            }
            assertContentEquals(vdSdrFoveaSuffix(FoveaMode.INPUT_8BIT, extraGamma),
                vdSdrFoveaSuffix(FoveaMode.INPUT_10BIT, extraGamma))
        }
    }

    @Test
    fun `gamma rejects nonfinite and out of range values with stable substep rounding`() {
        for (mode in FoveaMode.entries) {
            for (invalid in listOf(Float.NaN, Float.NEGATIVE_INFINITY, Float.POSITIVE_INFINITY,
                0f, .999f, 1.301f, Float.MAX_VALUE)) {
                assertFailsWith<PatchException>("$mode / $invalid") {
                    vdSdrFoveaSuffix(mode, invalid)
                }
            }
            assertContentEquals(vdSdrFoveaSuffix(mode), vdSdrFoveaSuffix(mode, 1.004f))
            assertContentEquals(vdSdrFoveaSuffix(mode, 1.01f), vdSdrFoveaSuffix(mode, 1.014f))
            assertContentEquals(vdSdrFoveaSuffix(mode, 1.02f), vdSdrFoveaSuffix(mode, 1.016f))
        }
    }

    @Test
    fun `gamma changes only the masked program on all exact calibrated bases`() = withDecoded { base, input ->
        val shader = findVideoShader(input)
        val calibrated = input.copyOf().apply {
            paddedVideoShader(1.2f, 1.45f, VideoOutputPrecision.SRGB8_HIGHP).copyInto(this, shader)
        }
        val before = calibrated.copyOf()
        val opaqueProgram = calibrated.copyOfRange(shader, shader + VIDEO_SHADER_SIZE + 1) +
            calibrated.copyOfRange(base.opaque, base.opaque + 30)
        for (mode in FoveaMode.entries) {
            for (extraGamma in listOf(1.01f, 1.05f, 1.30f)) {
                val output = applyVdSdrFovea(calibrated, base.version, base.code, mode, extraGamma)
                assertNotSame(calibrated, output)
                assertEquals(calibrated.size, output.size)
                assertTrue(calibrated.indices.all {
                    it in base.masked until base.masked + 296 || calibrated[it] == output[it]
                }, "Out-of-scope mutation: ${base.code} / $mode / $extraGamma")
                assertContentEquals(vdSdrFoveaSuffix(mode, extraGamma),
                    output.copyOfRange(base.masked, base.masked + 296))
                assertContentEquals(opaqueProgram,
                    output.copyOfRange(shader, shader + VIDEO_SHADER_SIZE + 1) +
                        output.copyOfRange(base.opaque, base.opaque + 30), "Complete opaque program changed")
                assertContentEquals(calibrated,
                    applyVdSdrFovea(output, base.version, base.code, FoveaMode.OFF, 1f),
                    "Gamma reset must restore the original calibrated library")
            }
        }
        assertContentEquals(before, calibrated, "Caller input mutated")
    }

    @Test
    fun `gamma transitions across modes are idempotent and restore both neutral variants`() = withDecoded { base, input ->
        val calibrated = input.copyOf().apply {
            paddedVideoShader(1.06f, 1.12f, VideoOutputPrecision.SRGB8_HIGHP)
                .copyInto(this, findVideoShader(input))
        }
        val transitions = listOf(FoveaMode.OFF to 1.01f, FoveaMode.INPUT_8BIT to 1.05f,
            FoveaMode.INPUT_10BIT to 1.30f, FoveaMode.OFF to 1.30f,
            FoveaMode.INPUT_10BIT to 1.01f, FoveaMode.INPUT_8BIT to 1f, FoveaMode.OFF to 1f)
        var previous = calibrated
        for ((mode, extraGamma) in transitions) {
            val output = applyVdSdrFovea(previous, base.version, base.code, mode, extraGamma)
            assertContentEquals(applyVdSdrFovea(calibrated, base.version, base.code, mode, extraGamma), output,
                "Transition mismatch: ${base.code} / $mode / $extraGamma")
            assertContentEquals(output, applyVdSdrFovea(output, base.version, base.code, mode, extraGamma),
                "Non-idempotent: ${base.code} / $mode / $extraGamma")
            previous = output
        }
        assertContentEquals(calibrated, previous)
    }

    @Test
    fun `gamma rejects unknown prefixes and corrupted owned suffixes atomically`() = withDecoded { base, input ->
        val shader = findVideoShader(input)
        val calibrated = input.copyOf().apply {
            paddedVideoShader(1.2f, 1.45f, VideoOutputPrecision.SRGB8_HIGHP).copyInto(this, shader)
        }
        val unknownPrefixes = listOf(input,
            calibrated.copyOf().also { it[shader + VIDEO_SHADER_SIZE - 1] = '!'.code.toByte() },
            input.copyOf().also {
                paddedVideoShader(1.2f, 1.45f, VideoOutputPrecision.SRGB8_HIGHP, VideoDitherMode.LOW)
                    .copyInto(it, shader)
            },
            input.copyOf().also {
                paddedVideoShader(1.2f, 1.45f, VideoOutputPrecision.RGB10_A2_EXPERIMENTAL)
                    .copyInto(it, shader)
            })
        for (source in unknownPrefixes) {
            val before = source.copyOf()
            for (mode in FoveaMode.entries) {
                assertFailsWith<PatchException>("Unknown prefix accepted: ${base.code} / $mode") {
                    applyVdSdrFovea(source, base.version, base.code, mode, 1.05f)
                }
                assertContentEquals(before, source)
            }
        }
        for (mode in FoveaMode.entries) {
            val owned = applyVdSdrFovea(calibrated, base.version, base.code, mode, 1.05f)
            val suffix = owned.copyOfRange(base.masked, base.masked + 296).toString(Charsets.US_ASCII)
            val corruptions = listOf(suffix.indexOf("1.05"), suffix.indexOf("color.a"), 295)
            for (relative in corruptions) {
                assertTrue(relative >= 0)
                val corrupt = owned.copyOf().also {
                    val offset = base.masked + relative
                    it[offset] = (it[offset].toInt() xor 1).toByte()
                }
                val before = corrupt.copyOf()
                for (nextGamma in listOf(1f, 1.30f)) {
                    assertFailsWith<PatchException>("Corrupted suffix accepted: ${base.code} / $mode / $relative") {
                        applyVdSdrFovea(corrupt, base.version, base.code, mode, nextGamma)
                    }
                    assertContentEquals(before, corrupt)
                }
            }
        }
    }

    @Test
    fun `optional calibration stays byte exact on the opaque program`() = withDecoded { base, input ->
        val shader = findVideoShader(input)
        for ((gamma, saturation) in listOf(1f to 1f, 1.2f to 1.45f, .5f to 0f, 2.5f to 3f)) {
            val calibrated = input.copyOf().apply {
                paddedVideoShader(gamma, saturation, VideoOutputPrecision.SRGB8_HIGHP)
                    .copyInto(this, shader)
            }
            val baselineProgram = calibrated.copyOfRange(shader, shader + VIDEO_SHADER_SIZE) +
                calibrated.copyOfRange(base.opaque, base.opaque + 29)
            for (mode in listOf(FoveaMode.INPUT_8BIT, FoveaMode.INPUT_10BIT)) {
                val output = applyVdSdrFovea(calibrated, base.version, base.code, mode)
                val opaqueProgram = output.copyOfRange(shader, shader + VIDEO_SHADER_SIZE) +
                    output.copyOfRange(base.opaque, base.opaque + 29)
                assertContentEquals(baselineProgram, opaqueProgram)
                assertContentEquals(calibrated,
                    applyVdSdrFovea(output, base.version, base.code, FoveaMode.OFF))
            }
        }
    }

    @Test
    fun `native route suffix and boundary corruptions fail without partial mutation`() = withDecoded { base, input ->
        val corruptions = listOf(base.masked, base.masked + 125, base.masked + 295,
            base.masked - 1, base.masked + 296, base.opaque, base.opaque - 1, base.opaque + 29,
            base.constructor + 40, base.renderer + 40)
        for (offset in corruptions) {
            val corrupt = input.copyOf().also { it[offset] = (it[offset].toInt() xor 1).toByte() }
            val before = corrupt.copyOf()
            for (mode in FoveaMode.entries) {
                assertFailsWith<PatchException>("${base.code}: 0x${offset.toString(16)} / $mode") {
                    applyVdSdrFovea(corrupt, base.version, base.code, mode)
                }
                assertContentEquals(before, corrupt)
            }
        }
        val shortened = input.copyOf(input.size - 1)
        val before = shortened.copyOf()
        assertFailsWith<PatchException> {
            applyVdSdrFovea(shortened, base.version, base.code, FoveaMode.INPUT_10BIT)
        }
        assertContentEquals(before, shortened)
    }

    @Test
    fun `unknown pairs do not infer a neighboring layout`() {
        val source = byteArrayOf(3, 1, 4, 1, 5)
        for ((version, code) in listOf("2.0.22" to "5002363", "2.0.20" to "5001740", "2.0.22" to "5002322")) {
            for (mode in FoveaMode.entries) {
                for (extraGamma in listOf(1f, 1.05f, 1.30f)) {
                    val output = applyVdSdrFovea(source, version, code, mode, extraGamma)
                    assertContentEquals(source, output)
                    assertNotSame(source, output)
                }
            }
        }
    }

    // ---- 2.0.24/5002527: 411-byte masked suffix with Valve's vInnerFade edge control ----

    private val code5002527 = "5002527"
    private val masked5002527 = 0x9f70a
    private val opaque5002527 = 0x9b2c0
    private val innerFadeImmediate = 0xf661c
    private val stockSuffixHash5002527 = "86efda0fc6d87db53627ab0b0f20ec0b7dff6b5a45d580107aab1f148e372707"

    private fun scene5002527(): ByteArray? {
        val root = generateSequence(File(System.getProperty("user.dir")).canonicalFile) { it.parentFile }
            .firstOrNull { File(it, "patches/src/main/kotlin").isDirectory } ?: return null
        val file = File(root, "android-steamlinkvr-release-base-2.0.24-5002527/lib/arm64-v8a/libvrlink_scene.so")
        if (!file.isFile) return null
        return file.readBytes().also {
            assertEquals(2333472, it.size)
            assertEquals("cfa9a9081afe9f011d50088642b11c04c8c386f393231d434621121e2c65ea03", it.hash())
        }
    }

    private fun alphaTokens5002527(source: String): String = source.substring(source.indexOf("vec2 "))
        .replace(Regex("\\bgp\\b"), "placeInSection")
        .replace(Regex("\\bgd\\b"), "distCenter")
        .replace(Regex("\\s+"), "")

    @Test
    fun `inner-fade suffix variants are bounded NUL free and keep every stock alpha statement`() {
        val stock = vdSdrFoveaSuffix(FoveaMode.OFF, 1f, innerFade = true)
        assertEquals(411, stock.size)
        assertEquals(stockSuffixHash5002527, stock.hash())
        val stockTokens = alphaTokens5002527(stock.toString(Charsets.US_ASCII))
        assertTrue(stockTokens.contains("vInnerFade.xy"))
        assertTrue(stockTokens.contains("vInnerFade.zw"))
        for (step in 100..130) {
            val extraGamma = step / 100f
            for (mode in FoveaMode.entries) {
                val bytes = vdSdrFoveaSuffix(mode, extraGamma, innerFade = true)
                val suffix = bytes.toString(Charsets.US_ASCII)
                assertEquals(411, bytes.size, "$mode / $extraGamma")
                assertFalse(bytes.contains(0.toByte()), "Embedded NUL: $mode / $extraGamma")
                assertEquals(stockTokens, alphaTokens5002527(suffix), "Alpha or inner fade changed: $mode / $extraGamma")
                assertEquals(1, suffix.count { it == '}' })
                assertEquals(0, suffix.count { it == '{' })
                // Stock (OFF, gamma 1.00) assigns no RGB; every owned variant assigns it exactly once.
                val stockLike = mode == FoveaMode.OFF && step == 100
                assertEquals(if (stockLike) 0 else 1, Regex("color\\.rgb=").findAll(suffix).count())
                assertEquals(if (stockLike) 0 else 1, Regex("fFadeAmount").findAll(suffix).count())
            }
            assertContentEquals(vdSdrFoveaSuffix(FoveaMode.INPUT_8BIT, extraGamma, true),
                vdSdrFoveaSuffix(FoveaMode.INPUT_10BIT, extraGamma, true))
        }
        // The default argument keeps every legacy 296-byte suffix byte-identical.
        assertEquals("2bad22b297f2016866482551483c0ecd44f629ce4d9df1848eb55d6a03008623",
            vdSdrFoveaSuffix(FoveaMode.OFF).hash())
        assertEquals(296, vdSdrFoveaSuffix(FoveaMode.INPUT_10BIT, 1.2f).size)
        assertTrue(isGammaAdjustedFoveaSuffix(vdSdrFoveaSuffix(FoveaMode.OFF, 1.1f, innerFade = true)))
        assertFalse(isGammaAdjustedFoveaSuffix(vdSdrFoveaSuffix(FoveaMode.INPUT_10BIT, 1.1f, innerFade = true)))
        assertFalse(isGammaAdjustedFoveaSuffix(stock))
    }

    @Test
    fun `5002527 real decoded renderer changes only the masked suffix and restores exactly`() {
        val input = scene5002527()
        assumeTrue("BLOCKED: decoded 2.0.24/5002527 scene is absent", input != null)
        input!!
        assertEquals(stockSuffixHash5002527, input.copyOfRange(masked5002527, masked5002527 + 411).hash())
        val before = input.copyOf()
        val eight = applyVdSdrFovea(input, "2.0.24", code5002527, FoveaMode.INPUT_8BIT)
        val ten = applyVdSdrFovea(input, "2.0.24", code5002527, FoveaMode.INPUT_10BIT)
        assertContentEquals(before, input, "Caller input mutated")
        assertContentEquals(eight, ten)
        val changes = input.indices.filter { input[it] != eight[it] }
        assertTrue(changes.isNotEmpty())
        assertTrue(changes.all { it in masked5002527 until masked5002527 + 411 }, "Out-of-scope mutation")
        val prefix = findVideoShader(input, VIDEO_SHADER_SIZE_INNER_FADE)
        assertContentEquals(input.copyOfRange(prefix, prefix + VIDEO_SHADER_SIZE_INNER_FADE + 1),
            eight.copyOfRange(prefix, prefix + VIDEO_SHADER_SIZE_INNER_FADE + 1), "Common prefix or terminator changed")
        assertContentEquals(input.copyOfRange(opaque5002527 - 1, opaque5002527 + 30),
            eight.copyOfRange(opaque5002527 - 1, opaque5002527 + 30), "Opaque suffix or boundary changed")
        assertEquals(0, eight[masked5002527 - 1].toInt())
        assertEquals(0, eight[masked5002527 + 411].toInt())
        val suffix = eight.copyOfRange(masked5002527, masked5002527 + 411).toString(Charsets.US_ASCII)
        assertEquals(alphaTokens5002527(input.copyOfRange(masked5002527, masked5002527 + 411).toString(Charsets.US_ASCII)),
            alphaTokens5002527(suffix), "Valve alpha math or inner fade changed")
        for (mode in FoveaMode.entries) {
            val first = applyVdSdrFovea(input, "2.0.24", code5002527, mode)
            assertContentEquals(first, applyVdSdrFovea(first, "2.0.24", code5002527, mode))
            for (next in FoveaMode.entries) {
                assertContentEquals(applyVdSdrFovea(input, "2.0.24", code5002527, next),
                    applyVdSdrFovea(first, "2.0.24", code5002527, next), "$mode -> $next")
            }
            assertContentEquals(input, applyVdSdrFovea(first, "2.0.24", code5002527, FoveaMode.OFF))
        }
    }

    @Test
    fun `5002527 gamma transitions require the exact calibration prefix and restore the original`() {
        val input = scene5002527()
        assumeTrue("BLOCKED: decoded 2.0.24/5002527 scene is absent", input != null)
        input!!
        val shader = findVideoShader(input, VIDEO_SHADER_SIZE_INNER_FADE)
        val calibrated = input.copyOf().apply {
            paddedVideoShader(1.2f, 1.45f, VideoOutputPrecision.SRGB8_HIGHP, innerFade = true).copyInto(this, shader)
        }
        val transitions = listOf(FoveaMode.OFF to 1.01f, FoveaMode.INPUT_8BIT to 1.05f,
            FoveaMode.INPUT_10BIT to 1.30f, FoveaMode.OFF to 1.30f,
            FoveaMode.INPUT_10BIT to 1.01f, FoveaMode.INPUT_8BIT to 1f, FoveaMode.OFF to 1f)
        var previous = calibrated
        for ((mode, extraGamma) in transitions) {
            val output = applyVdSdrFovea(previous, "2.0.24", code5002527, mode, extraGamma)
            assertContentEquals(applyVdSdrFovea(calibrated, "2.0.24", code5002527, mode, extraGamma), output)
            assertContentEquals(output, applyVdSdrFovea(output, "2.0.24", code5002527, mode, extraGamma))
            assertTrue(calibrated.indices.all {
                it in masked5002527 until masked5002527 + 411 || calibrated[it] == output[it]
            }, "Out-of-scope mutation: $mode / $extraGamma")
            assertContentEquals(vdSdrFoveaSuffix(mode, extraGamma, true),
                output.copyOfRange(masked5002527, masked5002527 + 411))
            previous = output
        }
        assertContentEquals(calibrated, previous)
        // Stock, altered and wrongly sized prefixes are never accepted for a gamma adjustment.
        val bad = listOf(input,
            calibrated.copyOf().also { it[shader + VIDEO_SHADER_SIZE_INNER_FADE - 1] = '!'.code.toByte() },
            input.copyOf().also {
                paddedVideoShader(1.2f, 1.45f, VideoOutputPrecision.SRGB8_HIGHP, VideoDitherMode.LOW, innerFade = true)
                    .copyInto(it, shader)
            })
        for (source in bad) {
            val snapshot = source.copyOf()
            assertFailsWith<PatchException> { applyVdSdrFovea(source, "2.0.24", code5002527, FoveaMode.OFF, 1.05f) }
            assertContentEquals(snapshot, source)
        }
    }

    @Test
    fun `5002527 guards reject every native route change including the vInnerFade consumer`() {
        val input = scene5002527()
        assumeTrue("BLOCKED: decoded 2.0.24/5002527 scene is absent", input != null)
        input!!
        val corruptions = listOf(masked5002527, masked5002527 + 200, masked5002527 + 410,
            masked5002527 - 1, masked5002527 + 411, opaque5002527, opaque5002527 - 1, opaque5002527 + 29,
            0xf5d7c + 40, 0xf5d7c + 507, 0xf6480 + 40, 0xf6480 + 779, innerFadeImmediate + 2)
        for (offset in corruptions) {
            val corrupt = input.copyOf().also { it[offset] = (it[offset].toInt() xor 1).toByte() }
            val before = corrupt.copyOf()
            for (mode in FoveaMode.entries) {
                assertFailsWith<PatchException>("0x${offset.toString(16)} / $mode") {
                    applyVdSdrFovea(corrupt, "2.0.24", code5002527, mode)
                }
                assertContentEquals(before, corrupt)
            }
        }
        // The stock vInnerFade consumer is `mov w1,#14` before SetUniformLVec4; it is never rewritten,
        // so a library whose immediate was moved (for example to 7) is not the audited stock layout.
        assertContentEquals(byteArrayOf(0xc1.toByte(), 0x01, 0x80.toByte(), 0x52),
            input.copyOfRange(innerFadeImmediate, innerFadeImmediate + 4))
        val moved = input.copyOf().also { byteArrayOf(0xe1.toByte(), 0x00, 0x80.toByte(), 0x52).copyInto(it, innerFadeImmediate) }
        for (mode in FoveaMode.entries) {
            assertFailsWith<PatchException> { applyVdSdrFovea(moved, "2.0.24", code5002527, mode) }
        }
        val shortened = input.copyOf(input.size - 1)
        assertFailsWith<PatchException> { applyVdSdrFovea(shortened, "2.0.24", code5002527, FoveaMode.INPUT_10BIT) }
        // Neighbouring pairs never select this layout and are not borrowed from it.
        for ((version, code) in listOf("2.0.24" to "5002526", "2.0.23" to "5002527".replace("7", "6"))) {
            assertContentEquals(input, applyVdSdrFovea(input, version, code, FoveaMode.INPUT_10BIT))
        }
        assertFailsWith<PatchException> { applyVdSdrFovea(input, "2.0.24", "5002395", FoveaMode.INPUT_10BIT) }
    }

    @Test
    fun `synthetic 5002527 buffers fail closed without the exact native identity`() {
        // Portable malformed-input rejection: right size, wrong bytes.
        val blank = ByteArray(2333472)
        for (mode in FoveaMode.entries) {
            assertFailsWith<PatchException>("$mode") { applyVdSdrFovea(blank, "2.0.24", code5002527, mode) }
        }
        val onlySuffix = ByteArray(2333472).apply {
            vdSdrFoveaSuffix(FoveaMode.OFF, 1f, innerFade = true).copyInto(this, masked5002527)
        }
        assertFailsWith<PatchException> { applyVdSdrFovea(onlySuffix, "2.0.24", code5002527, FoveaMode.OFF) }
        assertFailsWith<PatchException> { applyVdSdrFovea(ByteArray(128), "2.0.24", code5002527, FoveaMode.OFF) }
    }

    private fun ByteArray.hash() = MessageDigest.getInstance("SHA-256").digest(this)
        .joinToString("") { "%02x".format(it) }
}
