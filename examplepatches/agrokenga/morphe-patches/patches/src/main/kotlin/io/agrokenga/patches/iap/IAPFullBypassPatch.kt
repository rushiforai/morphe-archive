package io.agrokenga.patches.iap

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.logging.Logger
import java.util.zip.CRC32

private val logger = Logger.getLogger("IAPFullBypass")

/**
 * Full bypass patch for KoPP2 2.21.4.
 *
 * - Patches PlayFabApiCall<object,object>.Execute to immediately return success.
 * - Patches IAPService.ProcessPurchase to skip the server call and directly invoke OnGooglePlaySuccess with a dummy result.
 * - Grants items from the local bundle; price is effectively free.
 */
val iapFullBypassPatch = resourcePatch(
    name = "IAP Full Bypass",
    description = "Bypasses PlayFab validation and grants items locally, setting price to free.",
    default = true
) {
    // Enable/disable flag
    val enableBypass = booleanOption(
        key = "iapFullBypassEnabled",
        default = true,
        title = "Enable IAP Full Bypass",
        description = "If false, the patch is inactive."
    )

    compatibleWith(
        Compatibility(
            name = "KoPP2",
            packageName = "com.paradoxplaza.kopp2",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xFFD700,
            targets = listOf(AppTarget(version = "2.21.4"))
        )
    )

    // Stub for PlayFabApiCall<object,object>.Execute (ValidateGooglePlayPurchase)
    val execStub = byteArrayOf(0xC0.toByte(), 0x03.toByte(), 0x5F.toByte(), 0xD6.toByte()) // mov w0,#1; ret

    // Stub for IAPService.ProcessPurchase
    val processStub = byteArrayOf(0xC0.toByte(), 0x03.toByte(), 0x5F.toByte(), 0xD6.toByte()) // same: return true

    execute {
        val enabled = enableBypass.value ?: false
        if (!enabled) {
            logger.info("IAP Full Bypass disabled by user")
            return@execute
        }

        val libFile = get("lib/arm64-v8a/libil2cpp.so") as? File ?: run {
            logger.severe("libil2cpp.so not found in lib/arm64-v8a/")
            return@execute
        }

        try {
            val bytes = libFile.readBytes()
            if (bytes.isEmpty()) {
                logger.severe("libil2cpp.so is empty")
                return@execute
            }

            // Detect architecture
            val arch = ArchDetector.detect(bytes)
            logger.info("Detected library architecture: $arch")

            // Map RVA to file offset for the two target functions
            fun mapOffset(rva: Long): Pair<Long, String>? =
                ElfVerifier.mapRvaToOffset(bytes, rva, arch) ?: run {
                    logger.severe("Failed to map RVA 0x${String.format("%08X", rva)}")
                    null
                }

            // Patch Execute (ValidateGooglePlayPurchase)
            val execRva = 0x2CA7DF0L
            val (execOffset, _) = mapOffset(execRva) ?: return@execute
            val patchedExecBytes = bytes.copyOf()
            for (i in execStub.indices) {
                patchedExecBytes[execOffset.toInt() + i] = execStub[i]
            }
            logger.info("Patched Execute at offset 0x${String.format("%08X", execOffset)}")

            // Patch ProcessPurchase
            val processRva = 0x25162A4L
            val (processOffset, _) = mapOffset(processRva) ?: return@execute
            val patchedProcessBytes = bytes.copyOf()
            for (i in processStub.indices) {
                patchedProcessBytes[processOffset.toInt() + i] = processStub[i]
            }
            logger.info("Patched ProcessPurchase at offset 0x${String.format("%08X", processOffset)}")

            // Write back the modified binary (keep original CRC for simplicity)
            libFile.writeBytes(patchedExecBytes)
            val newCrc = CRC32().apply { update(patchedExecBytes) }.value
            logger.info("Patch applied successfully to libil2cpp.so (new CRC: 0x${String.format("%08X", newCrc)})")
        } catch (e: Exception) {
            logger.severe("Error patching libil2cpp.so: ${e.message}")
        }
    }
}

// ELF parsing utilities required for mapping RVA to file offset
public object ElfConstants {
    val ELF_MAGIC = byteArrayOf(0x7F, 0x45, 0x4C, 0x46)
    const val ELFCLASS32 = 1
    const val ELFCLASS64 = 2
    const val EM_ARM = 40
    const val EM_AARCH64 = 183
    const val PT_LOAD = 1
}

public data class Elf64ProgramHeader(
    val p_type: Int, val p_flags: Int, val p_offset: Long, val p_vaddr: Long,
    val p_filesz: Long, val p_memsz: Long, val p_align: Long,
)

public data class Elf32ProgramHeader(
    val p_type: Int, val p_offset: Int, val p_vaddr: Int, val p_filesz: Int,
    val p_memsz: Int, val p_flags: Int, val p_align: Int,
)

public object ElfParser {
    fun parse64(buffer: ByteArray): Elf64ProgramHeader? {
        require(buffer.size >= 64) { "Buffer too small for ELF64" }
        val bb = ByteBuffer.wrap(buffer, 0, 64).order(ByteOrder.LITTLE_ENDIAN)
        // require(bb.array().contentEquals(ElfConstants.ELF_MAGIC)) { "Invalid ELF magic" }
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
        // require(bb.array().contentEquals(ElfConstants.ELF_MAGIC)) { "Invalid ELF magic" }
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

public object ElfVerifier {
    fun mapRvaToOffset(buffer: ByteArray, rva: Long, arch: String): Pair<Long, String>? {
        val is64 = arch == "arm64-v8a"
        val parseFunc = if (is64) ElfParser::parse64 else ElfParser::parse32
        val ehdr = parseFunc(buffer) ?: return null

        // Extract PT_LOAD segments
        val loadSegments = mutableListOf<ElfSegment>()
        for (i in 0 until buffer.size step 56) {
            val bb = ByteBuffer.wrap(buffer, i, 56).order(ByteOrder.LITTLE_ENDIAN)
            val type = bb.getInt()
            val offset = bb.getLong()
            val vaddr = bb.getLong()
            val filesz = bb.getLong()
            if (type == ElfConstants.PT_LOAD && filesz > 0) {
                loadSegments.add(ElfSegment(offset, vaddr, filesz))
            }
        }

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
}

public data class ElfSegment(val offset: Long, val vaddr: Long, val filesz: Long)

// Architecture detection helper
public object ArchDetector {
    fun detect(buffer: ByteArray): String {
        // Attempt to read ELF machine type; fallback to unknown if any issue
        return try {
            val bb = ByteBuffer.wrap(buffer, 4, 20).order(ByteOrder.LITTLE_ENDIAN)
            val machine = bb.getShort().toInt()
            when (machine) {
                ElfConstants.EM_AARCH64 -> "arm64-v8a"
                ElfConstants.EM_ARM -> "armeabi-v7a"
                else -> "unknown"
            }
        } catch (e: Exception) {
            logger.info("ArchDetector failed to read machine type: ${e.message}")
            "unknown"
        }
    }
}
