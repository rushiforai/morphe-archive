package me.toidicakhia.patches.locket

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/** OkHttp 5 enforces configured pins here. Locket ships no pins, but stub it defensively. */
val LocketCertificatePinnerCheckFingerprint = Fingerprint(
    definingClass = "Lokhttp3/CertificatePinner;",
    name = "b",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lkotlin/jvm/functions/Function0;"
    ),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

/** OkHttp's default hostname verifier; return true so a proxy hostname is accepted. */
val LocketOkHostnameVerifierFingerprint = Fingerprint(
    definingClass = "Lokhttp3/internal/tls/OkHostnameVerifier;",
    name = "verify",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljavax/net/ssl/SSLSession;"
    ),
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC)
)

/** Methods that compute the X-Android-Cert header from the APK signing certificate. */
private val certProducers = listOf(
    "LKd/c;" to "g",                                                       // Firebase Installations
    "Lcom/google/firebase/remoteconfig/internal/e;" to "l",                // Remote Config
    "Lcom/google/firebase/remoteconfig/internal/ConfigFetchHttpClient;" to "i",
    "LKc/p;" to "d",                                                       // App Check
    "Lcom/google/android/gms/internal/firebase-auth-api/zzaen;" to "zza"  // Firebase Auth
)

val locketCertProducerFingerprints = certProducers.map { (owner, methodName) ->
    Fingerprint(
        definingClass = owner,
        name = methodName,
        parameters = emptyList(),
        returnType = "Ljava/lang/String;",
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
    )
}
