package app.daniele.patches.column

import app.daniele.patches.shared.Constants.COMPATIBILITY_COLUMN
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import java.security.MessageDigest

/**
 * The React Native Hermes JavaScript bundle holding the app's logic.
 */
private const val HERMES_BUNDLE = "assets/index.android.bundle"

/**
 * The runtime version expo-updates runs with. The manifest sets
 * EXPO_RUNTIME_VERSION to the sentinel "file:fingerprint", so expo reads this
 * asset at launch instead of using a baked-in string.
 */
private const val RUNTIME_VERSION_FILE = "assets/fingerprint"

/** Runtime version Column 2.0.1 was released with. */
private const val RELEASE_RUNTIME_VERSION = "2d64c7466e649087c023e8c2ac590aaa6f209b9f"

/**
 * Runtime version that was never published to the update channel. expo cannot
 * match it against any update, so the embedded bundle is always the one that
 * runs.
 */
private const val PATCHED_RUNTIME_VERSION = "0000000000000000000000000000000000000000"

/** Hermes bytecode container magic. */
private val HERMES_MAGIC = byteArrayOf(
    0xC6.toByte(), 0x1F.toByte(), 0xBC.toByte(), 0x03.toByte(),
    0xC1.toByte(), 0x03.toByte(), 0x19.toByte(), 0x1F.toByte(),
)

/** Bytecode version, stored little-endian right after the magic. */
private const val HERMES_VERSION_OFFSET = 8
private const val HERMES_VERSION = 98

/**
 * Every Hermes bytecode container ends with a 20-byte footer holding the
 * SHA-1 hash of all preceding bytes.
 */
private const val HERMES_FOOTER_SIZE = 20

/**
 * One absolute byte region: replaces [expected] with [replacement].
 *
 * Offsets and bytes were derived by disassembling the Column 2.0.1 bundle
 * with hermes-dec. Exact byte matching keeps the patch safe against other app
 * versions: it refuses to run instead of corrupting an unrecognized bundle.
 */
private class BytePatch(
    val where: String,
    val offset: Int,
    val expected: ByteArray,
    val replacement: ByteArray,
)

private val BYTE_PATCHES = listOf(
    // isPremium(entitlement, now) (function #14225 @ file offset 0x00467A45).
    // The body only returns true when the entitlement is PREMIUM and not
    // expired. 'LoadConstTrue r1; Ret r1' at the entry forces it to true for
    // every caller, including callers that pass a null or free record.
    BytePatch(
        where = "isPremium entitlement check",
        offset = 0x00467A45,
        expected = byteArrayOf(0x89.toByte(), 0x03, 0x02, 0x93.toByte()),
        replacement = byteArrayOf(0x95.toByte(), 0x01, 0x76, 0x01),
    ),
    // isPremiumUnlocked(entitlement, now) (function #14229 @ offset 0x00467B2F).
    // Returns true for an active PREMIUM or FREEMIUM grant; forced to true.
    BytePatch(
        where = "isPremiumUnlocked grant check",
        offset = 0x00467B2F,
        expected = byteArrayOf(0x89.toByte(), 0x06, 0x02, 0x93.toByte()),
        replacement = byteArrayOf(0x95.toByte(), 0x01, 0x76, 0x01),
    ),
    // premiumGrantOf(entitlement, now) (function #18819 @ offset 0x004B5692).
    // The UI treats the premium access as unlocked when this returns 'full'.
    // 'LoadConstString r4, 1278; Ret r4' returns the existing 'full' constant
    // (string id 1278 in this bundle) without reading any entitlement state.
    BytePatch(
        where = "premiumGrantOf access grant",
        offset = 0x004B5692,
        expected = byteArrayOf(
            0x89.toByte(), 0x06, 0x02, 0x93.toByte(), 0x02, 0xD5.toByte(),
        ),
        replacement = byteArrayOf(
            0x90.toByte(), 0x04, 0xFE.toByte(), 0x04, 0x76, 0x04,
        ),
    ),
    // Floater(props) (function #21454 @ offset 0x004ED528) is the floating
    // "Attiva premium" banner on the feed. It is driven by useIsFree and
    // useIsFreemium, which still read the free entitlement record, so forcing
    // the premium gates above does not hide it. 'LoadConstNull r1; Ret r1'
    // removes the banner for every state.
    BytePatch(
        where = "feed premium floater",
        offset = 0x004ED528,
        expected = byteArrayOf(0x89.toByte(), 0x05, 0x01, 0x45),
        replacement = byteArrayOf(0x94.toByte(), 0x01, 0x76, 0x01),
    ),
    // useIsPremium() (function #18862 @ offset 0x004B5EF0) returns false when
    // the entitlement record has not loaded yet, which would hide the profile
    // badge. Forced to true so the profile always shows the active premium.
    BytePatch(
        where = "profile premium hook",
        offset = 0x004B5EF0,
        expected = byteArrayOf(0x34, 0x03, 0x00, 0x3B),
        replacement = byteArrayOf(0x95.toByte(), 0x01, 0x76, 0x01),
    ),
    // PremiumBadge (function #21491 @ offset 0x004EDF57) looks up the label
    // key 'profile.profile.premium' (string id 42148). Point it at the floater
    // label key (string id 42158) instead; that translation value is replaced
    // below and the floater itself no longer renders.
    BytePatch(
        where = "profile premium badge label key",
        offset = 0x004EE15C,
        expected = byteArrayOf(0x90.toByte(), 0x0A, 0xA4.toByte(), 0xA4.toByte()),
        replacement = byteArrayOf(0x90.toByte(), 0x0A, 0xAE.toByte(), 0xA4.toByte()),
    ),
    // Italian value of 'ui.floater.floater.attiva-premium' (string id 8921 @
    // offset 0x00128CCD). Once Floater is disabled this string is unused, so
    // it becomes the profile badge label. Same length, edited in place.
    BytePatch(
        where = "profile premium badge label",
        offset = 0x00128CCD,
        expected = "Attiva premium".toByteArray(Charsets.UTF_8),
        replacement = "Premium MORHPE".toByteArray(Charsets.UTF_8),
    ),
)

private fun littleEndianUInt32(data: ByteArray, offset: Int) =
    (data[offset].toInt() and 0xFF) or
        ((data[offset + 1].toInt() and 0xFF) shl 8) or
        ((data[offset + 2].toInt() and 0xFF) shl 16) or
        ((data[offset + 3].toInt() and 0xFF) shl 24)

private fun ByteArray.toHexString() = joinToString(" ") { "%02X".format(it) }

@Suppress("unused")
val unlockPremiumPatch = rawResourcePatch(
    name = "Unlock Premium",
    description = "Forces the premium entitlement to always resolve as active, " +
        "hides the feed's premium activation banner, shows the active plan " +
        "as MORHPE in the profile and disables the app's over-the-air updates, " +
        "which would otherwise replace the patched bundle on the next launch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_COLUMN)

    execute {
        val bundle = get(HERMES_BUNDLE)
        val data = bundle.readBytes()

        if (data.size <= HERMES_FOOTER_SIZE) {
            throw PatchException("$HERMES_BUNDLE is unexpectedly empty.")
        }
        val footerOffset = data.size - HERMES_FOOTER_SIZE

        if (!data.copyOfRange(0, HERMES_MAGIC.size).contentEquals(HERMES_MAGIC)) {
            throw PatchException("$HERMES_BUNDLE is not a Hermes bytecode container.")
        }
        if (littleEndianUInt32(data, HERMES_VERSION_OFFSET) != HERMES_VERSION) {
            throw PatchException(
                "$HERMES_BUNDLE is not Hermes bytecode version $HERMES_VERSION.",
            )
        }

        // Reject bundles that are not in their original state instead of
        // patching blindly on top of foreign modifications.
        val actualFooter = data.copyOfRange(footerOffset, data.size)
        val expectedFooter = MessageDigest
            .getInstance("SHA-1")
            .digest(data.copyOfRange(0, footerOffset))
        if (!actualFooter.contentEquals(expectedFooter)) {
            throw PatchException(
                "$HERMES_BUNDLE does not match its embedded integrity hash. " +
                    "Apply this patch to the original, unmodified APK.",
            )
        }

        var applied = 0
        for (patch in BYTE_PATCHES) {
            val actual = data.copyOfRange(
                patch.offset,
                patch.offset + patch.expected.size,
            )
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
                        "This patch set targets Column 2.0.1.",
                )
            }
        }

        if (applied > 0) {
            // Keep the container a well-formed Hermes file after the edits.
            val digest = MessageDigest
                .getInstance("SHA-1")
                .digest(data.copyOfRange(0, footerOffset))
            digest.copyInto(data, footerOffset)
            bundle.writeBytes(data)
        }

        // Column ships an EAS Update channel: expo-updates downloads a pristine
        // bundle and launches it on the next start, silently reverting the edits
        // above. It reads its runtime version from this asset, so pointing it at
        // a version that was never published keeps the embedded, patched bundle
        // in use and invalidates any update already downloaded.
        val runtimeVersionFile = get(RUNTIME_VERSION_FILE)
        val runtimeVersion = runtimeVersionFile.readText().trim()
        when (runtimeVersion) {
            PATCHED_RUNTIME_VERSION -> Unit
            RELEASE_RUNTIME_VERSION ->
                runtimeVersionFile.writeText(PATCHED_RUNTIME_VERSION, Charsets.UTF_8)
            else -> throw PatchException(
                "Unexpected expo runtime version '$runtimeVersion' in $RUNTIME_VERSION_FILE. " +
                    "This patch set targets Column 2.0.1.",
            )
        }
    }
}
