package app.aidan.patches.adobescan.ads

import app.aidan.patches.adobescan.shared.COMPATIBILITY_ADOBE_SCAN
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val ZEROED_ADVERTISING_ID = "00000000-0000-0000-0000-000000000000"

@Suppress("unused")
val removeAdsAndTrackingPatch = bytecodePatch(
    name = "Remove Ads and Tracking",
    description = "Disables Adobe, Branch, Facebook, Creative SDK, and Crashlytics telemetry; removes in-app ads and review prompts; blocks install-referrer collection; and zeroes the Google Play Advertising ID.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ADOBE_SCAN)

    val removeSettings = booleanOption(
        key = "removeSettings",
        default = true,
        title = "Remove Settings",
        description = "Removes the Send usage info and Send crash info preferences and suppresses the crash reports dialog, whose telemetry backends are disabled by this patch."
    )

    execute {
        // Adobe Experience Platform MobileCore and Target.
        patchVoidMethod("Lcom/adobe/marketing/mobile/MobileCore;", "h", listOf("Lcom/adobe/marketing/mobile/MobilePrivacyStatus;"))
        patchVoidMethod("Lcom/adobe/marketing/mobile/MobileCore;", "i", listOf("Ljava/lang/String;", "Ljava/util/HashMap;"))
        patchVoidMethod("Lcom/adobe/marketing/mobile/MobileCore;", "j", listOf("Ljava/util/HashMap;"))
        patchVoidMethod("Lcom/adobe/marketing/mobile/Target;", "a", listOf("Ljava/util/ArrayList;", "Lrp/n;"))

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

        // Adobe analytics-monitoring broadcasts and Crashlytics reporting.
        patchVoidMethod("Lbr/d;", "a", listOf("Ljava/lang/String;", "Ljava/util/Map;"))
        patchVoidMethod("Lbr/j;", "r", listOf("Ljava/lang/String;"))
        forceCrashReportingDisabled()
        patchAllVoidMethods(
            "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
            "deleteUnsentReports",
            "log",
            "recordException",
            "sendUnsentReports",
            "setCustomKey",
            "setCustomKeys",
            "setUserId"
        )

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

        // Branch attribution and deep-link telemetry.
        patchVoidMethod("Lg90/e;", "r", listOf("Lcom/adobe/scan/android/ScanApplication;"))
        patchVoidMethod("Lg90/e0;", "f", listOf("Lg90/z;"))
        setBranchTrackingDisabled()

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

        // In-app review prompts.
        patchBooleanMethod("Lcom/adobe/scan/android/util/l;", "z1", emptyList(), false)
        patchRateTheAppDialog()
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
    val mutableClass = mutableClassDefByOrNull(classDescriptor) ?: return
    mutableClass.methods
        .filter {
            it.name == methodName &&
                it.parameterTypes.map(CharSequence::toString) == parameterTypes &&
                it.returnType == "V" &&
                it.implementation != null
        }
        .forEach { it.addInstructions(0, "return-void") }
}

private fun BytecodePatchContext.patchAllVoidMethods(classDescriptor: String, methodName: String) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor)
        ?: throw PatchException("Missing required class $classDescriptor")
    val methods = mutableClass.methods.filter {
        it.name == methodName && it.returnType == "V" && it.implementation != null
    }
    if (methods.isEmpty()) {
        throw PatchException("Missing required void method $classDescriptor->$methodName")
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
    val methods = matchingMethods(classDescriptor, methodName, parameterTypes, "Z")
    val constant = if (value) "0x1" else "0x0"
    methods.forEach { it.addInstructions(0, "const/4 v0, $constant\nreturn v0") }
}

private fun BytecodePatchContext.patchIntMethod(
    classDescriptor: String,
    methodName: String,
    parameterTypes: List<String>,
    value: Int
) {
    val methods = matchingMethods(classDescriptor, methodName, parameterTypes, "I")
    methods.forEach { it.addInstructions(0, "const/4 v0, 0x$value\nreturn v0") }
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
    methods.forEach {
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
        const/4 v1, 0x0
        invoke-virtual {v0, v1}, Landroidx/preference/Preference;->C(Z)V
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
