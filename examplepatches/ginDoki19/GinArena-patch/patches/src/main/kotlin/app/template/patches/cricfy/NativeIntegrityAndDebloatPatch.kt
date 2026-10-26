package app.template.patches.cricfy

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.rawResourcePatch
import java.nio.ByteBuffer
import java.nio.ByteOrder

private const val ANTI_TAMPER_SYMBOL = "_ZN10AntiTamper10isTamperedEP7_JNIEnvP8_jobject"

private const val ELF_CLASS_32 = 1
private const val ELF_CLASS_64 = 2
private const val ELF_DATA_LSB = 1

private const val PT_LOAD = 1
private const val SHT_DYNSYM = 11
private const val SHN_UNDEF = 0

private const val EM_386 = 0x03
private const val EM_ARM = 0x28
private const val EM_X86_64 = 0x3E
private const val EM_AARCH64 = 0xB7

// Architecture-native `return 0` (false) machine-code stubs.
private val STUB_AARCH64 = byteArrayOf(
    0x00, 0x00, 0x80.toByte(), 0x52, // mov w0, #0
    0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(), // ret
)
private val STUB_ARM32 = byteArrayOf(
    0x00, 0x00, 0xA0.toByte(), 0xE3.toByte(), // mov r0, #0
    0x1E, 0xFF.toByte(), 0x2F, 0xE1.toByte(), // bx lr
)
private val STUB_THUMB2 = byteArrayOf(
    0x00, 0x20, // movs r0, #0
    0x70, 0x47, // bx lr
)
private val STUB_X86 = byteArrayOf(
    0x31, 0xC0.toByte(), // xor eax, eax
    0xC3.toByte(), // ret
)

/**
 * Shared option surfaced on the main CRICFy patch so users can toggle native/asset debloating.
 */
internal val stripNativeBloatOption = booleanOption(
    key = "stripNativeBloat",
    default = false,
    title = "Strip proxy & ad native libraries",
    description = "Removes ~7.7 MB of unused CashRaven residential-proxy (libcr_android.so, libjnidispatch.so), " +
        "Unity Coherence (libunitycoherencenative.so), legacy MIPS/armeabi folders, and WebView ad-viewer assets.",
)

/**
 * Internal raw-resource patch (`ResourceMode.RAW` — never decodes CRICFy's tampered `resources.arsc`) that:
 * 1. Dynamically resolves `AntiTamper::isTampered(JNIEnv*, jobject)` via ELF32/ELF64 `.dynsym` + `PT_LOAD`
 *    headers in every `lib/<abi>/libnative-lib.so` and patches it to return `0` (`false`), allowing
 *    `Baker.merge` to AES-decrypt the server configuration on re-signed APKs.
 * 2. Deletes dead CashRaven proxy, JNA, and Unity Coherence native `.so` binaries plus `assets/ad-viewer/`.
 */
internal val nativeIntegrityAndDebloatPatch = rawResourcePatch {
    execute {
        val nativeLibs = listApkEntries("lib/")
            .filter { it.endsWith("/libnative-lib.so") }
        check(nativeLibs.isNotEmpty()) {
            "No lib/*/libnative-lib.so entries found in APK."
        }

        for (entry in nativeLibs) {
            val soFile = get(entry)
            val bytes = soFile.readBytes()
            patchElfAntiTamper(entry, bytes)
            soFile.writeBytes(bytes)
        }

        if (stripNativeBloatOption.value == true) {
            val removableSuffixes = listOf(
                "/libcr_android.so",
                "/libjnidispatch.so",
                "/libunitycoherencenative.so",
            )
            // Legacy 32-bit/MIPS ABI directories in CRICFy only ship JNA's libjnidispatch.so;
            // removing those directories prevents Android from misdetecting obsolete ABIs.
            val legacyJnaOnlyAbis = setOf("lib/armeabi/", "lib/mips/", "lib/mips64/")

            for (entry in listApkEntries("lib/")) {
                if (removableSuffixes.any(entry::endsWith) || legacyJnaOnlyAbis.any(entry::startsWith)) {
                    delete(entry)
                }
            }

            delete("assets/ad-viewer/")
        }
    }
}

private fun patchElfAntiTamper(entryName: String, bytes: ByteArray) {
    require(
        bytes.size >= 64 &&
            bytes[0] == 0x7F.toByte() &&
            bytes[1] == 'E'.code.toByte() &&
            bytes[2] == 'L'.code.toByte() &&
            bytes[3] == 'F'.code.toByte(),
    ) {
        "$entryName is not a valid ELF binary."
    }

    val elfClass = bytes[4].toInt() and 0xFF
    val elfData = bytes[5].toInt() and 0xFF
    require(elfData == ELF_DATA_LSB) {
        "$entryName uses unsupported big-endian ELF encoding ($elfData)."
    }

    val buf = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)
    val machine = buf.getShort(18).toInt() and 0xFFFF

    val resolved = when (elfClass) {
        ELF_CLASS_32 -> resolveSymbolElf32(entryName, bytes, buf, ANTI_TAMPER_SYMBOL)
        ELF_CLASS_64 -> resolveSymbolElf64(entryName, bytes, buf, ANTI_TAMPER_SYMBOL)
        else -> error("$entryName has unknown ELF class $elfClass.")
    }

    val isThumb = machine == EM_ARM && (resolved.stValue and 1L) != 0L
    val stub = when (machine) {
        EM_AARCH64 -> STUB_AARCH64
        EM_ARM -> if (isThumb) STUB_THUMB2 else STUB_ARM32
        EM_386, EM_X86_64 -> STUB_X86
        else -> error("$entryName targets unsupported ELF machine 0x${machine.toString(16)}.")
    }

    check(resolved.stSize == 0L || resolved.stSize >= stub.size) {
        "$entryName symbol $ANTI_TAMPER_SYMBOL size (${resolved.stSize}) is smaller than stub (${stub.size})."
    }
    check(resolved.fileOffset >= 0 && resolved.fileOffset + stub.size <= bytes.size) {
        "$entryName resolved file offset 0x${resolved.fileOffset.toString(16)} is out of bounds."
    }

    stub.copyInto(bytes, destinationOffset = resolved.fileOffset.toInt())
}

private data class ResolvedElfSymbol(
    val stValue: Long,
    val stSize: Long,
    val fileOffset: Long,
)

private fun resolveSymbolElf32(
    entryName: String,
    bytes: ByteArray,
    buf: ByteBuffer,
    symbolName: String,
): ResolvedElfSymbol {
    val phOff = buf.u32(28)
    val shOff = buf.u32(32)
    val phEntSize = buf.u16(42)
    val phNum = buf.u16(44)
    val shEntSize = buf.u16(46)
    val shNum = buf.u16(48)

    for (secIdx in 0 until shNum) {
        val shBase = (shOff + secIdx.toLong() * shEntSize).toInt()
        if (buf.getInt(shBase + 4) != SHT_DYNSYM) continue

        val symOff = buf.u32(shBase + 16)
        val symSize = buf.u32(shBase + 20)
        val strTabSecIdx = buf.getInt(shBase + 24)
        val symEntSize = buf.u32(shBase + 36).let { if (it > 0L) it else 16L }

        val strShBase = (shOff + strTabSecIdx.toLong() * shEntSize).toInt()
        val strOff = buf.u32(strShBase + 16)
        val strSize = buf.u32(strShBase + 20)

        val count = (symSize / symEntSize).toInt()
        for (i in 0 until count) {
            val sBase = (symOff + i.toLong() * symEntSize).toInt()
            val stName = buf.u32(sBase)
            val stValue = buf.u32(sBase + 4)
            val stSize = buf.u32(sBase + 8)
            val stShndx = buf.u16(sBase + 14)
            if (stShndx == SHN_UNDEF || stValue == 0L) continue

            if (matchesCString(bytes, strOff + stName, strOff + strSize, symbolName)) {
                val codeVaddr = stValue and -2L // Clear ARM Thumb indicator bit if set
                val fileOff = vaddrToFileOffset32(buf, phOff, phEntSize, phNum, codeVaddr)
                    ?: error("$entryName: could not map vaddr 0x${codeVaddr.toString(16)} via PT_LOAD.")
                return ResolvedElfSymbol(stValue, stSize, fileOff)
            }
        }
    }

    error("$entryName: symbol $symbolName not found in .dynsym.")
}

private fun resolveSymbolElf64(
    entryName: String,
    bytes: ByteArray,
    buf: ByteBuffer,
    symbolName: String,
): ResolvedElfSymbol {
    val phOff = buf.getLong(32)
    val shOff = buf.getLong(40)
    val phEntSize = buf.u16(54)
    val phNum = buf.u16(56)
    val shEntSize = buf.u16(58)
    val shNum = buf.u16(60)

    for (secIdx in 0 until shNum) {
        val shBase = (shOff + secIdx.toLong() * shEntSize).toInt()
        if (buf.getInt(shBase + 4) != SHT_DYNSYM) continue

        val symOff = buf.getLong(shBase + 24)
        val symSize = buf.getLong(shBase + 32)
        val strTabSecIdx = buf.getInt(shBase + 40)
        val symEntSize = buf.getLong(shBase + 56).let { if (it > 0L) it else 24L }

        val strShBase = (shOff + strTabSecIdx.toLong() * shEntSize).toInt()
        val strOff = buf.getLong(strShBase + 24)
        val strSize = buf.getLong(strShBase + 32)

        val count = (symSize / symEntSize).toInt()
        for (i in 0 until count) {
            val sBase = (symOff + i.toLong() * symEntSize).toInt()
            val stName = buf.u32(sBase)
            val stShndx = buf.u16(sBase + 6)
            val stValue = buf.getLong(sBase + 8)
            val stSize = buf.getLong(sBase + 16)
            if (stShndx == SHN_UNDEF || stValue == 0L) continue

            if (matchesCString(bytes, strOff + stName, strOff + strSize, symbolName)) {
                val fileOff = vaddrToFileOffset64(buf, phOff, phEntSize, phNum, stValue)
                    ?: error("$entryName: could not map vaddr 0x${stValue.toString(16)} via PT_LOAD.")
                return ResolvedElfSymbol(stValue, stSize, fileOff)
            }
        }
    }

    error("$entryName: symbol $symbolName not found in .dynsym.")
}

private fun vaddrToFileOffset32(
    buf: ByteBuffer,
    phOff: Long,
    phEntSize: Int,
    phNum: Int,
    vaddr: Long,
): Long? {
    for (i in 0 until phNum) {
        val base = (phOff + i.toLong() * phEntSize).toInt()
        if (buf.getInt(base) != PT_LOAD) continue
        val pOffset = buf.u32(base + 4)
        val pVaddr = buf.u32(base + 8)
        val pFilesz = buf.u32(base + 16)
        if (vaddr >= pVaddr && vaddr < pVaddr + pFilesz) {
            return pOffset + (vaddr - pVaddr)
        }
    }
    return null
}

private fun vaddrToFileOffset64(
    buf: ByteBuffer,
    phOff: Long,
    phEntSize: Int,
    phNum: Int,
    vaddr: Long,
): Long? {
    for (i in 0 until phNum) {
        val base = (phOff + i.toLong() * phEntSize).toInt()
        if (buf.getInt(base) != PT_LOAD) continue
        val pOffset = buf.getLong(base + 8)
        val pVaddr = buf.getLong(base + 16)
        val pFilesz = buf.getLong(base + 32)
        if (vaddr >= pVaddr && vaddr < pVaddr + pFilesz) {
            return pOffset + (vaddr - pVaddr)
        }
    }
    return null
}

private fun matchesCString(bytes: ByteArray, start: Long, limit: Long, target: String): Boolean {
    val pos = start.toInt()
    val end = pos + target.length
    if (pos < 0 || end >= bytes.size || end.toLong() >= limit) return false
    for (i in target.indices) {
        if (bytes[pos + i] != target[i].code.toByte()) return false
    }
    return bytes[end] == 0.toByte()
}

private fun ByteBuffer.u16(offset: Int): Int = getShort(offset).toInt() and 0xFFFF
private fun ByteBuffer.u32(offset: Int): Long = getInt(offset).toLong() and 0xFFFFFFFFL
