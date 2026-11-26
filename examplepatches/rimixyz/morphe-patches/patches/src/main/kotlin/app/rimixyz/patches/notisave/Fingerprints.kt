package app.rimixyz.patches.notisave

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * Fingerprints ancoradas no base.apk de com.tenqube.notisave 274.1.3.2 (versionCode 316),
 * SHA-256 AD585A8DC99B42D6CAD3C4F1F6A9BACA8CEBC8CBC1ACD44E517400F38A338C10.
 *
 * Os nomes de classe ofuscados (h9.b, m9.e, G9.c, T9.b, i7.e...) são estáveis apenas nesta
 * versão. O TargetGuard e o compatibleWith com assinatura impedem aplicação em outro alvo.
 */

private const val PREMIUM_PREFS = "Lcom/zipoapps/premiumhelper/c;"
private const val AD_MANAGER = "Lm9/a;"
private const val INTERSTITIAL = "Lm9/e;"
private const val REWARDED = "Ls9/f;"
private const val NATIVE = "Lp9/h;"
private const val BANNER_MANAGER = "Lcom/zipoapps/ads/banner/a;"
private const val ANALYTICS = "Lcom/zipoapps/premiumhelper/a;"
private const val BLYTICS = "Lcom/zipoapps/premiumhelper/d;"
private const val ADVERTISING_ID_CLIENT = "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;"
private const val ADVERTISING_ID_INFO = "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;"

// ---------------------------------------------------------------------------
// Gate premium
// ---------------------------------------------------------------------------

/**
 * Árbitro único do estado premium: lê a preferência booleana "has_active_purchase".
 * Todas as telas (paywall, VIP support, menu Remove Ads, preferências cadeadas) e até os
 * managers de anúncio passam por aqui, diretamente ou via T9.b / i7.e.
 *
 * Corpo confirmado:
 *   return this.f40995a.getBoolean("has_active_purchase", false);
 */
internal object HasActivePurchaseFingerprint : Fingerprint(
    definingClass = PREMIUM_PREFS,
    name = "hasActivePurchase",
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        string("has_active_purchase"),
        methodCall(definingClass = "Landroid/content/SharedPreferences;", name = "getBoolean", returnType = "Z"),
    ),
)

// ---------------------------------------------------------------------------
// Anúncios — AppLovin MAX + AdMob/Facebook/Yandex/Vungle/AppMonet
// ---------------------------------------------------------------------------

/** Registro automático de intersticiais (ActivityLifecycleCallbacks). */
internal object AutoInterstitialInitFingerprint : Fingerprint(
    definingClass = AD_MANAGER,
    name = "initialize",
    returnType = "V",
    parameters = emptyList(),
)

/** View de banner custom (PhShimmerBannerAdView): dispara o carregamento em main. */
internal object BannerViewLoadFingerprint : Fingerprint(
    definingClass = "Lh9/q;",
    name = "access\$loadAdInternal",
    returnType = "V",
    parameters = listOf("Lh9/q;"),
)

/** Carregamento de banner no manager; a sobrecarga suspend é deixada intacta. */
internal object BannerLoadFingerprint : Fingerprint(
    definingClass = BANNER_MANAGER,
    name = "loadBanner",
    returnType = "V",
    parameters = listOf("Lcom/zipoapps/ads/banner/b;", "Lj9/c;"),
    filters = listOf(string("[BannerManager] loadBanner: type=")),
)

/** Interstitial: checa hasActivePurchase() e chama showInterstitial(...). */
internal object InterstitialShowFingerprint : Fingerprint(
    definingClass = INTERSTITIAL,
    name = "showInterstitialAd",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "Lh9/k;"),
    filters = listOf(string("[InterstitialManager] showInterstitialAd")),
)

/** Rewarded: checa hasActivePurchase() e chama showRewardedAd(...). */
internal object RewardedShowFingerprint : Fingerprint(
    definingClass = REWARDED,
    name = "showRewardedAd",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "Ls9/b;"),
    filters = listOf(string("[RewardedManager] showRewardedAd")),
)

/** Nativo: cinco sobrecargas suspend (devolvem Object/Unit). */
internal val nativeLoadSuspendFingerprints = listOf(
    Fingerprint(definingClass = NATIVE, name = "loadNativeAd", returnType = "Ljava/lang/Object;", parameters = listOf("Lp9/f;", "Leb/e;")),
    Fingerprint(definingClass = NATIVE, name = "loadNativeAd", returnType = "Ljava/lang/Object;", parameters = listOf("Lp9/f;", "Lp9/c;", "Leb/e;")),
    Fingerprint(definingClass = NATIVE, name = "loadNativeAd", returnType = "Ljava/lang/Object;", parameters = listOf("Lp9/l;", "Leb/e;")),
    Fingerprint(definingClass = NATIVE, name = "loadNativeAd", returnType = "Ljava/lang/Object;", parameters = listOf("Lp9/m;", "Leb/e;")),
    Fingerprint(definingClass = NATIVE, name = "loadNativeAd", returnType = "Ljava/lang/Object;", parameters = listOf("Lp9/m;", "Lp9/c;", "Leb/e;")),
)

/** Nativo: cinco sobrecargas void (callbacks de load). */
internal val nativeLoadVoidFingerprints = listOf(
    Fingerprint(definingClass = NATIVE, name = "loadNativeAd", returnType = "V", parameters = listOf("Lp9/f;", "Lp9/b;")),
    Fingerprint(definingClass = NATIVE, name = "loadNativeAd", returnType = "V", parameters = listOf("Lp9/f;", "Lp9/c;", "Lp9/b;")),
    Fingerprint(definingClass = NATIVE, name = "loadNativeAd", returnType = "V", parameters = listOf("Lp9/l;", "Lp9/b;")),
    Fingerprint(definingClass = NATIVE, name = "loadNativeAd", returnType = "V", parameters = listOf("Lp9/m;", "Lp9/b;")),
    Fingerprint(definingClass = NATIVE, name = "loadNativeAd", returnType = "V", parameters = listOf("Lp9/m;", "Lp9/c;", "Lp9/b;")),
)

// ---------------------------------------------------------------------------
// Tracking — Blytics, Singular, Firebase Analytics, AppMetrica, eventos internos
// ---------------------------------------------------------------------------

/** Inicialização do barramento Blytics: configura userId e registra plataformas. */
internal object InitAnalyticsFingerprint : Fingerprint(
    definingClass = BLYTICS,
    name = "access\$initAnalytics",
    returnType = "Ljava/lang/Object;",
    parameters = listOf(BLYTICS, "Leb/e;"),
)

/** fa.C$b.invokeSuspend: Singular.init(context, SingularConfig(...).withCustomUserId(id)). */
internal object SingularInitFingerprint : Fingerprint(
    definingClass = "Lfa/C\$b;",
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(methodCall(definingClass = "Lcom/singular/sdk/Singular;", name = "init", returnType = "Z")),
)

/** z9.a.initialize(Application, boolean): FirebaseAnalytics.getInstance(application). */
internal object FirebaseAnalyticsInitFingerprint : Fingerprint(
    definingClass = "Lz9/a;",
    name = "initialize",
    returnType = "V",
    parameters = listOf("Landroid/app/Application;", "Z"),
    filters = listOf(methodCall(definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;", name = "getInstance")),
)

/** API do Google Play Services empacotada no próprio APK e usada pelos SDKs de anúncios. */
internal object AdvertisingIdInfoFingerprint : Fingerprint(
    definingClass = ADVERTISING_ID_CLIENT,
    name = "getAdvertisingIdInfo",
    returnType = ADVERTISING_ID_INFO,
    parameters = listOf("Landroid/content/Context;"),
)

/** O AdMob também instancia o cliente e chama start() diretamente. */
internal object AdvertisingIdStartFingerprint : Fingerprint(
    definingClass = ADVERTISING_ID_CLIENT,
    name = "start",
    returnType = "V",
    parameters = emptyList(),
)

internal object AdvertisingIdInstanceInfoFingerprint : Fingerprint(
    definingClass = ADVERTISING_ID_CLIENT,
    name = "getInfo",
    returnType = ADVERTISING_ID_INFO,
    parameters = emptyList(),
)

/** A consulta de modo de teste do AdMob também abre uma conexão com o serviço de AD_ID. */
internal object AdvertisingIdDebugFingerprint : Fingerprint(
    definingClass = ADVERTISING_ID_CLIENT,
    name = "getIsAdIdFakeForDebugLogging",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

/** Ativação anônima do adaptador de biblioteca, usada pela mediação Yandex. */
internal object AppMetricaLibraryActivationFingerprint : Fingerprint(
    definingClass = "Lio/appmetrica/analytics/impl/x0;",
    name = "a",
    returnType = "V",
    parameters = listOf("Lio/appmetrica/analytics/AppMetricaLibraryAdapterConfig;"),
    filters = listOf(string("Activate AppMetrica in anonymous mode")),
)

/** Ativação explícita do SDK AppMetrica. */
internal object AppMetricaActivateFingerprint : Fingerprint(
    definingClass = "Lio/appmetrica/analytics/AppMetrica;",
    name = "activate",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Lio/appmetrica/analytics/AppMetricaConfig;"),
)

/** Reporter auxiliar da AppMetrica usado pela mediação Yandex. */
internal object AppMetricaReporterFingerprint : Fingerprint(
    definingClass = "Lio/appmetrica/analytics/AppMetrica;",
    name = "activateReporter",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Lio/appmetrica/analytics/ReporterConfig;"),
)

/** Envio de eventos do analytics interno (25 chamadores). */
internal val sendEventFingerprints = listOf(
    Fingerprint(definingClass = ANALYTICS, name = "sendEvent", returnType = "V", parameters = listOf("Ljava/lang/String;", "[Landroid/os/Bundle;")),
    Fingerprint(definingClass = ANALYTICS, name = "sendEvent", returnType = "V", parameters = listOf("Ly9/b;")),
    Fingerprint(definingClass = ANALYTICS, name = "sendEventWithoutSession", returnType = "V", parameters = listOf("Ljava/lang/String;", "[Landroid/os/Bundle;")),
    Fingerprint(definingClass = ANALYTICS, name = "sendEventWithoutSession", returnType = "V", parameters = listOf("Ly9/b;")),
)

/** Eventos Firebase do app (Q6.r). */
internal val appAnalyticsFingerprints = listOf(
    Fingerprint(definingClass = "LQ6/r;", name = "sendCustomEvent", returnType = "V", parameters = listOf("Landroid/content/Context;", "LQ6/p;")),
    Fingerprint(definingClass = "LQ6/r;", name = "screenLog", returnType = "V", parameters = listOf("Landroid/app/Activity;", "Ljava/lang/String;")),
)

/** Implementação real por trás de AppMetrica.activate (o método público é só um delegado). */
internal object AppMetricaImplActivateFingerprint : Fingerprint(
    definingClass = "Lio/appmetrica/analytics/impl/p1;",
    name = "a",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Lio/appmetrica/analytics/AppMetricaConfig;"),
)

/** Implementação real por trás de AppMetrica.activateReporter. */
internal object AppMetricaImplReporterFingerprint : Fingerprint(
    definingClass = "Lio/appmetrica/analytics/impl/p1;",
    name = "a",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Lio/appmetrica/analytics/ReporterConfig;"),
)

/** Caminho interno real de ativação (p1.b, não p1.a) confirmado pela descompilação. */
internal object AppMetricaImplActivateBFingerprint : Fingerprint(
    definingClass = "Lio/appmetrica/analytics/impl/p1;",
    name = "b",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Lio/appmetrica/analytics/AppMetricaConfig;"),
)

/** Sessões Blytics: envia onSessionClose para o analytics. */
internal object BlyticsSessionFingerprint : Fingerprint(
    definingClass = "Lcom/zipoapps/blytics/SessionManager;",
    name = "sendAnalytics",
    returnType = "Z",
    parameters = listOf("Lcom/zipoapps/blytics/SessionManager\$SessionData;"),
)
