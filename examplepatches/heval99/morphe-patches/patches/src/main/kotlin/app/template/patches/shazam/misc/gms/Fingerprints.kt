package app.template.patches.shazam.misc.gms

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

// The launch activity (MAIN/LAUNCHER, also the target of the Splash alias). Its class is declared
// in the manifest, so R8 keeps the name; onCreate(Bundle) is a framework override.
internal object SplashActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/shazam/android/activities/SplashActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

internal const val SILENT_SIGN_IN_PREF = "prefkey_should_attempt_silent_sign_in"

// The Google sign-in use case's suspend entry signIn(context, origin, silent, continuation) (R8:
// Ig.b.b): when silent is true it checks this pref (and the country) and then requests a Google
// ID token with filterByAuthorizedAccounts = silent. The pref's other holder (sign-out, which
// resets it) has a different shape.
internal object SilentSignInFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Z", "L"),
    strings = listOf(string(SILENT_SIGN_IN_PREF, StringComparisonType.CONTAINS)),
)
