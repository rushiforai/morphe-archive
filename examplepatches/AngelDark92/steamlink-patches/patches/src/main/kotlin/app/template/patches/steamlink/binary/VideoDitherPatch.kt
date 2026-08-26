package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK
import app.template.patches.steamlink.util.BinaryPatchHelper.findUniqueAndReplace

// The video fragment shader ships with the dither line commented out with "//" prefix.
// Enabling changes those two bytes to spaces, activating the dither at runtime.
// COUPLING: oledCalibrationPatch replaces the entire 1087-byte shader block first; this patch
// must then target the calibrated variant patterns below instead of the stock ones.
private val SHADER_TAIL = (
    "color.rgb += fract(UniDitherOffsets.a * .43 + UniDitherOffsets.rgb + " +
    "gl_FragCoord.x * 1.67 + gl_FragCoord.y * 1.127 ) * .00292;"
).toByteArray(Charsets.US_ASCII)

// Stock shader: 2-byte comment toggle — "//" (disabled) ↔ "  " two spaces (enabled)
private val DISABLED = byteArrayOf('/'.code.toByte(), '/'.code.toByte()) + SHADER_TAIL
private val ENABLED = byteArrayOf(' '.code.toByte(), ' '.code.toByte()) + SHADER_TAIL

// Calibrated shader (written by oledCalibrationPatch): dither scale constant *.00292 ↔ *.00000
// Located inside the zero-centred expression `(fract(...) - .5) * .00292`
private val CALIBRATED_ENABLED = ") - .5) * .00292;".toByteArray(Charsets.US_ASCII)
private val CALIBRATED_DISABLED = ") - .5) * .00000;".toByteArray(Charsets.US_ASCII)

// Highp shaders retain their output-specific DITHER_SCALE and toggle a separate multiplier.
// This makes disabled RGB10_A2 shaders reversible without losing whether .00392 or .00073 belongs
// to the selected output format.
private val HIGHP_ENABLED = "const float DITHER_ENABLE=1.;".toByteArray(Charsets.US_ASCII)
private val HIGHP_DISABLED = "const float DITHER_ENABLE=0.;".toByteArray(Charsets.US_ASCII)

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

internal fun setDitherState(bytes: ByteArray, enabled: Boolean): ByteArray {
    val stockDisabled = bytes.countOccurrences(DISABLED)
    val stockEnabled = bytes.countOccurrences(ENABLED)
    val calibratedDisabled = bytes.countOccurrences(CALIBRATED_DISABLED)
    val calibratedEnabled = bytes.countOccurrences(CALIBRATED_ENABLED)
    val highpDisabled = bytes.countOccurrences(HIGHP_DISABLED)
    val highpEnabled = bytes.countOccurrences(HIGHP_ENABLED)
    val stateCount = stockDisabled + stockEnabled + calibratedDisabled + calibratedEnabled +
        highpDisabled + highpEnabled

    if (stateCount != 1) {
        if (!isSupportedVideoLibrarySize(bytes.size)) return bytes.copyOf()
        throw PatchException(
            "Unsupported or ambiguous video dither state: " +
                "stock disabled=$stockDisabled enabled=$stockEnabled, " +
                "calibrated disabled=$calibratedDisabled enabled=$calibratedEnabled, " +
                "highp disabled=$highpDisabled enabled=$highpEnabled"
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
        enabled && highpDisabled == 1 && highpEnabled == 0 ->
            findUniqueAndReplace(bytes, HIGHP_DISABLED, HIGHP_ENABLED)
        !enabled && highpDisabled == 0 && highpEnabled == 1 ->
            findUniqueAndReplace(bytes, HIGHP_ENABLED, HIGHP_DISABLED)
        enabled && (stockEnabled == 1 || calibratedEnabled == 1 || highpEnabled == 1) -> bytes
        !enabled && (stockDisabled == 1 || calibratedDisabled == 1 || highpDisabled == 1) -> bytes
        else -> error("Unreachable dither state")
    }
}

@Suppress("unused")
val videoDitherPatch = rawResourcePatch(
    name = "Video dither",
    description = "Enables or disables VRLink video dithering, including the highp sRGB8 fallback and experimental RGB10_A2 shader variants.",
    default = true,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK.toTypedArray())
    dependsOn(oledCalibrationPatch)

    val enable by booleanOption(
        key = "enable",
        default = true,
        title = "Enable dither",
        description = "Stock shader toggles its dormant line; legacy calibrated shader toggles its scale; highp output shaders toggle DITHER_ENABLE while retaining the correct .00392 or .00073 scale.",
        required = true,
    )

    execute {
        val file = get("lib/arm64-v8a/libvrlink_scene.so")
        val bytes = file.readBytes()
        file.writeBytes(setDitherState(bytes, enable!!))
    }
}
