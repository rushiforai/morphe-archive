package util

import app.template.patches.steamlink.binary.*
import java.io.File
import java.security.MessageDigest

/** Assembles the COMPLETE opaque and edge-mask video shaders that Valve's native code builds at
 * runtime, from the production common prefix (paddedVideoShader) and each base's actual native
 * suffix strings. Baseline recipe: neutral, srgb8-highp, dither off; comparison rows: low/standard;
 * fovea rows: both VD-like toggles use neutral SDR sampled RGB, without shader noise.
 *
 * The suffixes are located by unique content anchors and C-string terminators, never by neighbor
 * offsets. Writes assembled .glsl files plus a report for a separate strict GLSL check.
 * Does not modify any input, does not run the Morphe DSL, and does not establish GLSL driver
 * compilation, runtime format acceptance or panel output.
 */
object Sdr10ShaderAssembleAudit {
    private data class Base(
        val version: String,
        val code: String,
        val size: Int,
        val hash: String,
    )

    private val bases = listOf(
        Base("2.0.20", "5001712", 2_221_072, "80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495"),
        Base("2.0.22", "5002244", 2_251_920, "4b2fa5e1b5d9d5c938873f692b0e5e18159e1199dee1253dd6eccc8fa43dfa12"),
        Base("2.0.23", "5002363", 2_292_008, "628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0"),
    )

    // Unique content anchors. The suffix C strings are read from the anchor to their terminator.
    private val OPAQUE_ANCHOR = "color.a = 1.0;".toByteArray(Charsets.US_ASCII)
    private val MASK_ANCHOR = "vec2 placeInSection = fract(uvmask".toByteArray(Charsets.US_ASCII)

    private fun isText(byte: Byte): Boolean {
        val b = byte.toInt() and 255
        return (32..126).contains(b) || b == 9 || b == 10 || b == 13
    }

    private fun ByteArray.indicesOf(pattern: ByteArray): List<Int> {
        val matches = mutableListOf<Int>()
        for (i in 0..size - pattern.size) {
            if ((0 until pattern.size).all { this[i + it] == pattern[it] }) matches += i
        }
        return matches
    }

    /** Read one C string from a unique anchor: walk back to the string start, forward to the
     * terminator, and fail closed unless exactly one candidate exists with a clean boundary.
     */
    private fun cStringAt(data: ByteArray, anchor: ByteArray, what: String): ByteArray {
        val anchors = data.indicesOf(anchor)
        require(anchors.size == 1) { "Expected exactly one $what suffix anchor, found ${anchors.size}" }
        var start = anchors[0]
        while (start > 0 && isText(data[start - 1])) start--
        require(start == 0 || !isText(data[start - 1])) { "$what suffix does not start a C string" }
        var end = start
        while (end < data.size && isText(data[end])) end++
        val text = data.copyOfRange(start, end)
        require(anchors[0] in start until end) { "$what anchor outside the read string" }
        return text
    }

    private fun shaderInterface(text: String) = Regex("(?:layout\\s*\\([^)]*\\)\\s*)?(?:uniform|in|out)\\s+[^;]+;")
        .findAll(text).map { it.value.replace(Regex("\\b(?:highp|mediump|lowp)\\b"), "")
            .replace(Regex("\\s+"), "") }.toSet()

    private fun checkAssembled(assembled: String, stockInterface: Set<String>, what: String) {
        require(assembled.all { it.code < 128 && it != '\u0000' }) { "$what: non-ASCII byte" }
        require(assembled.startsWith("#version 300 es\n")) { "$what: missing version directive" }
        require(assembled.contains("#extension GL_OES_EGL_image_external_essl3 : enable")) { "$what: missing external-image extension" }
        require(assembled.contains("precision highp float;")) { "$what: not highp" }
        require(Regex("void\\s+main\\s*\\(\\s*\\)").findAll(assembled).count() == 1) { "$what: expected exactly one main()" }
        var depth = 0
        assembled.forEach { char ->
            when (char) {
                '{' -> depth++
                '}' -> {
                    depth--
                    require(depth >= 0) { "$what: unbalanced closing brace" }
                }
            }
        }
        require(depth == 0) { "$what: unbalanced braces (depth=$depth)" }
        var parens = 0
        assembled.forEach { char ->
            when (char) {
                '(' -> parens++
                ')' -> {
                    parens--
                    require(parens >= 0) { "$what: unbalanced closing paren" }
                }
            }
        }
        require(parens == 0) { "$what: unbalanced parens (depth=$parens)" }
        require(assembled.trimEnd().endsWith('}')) { "$what: must end with the main() closing brace" }
        require(shaderInterface(assembled) == stockInterface) { "$what: changed shader interface" }
        require(Regex("color\\.a\\s*=").containsMatchIn(assembled)) { "$what: alpha never assigned" }
    }

    @JvmStatic
    fun main(args: Array<String>) {
        require(args.size == 2) { "Usage: Sdr10ShaderAssembleAudit <repository-root> <output-dir>" }
        val root = File(args[0]).canonicalFile
        val output = File(args[1]).canonicalFile
        require(!output.exists() || output.listFiles().isNullOrEmpty()) { "Output directory must be absent or empty: $output" }
        output.mkdirs()
        val lines = mutableListOf<String>()
        var passed = 0
        val blocked = mutableListOf<String>()
        for (base in bases) {
            val library = File(root, "decoded-apk-android-steamlinkvr-release-base-${base.version}-${base.code}")
                .resolve("lib/arm64-v8a/libvrlink_scene.so")
            if (!library.isFile) {
                blocked += "${base.version}/${base.code}: decoded input missing at ${library.path}"
                continue
            }
            val stock = library.readBytes()
            require(stock.size == base.size) { "Wrong size for ${base.code}: ${stock.size}" }
            require(stock.sha256() == base.hash) { "Wrong hash for ${base.code}" }
            val shaderPos = findVideoShader(stock)
            val stockShader = stock.copyOfRange(shaderPos, shaderPos + VIDEO_SHADER_SIZE).toString(Charsets.US_ASCII)
            val stockInterface = shaderInterface(stockShader)
            require(stockInterface.size == 8) { "${base.code}: unexpected stock interface" }
            val opaqueSuffix = cStringAt(stock, OPAQUE_ANCHOR, "opaque").toString(Charsets.US_ASCII)
            val maskSuffix = cStringAt(stock, MASK_ANCHOR, "mask").toString(Charsets.US_ASCII)
            require(opaqueSuffix.contains("color.a = 1.0;") && opaqueSuffix.trimEnd().endsWith('}')) { "${base.code}: opaque suffix shape" }
            require(maskSuffix.contains("uvmask") && maskSuffix.contains("color.a = pow(") && maskSuffix.trimEnd().endsWith('}')) { "${base.code}: mask suffix shape" }
            val rows = mutableListOf<String>()
            val suffixOffset = stock.indicesOf(maskSuffix.toByteArray(Charsets.US_ASCII)).single()
            val cases = listOf(
                Triple("off", VideoDitherMode.OFF, FoveaMode.OFF),
                Triple("low", VideoDitherMode.LOW, FoveaMode.OFF),
                Triple("standard", VideoDitherMode.STANDARD, FoveaMode.OFF),
                Triple("fovea-input-8bit", VideoDitherMode.OFF, FoveaMode.INPUT_8BIT),
                Triple("fovea-input-10bit", VideoDitherMode.OFF, FoveaMode.INPUT_10BIT),
            )
            for ((label, dither, mode) in cases) for (gamma in
                if (dither == VideoDitherMode.OFF) listOf(1f, 1.02f, 1.10f, 1.30f) else listOf(1f)) {
                val caseLabel = if (gamma == 1f) label else "$label-gamma-${(gamma * 100).toInt()}"
                val common = paddedVideoShader(1f, 1f, VideoOutputPrecision.SRGB8_HIGHP, dither)
                val configured = stock.copyOf().apply { common.copyInto(this, shaderPos) }
                val modified = applyVdSdrFovea(configured, base.version, base.code, mode, gamma)
                val opaque = common.toString(Charsets.US_ASCII) + opaqueSuffix
                val mask = common.toString(Charsets.US_ASCII) + modified.copyOfRange(
                    suffixOffset, suffixOffset + maskSuffix.length).toString(Charsets.US_ASCII)
                checkAssembled(opaque, stockInterface, "${base.code}/${caseLabel}/opaque")
                checkAssembled(mask, stockInterface, "${base.code}/${caseLabel}/masked")
                File(output, "${base.code}-neutral-${caseLabel}.opaque.glsl").writeText(opaque)
                File(output, "${base.code}-neutral-${caseLabel}.masked.glsl").writeText(mask)
                rows += "${base.code}/${caseLabel}: opaque=${opaque.length}B masked=${mask.length}B"
            }
            passed++
            lines += "PASS ${base.version}/${base.code}: shader=0x${shaderPos.toString(16)}; opaqueSuffix=${opaqueSuffix.length}B; maskSuffix=${maskSuffix.length}B"
            lines += rows.joinToString("\n") { "  " + it }
        }
        lines += "Summary: ${passed} PASS, ${blocked.size} BLOCKED of ${bases.size} bases"
        blocked.forEach { lines += "BLOCKED: $it" }
        lines += "Scope: production common prefix + actual native suffixes, assembled byte-for-byte. A separate strict GLSL check and GLSL driver compilation remain; runtime format acceptance and panel output are not tested."
        File(output, "report.txt").writeText(lines.joinToString("\n") + "\n")
        println(lines.joinToString("\n"))
    }

    private fun ByteArray.sha256() = MessageDigest.getInstance("SHA-256").digest(this).joinToString("") { "%02x".format(it) }
}
