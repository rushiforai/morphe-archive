package app.apppatches.patches.ezviz

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

val EzvizAdsSwitchFingerprint = Fingerprint(
    name = "shouldShowAdsSettings",
    definingClass = "Lcom/ezviz/ads/EzAds;",
    parameters = emptyList(),
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction is ReferenceInstruction &&
                (instruction.reference as? MethodReference)?.let { reference ->
                    reference.definingClass == "Lcom/ezviz/ads/internal/manager/AdsConfigManager;" &&
                        reference.name == "adsSettingSwitch"
                } == true
        } == true
    }
)

val EzvizHotSplashAdsFingerprint = Fingerprint(
    name = "hasHotSplashAds",
    definingClass = "Lcom/ezviz/ads/EzSplashAds;",
    parameters = listOf("Landroid/app/Activity;"),
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL)
)

val EzvizSslParamsFingerprint = Fingerprint(
    definingClass = "Lcom/ezplayer/http/core/client/EzvizHttpClient;",
    name = "getSSLParams",
    parameters = emptyList(),
    returnType = "Lcom/ezplayer/http/core/client/HttpsUtils\$SSLParams;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)
)

val EzvizHostnameVerifierFingerprint = Fingerprint(
    definingClass = "Lcom/ezplayer/http/core/client/EzvizHostnameVerifier;",
    name = "verify",
    parameters = listOf("Ljava/lang/String;", "Ljavax/net/ssl/SSLSession;"),
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC)
)

val EzvizStreamTlsVerifierFingerprint = Fingerprint(
    definingClass = "Lcom/ez/stream/EZTLSVerifier;",
    name = "onCertificateCheck",
    parameters = listOf("[B", "[I", "I"),
    returnType = "I",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)
)

val EzvizVideoTalkTlsVerifierFingerprint = Fingerprint(
    definingClass = "Lcom/ezviz/videotalk/utils/EZTLSVerifier;",
    name = "onCertificateCheck",
    parameters = listOf("[B", "[I", "I"),
    returnType = "I",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)
)

val OkHttpCertificatePinnerCheckFingerprint = Fingerprint(
    definingClass = "Lokhttp3/CertificatePinner;",
    name = "check",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/List;"),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC)
)

val EzvizLegacyHttpClientConstructorFingerprint = Fingerprint(
    definingClass = "Lcom/videogo/http/core/client/EzvizHttpClient;",
    name = "<init>",
    parameters = listOf("I"),
    returnType = "V",
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction is ReferenceInstruction &&
                (instruction.reference as? MethodReference)?.let { reference ->
                    reference.definingClass == "Lokhttp3/OkHttpClient\$Builder;" &&
                        reference.name == "build"
                } == true
        } == true
    }
)
