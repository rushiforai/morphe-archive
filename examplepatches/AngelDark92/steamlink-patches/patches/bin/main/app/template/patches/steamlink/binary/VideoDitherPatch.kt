package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_STEAM_LINK
import app.template.patches.steamlink.util.BinaryPatchHelper.findUniqueAndReplace

// The video fragment shader ships with the dither line commented out with "//" prefix.
// Enabling changes those two bytes to spaces, activating the dither at runtime.
private val SHADER_TAIL = (
    "color.rgb += fract(UniDitherOffsets.a * .43 + UniDitherOffsets.rgb + " +
    "gl_FragCoord.x * 1.67 + gl_FragCoord.y * 1.127 ) * .00292;"
).toByteArray(Charsets.US_ASCII)

private val DISABLED = byteArrayOf('/'.code.toByte(), '/'.code.toByte()) + SHADER_TAIL
private val ENABLED = byteArrayOf(' '.code.toByte(), ' '.code.toByte()) + SHADER_TAIL

// OLED calibration uses zero-centred dither and has no stock dither line to uncomment.
private val CALIBRATED_ENABLED = ") - .5) * .00292;".toByteArray(Charsets.US_ASCII)
private val CALIBRATED_DISABLED = ") - .5) * .00000;".toByteArray(Charsets.US_ASCII)

private fun ByteArray.countOccurrences(pattern: ByteArray): Int {
    var count = 0
    outer@ for (i in 0..size - pattern.size) {
        for (j in pattern.indices) {
            if (this[i + j] != pattern[j]) continue@outer
        }
        count++
    }
    return count
}

private fun setDitherState(bytes: ByteArray, enabled: Boolean): ByteArray {
    val stockDisabled = bytes.countOccurrences(DISABLED)
    val stockEnabled = bytes.countOccurrences(ENABLED)
    val calibratedDisabled = bytes.countOccurrences(CALIBRATED_DISABLED)
    val calibratedEnabled = bytes.countOccurrences(CALIBRATED_ENABLED)
    val stateCount = stockDisabled + stockEnabled + calibratedDisabled + calibratedEnabled

    if (stateCount != 1) {
        throw PatchException(
            "Unsupported or ambiguous video dither state: " +
                "stock disabled=$stockDisabled enabled=$stockEnabled, " +
                "calibrated disabled=$calibratedDisabled enabled=$calibratedEnabled"
        )
    }

    return when {
        enabled && stockDisabled == 1 && stockEnabled == 0 ->
            findUniqueAndReplace(bytes, DISABLED, ENABLED)
        !enabled && stockDisabled == 0 && stockEnabled == 1 ->
            findUniqueAndReplace(bytes, ENABLED, DISABLED)
        enabled && calibratedDisabled == 1 && calibratedEnabled == 0 ->
            findUniqueAndReplace(bytes, CALIBRATED_DISABLED, CALIBRATED_ENABLED)
        !enabled && calibratedDisabled == 0 && calibratedEnabled == 1 ->
            findUniqueAndReplace(bytes, CALIBRATED_ENABLED, CALIBRATED_DISABLED)
        enabled && (stockEnabled == 1 || calibratedEnabled == 1) -> bytes
        !enabled && (stockDisabled == 1 || calibratedDisabled == 1) -> bytes
        else -> error("Unreachable dither state")
    }
}

@Suppress("unused")
val videoDitherPatch = rawResourcePatch(
    name = "Video dither",
    description = "Enables (or disables) the dormant GLSL dither term in VRLink's video fragment shader. Reduces 8-bit contouring on OLED displays.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STEAM_LINK)

    val enable by booleanOption(
        key = "enable",
        default = true,
        title = "Enable dither",
        description = "True to uncomment the dither line; false to recomment it.",
        required = true,
    )

    execute {
        val file = get("lib/arm64-v8a/libvrlink_scene.so")
        val bytes = file.readBytes()
        file.writeBytes(setDitherState(bytes, enable!!))
    }
}
