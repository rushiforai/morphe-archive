package app.daniele.patches.cinemaniac

import app.daniele.patches.shared.Constants.COMPATIBILITY_CINEMANIAC
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import java.security.MessageDigest

/**
 * The React Native Hermes JavaScript bundle holding the app's logic.
 */
private const val HERMES_BUNDLE = "assets/index.android.bundle"

/** Hermes bytecode container magic. */
private val HERMES_MAGIC = byteArrayOf(
    0xC6.toByte(), 0x1F.toByte(), 0xBC.toByte(), 0x03.toByte(),
    0xC1.toByte(), 0x03.toByte(), 0x19.toByte(), 0x1F.toByte(),
)

/** Bytecode version, stored little-endian right after the magic. */
private const val HERMES_VERSION_OFFSET = 8
private const val HERMES_VERSION = 96

/**
 * Every Hermes v96 container ends with a 20-byte footer holding the SHA-1
 * hash of all preceding bytes.
 */
private const val HERMES_FOOTER_SIZE = 20

/**
 * One absolute byte region: replaces [expected] with [replacement].
 *
 * Offsets and bytes were derived by disassembling the Cinemaniac 5.0.7 bundle
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
    // _getIsPROfromDB inner generator (function @ file offset 0x003D1187),
    // instruction at relative offset 0x1A5. 'StrictEq r3, r3, r2' compares the
    // re-computed device checksum against the stored one and decides isPro at
    // INIT. 'LoadConstTrue r3' forces the result to true; the two 1-byte
    // AsyncBreakCheck instructions pad the removed 2 bytes (Hermes 96 has no
    // Nop opcode).
    BytePatch(
        where = "_getIsPROfromDB isPro comparison",
        offset = 0x003D132C,
        expected = byteArrayOf(0x0F, 0x03, 0x03, 0x02),
        replacement = byteArrayOf(0x78, 0x03, 0x62, 0x62),
    ),
    // _validateProStatus inner generator (function @ file offset 0x003CF9DE),
    // instruction at relative offset 0x72. 'JmpTrue +0x2F, r4' enters the
    // verified-PRO branch only when the backend purchase check resolves
    // truthy. The unconditional 'Jmp +0x2E' (issued at 0x73, targeting 0xA1)
    // always enters that branch, which calls setPurchaseValid() and returns
    // true regardless of the backend verdict. AsyncBreakCheck pads byte one.
    BytePatch(
        where = "_validateProStatus verified-PRO branch",
        offset = 0x003CFA50,
        expected = byteArrayOf(0x90.toByte(), 0x2F, 0x04),
        replacement = byteArrayOf(0x62, 0x8E.toByte(), 0x2E),
    ),
)

private fun littleEndianUInt32(data: ByteArray, offset: Int) =
    (data[offset].toInt() and 0xFF) or
        ((data[offset + 1].toInt() and 0xFF) shl 8) or
        ((data[offset + 2].toInt() and 0xFF) shl 16) or
        ((data[offset + 3].toInt() and 0xFF) shl 24)

private fun ByteArray.toHexString() = joinToString(" ") { "%02X".format(it) }

@Suppress("unused")
val unlockProPatch = rawResourcePatch(
    name = "Unlock Pro",
    description = "Forces the Pro entitlement to always resolve as active, " +
        "regardless of purchase or backend status.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CINEMANIAC)

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
                        "This patch set targets Cinemaniac 5.0.7.",
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
    }
}
