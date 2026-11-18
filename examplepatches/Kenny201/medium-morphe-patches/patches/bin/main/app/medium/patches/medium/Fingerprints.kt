package app.medium.patches.medium

import app.morphe.patcher.Fingerprint

/**
 * Fingerprint for Medium's main Application class.
 */
object DonkeyApplicationFingerprint : Fingerprint(
    definingClass = "Lcom/medium/android/donkey/DonkeyApplication;",
    name = "onCreate",
    returnType = "V"
)

/**
 * Fingerprint for GraphQL MembershipTier safeValueOf method.
 * Mocking this method to return MembershipTier.MEMBER unlocks full articles natively!
 */
object MembershipTierFingerprint : Fingerprint(
    name = "safeValueOf",
    returnType = "Lcom/medium/android/graphql/type/MembershipTier;",
    parameters = listOf("Ljava/lang/String;")
)

/**
 * Fingerprints for PairIP signature and license checks (Play Store error bypass).
 */
object PairIPSignatureFingerprint : Fingerprint(
    name = "verifyIntegrity",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

object PairIPLicenseFingerprint : Fingerprint(
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

object PairIPActivityFingerprint : Fingerprint(
    name = "onStart",
    returnType = "V",
    parameters = emptyList()
)