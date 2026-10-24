package app.morphe.patches.score365.microg

import app.morphe.patcher.Fingerprint

// Splash launcher activity onCreate(Bundle) override
internal object SplashOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/ui/Splash;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

// GooglePlayServicesUtilLight.isGooglePlayServicesAvailable(Context, int). It checks that
// "com.google.android.gms" is installed and signed by Google; after the rewrite it would check
// MicroG RE, which is not Google-signed, and report SERVICE_INVALID. Forced to SUCCESS (0).
// R8 may reorder the parameters (e.g. 365Scores 14.9.6 "c(int, Context)"), so both (I, L) orders match.
internal const val GOOGLE_SIGNATURE_INVALID_WARNING = " requires Google Play services, but their signature is invalid."

internal object GooglePlayUtilityFingerprint : Fingerprint(
    returnType = "I",
    strings = listOf(GOOGLE_SIGNATURE_INVALID_WARNING, "com.google.android.gms"),
    custom = { method, _ ->
        method.parameterTypes.map { if (it.startsWith("L")) "L" else it.toString() }.sorted() == listOf("I", "L")
    },
)

// GooglePlayServicesUtilLight.ensurePlayServicesAvailable(Context, int): throws "Google Play
// Services not available" when the availability check fails; returned early.
// Matches (Context), (Context, int), or (int, Context).
internal const val SERVICE_CHECK_MESSAGE = "Google Play Services not available"

private fun isServiceCheckParameters(parameterTypes: List<CharSequence>) =
    parameterTypes.map(CharSequence::toString).sorted() in listOf(
        listOf("Landroid/content/Context;"),
        listOf("I", "Landroid/content/Context;"),
    )

internal object ServiceCheckFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf(SERVICE_CHECK_MESSAGE),
    custom = { method, _ -> isServiceCheckParameters(method.parameterTypes) },
)
