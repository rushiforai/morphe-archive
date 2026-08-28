package app.blockblast.patches.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.blockblast.patches.shared.Constants.COMPATIBILITY_BLOCKBLAST

/**
 * Block Blast Premium (Subscription Simulation)
 *
 * Simulates an active subscription by bypassing server verification
 * and directly notifying the JavaScript layer of an active subscription.
 *
 * How it works:
 *
 * 1. Subscription check (wf/j.smali e()) → always calls notifySubStateUpdate().
 *    Bypasses server verification and notifies JS layer of active subscription.
 *
 * This makes the game think the user has an active subscription,
 * unlocking premium features without actual purchase.
 */
@Suppress("unused")
val blockblastPremiumPatch = bytecodePatch(
    name = "Premium (Subscription Simulation)",
    description = "Simulates an active subscription to unlock premium features.",
    default = true
) {
    compatibleWith(COMPATIBILITY_BLOCKBLAST)

    execute {
        // 1. wf/j.e() → always call notifySubStateUpdate() (simulate subscription)
        // Original flow: checks SPStore.p() == 1, then calls notifySubStateUpdate()
        // Patched: always calls notifySubStateUpdate() and returns
        SubscriptionCheckFingerprint.method.addInstructions(0, """
            invoke-static {}, Lorg/cocos2dx/javascript/JsCallJava;->notifySubStateUpdate()V
            return-void
        """.trimIndent())
    }
}
