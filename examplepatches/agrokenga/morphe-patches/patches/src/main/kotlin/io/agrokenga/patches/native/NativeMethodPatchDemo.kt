package io.agrokenga.patches.native

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import java.io.File
import java.io.RandomAccessFile
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.logging.Logger

private val log = Logger.getLogger("NativeMethodPatchDemo")

private const val PT_LOAD = 1L
private const val PF_X = 1L

/**
 * KoPP2 2.21.4 `CheatsScreen.ShowCheatAlert(string, string)`.
 *
 * This is a private static void method that displays an in-game alert. It does not
 * touch billing, purchases, entitlements, or networking. Replacing its body with an
 * immediate return removes the alert and gives a small, harmless target for testing
 * the static native patching path.
 *
 * RVA and file offset come from the matching Il2CppDumper output for each ABI:
 * - arm64:   RVA 0x23DDB1C, file offset 0x23D9B1C
 * - armv7:   RVA 0x13094B4, file offset 0x13094B4
 *
 * These offsets are version-specific. Re-dump both ABIs before reusing them on a
 * different app version.
 */
private const val ARM64_RVA = 0x23DDB1CL
private const val ARM64_FILE_OFFSET = 0x23D9B1CL
private const val ARMV7_RVA = 0x13094B4L
private const val ARMV7_FILE_OFFSET = 0x13094B4L

// ARM64 `ret`
private val ARM64_RET = byteArrayOf(0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte())

// ARMv7 ARM-mode `bx lr`
private val ARMV7_BX_LR = byteArrayOf(0x1E.toByte(), 0xFF.toByte(), 0x2F.toByte(), 0xE1.toByte())

internal data class Segment(
    val type: Long,
    val flags: Long,
    val offset: Long,
    val vaddr: Long,
    val filesz: Long,
)

internal data class ElfInfo(
    val is64: Boolean,
    val machine: Int,
    val segments: List<Segment>,
)

internal fun readElf(file: File): ElfInfo {
    RandomAccessFile(file, "r").use { raf ->
        val ident = ByteArray(16)
        raf.readFully(ident)

        require(
            ident[0] == 0x7F.toByte() &&
                ident[1] == 0x45.toByte() &&
                ident[2] == 0x4C.toByte() &&
                ident[3] == 0x46.toByte(),
        ) { "Not an ELF file: ${file.path}" }

        val is64 = ident[4].toInt() == 2
        require(ident[5].toInt() == 1) { "Only little-endian ELF is supported: ${file.path}" }

        val header = ByteArray(if (is64) 64 else 52)
        raf.seek(0)
        raf.readFully(header)
        val headerBuffer = ByteBuffer.wrap(header).order(ByteOrder.LITTLE_ENDIAN)

        val machine = headerBuffer.getShort(18).toInt() and 0xFFFF
        val programHeaderOffset = if (is64) {
            headerBuffer.getLong(32)
        } else {
            headerBuffer.getInt(28).toLong() and 0xFFFFFFFFL
        }
        val programHeaderEntrySize = if (is64) {
            headerBuffer.getShort(54).toInt() and 0xFFFF
        } else {
            headerBuffer.getShort(42).toInt() and 0xFFFF
        }
        val programHeaderCount = if (is64) {
            headerBuffer.getShort(56).toInt() and 0xFFFF
        } else {
            headerBuffer.getShort(44).toInt() and 0xFFFF
        }

        val segments = ArrayList<Segment>(programHeaderCount)
        val programHeader = ByteArray(programHeaderEntrySize)

        for (index in 0 until programHeaderCount) {
            raf.seek(programHeaderOffset + index.toLong() * programHeaderEntrySize)
            raf.readFully(programHeader)
            val entry = ByteBuffer.wrap(programHeader).order(ByteOrder.LITTLE_ENDIAN)

            val type = entry.getInt(0).toLong() and 0xFFFFFFFFL
            val flags: Long
            val offset: Long
            val vaddr: Long
            val filesz: Long

            if (is64) {
                flags = entry.getInt(4).toLong() and 0xFFFFFFFFL
                offset = entry.getLong(8)
                vaddr = entry.getLong(16)
                filesz = entry.getLong(32)
            } else {
                // ELF32 stores p_flags at offset 24, after p_filesz and p_memsz.
                flags = entry.getInt(24).toLong() and 0xFFFFFFFFL
                offset = entry.getInt(4).toLong() and 0xFFFFFFFFL
                vaddr = entry.getInt(8).toLong() and 0xFFFFFFFFL
                filesz = entry.getInt(16).toLong() and 0xFFFFFFFFL
            }

            segments += Segment(type, flags, offset, vaddr, filesz)
        }

        return ElfInfo(is64, machine, segments)
    }
}

private fun ByteArray.hex(): String = joinToString(" ") { "%02x".format(it.toInt() and 0xFF) }

internal fun patchMethod(
    file: File,
    abi: String,
    methodName: String,
    rva: Long,
    expectedOffset: Long,
    patch: ByteArray,
    expectedBefore: ByteArray? = null,
) {
    val elf = readElf(file)
    val segment = elf.segments.firstOrNull {
        it.type == PT_LOAD && rva >= it.vaddr && rva < it.vaddr + it.filesz
    } ?: throw PatchException(
        "$abi $methodName: RVA 0x${rva.toString(16)} is not inside a PT_LOAD segment",
    )

    val fileOffset = segment.offset + (rva - segment.vaddr)
    val executable = (segment.flags and PF_X) != 0L
    val bytes = file.readBytes()
    val index = fileOffset.toInt()

    if (index < 0 || index + patch.size > bytes.size) {
        throw PatchException(
            "$abi $methodName: mapped file offset 0x${fileOffset.toString(16)} is outside the file",
        )
    }

    val before = bytes.copyOfRange(index, index + patch.size)
    log.info(
        "$abi $methodName: rva=0x${rva.toString(16)} " +
            "expectedOffset=0x${expectedOffset.toString(16)} " +
            "mappedOffset=0x${fileOffset.toString(16)} " +
            "executable=$executable elf64=${elf.is64} " +
            "machine=0x${elf.machine.toString(16)} " +
            "before=${before.hex()} patch=${patch.hex()}",
    )

    if (fileOffset != expectedOffset) {
        log.warning(
            "$abi $methodName: mapped offset differs from the dump offset " +
                "(0x${fileOffset.toString(16)} vs 0x${expectedOffset.toString(16)})",
        )
    }

    if (!executable) {
        log.warning("$abi $methodName: target segment is not executable")
    }

    if (before.contentEquals(patch)) {
        log.info("$abi $methodName: already patched; leaving the library unchanged")
        return
    }

    if (expectedBefore != null && !before.contentEquals(expectedBefore)) {
        throw PatchException(
            "$abi $methodName: unexpected original bytes ${before.hex()}; " +
                "expected ${expectedBefore.hex()}",
        )
    }

    patch.copyInto(bytes, index)
    file.writeBytes(bytes)

    val after = file.readBytes().copyOfRange(index, index + patch.size)
    if (!after.contentEquals(patch)) {
        throw PatchException("$abi $methodName: write-back verification failed")
    }

    log.info("$abi $methodName: patched and verified ${after.hex()}")
}

val nativeMethodPatchDemo = resourcePatch(
    name = "Native Method Patch Demo",
    description = "Replaces the harmless CheatsScreen.ShowCheatAlert method with an immediate return " +
        "in both libil2cpp.so ABIs. Demonstrates static ELF RVA mapping and byte patching; it does " +
        "not touch billing, purchases, entitlements, or networking.",
    default = false,
) {
    compatibleWith(
        Compatibility(
            name = "KoPP2",
            packageName = "com.paradoxplaza.kopp2",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xFFD700,
            targets = listOf(AppTarget(version = "2.21.4")),
        ),
    )

    val enableDemo = booleanOption(
        key = "nativeMethodPatchDemoEnable",
        default = false,
        title = "Patch ShowCheatAlert (demo)",
        description = "Replace CheatsScreen.ShowCheatAlert with an immediate return. This is a harmless " +
            "UI alert, not billing or purchase code. Disabled by default.",
    )

    execute {
        log.info("=== Native method patch demo ===")

        if (enableDemo.value != true) {
            log.info("Demo disabled; set nativeMethodPatchDemoEnable=true to patch ShowCheatAlert.")
        } else {
            val libEntries = listApkEntries("lib/")
            log.info("APK lib/ entries (${libEntries.size}): ${libEntries.joinToString()}")

            val arm64 = get("lib/arm64-v8a/libil2cpp.so")
            if (arm64.exists()) {
                patchMethod(
                    file = arm64,
                    abi = "arm64-v8a",
                    methodName = "CheatsScreen.ShowCheatAlert",
                    rva = ARM64_RVA,
                    expectedOffset = ARM64_FILE_OFFSET,
                    patch = ARM64_RET,
                )
            } else {
                log.warning(
                    "MISSING lib/arm64-v8a/libil2cpp.so. The APKM must be merged before patching; " +
                        "base.apk alone has no lib/ directory.",
                )
            }

            val armv7 = get("lib/armeabi-v7a/libil2cpp.so")
            if (armv7.exists()) {
                patchMethod(
                    file = armv7,
                    abi = "armeabi-v7a",
                    methodName = "CheatsScreen.ShowCheatAlert",
                    rva = ARMV7_RVA,
                    expectedOffset = ARMV7_FILE_OFFSET,
                    patch = ARMV7_BX_LR,
                )
            } else {
                log.warning(
                    "MISSING lib/armeabi-v7a/libil2cpp.so. The APKM must be merged before patching; " +
                        "base.apk alone has no lib/ directory.",
                )
            }
        }
    }
}
