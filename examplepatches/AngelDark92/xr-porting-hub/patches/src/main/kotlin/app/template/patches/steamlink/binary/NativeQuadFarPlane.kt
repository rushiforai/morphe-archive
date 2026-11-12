package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import java.security.MessageDigest

/**
 * Pinned identity of the standalone far-plane native quad helper
 * (`extensions/native-quad-far-plane`, `Build-Native.ps1`).
 *
 * One source build carries two writable fields after a marker: a float32 quad distance at
 * [NATIVE_QUAD_FAR_DISTANCE_OFFSET] and a layer-settings mode byte at
 * [NATIVE_QUAD_FAR_SETTINGS_OFFSET]. The offsets are derived from the marker at build time
 * (`tools/far_slot.py`) and pinned here together with the whole-file size and SHA-256.
 */
internal const val NATIVE_QUAD_FAR_HELPER_SIZE = 8760
internal const val NATIVE_QUAD_FAR_MARKER = "GXRQUADDIST16M0"
internal const val NATIVE_QUAD_FAR_DISTANCE_OFFSET = 0x1C30
internal const val NATIVE_QUAD_FAR_SETTINGS_OFFSET = 0x1C34

/** Stock distance slot bytes: 1.996000051498413f little-endian (0x3fff7cee). */
internal val NATIVE_QUAD_FAR_DEFAULT_SLOT = byteArrayOf(0xee.toByte(), 0x7c, 0xff.toByte(), 0x3f)

/** Layer-settings modes: keep the renderer's chain (default) or strip only the FB settings node. */
internal const val NATIVE_QUAD_FAR_SETTINGS_KEEP = 0
internal const val NATIVE_QUAD_FAR_SETTINGS_NONE = 1
internal const val NATIVE_QUAD_FAR_DEFAULT_SETTINGS = NATIVE_QUAD_FAR_SETTINGS_KEEP

/** Quad distances offered by the option, in metres. */
internal val NATIVE_QUAD_FAR_DISTANCES = listOf(16, 64, 250)

internal const val NATIVE_QUAD_FAR_DEFAULT_DISTANCE = 64

private val NATIVE_QUAD_FAR_ELF_MAGIC = byteArrayOf(0x7f, 0x45, 0x4c, 0x46)

private fun farSha256(bytes: ByteArray): String =
    MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

private fun farFloatBytes(meters: Int): ByteArray {
    val bits = java.lang.Float.floatToRawIntBits(meters.toFloat())
    return byteArrayOf(
        (bits and 0xff).toByte(),
        ((bits ushr 8) and 0xff).toByte(),
        ((bits ushr 16) and 0xff).toByte(),
        ((bits ushr 24) and 0xff).toByte(),
    )
}

private fun farMarkerMatches(bytes: ByteArray): Boolean {
    val marker = NATIVE_QUAD_FAR_MARKER.toByteArray(Charsets.ISO_8859_1)
    val start = NATIVE_QUAD_FAR_DISTANCE_OFFSET - marker.size - 1
    if (start < 0 || NATIVE_QUAD_FAR_SETTINGS_OFFSET + 1 > bytes.size) return false
    return marker.indices.all { bytes[start + it] == marker[it] } &&
        bytes[NATIVE_QUAD_FAR_DISTANCE_OFFSET - 1] == 0.toByte()
}

/** The distance stored in an already-far payload, or null when the slot holds anything else. */
internal fun readNativeQuadFarDistance(bytes: ByteArray): Int? {
    if (!farMarkerMatches(bytes)) return null
    val bits = (bytes[NATIVE_QUAD_FAR_DISTANCE_OFFSET].toInt() and 0xff) or
        ((bytes[NATIVE_QUAD_FAR_DISTANCE_OFFSET + 1].toInt() and 0xff) shl 8) or
        ((bytes[NATIVE_QUAD_FAR_DISTANCE_OFFSET + 2].toInt() and 0xff) shl 16) or
        ((bytes[NATIVE_QUAD_FAR_DISTANCE_OFFSET + 3].toInt() and 0xff) shl 24)
    val distance = Float.fromBits(bits)
    return NATIVE_QUAD_FAR_DISTANCES.firstOrNull { it.toFloat() == distance }
}

/** The layer-settings mode stored in an already-far payload, or null when it is not a known mode. */
internal fun readNativeQuadFarSettings(bytes: ByteArray): Int? {
    if (!farMarkerMatches(bytes)) return null
    return when (val mode = bytes[NATIVE_QUAD_FAR_SETTINGS_OFFSET].toInt() and 0xff) {
        NATIVE_QUAD_FAR_SETTINGS_KEEP, NATIVE_QUAD_FAR_SETTINGS_NONE -> mode
        else -> null
    }
}

/**
 * True when [bytes] is the pinned far payload carrying any allowed distance and settings mode. All
 * bytes outside the slot fields must match the pin: the fields are normalised to their stock values
 * before hashing.
 */
internal fun isNativeQuadFarPayload(bytes: ByteArray): Boolean {
    if (bytes.size != NATIVE_QUAD_FAR_HELPER_SIZE || !farMarkerMatches(bytes)) return false
    if (readNativeQuadFarDistance(bytes) == null || readNativeQuadFarSettings(bytes) == null) return false
    val normalized = bytes.copyOf()
    NATIVE_QUAD_FAR_DEFAULT_SLOT.copyInto(normalized, NATIVE_QUAD_FAR_DISTANCE_OFFSET)
    normalized[NATIVE_QUAD_FAR_SETTINGS_OFFSET] = NATIVE_QUAD_FAR_DEFAULT_SETTINGS.toByte()
    return farSha256(normalized) == NATIVE_QUAD_FAR_HELPER_SHA256
}

/** Validates the bundled far payload before it is ever used: ELF, size, SHA-256, identity, slots. */
internal fun validateNativeQuadFarPayload(payload: ByteArray) {
    if (payload.size < 4 || !payload.copyOfRange(0, 4).contentEquals(NATIVE_QUAD_FAR_ELF_MAGIC)) {
        throw PatchException("Bundled far-plane helper is not an ELF library")
    }
    if (payload.size != NATIVE_QUAD_FAR_HELPER_SIZE) {
        throw PatchException(
            "Bundled far-plane helper size ${payload.size} does not match the pin ($NATIVE_QUAD_FAR_HELPER_SIZE)",
        )
    }
    if (farSha256(payload) != NATIVE_QUAD_FAR_HELPER_SHA256) {
        throw PatchException("Bundled far-plane helper failed its SHA-256 precondition")
    }
    if (!payload.toString(Charsets.ISO_8859_1).contains(NATIVE_QUAD_FAR_BUILD_ID)) {
        throw PatchException("Bundled far-plane helper build identity is missing")
    }
    if (!farMarkerMatches(payload)) {
        throw PatchException("Bundled far-plane helper lost its distance marker")
    }
    if (!payload.copyOfRange(NATIVE_QUAD_FAR_DISTANCE_OFFSET, NATIVE_QUAD_FAR_DISTANCE_OFFSET + 4)
            .contentEquals(NATIVE_QUAD_FAR_DEFAULT_SLOT)) {
        throw PatchException("Bundled far-plane helper does not carry the stock distance")
    }
    if (payload[NATIVE_QUAD_FAR_SETTINGS_OFFSET].toInt() != NATIVE_QUAD_FAR_DEFAULT_SETTINGS) {
        throw PatchException("Bundled far-plane helper does not carry the keep-mode settings byte")
    }
}

/**
 * Returns the helper [installed] (or the bundled [farPayload] when nothing is installed yet) with
 * [meters] and [settings] written into its slot fields.
 *
 * Only the pinned far payload is accepted as an installed helper. An absent file or the removed 1.2
 * native-quad helper is not converted: the caller rejects that APK as a dirty source instead.
 */
internal fun applyNativeQuadFarSlot(
    installed: ByteArray?,
    meters: Int,
    settings: Int,
    farPayload: ByteArray,
): ByteArray {
    if (meters !in NATIVE_QUAD_FAR_DISTANCES) {
        throw PatchException("Far plane: unsupported quad distance $meters")
    }
    if (settings != NATIVE_QUAD_FAR_SETTINGS_KEEP && settings != NATIVE_QUAD_FAR_SETTINGS_NONE) {
        throw PatchException("Far plane: unsupported layer-settings mode $settings")
    }
    val base = if (installed == null) {
        farPayload
    } else if (isNativeQuadFarPayload(installed)) {
        installed
    } else {
        throw PatchException(
            "Far plane: the installed quad helper is not the far-plane variant. " +
                "Start from a clean source APK. An APK patched with the removed native quad " +
                "composition patch cannot be converted safely in place.",
        )
    }
    val result = base.copyOf()
    farFloatBytes(meters).copyInto(result, NATIVE_QUAD_FAR_DISTANCE_OFFSET)
    result[NATIVE_QUAD_FAR_SETTINGS_OFFSET] = settings.toByte()
    return result
}
