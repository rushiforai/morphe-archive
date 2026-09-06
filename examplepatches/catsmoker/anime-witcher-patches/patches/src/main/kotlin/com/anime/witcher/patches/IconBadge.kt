package com.anime.witcher.patches

import java.io.ByteArrayOutputStream
import java.io.File
import java.util.zip.CRC32
import java.util.zip.Deflater
import java.util.zip.Inflater
import kotlin.math.hypot
import kotlin.math.min

/**
 * AWT-free icon badging for [rebrandingPatch].
 *
 * The patch executes inside the Morphe Manager patcher process on Android, where the
 * desktop `javax.imageio.ImageIO` / `java.awt` stack does not exist and would crash
 * with NoClassDefFoundError. This object decodes, re-draws and re-encodes the launcher
 * PNGs using only the JDK/ART common subset (`java.util.zip`), so the very same code
 * path runs on desktop JVM and Android alike.
 */
internal object IconBadger {

    private val SIGNATURE = byteArrayOf(
        0x89.toByte(), 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A
    )

    private const val BADGE_COLOR = 0xFFE53935.toInt()
    private const val OUTLINE_COLOR = 0xFFFFFFFF.toInt()

    /** Badges [file] in place. Never throws — the badge is cosmetic. */
    fun badge(file: File) {
        try {
            val (width, height, argb) = decodePng(file) ?: return
            val size = min(width, height)
            if (size < 24) return
            encodePng(file, width, height, drawPlus(width, height, argb, size))
        } catch (_: Exception) {
            // The badge must never fail the patch over a logo.
        }
    }

    // ------------------------------------------------------------------ decode

    private fun decodePng(file: File): Triple<Int, Int, IntArray>? {
        val bytes = file.readBytes()
        if (bytes.size < 33) return null
        for (i in SIGNATURE.indices) {
            if (bytes[i] != SIGNATURE[i]) return null
        }

        var offset = 8
        var width = 0
        var height = 0
        var bitDepth = 0
        var colorType = -1
        var interlaced = false
        var palette: IntArray? = null
        var trns: ByteArray? = null
        val idat = mutableListOf<ByteArray>()

        while (offset + 12 <= bytes.size) {
            val length = beInt(bytes, offset)
            val type = bytes.copyOfRange(offset + 4, offset + 8).toString(Charsets.US_ASCII)
            val data = bytes.copyOfRange(offset + 8, offset + 8 + length)
            when (type) {
                "IHDR" -> {
                    width = beInt(data, 0)
                    height = beInt(data, 4)
                    bitDepth = data[8].toInt() and 0xFF
                    colorType = data[9].toInt() and 0xFF
                    interlaced = data[12].toInt() and 0xFF != 0
                }
                "PLTE" -> {
                    palette = IntArray(length / 3) { i ->
                        val j = i * 3
                        0xFF000000.toInt() or
                            ((data[j].toInt() and 0xFF) shl 16) or
                            ((data[j + 1].toInt() and 0xFF) shl 8) or
                            (data[j + 2].toInt() and 0xFF)
                    }
                }
                "tRNS" -> trns = data
                "IDAT" -> idat.add(data)
            }
            offset += 12 + length
        }

        if (width <= 0 || height <= 0 || bitDepth != 8 || interlaced) return null

        val channels = when (colorType) {
            0 -> 1
            2 -> 3
            3 -> 1
            4 -> 2
            6 -> 4
            else -> return null
        }
        val stride = width * channels
        val raw = inflate(idat) ?: return null
        if (raw.size < height * (stride + 1)) return null
        unfilter(width, height, stride, channels, raw)

        val argb = IntArray(width * height)
        val pal = palette
        for (y in 0 until height) {
            val row = y * (stride + 1) + 1
            for (x in 0 until width) {
                val base = row + x * channels
                val i = y * width + x
                argb[i] = when (colorType) {
                    6 -> rgba(
                        raw[base].toInt() and 0xFF,
                        raw[base + 1].toInt() and 0xFF,
                        raw[base + 2].toInt() and 0xFF,
                        raw[base + 3].toInt() and 0xFF,
                    )
                    2 -> rgba(
                        raw[base].toInt() and 0xFF,
                        raw[base + 1].toInt() and 0xFF,
                        raw[base + 2].toInt() and 0xFF,
                        255,
                    )
                    4 -> rgba(
                        raw[base].toInt() and 0xFF,
                        raw[base].toInt() and 0xFF,
                        raw[base].toInt() and 0xFF,
                        raw[base + 1].toInt() and 0xFF,
                    )
                    0 -> {
                        val v = raw[base].toInt() and 0xFF
                        val alpha = if (trns != null && trns.isNotEmpty() && v == (trns[0].toInt() and 0xFF)) 0 else 255
                        rgba(v, v, v, alpha)
                    }
                    else -> {
                        val idx = raw[base].toInt() and 0xFF
                        val baseColor = pal?.getOrNull(idx)
                        if (baseColor == null) {
                            rgba(0, 0, 0, 0)
                        } else {
                            val alpha = if (trns != null && idx < trns.size) (trns[idx].toInt() and 0xFF) else (baseColor ushr 24) and 0xFF
                            rgba(
                                (baseColor ushr 16) and 0xFF,
                                (baseColor ushr 8) and 0xFF,
                                baseColor and 0xFF,
                                alpha,
                            )
                        }
                    }
                }
            }
        }
        return Triple(width, height, argb)
    }

    private fun inflate(chunks: List<ByteArray>): ByteArray? {
        val all = ByteArray(chunks.sumOf { it.size })
        var pos = 0
        for (c in chunks) {
            c.copyInto(all, pos)
            pos += c.size
        }

        val out = ByteArrayOutputStream()
        val inflater = Inflater()
        try {
            val buf = ByteArray(8192)
            var inputPos = 0
            inflater.setInput(all, inputPos, all.size - inputPos)
            while (true) {
                while (true) {
                    val n = inflater.inflate(buf)
                    if (n == 0) break
                    out.write(buf, 0, n)
                }
                if (inflater.finished()) {
                    inputPos = all.size - inflater.remaining
                    // Some encoders concatenate several deflate streams per IDAT set.
                    if (inputPos >= all.size) break
                    inflater.reset()
                    inflater.setInput(all, inputPos, all.size - inputPos)
                } else {
                    break
                }
            }
        } catch (_: Exception) {
            return null
        } finally {
            inflater.end()
        }
        return out.toByteArray()
    }

    private fun unfilter(width: Int, height: Int, stride: Int, bpp: Int, data: ByteArray) {
        for (y in 0 until height) {
            val row = y * (stride + 1)
            val filter = data[row].toInt() and 0xFF
            for (x in 0 until stride) {
                val a = if (x >= bpp) data[row + 1 + x - bpp].toInt() and 0xFF else 0
                val b = if (y > 0) data[row + 1 + x - stride - 1].toInt() and 0xFF else 0
                val c = if (y > 0 && x >= bpp) data[row + 1 + x - stride - 1 - bpp].toInt() and 0xFF else 0
                var v = data[row + 1 + x].toInt() and 0xFF
                v += when (filter) {
                    1 -> a
                    2 -> b
                    3 -> (a + b) / 2
                    4 -> paeth(a, b, c)
                    else -> 0
                }
                data[row + 1 + x] = (v and 0xFF).toByte()
            }
        }
    }

    private fun paeth(a: Int, b: Int, c: Int): Int {
        val p = a + b - c
        val pa = if (p > a) p - a else a - p
        val pb = if (p > b) p - b else b - p
        val pc = if (p > c) p - c else c - p
        return if (pa <= pb && pa <= pc) a else if (pb <= pc) b else c
    }

    // ------------------------------------------------------------------ badge

    private fun drawPlus(width: Int, height: Int, argb: IntArray, size: Int): IntArray {
        val thickness = size * 0.050f
        val arm = size * 0.035f
        val cx = size * 0.640f
        val cy = size * 0.360f
        val halfWhite = (thickness * 1.6f) / 2f
        val halfRed = thickness / 2f

        val out = IntArray(width * height)
        for (y in 0 until height) {
            for (x in 0 until width) {
                val px = x + 0.5f
                val py = y + 0.5f
                val d = minOf(
                    segmentDistance(px, py, cx - arm, cy, cx + arm, cy),
                    segmentDistance(px, py, cx, cy - arm, cx, cy + arm),
                )
                var c = argb[y * width + x]
                c = blend(c, OUTLINE_COLOR, coverage(d, halfWhite))
                c = blend(c, BADGE_COLOR, coverage(d, halfRed))
                out[y * width + x] = c
            }
        }
        return out
    }

    private fun segmentDistance(px: Float, py: Float, x1: Float, y1: Float, x2: Float, y2: Float): Float {
        val dx = x2 - x1
        val dy = y2 - y1
        val lenSq = dx * dx + dy * dy
        val t = if (lenSq > 0f) (((px - x1) * dx + (py - y1) * dy) / lenSq).coerceIn(0f, 1f) else 0f
        val cx = x1 + t * dx
        val cy = y1 + t * dy
        return hypot((px - cx).toDouble(), (py - cy).toDouble()).toFloat()
    }

    /** 0..255 coverage with a ~1px soft edge around the stroke's outer bound. */
    private fun coverage(dist: Float, half: Float): Int {
        val t = (half + 0.5f - dist).coerceIn(0f, 1f)
        return (t * 255f).toInt()
    }

    private fun blend(src: Int, color: Int, alpha: Int): Int {
        if (alpha <= 0) return src
        if (alpha >= 255) return color
        val inv = 255 - alpha
        val a = (((color ushr 24) and 0xFF) * alpha + ((src ushr 24) and 0xFF) * inv) / 255
        val r = (((color ushr 16) and 0xFF) * alpha + ((src ushr 16) and 0xFF) * inv) / 255
        val g = (((color ushr 8) and 0xFF) * alpha + ((src ushr 8) and 0xFF) * inv) / 255
        val b = ((color and 0xFF) * alpha + (src and 0xFF) * inv) / 255
        return (a shl 24) or (r shl 16) or (g shl 8) or b
    }

    // ------------------------------------------------------------------ encode

    private fun encodePng(file: File, width: Int, height: Int, argb: IntArray) {
        val out = ByteArrayOutputStream()
        out.write(SIGNATURE)

        val ihdr = ByteArray(13)
        putBe(ihdr, 0, width)
        putBe(ihdr, 4, height)
        ihdr[8] = 8 // bit depth
        ihdr[9] = 6 // color type RGBA
        ihdr[10] = 0 // compression
        ihdr[11] = 0 // filter
        ihdr[12] = 0 // interlace: none
        writeChunk(out, "IHDR", ihdr)

        val stride = width * 4
        val raw = ByteArray(height * (1 + stride))
        var p = 0
        for (y in 0 until height) {
            raw[p++] = 0 // filter: none
            for (x in 0 until width) {
                val c = argb[y * width + x]
                // PNG scanline order is R,G,B,A (straight alpha).
                raw[p++] = ((c ushr 16) and 0xFF).toByte()
                raw[p++] = ((c ushr 8) and 0xFF).toByte()
                raw[p++] = (c and 0xFF).toByte()
                raw[p++] = ((c ushr 24) and 0xFF).toByte()
            }
        }

        val deflater = Deflater(Deflater.BEST_COMPRESSION)
        deflater.setInput(raw)
        deflater.finish()
        val compressed = ByteArrayOutputStream()
        val buf = ByteArray(8192)
        while (!deflater.finished()) {
            val n = deflater.deflate(buf)
            compressed.write(buf, 0, n)
        }
        deflater.end()
        writeChunk(out, "IDAT", compressed.toByteArray())
        writeChunk(out, "IEND", ByteArray(0))

        file.writeBytes(out.toByteArray())
    }

    private fun writeChunk(out: ByteArrayOutputStream, type: String, data: ByteArray) {
        val typeBytes = type.toByteArray(Charsets.US_ASCII)
        putBe(out, data.size)
        out.write(typeBytes)
        out.write(data)
        val crc = CRC32()
        crc.update(typeBytes)
        crc.update(data)
        putBe(out, crc.value.toInt())
    }

    private fun rgba(r: Int, g: Int, b: Int, a: Int): Int =
        (a shl 24) or (r shl 16) or (g shl 8) or b

    private fun beInt(b: ByteArray, offset: Int): Int =
        ((b[offset].toInt() and 0xFF) shl 24) or
            ((b[offset + 1].toInt() and 0xFF) shl 16) or
            ((b[offset + 2].toInt() and 0xFF) shl 8) or
            (b[offset + 3].toInt() and 0xFF)

    private fun putBe(b: ByteArray, offset: Int, value: Int) {
        b[offset] = (value ushr 24).toByte()
        b[offset + 1] = (value ushr 16).toByte()
        b[offset + 2] = (value ushr 8).toByte()
        b[offset + 3] = value.toByte()
    }

    private fun putBe(out: ByteArrayOutputStream, value: Int) {
        out.write(value ushr 24)
        out.write(value ushr 16)
        out.write(value ushr 8)
        out.write(value)
    }
}