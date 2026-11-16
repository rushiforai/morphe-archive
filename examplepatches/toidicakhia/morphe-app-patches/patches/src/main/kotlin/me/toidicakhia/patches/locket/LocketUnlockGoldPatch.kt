package me.toidicakhia.patches.locket

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import me.toidicakhia.patches.shared.Constants.LOCKET_COMPATIBILITY
import java.security.MessageDigest

private const val BUNDLE_PATH = "assets/index.android.bundle"
private const val HERMES_VERSION = 96
private const val HERMES_SHA1_SIZE = 20
private val HERMES_MAGIC = byteArrayOf(
    0xC6.toByte(), 0x1F, 0xBC.toByte(), 0x03, 0xC1.toByte(), 0x03, 0x19, 0x1F
)

/**
 * Hermes bytecode of `androidGoldSubscriptionOverride()` in Locket 1.247.1.
 * The compiled function reads the `android_gold_subscription_override` remote
 * config flag:
 *
 *   GetEnvironment r0
 *   ...
 *   LoadConstString r0, "android_gold_subscription_override"
 *   Call2 r0, getBoolean
 *   Ret r0
 */
private val GOLD_OVERRIDE_METHOD =
    "2900002e000002360100015c7600510201003701020264b67300a6d353000102005c00".hexToByteArray()

// LoadConstTrue r0; Ret r0 — the remaining bytes are filled with Unreachable (0x00).
private val RETURN_TRUE_STUB = byteArrayOf(0x78, 0x00, 0x5C, 0x00)

@Suppress("unused")
val locketUnlockGoldPatch = resourcePatch(
    name = "Unlock Locket Gold",
    description = "Makes the app treat the signed-in account as a Locket Gold subscriber, " +
        "enabling the Gold-only feature gates and replacing the paywall with subscription " +
        "management. Client-side only: features validated by Locket's servers still need a " +
        "real subscription.",
    default = true
) {
    compatibleWith(LOCKET_COMPATIBILITY)
    execute {
        val bundle = get(BUNDLE_PATH)
        val bytecode = bundle.readBytes()

        val hasHermesMagic = bytecode.size > HERMES_SHA1_SIZE &&
            bytecode.copyOfRange(0, HERMES_MAGIC.size).contentEquals(HERMES_MAGIC)
        if (!hasHermesMagic) {
            throw PatchException("$BUNDLE_PATH is not a Hermes bytecode bundle")
        }

        val version = (bytecode[8].toInt() and 0xFF) or
            ((bytecode[9].toInt() and 0xFF) shl 8) or
            ((bytecode[10].toInt() and 0xFF) shl 16) or
            ((bytecode[11].toInt() and 0xFF) shl 24)
        if (version != HERMES_VERSION) {
            throw PatchException("Unsupported Hermes bytecode version $version, expected $HERMES_VERSION")
        }

        val offset = bytecode.indexOfSequence(GOLD_OVERRIDE_METHOD)
        if (offset == -1) {
            throw PatchException("Could not locate androidGoldSubscriptionOverride in $BUNDLE_PATH")
        }
        if (bytecode.indexOfSequence(GOLD_OVERRIDE_METHOD, offset + 1) != -1) {
            throw PatchException("androidGoldSubscriptionOverride is not unique in $BUNDLE_PATH")
        }

        RETURN_TRUE_STUB.copyInto(bytecode, offset)
        bytecode.fill(0x00, offset + RETURN_TRUE_STUB.size, offset + GOLD_OVERRIDE_METHOD.size)

        // Hermes stores a SHA-1 of the whole file in its footer.
        val footerOffset = bytecode.size - HERMES_SHA1_SIZE
        val digest = MessageDigest.getInstance("SHA-1")
        digest.update(bytecode, 0, footerOffset)
        digest.digest().copyInto(bytecode, footerOffset)
        bundle.writeBytes(bytecode)
    }
}

private fun String.hexToByteArray(): ByteArray =
    chunked(2).map { it.toInt(16).toByte() }.toByteArray()

private fun ByteArray.indexOfSequence(sequence: ByteArray, startIndex: Int = 0): Int {
    if (sequence.isEmpty() || sequence.size > size) return -1
    for (index in startIndex..size - sequence.size) {
        if (sequence.indices.all { this[index + it] == sequence[it] }) return index
    }
    return -1
}
