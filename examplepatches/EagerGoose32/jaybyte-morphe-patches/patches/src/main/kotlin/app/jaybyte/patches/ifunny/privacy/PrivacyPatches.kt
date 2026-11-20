package app.jaybyte.patches.ifunny.privacy

import app.jaybyte.patches.ifunny.shared.Constants.COMPATIBILITY_IFUNNY
import app.jaybyte.patches.ifunny.shared.Constants.EXTENSION
import app.jaybyte.patches.ifunny.shared.Constants.EXTENSION_PKG
import app.jaybyte.patches.ifunny.shared.editManifest
import app.jaybyte.patches.ifunny.shared.stubAll
import app.jaybyte.patches.ifunny.shared.stubVoidMethods
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val disableAnalyticsPatch = patch(
    name = "Disable analytics",
    description = "Disables AppsFlyer, Yandex AppMetrica, Firebase Analytics, iFunny's own event " +
        "uploads and the upload of ad/attribution IDs to iFunny's servers.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IFUNNY)

    execute {
        // AppsFlyer: the implementation class is obfuscated, so find the subclass of AppsFlyerLib.
        val appsFlyerImpl = classDefBy { it.superclass == "Lcom/appsflyer/AppsFlyerLib;" }.type
        stubAll(
            appsFlyerImpl, "start", "logEvent", "logSession", "logLocation", "setCustomerUserId",
            "setUserEmails", "setPhoneNumber", "setAdditionalData", "sendPushNotificationData",
        )
        stubAll(appsFlyerImpl, "init", returnThis = true)

        // Yandex AppMetrica (pulled in by the Yandex ads SDK).
        stubAll(
            "Lio/appmetrica/analytics/AppMetrica;",
            "activate", "activateReporter", "enableActivityAutoTracking", "initWebViewReporting",
            "reportAdRevenue", "reportAnr", "reportAppOpen", "reportECommerce", "reportError", "reportEvent",
            "reportExternalAdRevenue", "reportExternalAttribution", "reportRevenue",
            "reportUnhandledException", "reportUserProfile", "resumeSession", "pauseSession",
            "sendEventsBuffer", "setLocation", "setUserProfileID", "requestStartupParams",
            "putAppEnvironmentValue", "putErrorEnvironmentValue",
        )

        // iFunny first-party analytics: behave as if sending is not permitted.
        AnalyticsSenderSendFingerprint.method.returnEarly(false)

        // Report a successful tracking-ID upload without sending anything.
        PutAttributionIdsFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Lmobi/ifunny/analytics/attributionids/SendAttributionIdsResult;
                const/4 v1, 0x1
                const/4 v2, 0x0
                const-string v3, ""
                invoke-direct {v0, v1, v2, v3}, Lmobi/ifunny/analytics/attributionids/SendAttributionIdsResult;-><init>(ZILjava/lang/String;)V
                return-object v0
            """,
        )

        editManifest {
            disableComponents(
                "com.appsflyer.MultipleInstallBroadcastReceiver",
                "io.appmetrica.analytics.internal.AppMetricaService",
                "io.appmetrica.analytics.internal.PreloadInfoContentProvider",
                "com.google.android.gms.measurement.AppMeasurementReceiver",
                "com.google.android.gms.measurement.AppMeasurementService",
                "com.google.android.gms.measurement.AppMeasurementJobService",
            )
            setAppMetaData("firebase_analytics_collection_deactivated", "true")
            setAppMetaData("firebase_analytics_collection_enabled", "false")
            setAppMetaData("google_analytics_automatic_screen_reporting_enabled", "false")
            setAppMetaData("com.facebook.sdk.AutoLogAppEventsEnabled", "false")
        }
    }
}

@Suppress("unused")
val disableCrashReportersPatch = patch(
    name = "Disable crash reporters",
    description = "Disables Firebase Crashlytics and Firebase Sessions telemetry.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IFUNNY)

    execute {
        stubAll(
            "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
            "setCrashlyticsCollectionEnabled", "recordException", "log", "setUserId",
            "setCustomKey", "setCustomKeys", "sendUnsentReports",
        )
        editManifest {
            setAppMetaData("firebase_crashlytics_collection_enabled", "false")
            setAppMetaData("firebase_sessions_enabled", "false")
            setAppMetaData("firebase_performance_collection_deactivated", "true")
            disableComponents("leakcanary.internal.PlumberInstaller")
        }
    }
}

@Suppress("unused")
val blockIdentityTrackersPatch = patch(
    name = "Block identity trackers",
    description = "Disables LiveRamp ATS (hashed-email identity graph) and the HUMAN/WhiteOps " +
        "device-fingerprinting SDK.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IFUNNY)

    execute {
        stubVoidMethods("Lcom/liveramp/ats/LRAtsManager;")
        stubVoidMethods("Lcom/adsbynimbus/request/LiveRampExtension;")
        HumanInitFingerprint.method.returnEarly()
        editManifest { disableComponents("com.liveramp.ats.LRInitProvider") }
    }
}

@Suppress("unused")
val disableLocationPatch = patch(
    name = "Disable location",
    description = "Removes the location permissions and stops iFunny's background location upload. " +
        "The in-app map will no longer work.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IFUNNY)

    execute {
        GeoSenderStartFingerprint.method.returnEarly()
        GeoSenderSendFingerprint.method.returnEarly()
        editManifest {
            removePermissions(
                "android.permission.ACCESS_FINE_LOCATION",
                "android.permission.ACCESS_COARSE_LOCATION",
            )
        }
    }
}

@Suppress("unused")
val limitAdTrackingPatch = patch(
    name = "Limit ad tracking",
    description = "Removes advertising-ID, Privacy Sandbox, Google Services ID, account-list and vendor " +
        "app-info permissions, denies analytics/ad consent by default and removes root-app detection queries.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IFUNNY)

    execute {
        editManifest {
            removePermissions(
                "android.permission.AD_ID",
                "com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                "android.permission.ACCESS_ADSERVICES_TOPICS",
                "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
                "android.permission.AD_SERVICES_CONFIG",
                "android.permission.GET_ACCOUNTS",
                "com.google.android.providers.gsf.permission.READ_GSERVICES",
                "com.samsung.android.mapsagent.permission.READ_APP_INFO",
                "com.huawei.appmarket.service.commondata.permission.GET_COMMON_DATA",
                "com.amazon.privacypass.ATTEST",
            )
            removeQueriedPackages(
                "com.topjohnwu.magisk", "eu.chainfire.supersu", "com.noshufou.android.su",
                "com.koushikdutta.superuser", "com.thirdparty.superuser",
            )
            listOf(
                "google_analytics_default_allow_analytics_storage",
                "google_analytics_default_allow_ad_storage",
                "google_analytics_default_allow_ad_user_data",
                "google_analytics_default_allow_ad_personalization_signals",
                "google_analytics_adid_collection_enabled",
                "google_analytics_ssaid_collection_enabled",
                "com.facebook.sdk.AdvertiserIDCollectionEnabled",
            ).forEach { setAppMetaData(it, "false") }
        }
    }
}

@Suppress("unused")
val stripPhotoLocationPatch = patch(
    name = "Strip photo location",
    description = "Removes GPS and camera serial/owner EXIF tags from JPEG, PNG and WebP images before " +
        "upload. A cache copy is uploaded; the original photo is never modified.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IFUNNY)
    extendWith(EXTENSION)

    execute {
        val createFromFile = "Lokhttp3/RequestBody\$Companion;->create(Ljava/io/File;Lokhttp3/MediaType;)"
        fun isCreateFromFile(ref: MethodReference) =
            ref.definingClass == "Lokhttp3/RequestBody\$Companion;" && ref.name == "create" &&
                ref.parameterTypes.map { it.toString() } == listOf("Ljava/io/File;", "Lokhttp3/MediaType;")

        val targets = mutableListOf<String>()
        classDefForEach { classDef ->
            if (!classDef.type.startsWith("Lmobi/ifunny/")) return@classDefForEach
            val uses = classDef.methods.any { m ->
                m.implementation?.instructions?.any { insn ->
                    (insn as? ReferenceInstruction)?.reference.let { it is MethodReference && isCreateFromFile(it) }
                } == true
            }
            if (uses) targets += classDef.type
        }
        check(targets.isNotEmpty()) { "No upload call sites found for $createFromFile" }

        targets.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.withIndex()
                    .filter { (_, insn) ->
                        (insn as? ReferenceInstruction)?.reference.let { it is MethodReference && isCreateFromFile(it) }
                    }
                    .map { (index, insn) ->
                        // Arguments: {companion, file, mediaType} -> the file is the second register.
                        val fileRegister = when (insn) {
                            is RegisterRangeInstruction -> insn.startRegister + 1
                            is FiveRegisterInstruction -> insn.registerD
                            else -> error("Unexpected instruction format at $type")
                        }
                        index to fileRegister
                    }
                    .sortedByDescending { it.first }
                    .forEach { (index, register) ->
                        method.addInstructions(
                            index,
                            """
                                invoke-static/range {v$register .. v$register}, $EXTENSION_PKG/ExifStrip;->strip(Ljava/io/File;)Ljava/io/File;
                                move-result-object v$register
                            """,
                        )
                    }
            }
        }
    }
}

@Suppress("unused")
val bypassVpnDetectionPatch = patch(
    name = "Bypass VPN detection",
    description = "Always reports that no VPN is active to the ad SDK that checks for one.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IFUNNY)

    execute {
        stubAll("Lcom/vungle/ads/internal/platform/DeviceCheckUtils;", "isVpnConnected")
    }
}

@Suppress("unused")
val blockCleartextTrafficPatch = patch(
    name = "Block cleartext traffic",
    description = "Disallows unencrypted HTTP connections app-wide (the stock app allows them everywhere).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IFUNNY)

    execute {
        resourceXml("res/xml/network_security_config.xml").use { xml ->
            xml.root.elements("base-config").forEach { it.setAttribute("cleartextTrafficPermitted", "false") }
        }
    }
}
