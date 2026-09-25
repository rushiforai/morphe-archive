package util

import app.morphe.patcher.patch.PatchException
import app.template.patches.steamlink.binary.*
import java.io.File

/** Real decoded-base proof for independently selected background/foveal blue noise.
 * Exercises the production installer; never writes fixtures or claims GPU/runtime acceptance.
 */
object BackgroundBlueNoiseDecodedAudit {
    private val markers = listOf(
        "SLBN_CONFIGURED_HASH_____________________________________________",
        "SLBN_STOCK_HASH__________________________________________________", "SLBN_FOVEA_PC____",
        "SLBN_BACKGROUND_HASH____________________________________________",
        "SLBN_BACKGROUND_STOCK___________________________________________", "SLBN_BASE_PC____",
    )

    // Independently verified suffix and distinct RenderSpecific return PCs, from native-layouts.json.
    private data class Background(val suffix: Int, val drawReturn: Long)
    private val backgrounds = mapOf(
        "5001712" to Background(0x9d23d, 0xf1d28L),
        "5002244" to Background(0x976e6, 0xeeb44L),
        "5002363" to Background(0x99013, 0xf1c84L),
    )

    @JvmStatic
    fun main(args: Array<String>) {
        require(args.size == 1) { "Usage: BackgroundBlueNoiseDecodedAudit <repository-root>" }
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
                check(Regex("(?m)^\\s*$key: ['\"]?${Regex.escape(value)}['\"]?\\s*$").containsMatchIn(metadata)) {
                    "Wrong $key in $directory"
                }
            }
            auditBase(library, layout)
            passed++
        }
        println("Summary: $passed PASS, ${blocked.size} BLOCKED of ${BLUE_NOISE_LAYOUTS.size} exact background/foveal blue-noise bases")
        blocked.forEach { println("BLOCKED: $it") }
        println("Scope: real decoded scene bytes, complete shader sources and canonical helper configuration. No Morphe APK packaging, Android linker/GPU execution, live host-shader coverage, headset or panel proof; 5001712 is an analysis reconstruction.")
    }

    private fun auditBase(library: File, layout: BlueNoiseLayout) {
        val stock = library.readBytes()
        check(stock.size == layout.size && blueNoiseHash(stock) == layout.stockHash) { "Wrong decoded input: $library" }
        check(findVideoShader(stock) == layout.prefix)
        check(layout.sites.size == 11)
        val background = backgrounds.getValue(layout.code)
        check(background.drawReturn != layout.drawReturn)
        val suffixes = mapOf(
            BlueNoiseLayer.FOVEA to stock.copyOfRange(layout.suffix, layout.suffix + 296),
            BlueNoiseLayer.BACKGROUND to stock.copyOfRange(background.suffix, background.suffix + 29),
        )
        check(suffixes.getValue(BlueNoiseLayer.BACKGROUND).toString(Charsets.US_ASCII) == "\n\t\t\tcolor.a = 1.0;\n        }\n")
        val stockHashes = mapOf(BlueNoiseLayer.FOVEA to BLUE_NOISE_STOCK_MASKED_HASH,
            BlueNoiseLayer.BACKGROUND to BLUE_NOISE_STOCK_BACKGROUND_HASH)
        val drawReturns = mapOf(BlueNoiseLayer.FOVEA to layout.drawReturn,
            BlueNoiseLayer.BACKGROUND to background.drawReturn)
        val originalPrefix = stock.copyOfRange(layout.prefix, layout.prefix + VIDEO_SHADER_SIZE)
        for (layer in BlueNoiseLayer.entries) {
            check(blueNoiseHash(originalPrefix + suffixes.getValue(layer)) == stockHashes.getValue(layer)) {
                "Stock full-source hash mismatch for $layer on ${layout.code}"
            }
        }
        val payload = bundledBlueNoiseHelper()
        check(blueNoiseHash(payload) == BLUE_NOISE_PAYLOAD_SHA256)
        val payloadText = payload.toString(Charsets.ISO_8859_1)
        val offsets = markers.map { marker ->
            val offset = payloadText.indexOf(marker)
            check(offset >= 0 && offset == payloadText.lastIndexOf(marker)) { "Missing/duplicate marker $marker" }
            check(payload[offset + marker.length] == 0.toByte())
            offset
        }
        val profiles = listOf<Pair<Float, Float>?>(null, 1f to 1f, 1.06f to 1.12f, 1.20f to 1.45f,
            .5f to 0f, .5f to 3f, 2.5f to 0f, 2.5f to 3f)
        fun baseline(profile: Pair<Float, Float>?): ByteArray {
            val bytes = stock.copyOf()
            if (profile != null) paddedVideoShader(profile.first, profile.second,
                VideoOutputPrecision.SRGB8_HIGHP, VideoDitherMode.OFF).copyInto(bytes, layout.prefix)
            return setProjectionSwapchainFormat(bytes, VideoOutputPrecision.SRGB8_HIGHP, layout.version, layout.code)
        }
        fun apply(state: BlueNoiseResult, layer: BlueNoiseLayer, mode: FoveaMode): BlueNoiseResult =
            applyBlueNoiseLayer(state.scene, layout.version, layout.code, mode, layer,
                payload = payload, existingHelper = state.helper)
        fun compose(bytes: ByteArray, fovea: FoveaMode, base: FoveaMode, reverse: Boolean = false): BlueNoiseResult {
            val initial = BlueNoiseResult(bytes, null)
            return if (reverse) apply(apply(initial, BlueNoiseLayer.BACKGROUND, base), BlueNoiseLayer.FOVEA, fovea)
                else apply(apply(initial, BlueNoiseLayer.FOVEA, fovea), BlueNoiseLayer.BACKGROUND, base)
        }
        fun verifyHelper(helper: ByteArray, scene: ByteArray, selected: Set<BlueNoiseLayer>) {
            check(helper.size == payload.size && isConfiguredBlueNoiseHelper(helper))
            val prefix = scene.copyOfRange(layout.prefix, layout.prefix + VIDEO_SHADER_SIZE)
            for (layer in BlueNoiseLayer.entries) {
                val values = if (layer in selected) listOf(blueNoiseHash(prefix + suffixes.getValue(layer)),
                    stockHashes.getValue(layer), drawReturns.getValue(layer).toString(16).padStart(16, '0'))
                    else markers.drop(layer.ordinal * 3).take(3)
                for (field in 0..2) {
                    val index = layer.ordinal * 3 + field
                    check(helper.copyOfRange(offsets[index], offsets[index] + markers[index].length)
                        .contentEquals(values[field].toByteArray(Charsets.US_ASCII).copyOf(markers[index].length))) {
                        "Wrong $layer field $field"
                    }
                    check(helper[offsets[index] + markers[index].length] == 0.toByte())
                }
            }
            check(payload.indices.all { byte -> payload[byte] == helper[byte] ||
                markers.indices.any { byte in offsets[it] until offsets[it] + markers[it].length } }) {
                "Unrelated helper byte changed"
            }
        }
        fun verify(state: BlueNoiseResult, baseline: ByteArray, selected: Set<BlueNoiseLayer>) {
            val scene = state.scene
            check(scene.size == stock.size && findVideoShader(scene) == layout.prefix)
            check(scene[layout.prefix + VIDEO_SHADER_SIZE] == 0.toByte())
            val prefix = scene.copyOfRange(layout.prefix, layout.prefix + VIDEO_SHADER_SIZE)
            check(prefix.contentEquals(baseline.copyOfRange(layout.prefix, layout.prefix + VIDEO_SHADER_SIZE)))
            for (layer in BlueNoiseLayer.entries) {
                val suffixOffset = if (layer == BlueNoiseLayer.FOVEA) layout.suffix else background.suffix
                val suffix = suffixes.getValue(layer)
                check(scene[suffixOffset - 1] == 0.toByte() && scene[suffixOffset + suffix.size] == 0.toByte())
                check(scene.copyOfRange(suffixOffset, suffixOffset + suffix.size).contentEquals(suffix))
                val complete = (prefix + suffix).toString(Charsets.US_ASCII)
                check(complete.count { it == '{' } == 1 && complete.count { it == '}' } == 1) {
                    "Complete $layer shader boundary changed"
                }
            }
            val formatOffsets = when (layout.code) {
                "5001712" -> intArrayOf(0x10a9c4, 0x10aa34)
                "5002244" -> intArrayOf(0x10826c, 0x1082dc, 0x10834c)
                "5002363" -> intArrayOf(0x10c840, 0x10c8b0, 0x10c920)
                else -> error("Missing independently verified format sites")
            }
            formatOffsets.forEach { offset ->
                val word = (0..3).fold(0) { value, byte -> value or ((scene[offset + byte].toInt() and 255) shl (byte * 8)) }
                check(word == (0x52800009 or (35907 shl 5))) { "Output is not sRGB8" }
            }
            check(baseline.indices.all { byte -> baseline[byte] == scene[byte] ||
                layout.sites.any { byte in it.offset until it.offset + it.stock.length + 1 } }) {
                "Scene mutation outside the existing shared hook sites"
            }
            layout.sites.forEach { site ->
                val expected = ((if (selected.isEmpty()) site.stock else site.hooked) + "\u0000")
                    .toByteArray(Charsets.US_ASCII).copyOf(site.stock.length + 1)
                check(scene.copyOfRange(site.offset, site.offset + expected.size).contentEquals(expected))
            }
            if (selected.isEmpty()) check(state.helper == null && scene.contentEquals(baseline))
            else verifyHelper(checkNotNull(state.helper), scene, selected)
        }
        var cases = 0
        var transitions = 0
        for (profile in profiles) {
            val base = baseline(profile)
            for (fovea in FoveaMode.entries) for (backgroundMode in FoveaMode.entries) {
                val modes = mapOf(BlueNoiseLayer.FOVEA to fovea, BlueNoiseLayer.BACKGROUND to backgroundMode)
                val selected = modes.filterValues { it != FoveaMode.OFF }.keys
                val result = compose(base, fovea, backgroundMode)
                verify(result, base, selected)
                check(same(result, compose(base, fovea, backgroundMode, reverse = true))) { "Finalize order changed output" }
                for ((layer, mode) in modes) {
                    check(same(result, apply(result, layer, mode))) { "Non-idempotent $layer/$mode" }
                    val removed = apply(result, layer, FoveaMode.OFF)
                    val remaining = selected - layer
                    verify(removed, base, remaining)
                    check(same(result, apply(removed, layer, mode))) { "Removing/re-adding $layer changed other layer" }
                    transitions += 3
                    if (mode != FoveaMode.OFF) {
                        val otherDepth = if (mode == FoveaMode.INPUT_8BIT) FoveaMode.INPUT_10BIT else FoveaMode.INPUT_8BIT
                        check(same(result, apply(result, layer, otherDepth))) { "Input depth changed final quantizer" }
                        transitions++
                    }
                }
                val allOff = apply(apply(result, BlueNoiseLayer.FOVEA, FoveaMode.OFF), BlueNoiseLayer.BACKGROUND, FoveaMode.OFF)
                val reverseOff = apply(apply(result, BlueNoiseLayer.BACKGROUND, FoveaMode.OFF), BlueNoiseLayer.FOVEA, FoveaMode.OFF)
                check(same(allOff, BlueNoiseResult(base, null)) && same(allOff, reverseOff)) { "Full OFF did not restore baseline" }
                cases++
            }
        }
        // A later calibration must refresh every selected source hash, not silently disable the other layer.
        val both = compose(baseline(null), FoveaMode.INPUT_10BIT, FoveaMode.INPUT_8BIT)
        val calibratedBase = baseline(1.20f to 1.45f)
        val calibratedScene = both.scene.copyOf().apply {
            calibratedBase.copyInto(this, layout.prefix, layout.prefix, layout.prefix + VIDEO_SHADER_SIZE)
        }
        for (layer in BlueNoiseLayer.entries) {
            val refreshed = apply(BlueNoiseResult(calibratedScene, both.helper), layer, FoveaMode.INPUT_10BIT)
            check(same(refreshed, compose(calibratedBase, FoveaMode.INPUT_10BIT, FoveaMode.INPUT_8BIT)))
        }
        var rejected = 0
        fun reject(input: ByteArray, helper: ByteArray?, what: String, canonical: ByteArray = payload) {
            val before = input.copyOf()
            val helperBefore = helper?.copyOf()
            val canonicalBefore = canonical.copyOf()
            for (layer in BlueNoiseLayer.entries) {
                var failed = false
                try { applyBlueNoiseLayer(input, layout.version, layout.code, FoveaMode.INPUT_8BIT, layer,
                    payload = canonical, existingHelper = helper) }
                catch (_: PatchException) { failed = true }
                check(failed) { "Failed to reject $what for $layer on ${layout.code}" }
                check(input.contentEquals(before) && canonical.contentEquals(canonicalBefore)) { "Rejected $what mutated input" }
                if (helper != null) check(helper.contentEquals(helperBefore)) { "Rejected $what mutated existing helper" }
                rejected++
            }
        }
        val bothHelper = checkNotNull(both.helper)
        for (index in markers.indices) {
            reject(both.scene, bothHelper.copyOf().apply { this[offsets[index]] = '!'.code.toByte() }, "malformed config $index")
            reject(both.scene, bothHelper.copyOf().apply {
                markers[index].toByteArray(Charsets.US_ASCII).copyInto(this, offsets[index])
            }, "partial config $index")
            reject(both.scene, bothHelper.copyOf().apply { this[offsets[index] + markers[index].length] = 1 }, "config boundary $index")
        }
        reject(both.scene, bothHelper.copyOf().apply { this[0] = (this[0].toInt() xor 1).toByte() }, "helper body")
        reject(both.scene, bothHelper.copyOf(bothHelper.size - 1), "truncated helper")
        reject(baseline(null), bothHelper, "helper on stock imports")
        reject(both.scene, payload, "unconfigured helper on hooked imports")
        reject(baseline(null), null, "bad canonical payload", payload.copyOf().apply { this[0] = 0 })
        for (foreign in BLUE_NOISE_LAYOUTS.filter { it.code != layout.code }) {
            val foreignHelper = configureBlueNoiseHelper(payload, "0123456789abcdef".repeat(4), foreign.drawReturn)
            reject(both.scene, foreignHelper, "cross-base helper ${foreign.code}")
        }
        for (guard in layout.guards) reject(baseline(null).apply {
            this[guard.offset + guard.size / 2] = (this[guard.offset + guard.size / 2].toInt() xor 1).toByte()
        }, null, "guard@0x${guard.offset.toString(16)}")
        for (site in layout.sites) reject(baseline(null).apply { this[site.offset] = '!'.code.toByte() }, null,
            "site@0x${site.offset.toString(16)}")
        for (suffix in listOf(layout.suffix to 296, background.suffix to 29)) {
            for (boundary in listOf(suffix.first - 1, suffix.first + suffix.second)) {
                reject(baseline(null).apply { this[boundary] = 1 }, null, "suffix boundary@0x${boundary.toString(16)}")
            }
        }
        for (layer in BlueNoiseLayer.entries) for (mode in FoveaMode.entries) {
            val unknown = applyBlueNoiseLayer(stock, layout.version, "0000000", mode, layer,
                payload = byteArrayOf(1), existingHelper = byteArrayOf(2))
            check(unknown.scene.contentEquals(stock) && unknown.helper == null)
        }
        check(library.readBytes().contentEquals(stock)) { "Decoded fixture changed" }
        check(blueNoiseHash(bundledBlueNoiseHelper()) == BLUE_NOISE_PAYLOAD_SHA256) { "Canonical payload changed" }
        println("PASS ${layout.version}/${layout.code}: $cases layer/depth cases across stock + 7 calibrations, $transitions transitions, $rejected atomic rejections; both orders, remove/re-add either layer, full OFF, calibration refresh, exact scene/config diffs, complete sources/alpha, distinct draw PCs, sRGB8, source unchanged")
    }

    private fun same(first: BlueNoiseResult, second: BlueNoiseResult): Boolean =
        first.scene.contentEquals(second.scene) && when {
            first.helper == null || second.helper == null -> first.helper == null && second.helper == null
            else -> first.helper.contentEquals(second.helper)
        }
}
