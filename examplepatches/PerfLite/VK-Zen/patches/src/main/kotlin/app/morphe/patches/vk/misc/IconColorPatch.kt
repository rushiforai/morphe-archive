package app.morphe.patches.vk.misc

import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.colorOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.vk.shared.Constants.COMPATIBILITY_VK
import app.morphe.patches.vk.shared.PngCodec
import kotlin.math.abs
import kotlin.math.min

// The bundled Zen artwork is a glossy dark squircle with a blue glow, not flat fills.
// The glow is recolored by hue while its luminance and shading stay untouched, and the
// flat background plate is replaced with the chosen color.
private const val DEFAULT_GLOW_COLOR = "#1E6BFF"
private const val DEFAULT_PLATE_COLOR = "#0C1220"

// Flat fill of the background layer in the bundled zen_icons artwork.
private const val PLATE_R = 12
private const val PLATE_G = 18
private const val PLATE_B = 32
private const val PLATE_TOLERANCE = 4

// Hue window (degrees) of the blue glow in the artwork.
private const val GLOW_HUE_MIN = 170f
private const val GLOW_HUE_MAX = 275f
private const val GLOW_SATURATION_MIN = 0.25f
private const val GLOW_VALUE_MIN = 0.08f

private val hexColor = Regex("^#([0-9a-fA-F]{6}|[0-9a-fA-F]{8})$")

private fun parseColor(hex: String): IntArray {
    val rgb = hex.removePrefix("#").takeLast(6)
    return intArrayOf(
        rgb.substring(0, 2).toInt(16),
        rgb.substring(2, 4).toInt(16),
        rgb.substring(4, 6).toInt(16),
    )
}

private fun rgbToHsv(red: Int, green: Int, blue: Int): FloatArray {
    val r = red / 255f
    val g = green / 255f
    val b = blue / 255f
    val max = maxOf(r, g, b)
    val min = minOf(r, g, b)
    val delta = max - min
    val hue = when {
        delta == 0f -> 0f
        max == r -> 60f * (((g - b) / delta) % 6f)
        max == g -> 60f * (((b - r) / delta) + 2f)
        else -> 60f * (((r - g) / delta) + 4f)
    }
    val saturation = if (max == 0f) 0f else delta / max
    return floatArrayOf(if (hue < 0f) hue + 360f else hue, saturation, max)
}

private fun hsvToRgb(hue: Float, saturation: Float, value: Float): IntArray {
    val c = value * saturation
    val h = hue / 60f
    val x = c * (1 - abs(h % 2f - 1))
    val m = value - c
    val (r, g, b) = when {
        h < 1f -> Triple(c, x, 0f)
        h < 2f -> Triple(x, c, 0f)
        h < 3f -> Triple(0f, c, x)
        h < 4f -> Triple(0f, x, c)
        h < 5f -> Triple(x, 0f, c)
        else -> Triple(c, 0f, x)
    }
    return intArrayOf(
        ((r + m) * 255f).toInt().coerceIn(0, 255),
        ((g + m) * 255f).toInt().coerceIn(0, 255),
        ((b + m) * 255f).toInt().coerceIn(0, 255),
    )
}

// The artwork comes from the classpath: finalize blocks run in reverse execution order, so
// the clone patch writes the same layers after this one and would undo the recolor if it
// did not skip files that already exist.
private fun loadArtwork(relPath: String): ByteArray? {
    val loader = Thread.currentThread().contextClassLoader ?: object {}.javaClass.classLoader
    val stream = loader?.getResourceAsStream("zen_icons/$relPath")
        ?: loader?.getResourceAsStream("/zen_icons/$relPath")
        ?: return null
    return stream.use { it.readBytes() }
}

private fun recolorArtwork(bytes: ByteArray, glow: IntArray, plate: IntArray): ByteArray? {
    val image = PngCodec.decode(bytes) ?: return null
    val glowHsv = rgbToHsv(glow[0], glow[1], glow[2])

    for (index in image.pixels.indices) {
        val px = image.pixels[index]
        val alpha = (px ushr 24) and 0xff
        if (alpha == 0) continue

        val red = (px shr 16) and 0xff
        val green = (px shr 8) and 0xff
        val blue = px and 0xff

        if (abs(red - PLATE_R) <= PLATE_TOLERANCE &&
            abs(green - PLATE_G) <= PLATE_TOLERANCE &&
            abs(blue - PLATE_B) <= PLATE_TOLERANCE
        ) {
            image.pixels[index] = (alpha shl 24) or (plate[0] shl 16) or (plate[1] shl 8) or plate[2]
            continue
        }

        val hsv = rgbToHsv(red, green, blue)
        if (hsv[0] in GLOW_HUE_MIN..GLOW_HUE_MAX && hsv[1] > GLOW_SATURATION_MIN && hsv[2] > GLOW_VALUE_MIN) {
            val saturation = min(1f, hsv[1] * 1.05f + glowHsv[1] * 0.15f)
            val rgb = hsvToRgb(glowHsv[0], saturation, hsv[2])
            image.pixels[index] = (alpha shl 24) or (rgb[0] shl 16) or (rgb[1] shl 8) or rgb[2]
        }
    }

    return PngCodec.encode(image)
}

@Suppress("unused")
val iconColorPatch = resourcePatch(
    name = "App icon colors",
    description = "Recolors the VK Zen launcher artwork: the glow around the logo and the background plate.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_VK)
    dependsOn(cloneAppPatch)

    val glowColor: Option<String> = colorOption(
        key = "glowColor",
        default = DEFAULT_GLOW_COLOR,
        title = "Icon glow color",
        description = "Color of the glowing ring around the logo (#RRGGBB or #AARRGGBB).",
        required = true,
        validator = { it == null || it.matches(hexColor) },
    )

    val plateColor: Option<String> = colorOption(
        key = "plateColor",
        default = DEFAULT_PLATE_COLOR,
        title = "Icon background color",
        description = "Color of the background plate behind the logo (#RRGGBB or #AARRGGBB).",
        required = true,
        validator = { it == null || it.matches(hexColor) },
    )

    finalize {
        val glow = parseColor(glowColor.value!!)
        val plate = parseColor(plateColor.value!!)
        val densities = listOf("mdpi", "hdpi", "xhdpi", "xxhdpi", "xxxhdpi")
        val names = listOf(
            "ic_launcher_background.png",
            "ic_launcher_foreground.png",
            "ic_launcher_round.png",
            "mp_launcher.png",
        )
        var layers = 0
        for (density in densities) {
            for (name in names) {
                val relPath = "res/mipmap-$density-v4/$name"
                val source = loadArtwork(relPath) ?: continue
                val recolored = recolorArtwork(source, glow, plate) ?: continue
                get(relPath).writeBytes(recolored)
                layers++
            }
        }
        println("IconColorPatch: recolored $layers icon layer(s)")
    }
}
