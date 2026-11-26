package app.rimixyz.patches.autoclicker

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

private const val PREFS_HELPER = "Lo2/g;"
private const val PREMIUM_KEY = "paid_premium_upgrade"
private const val FIREBASE_ANALYTICS = "Lcom/google/firebase/analytics/FirebaseAnalytics;"
private const val MOBILE_ADS = "Lcom/google/android/gms/ads/MobileAds;"
private const val INTERSTITIAL_AD = "Lcom/google/android/gms/ads/interstitial/InterstitialAd;"

/**
 * Árbitro único do estado pago. `r2.f.a` lê
 * `o2.g.b(context).a("paid_premium_upgrade", false)`, grava o resultado no campo
 * estático `r2.f.f29148a` e devolve o boolean. É chamado apenas por
 * `MainActivity.onCreate`; o campo estático é lido por `MainActivity.onResume`
 * e por `p2.c.onCreate` (gate do intersticial).
 */
internal object PremiumFlagFingerprint : Fingerprint(
    definingClass = "Lr2/f;",
    name = "a",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    isStatic = true,
    filters = listOf(
        string(PREMIUM_KEY),
        methodCall(definingClass = PREFS_HELPER, name = "a", returnType = "Z"),
    ),
)

/**
 * Carregamento do banner. Cria um `AdView`, aplica o ad unit do Remote Config
 * (ou `R.string.adaptive_banner_ad_id`) e chama `loadAd`.
 */
internal object BannerLoadFingerprint : Fingerprint(
    definingClass = "Lq2/a;",
    name = "e",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "Lcom/google/firebase/remoteconfig/a;"),
    isStatic = true,
    // `loadAd` é herdado de BaseAdView no SDK, então não é usado como filtro.
    filters = listOf(
        string("adaptive_banner_ad_id"),
    ),
)

/**
 * Cooldown do intersticial. `p2.c.onCreate` só cria o helper `q2.b` quando
 * `q2.b.j()` é verdadeiro; forçar `false` impede inclusive a criação do objeto.
 */
internal object InterstitialCooldownFingerprint : Fingerprint(
    definingClass = "Lq2/b;",
    name = "j",
    returnType = "Z",
    parameters = emptyList(),
    isStatic = true,
    filters = listOf(
        methodCall(definingClass = "Ljava/lang/System;", name = "currentTimeMillis"),
    ),
)

/**
 * Exibição do intersticial no `onBackPressed` de `p2.c`. Neutralizada como
 * defesa adicional: sem ela, um helper já alocado poderia mostrar anúncio.
 */
internal object InterstitialShowFingerprint : Fingerprint(
    definingClass = "Lq2/b;",
    name = "l",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
    filters = listOf(
        methodCall(definingClass = INTERSTITIAL_AD, name = "show"),
    ),
)

/** `MobileAds.initialize(this)` no `SplashActivity.onCreate`. */
internal object MobileAdsInitFingerprint : Fingerprint(
    definingClass = "Lcom/truedevelopersstudio/autoclicker/activities/SplashActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        methodCall(definingClass = MOBILE_ADS, name = "initialize"),
        methodCall(definingClass = "Landroid/os/Handler;", name = "postDelayed"),
    ),
)

/** `FirebaseCrashlytics.log` por trás de `s2.e.a(String)`. */
internal object CrashlyticsLogFingerprint : Fingerprint(
    definingClass = "Ls2/e;",
    name = "a",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    isStatic = true,
)

/** `FirebaseCrashlytics.recordException` por trás de `s2.e.c(Exception)`. */
internal object CrashlyticsRecordFingerprint : Fingerprint(
    definingClass = "Ls2/e;",
    name = "c",
    returnType = "V",
    parameters = listOf("Ljava/lang/Exception;"),
    isStatic = true,
)

internal val ANALYTICS_EVENT_OWNER = "Lcom/truedevelopersstudio/autoclicker/"
internal val ANALYTICS_EVENT_METHOD = FIREBASE_ANALYTICS
