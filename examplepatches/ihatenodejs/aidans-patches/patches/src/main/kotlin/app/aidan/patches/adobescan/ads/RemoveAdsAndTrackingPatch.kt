package app.aidan.patches.adobescan.ads

import app.aidan.patches.adobescan.shared.COMPATIBILITY_ADOBE_SCAN
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val ZEROED_ADVERTISING_ID = "00000000-0000-0000-0000-000000000000"

@Suppress("unused")
val removeAdsAndTrackingPatch = bytecodePatch(
    name = "Remove Ads and Tracking",
    description = "Disables Adobe Experience Platform MobileCore, EventHub, Adobe Growth SDK (DGP/MAU and Dunamis), Adobe Journey Optimizer (AJO), Creative SDK, Branch attribution, Facebook App Events and Audience Network, Firebase Performance, Firebase Sessions, and Crashlytics telemetry; suppresses Google Mobile Ads (AdMob), interstitials, banner preloaders, and in-app reviews; removes telemetry preferences; zeroes the Google Play Advertising ID; and blocks hardware android_id collection.",
    default = true
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_ADOBE_SCAN)

    val removeAds = booleanOption(
        key = "removeAds",
        default = true,
        title = "Disable In-App Ads",
        description = "Disables banner and interstitial ads, banner preloading, ad analytics, and InMobi SDK initialization."
    )

    val removeAdobeTracking = booleanOption(
        key = "removeAdobeTracking",
        default = true,
        title = "Disable Adobe Telemetry & Growth",
        description = "Disables Adobe Experience Platform MobileCore, EventHub dispatch, Adobe Growth SDK (DGP/MAU and Dunamis), Adobe Journey Optimizer (AJO), Creative SDK, and AEP NetworkService."
    )

    val removeFirebaseTracking = booleanOption(
        key = "removeFirebaseTracking",
        default = true,
        title = "Disable Firebase Telemetry",
        description = "Disables Firebase Performance Monitoring (AppStartTrace and network timing), Firebase Sessions, Firebase Installations, and Crashlytics collection."
    )

    val removeFacebookTracking = booleanOption(
        key = "removeFacebookTracking",
        default = true,
        title = "Disable Facebook Tracking",
        description = "Disables Facebook SDK initialization (FacebookInitProvider), Audience Network ContentProvider, App Events logging, and remote settings fetch."
    )

    val removeDeviceIdentifiers = booleanOption(
        key = "removeDeviceIdentifiers",
        default = true,
        title = "Zero Device Identifiers",
        description = "Zeroes the Google Play Advertising ID, blocks Install Referrer, and neutralizes hardware android_id collection in AccountManager and Creative SDK."
    )

    val removeReviewPrompts = booleanOption(
        key = "removeReviewPrompts",
        default = true,
        title = "Disable Review Prompts",
        description = "Suppresses in-app rating and review dialogs."
    )

    val removeSettings = booleanOption(
        key = "removeSettings",
        default = true,
        title = "Remove Settings",
        description = "Removes the Send usage info and Send crash info preferences and suppresses the crash reports dialog, whose telemetry backends are disabled by this patch."
    )

    execute {
        if (removeAds.value != false) {
            // In-app ads, preloaders, and ad analytics.
            patchBooleanMethod("Lar/k;", "b", emptyList(), false)
            patchVoidMethod("Lar/k;", "f", listOf("Landroid/app/Activity;"))
            patchBooleanMethod("Lar/u;", "a", emptyList(), false)
            patchVoidMethod("Lar/u;", "b", listOf("Landroid/content/Context;"))
            patchVoidMethod("Lar/x;", "b", emptyList())
            patchVoidMethod("Lar/x;", "f", listOf("Landroid/app/Activity;"))
            patchNullObjectMethod("Lar/x;", "c", listOf("Lar/e;"))
            patchVoidMethod("Lar/c;", "a", listOf("Lar/c${'$'}a;", "Lar/v;"))
            patchVoidMethod("Lar/s;", "a", listOf("Lar/s${'$'}a;"))
            patchAllVoidMethods("Lcom/inmobi/sdk/InMobiSdk;", "init")
            patchBooleanMethod("Lcom/inmobi/sdk/InMobiSdk;", "isSDKInitialized", emptyList(), false)
            patchAllVoidMethods("Lcom/inmobi/sdk/InMobiSdk;", "updateGDPRConsent")
        }

        if (removeAdobeTracking.value != false) {
            // Adobe Experience Platform MobileCoreInitializer and EventHub.
            patchVoidMethod("Lcom/adobe/marketing/mobile/MobileCoreInitializer;", "b", listOf("Lcom/adobe/scan/android/ScanApplication;"))
            patchVoidMethod("Lcom/adobe/marketing/mobile/MobileCoreInitializer;", "a", listOf("Ljava/util/List;", "Lcom/adobe/marketing/mobile/AdobeCallback;"))

            // Adobe Experience Platform MobileCore and Target.
            patchVoidMethod("Lcom/adobe/marketing/mobile/MobileCore;", "a", listOf("Lcom/adobe/marketing/mobile/Event;"))
            patchVoidMethod("Lcom/adobe/marketing/mobile/MobileCore;", "b", listOf("Lcom/adobe/marketing/mobile/Event;", "J", "Lcom/adobe/marketing/mobile/AdobeCallbackWithError;"))
            patchVoidMethod("Lcom/adobe/marketing/mobile/MobileCore;", "h", listOf("Lcom/adobe/marketing/mobile/MobilePrivacyStatus;"))
            patchVoidMethod("Lcom/adobe/marketing/mobile/MobileCore;", "i", listOf("Ljava/lang/String;", "Ljava/util/HashMap;"))
            patchVoidMethod("Lcom/adobe/marketing/mobile/MobileCore;", "j", listOf("Ljava/util/HashMap;"))
            patchVoidMethod("Lcom/adobe/marketing/mobile/Target;", "a", listOf("Ljava/util/ArrayList;", "Lrp/n;"))

            // AEP NetworkService.
            patchVoidMethod("Ldp/u;", "a", listOf("Ldp/s;", "Ldp/r;"))

            // Adobe Growth Platform (DGP / MAU / Dunamis).
            patchVoidMethod("Lcom/adobe/dgp/DGPMau;", "dispatchMau", emptyList())
            patchVoidMethod("Lcom/adobe/dgp/DGPMau;", "dispatchMauInternal", listOf("I"))
            patchVoidMethod("Lcom/adobe/dgp/DGPMau;", "onBackground", emptyList())
            patchVoidMethod("Lcom/adobe/dgp/DGPMau;", "onForeground", emptyList())

            patchBooleanMethod("Lcom/adobe/dgp/DGPAEPBridge;", "readyForEvent", listOf("Lcom/adobe/marketing/mobile/Event;"), false)
            patchBooleanMethod("Lcom/adobe/dgp/DGPAEPBridge;", "isExtensionRegistered", emptyList(), false)
            patchVoidMethod("Lcom/adobe/dgp/DGPAEPBridge;", "onRegistered", emptyList())
            patchVoidMethod("Lcom/adobe/dgp/DGPAEPBridge;", "onUnregistered", emptyList())

            patchGrowthSDKInitializer()
            patchAllVoidMethods("Lcom/adobe/dgp/DGPLog${'$'}Companion;", "submitToDunamis", "sendDunamisEvent")
            patchVoidMethod("Lcom/adobe/dgp/NetworkInterface${'$'}Companion;", "execute", listOf("Lorg/json/JSONObject;", "Lcom/adobe/dgp/JNI${'$'}Companion${'$'}a;"))

            // Adobe Journey Optimizer (AJO).
            patchVoidMethod("Lcom/adobe/dcmanalytics/ajo/AJOHelper;", "onRegistered", emptyList())
            patchBooleanMethod("Lcom/adobe/dcmanalytics/ajo/AJOHelper;", "readyForEvent", listOf("Lcom/adobe/marketing/mobile/Event;"), false)

            // Document Cloud and Creative SDK analytics.
            patchVoidMethod("Lbr/j;", "g", listOf("Ljava/lang/String;", "Ljava/util/Map;"))
            patchVoidMethodIfPresent("Lbr/j;", "a0", listOf("Lh90/d;"))
            patchVoidMethod("Luc/f;", "g", listOf("Ljava/lang/String;", "Ljava/util/Map;"))
            patchVoidMethod("Luc/f;", "f", listOf("Z"))
            patchBooleanMethod("Luc/f;", "e", emptyList(), false)
            patchVoidMethod("Lbr/j${'$'}g;", "trackEvent", listOf("Ljava/lang/String;", "Ljava/util/HashMap;"))
            patchVoidMethod("Lbr/j${'$'}h;", "a", listOf("Ljava/lang/String;", "Ljava/util/HashMap;"))
            patchVoidMethod("Lcom/adobe/creativesdk/foundation/internal/analytics/n;", "a", listOf("Ljava/lang/String;", "Ljava/util/HashMap;"))
            patchVoidMethod("Lcom/adobe/creativesdk/foundation/internal/analytics/n;", "b", listOf("Ljava/lang/String;"))
            patchVoidMethod("Lcom/adobe/creativesdk/foundation/internal/analytics/n;", "c", listOf("Ljava/lang/String;"))
            patchVoidMethod("Lcom/adobe/creativesdk/foundation/internal/analytics/g;", "b", emptyList())
            patchVoidMethod("Lcom/adobe/creativesdk/foundation/internal/analytics/c;", "b", emptyList())

            // Adobe analytics-monitoring broadcasts.
            patchVoidMethod("Lbr/d;", "a", listOf("Ljava/lang/String;", "Ljava/util/Map;"))
            patchVoidMethod("Lbr/j;", "r", listOf("Ljava/lang/String;"))

            // Branch attribution and deep-link telemetry.
            patchVoidMethod("Lg90/e;", "r", listOf("Lcom/adobe/scan/android/ScanApplication;"))
            patchVoidMethod("Lg90/e0;", "f", listOf("Lg90/z;"))
            setBranchTrackingDisabled()
        }

        if (removeFirebaseTracking.value != false) {
            // Firebase Crashlytics reporting.
            forceCrashReportingDisabled()
            patchAllVoidMethods(
                "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
                "deleteUnsentReports",
                "log",
                "recordException",
                "sendUnsentReports",
                "setCrashlyticsCollectionEnabled",
                "setCustomKey",
                "setCustomKeys",
                "setUserId"
            )

            // Firebase Performance Monitoring.
            patchAllVoidMethods(
                "Lcom/google/firebase/perf/metrics/AppStartTrace;",
                "onActivityCreated",
                "onActivityStarted",
                "onActivityResumed"
            )
            patchAllVoidMethods("Lv50/j;", "b", "c", "d")

            // Firebase Sessions.
            patchAllVoidMethods("Ld60/x0;", "a")
            patchAllVoidMethods("Ld60/l;", "a")

            // Firebase Installations.
            patchAllVoidMethods("Lcom/google/firebase/installations/a;", "b", "d")
        }

        if (removeFacebookTracking.value != false) {
            // Facebook SDK auto-init ContentProvider and Audience Network.
            patchBooleanMethod("Lcom/facebook/internal/FacebookInitProvider;", "onCreate", emptyList(), false)
            patchBooleanMethod("Lcom/facebook/ads/AudienceNetworkContentProvider;", "onCreate", emptyList(), false)
            patchAllVoidMethods("Lcom/facebook/ads/internal/dynamicloading/DynamicLoaderFactory;", "initialize")
            patchAllVoidMethods("Lcom/facebook/internal/FetchedAppSettingsManager;", "d")

            // Facebook App Events.
            patchVoidMethod("Lcom/facebook/appevents/AppEventsLoggerImpl;", "d", listOf("Landroid/os/Bundle;", "Ljava/lang/String;"))
            patchVoidMethod(
                "Lcom/facebook/appevents/AppEventsLoggerImpl;",
                "e",
                listOf(
                    "Ljava/lang/String;",
                    "Ljava/lang/Double;",
                    "Landroid/os/Bundle;",
                    "Z",
                    "Ljava/util/UUID;",
                    "Lcom/facebook/appevents/OperationalData;"
                )
            )
            patchVoidMethod("Lcom/facebook/appevents/AppEventsLoggerImpl;", "g", listOf("Landroid/os/Bundle;", "Ljava/lang/String;"))
            patchVoidMethod(
                "Lcom/facebook/appevents/AppEventsLoggerImpl;",
                "h",
                listOf("Ljava/math/BigDecimal;", "Ljava/util/Currency;", "Landroid/os/Bundle;", "Lcom/facebook/appevents/OperationalData;")
            )
            patchVoidMethod(
                "Lcom/facebook/appevents/AppEventsLoggerImpl${'$'}Companion;",
                "a",
                listOf(
                    "Lcom/facebook/appevents/AppEventsLoggerImpl${'$'}Companion;",
                    "Lcom/facebook/appevents/AppEvent;",
                    "Lcom/facebook/appevents/AccessTokenAppIdPair;"
                )
            )
        }

        if (removeDeviceIdentifiers.value != false) {
            // Google Play advertising identifier and install referrer.
            spoofAdvertisingId()
            patchConstStringMethod("Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;", "getId", ZEROED_ADVERTISING_ID)
            patchBooleanMethod(
                "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;",
                "isLimitAdTrackingEnabled",
                emptyList(),
                true
            )
            patchVoidMethod(
                "Lyv/a;",
                "b",
                listOf("Lcom/android/installreferrer/api/InstallReferrerStateListener;")
            )

            // Hardware android_id neutralization in AccountManager and Creative SDK CommonID.
            neutralizeAndroidIdInAccountManager()
            patchVoidMethod("Lcb/d;", "run", emptyList())
        }

        if (removeReviewPrompts.value != false) {
            // In-app review prompts.
            patchBooleanMethod("Lcom/adobe/scan/android/util/l;", "z1", emptyList(), false)
            patchRateTheAppDialog()
        }

        if (removeSettings.value != false) {
            hideTelemetrySettings()
            patchCrashReportsDialog()
        }
    }
}

private fun BytecodePatchContext.patchVoidMethod(
    classDescriptor: String,
    methodName: String,
    parameterTypes: List<String>
) {
    val methods = matchingMethods(classDescriptor, methodName, parameterTypes, "V")
    methods.forEach { it.addInstructions(0, "return-void") }
}

private fun BytecodePatchContext.patchVoidMethodIfPresent(
    classDescriptor: String,
    methodName: String,
    parameterTypes: List<String>
) {
    val classDef = mutableClassDefByOrNull(classDescriptor) ?: return
    classDef.methods.filter {
        it.name == methodName &&
            it.parameterTypes == parameterTypes &&
            it.returnType == "V" &&
            it.implementation != null
    }.forEach { it.addInstructions(0, "return-void") }
}

private fun BytecodePatchContext.patchAllVoidMethods(classDescriptor: String, methodName: String) {
    val classDef = mutableClassDefByOrNull(classDescriptor)
        ?: throw PatchException("Missing required class $classDescriptor")
    val methods = classDef.methods.filter {
        it.name == methodName &&
            it.returnType == "V" &&
            it.implementation != null
    }
    if (methods.isEmpty()) {
        throw PatchException("Missing required void methods named $methodName in $classDescriptor")
    }
    methods.forEach { it.addInstructions(0, "return-void") }
}

private fun BytecodePatchContext.patchAllVoidMethods(classDescriptor: String, vararg methodNames: String) {
    methodNames.forEach { patchAllVoidMethods(classDescriptor, it) }
}

private fun BytecodePatchContext.patchBooleanMethod(
    classDescriptor: String,
    methodName: String,
    parameterTypes: List<String>,
    value: Boolean
) {
    val literal = if (value) "0x1" else "0x0"
    val methods = matchingMethods(classDescriptor, methodName, parameterTypes, "Z")
    methods.forEach { it.addInstructions(0, "const/4 v0, $literal\nreturn v0") }
}

private fun BytecodePatchContext.patchIntMethod(
    classDescriptor: String,
    methodName: String,
    parameterTypes: List<String>,
    value: Int
) {
    val methods = matchingMethods(classDescriptor, methodName, parameterTypes, "I")
    methods.forEach { it.addInstructions(0, "const/4 v0, $value\nreturn v0") }
}

private fun BytecodePatchContext.patchNullObjectMethod(
    classDescriptor: String,
    methodName: String,
    parameterTypes: List<String>
) {
    val classDef = mutableClassDefByOrNull(classDescriptor)
        ?: throw PatchException("Missing required class $classDescriptor")
    val methods = classDef.methods.filter {
        it.name == methodName &&
            it.parameterTypes == parameterTypes &&
            it.returnType.startsWith("L") &&
            it.implementation != null
    }
    if (methods.isEmpty()) {
        throw PatchException("Missing required object-returning method $classDescriptor->$methodName(${parameterTypes.joinToString()})")
    }
    methods.forEach { it.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0") }
}

private fun BytecodePatchContext.patchConstStringMethod(
    classDescriptor: String,
    methodName: String,
    value: String
) {
    val methods = matchingMethods(classDescriptor, methodName, emptyList(), "Ljava/lang/String;")
    methods.forEach { it.addInstructions(0, "const-string v0, \"$value\"\nreturn-object v0") }
}

private fun BytecodePatchContext.matchingMethods(
    classDescriptor: String,
    methodName: String,
    parameterTypes: List<String>,
    returnType: String
) = mutableClassDefByOrNull(classDescriptor)
    ?.methods
    ?.filter {
        it.name == methodName &&
            it.parameterTypes == parameterTypes &&
            it.returnType == returnType &&
            it.implementation != null
    }
    ?.takeIf { it.isNotEmpty() }
    ?: throw PatchException("Missing required method $classDescriptor->$methodName(${parameterTypes.joinToString()})$returnType")

private fun BytecodePatchContext.setBranchTrackingDisabled() {
    val methods = matchingMethods("Lg90/o0;", "a", listOf("Landroid/content/Context;", "Z"), "V")
    methods.forEach { it.addInstructions(0, "const/4 p2, 0x1") }
}

private fun BytecodePatchContext.forceCrashReportingDisabled() {
    val methods = matchingMethods("Lcom/adobe/scan/android/util/l;", "r1", listOf("I"), "V")
    methods.forEach { it.addInstructions(0, "const/4 p1, 0x0") }
    patchIntMethod("Lcom/adobe/scan/android/util/l;", "q0", emptyList(), 0)
    patchBooleanMethod(
        "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
        "didCrashOnPreviousExecution",
        emptyList(),
        false
    )
}

private fun BytecodePatchContext.spoofAdvertisingId() {
    val methods = matchingMethods(
        "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;",
        "getAdvertisingIdInfo",
        listOf("Landroid/content/Context;"),
        "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;"
    )
    methods.forEach { method ->
        method.addInstructions(
            0,
            """
            new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;
            const-string v1, "$ZEROED_ADVERTISING_ID"
            const/4 v2, 0x1
            invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;-><init>(Ljava/lang/String;Z)V
            return-object v0
            """.trimIndent()
        )
    }
}

private fun BytecodePatchContext.patchGrowthSDKInitializer() {
    val methods = matchingMethods(
        "Lcom/adobe/dgp/GrowthSDKInitializer;",
        "create",
        listOf("Landroid/content/Context;"),
        "Lre/e;"
    )
    methods.forEach {
        it.addInstructions(0, "sget-object v0, Lre/e;->a:Lre/e;\nreturn-object v0")
    }
}

private fun BytecodePatchContext.neutralizeAndroidIdInAccountManager() {
    val methods = matchingMethods(
        "Lcr/d;",
        "<init>",
        listOf("Landroid/content/Context;", "Lcom/adobe/scan/android/ScanApplication;"),
        "V"
    )
    methods.forEach { method ->
        val impl = method.implementation
            ?: throw PatchException("Missing implementation for Lcr/d;-><init>")
        val getStringIndex = impl.instructions.indexOfFirst {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Landroid/provider/Settings\$Secure;" &&
                ref.name == "getString"
        }
        if (getStringIndex == -1) {
            throw PatchException("Missing Settings.Secure.getString in Lcr/d;-><init>")
        }
        val moveResult = impl.instructions.getOrNull(getStringIndex + 1) as? OneRegisterInstruction
            ?: throw PatchException("Expected move-result-object after Settings.Secure.getString in Lcr/d;-><init>")
        method.addInstructions(getStringIndex + 2, "const/4 v${moveResult.registerA}, 0x0")
    }
}

private fun BytecodePatchContext.patchRateTheAppDialog() {
    val methods = matchingMethods("Lzq/ha;", "onCreate", listOf("Landroid/os/Bundle;"), "V")
    methods.forEach {
        it.addInstructions(
            0,
            """
            invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V
            return-void
            """.trimIndent()
        )
    }
}

private fun BytecodePatchContext.hideTelemetrySettings() {
    val settingsFragment = mutableClassDefByOrNull("Ljt/d1;")
        ?: throw PatchException("PreferencesFragment not found")
    val preferenceLoader = settingsFragment.methods.singleOrNull {
        it.name == "E" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;") &&
            it.returnType == "V" &&
            it.implementation != null
    } ?: throw PatchException("PreferencesFragment preference loader not found")
    val instructions = preferenceLoader.implementation?.instructions
        ?: throw PatchException("PreferencesFragment preference loader has no implementation")
    val loadIndex = instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_VIRTUAL &&
            reference?.definingClass == "Landroidx/preference/b;" &&
            reference.name == "F" &&
            reference.parameterTypes.map(CharSequence::toString) == listOf("I", "Ljava/lang/String;") &&
            reference.returnType == "V"
    }
    if (loadIndex < 0) {
        throw PatchException("Preferences XML loader invocation not found")
    }
    preferenceLoader.addInstructions(
        loadIndex + 1,
        """
        const v0, 0x7f141f4b
        invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;
        move-result-object v0
        invoke-virtual {p0, v0}, Landroidx/preference/b;->o(Ljava/lang/String;)Landroidx/preference/Preference;
        move-result-object v0
        iget-object v0, v0, Landroidx/preference/Preference;->J:Landroidx/preference/PreferenceGroup;
        const/4 p1, 0x0
        invoke-virtual {v0, p1}, Landroidx/preference/Preference;->C(Z)V
        """.trimIndent()
    )
}

private fun BytecodePatchContext.patchCrashReportsDialog() {
    patchNullObjectMethod(
        "Lcom/adobe/scan/android/b${'$'}a;",
        "a",
        listOf("Lcom/adobe/scan/android/SplashActivity;", "Lzq/xf;")
    )
    val dialogOnCreateMethods = matchingMethods("Lcom/adobe/scan/android/b;", "onCreate", listOf("Landroid/os/Bundle;"), "V")
    dialogOnCreateMethods.forEach {
        it.addInstructions(
            0,
            """
            invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V
            return-void
            """.trimIndent()
        )
    }
}
