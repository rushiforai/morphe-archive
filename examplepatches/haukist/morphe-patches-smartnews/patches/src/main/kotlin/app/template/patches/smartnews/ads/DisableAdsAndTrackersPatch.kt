package app.template.patches.smartnews.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_SMARTNEWS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val SENTRY_BLOCKER_TYPE = "Lapp/template/extension/smartnews/SentryRequestBlocker;"

@Suppress("unused")
val disableAdsAndTrackersPatch = bytecodePatch(
    name = "Disable ads and trackers",
    description = "Disables first-party and third-party advertisements, analytics, and tracking SDKs in SmartNews.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SMARTNEWS)
    extendWith("extensions/extension.mpe")

    execute {
        // Opt-in diagnostics only: enable the local WebView DevTools socket.
        if (System.getProperty("smartnews.sentryDiagnostics") == "true") {
            val initialize = WebViewWrapperInitializeDiagnosticsFingerprint.method
            require((initialize.implementation?.registerCount ?: 0) >= 2) {
                "WebViewWrapper.k must have a local register for diagnostics"
            }
            initialize.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    invoke-static {v0}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V
                    invoke-static/range {p0 .. p0}, Lapp/template/extension/smartnews/WebViewDiagnostics;->logClients(Landroid/view/View;)V
                """
            )
        }

        // ====================================================================
        // 1. SmartNews First-Party Ad & Remote Config Flags
        // ====================================================================
        listOf(
            AdNetworkInterstitialConfigFingerprint,
            ChannelViewAdNetworkSettingFingerprint,
            GamPlacementsConfigFingerprint,
            SmartViewStickyBannerAdConfigFingerprint,
            SmartViewHybridNativeAdConfigFingerprint,
            DeliveryItemGetHeaderAdFingerprint,
            PremiumAd3pClientConditionFingerprint,
            FeedAdSlotAllocatorLambdaFingerprint,
            AdsClientConditionFingerprint,
            AdRequestHeadersFingerprint,
            GetAdvertisingIdFingerprint,
            ProvideIpv6LifecycleListenerFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.returnEarly(null)
        }

        listOf(
            IsAdsInsertionEnabledFingerprint,
            ConfiantEnabledFingerprint,
            IsOtelForAdsEnabledFingerprint,
            DeliveryIsAdEnabledFingerprint,
            DeliveryItemHasHeaderAdFingerprint,
            ShouldInsertDeliveryItemAdsFingerprint,
            AdUidTokenEnabledFingerprint,
            BrazeConfigEnabledFingerprint,
            BrazeConfigPushEnabledFingerprint,
            BrazeConfigInAppMessageEnabledFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.returnEarly(false)
        }

        // Force LimitAdTracking to true so no Advertising ID is collected or sent.
        IsLimitAdTrackingEnabledFingerprint.method.returnEarly(true)

        // Force empty JSON payload for ad requests.
        AdRequestJsonPayloadFingerprint.method.returnEarly("{}")

        // Force Weather ads config `isEnabled` parameter (p2) to false in constructor.
        AdsInWeatherConfigConstructorFingerprint.method.addInstruction(0, "const/4 p2, 0x0")

        listOf(
            SmartViewAllocateAdFingerprint,
            SmartViewPrefetchAdsFingerprint,
            SmartViewRelocateAdFingerprint,
            SmartViewSend1PAdObjectFingerprint,
        ).forEach { fingerprint ->
            fingerprint.matchAll().forEach { match ->
                if (match.method.implementation != null) {
                    match.method.returnEarly()
                }
            }
        }

        listOf(
            PrivateMarketplaceAdManagerFingerprint,
            FullScreenAdRepositoryLoadFingerprint,
            PremiumAd3pManagerLoadFingerprint,
            GamInitializationHelperFingerprint,
            AdBeaconSendFingerprint,
            AdBeaconAsyncSendFingerprint,
            AdUidTokenRefreshFingerprint,
            ActionTrackerFlushFingerprint,
            ActionTrackerRecordDetailedFingerprint,
            ActionTrackerRecordFingerprint,
            AdActionTrackerHelperFingerprint,
            SmartNewsAdjustTrackerFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.returnEarly()
        }

        // ====================================================================
        // 2. Third-Party Ad & Tracker SDKs (14 Detected SDKs + Verification)
        // ====================================================================

        // (1) Adjust
        listOf(
            AdjustOnCreateFingerprint,
            AdjustTrackEventFingerprint,
            AdjustTrackAdRevenueFingerprint,
            AdjustTrackAdRevenueJsonFingerprint,
            AdjustTrackPlayStoreSubscriptionFingerprint,
            AdjustTrackThirdPartySharingFingerprint,
            AdjustOnResumeFingerprint,
            AdjustSetEnabledFingerprint,
            AdjustInstanceOnCreateFingerprint,
            AdjustInstanceTrackEventFingerprint,
        ).forEach { it.method.returnEarly() }

        listOf(
            AdjustIsEnabledFingerprint,
            AdjustInstanceIsEnabledFingerprint,
        ).forEach { it.method.returnEarly(false) }

        listOf(
            AdjustGetAdidFingerprint,
            AdjustGetAttributionFingerprint,
        ).forEach { it.method.returnEarly(null) }

        // (2) Amazon Advertisement (TAM / APS)
        listOf(
            AmazonTamBridgeBannerFingerprint,
            AmazonTamBridgeVideoFingerprint,
        ).forEach { it.method.returnEarly(null) }

        listOf(
            AmazonAdRegistrationIsInitializedFingerprint,
            AmazonApsIsInitializedFingerprint,
            AmazonDtbDeviceRegistrationRegisterConfigFingerprint,
        ).forEach { it.method.returnEarly(false) }

        listOf(
            AmazonDtbAdRequestLoadAdFingerprint,
            AmazonDtbAdRequestInternalLoadAdFingerprint,
            AmazonApsInitializeFingerprint,
            AmazonApsInitializeWithConfigFingerprint,
            AmazonApsAdRequestLoadAdFingerprint,
            AmazonDtbDeviceRegistrationInitializeAdsFingerprint,
            AmazonDtbDeviceRegistrationVerifyRegistrationFingerprint,
            AmazonDtbDeviceRegistrationPingSisFingerprint,
            AmazonDtbMetricsSubmitterSubmitMetricsFingerprint,
            AmazonDtbMetricsSubmitterSubmitMetricsWithArgFingerprint,
            AmazonDtbHttpClientExecuteGetFingerprint,
            AmazonDtbHttpClientExecutePostFingerprint,
        ).forEach { it.method.returnEarly() }

        // (3) Facebook Ads (Audience Network)
        FacebookAudienceNetworkInitializeFingerprint.method.returnEarly()
        FacebookAudienceNetworkIsInitializedFingerprint.method.returnEarly(false)

        // (4) Facebook Analytics (FacebookSdk & AppEvents)
        listOf(
            FacebookSdkInitializeFingerprint,
            FacebookSdkInitializeCallbackFingerprint,
            FacebookAppEventsActivateAppFingerprint,
            FacebookAppEventsActivateAppWithIdFingerprint,
            FacebookAppEventsLogEventFingerprint,
            FacebookAppEventsLogEventBundleFingerprint,
            FacebookAppEventsImplLogEventFingerprint,
            FacebookAppEventsImplActivateAppFingerprint,
        ).forEach { it.method.returnEarly() }

        listOf(
            FacebookSdkIsInitializedFingerprint,
            FacebookSdkGetAutoInitEnabledFingerprint,
            FacebookSdkGetAutoLogAppEventsEnabledFingerprint,
            FacebookSdkGetAdvertiserIDCollectionEnabledFingerprint,
        ).forEach { it.method.returnEarly(false) }

        // (5) Facebook Login
        listOf(
            FacebookLoginStartLoginFingerprint,
            FacebookLoginLogStartLoginFingerprint,
            FacebookLoginLogCompleteLoginFingerprint,
        ).forEach { it.method.returnEarly() }
        FacebookLoginResolveIntentFingerprint.method.returnEarly(false)

        // (6) Facebook Share
        listOf(
            FacebookShareCanShowClassFingerprint,
            FacebookShareCanShowModeFingerprint,
        ).forEach { it.method.returnEarly(false) }

        listOf(
            FacebookShareShowFingerprint,
            FacebookShareLogDialogShareFingerprint,
        ).forEach { it.method.returnEarly() }

        // (7) Google AdMob / Google Ad Manager (GAM)
        listOf(
            GoogleMobileAdsInitFingerprint,
            GoogleMobileAdsInitListenerFingerprint,
            GoogleAdLoaderLoadAdFingerprint,
            GoogleAdLoaderLoadGamAdFingerprint,
            GoogleAdLoaderLoadAdsFingerprint,
            GoogleBaseAdViewLoadAdFingerprint,
            GoogleAdManagerAdViewLoadAdFingerprint,
            GoogleAdManagerInterstitialLoadFingerprint,
            GoogleInterstitialAdLoadFingerprint,
            GoogleRewardedAdLoadFingerprint,
            GoogleRewardedGamAdLoadFingerprint,
        ).forEach { it.method.returnEarly() }

        // (8) Google Crashlytics
        listOf(
            CrashlyticsRecordExceptionFingerprint,
            CrashlyticsLogFingerprint,
            CrashlyticsSendUnsentReportsFingerprint,
            CrashlyticsSetEnabledBoolFingerprint,
            CrashlyticsSetEnabledBoxedFingerprint,
            CrashlyticsCoreLogExceptionFingerprint,
            CrashlyticsCoreLogFatalExceptionFingerprint,
            CrashlyticsCoreLogFingerprint,
            CrashlyticsCoreDoBackgroundInitFingerprint,
        ).forEach { it.method.returnEarly() }
        CrashlyticsIsEnabledFingerprint.method.returnEarly(false)

        // (9) Google Firebase Analytics
        listOf(
            FirebaseAnalyticsLogEventFingerprint,
            FirebaseAnalyticsSetUserIdFingerprint,
            FirebaseAnalyticsSetUserPropertyFingerprint,
            FirebaseAnalyticsSetCurrentScreenFingerprint,
            FirebaseAnalyticsSetEnabledFingerprint,
            FirebaseAnalyticsSetDefaultParamsFingerprint,
        ).forEach { it.method.returnEarly() }

        // (10) IAB Open Measurement (OMSDK across all 8 bundled vendors)
        OmidActivateFingerprint.matchAll().forEach { match ->
            match.method.returnEarly()
        }
        OmidIsActiveFingerprint.matchAll().forEach { match ->
            match.method.returnEarly(false)
        }
        OmidAdSessionStartFingerprint.matchAll().forEach { match ->
            match.method.returnEarly()
        }
        OmidAdSessionRegisterAdViewFingerprint.matchAll().forEach { match ->
            match.method.returnEarly()
        }

        // (11) InMobi
        listOf(
            InMobiSdkInitFingerprint,
            InMobiBannerLoadFingerprint,
            InMobiBannerLoadContextFingerprint,
            InMobiBannerLoadBytesFingerprint,
            InMobiInterstitialLoadFingerprint,
            InMobiInterstitialLoadBytesFingerprint,
            InMobiInterstitialShowFingerprint,
            InMobiNativeLoadFingerprint,
            InMobiNativeLoadBytesFingerprint,
        ).forEach { it.method.returnEarly() }
        InMobiSdkIsInitializedFingerprint.method.returnEarly(false)
        InMobiSdkGetTokenFingerprint.method.returnEarly(null)

        // (12) OpenTelemetry (OpenCensus / OpenTracing)
        // Return SmartNews's built-in No-Op OpenTelemetryProvider (`jsb`) instead of initializing OTel SDK.
        ProvideOpenTelemetryProviderFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Ljsb;
                invoke-direct {v0}, Ljsb;-><init>()V
                return-object v0
            """
        )
        OtelNetworkInstrumentationEnabledFingerprint.method.returnEarly(false)
        OtelBatchSpanProcessorOfferFingerprint.method.returnEarly()

        // (13) Pangle (ByteDance OpenAdSDK)
        listOf(
            PanglePagSdkInitFingerprint,
            PanglePagSdkGetBiddingTokenCallbackFingerprint,
            PanglePagSdkGetBiddingTokenBidCallbackFingerprint,
            PangleBannerLoadAdFingerprint,
            PangleInterstitialLoadAdFingerprint,
            PangleNativeLoadAdFingerprint,
            PangleAppOpenLoadAdFingerprint,
            PangleRewardedLoadAdFingerprint,
        ).forEach { it.method.returnEarly() }
        PanglePagSdkIsInitSuccessFingerprint.method.returnEarly(false)

        // (14) Prebid Mobile
        listOf(
            PrebidMobileInitializeSdkFingerprint,
            PrebidAdUnitFetchDemandResultFingerprint,
            PrebidAdUnitFetchDemandCompleteFingerprint,
        ).forEach { it.method.returnEarly() }
        PrebidMobileIsSdkInitializedFingerprint.method.returnEarly(false)

        listOf(
            PrebidBridgeInitFingerprint,
            PrebidBridgeBannerDemandFingerprint,
            PrebidBridgeNativeDemandFingerprint,
        ).forEach { it.method.returnEarly(null) }

        // (15) Confiant & AppHarbr Ad Verification
        listOf(
            ConfiantInitializeFingerprint,
            AppHarbrInitializeConfigFingerprint,
            AppHarbrInitializeKeyFingerprint,
        ).forEach { it.method.returnEarly() }
        AppHarbrIsInitializedFingerprint.method.returnEarly(false)

        // (16) SmartNews 1P Ad Object Creation & Unified Feed Ad Insertion
        listOf(
            AdImplCompanionCreateFingerprint,
            AdImplCompanionFromJsonStringFingerprint,
            AdDeserializerDeserializeFingerprint,
            StandardAdPlaceholderGetAdContentFingerprint,
        ).forEach { it.method.returnEarly(null) }

        UnifiedAdPlaceholderParserFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Ljava/util/ArrayList;
                invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
                return-object v0
            """
        )

        SmartNewsAdResponseParserFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Ljava/util/HashMap;
                invoke-direct {v0}, Ljava/util/HashMap;-><init>()V
                return-object v0
            """
        )

        AdDataLoaderCompanionGetExistingAdDataFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v0
                return-object v0
            """
        )

        AdRelatedAttributesIsAdsInsertionEnabledFingerprint.method.returnEarly(false)

        // (17) SmartNews 1P Ad Endpoints & OMSDK Javascript Loader
        StandardEndpointsBuildUrlFingerprint.method.returnEarly("")
        StandardEndpointsInitFingerprint.method.addInstructions(0, "const-string p2, \"\"")
        SatEndpointsInitFingerprint.method.addInstructions(0, "const-string p1, \"\"")
        OmSdkJavascriptLoaderOpenStreamFingerprint.method.returnEarly(null)

        // (18) SmartView WebView Preconnects & Ad Blocking
        SmartViewClientConditionsBlockingAdsEnabledFingerprint.method.returnEarly(true)
        ArticleHtmlFormatterClinitFingerprint.method.apply {
            val returnIdx = implementation!!.instructions.lastIndex
            addInstructions(
                returnIdx,
                """
                    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                    move-result-object v0
                    sput-object v0, Lzv0;->k:Ljava/util/List;
                    sput-object v0, Lzv0;->m:Ljava/util/List;
                """
            )
        }

        // (19) Vungle / Liftoff Monetize SDK & RemoteConfig Ad Settings
        listOf(
            VungleProviderOnCreateFingerprint,
            VungleAdsCompanionIsInitializedFingerprint,
        ).forEach { it.method.returnEarly(false) }

        listOf(
            VungleAdsCompanionInitFingerprint,
            VungleAdsCompanionGetBiddingTokenFingerprint,
            VungleInitializerInitFingerprint,
            VungleConfigManagerFetchConfigAsyncFingerprint,
            VungleApiClientReportErrorsFingerprint,
            VungleApiClientReportMetricsFingerprint,
            VungleAnalyticsClientReportFingerprint,
            VungleAnalyticsClientInitOrUpdateFingerprint,
            VungleBaseAdLoadFingerprint,
            VungleMediationAdapterInitializeFingerprint,
        ).forEach { it.method.returnEarly() }

        listOf(
            VungleApiClientConfigFingerprint,
            NimbusConfigParserFingerprint,
            PrebidConfigParserFingerprint,
        ).forEach { it.method.returnEarly(null) }

        // (20) Google AppMeasurement / sGTM & NTT Docomo OIDC GA4 Measurement Protocol
        listOf(
            MeasurementCoreIsEnabledFingerprint,
            MeasurementCoreCheckInitializedFingerprint,
            MeasurementNetworkIsConnectedFingerprint,
            AppMeasurementJobServiceOnStartJobFingerprint,
            DocomoOidcMeasurementIsEnabledFingerprint,
        ).forEach { it.method.returnEarly(false) }

        MeasurementCoreGetEnabledStateFingerprint.method.returnEarly(1)

        listOf(
            MeasurementClientExecuteFingerprint,
            MeasurementNetworkUploadBatchFingerprint,
            MeasurementControllerUploadByAppIdFingerprint,
            MeasurementControllerProcessBatchesFingerprint,
            MeasurementListenerLogEventFingerprint,
            AppMeasurementReceiverOnReceiveFingerprint,
            DocomoOidcMeasurementSendFingerprint,
        ).forEach { it.method.returnEarly() }

        DocomoOidcMeasurementBuildUrlFingerprint.method.returnEarly("")

        // (21) Cover both home widgets and article WebViews before their original handlers.
        listOf(
            SharedPageWebViewClientInterceptRequestFingerprint,
            WebViewWrapperClientInterceptRequestFingerprint,
            WebViewWrapperClientInterceptUrlFingerprint,
        ).forEach { blockSentryRequests(it) }
        initializeWebViewUrlFilter()

        // Preserve existing ad/analytics filters, with host-based matching for Sentry.
        val urlFilter = WebViewUrlFilterShouldBlockFingerprint.method
        require((urlFilter.implementation?.registerCount ?: 0) >= 3) {
            "WebView URL filter must have a local register"
        }
        urlFilter.addInstructions(
            0,
            """
                if-eqz p1, :cond_check_orig
                const-string v0, "amazon-adsystem."
                invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v0
                if-eqz v0, :cond_check_sentry_flt
                const/4 v0, 0x1
                return v0

                :cond_check_sentry_flt
                invoke-static/range {p1 .. p1}, $SENTRY_BLOCKER_TYPE->isBlocked(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :cond_check_gtm_flt
                const/4 v0, 0x1
                return v0

                :cond_check_gtm_flt
                const-string v0, "googletagmanager."
                invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v0
                if-eqz v0, :cond_check_ga
                const/4 v0, 0x1
                return v0

                :cond_check_ga
                const-string v0, "google-analytics."
                invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v0
                if-eqz v0, :cond_check_ga_sub
                const/4 v0, 0x1
                return v0

                :cond_check_ga_sub
                const-string v0, "analytics.google."
                invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v0
                if-eqz v0, :cond_check_dc
                const/4 v0, 0x1
                return v0

                :cond_check_dc
                const-string v0, "doubleclick.net"
                invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v0
                if-eqz v0, :cond_check_gas
                const/4 v0, 0x1
                return v0

                :cond_check_gas
                const-string v0, "googleadservices.com"
                invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v0
                if-eqz v0, :cond_check_orig
                const/4 v0, 0x1
                return v0

                :cond_check_orig
            """
        )
    }
}


context(patchContext: BytecodePatchContext)
private fun blockSentryRequests(fingerprint: Fingerprint) {
    val method = fingerprint.method
    require(!AccessFlags.STATIC.isSet(method.accessFlags) &&
        (method.implementation?.registerCount ?: 0) >= 4) {
        "WebView interception must have a local register"
    }
    val parameterType = method.parameterTypes[1].toString()
    val helperMethod = when (parameterType) {
        "Landroid/webkit/WebResourceRequest;" -> "responseForRequest"
        "Ljava/lang/String;" -> "responseForUrl"
        else -> error("Unexpected WebView request type: $parameterType")
    }
    method.addInstructions(
        0,
        """
            invoke-static/range {p2 .. p2}, $SENTRY_BLOCKER_TYPE->$helperMethod($parameterType)Landroid/webkit/WebResourceResponse;
            move-result-object v0
            if-eqz v0, :continue_sentry_request
            return-object v0
            :continue_sentry_request
            nop
        """
    )
}

context(patchContext: BytecodePatchContext)
private fun initializeWebViewUrlFilter() {
    val fingerprint = WebViewWrapperStaticInitializerFingerprint
    val filter = WebViewUrlFilterShouldBlockFingerprint.classDef
    require(filter.methods.any { it.name == "<init>" && it.parameterTypes.isEmpty() }) {
        "WebView URL filter needs a no-argument constructor"
    }
    val field = fingerprint.classDef.fields.singleOrNull {
        AccessFlags.STATIC.isSet(it.accessFlags) && it.type == filter.type
    } ?: error("Expected one static WebView filter field of type ${filter.type}")
    require((fingerprint.method.implementation?.registerCount ?: 0) >= 1) {
        "WebView static initializer must have a local register"
    }
    require(fingerprint.method.implementation!!.instructions
        .filter { it.opcode == Opcode.SPUT_OBJECT }
        .filterIsInstance<ReferenceInstruction>()
        .mapNotNull { it.reference as? FieldReference }
        .none { it.definingClass == field.definingClass && it.name == field.name }) {
        "The original WebView initializer already assigns the tracker filter"
    }
    // Class initialization is serialized by ART; request threads never replace this field.
    fingerprint.method.addInstructions(
        0,
        """
            new-instance v0, ${filter.type}
            invoke-direct {v0}, ${filter.type}-><init>()V
            sput-object v0, ${field.definingClass}->${field.name}:${field.type}
        """
    )
}
