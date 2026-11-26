// patches/src/main/kotlin/app/w3s/patches/w3schools/misc/gms/Fingerprints.kt
package app.w3s.patches.w3schools.misc.gms

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object GooglePlayUtilityFingerprint : Fingerprint(
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "I"),
    strings = listOf(
        "GooglePlayServicesUtil",
        "com.google.android.gms",
        "com.google.android.gms.version",
    ),
)

internal object ServiceCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "I"),
    strings = listOf("GooglePlayServices not available due to error "),
)

internal object TryCreatePostUProviderFingerprint : Fingerprint(
    definingClass = "Landroidx/credentials/CredentialProviderFactory;",
    name = "tryCreatePostUProvider",
    returnType = "Landroidx/credentials/CredentialProvider;",
    parameters = listOf(),
)
