package patches.rainviewer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import org.w3c.dom.Element

private const val ANDROID = "http://schemas.android.com/apk/res/android"

private val adResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val providers = doc.getElementsByTagName("provider")
            val ads = (0 until providers.length).map { providers.item(it) as Element }
                .single { it.getAttributeNS(ANDROID, "name") == "com.google.android.gms.ads.MobileAdsInitProvider" }
            ads.setAttributeNS(ANDROID, "android:enabled", "false")
        }
    }
}

internal val startupCompatibility = bytecodePatch {
    dependsOn(originalInput)
    execute {
        // This build has a licensing wrapper, not virtualized application callbacks.
        exact("Lcom/pairip/licensecheck/LicenseClient;", "checkLicense", "V", "Landroid/content/Context;")
            .addInstructions(0, "return-void")
    }
}

@Suppress("unused")
val hideAds = bytecodePatch(
    name = "Hide ads",
    description = "Disables map, forecast, sharing, post-play and post-premium advertising, in-house promotions and chart promo blocks, including cached and remotely enabled placements.",
) {
    compatibleWith(rainviewer)
    dependsOn(originalInput, startupCompatibility, adResources)
    execute {
        listOf("BannerData", "PositionedBannerData", "AdData", "InterstitialBannerData").forEach {
            exact("$REMOTE$it;", "isEnabled", "Z").addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        }
        exact("${REMOTE}InHouseBannerData;", "getDisplayAd", "Z").addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        exact("${REMOTE}ChartData;", "isPromoBlockEnabled", "Z").addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        // After both original fields are initialized, p1 is available as scratch.
        // Hide only the Purchase hint; preserve weather and map-use hints.
        exact("Lpu2;", "<init>", "V", "Z", "Lou2;").apply {
            addInstructionsWithLabels(3, """
                instance-of p1, p2, Lmu2;
                if-eqz p1, :keepHint
                const/4 p1, 0x0
                iput-boolean p1, p0, Lpu2;->a:Z
            """.trimIndent(), ExternalLabel("keepHint", getInstruction(3)))
        }
        exact("Lcom/google/android/gms/ads/MobileAds;", "a", "V", "Landroid/content/Context;", "Lkq2;")
            .addInstructions(0, "return-void")
    }
}

private val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            fun nodes(tag: String): List<Element> = doc.getElementsByTagName(tag).let { list ->
                (0 until list.length).map { list.item(it) as Element }
            }
            val app = nodes("application").single()
            fun flag(name: String, enabled: Boolean) {
                val matches = nodes("meta-data").filter { it.getAttributeNS(ANDROID, "name") == name }
                check(matches.size <= 1) { "Duplicate manifest flag $name" }
                val node = matches.singleOrNull() ?: doc.createElement("meta-data").also {
                    it.setAttributeNS(ANDROID, "android:name", name)
                    app.appendChild(it)
                }
                node.setAttributeNS(ANDROID, "android:value", enabled.toString())
            }
            listOf("firebase_analytics_collection_deactivated", "firebase_performance_collection_deactivated").forEach { flag(it, true) }
            // Avoid Crashlytics settings/installation requests and eager Sessions initialization.
            nodes("meta-data").filter {
                it.getAttributeNS(ANDROID, "name") in setOf(
                    "com.google.firebase.components:com.google.firebase.crashlytics.FirebaseCrashlyticsKtxRegistrar",
                    "com.google.firebase.components:com.google.firebase.crashlytics.CrashlyticsRegistrar",
                    "com.google.firebase.components:com.google.firebase.sessions.FirebaseSessionsRegistrar",
                )
            }.also { check(it.size == 3) { "Expected three crash/session registrars" } }
                .forEach { it.parentNode.removeChild(it) }
            listOf("firebase_analytics_collection_enabled", "google_analytics_automatic_screen_reporting_enabled",
                "google_analytics_adid_collection_enabled", "google_analytics_default_allow_analytics_storage",
                "google_analytics_default_allow_ad_storage", "google_analytics_default_allow_ad_user_data",
                "google_analytics_default_allow_ad_personalization_signals", "firebase_crashlytics_collection_enabled",
                "firebase_sessions_enabled", "firebase_performance_collection_enabled", "firebase_performance_logcat_enabled",
                "delivery_metrics_exported_to_big_query_enabled").forEach { flag(it, false) }
            nodes("uses-permission").filter {
                val name = it.getAttributeNS(ANDROID, "name")
                name == "com.google.android.gms.permission.AD_ID" || name.startsWith("android.permission.ACCESS_ADSERVICES_") ||
                    name == "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE"
            }.also { check(it.size == 5) { "Unexpected RainViewer advertising permissions: ${it.size}" } }
                .forEach { it.parentNode.removeChild(it) }
            listOf("com.google.android.gms.measurement.AppMeasurementReceiver", "com.google.android.gms.measurement.AppMeasurementService",
                "com.google.android.gms.measurement.AppMeasurementJobService", "com.microsoft.clarity.jobs.UploadSessionJob").forEach { name ->
                nodes("*").single { it.getAttributeNS(ANDROID, "name") == name }.setAttributeNS(ANDROID, "android:enabled", "false")
            }
        }
    }
}

@Suppress("unused")
val disableTracking = bytecodePatch(
    name = "Disable tracking",
    description = "Disables Firebase analytics, performance and crash uploads, Clarity recording, advertising identifiers and publisher session/paywall/open-notification events while retaining weather requests and notification delivery.",
) {
    compatibleWith(rainviewer)
    dependsOn(originalInput, hideAds, trackingResources)
    execute {
        exact("${REMOTE}ABConfigData\$Data;", "isUseClarity", "Z").addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        listOf("Landroid/app/Activity;", "Landroid/content/Context;").forEach {
            exact("Lcom/microsoft/clarity/Clarity;", "initialize", "Ljava/lang/Boolean;", it, "Lcom/microsoft/clarity/ClarityConfig;")
                .addInstructions(0, "sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\nreturn-object v0")
        }
        exact("Lcom/microsoft/clarity/Clarity;", "resume", "Ljava/lang/Boolean;")
            .addInstructions(0, "sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\nreturn-object v0")
        listOf("a", "b").forEach { exact("Lb56;", it, "V", "Lsq1;").addInstructions(0, "return-void") }
        exact("Lb56;", "c", "V").addInstructions(0, "return-void")
        exact("Lnr2;", "a", "V", "Ljava/lang/String;", "Ljava/lang/String;").addInstructions(0, "return-void")
        // Only constructor variant 15 provides the app's crash logger. Keep its facade
        // non-null while avoiding Firebase component lookup; other merged variants run normally.
        exact("Lqb9;", "<init>", "V", "I").apply {
            addInstructionsWithLabels(0, """
                const/16 v0, 0xf
                if-ne p1, v0, :originalConstructor
                invoke-direct {p0}, Ljava/lang/Object;-><init>()V
                new-instance v0, Ly32;
                const/4 v1, 0x0
                invoke-direct {v0, v1}, Ly32;-><init>(Lfv0;)V
                iput-object v0, p0, Lqb9;->a:Ljava/lang/Object;
                return-void
            """.trimIndent(), ExternalLabel("originalConstructor", getInstruction(0)))
        }
        exact("Lc56;", "i", "V", "I", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/Throwable;")
            .addInstructions(0, "return-void")
        exact("Loy0;", "b", "Z").addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        exact("Lzn7;", "b", "V", "Lcom/google/firebase/perf/v1/PerfMetric;").addInstructions(0, "return-void")
        exact("Lzn7;", "c", "V", "Lcom/google/firebase/perf/v1/TraceMetric;", "Lkp;").addInstructions(0, "return-void")
        exact("Lzn7;", "d", "V", "Lu95;", "Lkp;").addInstructions(0, "return-void")
        // Acknowledge CCT uploads locally, including already queued telemetry. No HTTP connection or retry.
        exact("Ll9;", "e", "Llb0;", "Lcya;").addInstructions(0, """
            new-instance v0, Llb0;
            const/16 v1, 0xc8
            const/4 v2, 0x0
            const-wide/16 v3, 0x0
            invoke-direct {v0, v1, v2, v3, v4}, Llb0;-><init>(ILjava/net/URL;J)V
            return-object v0
        """.trimIndent())
        exact("Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;", "getAdvertisingIdInfo",
            "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;", "Landroid/content/Context;").addInstructions(0, """
            new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;
            const-string v1, "00000000-0000-0000-0000-000000000000"
            const/4 v2, 0x1
            invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;-><init>(Ljava/lang/String;Z)V
            return-object v0
        """.trimIndent())
        listOf("e" to "Lcom/lucky_apps/data/messaging/entity/NotificationOpenedRequest;",
            "j" to "Lcom/lucky_apps/data/user/entity/UserEventRequest;").forEach { (name, request) ->
            exact("Lff4;", name, "Ljava/lang/Object;", request, "Lft0;")
                .addInstructions(0, "sget-object v0, Les7;->a:Les7;\nreturn-object v0")
        }
        // The consumer expects a response object, not Kotlin Unit. Empty data produces no offers or entitlement changes.
        exact("Lff4;", "k", "Ljava/lang/Object;", "Lcom/lucky_apps/data/settings/entity/SettingsRequest;",
            "Lcom/lucky_apps/data/user/entity/PaywallEventRequest;", "Lft0;").addInstructions(0, """
            new-instance v0, Lcom/lucky_apps/data/user/entity/PaywallEventResponse;
            const/4 v1, 0x0
            const-string v2, ""
            new-instance v3, Lcom/lucky_apps/data/user/entity/PaywallEventResponse${'$'}Data;
            invoke-direct {v3}, Lcom/lucky_apps/data/user/entity/PaywallEventResponse${'$'}Data;-><init>()V
            invoke-direct {v0, v1, v2, v3}, Lcom/lucky_apps/data/user/entity/PaywallEventResponse;-><init>(ILjava/lang/String;Lcom/lucky_apps/data/user/entity/PaywallEventResponse${'$'}Data;)V
            return-object v0
        """.trimIndent())
    }
}

@Suppress("unused")
val skipConsentScreens = bytecodePatch(
    name = "Skip consent screens",
    description = "Skips the automatic Google UMP consent request and banner after disabling ads and tracking. Does not record or grant consent.",
) {
    compatibleWith(rainviewer)
    dependsOn(originalInput, disableTracking)
    execute {
        exact("Llq2;", "a", "V", "Landroidx/fragment/app/FragmentActivity;").addInstructions(0, "return-void")
    }
}

@Suppress("unused")
val skipSubscriptionScreens = bytecodePatch(
    name = "Skip subscription screens",
    description = "Skips subscription onboarding, automatic startup/web promotions, recurring purchase offers and Settings offer cards. Hides the Settings plan Manage link while retaining the plan badge and premium access state.",
) {
    compatibleWith(rainviewer)
    dependsOn(originalInput, startupCompatibility)
    execute {
        // Each fragment's view binding is created in E() before P(). Finish through the
        // host's normal onboarding completion path, which persists completion and opens startup.
        // Cover a fresh run and saved state restored directly onto either purchase page.
        listOf("policydata/PolicyDataFragment", "purchaseessential/PurchaseEssentialFragment", "purchasepro/PurchaseProFragment").forEach {
            exact("Lcom/lucky_apps/rainviewer/onboarding/v4/$it;", "P", "V", "Landroid/view/View;", "Landroid/os/Bundle;")
                .addInstructions(0, """
                    invoke-virtual {p0}, Landroidx/fragment/app/b;->l()Landroidx/fragment/app/FragmentActivity;
                    move-result-object v0
                    check-cast v0, Lcom/lucky_apps/rainviewer/onboarding/OnboardingActivity;
                    invoke-virtual {v0}, Lcom/lucky_apps/rainviewer/onboarding/OnboardingActivity;->m()V
                    return-void
                """.trimIndent())
        }
        exact("${REMOTE}OnboardingData;", "isPaywallDisabled", "Z").addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        exact("${REMOTE}PurchaseData;", "getPurchaseOnStartEnabled", "Z").addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        // A cached web startup promotion can predate the disabled event sender. Its
        // original null-offer branch emits the normal completion event and closes it.
        exact("Ls47;", "f", "Ljava/lang/Object;", "Lcom/lucky_apps/data/startupscreen/entity/StartupScreenModel;", "Lft0;")
            .addInstructions(0, "const/4 p1, 0x0")
        // Keep plan status/features, but remove offers and the Manage navigation
        // that opens unavailable Subscription details in the local Pro setup.
        exact("Lph5;", "<init>", "V", "I", "Lsh5;", "Z", "Ljava/util/List;", "I", "Ljava/util/List;", "I")
            .addInstructions(0, "or-int/lit8 p7, p7, 0x40\nconst/4 p3, 0x0")
        listOf("a", "b").forEach {
            exact("Lha6;", it, "Ljava/lang/Object;", "Lil4;", "Lft0;")
                .addInstructions(0, "sget-object v0, Les7;->a:Les7;\nreturn-object v0")
        }
    }
}
