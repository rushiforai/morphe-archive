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

private const val SHOULD_SHOW_ADS =
    "Leu/smartpatient/mytherapy/multiplatform/feature/appmonetization/infrastructure/usecase/ShouldShowAdsUseCaseImpl;"
private const val ARE_ADS_ENABLED =
    "Leu/smartpatient/mytherapy/multiplatform/feature/appmonetization/api/usecase/AreAdsEnabledUseCase;"
private const val GET_ADS_FREE_API =
    "Leu/smartpatient/mytherapy/multiplatform/feature/appmonetization/api/usecase/GetAdsFreeProductPurchaseStatusUseCase;"
private const val INIT_MOBILE_ADS =
    "Leu/smartpatient/mytherapy/multiplatform/feature/appmonetization/infrastructure/usecase/InitMobileAdsUseCaseImpl;"
private const val UPDATE_ADS_CONSENT =
    "Leu/smartpatient/mytherapy/multiplatform/feature/appmonetization/infrastructure/usecase/UpdateAdsConsentInfoUseCaseImpl;"
private const val INTERSTITIAL_AD_MANAGER =
    "Leu/smartpatient/mytherapy/multiplatform/feature/appmonetization/infrastructure/interstatial/AndroidInterstitialAdManagerImpl;"
private const val REWARDED_AD_MANAGER =
    "Leu/smartpatient/mytherapy/multiplatform/feature/appmonetization/infrastructure/rewarder/RewardedAdManagerImpl;"
private const val SESSION_SCOPE =
    "Leu/smartpatient/mytherapy/multiplatform/lib/core/async/SessionScope;"

/** Árbitro central de exibição de anúncios consumido pela UI (banners, nativos, intersticial e recompensado). */
internal object ShouldShowAdsFingerprint : Fingerprint(
    definingClass = SHOULD_SHOW_ADS,
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/Continuation;"),
    filters = listOf(
        methodCall(definingClass = ARE_ADS_ENABLED, name = "invoke"),
        methodCall(definingClass = GET_ADS_FREE_API, name = "invoke"),
    ),
)

/** Ponto único de inicialização do Google Mobile Ads SDK e adaptadores de mediação. */
internal object InitMobileAdsFingerprint : Fingerprint(
    definingClass = INIT_MOBILE_ADS,
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/Continuation;"),
    filters = listOf(
        fieldAccess(
            definingClass = INIT_MOBILE_ADS,
            name = "g",
            type = "Ljava/util/concurrent/atomic/AtomicBoolean;",
        ),
        methodCall(definingClass = "Ljava/util/concurrent/atomic/AtomicBoolean;", name = "getAndSet"),
    ),
)

/** Atualização de consentimento publicitário via Google UMP. */
internal object UpdateAdsConsentInfoFingerprint : Fingerprint(
    definingClass = UPDATE_ADS_CONSENT,
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Landroid/app/Activity;", "Lkotlin/coroutines/Continuation;"),
    filters = listOf(
        methodCall(definingClass = "Lcom/google/android/ump/UserMessagingPlatform;", name = "getConsentInformation"),
        methodCall(definingClass = "Lcom/google/android/ump/ConsentInformation;", name = "requestConsentInfoUpdate"),
    ),
)

/** Carga de anúncios intersticiais (tela cheia). */
internal object InterstitialAdRequestFingerprint : Fingerprint(
    definingClass = INTERSTITIAL_AD_MANAGER,
    name = "request",
    returnType = "V",
    parameters = listOf(AD_PLACEMENT),
    filters = listOf(
        fieldAccess(definingClass = INTERSTITIAL_AD_MANAGER, name = "e", type = "Ljava/util/Map;"),
        methodCall(definingClass = SESSION_SCOPE, name = "launch\$default"),
    ),
)

/** Carga de anúncios recompensados. */
internal object RewardedAdRequestFingerprint : Fingerprint(
    definingClass = REWARDED_AD_MANAGER,
    name = "request",
    returnType = "V",
    parameters = listOf(AD_PLACEMENT),
    filters = listOf(
        fieldAccess(definingClass = REWARDED_AD_MANAGER, name = "e", type = "Ljava/util/Map;"),
        methodCall(definingClass = SESSION_SCOPE, name = "launch\$default"),
    ),
)

private const val MY_APPLICATION = "Leu/smartpatient/mytherapy/MyApplication;"
private const val INITIALIZE_CLEVERTAP = "Leu/smartpatient/mytherapy/pushcampaign/InitializeCleverTapKt;"
private const val ANDROID_ENTRY_POINT_KT =
    "Leu/smartpatient/mytherapy/multiplatform/umbrella/AndroidEntryPointKt;"
private const val RUN_APP_INITIALIZERS =
    "Leu/smartpatient/mytherapy/multiplatform/lib/lifecycle/RunAppInitializersUseCase;"
private const val GET_SETTINGS_ITEMS =
    "Leu/smartpatient/mytherapy/multiplatform/feature/settingssectionmanagement/usecase/GetSettingsItemsUseCase;"
private const val ROOT_ACTIVITY =
    "Leu/smartpatient/mytherapy/multiplatform/feature/root/RootActivity;"
private const val BASE_ACTIVITY =
    "Leu/smartpatient/mytherapy/multiplatform/feature/presentation/BaseActivity;"
private const val REFRESH_REMINDERS_FACTORY =
    "Leu/smartpatient/mytherapy/multiplatform/feature/dailytodolist/domain/usecase/RefreshRemindersUseCaseImpl\$MetroFactory;"
private const val METRO_PROVIDER = "Ldev/zacsweers/metro/Provider;"
private const val USER_SESSION_INITIALIZER =
    "Leu/smartpatient/mytherapy/multiplatform/feature/account/infrastructure/UserSessionInitializer;"
private const val IS_USER_LOGGED_IN =
    "Leu/smartpatient/mytherapy/multiplatform/feature/account/api/usecase/IsUserLoggedInUseCase;"
private const val USER_SESSION =
    "Leu/smartpatient/mytherapy/multiplatform/lib/lifecycle/UserSession;"

/**
 * Entrada da Application antes da criação do grafo Metro e da abertura dos bancos Room3.
 * Usada para aplicar restaurações a frio, importações de CSV e rollbacks pendentes.
 */
internal object MyApplicationOnCreateFingerprint : Fingerprint(
    definingClass = MY_APPLICATION,
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = INITIALIZE_CLEVERTAP, name = "initializeCleverTap"),
        methodCall(definingClass = ANDROID_ENTRY_POINT_KT, name = "createAndroidEntryPoint"),
        methodCall(definingClass = RUN_APP_INITIALIZERS, name = "invoke"),
    ),
)

/**
 * Construtor do agregador de itens de Configurações. O conjunto injetado pelo Metro é estendido
 * com o provider de "Backup e Restauração Local".
 */
internal object GetSettingsItemsInitFingerprint : Fingerprint(
    definingClass = GET_SETTINGS_ITEMS,
    name = "<init>",
    returnType = "V",
    parameters = listOf("Ljava/util/Set;"),
    filters = listOf(
        fieldAccess(definingClass = GET_SETTINGS_ITEMS, name = "a", type = "Ljava/util/Set;"),
    ),
)

/**
 * Activity principal do app. Logo após super.onCreate(Bundle), registramos os launchers SAF
 * (ACTION_CREATE_DOCUMENT / ACTION_OPEN_DOCUMENT) no ActivityResultRegistry.
 */
internal object RootActivityOnCreateFingerprint : Fingerprint(
    definingClass = ROOT_ACTIVITY,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        methodCall(
            definingClass = "Landroidx/core/splashscreen/SplashScreen\$Companion;",
            name = "installSplashScreen",
        ),
        methodCall(definingClass = BASE_ACTIVITY, name = "onCreate"),
        methodCall(definingClass = BASE_ACTIVITY, name = "setMyTherapyContent\$default"),
    ),
)

/**
 * Fábrica Metro do RefreshRemindersUseCaseImpl, sempre construída em AndroidEntryPoint$Impl.<init>.
 * Permite disparar o recálculo de lembretes após restauração ou importação de CSV.
 */
internal object RefreshRemindersFactoryInitFingerprint : Fingerprint(
    definingClass = REFRESH_REMINDERS_FACTORY,
    name = "<init>",
    returnType = "V",
    parameters = listOf(METRO_PROVIDER, METRO_PROVIDER, METRO_PROVIDER, METRO_PROVIDER),
    filters = listOf(
        fieldAccess(definingClass = REFRESH_REMINDERS_FACTORY, name = "b", type = METRO_PROVIDER),
        fieldAccess(definingClass = REFRESH_REMINDERS_FACTORY, name = "e", type = METRO_PROVIDER),
    ),
)

/**
 * Inicializador de sessão de usuário. O retorno bem-sucedido após UserSession.onUserSessionStart
 * sinaliza o momento seguro para reconstruir alarmes/notificações locais.
 */
internal object UserSessionInitializerFingerprint : Fingerprint(
    definingClass = USER_SESSION_INITIALIZER,
    name = "initialize",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/Continuation;"),
    filters = listOf(
        methodCall(definingClass = IS_USER_LOGGED_IN, name = "invoke"),
        methodCall(definingClass = USER_SESSION, name = "onUserSessionStart"),
    ),
)
