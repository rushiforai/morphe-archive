package app.rimixyz.patches.mytherapy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * Fingerprints para MyTherapy 4.16.2 / versionCode 4016002 (eu.smartpatient.mytherapy).
 *
 * Todas as âncoras foram confirmadas nos DEX extraídos do base.apk analisado
 * (SHA-256 do bundle 953265d0c5b12b3cc40ac81765acd3c0123b13369b820940352cc865e8a855a2).
 * Nenhuma usa ordinal puro ou offset: combinam classe, assinatura e chamadas ou campos estáveis.
 */

private const val NATIVE_AD_MANAGER =
    "Leu/smartpatient/mytherapy/multiplatform/feature/appmonetization/infrastructure/nativead/NativeAdManager;"
private const val LOAD_BANNER_AD =
    "Leu/smartpatient/mytherapy/multiplatform/feature/appmonetization/presentation/usecase/AndroidLoadBannerAdUseCase;"
private const val AD_PLACEMENT =
    "Leu/smartpatient/mytherapy/multiplatform/feature/appmonetization/api/model/AdPlacement;"
private const val MOBILE_ADS_COMPANION =
    "Lcom/google/android/libraries/ads/mobile/sdk/MobileAds\$Companion;"
private const val NATIVE_AD_LOADER_COMPANION =
    "Lcom/google/android/libraries/ads/mobile/sdk/nativead/NativeAdLoader\$Companion;"
private const val AD_VIEW =
    "Lcom/google/android/libraries/ads/mobile/sdk/banner/AdView;"
private const val HAS_ANALYTICS_CONSENT =
    "Leu/smartpatient/mytherapy/multiplatform/feature/legalconsentsanddocuments/domain/usecase/HasAnalyticsConsentUseCaseImpl;"
private const val IS_CONSENT_STORED =
    "Leu/smartpatient/mytherapy/multiplatform/feature/legalconsentsanddocuments/api/usecase/IsConsentStoredUseCase;"
private const val IS_CONSENT_ACCEPTED =
    "Leu/smartpatient/mytherapy/multiplatform/feature/legalconsentsanddocuments/api/usecase/IsConsentAcceptedUseCase;"

/**
 * Consulta de consentimento de analytics. A string da chave legal e as duas interfaces do
 * repositório ancoram o método de forma única em classes3.dex.
 */
internal object HasAnalyticsConsentFingerprint : Fingerprint(
    definingClass = HAS_ANALYTICS_CONSENT,
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/Continuation;"),
    filters = listOf(
        string("LEGAL_CONSENT_HEALTH_DATA_ANALYTICS_MYTHERAPY"),
        methodCall(definingClass = IS_CONSENT_STORED, name = "invoke"),
        methodCall(definingClass = IS_CONSENT_ACCEPTED, name = "invoke"),
    ),
)

private const val START_APPSFLYER =
    "Leu/smartpatient/mytherapy/multiplatform/feature/attributiontracking/usecase/StartAppsFlyerSdkUseCase;"
private const val APPSFLYER_LIB = "Lcom/appsflyer/AppsFlyerLib;"

/**
 * Start explícito do AppsFlyer feito pelo app. As duas chamadas à API oficial (`stop` e `start`)
 * distinguem este caso de uso do `StopAppsFlyerSdkUseCase`, que só chama `stop`.
 */
internal object StartAppsFlyerFingerprint : Fingerprint(
    definingClass = START_APPSFLYER,
    name = "invoke",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = APPSFLYER_LIB, name = "stop"),
        methodCall(definingClass = APPSFLYER_LIB, name = "start"),
    ),
)

private const val GET_ADS_FREE_STATUS =
    "Leu/smartpatient/mytherapy/multiplatform/feature/appmonetization/infrastructure/usecase/GetAdsFreeProductPurchaseStatusUseCaseImpl;"
private const val PAYMENT_REPOSITORY_IMPL =
    "Leu/smartpatient/mytherapy/multiplatform/feature/appmonetization/infrastructure/repository/PaymentRepositoryImpl;"
private const val HAS_ONE_TIME_PAYMENT =
    "Leu/smartpatient/mytherapy/multiplatform/feature/appmonetization/infrastructure/usecase/HasUserMadeOneTimePaymentUseCaseImpl;"
private const val ADS_FREE_STATUS =
    "Leu/smartpatient/mytherapy/multiplatform/feature/appmonetization/api/model/AdsFreeProductPurchaseStatus;"
private const val FLOW_KT = "Lkotlinx/coroutines/flow/FlowKt;"
private const val BOXING = "Lkotlin/coroutines/jvm/internal/Boxing;"
private const val REFRESH_STATUS =
    "Leu/smartpatient/mytherapy/multiplatform/feature/appmonetization/api/usecase/RefreshAdsFreeProductPurchaseStatusUseCase;"

/** Produtor do status de compra ad-free consumido pelo árbitro de anúncios e pela UI. */
internal object GetAdsFreeStatusFingerprint : Fingerprint(
    definingClass = GET_ADS_FREE_STATUS,
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/Continuation;"),
    filters = listOf(
        methodCall(definingClass = REFRESH_STATUS, name = "invoke"),
        methodCall(definingClass = FLOW_KT, name = "flow"),
        methodCall(definingClass = FLOW_KT, name = "distinctUntilChanged"),
    ),
)

/** Fluxo de "assinatura ativa" do repositório de pagamentos (campo b). */
internal object HasActiveSubscriptionFlowFingerprint : Fingerprint(
    definingClass = PAYMENT_REPOSITORY_IMPL,
    name = "getHasActiveSubscription",
    returnType = "Lkotlinx/coroutines/flow/Flow;",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(definingClass = PAYMENT_REPOSITORY_IMPL, name = "b", type = "Lkotlinx/coroutines/flow/Flow;"),
    ),
)

/** Fluxo de "acesso vitalício" do repositório de pagamentos (campo c). */
internal object HasLifetimeAccessFlowFingerprint : Fingerprint(
    definingClass = PAYMENT_REPOSITORY_IMPL,
    name = "getHasLifetimeAccess",
    returnType = "Lkotlinx/coroutines/flow/Flow;",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(definingClass = PAYMENT_REPOSITORY_IMPL, name = "c", type = "Lkotlinx/coroutines/flow/Flow;"),
    ),
)

/** Leitura de "já fez pagamento único" a partir da data persistida. */
internal object HasOneTimePaymentFingerprint : Fingerprint(
    definingClass = HAS_ONE_TIME_PAYMENT,
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/Continuation;"),
    filters = listOf(
        methodCall(
            definingClass = "Leu/smartpatient/mytherapy/multiplatform/feature/appmonetization/infrastructure/settings/OneTimePaymentSettings;",
            name = "getLastPurchaseDate",
        ),
        methodCall(definingClass = BOXING, name = "boxBoolean"),
    ),
)

private const val PAIRIP_LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"

/**
 * Único ponto de entrada do PairIP no app: a Application declarada no manifesto chama
 * `checkLicense` em `attachBaseContext`. Não há outros chamadores fora do classes2.dex.
 */
internal object PairIpLicenseCheckFingerprint : Fingerprint(
    definingClass = PAIRIP_LICENSE_CLIENT,
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("LicenseClient"),
        methodCall(definingClass = PAIRIP_LICENSE_CLIENT, name = "isIsolatedProcess"),
        methodCall(
            definingClass = "Lcom/pairip/licensecheck/LicenseClient\$ImmediateTaskExecutor;",
            name = "run",
        ),
    ),
)

private const val SENTRY_INITIALIZER =
    "Leu/smartpatient/mytherapy/multiplatform/feature/monitoring/AndroidSentryInitializer;"
private const val SENTRY_CONFIGURATION =
    "Leu/smartpatient/mytherapy/multiplatform/feature/monitoring/SentryConfiguration;"
private const val SENTRY_API =
    "Leu/smartpatient/mytherapy/multiplatform/feature/monitoring/SentryApi;"

/**
 * Ponto único de inicialização do Sentry no app. O método testa `SentryConfiguration.getEnabled()`
 * e chama `SentryApi.initWithPlatformOptions`. A configuração de tracing/replay feita em `a(...)`
 * fica fora deste alvo.
 */
internal object SentryInitializeFingerprint : Fingerprint(
    definingClass = SENTRY_INITIALIZER,
    name = "initialize",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = SENTRY_CONFIGURATION, name = "getEnabled"),
        methodCall(definingClass = SENTRY_API, name = "initWithPlatformOptions"),
    ),
)

/**
 * Carga de anúncio nativo. O corpo chama `MobileAds.isInitialized()`, consulta o cache interno e
 * termina em `NativeAdLoader.load`. O `clear()` (destruição dos objetos) fica fora deste alvo.
 */
internal object NativeAdRequestFingerprint : Fingerprint(
    definingClass = NATIVE_AD_MANAGER,
    name = "request",
    returnType = "Ljava/lang/Object;",
    parameters = listOf(AD_PLACEMENT, "Lkotlin/coroutines/Continuation;"),
    filters = listOf(
        methodCall(definingClass = MOBILE_ADS_COMPANION, name = "isInitialized"),
        fieldAccess(definingClass = NATIVE_AD_MANAGER, name = "f", type = "Ljava/util/Map;"),
        methodCall(definingClass = NATIVE_AD_LOADER_COMPANION, name = "load"),
    ),
)

/**
 * Carga de banner programático. A assinatura com `AdView` e `AdLoadCallback` distingue este
 * caminho do caso de uso de intersticial e de recompensado.
 */
internal object BannerLoadFingerprint : Fingerprint(
    definingClass = LOAD_BANNER_AD,
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        AD_VIEW,
        AD_PLACEMENT,
        "Lcom/google/android/libraries/ads/mobile/sdk/banner/AdSize;",
        "Lcom/google/android/libraries/ads/mobile/sdk/common/AdLoadCallback;",
        "Lkotlin/coroutines/Continuation;",
    ),
    filters = listOf(
        methodCall(definingClass = AD_VIEW, name = "loadAd"),
    ),
)
