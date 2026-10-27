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
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

// Push (Firebase Messaging) and purchases (RevenueCat) must keep working; nothing here touches them.

// React Native looks the bridge modules and their @ReactMethods up by name, so R8 keeps them;
// Adjust ships keep rules for its com.adjust.sdk classes.
private const val SENTRY_MODULE = "Lio/sentry/react/RNSentryModule;"
private const val ADJUST_PACKAGE_HANDLER = "Lcom/adjust/sdk/PackageHandler;"
private const val AMPLITUDE_MODULE = "Lcom/amplitude/reactnative/AmplitudeReactNativeModule;"
private const val BRANCH_MODULE = "Lio/branch/rnbranch/RNBranchModule;"
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
        // successful init, without calling SentryAndroid.init. Since 3.2.2 RNSentryModuleImpl is
        // renamed, so the bridge method that delegates to it (its only caller) is hooked instead.
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

        // 3. Facebook: the app event queue never flushes. AppEventQueue is renamed since 3.2.2, so
        // flushAndWait, where every flush ends up, is hooked instead of flush.
        FacebookFlushAndWaitFingerprint.method.returnEarly()

        // 4. Amplitude: the ad ID is never read, so limit ad tracking keeps its default (on) and
        // no ad ID reaches JS; the legacy-database migration finds no events to upload.
        // 3.2.2 no longer has AndroidContextProvider.isLimitAdTrackingEnabled or prefetch (R8
        // removed them as unused), so the two ad-ID readers they guarded return null instead.
        listOf(AmplitudeGoogleAdIdFingerprint, AmplitudeAmazonAdIdFingerprint).forEach {
            it.method.addInstructionsChecked(
                0,
                """
                    const/4 v0, 0x0
                    return-object v0
                """.trimIndent(),
            )
        }
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

        // 5. Branch: tracking reads as disabled. Branch is renamed since 3.2.2; its
        // isTrackingDisabled()Z is the one the bridge method of the same name calls.
        val bridge = methods(BRANCH_MODULE, "isTrackingDisabled", listOf(PROMISE)).single()
        val target = bridge.implementation!!.instructions
            .filter { it.opcode == Opcode.INVOKE_VIRTUAL }
            .mapNotNull { (it as ReferenceInstruction).reference as? MethodReference }
            .singleOrNull { it.returnType == "Z" && it.parameterTypes.isEmpty() }
            ?: throw PatchException("$BRANCH_MODULE.isTrackingDisabled no longer calls a single ()Z method")
        methods(target.definingClass, target.name, emptyList())
            .filter { it.returnType == "Z" }
            .ifEmpty { throw PatchException("${target.definingClass}.${target.name}()Z not found") }
            .forEach { it.returnEarly(true) }
    }
}
