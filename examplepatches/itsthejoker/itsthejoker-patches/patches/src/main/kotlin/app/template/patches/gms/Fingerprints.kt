package app.template.patches.gms

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * `GoogleApiAvailability.isGooglePlayServicesAvailable(Context, int)` in the bundled
 * play-services-basement (Roost 1.4.12: `Lcom/google/android/gms/common/e;`). Returns an
 * `int` ConnectionResult code; forcing it to `0` (SUCCESS) stops Roost from rejecting
 * microG as "not real Play Services".
 *
 * NOTE: In Roost's play-services version this is an INSTANCE method (public, not static),
 * unlike some other app targets — hence PUBLIC only. The three anchor strings occur in
 * exactly one method, which is this one.
 */
internal object GooglePlayUtilityFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "I",
    parameters = listOf("L", "I"),
    strings = listOf(
        "This should never happen.",
        "MetadataValueReader",
        "com.google.android.gms",
    ),
)
