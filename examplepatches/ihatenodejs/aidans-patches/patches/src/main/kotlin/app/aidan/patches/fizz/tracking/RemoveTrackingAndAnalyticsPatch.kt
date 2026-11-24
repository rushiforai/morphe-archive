package app.aidan.patches.fizz.tracking

import app.aidan.patches.fizz.shared.COMPATIBILITY_FIZZ
import app.aidan.patches.fizz.shared.fizzTargets
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

private const val ZEROED_ADVERTISING_ID = "00000000-0000-0000-0000-000000000000"
private const val AIRBRIDGE_SDK = "Lco/ab180/airbridge/Airbridge;"
private const val ADJUST_SDK = "Lcom/adjust/sdk/Adjust;"
private const val ADVERTISING_ID_CLIENT = "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient"

/** Method selector inside a resolved class. The expected return type is asserted per call. */
private data class MethodSpec(val name: String, val params: List<String> = emptyList())

/**
 * One attribution/measurement wrapper implementation (Airbridge or Adjust) as reached through the
 * composite attribution interface.
 */
private data class AttributionWrapper(
    val descriptor: String,
    val noOpVoidMethods: List<String>,
    val forceFalseMethods: List<MethodSpec>,
)

/**
 * Telemetry targets for one supported Fizz build. Fizz re-obfuscates its own classes on every
 * release, so every supported version needs its own verified descriptors and method names.
 */
private data class TrackingTargets(
    // Layer 2: first-party analytics event pipeline
    val analytics: String,
    val logEvent: MethodSpec,
    val flushBufferedEvents: MethodSpec,
    val resetAnalytics: MethodSpec,
    val dispatchBatch: MethodSpec,
    val sendBatch: MethodSpec,
    val analyticsEventRepository: String,
    val analyticsEventBuilder: MethodSpec,
    val deviceDiagnostics: String,
    // Layer 3: Mixpanel SDK wrapper and identity store
    val mixpanel: String,
    val mixpanelFlushMethods: List<String>,
    val mixpanelIdentify: MethodSpec,
    val mixpanelTrack: MethodSpec,
    val mixpanelTrackTimed: MethodSpec,
    val mixpanelPeople: MethodSpec,
    val mixpanelIsOptedOut: MethodSpec,
    val identityStore: String,
    val identityReset: MethodSpec,
    // Layers 4 and 5: Airbridge and Adjust wrappers
    val attributionWrappers: List<AttributionWrapper>,
    // Layer 6: Google Advertising ID registrar and Kotlin Unit singleton
    val advertisingIdRegistrar: String,
    val unitSingleton: String,
    // Layer 7: Sentry wrapper and Sentry Android initializer
    val sentryWrapper: String,
    val sentrySdkInitializer: String,
    val sentrySdkInit: MethodSpec,
    // Layer 8: DM screenshot suppression
    val screenshotWorker: String,
    val chatRepository: String,
    val chatScreenshotUpload: MethodSpec,
    val resultSuccess: String,
)

private val TRACKING_TARGETS_1_54_0 = TrackingTargets(
    analytics = "Lra/ga;",
    logEvent = MethodSpec("a", listOf("Lra/q9;", "Z")),
    flushBufferedEvents = MethodSpec("e"),
    resetAnalytics = MethodSpec("f"),
    dispatchBatch = MethodSpec("d", listOf("Z", "Lql/c;")),
    sendBatch = MethodSpec("g", listOf("Lfb/c;", "Lql/c;")),
    analyticsEventRepository = "Ljc/k0;",
    analyticsEventBuilder = MethodSpec("a", listOf("Ljava/util/List;", "Lql/c;")),
    deviceDiagnostics = "Lec/j;",
    mixpanel = "Lfk/u;",
    mixpanelFlushMethods = listOf("d", "l"),
    mixpanelIdentify = MethodSpec("i", listOf("Ljava/lang/String;", "Z")),
    mixpanelTrack = MethodSpec("k", listOf("Lorg/json/JSONObject;")),
    mixpanelTrackTimed = MethodSpec("m", listOf("Lorg/json/JSONObject;", "Ljava/lang/String;", "Z")),
    mixpanelPeople = MethodSpec("b", listOf("Ljava/lang/String;", "Lorg/json/JSONObject;", "Ljava/lang/Long;")),
    mixpanelIsOptedOut = MethodSpec("h"),
    identityStore = "Lra/ya;",
    identityReset = MethodSpec("c"),
    attributionWrappers = listOf(
        AttributionWrapper(
            descriptor = "Lsa/l0;",
            noOpVoidMethods = listOf("a", "b", "c", "d", "e"),
            forceFalseMethods = listOf(MethodSpec("f", listOf("Landroid/content/Intent;", "Lhe/d;"))),
        ),
        AttributionWrapper(
            descriptor = "Lsa/b;",
            noOpVoidMethods = listOf("a", "b", "c", "d", "e"),
            forceFalseMethods = listOf(
                MethodSpec("g", listOf("Landroid/content/Context;")),
                MethodSpec("f", listOf("Landroid/content/Intent;", "Lhe/d;")),
            ),
        ),
    ),
    advertisingIdRegistrar = "Lsa/n0;",
    unitSingleton = "Lkl/z;",
    sentryWrapper = "Lec/p1;",
    sentrySdkInitializer = "Lio/sentry/android/core/s1;",
    sentrySdkInit = MethodSpec(
        "b",
        listOf("Landroid/content/Context;", "Lio/sentry/android/core/y;", "Lio/sentry/k4;"),
    ),
    screenshotWorker = "Lsd/a2;",
    chatRepository = "Ljc/n2;",
    chatScreenshotUpload = MethodSpec("q", listOf("Ljava/lang/String;", "Lql/c;")),
    resultSuccess = "Lcb/l;",
)

private val TRACKING_TARGETS_1_72_0 = TrackingTargets(
    analytics = "Lpa/ue;",
    logEvent = MethodSpec("a", listOf("Lpa/pd;", "Z")),
    flushBufferedEvents = MethodSpec("f"),
    resetAnalytics = MethodSpec("g"),
    dispatchBatch = MethodSpec("e", listOf("Z", "Lzm/c;")),
    sendBatch = MethodSpec("h", listOf("Leb/c;", "Lzm/c;")),
    analyticsEventRepository = "Loc/s0;",
    analyticsEventBuilder = MethodSpec("a", listOf("Ljava/util/List;", "Lzm/c;")),
    deviceDiagnostics = "Lhc/l;",
    mixpanel = "Lml/u;",
    mixpanelFlushMethods = listOf("d", "k"),
    mixpanelIdentify = MethodSpec("h", listOf("Ljava/lang/String;", "Z")),
    mixpanelTrack = MethodSpec("j", listOf("Lorg/json/JSONObject;")),
    mixpanelTrackTimed = MethodSpec("l", listOf("Lorg/json/JSONObject;", "Ljava/lang/String;", "Z")),
    mixpanelPeople = MethodSpec("b", listOf("Ljava/lang/String;", "Lorg/json/JSONObject;", "Ljava/lang/Long;")),
    mixpanelIsOptedOut = MethodSpec("g"),
    identityStore = "Lpa/tf;",
    identityReset = MethodSpec("c"),
    attributionWrappers = listOf(
        AttributionWrapper(
            descriptor = "Lqa/n0;",
            noOpVoidMethods = listOf("a", "d", "e", "f", "g"),
            forceFalseMethods = listOf(MethodSpec("i", listOf("Landroid/content/Intent;", "Loa/x0;"))),
        ),
        AttributionWrapper(
            descriptor = "Lqa/b;",
            noOpVoidMethods = listOf("a", "d", "e", "f", "g"),
            forceFalseMethods = listOf(
                MethodSpec("j", listOf("Landroid/content/Context;")),
                MethodSpec("i", listOf("Landroid/content/Intent;", "Loa/x0;")),
            ),
        ),
    ),
    advertisingIdRegistrar = "Lqa/p0;",
    unitSingleton = "Ltm/z;",
    sentryWrapper = "Lhc/d2;",
    sentrySdkInitializer = "Lio/sentry/android/core/r1;",
    sentrySdkInit = MethodSpec(
        "b",
        listOf("Landroid/content/Context;", "Lio/sentry/android/core/x;", "Lio/sentry/k4;"),
    ),
    screenshotWorker = "Lde/b3;",
    chatRepository = "Loc/m3;",
    chatScreenshotUpload = MethodSpec("s", listOf("Ljava/lang/String;", "Lzm/c;")),
    resultSuccess = "Lbb/m;",
)

@Suppress("unused")
val removeTrackingAndAnalyticsPatch = bytecodePatch(
    name = "Remove Tracking and Analytics",
    description = "Neutralizes first-party client event tracking, Mixpanel analytics, Airbridge and Adjust attribution SDKs, Google Advertising ID (AAID) collection, and bypasses PairIP Play Integrity verification, with options for silent DM screenshots and Sentry telemetry removal.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_FIZZ)

    val silentScreenshots = booleanOption(
        key = "silentScreenshots",
        default = true,
        title = "Silent Screenshots",
        description = "Suppresses screenshot notification dispatches to chat counterparts in direct message conversations."
    )

    val disableCrashReporting = booleanOption(
        key = "disableCrashReporting",
        default = true,
        title = "Disable Crash Reporting",
        description = "Neutralizes Sentry crash reporting, performance tracing, and operational session telemetry."
    )

    execute {
        val targets = fizzTargets("1.54.0" to TRACKING_TARGETS_1_54_0, "1.72.0" to TRACKING_TARGETS_1_72_0)

        // Layer 1: PairIP / Google Play Integrity Protection Bypass
        patchVoidMethod(
            "Lcom/pairip/licensecheck/LicenseClient;",
            MethodSpec("checkLicense", listOf("Landroid/content/Context;"))
        )

        // Layer 2: First-Party Analytics Event Logger & Batch Dispatcher
        patchVoidMethod(targets.analytics, targets.logEvent)
        patchVoidMethod(targets.analytics, targets.flushBufferedEvents)
        patchVoidMethod(targets.analytics, targets.resetAnalytics)
        matchingMethods(targets.analytics, targets.dispatchBatch, "Ljava/lang/Object;").forEach {
            it.addInstructions(0, returnUnit(targets.unitSingleton))
        }
        matchingMethods(targets.analytics, targets.sendBatch, "Ljava/lang/Object;").forEach {
            it.addInstructions(0, returnUnit(targets.unitSingleton))
        }

        patchNullObjectMethod(targets.analyticsEventRepository, targets.analyticsEventBuilder)
        patchAllVoidMethods(targets.deviceDiagnostics, "a")

        // Layer 3: Mixpanel Analytics SDK
        patchAllVoidMethods(targets.mixpanel, *targets.mixpanelFlushMethods.toTypedArray())
        patchVoidMethod(targets.mixpanel, targets.mixpanelIdentify)
        patchVoidMethod(targets.mixpanel, targets.mixpanelTrack)
        patchVoidMethod(targets.mixpanel, targets.mixpanelTrackTimed)
        patchNullObjectMethod(targets.mixpanel, targets.mixpanelPeople)
        patchBooleanMethod(targets.mixpanel, targets.mixpanelIsOptedOut, true)
        patchVoidMethod(targets.identityStore, targets.identityReset)

        // Layer 4: Airbridge Attribution & Mobile Measurement SDK
        targets.attributionWrappers.forEach { wrapper ->
            patchAllVoidMethods(wrapper.descriptor, *wrapper.noOpVoidMethods.toTypedArray())
            wrapper.forceFalseMethods.forEach { patchBooleanMethod(wrapper.descriptor, it, false) }
        }

        patchAllVoidMethods(
            AIRBRIDGE_SDK,
            "initializeSDK",
            "trackEvent",
            "startTracking",
            "startInAppPurchaseTracking",
            "stopTracking",
            "stopInAppPurchaseTracking",
            "clearUser",
            "clearDeviceAlias",
            "clearUserAlias",
            "clearUserAttributes",
            "clearUserEmail",
            "clearUserID",
            "clearUserPhone",
            "allowTrackingItem",
            "blockTrackingItem",
            "disableSDK",
            "enableSDK",
            "registerPushToken",
            "removeDeviceAlias",
            "removeUserAlias",
            "removeUserAttribute",
            "setDeviceAlias",
            "setUserAlias",
            "setUserAttribute",
            "setUserEmail",
            "setUserID",
            "setUserPhone",
            "setWebInterface"
        )
        patchBooleanMethod(AIRBRIDGE_SDK, MethodSpec("isTrackingEnabled"), false)
        patchBooleanMethod(AIRBRIDGE_SDK, MethodSpec("isInAppPurchaseTrackingEnabled"), false)
        patchBooleanMethod(AIRBRIDGE_SDK, MethodSpec("isSDKEnabled"), false)

        // Layer 5: Adjust Attribution & Tracking SDK
        patchAllVoidMethods(
            ADJUST_SDK,
            "initSdk",
            "trackEvent",
            "trackAdRevenue",
            "trackMeasurementConsent",
            "trackPlayStoreSubscription",
            "trackThirdPartySharing",
            "setPushToken",
            "setReferrer",
            "onResume",
            "onPause",
            "disable",
            "enable",
            "gdprForgetMe",
            "switchToOfflineMode",
            "switchBackToOnlineMode"
        )

        // Layer 6: Google Play Advertising ID (AAID) Neutralization
        val advertisingIdInfo = "$ADVERTISING_ID_CLIENT\$Info;"
        matchingMethods(
            "$ADVERTISING_ID_CLIENT;",
            MethodSpec("getAdvertisingIdInfo", listOf("Landroid/content/Context;")),
            advertisingIdInfo
        ).forEach {
            it.addInstructions(
                0,
                """
                new-instance v0, $advertisingIdInfo
                const-string v1, "$ZEROED_ADVERTISING_ID"
                const/4 v2, 0x1
                invoke-direct {v0, v1, v2}, $advertisingIdInfo-><init>(Ljava/lang/String;Z)V
                return-object v0
                """.trimIndent()
            )
        }
        patchConstStringMethod(advertisingIdInfo, "getId", ZEROED_ADVERTISING_ID)
        patchBooleanMethod(advertisingIdInfo, MethodSpec("isLimitAdTrackingEnabled"), true)

        matchingMethods(
            targets.advertisingIdRegistrar,
            MethodSpec("invokeSuspend", listOf("Ljava/lang/Object;")),
            "Ljava/lang/Object;"
        ).forEach {
            it.addInstructions(0, returnUnit(targets.unitSingleton))
        }

        // Layer 7: Sentry Error Reporting & Telemetry (Guarded by disableCrashReporting)
        if (disableCrashReporting.value != false) {
            patchVoidMethod(
                targets.sentryWrapper,
                MethodSpec("b", listOf("Lcom/fizzsocial/fizz/FizzApplication;"))
            )
            patchBooleanMethod(targets.sentryWrapper, MethodSpec("isEnabled"), false)
            patchVoidMethod(targets.sentrySdkInitializer, targets.sentrySdkInit)
        }

        // Layer 8: Silent DM Screenshots (Guarded by silentScreenshots)
        if (silentScreenshots.value != false) {
            matchingMethods(
                targets.screenshotWorker,
                MethodSpec("invokeSuspend", listOf("Ljava/lang/Object;")),
                "Ljava/lang/Object;"
            ).forEach {
                it.addInstructions(0, returnUnit(targets.unitSingleton))
            }

            matchingMethods(
                targets.chatRepository,
                targets.chatScreenshotUpload,
                "Ljava/lang/Object;"
            ).forEach {
                it.addInstructions(
                    0,
                    """
                    const/4 v0, 0x0
                    new-instance v1, ${targets.resultSuccess}
                    invoke-direct {v1, v0}, ${targets.resultSuccess}-><init>(Ljava/lang/Object;)V
                    return-object v1
                    """.trimIndent()
                )
            }
        }
    }
}

/** Returns kotlin.Unit.INSTANCE, the value a suspending pipeline returns when it does nothing. */
private fun returnUnit(unitSingleton: String) = "sget-object v0, $unitSingleton->a:$unitSingleton\nreturn-object v0"

private fun BytecodePatchContext.patchVoidMethod(classDescriptor: String, method: MethodSpec) {
    matchingMethods(classDescriptor, method, "V").forEach { it.addInstructions(0, "return-void") }
}

private fun BytecodePatchContext.patchAllVoidMethods(classDescriptor: String, vararg methodNames: String) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor)
        ?: throw PatchException("Missing required class $classDescriptor")
    methodNames.forEach { methodName ->
        val methods = mutableClass.methods.filter {
            it.name == methodName && it.returnType == "V" && it.implementation != null
        }
        if (methods.isEmpty()) {
            throw PatchException("Missing required void method $classDescriptor->$methodName")
        }
        methods.forEach { it.addInstructions(0, "return-void") }
    }
}

private fun BytecodePatchContext.patchBooleanMethod(
    classDescriptor: String,
    method: MethodSpec,
    value: Boolean
) {
    val constant = if (value) "0x1" else "0x0"
    matchingMethods(classDescriptor, method, "Z").forEach {
        it.addInstructions(0, "const/4 v0, $constant\nreturn v0")
    }
}

private fun BytecodePatchContext.patchNullObjectMethod(classDescriptor: String, method: MethodSpec) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor)
        ?: throw PatchException("Missing required class $classDescriptor")
    val methods = mutableClass.methods.filter {
        it.name == method.name &&
            it.parameterTypes.map(CharSequence::toString) == method.params &&
            it.returnType.startsWith("L") &&
            it.implementation != null
    }
    if (methods.isEmpty()) {
        throw PatchException("Missing required object method $classDescriptor->$method")
    }
    methods.forEach { it.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0") }
}

private fun BytecodePatchContext.patchConstStringMethod(
    classDescriptor: String,
    methodName: String,
    value: String
) {
    matchingMethods(classDescriptor, MethodSpec(methodName), "Ljava/lang/String;").forEach {
        it.addInstructions(0, "const-string v0, \"$value\"\nreturn-object v0")
    }
}

private fun BytecodePatchContext.matchingMethods(
    classDescriptor: String,
    method: MethodSpec,
    returnType: String
): List<MutableMethod> = mutableClassDefByOrNull(classDescriptor)
    ?.methods
    ?.filter {
        it.name == method.name &&
            it.parameterTypes.map(CharSequence::toString) == method.params &&
            it.returnType == returnType &&
            it.implementation != null
    }
    ?.takeIf { it.isNotEmpty() }
    ?: throw PatchException(
        "Missing required method $classDescriptor->${method.name}(${method.params.joinToString()})$returnType"
    )
