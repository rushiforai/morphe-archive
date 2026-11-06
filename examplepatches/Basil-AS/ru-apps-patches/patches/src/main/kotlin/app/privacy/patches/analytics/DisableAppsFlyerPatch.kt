// Originally ported from xob0t/morphe-patches (GPLv3), app/privacy/patches/analytics/DisableAppsFlyerPatch.kt
// (manifest-only install-referrer disable). Extended with a bytecode patch after a capability-based
// dexdump sweep of the already-shipped ru.ozon.app.android / ru.ozon.fintech.finance APKs found
// AppsFlyer's obfuscated internal implementation (`com.appsflyer.internal.AFxxxSDK`, confirmed live:
// Ozon's own first-party `AppsFlyerConversionStorageImpl` calls `AppsFlyerLib.start()`/`.init()`
// directly in code, with no manifest dependency) still making live calls to `ConnectivityManager`
// (network-transport fingerprinting) and the advertising-ID API. The manifest-only version of this
// patch disables AppsFlyer's install-referrer `BroadcastReceiver`/`ContentProvider` entries only — a
// vestigial signal in the modern (v6+) AppsFlyer SDK, which initializes and starts its full
// attribution/tracking/device-fingerprinting pipeline via a direct code call that has nothing to do
// with the manifest. That left the actual tracker running by default in every app using it.
package app.privacy.patches.analytics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.privacy.patches.analytics.jl4ctuk.DISABLE_ANALYTICS_COMPATIBILITY
import app.shared.*
import java.util.logging.Logger

private const val APPS_FLYER_LIB_CLASS = "Lcom/appsflyer/AppsFlyerLib;"
private const val CONTEXT_CLASS = "Landroid/content/Context;"
private const val STRING_CLASS = "Ljava/lang/String;"
private const val REQUEST_LISTENER_CLASS = "Lcom/appsflyer/attribution/AppsFlyerRequestListener;"

private val logger = Logger.getLogger("DisableAppsFlyer")

private val disableAppsFlyerManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val application = manifest.childrenNamed("application").single()

            manifest.removeChildren(
                manifest.childrenNamed("uses-permission")
                    .filter { it.getAttribute("android:name") == "com.appsflyer.referrer.INSTALL_PROVIDER" },
            )

            val disabledComponents = application.disableComponentsByPrefix(
                "com.appsflyer.",
            )

            println("Disable AppsFlyer: disabled $disabledComponents manifest components.")
        }
    }
}

@Suppress("unused")
val disableAppsFlyerPatch = bytecodePatch(
    name = "Disable AppsFlyer",
    description = "Disables AppsFlyer attribution/tracking: no-ops its SDK implementation's start() " +
        "choke point (the actual activation entry point, called directly from app code — not " +
        "manifest-gated in the v6+ SDK) and disables its install-referrer manifest entries.",
    default = true,
) {
    compatibleWith(*DISABLE_ANALYTICS_COMPATIBILITY)

    dependsOn(disableAppsFlyerManifestPatch)

    execute {
        // AppsFlyerLib itself is the SDK's public abstract facade (every method has
        // `code: (none)`); the real implementation is a single obfuscated subclass
        // whose short name is unstable across SDK versions/builds (confirmed
        // `AFb1tSDK` in ru.ozon.app.android — matched here by inheritance instead).
        // Confirmed by dexdump: both start(Context) and start(Context, String)
        // delegate to start(Context, String, AppsFlyerRequestListener) — the single
        // choke point every activation path funnels through.
        val startMethods = mutableListOf<MutableMethod>()
        classDefForEach { classDef ->
            if (classDef.superclass != APPS_FLYER_LIB_CLASS) return@classDefForEach

            val candidates = classDef.methods.filter { method ->
                method.name == "start" &&
                    method.returnType == "V" &&
                    method.parameterTypes.size == 3 &&
                    method.parameterTypes[0].toString() == CONTEXT_CLASS &&
                    method.parameterTypes[1].toString() == STRING_CLASS &&
                    method.parameterTypes[2].toString() == REQUEST_LISTENER_CLASS &&
                    method.implementation != null
            }
            val mutableMethods = mutableClassDefBy(classDef).methods
            candidates.forEach { target ->
                startMethods += mutableMethods.first { method ->
                    method.name == target.name && method.parameterTypes == target.parameterTypes
                }
            }
        }

        when (startMethods.size) {
            0 -> logger.info("AppsFlyer: SDK implementation not found — nothing to disable")
            1 -> {
                startMethods.single().addInstructions(0, "return-void")
                logger.info("AppsFlyer: disabled SDK start() choke point")
            }
            else -> throw PatchException(
                "Disable AppsFlyer: expected one start(Context, String, " +
                    "AppsFlyerRequestListener) implementation, found ${startMethods.size}",
            )
        }
    }
}
