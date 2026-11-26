package app.rimixyz.patches.xrecorder

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/*
 * Fingerprints ancoradas no base.apk de XRecorder 2.5.6.1 (versionCode 2561002,
 * SHA-256 bbbefb52804ba7a16d8c5508ef5b99dc2130cfd899f374867eed8ff5e3eef1b7).
 * O app e ofuscado com R8: os nomes defpackage.* sao especificos desta versao.
 * Por isso cada fingerprint usa definingClass + assinatura exata e, quando possivel,
 * uma string ou chamada estavel como filtro adicional.
 */

private const val PREFS_HELPER = "Lw45;"
private const val APP_GATE = "Lcom/inshot/screenrecorder/application/a;"
private const val APP_OPEN = "Lle;"
private const val ADMOB_APP_OPEN = "Lqe;"
private const val ANALYTICS = "Ln12;"
private const val EVENT_BRIDGE = "Lx8;"

/** Chave mestra do estado premium, gravada em PreferenceManager.getDefaultSharedPreferences. */
internal const val PREMIUM_KEY = "kmgJSgyY"

/**
 * Getter generico de boolean do SharedPreferences.
 * Corpo: PreferenceManager.getDefaultSharedPreferences(b.m()).getBoolean(str, z).
 * O patch condiciona o retorno true somente a [PREMIUM_KEY], preservando as outras chaves.
 */
internal object PremiumPrefFingerprint : Fingerprint(
    definingClass = PREFS_HELPER,
    name = "b",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "Z"),
    // definingClass + assinatura sao unicos; filtros de methodCall foram
    // removidos porque nao casavam com a forma compilada do metodo.
)

/**
 * Arbitro central: bytecode observado (classes.dex, code_off=1363684):
 *   const-string v0, "kmgJSgyY"
 *   const/4 v1, 0x0
 *   invoke-static {v0, v1}, Lw45;->b(String,Z)Z
 *   move-result v0
 *   return v0
 */
/**
 * Lancador central do paywall. Nao verifica pro: apenas escolhe a variante
 * (ProOfferDetail, ProDetailWeekly, ProDetail) e abre a activity. Neutralizar
 * aqui impede que o clique numa feature pro abra a tela de venda.
 */
/**
 * Gate PRO central das features: `hu2.A().z().d()`.
 * Chamado por dezenas de pontos (bola invisivel, qualidades 2K/4K/48Mbps,
 * editor, resultado de gravacao, voice changer). Sem forcar este getter,
 * a flag global nao libera as funcoes individualmente.
 */
internal object IabFeatureGateFingerprint : Fingerprint(
    definingClass = "Lhu2\$e;",
    name = "d",
    returnType = "Z",
    parameters = emptyList(),
)

/** Estado PRO do IABManager (hu2), consumido por editores e pela UI de Definicoes. */
internal object IabProStateFingerprint : Fingerprint(
    definingClass = "Lhu2;",
    name = "T",
    returnType = "Z",
    parameters = emptyList(),
)

internal object PaywallLaunchFingerprint : Fingerprint(
    definingClass = "Lcom/inshot/screenrecorder/activities/ProDetailActivity;",
    name = "N9",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "I"),
)

internal object PremiumGetterFingerprint : Fingerprint(
    definingClass = APP_GATE,
    name = "a",
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        string(PREMIUM_KEY),
        methodCall(definingClass = PREFS_HELPER, name = "b", returnType = "Z"),
    ),
)

/**
 * Inicializacao dos dois backends de anuncios (AdMob "SHOT" via t5.g e
 * AppLovin MAX "SIGMA" via AdCool.f).
 *
 * Nao usar o chamador com.inshot.screenrecorder.application.a.d: ele tambem
 * inicializa Remote Config e outras dependencias do splash. Cortar so u5.d
 * preserva essa inicializacao.
 */
internal object AdInitFingerprint : Fingerprint(
    definingClass = "Lu5;",
    name = "d",
    returnType = "V",
    parameters = listOf(
        "Landroid/app/Application;",
        "Ljava/lang/String;",
        "Lnx2;",
        "Lpx2;",
        "Lqu2;",
        "Lew2;",
        "Lcf0;",
        "Ljava/lang/String;",
    ),
)

/** App-open: decide entre ke (AdMob) e AppOpenAd (AppLovin). */
internal object AppOpenShowFingerprint : Fingerprint(
    definingClass = APP_OPEN,
    name = "c",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "Lts4;"),
)

/** Segundo ponto de app-open, com posicao/fallback. */
internal object AppOpenByPositionFingerprint : Fingerprint(
    definingClass = APP_OPEN,
    name = "b",
    returnType = "V",
    parameters = listOf("Ljava/lang/Class;", "Lf6;"),
)

/** Load do AppOpenAd da AdMob: AppOpenAd.b(context, unitId, AdRequest, callback). */
internal object AppOpenLoadFingerprint : Fingerprint(
    definingClass = ADMOB_APP_OPEN,
    name = "h",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Lte;"),
    filters = listOf(
        methodCall(definingClass = "Lcom/google/android/gms/ads/appopen/AppOpenAd;", name = "b"),
    ),
)

/** Exibicao do AppOpenAd da AdMob. */
internal object AppOpenDisplayFingerprint : Fingerprint(
    definingClass = ADMOB_APP_OPEN,
    name = "i",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "Lss4;"),
)

/** setUserProperty("userSample", ...) + FirebaseAnalytics.c(bundle), na inicializacao. */
internal object AnalyticsInitFingerprint : Fingerprint(
    definingClass = ANALYTICS,
    name = "j",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("userSample"),
        methodCall(definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;", name = "c"),
    ),
)

/** logEvent(String, String) -> Bundle(content_type) -> FirebaseAnalytics.b. */
internal object AnalyticsEventFingerprint : Fingerprint(
    definingClass = ANALYTICS,
    name = "n",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    filters = listOf(
        string("content_type"),
        methodCall(definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;", name = "b", returnType = "V"),
    ),
)

/** logEvent(String, Bundle, boolean), usado pelo IAnalytics entregue ao SDK de ads. */
internal object AnalyticsBundleEventFingerprint : Fingerprint(
    definingClass = ANALYTICS,
    name = "m",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/os/Bundle;", "Z"),
    filters = listOf(
        methodCall(definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;", name = "b", returnType = "V"),
    ),
)

/** Crashlytics.recordException(Throwable), unico sink usado por x8.f. */
internal object CrashlyticsFingerprint : Fingerprint(
    definingClass = EVENT_BRIDGE,
    name = "f",
    returnType = "V",
    parameters = listOf("Ljava/lang/Throwable;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
            name = "recordException",
        ),
    ),
)

/** Firebase Remote Config: cache rcgap=3600, fetch e leitura de AdCfg25/ServerDomain. */
internal object RemoteConfigFetchFingerprint : Fingerprint(
    definingClass = ANALYTICS,
    name = "k",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(string("rcgap")),
)

internal object RemoteConfigDomainFingerprint : Fingerprint(
    definingClass = ANALYTICS,
    name = "p",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(string("ServerDomain")),
)
