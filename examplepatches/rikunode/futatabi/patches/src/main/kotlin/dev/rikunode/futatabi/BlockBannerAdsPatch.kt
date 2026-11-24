package dev.rikunode.futatabi

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import java.io.RandomAccessFile
import java.nio.file.Files
import java.nio.file.attribute.FileTime
import java.security.MessageDigest

private const val LIBAPP_PATH = "lib/arm64-v8a/libapp.so"
private const val LIBAPP_SHA256 = "dd542fe3af5f266096e07f823da3880d3a6e7c771aa80afe6324137e63c5041a"

// The executable PT_LOAD maps this virtual address to the same file offset in the verified ELF.
private const val BANNER_INSTRUCTION_OFFSET = 0x86c730L

@Suppress("unused")
val blockBannerAdsPatch = rawResourcePatch(
    name = "Block banner ads",
    description = "Remove the top banner and its reserved space on ARM64 without changing rewarded ads.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "futatter",
            packageName = "com.Nanasaki.ftutter",
            apkFileType = ApkFileType.APK,
            targets = listOf(AppTarget(version = "3.1.1", versionCode = 65)),
        )
    )

    execute {
        val libapp = get(LIBAPP_PATH)
        if (!libapp.isFile) {
            throw PatchException("futatabi: missing $LIBAPP_PATH; use the merged ARM64 APK")
        }

        val digest = MessageDigest.getInstance("SHA-256")
        libapp.forEachBlock { buffer, size -> digest.update(buffer, 0, size) }
        val sha256 = digest.digest().joinToString("") { "%02x".format(it) }
        if (sha256 != LIBAPP_SHA256) {
            throw PatchException("futatabi: unsupported ARM64 libapp.so (SHA-256 $sha256)")
        }

        val path = libapp.toPath()
        val originalTimestamp = Files.getLastModifiedTime(path)
        RandomAccessFile(libapp, "rw").use { file ->
            file.seek(BANNER_INSTRUCTION_OFFSET)
            // eor x0, x1, #0x10 -> add x0, x22, #0x30 (Dart false).
            file.write(byteArrayOf(0xc0.toByte(), 0xc2.toByte(), 0x00, 0x91.toByte()))
        }
        // Morphe detects staged changes using file metadata. A same-size write can retain
        // the original timestamp on filesystems with coarse timestamp resolution.
        if (Files.getLastModifiedTime(path) == originalTimestamp) {
            Files.setLastModifiedTime(path, FileTime.fromMillis(originalTimestamp.toMillis() + 2000))
        }
    }
}
