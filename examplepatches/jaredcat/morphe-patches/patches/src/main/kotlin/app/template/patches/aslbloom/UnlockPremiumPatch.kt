package app.template.patches.aslbloom

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_ASL_BLOOM
import java.security.MessageDigest

/**
 * Forces ASL Bloom's JavaScript subscription checks to treat the user as premium.
 *
 * ASL Bloom 1.36.63 stores its lesson, collection, and subscription gates in a
 * Hermes v96 bundle. Every literal `isPremium` read compiles to a six-byte
 * `GetById` instruction. Replace those reads with `LoadConstTrue` while keeping
 * the bytecode layout unchanged.
 */
@Suppress("unused")
val unlockPremiumPatch = rawResourcePatch(
    name = "Unlock Premium",
    description = "Unlocks ASL Bloom Premium lessons and features.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ASL_BLOOM)

    execute {
        val bundlePath = "assets/index.android.bundle"
        val bundle = get(bundlePath)
        if (!bundle.exists()) {
            throw PatchException(
                "$bundlePath missing. Use the APKPure XAPK containing the Hermes bundle.",
            )
        }

        val bytes = bundle.readBytes()
        if (bytes.size < HERMES_FOOTER_SIZE) {
            throw PatchException("$bundlePath is too small to be a valid Hermes bundle.")
        }

        val premiumReads = bytes.findPremiumReads()
        if (premiumReads.size != EXPECTED_PREMIUM_READS) {
            throw PatchException(
                "Expected $EXPECTED_PREMIUM_READS isPremium reads in ASL Bloom 1.36.63 " +
                    "(Hermes v96), found ${premiumReads.size}; refusing to patch.",
            )
        }

        for (instructionAt in premiumReads) {
            val destinationRegister = bytes[instructionAt + 1]

            // GetById occupies six bytes. Load true into the original destination
            // register and fill the remaining bytes with operand-free instructions.
            byteArrayOf(
                LOAD_CONST_TRUE,
                destinationRegister,
                ASYNC_BREAK_CHECK,
                ASYNC_BREAK_CHECK,
                ASYNC_BREAK_CHECK,
                ASYNC_BREAK_CHECK,
            ).copyInto(bytes, destinationOffset = instructionAt)
        }

        // Hermes v96 stores SHA-1(file without its final 20 bytes) in the footer.
        val footerAt = bytes.size - HERMES_FOOTER_SIZE
        val digest = MessageDigest.getInstance("SHA-1").digest(bytes.copyOf(footerAt))
        digest.copyInto(bytes, destinationOffset = footerAt)

        bundle.writeBytes(bytes)
    }
}

private const val EXPECTED_PREMIUM_READS = 63
private const val HERMES_FOOTER_SIZE = 20
private const val GET_BY_ID: Byte = 0x37
private const val LOAD_CONST_TRUE: Byte = 0x78
private const val ASYNC_BREAK_CHECK: Byte = 0x62
private const val IS_PREMIUM_ID_LOW: Byte = 0xF4.toByte()
private const val IS_PREMIUM_ID_HIGH: Byte = 0xF4.toByte()

/**
 * Finds Hermes v96 `GetById <dst>, <object>, <cache>, 62708` instructions.
 * String identifier 62708 (`isPremium`) is encoded little-endian as F4 F4.
 */
private fun ByteArray.findPremiumReads(): List<Int> {
    val matches = mutableListOf<Int>()
    val lastInstructionStart = size - 6

    for (i in 0..lastInstructionStart) {
        if (
            this[i] == GET_BY_ID &&
            this[i + 4] == IS_PREMIUM_ID_LOW &&
            this[i + 5] == IS_PREMIUM_ID_HIGH
        ) {
            matches += i
        }
    }

    return matches
}
