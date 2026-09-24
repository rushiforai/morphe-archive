package app.template.patches.sweepy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SWEEPY
import java.security.MessageDigest
import java.util.UUID

/**
 * PairIP runs from a content provider before React Native starts and rejects any
 * APK signed with a key other than Google Play's. Skip its initializer so a
 * legitimately installed, locally patched build can reach Sweepy's own code.
 */
private val disablePairIpLicenseCheckPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_SWEEPY)

    execute {
        PairIpLicenseProviderOnCreateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}

/**
 * Forces Sweepy's JavaScript subscription checks to treat the active user as premium.
 *
 * Sweepy 6.1.3 keeps its feature gates in a Hermes v96 bundle. Literal reads of
 * `user.premium` compile to six-byte `GetById` instructions. Replace those reads
 * with `LoadConstTrue` while preserving the bytecode layout.
 */
@Suppress("unused")
val unlockPremiumPatch = rawResourcePatch(
    name = "Unlock Premium",
    description = "Unlocks Sweepy Premium features.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SWEEPY)
    dependsOn(disablePairIpLicenseCheckPatch)

    execute {
        val bundlePath = "assets/index.android.bundle"
        val bundle = get(bundlePath)
        if (!bundle.exists()) {
            throw PatchException(
                "$bundlePath missing. Use the Play Store split APKs containing the Hermes bundle.",
            )
        }

        val bytes = bundle.readBytes()
        if (bytes.size < HERMES_FOOTER_SIZE) {
            throw PatchException("$bundlePath is too small to be a valid Hermes bundle.")
        }

        val premiumReads = bytes.findPremiumReads()
        if (premiumReads.size != EXPECTED_PREMIUM_READS) {
            throw PatchException(
                "Expected $EXPECTED_PREMIUM_READS premium reads in Sweepy 6.1.3 " +
                    "(Hermes v96), found ${premiumReads.size}; refusing to patch.",
            )
        }

        for (instructionAt in premiumReads) {
            val destinationRegister = bytes[instructionAt + 1]

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

        // Give the patched embedded Expo update a new identity so an existing install
        // cannot continue using a cached copy of the original Hermes bundle.
        val manifestPath = "assets/app.manifest"
        val manifest = get(manifestPath)
        if (!manifest.exists()) {
            throw PatchException("$manifestPath missing; cannot refresh the Expo update identity.")
        }

        val manifestText = manifest.readText()
        val updateIdPattern = Regex(""""id":"[0-9a-fA-F-]{36}"""")
        val commitTimePattern = Regex(""""commitTime":\d+""")
        if (updateIdPattern.findAll(manifestText).count() != 1) {
            throw PatchException("Expected exactly one Expo update ID in $manifestPath.")
        }
        if (commitTimePattern.findAll(manifestText).count() != 1) {
            throw PatchException("Expected exactly one Expo commit time in $manifestPath.")
        }

        val patchedUpdateId = UUID.nameUUIDFromBytes(digest).toString()
        val patchedManifest = manifestText
            .replace(updateIdPattern, """"id":"$patchedUpdateId"""")
            .replace(commitTimePattern, """"commitTime":${System.currentTimeMillis()}""")
        manifest.writeText(patchedManifest)
    }
}

private const val EXPECTED_PREMIUM_READS = 21
private const val HERMES_FOOTER_SIZE = 20
private const val GET_BY_ID: Byte = 0x37
private const val LOAD_CONST_TRUE: Byte = 0x78
private const val ASYNC_BREAK_CHECK: Byte = 0x62
private const val PREMIUM_ID_LOW: Byte = 0x81.toByte()
private const val PREMIUM_ID_HIGH: Byte = 0x72

/**
 * Finds Hermes v96 `GetById <dst>, <object>, <cache>, 29313` instructions.
 * String identifier 29313 (`premium`) is encoded little-endian as 81 72.
 */
private fun ByteArray.findPremiumReads(): List<Int> {
    val matches = mutableListOf<Int>()
    val lastInstructionStart = size - 6

    for (i in 0..lastInstructionStart) {
        if (
            this[i] == GET_BY_ID &&
            this[i + 4] == PREMIUM_ID_LOW &&
            this[i + 5] == PREMIUM_ID_HIGH
        ) {
            matches += i
        }
    }

    return matches
}
