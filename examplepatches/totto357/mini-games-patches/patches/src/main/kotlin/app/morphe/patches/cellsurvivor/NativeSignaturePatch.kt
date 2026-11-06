package app.morphe.patches.cellsurvivor

import app.morphe.patches.cellsurvivor.Constants.COMPATIBILITY_CELL_SURVIVOR
import app.morphe.patcher.patch.rawResourcePatch
import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder

private val TARGET_SYMBOLS =
    listOf(
        "_Z16CheckPackageNameP7_JNIEnvP8_jobject",
        "_Z12CheckApkSignP7_JNIEnvP8_jobject",
        "_Z16CheckApkSignTestP7_JNIEnvP8_jobject",
    )

// AArch64: mov w0, #1 (0x52800020); ret (0xd65f03c0)
private val ARM64_PATCH = byteArrayOf(0x20, 0x00, 0x80.toByte(), 0x52, 0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte())

// ARM Thumb: movs r0, #1 (0x2001); bx lr (0x4770)
private val ARM32_PATCH = byteArrayOf(0x01, 0x20, 0x70, 0x47)

@Suppress("unused")
val nativeSignaturePatch =
    rawResourcePatch(
        name = "Bypass Native Signature & Package Verification",
        description = "Patches libappJni.so so that CheckPackageName and CheckApkSign always return 1 (success).",
    ) {
        compatibleWith(COMPATIBILITY_CELL_SURVIVOR)

        execute {
            // Check arm64-v8a
            try {
                val arm64File = get("lib/arm64-v8a/libappJni.so", false)
                if (arm64File.exists()) {
                    patchElfSymbols(arm64File, TARGET_SYMBOLS, ARM64_PATCH)
                }
            } catch (_: Exception) {
            }

            // Check armeabi-v7a
            try {
                val arm32File = get("lib/armeabi-v7a/libappJni.so", false)
                if (arm32File.exists()) {
                    patchElfSymbols(arm32File, TARGET_SYMBOLS, ARM32_PATCH)
                }
            } catch (_: Exception) {
            }
        }
    }

private fun patchElfSymbols(
    file: File,
    symbolNames: List<String>,
    patchCode: ByteArray,
) {
    val bytes = file.readBytes()
    if (bytes.size < 64 || bytes[0] != 0x7F.toByte() || bytes[1] != 'E'.code.toByte() || bytes[2] != 'L'.code.toByte() || bytes[3] != 'F'.code.toByte()) return

    val is64Bit = bytes[4] == 2.toByte()
    val buf = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)

    val eShoff = if (is64Bit) buf.getLong(40) else buf.getInt(32).toLong()
    val eShentsize = if (is64Bit) buf.getShort(58).toInt() else buf.getShort(46).toInt()
    val eShnum = if (is64Bit) buf.getShort(60).toInt() else buf.getShort(48).toInt()

    if (eShoff <= 0 || eShnum <= 0 || eShentsize <= 0) return

    var dynsymOffset = 0L
    var dynsymSize = 0L
    var dynsymEntSize = 0L
    var dynstrOffset = 0L

    for (i in 0 until eShnum) {
        val shOffset = (eShoff + i * eShentsize).toInt()
        val shType = buf.getInt(shOffset + 4)
        val offset = if (is64Bit) buf.getLong(shOffset + 24) else buf.getInt(shOffset + 16).toLong()
        val size = if (is64Bit) buf.getLong(shOffset + 32) else buf.getInt(shOffset + 20).toLong()
        val entSize = if (is64Bit) buf.getLong(shOffset + 56) else buf.getInt(shOffset + 36).toLong()

        // SHT_DYNSYM = 11
        if (shType == 11) {
            dynsymOffset = offset
            dynsymSize = size
            dynsymEntSize = entSize
        }
        // SHT_STRTAB = 3
        if (shType == 3 && dynstrOffset == 0L && i > 0) {
            dynstrOffset = offset
        }
    }

    if (dynsymOffset == 0L || dynsymSize == 0L || dynstrOffset == 0L) return
    val entSize = if (dynsymEntSize > 0) dynsymEntSize.toInt() else (if (is64Bit) 24 else 16)
    val numSymbols = (dynsymSize / entSize).toInt()

    var modified = false
    for (i in 0 until numSymbols) {
        val symOffset = (dynsymOffset + i * entSize).toInt()
        val stName = buf.getInt(symOffset)
        if (stName <= 0) continue

        val strStart = (dynstrOffset + stName).toInt()
        var strEnd = strStart
        while (strEnd < bytes.size && bytes[strEnd] != 0.toByte()) {
            strEnd++
        }
        val name = String(bytes, strStart, strEnd - strStart, Charsets.UTF_8)

        if (symbolNames.contains(name)) {
            val stValue = if (is64Bit) buf.getLong(symOffset + 8) else buf.getInt(symOffset + 4).toLong()
            // In Thumb mode, the lowest bit is set to 1. Clear it to get the byte offset.
            val fileOffset = (stValue and (if (is64Bit) -1L else -2L)).toInt()

            if (fileOffset > 0 && fileOffset + patchCode.size <= bytes.size) {
                System.arraycopy(patchCode, 0, bytes, fileOffset, patchCode.size)
                modified = true
            }
        }
    }

    if (modified) {
        file.writeBytes(bytes)
    }
}
