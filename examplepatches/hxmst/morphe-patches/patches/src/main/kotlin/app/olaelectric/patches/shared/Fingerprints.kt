package app.olaelectric.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * Fingerprint for OkHttp's HttpUrl.Builder.build() method.
 * In the obfuscated APK, this is Lokhttp3/h$a;->a()Lokhttp3/h;
 */
object HttpUrlBuilderFingerprint : Fingerprint(
    parameters = emptyList(),
    filters = listOf(
        string("host == null")
    )
)

/**
 * Fingerprint for OkHttp's CertificatePinner.check(String, List<Certificate>)
 * In the obfuscated APK, this is Lokhttp3/CertificatePinner;->a(Ljava/lang/String;Ljava/util/List;)V
 */
object CertificatePinnerAFingerprint : Fingerprint(
    definingClass = "Lokhttp3/CertificatePinner;",
    name = "a",
    returnType = "V"
)

/**
 * Fingerprint for OkHttp's CertificatePinner.check$okhttp(String, Function0)
 * In the obfuscated APK, this is Lokhttp3/CertificatePinner;->b(Ljava/lang/String;Llv/a;)V
 */
object CertificatePinnerBFingerprint : Fingerprint(
    definingClass = "Lokhttp3/CertificatePinner;",
    name = "b",
    returnType = "V"
)

/**
 * Fingerprint for OkHostnameVerifier.verify(String, SSLSession)
 * In the obfuscated APK, this is Lcx/d;->verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z
 */
object OkHostnameVerifierFingerprint : Fingerprint(
    name = "verify",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "Ljavax/net/ssl/SSLSession;")
)

/**
 * Fingerprint for AndroidCertificateChainCleaner.clean(List<Certificate>, String)
 * In the obfuscated APK, this is Lax/b;->a(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
 */
object AndroidCertificateChainCleanerFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/List;"),
    filters = listOf(
        string("RSA")
    )
)

/**
 * Fingerprint for BasicCertificateChainCleaner.clean(List<Certificate>, String)
 * In the obfuscated APK, this is Lcx/a;->a(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
 */
object BasicCertificateChainCleanerFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/List;"),
    filters = listOf(
        string("Certificate chain too long: ")
    )
)

/**
 * Fingerprint for OkHttp Android10Platform.isCleartextTrafficPermitted(String) in Lzw/a;
 */
object OkHttpCleartextPermittedAFingerprint : Fingerprint(
    definingClass = "Lzw/a;",
    name = "h",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;")
)

/**
 * Fingerprint for OkHttp AndroidPlatform.isCleartextTrafficPermitted(String) in Lzw/b;
 */
object OkHttpCleartextPermittedBFingerprint : Fingerprint(
    definingClass = "Lzw/b;",
    name = "h",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;")
)

/**
 * Fingerprint for Luq/j;->a(Ljava/lang/String;)Z (SU binary / path checker)
 */
object DetectDeviceRepoFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        string("/system/app/Superuser.apk")
    )
)

/**
 * Fingerprint for Lsj/a$a;->b()Z (DeviceInfo.isRooted() check)
 */
object DeviceInfoRootFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        string("/system/sd/xbin/su")
    )
)

/**
 * Fingerprint for DetectDeviceUseCase$run$2$isDeviceRooted$1.invokeSuspend
 */
object DetectDeviceRootUseCaseFingerprint : Fingerprint(
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        string("busybox")
    )
)

/**
 * Fingerprint for SplashActivity.initObserver$lambda$5 (Rooted device error bottom sheet)
 */
object SplashRootDialogFingerprint : Fingerprint(
    definingClass = "Lcom/olaelectric/presentationv3/views/splash/SplashActivity;",
    name = "initObserver\$lambda\$5",
    returnType = "Lxu/p;",
    parameters = listOf("Lcom/olaelectric/presentationv3/views/splash/SplashActivity;", "Ljava/lang/Boolean;"),
    filters = listOf(
        string("Splash Activity")
    )
)

/**
 * Fingerprint for OlaLoginManager.initAuth() which enforces HTTPS on baseUrl.
 */
object OlaLoginManagerInitAuthFingerprint : Fingerprint(
    definingClass = "Lcom/olacabs/login/OlaLoginManager;",
    name = "initAuth",
    returnType = "V",
    filters = listOf(
        string("baseUrl must use HTTPS for non-debug builds")
    )
)

