package arpit.morphe.patches.alphaprogression.pairip

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Matches `com.pairip.SignatureCheck.verifyIntegrity(Context)`.
 *
 * Hashes the signing certificate with SHA-256 and throws
 * `SignatureCheck$SignatureTamperedException` ("Apk signature is invalid.") when the
 * result matches neither the stored value nor the test/known digests.
 */
object SignatureCheckVerifyIntegrityFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("Apk signature is invalid.", "Signature check ok"),
)

/**
 * Matches `com.pairip.licensecheck.LicenseClient.checkLicense(Context)`.
 *
 * On a `NOT_LICENSED` verdict it starts the PairIP paywall, which sends the user to the
 * Play Store listing, and schedules an app shutdown.
 */
object LicenseClientCheckLicenseFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf(
        "Cannot check license with null context.",
        "Skipping license check in isolated process.",
    ),
)
