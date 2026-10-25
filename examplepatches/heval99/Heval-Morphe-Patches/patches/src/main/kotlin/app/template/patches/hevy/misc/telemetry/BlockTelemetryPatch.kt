// Ported from kveld9/kveld-morphe-patches (GPL-3.0), patches/hevy/HevyBlockTelemetryPatch.kt: the
// bytecode targets and the Sentry provider part of its manifest purge. Its permission stripping,
// WearOS service and Adjust receiver changes are not ported. getLegacyEvents now resolves an empty
// array (what the method itself returns on error) instead of null.
package app.template.patches.hevy.misc.telemetry

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_HEVY
import app.template.patches.shared.addInstructionsChecked
import org.w3c.dom.Element

// Push (Firebase Messaging) and purchases (RevenueCat) must keep working; nothing here touches them.

private const val SENTRY_MODULE = "Lio/sentry/react/RNSentryModuleImpl;"
private const val ADJUST_PACKAGE_HANDLER = "Lcom/adjust/sdk/PackageHandler;"
private const val FACEBOOK_EVENT_QUEUE = "Lcom/facebook/appevents/AppEventQueue;"
private const val AMPLITUDE_CONTEXT = "Lcom/amplitude/reactnative/AndroidContextProvider;"
private const val AMPLITUDE_MODULE = "Lcom/amplitude/reactnative/AmplitudeReactNativeModule;"
private const val BRANCH = "Lio/branch/referral/Branch;"
private const val PROMISE = "Lcom/facebook/react/bridge/Promise;"

// Sentry's auto-init is already off in the manifest (React Native starts it); these providers
// still run at process start.
private val SENTRY_PROVIDERS = setOf(
    "io.sentry.android.core.SentryInitProvider",
    "io.sentry.android.core.SentryPerformanceProvider",
)

private val disableSentryProvidersPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_HEVY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val providers = doc.getElementsByTagName("provider")
            val disabled = (0 until providers.length)
                .map { providers.item(it) as Element }
                .filter { it.getAttribute("android:name") in SENTRY_PROVIDERS }
                .onEach { it.setAttribute("android:enabled", "false") }
            if (disabled.isEmpty()) throw PatchException("No Sentry providers in AndroidManifest.xml")
        }
    }
}

/**
 * Every concrete method [name] of [type] (all overloads, or only the one taking [parameters]);
 * throws when there is none.
 */
private fun BytecodePatchContext.methods(
    type: String,
    name: String,
    parameters: List<String>? = null,
): List<MutableMethod> =
    mutableClassDefBy(type).methods
        .filter { it.name == name && it.implementation != null }
        .filter { parameters == null || it.parameterTypes.map(CharSequence::toString) == parameters }
        .ifEmpty { throw PatchException("$type.$name(${parameters?.joinToString().orEmpty()}) not found") }

@Suppress("unused")
val blockTelemetryPatch = bytecodePatch(
    name = "Block telemetry & trackers",
    description = "Disables analytics, tracking and crash reporting.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HEVY)

    dependsOn(disableSentryProvidersPatch)

    execute {
        // 1. Sentry: initNativeSdk(ReadableMap, Promise) resolves true, as it does after a
        // successful init, without calling SentryAndroid.init.
        methods(SENTRY_MODULE, "initNativeSdk", listOf("Lcom/facebook/react/bridge/ReadableMap;", PROMISE)).forEach {
            it.addInstructionsChecked(
                0,
                """
                    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                    invoke-interface {p2, v0}, $PROMISE->resolve(Ljava/lang/Object;)V
                    return-void
                """.trimIndent(),
            )
        }

        // 2. Adjust: nothing is queued and the queue is never sent.
        methods(ADJUST_PACKAGE_HANDLER, "addPackage").forEach { it.returnEarly() }
        methods(ADJUST_PACKAGE_HANDLER, "sendFirstPackage").forEach { it.returnEarly() }

        // 3. Facebook: the app event queue never flushes.
        methods(FACEBOOK_EVENT_QUEUE, "flush").forEach { it.returnEarly() }

        // 4. Amplitude: limit ad tracking reads as on and the device info (ad ID) is never
        // prefetched; the legacy-database migration finds no events to upload.
        methods(AMPLITUDE_CONTEXT, "isLimitAdTrackingEnabled").forEach { it.returnEarly(true) }
        methods(AMPLITUDE_CONTEXT, "prefetch").forEach { it.returnEarly() }
        methods(AMPLITUDE_MODULE, "getLegacyEvents", listOf("Ljava/lang/String;", "Ljava/lang/String;", PROMISE)).forEach {
            it.addInstructionsChecked(
                0,
                """
                    new-instance v0, Lcom/facebook/react/bridge/WritableNativeArray;
                    invoke-direct {v0}, Lcom/facebook/react/bridge/WritableNativeArray;-><init>()V
                    invoke-interface {p3, v0}, $PROMISE->resolve(Ljava/lang/Object;)V
                    return-void
                """.trimIndent(),
            )
        }

        // 5. Branch: tracking reads as disabled.
        methods(BRANCH, "isTrackingDisabled").forEach { it.returnEarly(true) }
    }
}
