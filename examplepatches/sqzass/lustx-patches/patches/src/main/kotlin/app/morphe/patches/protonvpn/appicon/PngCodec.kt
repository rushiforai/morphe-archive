/*
 * Copyright 2026 sqzass.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.protonvpn.appicon

import app.morphe.patcher.patch.PatchException
import java.io.ByteArrayOutputStream
import java.io.File
import java.util.zip.CRC32
import java.util.zip.DataFormatException
import java.util.zip.DeflaterOutputStream
import java.util.zip.Inflater
import kotlin.math.abs
import kotlin.math.ceil
import kotlin.math.floor
import kotlin.math.max
import kotlin.math.min

/*
 * Minimal pure-Kotlin PNG codec + premultiplied-alpha resampler.
 *
 * Exists because android.graphics stubs compiled into a patch bundle shadow the real
 * framework classes inside Morphe Manager (on-device failure: RuntimeException("Stub!")
 * from BitmapFactory.decodeFile). Patch code must therefore stay JVM-only:
 * java.util.zip.Inflater/Deflater + CRC32 are available on both the JVM (CI) and ART.
 *
 * Decode: 8-bit PNG, color types 0/2/3/4/6, non-interlaced, CRC-verified chunks.
 * Encode: 8-bit RGBA, scanline filter 0, zlib (default level).
 * Scale:  separable resample — bilinear when upscaling, exact box (area) integral when
 *         downscaling — on premultiplied alpha, so transparent edges don't darken.
 *
 * The algorithm was validated against Pillow as decode/encode ground truth and against
 * brute-force exact box integrals for the resampler before this transcription.
 */

private val PNG_SIGNATURE =
    byteArrayOf(0x89.toByte(), 0x50.toByte(), 0x4E.toByte(), 0x47.toByte(), 0x0D.toByte(), 0x0A.toByte(), 0x1A.toByte(), 0x0A.toByte())

// Peak memory guard: 16 MP of RGBA is ~64 MB as pixels plus the same again as inflated
// raw data — everything larger fails fast instead of OOMing Morphe Manager.
private const val MAX_PIXELS = 16_000_000

internal class PngImage internal constructor(
    val width: Int,
    val height: Int,
    private val argb: IntArray,
) {
    init {
        require(width > 0 && height > 0)
        require(argb.size == width * height)
    }

    /** Centered on a transparent canvas; no-op size returns the receiver. */
    fun centeredIn(canvasWidth: Int, canvasHeight: Int): PngImage {
        if (canvasWidth == width && canvasHeight == height) return this
        val out = IntArray(canvasWidth * canvasHeight)
        val left = (canvasWidth - width) / 2
        val top = (canvasHeight - height) / 2
        for (y in 0 until height) {
            System.arraycopy(argb, y * width, out, (top + y) * canvasWidth + left, width)
        }
        return PngImage(canvasWidth, canvasHeight, out)
    }

    fun scaled(targetWidth: Int, targetHeight: Int): PngImage {
        require(targetWidth > 0 && targetHeight > 0)
        val horizontal = axisMapping(width, targetWidth)
        val vertical = axisMapping(height, targetHeight)

        // Horizontal pass (premultiply each source sample as it is consumed, so the
        // intermediate buffer stays output-width instead of source-size).
        val tmp = IntArray(targetWidth * height)
        for (y in 0 until height) {
            val sourceRow = y * width
            val targetRow = y * targetWidth
            for (outX in 0 until targetWidth) {
                val (indices, weights) = horizontal[outX]
                var accA = 0.0
                var accR = 0.0
                var accG = 0.0
                var accB = 0.0
                for (t in indices.indices) {
                    val premul = premultiply(argb[sourceRow + indices[t]])
                    val weight = weights[t]
                    accA += weight * ((premul ushr 24) and 0xFF)
                    accR += weight * ((premul ushr 16) and 0xFF)
                    accG += weight * ((premul ushr 8) and 0xFF)
                    accB += weight * (premul and 0xFF)
                }
                tmp[targetRow + outX] = packPremultiplied(accA, accR, accG, accB)
            }
        }

        // Vertical pass: tmp is already premultiplied; unpremultiply the final pixel.
        val out = IntArray(targetWidth * targetHeight)
        for (outY in 0 until targetHeight) {
            val (indices, weights) = vertical[outY]
            for (x in 0 until targetWidth) {
                var accA = 0.0
                var accR = 0.0
                var accG = 0.0
                var accB = 0.0
                for (t in indices.indices) {
                    val premul = tmp[indices[t] * targetWidth + x]
                    val weight = weights[t]
                    accA += weight * ((premul ushr 24) and 0xFF)
                    accR += weight * ((premul ushr 16) and 0xFF)
                    accG += weight * ((premul ushr 8) and 0xFF)
                    accB += weight * (premul and 0xFF)
                }
                out[outY * targetWidth + x] = unpremultiply(packPremultiplied(accA, accR, accG, accB))
            }
        }
        return PngImage(targetWidth, targetHeight, out)
    }

    fun encodeToPng(): ByteArray {
        val out = ByteArrayOutputStream(8 + (width * height) / 2 + 128)
        out.write(PNG_SIGNATURE)

        val ihdr = ByteArray(13)
        putInt32(ihdr, 0, width)
        putInt32(ihdr, 4, height)
        ihdr[8] = 8 // bit depth
        ihdr[9] = 6 // color type: RGBA
        // compression / filter method / interlace all 0
        writeChunk(out, "IHDR", ihdr)

        val deflated = ByteArrayOutputStream()
        DeflaterOutputStream(deflated).use { stream ->
            val row = ByteArray(1 + width * 4)
            for (y in 0 until height) {
                row[0] = 0 // filter type: None
                var i = 1
                for (x in 0 until width) {
                    val argb = get(x, y)
                    row[i++] = (((argb ushr 16) and 0xFF)).toByte()
                    row[i++] = (((argb ushr 8) and 0xFF)).toByte()
                    row[i++] = ((argb and 0xFF)).toByte()
                    row[i++] = (((argb ushr 24) and 0xFF)).toByte()
                }
                stream.write(row)
            }
        }
        writeChunk(out, "IDAT", deflated.toByteArray())
        writeChunk(out, "IEND", ByteArray(0))
        return out.toByteArray()
    }

    operator fun get(x: Int, y: Int): Int = argb[y * width + x]
}

internal fun decodePng(path: String): PngImage {
    val data = try {
        File(path).readBytes()
    } catch (e: Exception) {
        throw PatchException("could not read image \"$path\": ${e.message}")
    }
    if (data.size < 8 || !data.copyOfRange(0, 8).contentEquals(PNG_SIGNATURE)) {
        throw PatchException("image is not a PNG — this patch accepts PNG files only (convert JPG/WebP first)")
    }

    var width = -1
    var height = -1
    var bitDepth = -1
    var colorType = -1
    var interlace = -1
    var palette: IntArray? = null
    var transparentIndices: ByteArray? = null // color type 3
    var transparentGray = -1 // color type 0 (16-bit value; 8-bit samples only match <= 255)
    var transparentR = -1 // color type 2, per-channel 16-bit values
    var transparentG = -1
    var transparentB = -1
    val idat = ByteArrayOutputStream()
    var seenIend = false

    var offset = 8
    while (offset + 8 <= data.size) {
        val length = readInt32(data, offset)
        val type = String(data, offset + 4, 4, Charsets.US_ASCII)
        val bodyStart = offset + 8
        val bodyEnd = bodyStart + length
        if (bodyEnd + 4 > data.size) {
            throw PatchException("PNG chunk $type is truncated")
        }
        val crc = CRC32()
        crc.update(data, offset + 4, length + 4)
        if (crc.value.toInt() != readInt32(data, bodyEnd)) {
            throw PatchException("PNG checksum mismatch in $type chunk — file is corrupt")
        }
        when (type) {
            "IHDR" -> {
                width = readInt32(data, bodyStart)
                height = readInt32(data, bodyStart + 4)
                bitDepth = data[bodyStart + 8].toInt() and 0xFF
                colorType = data[bodyStart + 9].toInt() and 0xFF
                interlace = data[bodyStart + 12].toInt() and 0xFF
            }
            "PLTE" -> palette = IntArray(length / 3) { i ->
                val p = bodyStart + i * 3
                ((data[p].toInt() and 0xFF) shl 16) or
                    ((data[p + 1].toInt() and 0xFF) shl 8) or
                    (data[p + 2].toInt() and 0xFF)
            }
            "tRNS" -> when {
                colorType == 3 -> transparentIndices = data.copyOfRange(bodyStart, bodyEnd)
                colorType == 0 && length >= 2 ->
                    transparentGray = ((data[bodyStart].toInt() and 0xFF) shl 8) or (data[bodyStart + 1].toInt() and 0xFF)
                colorType == 2 && length >= 6 -> {
                    transparentR = ((data[bodyStart].toInt() and 0xFF) shl 8) or (data[bodyStart + 1].toInt() and 0xFF)
                    transparentG = ((data[bodyStart + 2].toInt() and 0xFF) shl 8) or (data[bodyStart + 3].toInt() and 0xFF)
                    transparentB = ((data[bodyStart + 4].toInt() and 0xFF) shl 8) or (data[bodyStart + 5].toInt() and 0xFF)
                }
            }
            "IDAT" -> idat.write(data, bodyStart, length)
            "IEND" -> seenIend = true
            else -> Unit // ancillary chunks (gAMA, pHYs, iCCP, ...) are ignored
        }
        if (seenIend) break
        offset = bodyEnd + 4
    }
    if (!seenIend) {
        throw PatchException("PNG has no IEND chunk — file is truncated")
    }
    if (width <= 0 || height <= 0) {
        throw PatchException("PNG has no usable IHDR")
    }
    if (bitDepth != 8) {
        throw PatchException("unsupported PNG bit depth $bitDepth (need 8) — re-save the image as 8-bit")
    }
    val channels = when (colorType) {
        0, 3 -> 1
        4 -> 2
        2 -> 3
        6 -> 4
        else -> throw PatchException("unsupported PNG color type $colorType")
    }
    if (colorType == 3 && palette == null) {
        throw PatchException("palette PNG is missing its PLTE chunk")
    }
    if (interlace != 0) {
        throw PatchException("interlaced PNG not supported — re-save the image without interlacing")
    }
    if (width.toLong() * height > MAX_PIXELS) {
        throw PatchException(
            "image is ${width}x$height (${(width.toLong() * height) / 1_000_000} MP) — " +
                "resize it to 16 MP or less first to avoid exhausting Morphe Manager's memory",
        )
    }

    val expectedRaw = height * (width * channels + 1)
    val compressed = idat.toByteArray()
    if (compressed.isEmpty()) {
        throw PatchException("PNG has no IDAT data")
    }
    val inflated = ByteArray(expectedRaw)
    val inflater = Inflater()
    try {
        inflater.setInput(compressed)
        var produced = 0
        while (produced < expectedRaw) {
            val count = inflater.inflate(inflated, produced, expectedRaw - produced)
            if (count == 0) {
                if (inflater.finished() || inflater.needsInput()) {
                    throw PatchException("PNG pixel data is truncated")
                }
                throw PatchException("PNG pixel data is corrupt (inflate stalled)")
            }
            produced += count
        }
    } catch (e: DataFormatException) {
        throw PatchException("PNG pixel data is corrupt: ${e.message}")
    } finally {
        inflater.end()
    }

    val pixels = IntArray(width * height)
    val stride = width * channels
    val row = ByteArray(stride)
    val prior = ByteArray(stride)
    var source = 0
    for (y in 0 until height) {
        val filter = inflated[source].toInt() and 0xFF
        source++
        System.arraycopy(inflated, source, row, 0, stride)
        source += stride
        when (filter) {
            0 -> Unit
            1 -> for (i in channels until stride) row[i] = (row[i] + row[i - channels]).toByte()
            2 -> for (i in 0 until stride) row[i] = (row[i] + prior[i]).toByte()
            3 -> for (i in 0 until stride) {
                val left = if (i >= channels) row[i - channels].toInt() and 0xFF else 0
                val up = prior[i].toInt() and 0xFF
                row[i] = (row[i] + ((left + up) shr 1)).toByte()
            }
            4 -> for (i in 0 until stride) {
                val left = if (i >= channels) row[i - channels].toInt() and 0xFF else 0
                val up = prior[i].toInt() and 0xFF
                val upperLeft = if (i >= channels) prior[i - channels].toInt() and 0xFF else 0
                row[i] = (row[i] + paethPredictor(left, up, upperLeft)).toByte()
            }
            else -> throw PatchException("unsupported PNG scanline filter $filter")
        }
        for (x in 0 until width) {
            val p = x * channels
            pixels[y * width + x] = when (colorType) {
                6 ->
                    ((row[p + 3].toInt() and 0xFF) shl 24) or
                        ((row[p].toInt() and 0xFF) shl 16) or
                        ((row[p + 1].toInt() and 0xFF) shl 8) or
                        (row[p + 2].toInt() and 0xFF)
                2 -> {
                    val r = row[p].toInt() and 0xFF
                    val g = row[p + 1].toInt() and 0xFF
                    val b = row[p + 2].toInt() and 0xFF
                    val alpha = if (r == transparentR && g == transparentG && b == transparentB) 0 else 0xFF
                    (alpha shl 24) or (r shl 16) or (g shl 8) or b
                }
                0 -> {
                    val gray = row[p].toInt() and 0xFF
                    val alpha = if (gray == transparentGray) 0 else 0xFF
                    (alpha shl 24) or (gray shl 16) or (gray shl 8) or gray
                }
                4 ->
                    ((row[p + 1].toInt() and 0xFF) shl 24) or
                        ((row[p].toInt() and 0xFF) shl 16) or
                        ((row[p].toInt() and 0xFF) shl 8) or
                        (row[p].toInt() and 0xFF)
                else -> { // color type 3 (palette); PLTE presence verified above
                    val index = row[p].toInt() and 0xFF
                    val rgb = palette!![index]
                    val trns = transparentIndices
                    val alpha = if (trns != null && index < trns.size) trns[index].toInt() and 0xFF else 0xFF
                    (alpha shl 24) or rgb
                }
            }
        }
        System.arraycopy(row, 0, prior, 0, stride)
    }
    return PngImage(width, height, pixels)
}

/** PNG (IHDR) or WebP (VP8X / VP8L / VP8) dimensions from the file header alone. */
internal fun imageDimensions(path: String): Pair<Int, Int> {
    val head = ByteArray(64)
    val read = try {
        File(path).inputStream().use { stream ->
            var total = 0
            while (total < head.size) {
                val n = stream.read(head, total, head.size - total)
                if (n < 0) break
                total += n
            }
            total
        }
    } catch (e: Exception) {
        throw PatchException("could not read image header of $path: ${e.message}")
    }
    if (read < 30) {
        throw PatchException("could not read image header of $path (file too short)")
    }
    if (head.copyOfRange(0, 8).contentEquals(PNG_SIGNATURE)) {
        return Pair(readInt32(head, 16), readInt32(head, 20))
    }
    if (head[0] == 'R'.code.toByte() &&
        head[1] == 'I'.code.toByte() &&
        head[2] == 'F'.code.toByte() &&
        head[3] == 'F'.code.toByte() &&
        head[8] == 'W'.code.toByte() &&
        head[9] == 'E'.code.toByte() &&
        head[10] == 'B'.code.toByte() &&
        head[11] == 'P'.code.toByte()
    ) {
        return when (String(head, 12, 4, Charsets.US_ASCII)) {
            "VP8X" -> Pair(1 + le24(head, 24), 1 + le24(head, 27))
            "VP8L" -> {
                val bits = le32(head, 21)
                Pair((bits and 0x3FFF) + 1, ((bits shr 14) and 0x3FFF) + 1)
            }
            "VP8 " -> Pair((le16(head, 26) and 0x3FFF) + 1, (le16(head, 28) and 0x3FFF) + 1)
            else -> throw PatchException("unsupported WebP chunk layout in $path")
        }
    }
    throw PatchException("unsupported image format at $path (need PNG or WebP)")
}

private fun le24(data: ByteArray, offset: Int): Int = (data[offset].toInt() and 0xFF) or
    ((data[offset + 1].toInt() and 0xFF) shl 8) or
    ((data[offset + 2].toInt() and 0xFF) shl 16)

private fun le16(data: ByteArray, offset: Int): Int = (data[offset].toInt() and 0xFF) or ((data[offset + 1].toInt() and 0xFF) shl 8)

private fun le32(data: ByteArray, offset: Int): Int = le16(data, offset) or (le16(data, offset + 2) shl 16)

private fun readInt32(data: ByteArray, offset: Int): Int = ((data[offset].toInt() and 0xFF) shl 24) or
    ((data[offset + 1].toInt() and 0xFF) shl 16) or
    ((data[offset + 2].toInt() and 0xFF) shl 8) or
    (data[offset + 3].toInt() and 0xFF)

private fun putInt32(target: ByteArray, offset: Int, value: Int) {
    target[offset] = (value ushr 24).toByte()
    target[offset + 1] = (value ushr 16).toByte()
    target[offset + 2] = (value ushr 8).toByte()
    target[offset + 3] = value.toByte()
}

private fun writeChunk(out: ByteArrayOutputStream, type: String, body: ByteArray) {
    val header = ByteArray(8)
    putInt32(header, 0, body.size)
    for (i in 0 until 4) header[4 + i] = type[i].code.toByte()
    out.write(header)
    out.write(body)
    val crc = CRC32()
    crc.update(header, 4, 4)
    crc.update(body)
    val trailer = ByteArray(4)
    putInt32(trailer, 0, crc.value.toInt())
    out.write(trailer)
}

private fun paethPredictor(a: Int, b: Int, c: Int): Int {
    val p = a + b - c
    val pa = abs(p - a)
    val pb = abs(p - b)
    val pc = abs(p - c)
    return when {
        pa <= pb && pa <= pc -> a
        pb <= pc -> b
        else -> c
    }
}

/** Bilinear when upscaling (covers 1:1 identity), exact box integral when downscaling. */
private fun axisMapping(sourceSize: Int, targetSize: Int): Array<Pair<IntArray, DoubleArray>> {
    val scale = sourceSize.toDouble() / targetSize
    return Array(targetSize) { out ->
        if (targetSize >= sourceSize) {
            val center = (out + 0.5) * scale - 0.5
            val i0 = floor(center).toInt()
            val frac = center - i0
            val a = i0.coerceIn(0, sourceSize - 1)
            val b = (i0 + 1).coerceIn(0, sourceSize - 1)
            Pair(intArrayOf(a, b), doubleArrayOf(1.0 - frac, frac))
        } else {
            val start = out * scale
            val end = (out + 1) * scale
            val first = floor(start).toInt().coerceIn(0, sourceSize - 1)
            val last = ceil(end).toInt().coerceIn(first, sourceSize) // exclusive
            val indices = ArrayList<Int>(last - first)
            val overlaps = ArrayList<Double>(last - first)
            var total = 0.0
            for (i in first until last) {
                val overlap = min(i + 1.0, end) - max(i.toDouble(), start)
                if (overlap > 0) {
                    indices.add(i)
                    overlaps.add(overlap)
                    total += overlap
                }
            }
            val weights = DoubleArray(overlaps.size) { overlaps[it] / total }
            Pair(indices.toIntArray(), weights)
        }
    }
}

private fun premultiply(argb: Int): Int {
    val alpha = (argb ushr 24) and 0xFF
    if (alpha == 0xFF) return argb
    if (alpha == 0) return 0
    val r = (((argb ushr 16) and 0xFF) * alpha + 127) / 255
    val g = (((argb ushr 8) and 0xFF) * alpha + 127) / 255
    val b = ((argb and 0xFF) * alpha + 127) / 255
    return (alpha shl 24) or (r shl 16) or (g shl 8) or b
}

private fun clampByte(value: Double): Int = (value + 0.5).toInt().coerceIn(0, 0xFF)

private fun packPremultiplied(a: Double, r: Double, g: Double, b: Double): Int = (clampByte(a) shl 24) or (clampByte(r) shl 16) or (clampByte(g) shl 8) or clampByte(b)

private fun unpremultiply(premul: Int): Int {
    val alpha = (premul ushr 24) and 0xFF
    if (alpha == 0) return 0
    if (alpha == 0xFF) return premul
    fun channel(v: Int) = ((v * 255 + alpha / 2) / alpha).coerceAtMost(0xFF)
    val r = channel((premul ushr 16) and 0xFF)
    val g = channel((premul ushr 8) and 0xFF)
    val b = channel(premul and 0xFF)
    return (alpha shl 24) or (r shl 16) or (g shl 8) or b
}
