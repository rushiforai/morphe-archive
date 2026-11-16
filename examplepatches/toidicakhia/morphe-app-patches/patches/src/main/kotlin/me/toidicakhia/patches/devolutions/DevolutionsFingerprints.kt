package me.toidicakhia.patches.devolutions

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * .NET 8's Android TLS backend routes certificate validation through this
 * X509TrustManager. Both callbacks throw a CertificateException whenever the
 * native verifyRemoteCertificate() returns false, which is what happens for
 * pinned hosts and for user-installed CAs outside the system store.
 */
internal object DotnetProxyTrustManagerFingerprint : Fingerprint(
    definingClass = "Lnet/dot/android/crypto/DotnetProxyTrustManager;",
    name = "checkServerTrusted",
    parameters = listOf("[Ljava/security/cert/X509Certificate;", "Ljava/lang/String;"),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

internal object DotnetProxyClientTrustManagerFingerprint : Fingerprint(
    definingClass = "Lnet/dot/android/crypto/DotnetProxyTrustManager;",
    name = "checkClientTrusted",
    parameters = listOf("[Ljava/security/cert/X509Certificate;", "Ljava/lang/String;"),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

/**
 * The Xamarin peer Mono.Android registers for its own trust manager. Its native
 * callback forwards to the same validation that the proxy above performs.
 */
internal object XamarinTrustManagerCheckServerTrustedFingerprint : Fingerprint(
    definingClass = "Lxamarin/android/net/ServerCertificateCustomValidator_TrustManager;",
    name = "checkServerTrusted",
    parameters = listOf("[Ljava/security/cert/X509Certificate;", "Ljava/lang/String;"),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC)
)

/**
 * The only implementation of the Play Age Signals client that the app can hand to
 * the managed verify call. The managed side waits on the returned task, so replacing
 * this body with a completed task removes the Play Store round trip entirely.
 */
internal object AgeSignalsAccessRequestFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/play/agesignals/zzb;",
    name = "requestAgeSignalsAccess",
    parameters = listOf("Lcom/google/android/play/agesignals/AgeSignalsAccessRequest;"),
    returnType = "Lcom/google/android/gms/tasks/Task;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)
