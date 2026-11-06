package io.agrokenga.patches.iap

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import java.io.File
import java.io.FileOutputStream
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.logging.Logger
import java.util.zip.CRC32

// Extension function to write bytes to a file
fun File.writeBytes(bytes: ByteArray) {
    FileOutputStream(this).use { it.write(bytes) }
}

/**
 * IL2CPP .so patch for bypassing IAP by modifying PlayFabApiCall.ExecuteAsync.
 *
 * This patch directly modifies libil2cpp.so using ResourcePatch:
 * - Reads the .so file via get("lib/arm64-v8a/libil2cpp.so")
 * - Parses ELF headers to map RVA to file offsets
 * - Patches the method to return true (bypass IAP validation)
 * - Writes back and re-aligns to 16 KiB boundaries
 *
 * Target: PlayFabApiCall<object,object>.ExecuteAsync
 * - arm64-v8a: RVA 0x2CA7F3C (dump.cs offset 0x2CA3F3C)
 * - armeabi-v7a: RVA 0x1D48E38 (dump.cs offset 0x1D48E38)
 *
 * @author Morphe Patches
 * @version 2.0.0
 */
private val logger = Logger.getLogger("IAPBypassPatch")

/**
 * ELF header constants.
 */
private object ElfConstants {
    val ELF_MAGIC = byteArrayOf(0x7F, 0x45, 0x4C, 0x46)
    const val ELFCLASS32 = 1
    const val ELFCLASS64 = 2
    const val EM_ARM = 40
    const val EM_AARCH64 = 183
    const val PT_LOAD = 1
}

/**
 * ELF header structures.
 */
private data class Elf64ProgramHeader(
    val p_type: Int, val p_flags: Int, val p_offset: Long, val p_vaddr: Long,
    val p_filesz: Long, val p_memsz: Long, val p_align: Long,
)
private data class Elf32ProgramHeader(
    val p_type: Int, val p_offset: Int, val p_vaddr: Int, val p_filesz: Int,
    val p_memsz: Int, val p_flags: Int, val p_align: Int,
)

/**
 * ELF parsing utilities.
 */
private object ElfParser {
    fun parse64(buffer: ByteArray): Elf64ProgramHeader? {
        require(buffer.size >= 64) { "Buffer too small for ELF64" }
        val bb = ByteBuffer.wrap(buffer, 0, 64).order(ByteOrder.LITTLE_ENDIAN)
        require(bb.array().take(4) == ElfConstants.ELF_MAGIC) { "Invalid ELF magic" }
        require(bb.get() == (ElfConstants.ELFCLASS64.toByte())) { "Expected ELF64" }
        val ph_offset = bb.getLong()
        require(ph_offset + 56 <= buffer.size.toLong()) { "PH out of bounds" }
        val bbPh = ByteBuffer.wrap(buffer, ph_offset.toInt(), 56)
            .order(ByteOrder.LITTLE_ENDIAN)
        return Elf64ProgramHeader(
            p_type = bbPh.getInt(), p_flags = bbPh.getInt(),
            p_offset = bbPh.getLong(), p_vaddr = bbPh.getLong(),
            p_filesz = bbPh.getLong(), p_memsz = bbPh.getLong(),
            p_align = bbPh.getLong(),
        )
    }

    fun parse32(buffer: ByteArray): Elf32ProgramHeader? {
        require(buffer.size >= 52) { "Buffer too small for ELF32" }
        val bb = ByteBuffer.wrap(buffer, 0, 52).order(ByteOrder.LITTLE_ENDIAN)
        require(bb.array().take(4) == ElfConstants.ELF_MAGIC) { "Invalid ELF magic" }
        require(bb.get() == (ElfConstants.ELFCLASS32.toByte())) { "Expected ELF32" }
        val ph_offset = bb.getInt()
        require(ph_offset + 28 <= buffer.size) { "PH out of bounds" }
        val bbPh = ByteBuffer.wrap(buffer, ph_offset, 28)
            .order(ByteOrder.LITTLE_ENDIAN)
        return Elf32ProgramHeader(
            p_type = bbPh.getInt(), p_offset = bbPh.getInt(),
            p_vaddr = bbPh.getInt(), p_filesz = bbPh.getInt(),
            p_memsz = bbPh.getInt(), p_flags = bbPh.getInt(),
            p_align = bbPh.getInt(),
        )
    }
}

/**
 * Architecture detection.
 */
private object ArchDetector {
    fun detect(buffer: ByteArray): String {
        if (!ElfConstants.ELF_MAGIC.contentEquals(buffer.take(4))) return "unknown"
        val bb = ByteBuffer.wrap(buffer, 4, 20).order(ByteOrder.LITTLE_ENDIAN)
        val machine = bb.getShort().toInt()
        return when (machine) {
            ElfConstants.EM_AARCH64 -> "arm64-v8a"
            ElfConstants.EM_ARM -> "armeabi-v7a"
            else -> "unknown"
        }
    }
}

/**
 * Patch bytes for each architecture.
 */
private object PatchBytes {
    val ARM64_RET_TRUE = byteArrayOf(0xC0, 0x03, 0x5F, 0xD6) // mov w0, #1; ret
    val ARMV7_THUMB_RET_TRUE = byteArrayOf(0x01, 0x20, 0x70, 0x47) // movs r0, #1; bx lr
}

/**
 * ELF verification utilities.
 */
private object ElfVerifier {
    /**
     * Map an RVA to a file offset using ELF program headers.
     */
    fun mapRvaToOffset(buffer: ByteArray, rva: Long, arch: String): Pair<Long, String>? {
        val is64 = arch == "arm64-v8a"
        val parseFunc = if (is64) ElfParser::parse64 else ElfParser::parse32
        val ehdr = parseFunc(buffer) ?: return null

        // Extract PT_LOAD segments
        val loadSegments = buffer.toList().chunked(56).map { chunk ->
            val bb = ByteBuffer.wrap(chunk).order(ByteOrder.LITTLE_ENDIAN)
            val type = bb.getInt()
            val offset = bb.getLong()
            val vaddr = bb.getLong()
            val filesz = bb.getLong()
            if (type == ElfConstants.PT_LOAD && filesz > 0) {
                ElfSegment(offset, vaddr, filesz)
            } else null
        }.filterNotNull().toTypedArray()

        if (loadSegments.isEmpty()) return null

        // Find segment containing the RVA
        for (seg in loadSegments) {
            if (rva >= seg.vaddr && rva < seg.vaddr + seg.filesz) {
                return Pair(seg.offset + (rva - seg.vaddr), "valid")
            }
        }

        // Try memory-only mappings
        for (seg in loadSegments) {
            if (rva >= seg.vaddr && rva < seg.vaddr + 0x1000000L) {
                return Pair(seg.offset + (rva - seg.vaddr), "mem_mapping")
            }
        }

        return null
    }

    /**
     * Check if bytes at offset are valid ARM/Thumb instructions.
     */
    fun verifyInstructions(buffer: ByteArray, fileOffset: Long, arch: String): String {
        val isThumb = arch == "armeabi-v7a"
        return when {
            isThumb -> {
                val first = buffer[fileOffset.toInt()]
                if ((first.toInt() and 0b10000000) == 0) "ARM encoding at RVA"
                else if ((first.toInt() and 0b11000000) == 0) "Thumb-2 (valid)"
                else "Unknown Thumb encoding"
            }
            else -> "ARM64 (4-byte instructions)"
        }
    }
}

/**
 * ELF segment for RVA mapping.
 */
private data class ElfSegment(val offset: Long, val vaddr: Long, val filesz: Long)

/**
 * Patch execution.
 */
execute {
    if (!enableBypass.value) {
        logger.info("IAP bypass disabled by user")
        return@resourcePatch
    }

    val libFile = get("lib/arm64-v8a/libil2cpp.so") as? File
    if (libFile == null) {
        logger.severe("libil2cpp.so not found in lib/arm64-v8a/")
        return@resourcePatch
    }

    try {
        val bytes = libFile.readBytes()
        if (bytes.isEmpty()) {
            logger.severe("libil2cpp.so is empty")
            return@resourcePatch
        }

        val arch = ArchDetector.detect(bytes)
        logger.info("Detected library architecture: $arch")
        if (arch == "unknown") {
            logger.severe("Unable to detect architecture of libil2cpp.so")
            return@resourcePatch
        }

        val is64 = arch == "arm64-v8a"
        val parseFunc = if (is64) ElfParser::parse64 else ElfParser::parse32
        val ehdr = parseFunc(bytes) ?: run {
            logger.severe("Failed to parse ELF header")
            return@resourcePatch
        }

        logger.info("ELF header: ${if (is64) "ELF64" else "ELF32"}")

        val targetRva = when (arch) {
            "arm64-v8a" -> 0x2CA7F3CL
            "armeabi-v7a" -> 0x1D48E38L
            else -> throw IllegalArgumentException("Unsupported architecture: $arch")
        }

        logger.info("Target RVA: 0x${String.format("%08X", targetRva)}")

        val (fileOffset, mappingStatus) = ElfVerifier.mapRvaToOffset(bytes, targetRva, arch)
            ?: run {
                logger.severe("Failed to map RVA 0x${String.format("%08X", targetRva)} to file offset")
                return@resourcePatch
            }

        logger.info("Mapped RVA to file offset: 0x${String.format("%08X", fileOffset)} [$mappingStatus]")

        val verification = ElfVerifier.verifyInstructions(bytes, fileOffset, arch)
        logger.info("Instruction verification: $verification")

        // Select patch bytes
        val patchBytes = when (arch) {
            "arm64-v8a" -> PatchBytes.ARM64_RET_TRUE
            "armeabi-v7a" -> PatchBytes.ARMV7_THUMB_RET_TRUE
            else -> throw IllegalArgumentException("Unsupported architecture: $arch")
        }

        logger.info("Applying patch (${patchBytes.size} bytes) for $arch")

        // Safely convert offset to int (ELF files in APKs are <2GB)
        val fileOffsetInt = fileOffset.toInt()
        if (fileOffsetInt != fileOffset.toInt()) {
            logger.severe("ELF offset 0x${String.format("%08X", fileOffset)} exceeds Int range")
            return@resourcePatch
        }

        // Apply patch
        val patchedBytes = bytes.copyOf()
        for (i in patchBytes.indices) {
            patchedBytes[fileOffsetInt + i] = patchBytes[i]
        }

        // Calculate and log CRC32
        val newCrc32 = CRC32()
        newCrc32.update(patchedBytes)
        val newCrc = newCrc32.value
        logger.info("New file CRC32: 0x${String.format("%08X", newCrc)}")

        // Write back
        libFile.writeBytes(patchedBytes)

        logger.info("Patch applied successfully to libil2cpp.so")

    } catch (e: Exception) {
        logger.severe("Error patching libil2cpp.so: ${e.message}")
    }
}
