package app.merak.patches.authenticator.gms

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.literal
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Google Play services availability check (`GoogleApiAvailability.isGooglePlayServicesAvailable`).
 * Returns a connection result code, 0 meaning available.
 */
internal object GooglePlayServicesAvailableFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "I"),
    filters = listOf(
        string("MetadataValueReader"),
        string("This should never happen."),
    ),
)

/** Throws if Google Play services is unavailable (`GooglePlayServicesUtil.ensurePlayServicesAvailable`). */
internal object EnsureGooglePlayServicesAvailableFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "I"),
    filters = listOf(
        string("Google Play Services not available"),
    ),
)

/**
 * Google Play services connection config constructors (service action, package, bind flags).
 * The package is hardcoded to Google Play services. There are two such classes in the app.
 */
internal object GmsServiceConnectionConfigFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Z"),
    filters = listOf(
        string("com.google.android.gms"),
        // Bind flags: BIND_AUTO_CREATE | BIND_ADJUST_WITH_ACTIVITY | BIND_INCLUDE_CAPABILITIES.
        literal(4225),
    ),
)

/**
 * Resolves the service of a Google Play services action by asking the "chimera" content
 * provider of Google Play services (dynamic lookup), using a static content URI.
 */
internal object GmsServiceDynamicLookupFingerprint : Fingerprint(
    parameters = listOf("Ljava/util/concurrent/Executor;"),
    filters = listOf(
        string("serviceActionBundleKey"),
        // bundle.putString("serviceActionBundleKey", action)
        methodCall(definingClass = "Landroid/os/Bundle;", name = "putString"),
        // The static chimera provider URI.
        fieldAccess(opcode = Opcode.SGET_OBJECT, type = "Landroid/net/Uri;"),
        methodCall(name = "acquireUnstableContentProviderClient"),
        string("serviceIntentCall"),
    ),
)

/** Loads Google Play services dynamite modules (used by ML Kit). */
internal object DynamiteModuleFingerprint : Fingerprint(
    filters = listOf(
        string("com.google.android.gms.dynamite.descriptors."),
    ),
)
