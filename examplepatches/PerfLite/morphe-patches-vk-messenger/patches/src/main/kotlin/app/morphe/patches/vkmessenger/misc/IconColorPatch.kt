package app.morphe.patches.vkmessenger.misc

import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.colorOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.vkmessenger.shared.Constants.COMPATIBILITY_VK_MESSENGER
import java.io.File
import java.util.zip.CRC32

// The launcher artwork is palette PNG: a cyan plate, a blue bubble and a white glyph (plus blends).
// Every icon layer is recolored by rewriting only the PLTE chunk, so anti-aliasing stays untouched.
private val PLATE_ANCHOR = intArrayOf(0, 238, 255)
private val BUBBLE_ANCHOR = intArrayOf(0, 121, 255)
private val GLYPH_ANCHOR = intArrayOf(255, 255, 255)

private const val DEFAULT_PLATE_COLOR = "#6C4DFF"
private const val DEFAULT_BUBBLE_COLOR = "#3A1FCC"
private const val DEFAULT_GLYPH_COLOR = "#FFFFFF"

private val hexColor = Regex("^#([0-9a-fA-F]{6}|[0-9a-fA-F]{8})$")

private val iconLayers = buildList {
    listOf("mdpi", "hdpi", "xhdpi", "xxhdpi", "xxxhdpi").forEach { density ->
        add("res/mipmap-$density/ic_launcher_background.png")
        add("res/mipmap-$density/ic_launcher_foreground.png")
    }
    add("res/drawable-xxhdpi/ic_launcher_me.png")
    add("res/drawable-xxhdpi/ic_launcher_me_round.png")
}

private fun parseColor(hex: String): IntArray {
    val value = hex.removePrefix("#")
    val rgb = value.takeLast(6)
    return intArrayOf(
        rgb.substring(0, 2).toInt(16),
        rgb.substring(2, 4).toInt(16),
        rgb.substring(4, 6).toInt(16),
    )
}

private fun u32be(bytes: ByteArray, offset: Int): Int =
    ((bytes[offset].toInt() and 0xff) shl 24) or
        ((bytes[offset + 1].toInt() and 0xff) shl 16) or
        ((bytes[offset + 2].toInt() and 0xff) shl 8) or
        (bytes[offset + 3].toInt() and 0xff)

private fun writeU32be(bytes: ByteArray, offset: Int, value: Int) {
    bytes[offset] = (value ushr 24).toByte()
    bytes[offset + 1] = (value ushr 16).toByte()
    bytes[offset + 2] = (value ushr 8).toByte()
    bytes[offset + 3] = value.toByte()
}

// Barycentric weights of a palette color expressed through the three anchor colors.
private fun anchorWeights(color: IntArray): DoubleArray {
    val d1 = IntArray(3) { PLATE_ANCHOR[it] - GLYPH_ANCHOR[it] }
    val d2 = IntArray(3) { BUBBLE_ANCHOR[it] - GLYPH_ANCHOR[it] }
    val v = IntArray(3) { color[it] - GLYPH_ANCHOR[it] }

    val a11 = d1.sumOf { it * it }.toDouble()
    val a12 = d1.indices.sumOf { d1[it] * d2[it] }.toDouble()
    val a22 = d2.sumOf { it * it }.toDouble()
    val b1 = d1.indices.sumOf { d1[it] * v[it] }.toDouble()
    val b2 = d2.indices.sumOf { d2[it] * v[it] }.toDouble()

    val det = a11 * a22 - a12 * a12
    if (det == 0.0) return doubleArrayOf(0.0, 0.0)

    var w1 = (b1 * a22 - b2 * a12) / det
    var w2 = (b2 * a11 - b1 * a12) / det
    w1 = w1.coerceIn(0.0, 1.0)
    w2 = w2.coerceIn(0.0, 1.0)
    if (w1 + w2 > 1.0) {
        val sum = w1 + w2
        w1 /= sum
        w2 /= sum
    }
    return doubleArrayOf(w1, w2)
}

private fun mapColor(color: IntArray, plate: IntArray, bubble: IntArray, glyph: IntArray): IntArray {
    val (w1, w2) = anchorWeights(color)
    val w3 = 1.0 - w1 - w2
    return IntArray(3) { channel ->
        (w1 * plate[channel] + w2 * bubble[channel] + w3 * glyph[channel]).toInt().coerceIn(0, 255)
    }
}

private fun recolorPalette(file: File, plate: IntArray, bubble: IntArray, glyph: IntArray): Int {
    val bytes = file.readBytes()
    val signature = byteArrayOf(0x89.toByte(), 'P'.code.toByte(), 'N'.code.toByte(), 'G'.code.toByte())
    if (bytes.size < 8 || !bytes.copyOfRange(0, 4).contentEquals(signature)) return -1

    var paletteOffset = -1
    var paletteSize = 0
    var transparencyOffset = -1
    var transparencySize = 0
    var colorType = -1

    var position = 8
    while (position + 12 <= bytes.size) {
        val length = u32be(bytes, position)
        val type = String(bytes, position + 4, 4, Charsets.US_ASCII)
        when (type) {
            "IHDR" -> colorType = bytes[position + 8 + 9].toInt() and 0xff
            "PLTE" -> {
                paletteOffset = position + 8
                paletteSize = length
            }
            "tRNS" -> {
                transparencyOffset = position + 8
                transparencySize = length
            }
            "IEND" -> break
        }
        position += 12 + length
    }

    if (colorType != 3 || paletteOffset < 0) return -1

    var recolored = 0
    for (entry in 0 until paletteSize / 3) {
        val alpha = if (entry < transparencySize) bytes[transparencyOffset + entry].toInt() and 0xff else 255
        if (alpha == 0) continue

        val offset = paletteOffset + entry * 3
        val source = intArrayOf(
            bytes[offset].toInt() and 0xff,
            bytes[offset + 1].toInt() and 0xff,
            bytes[offset + 2].toInt() and 0xff,
        )
        val mapped = mapColor(source, plate, bubble, glyph)
        bytes[offset] = mapped[0].toByte()
        bytes[offset + 1] = mapped[1].toByte()
        bytes[offset + 2] = mapped[2].toByte()
        recolored++
    }

    val crc = CRC32().apply { update(bytes, paletteOffset - 4, 4 + paletteSize) }
    writeU32be(bytes, paletteOffset + paletteSize, crc.value.toInt())
    file.writeBytes(bytes)
    return recolored
}

private fun ResourcePatchContext.recolorLayer(
    path: String,
    plate: IntArray,
    bubble: IntArray,
    glyph: IntArray,
) {
    val file = try {
        get(path)
    } catch (exception: Exception) {
        println("WARNING: icon layer $path not found - left unchanged")
        return
    }
    if (!file.exists()) {
        println("WARNING: icon layer $path not found - left unchanged")
        return
    }

    val recolored = recolorPalette(file, plate, bubble, glyph)
    if (recolored < 0) {
        println("WARNING: icon layer $path is not a palette PNG - left unchanged")
        return
    }
    println("IconColorPatch: recolored $recolored palette entr(ies) in $path")
}

@Suppress("unused")
val iconColorPatch = resourcePatch(
    name = "App icon colors",
    description = "Recolors the launcher icon: the cyan plate, the blue speech bubble and the white dots.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VK_MESSENGER)

    val plateColor: Option<String> = colorOption(
        key = "plateColor",
        default = DEFAULT_PLATE_COLOR,
        title = "Icon plate color",
        description = "Color of the large plate behind the icon (#RRGGBB or #AARRGGBB).",
        required = true,
        validator = { it == null || it.matches(hexColor) },
    )

    val bubbleColor: Option<String> = colorOption(
        key = "bubbleColor",
        default = DEFAULT_BUBBLE_COLOR,
        title = "Icon bubble color",
        description = "Color of the speech bubble on the icon (#RRGGBB or #AARRGGBB).",
        required = true,
        validator = { it == null || it.matches(hexColor) },
    )

    val glyphColor: Option<String> = colorOption(
        key = "glyphColor",
        default = DEFAULT_GLYPH_COLOR,
        title = "Icon dots color",
        description = "Color of the three dots on the icon (#RRGGBB or #AARRGGBB).",
        required = true,
        validator = { it == null || it.matches(hexColor) },
    )

    execute {
        val plate = parseColor(plateColor.value!!)
        val bubble = parseColor(bubbleColor.value!!)
        val glyph = parseColor(glyphColor.value!!)

        iconLayers.forEach { path -> recolorLayer(path, plate, bubble, glyph) }
    }
}
