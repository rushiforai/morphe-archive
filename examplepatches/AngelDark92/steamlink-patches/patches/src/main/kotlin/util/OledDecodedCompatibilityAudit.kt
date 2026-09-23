package util

import app.template.patches.steamlink.binary.*
import java.io.File
import java.security.MessageDigest

/** Read-only exercise of production OLED helpers on hash-pinned decoded libraries.
 * Does not rebuild an APK, run the Morphe DSL, or establish headset format support.
 *
 * Covers the 3 exact color-supported Steam Link bases. A base whose decoded input is
 * unavailable is reported as an explicit BLOCKED row (with its exact prerequisite),
 * never silently skipped or substituted with a neighbor-derived fixture.
 *
 * Also covers the Fovea VD-Like toggle states (off / input 8-bit / input 10-bit):
 * the neutral SDR masked suffix, equal 8-/10-bit processing, and the unchanged
 * base/common-prefix golden bytes at the default calibration.
 */
object OledDecodedCompatibilityAudit {
    private data class Base(
        val version: String,
        val code: String,
        val size: Int,
        val hash: String,
        val offsets: IntArray,
    )

    private val bases = listOf(
        Base("2.0.20", "5001712", 2_221_072, "80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495", intArrayOf(0x10a9c4, 0x10aa34)),
        Base("2.0.22", "5002244", 2_251_920, "4b2fa5e1b5d9d5c938873f692b0e5e18159e1199dee1253dd6eccc8fa43dfa12", intArrayOf(0x10826c, 0x1082dc, 0x10834c)),
        Base("2.0.23", "5002363", 2_292_008, "628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0", intArrayOf(0x10c840, 0x10c8b0, 0x10c920)),
    )

    @JvmStatic
    fun main(args: Array<String>) {
        require(args.size == 1) { "Usage: OledDecodedCompatibilityAudit <repository-root>" }
        val root = File(args.single()).canonicalFile
        var passed = 0
        val blocked = mutableListOf<String>()
        for (base in bases) {
            val library = File(root, "decoded-apk-android-steamlinkvr-release-base-${base.version}-${base.code}")
                .resolve("lib/arm64-v8a/libvrlink_scene.so")
            if (!library.isFile) {
                blocked += recordBlocked(base, library)
                continue
            }
            auditBase(root, base)
            passed++
        }
        println("Summary: ${passed} PASS, ${blocked.size} BLOCKED of ${bases.size} exact color-supported bases")
        blocked.forEach { println("BLOCKED: $it") }
        println("Scope: real decoded native bytes + production helpers. Morphe APK packaging, GLSL driver compilation, runtime format acceptance and panel output are not tested.")
    }

    /** Missing decoded input: report BLOCKED with its exact prerequisite and cross-check the
     * production layout table so the gap is evidence, not a skipped row.
     */
    private fun recordBlocked(base: Base, library: File): String {
        check(isSupportedVideoLibrarySize(base.size)) {
            "Production layout table no longer lists ${base.version}/${base.code} size ${base.size}"
        }
        return "${base.version}/${base.code}: decoded libvrlink_scene.so missing at ${library.path}; " +
            "prerequisite is a pristine ${base.version}/${base.code} decoded base (expected " +
            "${base.size} bytes, sha256=${base.hash}, format sites ${base.offsets.joinToString { "0x${it.toString(16)}" }}). " +
            "The production layout table retains the exact pair and VideoOutputPrecisionTest covers the synthetic layout; no real-byte variant/transition evidence exists for this base."
    }

    private fun auditBase(root: File, base: Base) {
        val directory = File(root, "decoded-apk-android-steamlinkvr-release-base-${base.version}-${base.code}")
        val metadata = File(directory, "apktool.yml").readText()
        for ((key, value) in listOf("versionName" to base.version, "versionCode" to base.code)) {
            require(Regex("(?m)^\\s*$key: ['\"]?${Regex.escape(value)}['\"]?\\s*$").containsMatchIn(metadata)) {
                "Wrong $key in $directory"
            }
        }
        val library = File(directory, "lib/arm64-v8a/libvrlink_scene.so")
        val stock = library.readBytes()
        check(stock.size == base.size) { "Wrong stock native size: $library" }
        require(stock.sha256() == base.hash) { "Wrong stock native hash: $library" }
        val shader = findVideoShader(stock)
        // Precision qualifiers deliberately change; locations, types and names must not.
        fun shaderInterface(text: String) = Regex("(?:layout\\s*\\([^)]*\\)\\s*)?(?:uniform|in|out)\\s+[^;]+;")
            .findAll(text).map { it.value.replace(Regex("\\b(?:highp|mediump|lowp)\\b"), "")
                .replace(Regex("\\s+"), "") }.toSet()
        val stockInterface = shaderInterface(stock.copyOfRange(shader, shader + VIDEO_SHADER_SIZE).toString(Charsets.US_ASCII))
        check(stockInterface.size == 8) { "Unexpected stock shader interface on ${base.code}" }
        val profiles = listOf(1f to 1f, 1.06f to 1.12f, 1.20f to 1.45f,
            .5f to 0f, .5f to 3f, 2.5f to 0f, 2.5f to 3f)
        var variants = 0
        var transitions = 0
        var checkboxCases = 0
        fun apply(input: ByteArray, precision: VideoOutputPrecision, dither: VideoDitherMode, profile: Pair<Float, Float>): ByteArray {
            val result = input.copyOf()
            paddedVideoShader(profile.first, profile.second, precision, dither).copyInto(result, findVideoShader(result))
            return setProjectionSwapchainFormat(result, precision, base.version, base.code)
        }
        for (profile in profiles) for (precision in VideoOutputPrecision.entries) for (dither in VideoDitherMode.entries) {
            val output = apply(stock, precision, dither, profile)
            for (checked in listOf(false, true)) {
                val resolved = resolveVideoOutputPrecision(precision, dither, checked)
                val expected = if (checked && dither != VideoDitherMode.OFF)
                    VideoOutputPrecision.SRGB8_HIGHP else precision
                check(resolved == expected)
                // Exercise both checkbox states from an existing format, including restoration.
                check(apply(output, resolved, dither, profile)
                    .contentEquals(apply(stock, expected, dither, profile)))
                checkboxCases++
            }
            check(output.size == stock.size && findVideoShader(output) == shader)
            check(output[shader + VIDEO_SHADER_SIZE] == 0.toByte())
            val outputShader = output.copyOfRange(shader, shader + VIDEO_SHADER_SIZE).toString(Charsets.US_ASCII)
            check(shaderInterface(outputShader) == stockInterface) { "Changed shader interface on ${base.code}" }
            check(outputShader.contains("precision highp float;") && outputShader.contains("uniform highp samplerExternalOES tex0;"))
            check(outputShader.contains("DITHER_ENABLE=${if (dither == VideoDitherMode.OFF) "0" else "1"}.;"))
            check(outputShader.contains("step(vec3(.04045)") == (precision != VideoOutputPrecision.SRGB8_HIGHP))
            check(!outputShader.contains('}') && outputShader.count { it == '{' } == 1) { "Common fragment must leave main open for Valve's alpha suffix" }
            check(stock.indices.all { index -> stock[index] == output[index] ||
                index in shader until shader + VIDEO_SHADER_SIZE || base.offsets.any { index in it until it + 4 } })
            val expectedFormat = when (precision) {
                VideoOutputPrecision.SRGB8_HIGHP -> 35907
                VideoOutputPrecision.RGB10_A2_EXPERIMENTAL -> 32857
                VideoOutputPrecision.RGBA16F_EXPERIMENTAL -> 34842
            }
            for (offset in base.offsets) {
                val instruction = (0..3).fold(0) { word, byte -> word or ((output[offset + byte].toInt() and 255) shl (byte * 8)) }
                check(instruction == (0x52800009 or (expectedFormat shl 5))) { "Wrong MOV W9 format at $offset" }
            }
            check(apply(output, precision, dither, profile).contentEquals(output)) { "Non-idempotent mode" }
            // Each source mode must reach the same bytes as patching stock directly.
            for (next in VideoOutputPrecision.entries) for (nextDither in VideoDitherMode.entries) {
                check(apply(output, next, nextDither, profile).contentEquals(apply(stock, next, nextDither, profile)))
                transitions++
            }
            variants++
        }
        // Current VD options use the same SDR foveal suffix for either input depth.
        // Calibration/base program and the both-off golden remain unchanged.
        fun applyFovea(input: ByteArray, profile: Pair<Float, Float>, mode: FoveaMode): ByteArray =
            applyVdSdrFovea(apply(input, VideoOutputPrecision.SRGB8_HIGHP,
                VideoDitherMode.OFF, profile), base.version, base.code, mode)
        val suffix = when (base.code) {
            "5001712" -> 0xa6582
            "5002244" -> 0xa11d7
            "5002363" -> 0xa31bb
            else -> error("Unverified masked suffix")
        }
        var foveaCases = 0
        for (mode in FoveaMode.entries) for (profile in profiles) {
            val output = applyFovea(stock, profile, mode)
            val off = applyFovea(stock, profile, FoveaMode.OFF)
            check(output.size == stock.size && findVideoShader(output) == shader)
            check(output[shader + VIDEO_SHADER_SIZE] == 0.toByte() && output[suffix + 296] == 0.toByte())
            check(output.copyOfRange(shader, shader + VIDEO_SHADER_SIZE)
                .contentEquals(off.copyOfRange(shader, shader + VIDEO_SHADER_SIZE)))
            check(output.indices.all { output[it] == off[it] || it in suffix until suffix + 296 })
            check(output.contentEquals(applyFovea(output, profile, mode)))
            for (next in FoveaMode.entries) {
                check(applyFovea(output, profile, next).contentEquals(applyFovea(stock, profile, next)))
            }
            if (mode != FoveaMode.OFF) {
                val masked = output.copyOfRange(suffix, suffix + 296).toString(Charsets.US_ASCII)
                check(masked.contains("color.rgb=clamp(_valve1_d2020d709*texture(tex0,uv).rgb,0.,1.)*fFadeAmount;"))
                check(!masked.contains("UniDitherOffsets") && masked.contains("_valve1_d2020d709"))
                check(applyFovea(stock, profile, FoveaMode.INPUT_8BIT)
                    .contentEquals(applyFovea(stock, profile, FoveaMode.INPUT_10BIT)))
            }
            if (profile == (1.20f to 1.45f)) {
                check(output.copyOfRange(shader, shader + VIDEO_SHADER_SIZE).sha256() ==
                    "a0117d0c0e78b251b979ec4e2094ae03f07eac1386c6971268d8d1543129681b")
            }
            foveaCases++
        }
        check(library.readBytes().sha256() == base.hash) { "Source modified" }
        println("PASS ${base.version}/${base.code}: $variants variants, $transitions transitions, $checkboxCases checkbox cases, $foveaCases VD SDR fovea toggle cases (base golden unchanged); exact diff, format instructions, NUL boundary, idempotence; source unchanged")
        println("  sha256=${base.hash}; size=${stock.size}; shader=0x${shader.toString(16)}; formats=${base.offsets.joinToString { "0x${it.toString(16)}" }}")
    }

    private fun ByteArray.sha256() = MessageDigest.getInstance("SHA-256").digest(this).joinToString("") { "%02x".format(it) }
}
