package app.badfella.patches.boldvoice

import app.badfella.patches.util.hexBytes
import java.security.MessageDigest

private const val MAGIC = 0x1f1903c103bc1fc6L
private const val EXPECTED_VERSION = 99

// Target 1: hasClientPremiumAccess (offset 0x1a6b1ad, 72 bytes)
internal const val T1_OFFSET = 0x1a6b1ad
internal const val T1_SIZE = 72
internal val T1_BEFORE = hexBytes("8902014503020080b3130003130000b10f0045030201c3cb130103130001b128004505020253619401160105019302b1110144040503e690032c746e020405031301021300017600")
internal val T1_AFTER = hexBytes("9500" + "7600".repeat(35))

// Target 2: selectIsSubscriber (offset 0x1b07808, 16 bytes)
internal const val T2_OFFSET = 0x1b07808
internal const val T2_SIZE = 16
internal val T2_BEFORE = hexBytes("89000144000000f94500000180b37600")
internal val T2_AFTER = hexBytes("9500" + "7600".repeat(7))

// Target 3: selectIsProSubscriber (offset 0x1b1c281, 16 bytes)
internal const val T3_OFFSET = 0x1b1c281
internal const val T3_SIZE = 16
internal val T3_BEFORE = hexBytes("89000144000000f9450000011be67600")
internal val T3_AFTER = hexBytes("9500" + "7600".repeat(7))

/**
 * Patches the Hermes 99 JavaScript bytecode bundle for BoldVoice 5.1.3 (build 470).
 *
 * Targets reviewed:
 * 1. hasClientPremiumAccess (72 bytes at offset 0x1a6b1ad): checks isSubscriber, unlockAll, and
 *    role.startsWith("admin"). Replaced with LoadConstTrue r0 followed by Ret r0 to grant client-side
 *    premium feature checks and lesson materials.
 * 2. selectIsSubscriber selector body (16 bytes at offset 0x1b07808): reads state.userState.isSubscriber.
 *    Replaced with LoadConstTrue r0 and Ret r0 to report subscriber state as true.
 * 3. selectIsProSubscriber selector body (16 bytes at offset 0x1b1c281): reads state.userState.isProSubscriber.
 *    Replaced with LoadConstTrue r0 and Ret r0 to report pro subscriber state as true.
 *
 * Reseals the trailing 20-byte SHA-1 footer.
 */
internal fun patchBoldVoiceBundle(stock: ByteArray): ByteArray {
    check(stock.size in 148..(128 * 1024 * 1024)) { "Hermes bundle size is invalid or exceeds 128 MiB" }
    check(longAt(stock, 0) == MAGIC) { "Hermes bytecode magic changed" }
    check(intAt(stock, 8) == EXPECTED_VERSION) { "Hermes bytecode version changed; this app needs review" }
    check(intAt(stock, 32) == stock.size) { "Hermes bundle length is invalid" }

    val footer = stock.size - 20
    check(sha1(stock, 0, footer).contentEquals(stock.copyOfRange(footer, stock.size))) {
        "Hermes bytecode footer checksum is invalid"
    }

    check(T1_OFFSET + T1_SIZE <= footer) { "Target 1 is out of bounds" }
    check(stock.copyOfRange(T1_OFFSET, T1_OFFSET + T1_SIZE).contentEquals(T1_BEFORE)) {
        "BoldVoice hasClientPremiumAccess anchor changed"
    }

    check(T2_OFFSET + T2_SIZE <= footer) { "Target 2 is out of bounds" }
    check(stock.copyOfRange(T2_OFFSET, T2_OFFSET + T2_SIZE).contentEquals(T2_BEFORE)) {
        "BoldVoice selectIsSubscriber anchor changed"
    }

    check(T3_OFFSET + T3_SIZE <= footer) { "Target 3 is out of bounds" }
    check(stock.copyOfRange(T3_OFFSET, T3_OFFSET + T3_SIZE).contentEquals(T3_BEFORE)) {
        "BoldVoice selectIsProSubscriber anchor changed"
    }

    val result = stock.copyOf()
    T1_AFTER.copyInto(result, T1_OFFSET)
    T2_AFTER.copyInto(result, T2_OFFSET)
    T3_AFTER.copyInto(result, T3_OFFSET)

    sha1(result, 0, footer).copyInto(result, footer)
    return result
}

private fun intAt(bytes: ByteArray, offset: Int): Int {
    check(offset >= 0 && offset + 4 <= bytes.size) { "Hermes read is out of bounds" }
    return (bytes[offset].toInt() and 0xff) or
        ((bytes[offset + 1].toInt() and 0xff) shl 8) or
        ((bytes[offset + 2].toInt() and 0xff) shl 16) or
        ((bytes[offset + 3].toInt() and 0xff) shl 24)
}

private fun longAt(bytes: ByteArray, offset: Int): Long {
    check(offset >= 0 && offset + 8 <= bytes.size) { "Hermes read is out of bounds" }
    return (intAt(bytes, offset).toLong() and 0xffffffffL) or (intAt(bytes, offset + 4).toLong() shl 32)
}

private fun sha1(bytes: ByteArray, offset: Int, length: Int): ByteArray =
    MessageDigest.getInstance("SHA-1").apply { update(bytes, offset, length) }.digest()
