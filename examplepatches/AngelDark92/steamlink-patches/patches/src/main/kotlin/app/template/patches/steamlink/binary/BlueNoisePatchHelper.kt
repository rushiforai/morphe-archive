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
    return normalized.contentEquals(stock)
}

/** Validate every site before producing a copy; unknown or mixed states fail closed. Both input
 * declarations use the same output quantizer. This neither negotiates nor truncates decoder data.
 */
internal fun applyFovealBlueNoise(
    bytes: ByteArray, version: String, code: String, mode: FoveaMode,
    payload: ByteArray? = null,
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
    if (mode == FoveaMode.OFF && states.none { it }) return BlueNoiseResult(bytes.copyOf(), null)
    layout.guards.forEach { guard ->
        blueNoiseRequire(blueNoiseHash(bytes.copyOfRange(guard.offset, guard.offset + guard.size)) == guard.hash,
            "Blue-noise native route guard failed at 0x${guard.offset.toString(16)} for $version/$code")
    }
    blueNoiseRequire(findVideoShader(bytes) == layout.prefix, "Blue-noise shader position mismatch")
    val suffixSize = 296
    blueNoiseRequire(bytes[layout.suffix + suffixSize] == 0.toByte(), "Blue-noise suffix boundary mismatch")
    val enabled = mode != FoveaMode.OFF
    val helper = if (!enabled) null else {
        validateBlueNoisePrefix(bytes.copyOfRange(layout.prefix, layout.prefix + VIDEO_SHADER_SIZE))
        val source = bytes.copyOfRange(layout.prefix, layout.prefix + VIDEO_SHADER_SIZE) +
            bytes.copyOfRange(layout.suffix, layout.suffix + suffixSize)
        configureBlueNoiseHelper(payload ?: bundledBlueNoiseHelper(), blueNoiseHash(source), layout.drawReturn)
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
    // CI packages this canonical payload; rebuild with patches/src/main/cpp/blue_noise/Build-Native.ps1.
    blueNoiseRequire(blueNoiseHash(payload) == BLUE_NOISE_PAYLOAD_SHA256, "Blue-noise payload integrity mismatch")
    blueNoiseRequire(configuredHash.matches(Regex("[0-9a-f]{64}")), "Invalid configured shader hash")
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
    replace(BLUE_NOISE_CONFIG_MARKERS[0], configuredHash)
    replace(BLUE_NOISE_CONFIG_MARKERS[1], BLUE_NOISE_STOCK_MASKED_HASH)
    replace(BLUE_NOISE_CONFIG_MARKERS[2], drawReturn.toString(16).padStart(16, '0'))
    return result
}

internal const val BLUE_NOISE_PAYLOAD_SHA256 = "f9951b536fa24198799af6778165cbb53951ce0b9d49afa923e4384c9738f602"
internal const val BLUE_NOISE_STOCK_MASKED_HASH = "afc0c787384a854c5b02e298f81daae5080327e1480bd182625bb20736858995"
