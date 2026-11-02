package app.morphe.patches.vk.shared

import java.io.ByteArrayOutputStream
import java.util.zip.CRC32
import java.util.zip.Deflater
import java.util.zip.Inflater

/**
 * Minimal PNG reader/writer for 8-bit non-interlaced images, so icon recoloring does
 * not depend on android.graphics (patches compile on a plain JVM) in either the local
 * runner or inside Morph.
 */
object PngCodec {
    class Image(val width: Int, val height: Int, val pixels: IntArray)

    private val SIGNATURE = byteArrayOf(0x89.toByte(), 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A)

    fun decode(bytes: ByteArray): Image? {
        if (bytes.size < 8 || !bytes.copyOfRange(0, 8).contentEquals(SIGNATURE)) return null

        var width = 0
        var height = 0
        var bitDepth = 0
        var colorType = -1
        var interlace = 0
        val idat = ByteArrayOutputStream()

        var position = 8
        while (position + 12 <= bytes.size) {
            val length = readU32(bytes, position)
            val type = String(bytes, position + 4, 4, Charsets.US_ASCII)
            val dataStart = position + 8
            when (type) {
                "IHDR" -> {
                    width = readU32(bytes, dataStart)
                    height = readU32(bytes, dataStart + 4)
                    bitDepth = bytes[dataStart + 8].toInt() and 0xFF
                    colorType = bytes[dataStart + 9].toInt() and 0xFF
                    interlace = bytes[dataStart + 12].toInt() and 0xFF
                }
                "IDAT" -> idat.write(bytes, dataStart, length)
                "IEND" -> break
            }
            position = dataStart + length + 4
        }

        if (bitDepth != 8 || interlace != 0) {
            println("PngCodec DEBUG: unsupported bitDepth=$bitDepth interlace=$interlace")
            return null
        }
        val bytesPerPixel = when (colorType) {
            6 -> 4
            2 -> 3
            4 -> 2
            0 -> 1
            else -> {
                println("PngCodec DEBUG: unsupported colorType=$colorType")
                return null
            }
        }

        val raw = inflate(idat.toByteArray())
        if (raw == null) {
            println("PngCodec DEBUG: inflate failed idat=${idat.size()}")
            return null
        }
        val stride = width * bytesPerPixel
        if (raw.size < (stride + 1) * height) {
            println("PngCodec DEBUG: short raw=${raw.size} expected=${(stride + 1) * height} size=${width}x$height ct=$colorType")
            return null
        }

        val out = IntArray(width * height)
        val previous = ByteArray(stride)
        val current = ByteArray(stride)

        var offset = 0
        for (y in 0 until height) {
            val filter = raw[offset++].toInt() and 0xFF
            System.arraycopy(raw, offset, current, 0, stride)
            offset += stride
            unfilter(filter, current, previous, bytesPerPixel)

            var pixel = y * width
            if (bytesPerPixel == 4) {
                var i = 0
                while (i < stride) {
                    out[pixel++] = ((current[i + 3].toInt() and 0xFF) shl 24) or
                        ((current[i].toInt() and 0xFF) shl 16) or
                        ((current[i + 1].toInt() and 0xFF) shl 8) or
                        (current[i + 2].toInt() and 0xFF)
                    i += 4
                }
            } else if (bytesPerPixel == 3) {
                var i = 0
                while (i < stride) {
                    out[pixel++] = (0xFF shl 24) or
                        ((current[i].toInt() and 0xFF) shl 16) or
                        ((current[i + 1].toInt() and 0xFF) shl 8) or
                        (current[i + 2].toInt() and 0xFF)
                    i += 3
                }
            } else if (bytesPerPixel == 1) {
                for (i in 0 until stride) {
                    val value = current[i].toInt() and 0xFF
                    out[pixel++] = (0xFF shl 24) or (value shl 16) or (value shl 8) or value
                }
            } else {
                var i = 0
                while (i < stride) {
                    val value = current[i].toInt() and 0xFF
                    val alpha = current[i + 1].toInt() and 0xFF
                    out[pixel++] = (alpha shl 24) or (value shl 16) or (value shl 8) or value
                    i += 2
                }
            }

            System.arraycopy(current, 0, previous, 0, stride)
        }

        return Image(width, height, out)
    }

    fun encode(image: Image): ByteArray {
        val width = image.width
        val height = image.height
        val stride = width * 4
        val raw = ByteArray((stride + 1) * height)
        var offset = 0
        for (y in 0 until height) {
            raw[offset++] = 0
            var pixel = y * width
            for (x in 0 until width) {
                val argb = image.pixels[pixel++]
                raw[offset++] = ((argb shr 16) and 0xFF).toByte()
                raw[offset++] = ((argb shr 8) and 0xFF).toByte()
                raw[offset++] = (argb and 0xFF).toByte()
                raw[offset++] = ((argb ushr 24) and 0xFF).toByte()
            }
        }

        val deflater = Deflater(Deflater.BEST_COMPRESSION)
        deflater.setInput(raw)
        deflater.finish()
        val compressed = ByteArrayOutputStream()
        val buffer = ByteArray(64 * 1024)
        while (!deflater.finished()) {
            val n = deflater.deflate(buffer)
            compressed.write(buffer, 0, n)
        }
        deflater.end()

        val out = ByteArrayOutputStream()
        out.write(SIGNATURE)
        writeChunk(out, "IHDR", ByteArray(13).also { header ->
            writeU32(header, 0, width)
            writeU32(header, 4, height)
            header[8] = 8
            header[9] = 6
            header[10] = 0
            header[11] = 0
            header[12] = 0
        })
        writeChunk(out, "IDAT", compressed.toByteArray())
        writeChunk(out, "IEND", ByteArray(0))
        return out.toByteArray()
    }

    private fun unfilter(filter: Int, current: ByteArray, previous: ByteArray, bpp: Int) {
        val stride = current.size
        when (filter) {
            0 -> Unit
            1 -> for (i in bpp until stride) {
                current[i] = (current[i] + current[i - bpp]).toByte()
            }
            2 -> for (i in 0 until stride) {
                current[i] = (current[i] + previous[i]).toByte()
            }
            3 -> for (i in 0 until stride) {
                val left = if (i >= bpp) current[i - bpp].toInt() and 0xFF else 0
                val up = previous[i].toInt() and 0xFF
                current[i] = (current[i] + ((left + up) ushr 1)).toByte()
            }
            4 -> for (i in 0 until stride) {
                val left = if (i >= bpp) current[i - bpp].toInt() and 0xFF else 0
                val up = previous[i].toInt() and 0xFF
                val upLeft = if (i >= bpp) previous[i - bpp].toInt() and 0xFF else 0
                current[i] = (current[i] + paeth(left, up, upLeft)).toByte()
            }
        }
    }

    private fun paeth(a: Int, b: Int, c: Int): Int {
        val p = a + b - c
        val pa = kotlin.math.abs(p - a)
        val pb = kotlin.math.abs(p - b)
        val pc = kotlin.math.abs(p - c)
        return when {
            pa <= pb && pa <= pc -> a
            pb <= pc -> b
            else -> c
        }
    }

    private fun inflate(data: ByteArray): ByteArray? = try {
        val inflater = Inflater()
        inflater.setInput(data)
        val out = ByteArrayOutputStream(data.size * 4)
        val buffer = ByteArray(64 * 1024)
        while (!inflater.finished()) {
            val n = inflater.inflate(buffer)
            if (n == 0 && inflater.needsInput()) break
            out.write(buffer, 0, n)
        }
        inflater.end()
        out.toByteArray()
    } catch (exception: Exception) {
        null
    }

    private fun readU32(bytes: ByteArray, offset: Int): Int =
        ((bytes[offset].toInt() and 0xFF) shl 24) or
            ((bytes[offset + 1].toInt() and 0xFF) shl 16) or
            ((bytes[offset + 2].toInt() and 0xFF) shl 8) or
            (bytes[offset + 3].toInt() and 0xFF)

    private fun writeU32(bytes: ByteArray, offset: Int, value: Int) {
        bytes[offset] = (value ushr 24).toByte()
        bytes[offset + 1] = (value ushr 16).toByte()
        bytes[offset + 2] = (value ushr 8).toByte()
        bytes[offset + 3] = value.toByte()
    }

    private fun writeChunk(out: ByteArrayOutputStream, type: String, data: ByteArray) {
        val header = ByteArray(4)
        writeU32(header, 0, data.size)
        out.write(header)
        val typeBytes = type.toByteArray(Charsets.US_ASCII)
        out.write(typeBytes)
        out.write(data)
        val crc = CRC32()
        crc.update(typeBytes)
        crc.update(data)
        val crcBytes = ByteArray(4)
        writeU32(crcBytes, 0, crc.value.toInt())
        out.write(crcBytes)
    }
}
