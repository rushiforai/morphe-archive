package app.epxec.patches.elmwood.microg

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Targets c42.c(Context, I)I — the concrete isGooglePlayServicesAvailable implementation
 * in the bundled GMS library shim. Identified by three stable string literals that appear
 * together only in this method.
 *
 * Patched to return 0 (ConnectionResult.SUCCESS) immediately so every GMS availability
 * check in the app succeeds against MicroG.
 */
internal object GooglePlayUtilityFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "I"),
    strings = listOf(
        "MetadataValueReader",
        "This should never happen.",
        "com.google.android.gms",
    )
)

/**
 * Targets c42.d(Context)V — the method that throws a fatal error when GMS is reported
 * unavailable. Identified by its unique error-message string.
 *
 * Patched to return-void so the app never kills itself over a missing GMS installation.
 */
internal object ServiceCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("Google Play Services not available")
)

/**
 * Targets Ln42.g(PackageInfo, Z)Z — the method that validates whether the installed
 * "com.google.android.gms" package is signed with a known Google certificate.
 *
 * The app bundles 5 hardcoded DER-encoded Google certs in Lvv7;. MicroG is NOT signed
 * with any of them, so this method returns false, causing c42.c() to return error code 9
 * (SIGNATURE_CHECK_FAILED) and block the whole GMS availability chain.
 *
 * Patched to always return true (1) so MicroG's signature is accepted unconditionally.
 */
internal object GmsSignatureCheckFingerprint : Fingerprint(
    definingClass = "Ln42;",
    returnType = "Z",
    parameters = listOf("Landroid/content/pm/PackageInfo;", "Z"),
    strings = listOf("debuggable release cert app rejected")
)

/**
 * Targets the method inside c42 that logs the "GooglePlayServices not available due to
 * error N" warning and resolves the update/install Intent.
 *
 * This is a secondary guard — if the availability check somehow still produces a non-zero
 * result, this method would fire the Play Store update dialog. Patching it to return-void
 * suppresses any residual error dialog.
 *
 * Identified by the unique log string "GooglePlayServices not available due to error"
 * which appears only in c42.d().  We use methodOrNull so a fingerprint miss is silent.
 */
internal object GmsAvailabilityDialogCheckFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("GooglePlayServices not available due to error ")
)

/**
 * Fallback: targets any void method that directly shows the GMS-unavailable error
 * dialog / fragment. Identified by the "Creating dialog" log tag that only appears
 * inside b42.i() — the AlertDialog factory for GMS error codes.
 *
 * Patched to return-void so no dialog is ever shown.
 */
internal object GmsDialogShowFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("Creating dialog for Google Play services availability issue. ConnectionResult=")
)

/**
 * Targets MainActivity.onCreate — non-obfuscated, used as the startup hook point.
 * The MicroG resource patch adds the required manifest meta-data; this fingerprint
 * is kept for completeness if a GmsCore prompt hook is ever needed.
 */
internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/techyonic/textbasedrpg/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)
