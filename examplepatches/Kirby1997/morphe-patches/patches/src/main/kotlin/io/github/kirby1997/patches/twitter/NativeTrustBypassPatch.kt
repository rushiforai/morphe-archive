package io.github.kirby1997.patches.twitter

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.kirby1997.patches.shared.Constants

// X's native OkHttp stack (AppNetworkModule_TlsOkHttpClient) installs its own SSLSocketFactory +
// a custom X509TrustManager (com.x.android.io.impl.d) built from a baked keystore and its own SPKI
// pin set. That trust manager validates the chain itself and throws CertificateException on
// anything it doesn't pin - so it IGNORES the app's networkSecurityConfig, and the universal
// "Allow user certificates" patch does NOT let an intercepting proxy (Burp/mitmproxy) decrypt
// X's native API traffic. (The okhttp3.CertificatePinner bypass is separate and still needed.)
//
// Stubbing checkServerTrusted to return-void makes the trust manager accept any server cert, so a
// user-installed proxy CA is honoured on the native path. For inspecting your OWN device's X
// traffic on an unrooted phone; pair with the universal MITM patches.
object NativeTrustManagerCheckServerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "[Ljava/security/cert/X509Certificate;",
        "Ljava/lang/String;",
    ),
    definingClass = "Lcom/x/android/io/impl/d;",
    name = "checkServerTrusted",
)

@Suppress("unused")
val bypassNativeTrustManagerPatch = bytecodePatch(
    name = "Bypass native certificate validation (X)",
    description = "Neutralises X's custom X509TrustManager (com.x.android.io.impl.d) so an " +
        "intercepting proxy with a user-installed CA can read X's native API traffic. Pair with " +
        "the universal MITM patches (user certs + OkHttp pinning bypass). For inspecting your own " +
        "device's traffic; leave off for normal use.",
    // Default-off: disables native server-cert validation, so it must never apply
    // unless explicitly selected. Only wanted for MITM-inspecting your own traffic.
    default = false,
) {
    compatibleWith(Constants.TWITTER_12_7_1)

    execute {
        NativeTrustManagerCheckServerFingerprint.method.addInstructions(0, "return-void")
    }
}
