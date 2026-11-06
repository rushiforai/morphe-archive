package io.agrokenga.patches.iap

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import java.io.File
import java.io.RandomAccessFile
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest
import java.util.logging.Logger

private val logger = Logger.getLogger("IAPNativeProbe")

private data class Segment(
    val type: Long,
    val flags: Long,
    val offset: Long,
    val vaddr: Long,
    val filesz: Long,
)

private data class ElfInfo(
    val is64: Boolean,
    val machine: Int,
    val segments: List<Segment>,
)

private data class Target(
    val name: String,
    val arm64Rva: Long?,
    val arm64Offset: Long?,
    val armv7Rva: Long?,
    val armv7Offset: Long?,
    val note: String = "",
)

/**
 * RVAs and file offsets read from Il2CppDumper output for KoPP2 2.21.4.
 *
 * The arm64 dump is in projects/com.paradoxplaza.kopp2/il2cppdump/dump.cs.
 * The armv7 dump was generated separately from
 * split_config.armeabi_v7a.apk + global-metadata.dat with Il2CppDumper 6.7.46.
 *
 * These are version-specific. Do not reuse them for another app version without
 * re-dumping both architectures.
 */
private val targets = listOf(
    Target("StoreService.PurchaseItem", 0x251EDBCL, 0x251ADBCL, 0x14A05B0L, 0x14A05B0L),
    Target("IAPService.GrantPurchase", 0x2514AE4L, 0x2510AE4L, 0x1493C1CL, 0x1493C1CL),
    Target("IAPService.GrantPurchasedItems", 0x2516DF8L, 0x2512DF8L, 0x14964C4L, 0x14964C4L),
    Target("IAPService.CompletePurchase", 0x2518608L, 0x2514608L, 0x1498290L, 0x1498290L),
    Target(
        "IAPService.ProcessPurchase(PurchaseEventArgs)",
        0x25162A4L,
        0x25122A4L,
        0x1495754L,
        0x1495754L,
    ),
    Target("TestingIAP.ProcessPurchase", 0x251F3F0L, 0x251B3F0L, 0x14A0D68L, 0x14A0D68L),
    Target("TestingIAP.OnValidateSuccess", 0x251F618L, 0x251B618L, 0x14A1000L, 0x14A1000L),
    Target(
        "PlayFabDataService.ExecuteAsync",
        null,
        null,
        null,
        null,
        "Not defined in either dump. PlayFabDataService has FetchOrUpdate/OnFetched/OnFailed/Status. " +
            "The generic ExecuteAsync is on PlayFabApiCall<TRequest,TResult>.",
    ),
    Target(
        "PlayFabApiCall<object,object>.ExecuteAsync",
        0x2CA7F3CL,
        0x2CA3F3CL,
        0x1D48E38L,
        0x1D48E38L,
        "Generic instantiation. Patching this affects every PlayFab API call.",
    ),
)

private fun sha256(file: File): String {
    val digest = MessageDigest.getInstance("SHA-256")
    file.inputStream().use { input ->
        val buffer = ByteArray(1 shl 20)
        while (true) {
            val read = input.read(buffer)
            if (read < 0) break
            digest.update(buffer, 0, read)
        }
    }

    return digest.digest().joinToString("") { "%02x".format(it.toInt() and 0xFF) }
}

private fun readElf(file: File): ElfInfo {
    RandomAccessFile(file, "r").use { raf ->
        val ident = ByteArray(16)
        raf.readFully(ident)

        require(
            ident[0] == 0x7F.toByte() &&
                ident[1] == 0x45.toByte() && // E
                ident[2] == 0x4C.toByte() && // L
                ident[3] == 0x46.toByte(), // F
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
                // ELF32 program headers put p_flags after p_filesz/p_memsz, at offset 24.
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

private fun firstBytes(file: File, offset: Long, count: Int = 16): String? {
    if (offset < 0 || offset + count > file.length()) return null

    RandomAccessFile(file, "r").use { raf ->
        raf.seek(offset)
        val bytes = ByteArray(count)
        raf.readFully(bytes)
        return bytes.joinToString("") { "%02x".format(it.toInt() and 0xFF) }
    }
}

val iapNativeProbePatch = resourcePatch(
    name = "IAP Native Probe",
    description = "Read-only diagnostics for libil2cpp.so: hashes the library and checks whether the " +
        "KoPP2 2.21.4 PurchaseItem and IAP grant-function offsets are reachable in both ABIs.",
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

    val writeBackTest = booleanOption(
        key = "iapProbeWriteBack",
        default = false,
        title = "Test APK write-back",
        description = "Append one harmless byte to libil2cpp.so so the patcher has to rewrite and " +
            "re-align the native-library entry. Disabled by default; enable only to verify the " +
            "extract -> edit -> rebuild -> install pipeline.",
    )

    execute {
        logger.info("=== IAP native probe: read-only unless iapProbeWriteBack is enabled ===")

        val libEntries = listApkEntries("lib/")
        logger.info("APK lib/ entries (${libEntries.size}): ${libEntries.joinToString()}")

        var checked = 0

        for ((abi, is64) in listOf("arm64-v8a" to true, "armeabi-v7a" to false)) {
            val path = "lib/$abi/libil2cpp.so"
            val file = get(path)

            if (!file.exists()) {
                logger.warning(
                    "MISSING $path. If this is a split APKM, make sure the manager merged the splits; " +
                        "base.apk alone has no lib/ directory.",
                )
                continue
            }

            val elf = try {
                readElf(file)
            } catch (throwable: Throwable) {
                logger.severe("ELF parse failed for $abi: ${throwable.message}")
                continue
            }

            val expectedMachine = if (is64) 0xB7 else 0x28
            logger.info(
                "ABI $abi: path=$path size=${file.length()} sha256=${sha256(file)} " +
                    "elf64=${elf.is64} machine=0x${elf.machine.toString(16)} " +
                    "segments=${elf.segments.size}",
            )

            if (elf.machine != expectedMachine) {
                logger.warning(
                    "ABI $abi: expected ELF machine 0x${expectedMachine.toString(16)}, " +
                        "got 0x${elf.machine.toString(16)}",
                )
            }

            for (target in targets) {
                val rva = if (is64) target.arm64Rva else target.armv7Rva
                val dumpOffset = if (is64) target.arm64Offset else target.armv7Offset

                if (rva == null || dumpOffset == null) {
                    logger.info("TARGET ${target.name}: ABSENT for $abi. ${target.note}")
                    continue
                }

                val segment = elf.segments.firstOrNull {
                    it.type == 1L && rva >= it.vaddr && rva < it.vaddr + it.filesz
                }

                if (segment == null) {
                    logger.warning(
                        "TARGET ${target.name}: rva=0x${rva.toString(16)} is not inside a PT_LOAD segment",
                    )
                    continue
                }

                val mappedOffset = segment.offset + (rva - segment.vaddr)
                val executable = (segment.flags and 1L) != 0L
                val bytes = firstBytes(file, mappedOffset)
                val plausible = bytes != null &&
                    bytes != "0".repeat(32) &&
                    bytes != "f".repeat(32)

                logger.info(
                    "TARGET ${target.name}: rva=0x${rva.toString(16)} " +
                        "dumpOffset=0x${dumpOffset.toString(16)} " +
                        "mapped=0x${mappedOffset.toString(16)} " +
                        "exec=$executable match=${mappedOffset == dumpOffset} " +
                        "first16=${bytes ?: "OUT_OF_FILE"} plausible=$plausible " +
                        target.note,
                )
                checked++
            }

            if (writeBackTest.value == true) {
                val oldLength = file.length()
                file.appendBytes(byteArrayOf(0))
                logger.info(
                    "WRITE-BACK TEST $abi: appended 1 byte ($oldLength -> ${file.length()}), " +
                        "new sha256=${sha256(file)}",
                )
            } else {
                logger.info(
                    "READ-ONLY $abi: file not modified. Unchanged entries may be omitted from the rebuilt APK.",
                )
            }
        }

        logger.info("=== IAP native probe done: $checked target/ABI checks logged ===")
    }
}
