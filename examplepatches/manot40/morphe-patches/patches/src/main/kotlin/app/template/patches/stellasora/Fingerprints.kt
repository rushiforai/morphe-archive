package app.template.patches.stellasora

import app.morphe.patcher.Fingerprint

object NetClientManageSetOkHttpSslFingerprint : Fingerprint(
    definingClass = "Lcom/yostar/airisdk/core/net/NetClientManage;",
    name = "setOkHttpSsl",
    returnType = "Lokhttp3/OkHttpClient\$Builder;",
    parameters = listOf("Lokhttp3/OkHttpClient\$Builder;")
)

object OkHttpClientBuilderInitFingerprint : Fingerprint(
    definingClass = "Lokhttp3/OkHttpClient\$Builder;",
    name = "<init>",
    returnType = "V",
    parameters = listOf()
)

object OkHttpPlatformTrustManagerFingerprint : Fingerprint(
    definingClass = "Lokhttp3/internal/platform/Platform;",
    name = "platformTrustManager",
    returnType = "Ljavax/net/ssl/X509TrustManager;",
    parameters = listOf()
)

object AndroidCertificateChainCleanerCleanFingerprint : Fingerprint(
    definingClass = "Lokhttp3/internal/platform/android/AndroidCertificateChainCleaner;",
    name = "clean",
    returnType = "Ljava/util/List;",
    parameters = listOf("Ljava/util/List;", "Ljava/lang/String;")
)

object OkHostnameVerifierVerifySessionFingerprint : Fingerprint(
    definingClass = "Lokhttp3/internal/tls/OkHostnameVerifier;",
    name = "verify",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "Ljavax/net/ssl/SSLSession;")
)

object OkHostnameVerifierVerifyCertFingerprint : Fingerprint(
    definingClass = "Lokhttp3/internal/tls/OkHostnameVerifier;",
    name = "verify",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "Ljava/security/cert/X509Certificate;")
)

object VolleySslSocketFactoryCompatInitFingerprint : Fingerprint(
    definingClass = "Lcom/yostar/airisdk/core/net/volley/SSLSocketFactoryCompat;",
    name = "<init>",
    returnType = "V",
    parameters = listOf()
)

object UnityPlayerActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/unity3d/player/UnityPlayerActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)
