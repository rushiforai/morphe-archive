package app.template.patches.zalo

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.rawResourcePatch
import java.nio.file.Files
import java.security.MessageDigest

private const val LIBRARY = "lib/arm64-v8a/libnative_utils.so"
private const val ORIGINAL_SHA256 = "dd8f1601ebd5c34c18a8c5993e703916e51cf17ae9fa87caf0445c37283bbbeb"
private const val SIGNER_FAILURE_OFFSET = 0x2bc98
private val ORIGINAL_RETURN = byteArrayOf(0xe0.toByte(), 0x03, 0x1f, 0x2a)
private val PATCHED_RETURN = byteArrayOf(0x20, 0x00, 0x80.toByte(), 0x52)

@Suppress("unused")
val nativeSignaturePatch = rawResourcePatch(
    name = "Native signature fix",
    description = "Allow Zalo 26.08.01 and 26.10.02 ARM64 to start after patching and re-signing. ARMv7 is not supported.",
    default = false,
) {
    compatibleWith(Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(AppTarget(version = "26.08.01"), AppTarget(version = "26.10.02")),
    ))

    execute {
        check(LIBRARY in listApkEntries("lib/arm64-v8a/")) { "Missing $LIBRARY" }
        val file = this[LIBRARY].toPath()
        val bytes = Files.readAllBytes(file)
        val expectedHash = ORIGINAL_SHA256.chunked(2).map { it.toInt(16).toByte() }.toByteArray()
        check(MessageDigest.isEqual(MessageDigest.getInstance("SHA-256").digest(bytes), expectedHash) &&
            SIGNER_FAILURE_OFFSET + ORIGINAL_RETURN.size <= bytes.size &&
            bytes.copyOfRange(SIGNER_FAILURE_OFFSET, SIGNER_FAILURE_OFFSET + ORIGINAL_RETURN.size)
                .contentEquals(ORIGINAL_RETURN)) { "Unexpected Zalo native library version or instruction" }
        PATCHED_RETURN.copyInto(bytes, SIGNER_FAILURE_OFFSET)
        Files.write(file, bytes)
    }
}