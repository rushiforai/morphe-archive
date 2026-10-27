package app.morphe.patches.ibispaint

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.shared.Constants
import java.io.File
import java.io.RandomAccessFile

@Suppress("unused")
val ibisPaintEnablePrimePatch = rawResourcePatch(
    name = "Enable Prime membership",
    description = "Enables app features locked behind the subscription paywall.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_IBIS_PAINT)

    execute {
        val libEntry = findArm64LibEntry(this)
            ?: error("[Enable Prime membership] arm64-v8a libibispaint.so not found in package. An arm64-v8a split APK or merged bundle is required.")

        val libFile = get(libEntry)
        if (!libFile.isFile) {
            error("[Enable Prime membership] libibispaint.so could not be resolved on disk: $libEntry")
        }

        val fileLength = libFile.length()
        val requiredLength = maxOf(
            IS_FAILURE_OFFSET + IS_FAILURE_EXPECTED.size,
            IS_PROMO_OFFSET + IS_PROMO_EXPECTED.size,
        )
        if (fileLength < requiredLength) {
            error("[Enable Prime membership] libibispaint.so size ($fileLength bytes) is smaller than required ($requiredLength bytes).")
        }

        patchNativeBinary(libFile)
        println("[Enable Prime membership] Patched 2 native hooks in libibispaint.so -> Prime membership enabled.")
    }
}

private const val PRIMARY_LIB_PATH = "lib/arm64-v8a/libibispaint.so"

private const val IS_FAILURE_OFFSET = 0x18B6C80L
private val IS_FAILURE_EXPECTED = byteArrayOf(
    0x48.toByte(), 0xD0.toByte(), 0x00.toByte(), 0xD0.toByte(),
    0x08.toByte(), 0xBD.toByte(), 0x45.toByte(), 0xF9.toByte(),
)
private val IS_FAILURE_PATCH = byteArrayOf(
    0xE0.toByte(), 0x03.toByte(), 0x1F.toByte(), 0x2A.toByte(),
    0xC0.toByte(), 0x03.toByte(), 0x5F.toByte(), 0xD6.toByte(),
)

private const val IS_PROMO_OFFSET = 0x1B96B5CL
private val IS_PROMO_EXPECTED = byteArrayOf(
    0xE8.toByte(), 0x0F.toByte(), 0x1E.toByte(), 0xFC.toByte(),
    0xFD.toByte(), 0xFB.toByte(), 0x00.toByte(), 0xA9.toByte(),
)
private val IS_PROMO_PATCH = byteArrayOf(
    0x20.toByte(), 0x00.toByte(), 0x80.toByte(), 0x52.toByte(),
    0xC0.toByte(), 0x03.toByte(), 0x5F.toByte(), 0xD6.toByte(),
)

private fun findArm64LibEntry(context: ResourcePatchContext): String? {
    val arm64Entries = context.listApkEntries("lib/arm64-v8a/")
    if (PRIMARY_LIB_PATH in arm64Entries) {
        return PRIMARY_LIB_PATH
    }

    val candidate = context.listApkEntries("").firstOrNull { entry ->
        entry.endsWith("libibispaint.so") && entry.contains("arm64")
    }
    if (candidate != null) {
        return candidate
    }

    val direct = try {
        context.get(PRIMARY_LIB_PATH)
    } catch (_: Exception) {
        null
    }
    if (direct != null && direct.isFile && direct.length() > 0L) {
        return PRIMARY_LIB_PATH
    }

    return null
}

private fun patchNativeBinary(libFile: File) {
    RandomAccessFile(libFile, "rw").use { raf ->
        raf.seek(IS_FAILURE_OFFSET)
        val failureBuf = ByteArray(IS_FAILURE_EXPECTED.size)
        raf.readFully(failureBuf)
        if (!failureBuf.contentEquals(IS_FAILURE_EXPECTED)) {
            error(
                "[Enable Prime membership] Original bytes mismatch at isFailure offset 0x${IS_FAILURE_OFFSET.toString(16)} " +
                    "(expected ${IS_FAILURE_EXPECTED.joinToString("") { "%02x".format(it) }}, " +
                    "got ${failureBuf.joinToString("") { "%02x".format(it) }})."
            )
        }

        raf.seek(IS_PROMO_OFFSET)
        val promoBuf = ByteArray(IS_PROMO_EXPECTED.size)
        raf.readFully(promoBuf)
        if (!promoBuf.contentEquals(IS_PROMO_EXPECTED)) {
            error(
                "[Enable Prime membership] Original bytes mismatch at isPromotionalPrimeMember offset 0x${IS_PROMO_OFFSET.toString(16)} " +
                    "(expected ${IS_PROMO_EXPECTED.joinToString("") { "%02x".format(it) }}, " +
                    "got ${promoBuf.joinToString("") { "%02x".format(it) }})."
            )
        }

        raf.seek(IS_FAILURE_OFFSET)
        raf.write(IS_FAILURE_PATCH)

        raf.seek(IS_PROMO_OFFSET)
        raf.write(IS_PROMO_PATCH)
    }
}
