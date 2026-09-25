package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import java.security.MessageDigest

internal data class BlueNoiseSite(val offset: Int, val stock: String, val hooked: String)
internal data class BlueNoiseGuard(val offset: Int, val size: Int, val hash: String)
internal data class BlueNoiseLayout(
    val version: String, val code: String, val size: Int, val stockHash: String,
    val prefix: Int, val suffix: Int, val drawReturn: Long,
    val sites: List<BlueNoiseSite>, val guards: List<BlueNoiseGuard>,
)
internal data class BlueNoiseResult(val scene: ByteArray, val helper: ByteArray?)
internal enum class BlueNoiseLayer { FOVEA, BACKGROUND }
private data class BlueNoiseTarget(val suffix: Int, val size: Int, val drawReturn: Long, val stockHash: String)
private fun blueNoiseTarget(layout: BlueNoiseLayout, layer: BlueNoiseLayer): BlueNoiseTarget =
    if (layer == BlueNoiseLayer.FOVEA) BlueNoiseTarget(layout.suffix, 296, layout.drawReturn, BLUE_NOISE_STOCK_MASKED_HASH)
    else when (layout.code) {
        "5001712" -> BlueNoiseTarget(0x9d23d, 29, 0xf1d28L, BLUE_NOISE_STOCK_BACKGROUND_HASH)
        "5002244" -> BlueNoiseTarget(0x976e6, 29, 0xeeb44L, BLUE_NOISE_STOCK_BACKGROUND_HASH)
        "5002363" -> BlueNoiseTarget(0x99013, 29, 0xf1c84L, BLUE_NOISE_STOCK_BACKGROUND_HASH)
        else -> throw PatchException("Unknown background blue-noise layout")
    }

internal fun blueNoiseHash(bytes: ByteArray): String =
    MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

private fun blueNoiseRequire(condition: Boolean, message: String) {
    if (!condition) throw PatchException(message)
}

internal fun bundledBlueNoiseHelper(): ByteArray =
    (object {}.javaClass.getResourceAsStream("/steamlink/blue-noise/libgxd.so")
        ?: throw PatchException("Missing blue-noise native payload" )).use { it.readBytes() }

private val BLUE_NOISE_CONFIG_MARKERS = listOf(
    "SLBN_CONFIGURED_HASH_____________________________________________",
    "SLBN_STOCK_HASH__________________________________________________", "SLBN_FOVEA_PC____",
    "SLBN_BACKGROUND_HASH____________________________________________",
    "SLBN_BACKGROUND_STOCK___________________________________________", "SLBN_BASE_PC____",
)

internal fun isConfiguredBlueNoiseHelper(bytes: ByteArray): Boolean {
    val stock = bundledBlueNoiseHelper()
    if (stock.size != bytes.size || blueNoiseHash(stock) != BLUE_NOISE_PAYLOAD_SHA256) return false
    val normalized = bytes.copyOf()
    BLUE_NOISE_CONFIG_MARKERS.forEach { marker ->
        val offset = stock.toString(Charsets.ISO_8859_1).indexOf(marker)
        if (offset < 0) return false
        stock.copyInto(normalized, offset, offset, offset + marker.length)
    }
    if (!normalized.contentEquals(stock)) return false
    return runCatching { blueNoiseConfiguration(bytes, stock); true }.getOrDefault(false)
}

private fun blueNoiseConfiguration(bytes: ByteArray, stock: ByteArray): Map<BlueNoiseLayer, List<String>> {
    val result = mutableMapOf<BlueNoiseLayer, List<String>>()
    for (layer in BlueNoiseLayer.entries) {
        val markers = BLUE_NOISE_CONFIG_MARKERS.drop(layer.ordinal * 3).take(3)
        val values = markers.map { marker ->
            val offset = stock.toString(Charsets.ISO_8859_1).indexOf(marker)
            blueNoiseRequire(offset >= 0 && bytes[offset + marker.length] == 0.toByte(), "Blue-noise config boundary mismatch")
            bytes.copyOfRange(offset, offset + marker.length).toString(Charsets.US_ASCII).trimEnd('\u0000')
        }
        if (values == markers) continue
        blueNoiseRequire(values[0].matches(Regex("[0-9a-f]{64}")) &&
            values[1].matches(Regex("[0-9a-f]{64}")) && values[2].matches(Regex("[0-9a-f]{16}")) &&
            values[2] != "0000000000000000", "Invalid or partial blue-noise layer configuration")
        result[layer] = values
    }
    return result
}

/** Validate every site before producing a copy; unknown or mixed states fail closed. Both input
 * declarations use the same output quantizer. This neither negotiates nor truncates decoder data.
 */
internal fun applyFovealBlueNoise(
    bytes: ByteArray, version: String, code: String, mode: FoveaMode,
    payload: ByteArray? = null,
): BlueNoiseResult = applyBlueNoiseLayer(bytes, version, code, mode, BlueNoiseLayer.FOVEA, payload)

/** Shared hook installation; each selectable patch owns only its layer configuration.
 * Existing owned configurations are rebuilt from the final source so either finalize order
 * gives identical bytes. No process-global patch-selection state is used.
 */
internal fun applyBlueNoiseLayer(
    bytes: ByteArray, version: String, code: String, mode: FoveaMode, layer: BlueNoiseLayer,
    payload: ByteArray? = null, existingHelper: ByteArray? = null,
): BlueNoiseResult {
    val layout = BLUE_NOISE_LAYOUTS.singleOrNull { it.version == version && it.code == code }
        ?: return BlueNoiseResult(bytes.copyOf(), null)
    blueNoiseRequire(bytes.size == layout.size, "Blue-noise native size mismatch for $version/$code")
    val states = layout.sites.map { site ->
        val stock = (site.stock + "\u0000").toByteArray(Charsets.US_ASCII)
        val hooked = (site.hooked + "\u0000").toByteArray(Charsets.US_ASCII).copyOf(stock.size)
        val actual = bytes.copyOfRange(site.offset, site.offset + stock.size)
        when {
            actual.contentEquals(stock) -> false
            actual.contentEquals(hooked) -> true
            else -> throw PatchException("Blue-noise import precondition failed at 0x${site.offset.toString(16)}")
        }
    }
    blueNoiseRequire(states.distinct().size == 1, "Mixed blue-noise import state")
    // An OFF patch on a stock route needs no new native feature. Preserve older calibration use.
    if (mode == FoveaMode.OFF && states.none { it } && existingHelper == null) return BlueNoiseResult(bytes.copyOf(), null)
    layout.guards.forEach { guard ->
        blueNoiseRequire(blueNoiseHash(bytes.copyOfRange(guard.offset, guard.offset + guard.size)) == guard.hash,
            "Blue-noise native route guard failed at 0x${guard.offset.toString(16)} for $version/$code")
    }
    blueNoiseRequire(findVideoShader(bytes) == layout.prefix, "Blue-noise shader position mismatch")
    BlueNoiseLayer.entries.forEach { targetLayer ->
        val target = blueNoiseTarget(layout, targetLayer)
        blueNoiseRequire(bytes[target.suffix - 1] == 0.toByte() && bytes[target.suffix + target.size] == 0.toByte(),
            "Blue-noise suffix boundary mismatch")
    }
    val canonical = payload ?: bundledBlueNoiseHelper()
    blueNoiseRequire(blueNoiseHash(canonical) == BLUE_NOISE_PAYLOAD_SHA256, "Blue-noise payload integrity mismatch")
    val selected = mutableSetOf<BlueNoiseLayer>()
    if (existingHelper != null) {
        blueNoiseRequire(isConfiguredBlueNoiseHelper(existingHelper), "Refusing unrecognized blue-noise helper")
        val configuration = blueNoiseConfiguration(existingHelper, canonical)
        blueNoiseRequire(states.all { it } && configuration.isNotEmpty(), "Helper/import state mismatch")
        configuration.forEach { (configuredLayer, values) ->
            val target = blueNoiseTarget(layout, configuredLayer)
            blueNoiseRequire(values[1] == target.stockHash && values[2] == target.drawReturn.toString(16).padStart(16, '0'),
                "Blue-noise helper belongs to a different layer/layout")
            selected += configuredLayer
        }
    }
    if (mode == FoveaMode.OFF) selected -= layer else selected += layer
    val enabled = selected.isNotEmpty()
    val helper = if (!enabled) null else {
        val prefix = bytes.copyOfRange(layout.prefix, layout.prefix + VIDEO_SHADER_SIZE)
        validateBlueNoisePrefix(prefix)
        configureBlueNoiseLayers(canonical, selected.associateWith { selectedLayer ->
            val target = blueNoiseTarget(layout, selectedLayer)
            listOf(blueNoiseHash(prefix + bytes.copyOfRange(target.suffix, target.suffix + target.size)),
                target.stockHash, target.drawReturn.toString(16).padStart(16, '0'))
        })
    }
    val result = bytes.copyOf()
    layout.sites.forEach { site ->
        ((if (enabled) site.hooked else site.stock) + "\u0000").toByteArray(Charsets.US_ASCII)
            .copyOf(site.stock.length + 1).copyInto(result, site.offset)
    }
    return BlueNoiseResult(result, helper)
}

private fun validateBlueNoisePrefix(prefix: ByteArray) {
    if (blueNoiseHash(prefix) == "cbf2d90eb70b9769dd64e57da5d76dbc38ab7213dcf7b940c956813a1ddaa99a") return
    val text = prefix.toString(Charsets.US_ASCII)
    val gamma = Regex("c=pow\\(clamp\\(c,0\\.,1\\.\\),vec3\\(([0-9]+\\.[0-9]{2})\\)\\);").find(text)
        ?.groupValues?.get(1)?.toFloatOrNull()
    val saturation = Regex("c=clamp\\(mix\\(vec3\\(y\\),c,([0-9]+\\.[0-9]{2})\\),0\\.,1\\.\\);").find(text)
        ?.groupValues?.get(1)?.toFloatOrNull()
    blueNoiseRequire(gamma != null && saturation != null && gamma in .5f..2.5f && saturation in 0f..3f &&
        prefix.contentEquals(paddedVideoShader(gamma, saturation, VideoOutputPrecision.SRGB8_HIGHP)),
        "Blue noise requires the exact stock shader or OLED calibration with both VD-like fovea toggles OFF; unknown or already-dithered shaders are not stacked")
}

internal fun configureBlueNoiseHelper(payload: ByteArray, configuredHash: String, drawReturn: Long): ByteArray {
    return configureBlueNoiseLayers(payload, mapOf(BlueNoiseLayer.FOVEA to listOf(
        configuredHash, BLUE_NOISE_STOCK_MASKED_HASH, drawReturn.toString(16).padStart(16, '0'))))
}

private fun configureBlueNoiseLayers(payload: ByteArray, layers: Map<BlueNoiseLayer, List<String>>): ByteArray {
    // CI packages this canonical payload; rebuild with patches/src/main/cpp/blue_noise/Build-Native.ps1.
    blueNoiseRequire(blueNoiseHash(payload) == BLUE_NOISE_PAYLOAD_SHA256, "Blue-noise payload integrity mismatch")
    val result = payload.copyOf()
    fun replace(marker: String, value: String) {
        val pattern = marker.toByteArray(Charsets.US_ASCII)
        val matches = (0..result.size - pattern.size).filter { offset ->
            pattern.indices.all { result[offset + it] == pattern[it] }
        }
        blueNoiseRequire(matches.size == 1 && value.length <= pattern.size, "Blue-noise config marker mismatch")
        val offset = matches.single()
        blueNoiseRequire(result[offset + pattern.size] == 0.toByte(), "Blue-noise config terminator mismatch")
        ByteArray(pattern.size).also { value.toByteArray(Charsets.US_ASCII).copyInto(it) }.copyInto(result, offset)
    }
    layers.forEach { (layer, values) ->
        blueNoiseRequire(values.size == 3 && values.take(2).all { it.matches(Regex("[0-9a-f]{64}")) } &&
            values[2].matches(Regex("[0-9a-f]{16}")) && values[2] != "0000000000000000", "Invalid configured shader hash or caller")
        values.forEachIndexed { index, value -> replace(BLUE_NOISE_CONFIG_MARKERS[layer.ordinal * 3 + index], value) }
    }
    return result
}

internal const val BLUE_NOISE_PAYLOAD_SHA256 = "5c30791621cc94a3f2f358e9b98e8029bc0765c1a0d44f6d1bc4690b2f45e858"
internal const val BLUE_NOISE_STOCK_MASKED_HASH = "afc0c787384a854c5b02e298f81daae5080327e1480bd182625bb20736858995"
internal const val BLUE_NOISE_STOCK_BACKGROUND_HASH = "871e528249132d814a3e1110ded3ff1a25e3f016bdddd1e16aa67a000d835246"
