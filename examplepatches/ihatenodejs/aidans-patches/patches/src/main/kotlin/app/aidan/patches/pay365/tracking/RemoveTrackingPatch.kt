package app.aidan.patches.pay365.tracking

import app.aidan.patches.pay365.shared.COMPATIBILITY_365_PAY
import app.aidan.patches.shared.disableOptionalVoidMethods
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val removeTrackingPatch = bytecodePatch(
    name = "Remove Tracking",
    description = "Neutralizes diagnostic telemetry, event logging, and user tracking (Firebase Analytics, Crashlytics, Instana APM, Branch Metrics, and OneSignal session and outcome tracking).",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_365_PAY)

    val disableFirebaseAnalytics = booleanOption(
        key = "disableFirebaseAnalytics",
        default = true,
        title = "Disable Firebase Analytics",
        description = "Blocks React Native Firebase Analytics and Google Play AppMeasurement event tracking."
    )

    val disableCrashlytics = booleanOption(
        key = "disableCrashlytics",
        default = true,
        title = "Disable Firebase Crashlytics",
        description = "Neutralizes Firebase Crashlytics crash reporting and diagnostic logging."
    )

    val disableInstana = booleanOption(
        key = "disableInstana",
        default = true,
        title = "Disable Instana APM",
        description = "Neutralizes Instana End-User Monitoring (EUM) and background telemetry workers."
    )

    val disableBranch = booleanOption(
        key = "disableBranch",
        default = true,
        title = "Disable Branch Metrics",
        description = "Neutralizes Branch Metrics attribution and event tracking."
    )

    val disableOneSignalTracking = booleanOption(
        key = "disableOneSignalTracking",
        default = true,
        title = "Disable OneSignal Telemetry",
        description = "Blocks OneSignal custom events, session outcomes, tags, and location tracking."
    )

    execute {
        if (disableFirebaseAnalytics.value != false) {
            resolvePromiseNull(
                "Lio/invertase/firebase/analytics/ReactNativeFirebaseAnalyticsModule;",
                "logEvent",
                "setAnalyticsCollectionEnabled",
                "setUserProperties",
                "setUserId",
                "setUserProperty",
                "setDefaultEventParameters",
                "resetAnalyticsData",
                "setConsent"
            )
            disableOptionalVoidMethods(
                "Lcom/google/android/gms/measurement/AppMeasurement;",
                "logEventInternal"
            )
            disableOptionalVoidMethods(
                "Lcom/google/firebase/analytics/FirebaseAnalytics;",
                "logEvent",
                "setAnalyticsCollectionEnabled",
                "setUserId",
                "setUserProperty",
                "resetAnalyticsData"
            )
        }

        if (disableCrashlytics.value != false) {
            disableOptionalVoidMethods(
                "Lio/invertase/firebase/crashlytics/ReactNativeFirebaseCrashlyticsModule;",
                "log",
                "recordError",
                "sendUnsentReports",
                "deleteUnsentReports"
            )
            resolvePromiseNull(
                "Lio/invertase/firebase/crashlytics/ReactNativeFirebaseCrashlyticsModule;",
                "logPromise",
                "recordErrorPromise",
                "setCrashlyticsCollectionEnabled",
                "setUserId",
                "setAttribute",
                "setAttributes"
            )
            disableOptionalVoidMethods(
                "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
                "log",
                "recordException",
                "sendUnsentReports",
                "deleteUnsentReports",
                "setCustomKey",
                "setUserId"
            )
            forceCrashlyticsDisabled()
        }

        if (disableInstana.value != false) {
            disableOptionalVoidMethods(
                "Lcom/instana/rn/InstanaEumModule;",
                "setup",
                "reportEvent",
                "setUserID",
                "setUserEmail",
                "setUserName",
                "setMeta",
                "setView",
                "setCollectionEnabled"
            )
            stubInstanaWorkers()
        }

        if (disableBranch.value != false) {
            resolvePromiseNull(
                "Lio/branch/rnbranch/RNBranchModule;",
                "logEvent",
                "setIdentityAsync",
                "registerView",
                "createUniversalObject",
                "generateShortUrl",
                "getBranchQRCode",
                "getFirstReferringParams",
                "getLatestReferringParams",
                "lastAttributedTouchData",
                "redeemInitSessionResult",
                "showShareSheet"
            )
            resolvePromiseBoolean(
                "Lio/branch/rnbranch/RNBranchModule;",
                "isTrackingDisabled",
                true
            )
            disableOptionalVoidMethods(
                "Lio/branch/rnbranch/RNBranchModule;",
                "initSession",
                "reInitSession",
                "onNewIntent",
                "getAutoInstance",
                "disableTracking",
                "setIdentity",
                "addFacebookPartnerParameter",
                "setRequestMetadataKey",
                "clearPartnerParameters",
                "notifyNativeToInit",
                "logout",
                "setPreinstallCampaign",
                "setPreinstallPartner"
            )
            disableOptionalVoidMethods(
                "LSj/d;",
                "o0"
            )
        }

        if (disableOneSignalTracking.value != false) {
            disableOptionalVoidMethods(
                "Lcom/onesignal/rnonesignalandroid/RNOneSignal;",
                "trackEvent",
                "addOutcome",
                "addOutcomeWithValue",
                "addUniqueOutcome",
                "addTag",
                "addTags",
                "setLocationShared"
            )
            disableOptionalVoidMethods(
                "Lcom/onesignal/session/internal/SessionManager;",
                "addOutcome",
                "addOutcomeWithValue",
                "addUniqueOutcome"
            )
            disableOptionalVoidMethods(
                "Lcom/onesignal/location/internal/controller/impl/GmsLocationController;",
                "setLocationAndFire",
                "subscribe"
            )
            suppressLocationController()
            returnNullObject(
                "Lcom/onesignal/location/internal/controller/impl/GmsLocationController;",
                "getLastLocation",
                "Landroid/location/Location;"
            )
        }
    }
}

private fun BytecodePatchContext.resolvePromiseNull(
    classDescriptor: String,
    vararg methodNames: String
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor) ?: return
    val methodSet = methodNames.toSet()
    for (method in mutableClass.methods) {
        if (method.name in methodSet && method.returnType == "V" && method.implementation != null) {
            val params = method.parameterTypes
            val promiseIndex = params.indexOf("Lcom/facebook/react/bridge/Promise;")
            if (promiseIndex != -1) {
                val promiseReg = "p${promiseIndex + 1}"
                method.addInstructions(
                    0,
                    """
                    const/4 v0, 0x0
                    invoke-interface {$promiseReg, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                    return-void
                    """.trimIndent()
                )
            }
        }
    }
}
private fun BytecodePatchContext.resolvePromiseBoolean(
    classDescriptor: String,
    methodName: String,
    value: Boolean
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor) ?: return
    val boolObj = if (value) "Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;" else "Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;"
    for (method in mutableClass.methods) {
        if (method.name == methodName && method.returnType == "V" && method.implementation != null) {
            val params = method.parameterTypes
            val promiseIndex = params.indexOf("Lcom/facebook/react/bridge/Promise;")
            if (promiseIndex != -1) {
                val promiseReg = "p${promiseIndex + 1}"
                method.addInstructions(
                    0,
                    """
                    sget-object v0, $boolObj
                    invoke-interface {$promiseReg, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                    return-void
                    """.trimIndent()
                )
            }
        }
    }
}

private fun BytecodePatchContext.forceCrashlyticsDisabled() {
    val crashlyticsClass = mutableClassDefByOrNull("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;")
    if (crashlyticsClass != null) {
        for (method in crashlyticsClass.methods) {
            if (method.name == "isCrashlyticsCollectionEnabled" && method.returnType == "Z" && method.implementation != null) {
                method.addInstructions(
                    0,
                    """
                    const/4 v0, 0x0
                    return v0
                    """.trimIndent()
                )
            } else if (method.name == "setCrashlyticsCollectionEnabled" && method.returnType == "V" && method.implementation != null) {
                if (method.parameterTypes == listOf("Z")) {
                    method.addInstructions(0, "const/4 p1, 0x0")
                } else if (method.parameterTypes == listOf("Ljava/lang/Boolean;")) {
                    method.addInstructions(0, "sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;")
                }
            }
        }
    }

    val initProviderClass = mutableClassDefByOrNull("Lio/invertase/firebase/crashlytics/ReactNativeFirebaseCrashlyticsInitProvider;")
    if (initProviderClass != null) {
        for (method in initProviderClass.methods) {
            if (method.name == "a" && method.returnType == "Z" && method.implementation != null) {
                method.addInstructions(
                    0,
                    """
                    const/4 v0, 0x0
                    return v0
                    """.trimIndent()
                )
            }
        }
    }
}

private fun BytecodePatchContext.stubInstanaWorkers() {
    val isObfuscatedResult = mutableClassDefByOrNull("Landroidx/work/p\$a;") != null
    val resultDescriptor = if (isObfuscatedResult) "Landroidx/work/p\$a;" else "Landroidx/work/ListenableWorker\$Result;"
    val successInvoke = if (isObfuscatedResult) {
        "invoke-static {}, Landroidx/work/p\$a;->c()Landroidx/work/p\$a;"
    } else {
        "invoke-static {}, Landroidx/work/ListenableWorker\$Result;->success()Landroidx/work/ListenableWorker\$Result;"
    }

    val eventWorker = mutableClassDefByOrNull("Lcom/instana/android/core/event/worker/EventWorker;")
    if (eventWorker != null) {
        val doWorkMethod = eventWorker.methods.firstOrNull {
            it.name == "doWork" && (it.returnType == "Ljava/lang/Object;" || it.returnType == resultDescriptor) && it.implementation != null
        } ?: throw PatchException("Missing doWork in EventWorker")

        doWorkMethod.addInstructions(
            0,
            """
            $successInvoke
            move-result-object v0
            return-object v0
            """.trimIndent()
        )
    }

    val networkWorker = mutableClassDefByOrNull("Lcom/instana/android/performance/network/NetworkUsageWorker;")
    if (networkWorker != null) {
        val workerMethod = networkWorker.methods.firstOrNull {
            (it.name == "a" || it.name == "b" || it.name == "doWork") &&
                it.returnType == resultDescriptor &&
                it.implementation != null
        } ?: throw PatchException("Missing worker entrypoint in NetworkUsageWorker")

        workerMethod.addInstructions(
            0,
            """
            $successInvoke
            move-result-object v0
            return-object v0
            """.trimIndent()
        )
    }
}

private fun BytecodePatchContext.suppressLocationController() {
    val locationController = mutableClassDefByOrNull("Lcom/onesignal/location/internal/controller/impl/GmsLocationController;") ?: return
    for (method in locationController.methods) {
        if (method.name == "start" && (method.returnType == "Ljava/lang/Object;" || method.returnType == "Z") && method.implementation != null) {
            if (method.returnType == "Z") {
                method.addInstructions(
                    0,
                    """
                    const/4 v0, 0x0
                    return v0
                    """.trimIndent()
                )
            } else {
                method.addInstructions(
                    0,
                    """
                    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                    return-object v0
                    """.trimIndent()
                )
            }
        }
    }
}

private fun BytecodePatchContext.returnNullObject(
    classDescriptor: String,
    methodName: String,
    returnType: String
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor) ?: return
    for (method in mutableClass.methods) {
        if (method.name == methodName && method.returnType == returnType && method.implementation != null) {
            method.addInstructions(
                0,
                """
                const/4 v0, 0x0
                return-object v0
                """.trimIndent()
            )
        }
    }
}
