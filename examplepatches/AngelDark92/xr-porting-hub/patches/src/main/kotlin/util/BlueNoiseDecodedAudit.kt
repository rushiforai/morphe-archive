package util

import app.morphe.patcher.patch.PatchException
import app.template.patches.steamlink.binary.*
import java.io.File
import java.security.MessageDigest

/** Exercises the separate blue-noise installer against real hash-pinned decoded inputs.
 * Both declared input depths share one final output quantizer. OFF restores stock imports.
 * This validates packaged bytes/configuration, not Android linking, shader execution or panel output.
 */
object BlueNoiseDecodedAudit {
    @JvmStatic
    fun main(args: Array<String>) {
        require(args.size == 1) { "Usage: BlueNoiseDecodedAudit <repository-root>" }
        val root = File(args.single()).canonicalFile
        var passed = 0
        val blocked = mutableListOf<String>()
        for (layout in BLUE_NOISE_LAYOUTS) {
            val directory = File(root, "decoded-apk-android-steamlinkvr-release-base-${layout.version}-${layout.code}")
            val library = File(directory, "lib/arm64-v8a/libvrlink_scene.so")
            if (!library.isFile) {
                blocked += "${layout.version}/${layout.code}: missing ${library.path}"
                continue
            }
            val metadata = File(directory, "apktool.yml").readText()
            for ((key, value) in listOf("versionName" to layout.version, "versionCode" to layout.code)) {
                require(Regex("(?m)^\\s*$key: ['\"]?${Regex.escape(value)}['\"]?\\s*$").containsMatchIn(metadata)) {
                    "Wrong $key in $directory"
                }
            }
            auditBase(library, layout)
            passed++
        }
        println("Summary: $passed PASS, ${blocked.size} BLOCKED of ${BLUE_NOISE_LAYOUTS.size} exact blue-noise bases")
        blocked.forEach { println("BLOCKED: $it") }
        println("Scope: real decoded scene bytes + canonical helper configuration. No Morphe APK packaging, Android linker/GPU execution, live host-shader coverage, headset or panel proof.")
    }

    private fun auditBase(library: File, layout: BlueNoiseLayout) {
        val stock = library.readBytes()
        check(stock.size == layout.size && stock.sha256() == layout.stockHash) { "Wrong decoded input: $library" }
        // Layout-specific sizes: 2.0.24/5002527 declares Valve's vInnerFade in a 1206-byte prefix and
        // a 411-byte masked suffix; every earlier base keeps 1087 / 296.
        val shaderSize = layout.shaderSize
        val maskedSize = layout.maskedSize
        val innerFade = shaderSize == VIDEO_SHADER_SIZE_INNER_FADE
        val shader = findVideoShader(stock, shaderSize)
        check(shader == layout.prefix)
        // Null preserves the stock prefix; optional OLED profiles use dither OFF.
        val profiles = listOf<Pair<Float, Float>?>(null, 1f to 1f, 1.06f to 1.12f, 1.20f to 1.45f,
            .5f to 0f, .5f to 3f, 2.5f to 0f, 2.5f to 3f)
        fun baseline(input: ByteArray, profile: Pair<Float, Float>?): ByteArray {
            val result = input.copyOf()
            val source = if (profile == null) stock.copyOfRange(shader, shader + shaderSize)
                else paddedVideoShader(profile.first, profile.second, VideoOutputPrecision.SRGB8_HIGHP,
                    VideoDitherMode.OFF, innerFade = innerFade)
            source.copyInto(result, shader)
            return setProjectionSwapchainFormat(result, VideoOutputPrecision.SRGB8_HIGHP, layout.version, layout.code)
        }
        // Both declared input depths use the SAME final 8-bit quantizer. The embedded
        // prefix is undithered; the native helper rewrites only recognized masked shaders.
        val foveaModes = FoveaMode.entries
        check(layout.sites.size == 11) { "Expected 1 dependency, 6 imports, and 4 loader names" }
        // Each layout names its own helper payload: 5002527 uses the inner-fade variant (helper
        // slots 16/17) so Valve's vInnerFade at location 14 is never moved; every other base uses
        // the standard helper. Never load the standard helper for every layout.
        val payload = layout.helper.bundled()
        check(payload.sha256() == layout.helper.sha256) { "Wrong canonical native payload for ${layout.helper}" }
        val maskedSuffix = stock.copyOfRange(layout.suffix, layout.suffix + maskedSize)
        check((stock.copyOfRange(shader, shader + shaderSize) + maskedSuffix).sha256() ==
            layout.maskedStockHash) { "Stock masked source allowlist mismatch" }

        val configMarkers = listOf(
            "SLBN_CONFIGURED_HASH_____________________________________________",
            "SLBN_STOCK_HASH__________________________________________________",
            "SLBN_FOVEA_PC____",
        )
        val configOffsets = configMarkers.map { marker ->
            val pattern = marker.toByteArray(Charsets.US_ASCII)
            val matches = (0..payload.size - pattern.size).filter { offset ->
                pattern.indices.all { payload[offset + it] == pattern[it] }
            }
            check(matches.size == 1) { "Canonical helper marker is not unique: $marker" }
            matches.single()
        }
        fun verifyHelper(helper: ByteArray, maskedHash: String) {
            check(helper.size == payload.size)
            val values = listOf(maskedHash, layout.maskedStockHash,
                layout.drawReturn.toString(16).padStart(16, '0'))
            configMarkers.indices.forEach { index ->
                val start = configOffsets[index]
                val value = values[index].toByteArray(Charsets.US_ASCII).copyOf(configMarkers[index].length)
                check(helper.copyOfRange(start, start + value.size).contentEquals(value)) {
                    "Incorrect helper configuration on ${layout.code}: ${configMarkers[index]}"
                }
                check(helper[start + value.size] == 0.toByte()) { "Helper config terminator changed" }
            }
            check(payload.indices.all { index -> payload[index] == helper[index] ||
                configMarkers.indices.any { index in configOffsets[it] until
                    configOffsets[it] + configMarkers[it].length } }) { "Unrelated helper byte changed" }
        }
        fun applyFovea(
            input: ByteArray,
            profile: Pair<Float, Float>?,
            mode: FoveaMode,
        ): BlueNoiseResult {
            val baseline = baseline(input, profile)
            return applyFovealBlueNoise(baseline, layout.version, layout.code, mode, payload)
        }
        fun sameResult(first: BlueNoiseResult, second: BlueNoiseResult): Boolean =
            first.scene.contentEquals(second.scene) && when {
                first.helper == null || second.helper == null -> first.helper == null && second.helper == null
                else -> first.helper.contentEquals(second.helper)
            }
        var foveaCases = 0
        var foveaTransitions = 0
        for (mode in foveaModes) {
            for (profile in profiles) {
                val baseline = baseline(stock, profile)
                val result = applyFovea(stock, profile, mode)
                val output = result.scene
                check(output.size == stock.size && findVideoShader(output, shaderSize) == shader)
                check(output[shader + shaderSize] == 0.toByte())
                val outputShader = output.copyOfRange(shader, shader + shaderSize).toString(Charsets.US_ASCII)
                if (profile != null) check(outputShader.contains("const float DITHER_ENABLE=0.;")) { "Embedded additive dither must stay disabled" }
                check(!outputShader.contains("float f=clamp(1.-dot(d,d)*4.,0.,1.);")) { "Separate blue-noise baseline contains the OLED fovea gate" }
                check(!outputShader.contains('}') && outputShader.count { it == '{' } == 1) { "Common fragment must leave main open for Valve's alpha suffix ($mode)" }
                check(output.copyOfRange(shader, shader + shaderSize)
                    .contentEquals(baseline.copyOfRange(shader, shader + shaderSize)))
                check(output.copyOfRange(layout.suffix, layout.suffix + maskedSize).contentEquals(maskedSuffix))
                val formatOffsets = swapchainFormatOffsets(layout.code)
                for (offset in formatOffsets) {
                    val instruction = (0..3).fold(0) { word, byte -> word or ((output[offset + byte].toInt() and 255) shl (byte * 8)) }
                    check(instruction == (0x52800009 or (35907 shl 5))) { "Fovea mode must retain sRGB8 output" }
                }
                check(baseline.indices.all { index -> baseline[index] == output[index] ||
                    layout.sites.any { index in it.offset until it.offset + it.stock.length + 1 } }) {
                    "Out-of-scope blue-noise byte changed on ${layout.code} ($mode)"
                }
                layout.sites.forEach { site ->
                    val expected = ((if (mode == FoveaMode.OFF) site.stock else site.hooked) + "\u0000")
                        .toByteArray(Charsets.US_ASCII).copyOf(site.stock.length + 1)
                    check(output.copyOfRange(site.offset, site.offset + expected.size).contentEquals(expected))
                    if (mode != FoveaMode.OFF) check(!expected.contentEquals(
                        baseline.copyOfRange(site.offset, site.offset + expected.size))) { "Hook site did not change" }
                }
                if (mode == FoveaMode.OFF) {
                    check(result.helper == null && output.contentEquals(baseline)) { "OFF baseline changed" }
                } else {
                    verifyHelper(checkNotNull(result.helper),
                        (output.copyOfRange(shader, shader + shaderSize) + maskedSuffix).sha256())
                    val otherDepth = if (mode == FoveaMode.INPUT_8BIT) FoveaMode.INPUT_10BIT else FoveaMode.INPUT_8BIT
                    check(sameResult(result, applyFovea(stock, profile, otherDepth))) { "Input declarations must share the output quantizer" }
                }
                check(sameResult(result, applyFovea(output, profile, mode))) { "Non-idempotent fovea mode on ${layout.code} ($mode)" }
                for (nextMode in foveaModes) {
                    check(sameResult(applyFovea(output, profile, nextMode), applyFovea(stock, profile, nextMode))) {
                        "Fovea transition mismatch on ${layout.code} ($mode -> $nextMode)"
                    }
                    foveaTransitions++
                }
                // The golden prefix hash was recorded for the 1087-byte block; the 5002527 prefix
                // (1206 bytes, vInnerFade declared) is checked by the generic equality above.
                if (profile == (1.20f to 1.45f) && !innerFade) {
                    val outShaderBytes = output.copyOfRange(shader, shader + shaderSize)
                    check(outShaderBytes.sha256() == "a0117d0c0e78b251b979ec4e2094ae03f07eac1386c6971268d8d1543129681b") {
                        "Legacy dither-off golden prefix changed on ${layout.code} ($mode)"
                    }
                }
                foveaCases++
            }
        }

        // Corrupt real input at every guarded route and ensure the production helper refuses
        // it without changing the caller's bytes. These are negative controls, not fixtures.
        var rejected = 0
        fun rejectUnchanged(input: ByteArray, what: String, badPayload: ByteArray = payload) {
            val before = input.copyOf()
            var failed = false
            try { applyFovealBlueNoise(input, layout.version, layout.code, FoveaMode.INPUT_8BIT, badPayload) }
            catch (_: PatchException) { failed = true }
            check(failed) { "Failed to reject $what on ${layout.code}" }
            check(input.contentEquals(before)) { "Partial mutation on rejected $what" }
            rejected++
        }
        layout.guards.forEach { guard ->
            val corrupted = stock.copyOf()
            corrupted[guard.offset + guard.size / 2] = (corrupted[guard.offset + guard.size / 2].toInt() xor 1).toByte()
            rejectUnchanged(corrupted, "guard@0x${guard.offset.toString(16)}")
        }
        layout.sites.forEach { site ->
            val corrupted = stock.copyOf()
            corrupted[site.offset] = '!'.code.toByte()
            rejectUnchanged(corrupted, "site@0x${site.offset.toString(16)}")
        }
        val mixed = stock.copyOf()
        (layout.sites.first().hooked + "\u0000").toByteArray(Charsets.US_ASCII)
            .copyOf(layout.sites.first().stock.length + 1).copyInto(mixed, layout.sites.first().offset)
        rejectUnchanged(mixed, "mixed import state")
        rejectUnchanged(stock.copyOf(stock.size - 1), "truncated library")
        val badBoundary = stock.copyOf().apply { this[layout.suffix + maskedSize] = 1 }
        rejectUnchanged(badBoundary, "masked suffix boundary")
        val badPayload = payload.copyOf().apply { this[lastIndex] = (this[lastIndex].toInt() xor 1).toByte() }
        rejectUnchanged(stock.copyOf(), "payload integrity", badPayload)
        for ((dither, gate) in listOf(
            VideoDitherMode.OFF to true,
            VideoDitherMode.STANDARD to true,
            VideoDitherMode.LOW to false,
            VideoDitherMode.STANDARD to false,
        )) {
            val stacked = stock.copyOf()
            paddedVideoShader(1.2f, 1.45f, VideoOutputPrecision.SRGB8_HIGHP, dither, gate, innerFade)
                .copyInto(stacked, shader)
            rejectUnchanged(stacked, "unsupported OLED prefix dither=$dither gate=$gate")
        }
        val unknownPrefix = stock.copyOf().apply { this[shader + 200] = '!'.code.toByte() }
        rejectUnchanged(unknownPrefix, "unrecognized embedded shader")
        val unknown = applyFovealBlueNoise(stock, layout.version, "0000000", FoveaMode.INPUT_8BIT, badPayload)
        check(unknown.scene.contentEquals(stock) && unknown.helper == null) { "Unknown pair must remain unchanged" }
        check(library.readBytes().sha256() == layout.stockHash) { "Source modified" }
        println("PASS ${layout.version}/${layout.code}: $foveaCases cases (stock + 7 optional dither-off calibrations), $foveaTransitions mode transitions, $rejected atomic guard rejections; identical 8-/10-bit quantizer, OFF golden, configured helper, exact diffs, sRGB8, NUL boundaries, idempotence; source unchanged")
    }

    // Independently verified projection-swapchain format sites per exact base (the same offsets
    // the OLED patch pins). 5002527 has two (base and fovea quad swapchains, no underside).
    private fun swapchainFormatOffsets(code: String): IntArray = when (code) {
        "5001712" -> SWAPCHAIN_FORMAT_OFFSETS_5001712
        "5001812" -> intArrayOf(0x10ab24, 0x10ab94)
        "5001968" -> intArrayOf(0x106a94, 0x106b04)
        "5002244" -> SWAPCHAIN_FORMAT_OFFSETS_5002244
        "5002363" -> SWAPCHAIN_FORMAT_OFFSETS_5002363
        "5002395" -> SWAPCHAIN_FORMAT_OFFSETS_5002395
        "5002527" -> SWAPCHAIN_FORMAT_OFFSETS_5002527
        else -> error("Missing independently verified format sites for $code")
    }

    private fun ByteArray.sha256() = MessageDigest.getInstance("SHA-256").digest(this).joinToString("") { "%02x".format(it) }
}
