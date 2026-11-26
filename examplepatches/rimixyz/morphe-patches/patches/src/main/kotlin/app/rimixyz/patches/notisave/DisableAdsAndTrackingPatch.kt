package app.rimixyz.patches.notisave

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.util.returnEarly
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_NOTISAVE

private const val ATTR_NAME = "android:name"
private const val ATTR_VALUE = "android:value"

private const val RETURN_VOID = "return-void"
// O R8 deste APK substitui kotlin.Unit por Za.C (confirmado: Lkotlin/Unit; não existe no DEX,
// enquanto LZa/C; existe e é o valor devolvido pelas funções suspend descompiladas).
private const val RETURN_UNIT = """
    sget-object v0, LZa/C;->INSTANCE:LZa/C;
    return-object v0
"""
/** sendAnalytics devolve true no ramo em que a config desativa a telemetria — same semantics. */
private const val RETURN_TRUE = """
    const/4 v0, 0x1
    return v0
"""
private const val RETURN_UNAVAILABLE_ADVERTISING_ID = """
    new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;
    const-string v1, "00000000-0000-0000-0000-000000000000"
    const/4 v2, 0x1
    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;-><init>(Ljava/lang/String;Z)V
    return-object v0
"""
// getInfo() tem apenas um registrador local. Na versão modificada, o método estático ignora Context.
private const val RETURN_ADVERTISING_ID_FROM_STATIC_METHOD = """
    const/4 v0, 0x0
    invoke-static {v0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;
    move-result-object v0
    return-object v0
"""
/** Componentes de auto-init de ad tracking removidos do manifesto (FCM é preservado). */
private val AUTO_INIT_COMPONENTS = setOf(
    "io.appmetrica.analytics.internal.PreloadInfoContentProvider",
    "io.appmetrica.analytics.internal.AppMetricaService",
    "com.facebook.ads.AudienceNetworkContentProvider",
    "com.applovin.sdk.AppLovinInitProvider",
    "com.google.android.gms.ads.MobileAdsInitProvider",
    "com.yandex.mobile.ads.core.initializer.MobileAdsInitializeProvider",
)

/** Metadados de privacidade: desligam Analytics/Crashlytics sem tocar no Firebase Messaging. */
private val PRIVACY_META_DATA = mapOf(
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_crashlytics_collection_enabled" to "false",
    "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
    "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
)

/** IDs publicitários e sinais de atribuição usados por MAX, Facebook e Singular. */
private val ADVERTISING_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
)

private fun Fingerprint.noOpVoid() {
    method.addInstructions(0, RETURN_VOID)
}

private fun Fingerprint.noOpSuspend() {
    method.addInstructions(0, RETURN_UNIT.trimIndent())
}

/**
 * Desativa anúncios e rastreamento do Notisave 274.1.3.2 em um único patch.
 *
 * ANÚNCIOS
 * A inicialização do AdManager é preservada de propósito: `h9.b.initializeAdSDK` publica o
 * estado que o splash aguarda e `access$initAppLovin` completa um Deferred usado pela cadeia
 * de config. No-op nesses pontos pode travar o splash. O corte é feito nos pontos de
 * carregamento/exibição, que é onde o anúncio de fato aparece:
 *  - m9.a.initialize: registro automático de intersticiais por lifecycle;
 *  - h9.q.access$loadAdInternal: load do banner custom (PhShimmerBannerAdView);
 *  - com.zipoapps.ads.banner.a.loadBanner: load do banner no manager (sobrecarga void);
 *  - m9.e.showInterstitialAd / s9.f.showRewardedAd: exibição de intersticial e recompensado;
 *  - p9.h.loadNativeAd (10 sobrecargas): nativos.
 *
 * RASTREAMENTO
 *  - com.zipoapps.premiumhelper.d.access$initAnalytics: configura userId e registra as
 *    plataformas Blytics; corta a cadeia inteira na origem;
 *  - fa.C$b.invokeSuspend: Singular.init(...) com a chave e o app instance id;
 *  - z9.a.initialize: FirebaseAnalytics.getInstance(...), mantendo FCM vivo;
 *  - AppMetrica: corta a ativação explícita e a ativação anônima do adaptador de biblioteca;
 *  - AdvertisingIdClient: desativa a conexão e devolve um ID zerado com rastreamento limitado;
 *  - com.zipoapps.premiumhelper.a.sendEvent/sendEventWithoutSession e Q6.r: eventos;
 *  - SessionManager.sendAnalytics: devolve true (ramo "telemetria desativada"), sem enviar evento;
 *  - manifesto: desativa Analytics/Crashlytics/Facebook e remove permissões de Advertising ID.
 *
 * Risco aceito: a perda do fluxo "assista ao anúncio para ganhar ad-free" e de parte da
 * telemetria de crash. FCM e o fluxo de compra real permanecem intactos.
 */
@Suppress("unused")
val disableAdsAndTrackingInNotisavePatch = patch(
    name = "Disable ads and tracking",
    description = "Blocks ads, disables Blytics, Singular, Firebase Analytics and AppMetrica activation, and prevents Advertising ID lookups.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NOTISAVE)

    execute {
        verifyNotisaveTarget()

        // --- anúncios -------------------------------------------------------
        // A init da AppLovin é preservada: access$initAppLovin completa um Deferred que o
        // splash aguarda. Cortar aqui trava a abertura (confirmado em dispositivo).
        AutoInterstitialInitFingerprint.noOpVoid()
        BannerViewLoadFingerprint.noOpVoid()
        BannerLoadFingerprint.noOpVoid()
        InterstitialShowFingerprint.noOpVoid()
        RewardedShowFingerprint.noOpVoid()
        nativeLoadSuspendFingerprints.forEach { it.noOpSuspend() }
        nativeLoadVoidFingerprints.forEach { it.noOpVoid() }

        // --- tracking -------------------------------------------------------
        InitAnalyticsFingerprint.noOpSuspend()
        SingularInitFingerprint.noOpSuspend()
        FirebaseAnalyticsInitFingerprint.noOpVoid()
        AdvertisingIdInfoFingerprint.method.addInstructions(0, RETURN_UNAVAILABLE_ADVERTISING_ID.trimIndent())
        AdvertisingIdInstanceInfoFingerprint.method.addInstructions(0, RETURN_ADVERTISING_ID_FROM_STATIC_METHOD.trimIndent())
        AdvertisingIdStartFingerprint.noOpVoid()
        AdvertisingIdDebugFingerprint.method.returnEarly(false)
        AppMetricaLibraryActivationFingerprint.noOpVoid()
        AppMetricaActivateFingerprint.noOpVoid()
        AppMetricaReporterFingerprint.noOpVoid()
        AppMetricaImplActivateFingerprint.noOpVoid()
        AppMetricaImplReporterFingerprint.noOpVoid()
        AppMetricaImplActivateBFingerprint.noOpVoid()
        // Não dar no-op no onCreate do provider nem do serviço da AppMetrica: ambos
        // inicializam estado (CountDownLatch/executor) usado por outras threads — travam o splash.
        sendEventFingerprints.forEach { it.noOpVoid() }
        appAnalyticsFingerprints.forEach { it.noOpVoid() }
        BlyticsSessionFingerprint.method.addInstructions(0, RETURN_TRUE.trimIndent())

        resourceXml("AndroidManifest.xml").use { manifest ->
            val applications = manifest.elements("application").toList()
            check(applications.size == 1) {
                "Disable ads and tracking: esperado 1 elemento application, encontrado ${applications.size}"
            }
            val application = applications.single()

            for ((key, value) in PRIVACY_META_DATA) {
                val existing = application.children("meta-data")
                    .filter { it.attribute(ATTR_NAME) == key }
                check(existing.size <= 1) {
                    "Disable ads and tracking: ${existing.size} metadados '$key' conflitantes"
                }
                if (existing.isEmpty()) {
                    application.appendChild("meta-data") {
                        setAttribute(ATTR_NAME, key)
                        setAttribute(ATTR_VALUE, value)
                    }
                } else {
                    existing.single().setAttribute(ATTR_VALUE, value)
                }
            }

            manifest.root.children("uses-permission")
                .filter { it.attribute(ATTR_NAME) in ADVERTISING_PERMISSIONS }
                .forEach { it.remove() }

            // Impede o auto-init de SDKs de anúncio e da AppMetrica no processo principal.
            (application.children("provider") + application.children("service"))
                .filter { it.attribute(ATTR_NAME) in AUTO_INIT_COMPONENTS }
                .forEach { it.remove() }
        }
    }
}
