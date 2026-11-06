package app.template.patches.shared.gms

import app.morphe.patcher.Fingerprint

/**
 * isGooglePlayServicesAvailable(Context, int) of the Google Play services library,
 * which also verifies that Google Play services is signed by Google.
 */
internal object GooglePlayServicesAvailabilityFingerprint : Fingerprint(
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "I"),
    strings = listOf("MetadataValueReader", "This should never happen."),
)

/**
 * The same method in versions of the library without these strings, in apps
 * that keep the names of the library classes.
 */
internal object GooglePlayServicesUtilLightAvailabilityFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/common/GooglePlayServicesUtilLight;",
    name = "isGooglePlayServicesAvailable",
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "I"),
)
