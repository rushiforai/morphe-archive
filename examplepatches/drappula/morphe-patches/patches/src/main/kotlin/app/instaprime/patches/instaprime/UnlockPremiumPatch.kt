package app.instaprime.patches.instaprime

import app.instaprime.patches.shared.Constants.COMPATIBILITY_INSTAPRIME
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import java.io.File
import java.io.RandomAccessFile

/**
 * Native library that contains the subscription check. InstaPrime only ships arm64-v8a code.
 */
private const val PRIMEMODS_LIBRARY = "lib/arm64-v8a/libprimemods.so"

/**
 * `SubscriptionManager` reads the stored subscription expiry from a SharedPreferences key. The
 * obfuscator turns the 64 bit string id of that key into instructions that build the id in a
 * register, which ends with `movk xN, #0xa4c6, lsl #32`. That instruction is used to find the
 * check independently of where the library places the function.
 */
private const val EXPIRY_KEY_IMM16 = 0xA4C6

/** `movk xN, #imm16, lsl #32` with `imm16` cleared. */
private const val MOVK_64_LSL_32 = 0xF2C00000.toInt()

/** Keeps the opcode and the shift, clears the immediate and the destination register. */
private const val MOVK_IMM16_MASK = 0xFFE00000.toInt()

/** `mov w0, #1`, executed when the subscription is missing or expired. */
private const val RETURN_EXPIRED = 0x52800020

/** `mov w0, #0`, which reports an active subscription. */
private const val RETURN_NOT_EXPIRED = 0x52800000

/**
 * How far after the key construction the `mov w0, #1` of the expired branch may be.
 */
private const val MAX_GATE_DISTANCE = 4096

private const val CHUNK_SIZE = 1 shl 20

@Suppress("unused")
val unlockPremiumPatch = rawResourcePatch(
    name = "Unlock premium",
    description = "Unlocks the premium subscription by making the subscription check " +
        "always report an active subscription.",
) {
    compatibleWith(COMPATIBILITY_INSTAPRIME)

    execute {
        if (listApkEntries("lib/").none { it == PRIMEMODS_LIBRARY }) {
            throw PatchException(
                "The APK does not contain $PRIMEMODS_LIBRARY. " +
                    "Only the arm64-v8a APK is supported."
            )
        }

        val library = get(PRIMEMODS_LIBRARY)

        val keyOffsets = findExpiryKeyInstructions(library)
        if (keyOffsets.isEmpty()) {
            throw PatchException(
                "$PRIMEMODS_LIBRARY does not contain the subscription check. " +
                    "The app version is not supported."
            )
        }

        val returnOffsets = keyOffsets
            .mapNotNull { findExpiredReturn(library, it) }
            .distinct()

        val returnOffset = returnOffsets.singleOrNull()
            ?: throw PatchException(
                "Expected exactly one subscription check in $PRIMEMODS_LIBRARY, " +
                    "found ${returnOffsets.size}. The app version is not supported."
            )

        patchWord(library, returnOffset, RETURN_NOT_EXPIRED)
    }
}

/**
 * Finds every `movk xN, #0xa4c6, lsl #32` instruction in [library]. These build the string id of
 * the SharedPreferences key that stores the subscription expiry.
 */
private fun findExpiryKeyInstructions(library: File): List<Long> {
    val offsets = mutableListOf<Long>()
    val buffer = ByteArray(CHUNK_SIZE)

    RandomAccessFile(library, "r").use { file ->
        val length = file.length()
        var offset = 0L

        while (offset < length) {
            file.seek(offset)
            val read = file.read(buffer)
            if (read < 4) break

            var index = 0
            while (index + 4 <= read) {
                val word = readWord(buffer, index)
                if ((word and MOVK_IMM16_MASK) == MOVK_64_LSL_32 &&
                    (word ushr 5) and 0xFFFF == EXPIRY_KEY_IMM16
                ) {
                    offsets += offset + index
                }
                index += 4
            }

            // Advance in whole instructions so every word stays 4 byte aligned.
            offset += read.toLong() and 3L.inv()
        }
    }

    return offsets
}

/**
 * Finds the `mov w0, #1` that the subscription check executes when the subscription is missing or
 * expired, looking only a short distance after [start].
 */
private fun findExpiredReturn(library: File, start: Long): Long? {
    val buffer = ByteArray(MAX_GATE_DISTANCE)

    RandomAccessFile(library, "r").use { file ->
        file.seek(start)
        val read = file.read(buffer)
        if (read < 8) return null

        // Skip the key construction instruction itself.
        var index = 4
        while (index + 4 <= read) {
            if (readWord(buffer, index) == RETURN_EXPIRED) return start + index
            index += 4
        }
    }

    return null
}

private fun readWord(buffer: ByteArray, index: Int): Int =
    (buffer[index].toInt() and 0xFF) or
        ((buffer[index + 1].toInt() and 0xFF) shl 8) or
        ((buffer[index + 2].toInt() and 0xFF) shl 16) or
        ((buffer[index + 3].toInt() and 0xFF) shl 24)

private fun patchWord(library: File, offset: Long, word: Int) {
    RandomAccessFile(library, "rw").use { file ->
        file.seek(offset)
        file.write(
            byteArrayOf(
                word.toByte(),
                (word ushr 8).toByte(),
                (word ushr 16).toByte(),
                (word ushr 24).toByte()
            )
        )

        file.seek(offset)
        val patched = ByteArray(4)
        file.readFully(patched)
        if (readWord(patched, 0) != word) {
            throw PatchException(
                "Failed to patch $PRIMEMODS_LIBRARY at 0x${offset.toString(16)}."
            )
        }
    }
}
