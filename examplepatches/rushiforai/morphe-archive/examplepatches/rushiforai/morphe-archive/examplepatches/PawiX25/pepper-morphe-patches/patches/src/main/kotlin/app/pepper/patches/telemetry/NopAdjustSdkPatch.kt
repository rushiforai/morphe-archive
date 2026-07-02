package app.pepper.patches.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.pepper.patches.shared.PEPPER_FAMILY
import app.pepper.patches.shared.clearBody

/**
 * Final cleanup for Adjust SDK on top of [neuterTrackerProvidersPatch] (kills
 * `SystemLifecycleContentProvider.onCreate` auto-init) and
 * [redirectTrackerUrlsPatch] (URLs → 127.0.0.1:1).
 *
 * Why we still need this:
 *   Pepper calls `com.adjust.sdk.Adjust.initSdk(AdjustConfig)` directly from
 *   `com.pepper.apps.android.app.PepperApplication.<onCreate-or-init>`, by-
 *   passing the ContentProvider auto-init that patch 02 neutralized. The SDK
 *   spins up its `Adjust-pool-*-thread-*-ActivityPackageSender` threadpool,
 *   serialises queued events, and calls `com.adjust.sdk.sig.Signer.sign(...)`
 *   on each — visible in logcat as a flood of `Adjust-pool` lines.
 *   None of these reach the network (URL is rewritten by patch 01 to
 *   127.0.0.1:1 → ECONNREFUSED, plus SELinux denies `/proc/net/tcp`,
 *   `serialno_prop`, `tty_drivers` reads from untrusted_app), so it's not a
 *   privacy leak — but it burns threads, CPU, and disk I/O for no reason.
 *
 * What we patch:
 *   Every public static method on `Lcom/adjust/sdk/Adjust;` that mutates SDK
 *   state or accepts user data, replacing the body with `return-void`:
 *
 *     initSdk(AdjustConfig)V                       ← THE init entry
 *     onResume()V / onPause()V                     ← lifecycle hooks
 *     trackEvent(AdjustEvent)V                     ← user-event tracking
 *     trackAdRevenue(AdjustAdRevenue)V             ← ad-revenue tracking
 *     verifyAndTrackPlayStorePurchase(...)V        ← purchase verification
 *     enable() / disable()V                        ← lifecycle (we won't toggle)
 *     addGlobalCallbackParameter(String,String)V   ← param injection
 *     addGlobalPartnerParameter(String,String)V    ← param injection
 *
 * What we deliberately DON'T touch:
 *   * `getDefaultInstance()Lcom/adjust/sdk/AdjustInstance;` — Pepper code
 *     dereferences the returned instance later. NOPping it would force us
 *     to return null, which would NPE in Pepper's caller. Leave it alive
 *     as an empty husk; the instance methods are no-ops effectively because
 *     the SDK never gets `initSdk`'d.
 *   * Pepper's own callsite in `PepperApplication`. We could remove the
 *     invoke, but that's brittle across Pepper releases. Killing the static
 *     method body is upstream-equivalent and version-stable.
 *
 * Why not just NOP `AdjustInstance.<init>` or `getDefaultInstance`?
 *   AdjustInstance is referenced by Pepper as a regular Java object after
 *   `getDefaultInstance()`. Returning null breaks Pepper. Returning the
 *   real instance but never letting `initSdk` configure it makes every
 *   subsequent `instance.<method>()` call fall through SDK guards (if
 *   `!isEnabled()` early-return), so no work happens. Cleaner. Verified
 *   below by Frida hook on `Adjust.initSdk` returning never-called.
 *
 * The whole `MutableMethodImplementation` is replaced (same trick as
 * [nopGmaAdLoaderPatch]) instead of removeInstructions+addInstructions, to
 * dodge the `tryBlocks.clear()` UnsupportedOperationException for any
 * method whose original body had try/catch handlers.
 */
@Suppress("unused")
val nopAdjustSdkPatch = bytecodePatch(
    name = "Disable Adjust SDK",
    description = "Stops the Adjust SDK from initialising and tracking events.",
) {
    compatibleWith(*PEPPER_FAMILY)

    dependsOn(redirectTrackerUrlsPatch, neuterTrackerProvidersPatch)

    val adjustType = "Lcom/adjust/sdk/Adjust;"

    data class Target(val name: String, val params: List<String>)

    val targets: List<Target> = listOf(
        Target("initSdk", listOf("Lcom/adjust/sdk/AdjustConfig;")),
        Target("onResume", emptyList()),
        Target("onPause", emptyList()),
        Target("trackEvent", listOf("Lcom/adjust/sdk/AdjustEvent;")),
        Target("trackAdRevenue", listOf("Lcom/adjust/sdk/AdjustAdRevenue;")),
        Target("verifyAndTrackPlayStorePurchase", listOf(
            "Lcom/adjust/sdk/AdjustEvent;",
            "Lcom/adjust/sdk/OnPurchaseVerificationFinishedListener;",
        )),
        Target("enable", emptyList()),
        Target("disable", emptyList()),
        Target("addGlobalCallbackParameter", listOf("Ljava/lang/String;", "Ljava/lang/String;")),
        Target("addGlobalPartnerParameter", listOf("Ljava/lang/String;", "Ljava/lang/String;")),
    )

    execute {
        classDefForEach { classDef ->
            if (classDef.type != adjustType) return@classDefForEach
            val mutableClass = mutableClassDefBy(classDef)

            mutableClass.methods.forEach methodLoop@{ method ->
                if (method.returnType != "V") return@methodLoop
                targets.firstOrNull { t ->
                    t.name == method.name && t.params == method.parameterTypes
                } ?: return@methodLoop

                method.clearBody()
                method.addInstructions(0, "return-void")
            }
        }
    }
}
