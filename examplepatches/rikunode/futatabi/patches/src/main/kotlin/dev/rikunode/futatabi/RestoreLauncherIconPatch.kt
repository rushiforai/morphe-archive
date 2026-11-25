package dev.rikunode.futatabi

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import java.io.*
import java.util.zip.CRC32
import java.util.zip.DeflaterOutputStream
import java.util.zip.InflaterInputStream
import kotlin.math.abs
import kotlin.math.roundToInt

private const val SOURCE = "assets/flutter_assets/assets/images/icon_adaptive_foreground.png"
private const val SIDE = 512
private val densities = mapOf("mdpi" to 108, "hdpi" to 162, "xhdpi" to 216, "xxhdpi" to 324, "xxxhdpi" to 432)
private val signature = byteArrayOf(-119, 80, 78, 71, 13, 10, 26, 10)

// The verified source is non-interlaced RGBA8 PNG. Use JVM/Android-compatible
// streams rather than java.awt/ImageIO (unavailable in Morphe Manager).
private fun readForeground(file: File): ByteArray {
    require(file.isFile) { "Missing official source asset: $SOURCE" }
    val compressed = ByteArrayOutputStream()
    DataInputStream(file.inputStream().buffered()).use { input ->
        require(ByteArray(8).also(input::readFully).contentEquals(signature)) { "Invalid PNG signature" }
        var header = false
        while (true) {
            val length = input.readInt()
            require(length in 0..4_194_304) { "Invalid PNG chunk length" }
            val type = ByteArray(4).also(input::readFully)
            val data = ByteArray(length).also(input::readFully)
            val crc = CRC32().apply { update(type); update(data) }
            require(input.readInt() == crc.value.toInt()) { "Invalid PNG CRC" }
            when (String(type, Charsets.US_ASCII)) {
                "IHDR" -> {
                    require(!header && length == 13)
                    DataInputStream(data.inputStream()).use {
                        require(it.readInt() == SIDE && it.readInt() == SIDE &&
                            it.readUnsignedByte() == 8 && it.readUnsignedByte() == 6 &&
                            it.readUnsignedByte() == 0 && it.readUnsignedByte() == 0 &&
                            it.readUnsignedByte() == 0) { "Expected official 512x512 RGBA8 PNG" }
                    }
                    header = true
                }
                "IDAT" -> {
                    require(header && compressed.size() + length <= 4_194_304)
                    compressed.write(data)
                }
                "IEND" -> { require(header && length == 0); break }
            }
        }
    }
    val stride = SIDE * 4
    val pixels = ByteArray(SIDE * stride)
    DataInputStream(InflaterInputStream(compressed.toByteArray().inputStream())).use { input ->
        for (y in 0 until SIDE) {
            val filter = input.readUnsignedByte()
            require(filter in 0..4) { "Invalid PNG filter" }
            for (x in 0 until stride) {
                val i = y * stride + x
                val a = if (x >= 4) pixels[i-4].toInt() and 255 else 0
                val b = if (y > 0) pixels[i-stride].toInt() and 255 else 0
                val c = if (x >= 4 && y > 0) pixels[i-stride-4].toInt() and 255 else 0
                val p = a+b-c
                val predictor = when (filter) {
                    0 -> 0; 1 -> a; 2 -> b; 3 -> (a+b)/2
                    else -> if (abs(p-a) <= abs(p-b) && abs(p-a) <= abs(p-c)) a
                            else if (abs(p-b) <= abs(p-c)) b else c
                }
                pixels[i] = (input.readUnsignedByte() + predictor).toByte()
            }
        }
        require(input.read() == -1) { "Unexpected PNG image data" }
    }
    return pixels
}

private fun writeForeground(pixels: ByteArray, size: Int, file: File) {
    val compressed = ByteArrayOutputStream()
    DeflaterOutputStream(compressed).use { out ->
        for (y in 0 until size) {
            out.write(0)
            for (x in 0 until size) {
                // Bilinear interpolation in premultiplied alpha; no background or color transform.
                val sx = (x + 0.5) * SIDE / size - 0.5
                val sy = (y + 0.5) * SIDE / size - 0.5
                val ix = sx.toInt(); val iy = sy.toInt()
                val fx = sx - ix; val fy = sy - iy
                var alpha = 0.0
                val rgb = DoubleArray(3)
                for (dy in 0..1) for (dx in 0..1) {
                    val index = ((iy + dy).coerceAtMost(SIDE-1) * SIDE + (ix+dx).coerceAtMost(SIDE-1))*4
                    val w = (if (dx == 0) 1-fx else fx) * (if (dy == 0) 1-fy else fy)
                    val a = w * (pixels[index+3].toInt() and 255)
                    alpha += a
                    for (c in 0..2) rgb[c] += a * (pixels[index+c].toInt() and 255)
                }
                for (c in 0..2) out.write(if (alpha > 0) (rgb[c]/alpha).roundToInt().coerceIn(0,255) else 0)
                out.write(alpha.roundToInt().coerceIn(0,255))
            }
        }
    }
    require(file.parentFile.isDirectory || file.parentFile.mkdirs()) { "Cannot create resource directory" }
    DataOutputStream(file.outputStream().buffered()).use { out ->
        fun chunk(name: String, data: ByteArray) {
            val type = name.toByteArray(Charsets.US_ASCII)
            out.writeInt(data.size); out.write(type); out.write(data)
            out.writeInt(CRC32().apply { update(type); update(data) }.value.toInt())
        }
        out.write(signature)
        val header = ByteArrayOutputStream()
        DataOutputStream(header).use { it.writeInt(size); it.writeInt(size); it.write(byteArrayOf(8,6,0,0,0)) }
        chunk("IHDR",header.toByteArray())
        chunk("IDAT",compressed.toByteArray())
        chunk("IEND",byteArrayOf())
    }
}

@Suppress("unused")
val restoreLauncherIconPatch = resourcePatch(
    name = "Restore launcher icon",
    description = "Restore missing adaptive launcher foreground densities from the official APK asset.",
    default = false,
) {
    compatibleWith(Compatibility(
        name = "futatter", packageName = "com.Nanasaki.ftutter", apkFileType = ApkFileType.APK,
        targets = listOf(AppTarget(version = "3.1.1", versionCode = 65)),
    ))
    execute {
        try {
            val pixels = readForeground(get(SOURCE))
            // The original adaptive XML and white background remain untouched.
            // Pin the original ID even when a base-only APK has no configured entry.
            document("res/values/public.xml").use { doc ->
                val nodes = doc.getElementsByTagName("public")
                var found = false
                for (i in 0 until nodes.length) {
                    val e = nodes.item(i) as org.w3c.dom.Element
                    val id = e.getAttribute("id").removePrefix("0x").toLong(16)
                    if (e.getAttribute("type") == "drawable" && e.getAttribute("name") == "ic_launcher_foreground") {
                        require(id == 0x7f070083L) { "Unexpected launcher foreground ID" }
                        found = true
                    } else if (id == 0x7f070083L) {
                        throw IllegalArgumentException("Launcher foreground ID has an unexpected name")
                    }
                }
                if (!found) {
                    val e = doc.createElement("public")
                    e.setAttribute("type", "drawable")
                    e.setAttribute("name", "ic_launcher_foreground")
                    e.setAttribute("id", "0x7f070083")
                    doc.documentElement.appendChild(e)
                }
            }
            for ((density, size) in densities) {
                val normal = get("res/drawable-$density/ic_launcher_foreground.png", copy = false)
                val versioned = get("res/drawable-$density-v4/ic_launcher_foreground.png", copy = false)
                if (normal.isFile || versioned.isFile) continue
                writeForeground(pixels, size, versioned)
            }
        } catch (e: Exception) {
            throw PatchException("futatabi: launcher icon restoration failed: ${e.message}", e)
        }
    }
}
