package app.template.patches.zalo

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.rawResourcePatch
import java.nio.file.Files

private const val LIBRARY = "lib/arm64-v8a/libnative_utils.so"
private const val ELF64 = 2
private const val LITTLE_ENDIAN = 1
private const val AARCH64 = 0xb7
private const val MOV_W0_WZR = 0x2a1f03e0
private const val MOV_W0_ONE = 0x52800020

private fun readUInt32LittleEndian(bytes: ByteArray, offset: Int): Int =
    (bytes[offset].toInt() and 0xff) or
        ((bytes[offset + 1].toInt() and 0xff) shl 8) or
        ((bytes[offset + 2].toInt() and 0xff) shl 16) or
        ((bytes[offset + 3].toInt() and 0xff) shl 24)

private fun writeUInt32LittleEndian(bytes: ByteArray, offset: Int, value: Int) {
    bytes[offset] = value.toByte()
    bytes[offset + 1] = (value ushr 8).toByte()
    bytes[offset + 2] = (value ushr 16).toByte()
    bytes[offset + 3] = (value ushr 24).toByte()
}

private fun signExtend(value: Int, bits: Int): Int {
    val shift = Int.SIZE_BITS - bits
    return (value shl shift) shr shift
}

private fun branchTarget(offset: Int, instruction: Int, immediateBits: Int): Int {
    val immediate = instruction and ((1 shl immediateBits) - 1)
    return offset + (signExtend(immediate, immediateBits) shl 2)
}

private fun findSignerFailureOffset(bytes: ByteArray): Int {
    check(bytes.size >= 0x40 && bytes.copyOfRange(0, 4).contentEquals(byteArrayOf(0x7f, 0x45, 0x4c, 0x46))) {
        "Unexpected Zalo native library format"
    }
    check(bytes[4].toInt() == ELF64 && bytes[5].toInt() == LITTLE_ENDIAN &&
        (bytes[18].toInt() and 0xff) == AARCH64 && bytes[19].toInt() == 0) {
        "Unexpected Zalo native library architecture"
    }

    val matches = (0..bytes.size - 16 step 4).filter { offset ->
        val call = readUInt32LittleEndian(bytes, offset)
        val checkResult = readUInt32LittleEndian(bytes, offset + 4)
        val failureReturn = readUInt32LittleEndian(bytes, offset + 8)
        val exit = readUInt32LittleEndian(bytes, offset + 12)
        val checkTarget = branchTarget(offset + 4, checkResult ushr 5, 19)
        val exitTarget = branchTarget(offset + 12, exit, 26)

        (call and 0xfc000000.toInt()) == 0x94000000.toInt() &&
            (checkResult and 0xff00001f.toInt()) == 0x34000000 &&
            failureReturn == MOV_W0_WZR &&
            (exit and 0xfc000000.toInt()) == 0x14000000 &&
            checkTarget == offset + 16 &&
            exitTarget > offset + 12 &&
            exitTarget < bytes.size &&
            exitTarget % 4 == 0
    }
    check(matches.size == 1) { "Unexpected Zalo native signer instruction pattern" }
    return matches.single() + 8
}

@Suppress("unused")
val nativeSignaturePatch = rawResourcePatch(
    name = "Native signature fix",
    description = "Allow Zalo 26.10.02 ARM64 to start after patching and re-signing. ARMv7 is not supported.",
    default = false,
) {
    compatibleWith(Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(AppTarget(version = "26.10.02")),
    ))

    execute {
        check(LIBRARY in listApkEntries("lib/arm64-v8a/")) { "Missing $LIBRARY" }
        val file = this[LIBRARY].toPath()
        val bytes = Files.readAllBytes(file)
        val offset = findSignerFailureOffset(bytes)
        writeUInt32LittleEndian(bytes, offset, MOV_W0_ONE)
        Files.write(file, bytes)
    }
}