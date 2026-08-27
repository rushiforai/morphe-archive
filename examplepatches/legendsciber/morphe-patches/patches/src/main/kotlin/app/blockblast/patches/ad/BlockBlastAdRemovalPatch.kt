package app.blockblast.patches.ad

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.blockblast.patches.shared.Constants.COMPATIBILITY_BLOCKBLAST

/**
 * Block Blast Ad Removal + Subscription Simulation
 *
 * Removes all ads (banner, interstitial, rewarded) and simulates
 * an active subscription by always calling notifySubStateUpdate().
 *
 * How it works:
 *
 * 1. Banner ad control (be/b.smali c() and d()) → always returns immediately.
 *    Prevents banner show/hide logic from executing.
 *
 * 2. Banner ad display (be/a.smali i()) → always returns immediately.
 *    Prevents the primary banner display decision from executing.
 *
 * 3. Ad async work (yf/g.smali b()) → always returns immediately.
 *    Prevents ad-related async tasks from launching.
 *
 * 4. Ad SDK init (wg/h0.smali preAsyncInitWorkManager) → always returns immediately.
 *    Prevents AppLovin MAX SDK initialization.
 *
 * 5. Subscription check (wf/j.smali e()) → always calls notifySubStateUpdate().
 *    Bypasses server verification and notifies JS layer of active subscription.
 *
 * Note: isADShow is set from native Hermes bytecode and cannot be patched
 * at smali level. Instead, we patch all code paths that CHECK isADShow
 * to skip ad logic entirely.
 */
@Suppress("unused")
val blockblastAdRemovalPatch = bytecodePatch(
    name = "Ad Removal + Subscription",
    description = "Removes all ads and simulates an active subscription.",
    default = true
) {
    compatibleWith(COMPATIBILITY_BLOCKBLAST)

    execute {
        // 1. be/b.c() → return immediately (skip banner control)
        BannerAdControlFingerprint.method.addInstructions(0, """
            return-void
        """.trimIndent())

        // 2. be/b.d() → return immediately (skip banner control variant)
        BannerAdControlVariantFingerprint.method.addInstructions(0, """
            return-void
        """.trimIndent())

        // 3. be/a.i() → return immediately (skip banner display)
        BannerAdDisplayFingerprint.method.addInstructions(0, """
            return-void
        """.trimIndent())

        // 4. yf/g.b() → return immediately (skip ad async work)
        AdAsyncWorkFingerprint.method.addInstructions(0, """
            return-void
        """.trimIndent())

        // 5. wg/h0.preAsyncInitWorkManager → return immediately (skip ad SDK init)
        AdSdkInitFingerprint.method.addInstructions(0, """
            return-void
        """.trimIndent())

        // 6. wf/j.e() → always call notifySubStateUpdate() (simulate subscription)
        // Original flow: checks SPStore.p() == 1, then calls notifySubStateUpdate()
        // Patched: always calls notifySubStateUpdate() and returns
        SubscriptionCheckFingerprint.method.addInstructions(0, """
            invoke-static {}, Lorg/cocos2dx/javascript/JsCallJava;->notifySubStateUpdate()V
            return-void
        """.trimIndent())
    }
}
