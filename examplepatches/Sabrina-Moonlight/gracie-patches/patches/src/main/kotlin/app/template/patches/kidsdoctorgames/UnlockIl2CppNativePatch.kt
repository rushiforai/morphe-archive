package app.template.patches.kidsdoctorgames

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.byteArrayOf
import java.io.RandomAccessFile
import java.util.logging.Logger

/**
 * Kids doctor games 1.12 — force Unity IL2CPP access gates in libil2cpp.so (arm64-v8a).
 *
 * Dump source (Il2CppDumper, metadata v39 / Unity 6):
 * - BimiBoo.Pass.PassEntitlement.HasThisAppPurchase        @ 0x2AF7DEC
 * - BimiBoo.Pass.PassEntitlement.IsOwnedSharedActive       @ 0x2B006A8
 * - BimiBoo.Pass.PassEntitlement.IsActive                  @ 0x2AFF2B8
 * - SubscriptionStatusService.get_HasNonServerAccessGrant @ 0x2BC2D20
 * - SubscriptionStatusService.get_HasNonServerPassGrant   @ 0x2BC2D44
 * - BbiapSessionService.get_IsFullAccess                  @ 0x2CC49C4
 *
 * Each unique ARM64 prologue is replaced with:
 *   mov w0, #1
 *   ret
 * = 20 00 80 52  c0 03 5f d6
 *
 * Patterns verified unique (exactly 1 occurrence) in this version's libil2cpp.so.
 * Use together with [unlockSubscriptionPatch] (Java / SharedSub side).
 */
private const val LIB = "lib/arm64-v8a/libil2cpp.so"

/** ARM64: mov w0, #1 ; ret */
private val RETURN_TRUE = byteArrayOf("20 00 80 52 c0 03 5f d6")

private data class NativeGate(
    val name: String,
    val pattern: ByteArray,
)

private val GATES = listOf(
    // PassEntitlement.HasThisAppPurchase
    NativeGate(
        "HasThisAppPurchase",
        byteArrayOf("fe 0f 1e f8 f4 4f 01 a9 d4 92 01 d0 53 79 01 b0"),
    ),
    // PassEntitlement.IsOwnedSharedActive
    NativeGate(
        "IsOwnedSharedActive",
        byteArrayOf("fe 0f 1e f8 f4 4f 01 a9 94 92 01 b0 f3 03 00 aa"),
    ),
    // PassEntitlement.IsActive
    NativeGate(
        "IsActive",
        byteArrayOf("ff c3 00 d1 fe 57 01 a9 f4 4f 02 a9 94 92 01 d0"),
    ),
    // SubscriptionStatusService.get_HasNonServerAccessGrant
    NativeGate(
        "get_HasNonServerAccessGrant",
        byteArrayOf("08 a0 40 39 68 00 00 34 20 00 80 52 c0 03 5f d6"),
    ),
    // SubscriptionStatusService.get_HasNonServerPassGrant
    NativeGate(
        "get_HasNonServerPassGrant",
        byteArrayOf("08 a0 40 39 68 00 00 35 08 e0 40 39 68 00 00 34"),
    ),
    // BbiapSessionService.get_IsFullAccess
    NativeGate(
        "get_IsFullAccess",
        byteArrayOf("00 20 40 f9 01 00 00 14 fe 57 be a9 f4 4f 01 a9"),
    ),
)

@Suppress("unused")
val unlockIl2CppNativePatch = rawResourcePatch(
    name = "Unlock subscription (IL2CPP native)",
    description = "Forces Unity IL2CPP access getters (HasThisAppPurchase, " +
        "IsOwnedSharedActive, offline grants, IsFullAccess, IsActive) to true in " +
        "lib/arm64-v8a/libil2cpp.so. Required together with Unlock subscription (Java / SharedSub).",
    default = true,
) {
    compatibleWith(KIDS_DOCTOR_GAMES)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        val target = get(LIB, true)
        if (!target.exists()) {
            throw PatchException(
                "Native library not found: $LIB — open the APKS (not only base.apk) " +
                    "so the arm64-v8a split is included.",
            )
        }

        RandomAccessFile(target, "rw").use { raf ->
            for (gate in GATES) {
                val offset = indexOfPattern(raf, gate.pattern)
                if (offset < 0L) {
                    throw PatchException(
                        "IL2CPP pattern not found for ${gate.name}: " +
                            gate.pattern.joinToString(" ") { "%02x".format(it) },
                    )
                }
                // Write return-true over the start of the method; pad with the
                // remaining original pattern length so we only touch what we matched.
                val padded = RETURN_TRUE + ByteArray(gate.pattern.size - RETURN_TRUE.size)
                raf.seek(offset)
                raf.write(padded)
                logger.info("IL2CPP gate ${gate.name} forced true @ 0x${offset.toString(16)}")
            }
        }

        logger.info("Kids doctor games: ${GATES.size} IL2CPP native gates patched")
    }
}

/**
 * Buffered search for [needle] in [file]. Returns absolute offset or -1.
 */
private fun indexOfPattern(file: RandomAccessFile, needle: ByteArray): Long {
    val right = IntArray(256) { -1 }
    for ((i, element) in needle.withIndex()) {
        right[element.toInt() and 0xFF] = i
    }

    val bufferSize = 65536
    val buffer = ByteArray(bufferSize + needle.size)
    var fileOffset = 0L
    val fileLength = file.length()

    while (fileOffset < fileLength) {
        file.seek(fileOffset)
        val bytesRead = file.read(buffer)
        if (bytesRead < needle.size) break

        var i = 0
        while (i <= bytesRead - needle.size) {
            var j = needle.size - 1
            while (j >= 0 && buffer[i + j] == needle[j]) j--
            if (j < 0) {
                return fileOffset + i
            }
            val shift = j - right[buffer[i + j].toInt() and 0xFF]
            i += maxOf(1, shift)
        }
        fileOffset += (bytesRead - needle.size + 1).toLong()
    }
    return -1L
}
