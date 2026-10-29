package app.daniele.patches.guitartuna

import app.daniele.patches.shared.Constants.COMPATIBILITY_GUITARTUNA
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

/**
 * The native library GuitarTuna's whole managed code is compiled into.
 *
 * The app is a Unity/IL2CPP build: every C# method lives in this one ELF
 * library, so the subscription gates are patched by rewriting their entry
 * points in place.
 */
private const val IL2CPP_LIBRARY = "lib/arm64-v8a/libil2cpp.so"

/**
 * `mov w0, #1` followed by `ret` (AArch64): return `true` without running the
 * original body.
 */
private val RETURN_TRUE = byteArrayOf(
    0x20, 0x00, 0x80.toByte(), 0x52,
    0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
)

/**
 * One absolute byte region of [IL2CPP_LIBRARY]: replaces [expected] with
 * [replacement].
 */
private class BytePatch(
    val where: String,
    val offset: Int,
    val expected: ByteArray,
    val replacement: ByteArray,
)

/**
 * Offsets are file offsets inside libil2cpp.so. Each entry point is replaced by
 * a constant `true` return: the subscription state every feature gate reads is
 * then always active, which also keeps the app from offering a subscription to
 * a user it considers subscribed.
 */
private val BYTE_PATCHES = listOf(
    // SubscriptionProvider.SubscriptionResponseHasFeature(SubscriptionResponse,
    // ProductFeature): the primitive every feature check ends in. It decides
    // whether a subscription payload grants one feature.
    BytePatch(
        where = "subscription feature check",
        offset = 0x0675A70C,
        expected = byteArrayOf(
            0xFF.toByte(), 0x43, 0x01, 0xD1.toByte(),
            0xFE.toByte(), 0x5F, 0x02, 0xA9.toByte(),
        ),
        replacement = RETURN_TRUE,
    ),
    // SubscriptionProvider.<IsSubscribedToAnyRenewableFeature>b__32_0:
    // maps the subscription payload to "has an auto-renewing plan".
    BytePatch(
        where = "renewable subscription check",
        offset = 0x0675BF98,
        expected = byteArrayOf(
            0xFE.toByte(), 0x0F, 0x1E, 0xF8.toByte(),
            0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte(),
        ),
        replacement = RETURN_TRUE,
    ),
    // SubscriptionProvider.<IsSubscribedToAnyFeature>b__33_0: maps the
    // subscription payload to "is subscribed to anything". This is the value
    // the menu, the paywall routing and the feature gates read.
    BytePatch(
        where = "any subscription check",
        offset = 0x0675C680,
        expected = byteArrayOf(
            0x3F, 0x00, 0x00, 0xF1.toByte(),
            0xE0.toByte(), 0x07, 0x9F.toByte(), 0x1A,
        ),
        replacement = RETURN_TRUE,
    ),
)

private fun ByteArray.toHexString() = joinToString(" ") { "%02X".format(it) }

@Suppress("unused")
val unlockPremiumPatch = rawResourcePatch(
    name = "Unlock Premium",
    description = "Unlocks the premium subscription, its song catalog and practice tools, " +
        "and skips the subscription screen the app shows on launch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GUITARTUNA)

    execute {
        val library = get(IL2CPP_LIBRARY)
        val data = library.readBytes()

        if (data.size < 0x067F0000) {
            throw PatchException("$IL2CPP_LIBRARY is unexpectedly small (${data.size} bytes).")
        }

        var applied = 0
        for (patch in BYTE_PATCHES) {
            val actual = data.copyOfRange(patch.offset, patch.offset + patch.expected.size)
            when {
                // Already patched, nothing to do.
                actual.contentEquals(patch.replacement) -> Unit
                actual.contentEquals(patch.expected) -> {
                    patch.replacement.copyInto(data, patch.offset)
                    applied++
                }
                else -> throw PatchException(
                    "Obsolete patch: expected original bytes of ${patch.where} " +
                        "not found at offset 0x${patch.offset.toString(16).padStart(8, '0')} " +
                        "(found ${actual.toHexString()}, expected ${patch.expected.toHexString()}). " +
                        "This patch set targets GuitarTuna 7.103.0.",
                )
            }
        }

        if (applied > 0) library.writeBytes(data)
    }
}
