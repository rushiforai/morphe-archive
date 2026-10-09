package app.aidan.patches.fizz.tracking

import app.aidan.patches.fizz.shared.COMPATIBILITY_FIZZ
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch

private const val ZEROED_ADVERTISING_ID = "00000000-0000-0000-0000-000000000000"

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
        // Layer 1: PairIP / Google Play Integrity Protection Bypass
        patchVoidMethod("Lcom/pairip/licensecheck/LicenseClient;", "checkLicense", listOf("Landroid/content/Context;"))

        // Layer 2: First-Party Analytics Event Logger & Batch Dispatcher
        patchVoidMethod("Lra/ga;", "a", listOf("Lra/q9;", "Z"))
        patchVoidMethod("Lra/ga;", "e", emptyList())
        patchVoidMethod("Lra/ga;", "f", emptyList())
        val flushMethods = matchingMethods("Lra/ga;", "d", listOf("Z", "Lql/c;"), "Ljava/lang/Object;")
        flushMethods.forEach { it.addInstructions(0, "sget-object v0, Lkl/z;->a:Lkl/z;\nreturn-object v0") }
        val batchMethods = matchingMethods("Lra/ga;", "g", listOf("Lfb/c;", "Lql/c;"), "Ljava/lang/Object;")
        batchMethods.forEach { it.addInstructions(0, "sget-object v0, Lkl/z;->a:Lkl/z;\nreturn-object v0") }

        patchNullObjectMethod("Ljc/k0;", "a", listOf("Ljava/util/List;", "Lql/c;"))
        patchAllVoidMethods("Lec/j;", "a")

        // Layer 3: Mixpanel Analytics SDK
        patchAllVoidMethods("Lfk/u;", "d", "l")
        patchVoidMethod("Lfk/u;", "i", listOf("Ljava/lang/String;", "Z"))
        patchVoidMethod("Lfk/u;", "k", listOf("Lorg/json/JSONObject;"))
        patchVoidMethod("Lfk/u;", "m", listOf("Lorg/json/JSONObject;", "Ljava/lang/String;", "Z"))
        patchNullObjectMethod("Lfk/u;", "b", listOf("Ljava/lang/String;", "Lorg/json/JSONObject;", "Ljava/lang/Long;"))
        patchBooleanMethod("Lfk/u;", "h", emptyList(), true)
        patchVoidMethod("Lra/ya;", "c", emptyList())

        // Layer 4: Airbridge Attribution & Mobile Measurement SDK
        patchBooleanMethod("Lsa/l0;", "f", listOf("Landroid/content/Intent;", "Lhe/d;"), false)
        patchAllVoidMethods("Lsa/l0;", "a", "b", "c", "d", "e")

        patchAllVoidMethods(
            "Lco/ab180/airbridge/Airbridge;",
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
        patchBooleanMethod("Lco/ab180/airbridge/Airbridge;", "isTrackingEnabled", emptyList(), false)
        patchBooleanMethod("Lco/ab180/airbridge/Airbridge;", "isInAppPurchaseTrackingEnabled", emptyList(), false)
        patchBooleanMethod("Lco/ab180/airbridge/Airbridge;", "isSDKEnabled", emptyList(), false)

        // Layer 5: Adjust Attribution & Tracking SDK
        patchBooleanMethod("Lsa/b;", "g", listOf("Landroid/content/Context;"), false)
        patchBooleanMethod("Lsa/b;", "f", listOf("Landroid/content/Intent;", "Lhe/d;"), false)
        patchAllVoidMethods("Lsa/b;", "a", "b", "c", "d", "e")
        patchAllVoidMethods(
            "Lcom/adjust/sdk/Adjust;",
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
        val aaidClientMethods = matchingMethods(
            "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;",
            "getAdvertisingIdInfo",
            listOf("Landroid/content/Context;"),
            "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;"
        )
        aaidClientMethods.forEach {
            it.addInstructions(
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
        patchConstStringMethod("Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;", "getId", ZEROED_ADVERTISING_ID)
        patchBooleanMethod("Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;", "isLimitAdTrackingEnabled", emptyList(), true)

        val aaidRegistrarMethods = matchingMethods("Lsa/n0;", "invokeSuspend", listOf("Ljava/lang/Object;"), "Ljava/lang/Object;")
        aaidRegistrarMethods.forEach {
            it.addInstructions(0, "sget-object v0, Lkl/z;->a:Lkl/z;\nreturn-object v0")
        }

        // Layer 7: Sentry Error Reporting & Telemetry (Guarded by disableCrashReporting)
        if (disableCrashReporting.value != false) {
            patchVoidMethod("Lec/p1;", "b", listOf("Lcom/fizzsocial/fizz/FizzApplication;"))
            patchBooleanMethod("Lec/p1;", "isEnabled", emptyList(), false)
            patchVoidMethod("Lio/sentry/android/core/s1;", "b", listOf("Landroid/content/Context;", "Lio/sentry/android/core/y;", "Lio/sentry/k4;"))
        }

        // Layer 8: Silent DM Screenshots (Guarded by silentScreenshots)
        if (silentScreenshots.value != false) {
            val screenshotWorkerMethods = matchingMethods("Lsd/a2;", "invokeSuspend", listOf("Ljava/lang/Object;"), "Ljava/lang/Object;")
            screenshotWorkerMethods.forEach {
                it.addInstructions(0, "sget-object v0, Lkl/z;->a:Lkl/z;\nreturn-object v0")
            }

            val chatRepoScreenshotMethods = matchingMethods("Ljc/n2;", "q", listOf("Ljava/lang/String;", "Lql/c;"), "Ljava/lang/Object;")
            chatRepoScreenshotMethods.forEach {
                it.addInstructions(
                    0,
                    """
                    const/4 v0, 0x0
                    new-instance v1, Lcb/l;
                    invoke-direct {v1, v0}, Lcb/l;-><init>(Ljava/lang/Object;)V
                    return-object v1
                    """.trimIndent()
                )
            }
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
    methodName: String,
    parameterTypes: List<String>,
    value: Boolean
) {
    val methods = matchingMethods(classDescriptor, methodName, parameterTypes, "Z")
    val constant = if (value) "0x1" else "0x0"
    methods.forEach { it.addInstructions(0, "const/4 v0, $constant\nreturn v0") }
}

private fun BytecodePatchContext.patchNullObjectMethod(
    classDescriptor: String,
    methodName: String,
    parameterTypes: List<String>
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor)
        ?: throw PatchException("Missing required class $classDescriptor")
    val methods = mutableClass.methods.filter {
        it.name == methodName &&
            it.parameterTypes.map(CharSequence::toString) == parameterTypes &&
            it.returnType.startsWith("L") &&
            it.implementation != null
    }
    if (methods.isEmpty()) {
        throw PatchException("Missing required object method $classDescriptor->$methodName")
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
            it.parameterTypes.map(CharSequence::toString) == parameterTypes &&
            it.returnType == returnType &&
            it.implementation != null
    }
    ?.takeIf { it.isNotEmpty() }
    ?: throw PatchException("Missing required method $classDescriptor->$methodName(${parameterTypes.joinToString()})$returnType")
