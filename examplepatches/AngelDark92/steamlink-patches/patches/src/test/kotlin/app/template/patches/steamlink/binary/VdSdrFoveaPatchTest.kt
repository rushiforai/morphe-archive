package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import org.junit.Assume.assumeTrue
import java.io.File
import java.security.MessageDigest
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
        DecodedBase("2.0.22", "5002244", 2251920,
            "4b2fa5e1b5d9d5c938873f692b0e5e18159e1199dee1253dd6eccc8fa43dfa12",
            0xa11d7, 0x976e6, 0xee210, 0xee910),
        DecodedBase("2.0.23", "5002363", 2292008,
            "628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0",
            0xa31bb, 0x99013, 0xf1350, 0xf1a50),
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
                val output = applyVdSdrFovea(source, version, code, mode)
                assertContentEquals(source, output)
                assertNotSame(source, output)
            }
        }
    }

    private fun ByteArray.hash() = MessageDigest.getInstance("SHA-256").digest(this)
        .joinToString("") { "%02x".format(it) }
}
