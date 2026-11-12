package app.gwp.patches.google.microg

import app.morphe.patcher.Fingerprint

/** Class of GooglePlayServicesUtil (obfuscated), identified by its error messages. */
internal object GooglePlayServicesUtilClassFingerprint : Fingerprint(
    strings = listOf(" requires Google Play services, but their signature is invalid."),
)

/** isGooglePlayServicesAvailable(Context, int): int  -  0 means SUCCESS. */
internal object IsGooglePlayServicesAvailableFingerprint : Fingerprint(
    classFingerprint = GooglePlayServicesUtilClassFingerprint,
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "I"),
)

/** GoogleSignatureVerifier (obfuscated), identified by its log message. */
internal const val SIGNATURE_VERIFIER_LOG = "Unable to obtain package certificate history."

/** Boolean checks of GoogleSignatureVerifier that are forced to true. */
internal val SIGNATURE_VERIFIER_METHODS = setOf(
    "(Ljava/lang/String;)Z",
    "(I)Z",
    "(Landroid/content/pm/PackageInfo;Z)Z",
)

/** Device compliance check of the bundled GMS client; falls back to a local "feature disabled" path. */
internal object DeviceComplianceFeatureFingerprint : Fingerprint(
    strings = listOf("Checking for device compliance...", "Feature is disabled!"),
)

/** Lambda that opens UncertifiedDeviceActivity ("device is not Play Protect certified"). */
internal object UncertifiedDeviceRedirectFingerprint : Fingerprint(
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf(),
    strings = listOf("Redirecting to UncertifiedDeviceActivity."),
)

internal const val ROBIN_MAIN_ACTIVITY =
    "Lcom/google/android/apps/search/assistant/surfaces/voice/robin/main/MainActivity;"
