package util

import app.template.patches.steamlink.binary.*
import java.io.File
import java.security.MessageDigest

/** Read-only exercise of production OLED helpers on 2 hash-pinned decoded libraries.
 * Does not rebuild an APK, run the Morphe DSL, or establish headset format support.
 */
object OledDecodedCompatibilityAudit {
    private data class Base(val version: String, val code: String, val hash: String, val offsets: IntArray)

    @JvmStatic
    fun main(args: Array<String>) {
        require(args.size == 1) { "Usage: OledDecodedCompatibilityAudit <repository-root>" }
        val root = File(args.single()).canonicalFile
        val bases = listOf(
            Base("2.0.20", "5001712", "80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495", intArrayOf(0x10a9c4, 0x10aa34)),
            Base("2.0.22", "5002322", "e61baf34dfc4749d92561bab5fee47891d271607a0ce44824ff61c3e6a450c3f", intArrayOf(0x10ba78, 0x10bae8, 0x10bb58)),
        )
        for (base in bases) {
            val directory = File(root, "decoded-apk-android-steamlinkvr-release-base-${base.version}-${base.code}")
            val metadata = File(directory, "apktool.yml").readText()
            for ((key, value) in listOf("versionName" to base.version, "versionCode" to base.code)) {
                require(Regex("(?m)^\\s*$key: ['\"]?${Regex.escape(value)}['\"]?\\s*$").containsMatchIn(metadata)) {
                    "Wrong $key in $directory"
                }
            }
            val library = File(directory, "lib/arm64-v8a/libvrlink_scene.so")
            val stock = library.readBytes()
            require(stock.sha256() == base.hash) { "Wrong stock native hash: $library" }
            val shader = findVideoShader(stock)
            // Precision qualifiers deliberately change; locations, types and names must not.
            fun shaderInterface(text: String) = Regex("(?:layout\\s*\\([^)]*\\)\\s*)?(?:uniform|in|out)\\s+[^;]+;")
                .findAll(text).map { it.value.replace(Regex("\\b(?:highp|mediump|lowp)\\b"), "")
                    .replace(Regex("\\s+"), "") }.toSet()
            val stockInterface = shaderInterface(stock.copyOfRange(shader, shader + VIDEO_SHADER_SIZE).toString(Charsets.US_ASCII))
            check(stockInterface.size == 8) { "Unexpected stock shader interface" }
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
            check(library.readBytes().sha256() == base.hash) { "Source modified" }
            println("PASS ${base.version}/${base.code}: $variants variants, $transitions transitions, $checkboxCases checkbox cases; exact diff, format instructions, NUL boundary, idempotence; source unchanged")
            println("  sha256=${base.hash}; size=${stock.size}; shader=0x${shader.toString(16)}; formats=${base.offsets.joinToString { "0x${it.toString(16)}" }}")
        }
        println("Scope: real decoded native bytes + production helpers. Morphe APK packaging, GLSL driver compilation, runtime format acceptance and panel output are not tested.")
    }

    private fun ByteArray.sha256() = MessageDigest.getInstance("SHA-256").digest(this).joinToString("") { "%02x".format(it) }
}
