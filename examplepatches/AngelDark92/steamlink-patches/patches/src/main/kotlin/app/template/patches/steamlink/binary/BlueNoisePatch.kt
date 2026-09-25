package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi
import app.template.patches.shared.Constants.EXPERIMENTAL_COMPATIBILITY_NAME

/** Separate, opt-in experiment. No dependency on or behavior changes to OLED/VD-like controls. */
@Suppress("unused")
val fovealBlueNoisePatch = blueNoisePatch(BlueNoiseLayer.FOVEA)

@Suppress("unused")
val backgroundBlueNoisePatch = blueNoisePatch(BlueNoiseLayer.BACKGROUND)

private fun blueNoisePatch(layer: BlueNoiseLayer) = rawResourcePatch(
    name = if (layer == BlueNoiseLayer.FOVEA) "Foveal blue-noise dithering (experimental)"
        else "Background blue-noise dithering (experimental)",
    description = "Static blue-noise quantization after video colour processing and fade, only on the " +
        (if (layer == BlueNoiseLayer.FOVEA) "foveal" else "background/base") +
        " layer. Accepts 8-bit or 10-bit input and always uses 8-bit sRGB output. Select independently or together with the other layer's blue-noise patch. Separate from OLED/VD-like processing; headset validation pending. Unknown host shaders pass through unchanged.",
    default = false,
) {
    compatibleWith(*BLUE_NOISE_LAYOUTS.map { layout ->
        Compatibility(
            name = EXPERIMENTAL_COMPATIBILITY_NAME,
            packageName = "com.valvesoftware.steamlinkvr",
            targets = listOf(AppTarget(
                version = layout.version,
                versionCodes = SupportedAbi.entries.associateWith { layout.code.toInt() },
                description = "Exact native blue-noise adaptation ${layout.version}/${layout.code}; static validation only.",
            )),
        )
    }.toTypedArray())

    val inputDepth by stringOption(
        key = "inputDepth",
        title = "Declared input depth",
        description = "Both choices apply the same final 8-bit output quantizer. This describes your stream; it does not change host negotiation or decoder precision. When combining with OLED calibration, leave both of its existing VD-like fovea toggles off.",
        default = "10-bit",
        values = mapOf("8-bit input" to "8-bit", "10-bit input" to "10-bit"),
        required = true,
    )

    // Morphe runs every execute before any finalize. Hash the final shader bytes after an
    // optional OLED calibration execute, without forcing calibration as a dependency.
    finalize {
        if (BLUE_NOISE_LAYOUTS.none { it.version == packageMetadata.versionName && it.code == packageMetadata.versionCode }) return@finalize
        val mode = when (inputDepth) {
            "8-bit" -> FoveaMode.INPUT_8BIT
            "10-bit" -> FoveaMode.INPUT_10BIT
            else -> throw PatchException("Unknown blue-noise input depth: $inputDepth")
        }
        val file = get("lib/arm64-v8a/libvrlink_scene.so")
        val formatted = setProjectionSwapchainFormat(
            file.readBytes(), VideoOutputPrecision.SRGB8_HIGHP,
            packageMetadata.versionName, packageMetadata.versionCode,
        )
        val destination = get("lib/arm64-v8a/libgxd.so")
        val existing = if (destination.isFile) destination.readBytes() else null
        val result = applyBlueNoiseLayer(formatted, packageMetadata.versionName, packageMetadata.versionCode,
            mode, layer, existingHelper = existing)
        val helper = result.helper ?: throw PatchException("Blue-noise payload was not prepared")
        destination.parentFile.mkdirs()
        destination.writeBytes(helper)
        file.writeBytes(result.scene)
    }
}
