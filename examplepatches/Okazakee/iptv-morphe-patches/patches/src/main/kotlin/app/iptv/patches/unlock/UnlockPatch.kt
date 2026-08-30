package app.iptv.patches.unlock

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable

/**
 * Unlock Pro / remove subscription check for IPTV Pro Stream Player
 * Targets com.aloj22.iptvprostreamplayer + com.iptvprostreamplayer.v1 (R8-merged)
 *
 * Strategy:
 * 1) Force O7/j.A() and B() -> false : Firebase "subscription_needed" always disabled.
 *    Even if server flips the Remote Config flag, client ignores it.
 * 2) Force O7/h entitlement checks -> true : RevenueCat "pro" entitlement always active,
 *    as fallback if subscription_needed ever becomes true.
 *
 * Smali equivalent via apktool (verified):
 *   LO7/j;->A()Z  :  const/4 v0, 0x0; return v0
 *   LO7/j;->B()Z  :  const/4 v0, 0x0; return v0
 *
 * Morphe patch does the same via dexlib2 -> early return.
 */
@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro (IPTV)",
    description = "Deactivates subscription_needed gate and forces RevenueCat pro entitlement to active. Works offline, no server check.",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY_IPTV)

    // Minimal: patch the remote-config gate. This alone bypasses paywall when subscription_needed=true.
    execute {
        // LO7/j.A()Z -> return false immediately
        SubscriptionNeededAFingerprint.method.toMutable().apply {
            // Insert at instruction 0: early return 0
            addInstructions(0, """
                const/4 v0, 0x0
                return v0
            """.trimIndent())
        }

        // LO7/j.B()Z delegates to A() -> also return false (robustness)
        // Note: if fingerprinting B via string fails due to delegation, this will no-op but A() is sufficient.
        try {
            SubscriptionNeededBFingerprint.method.toMutable().apply {
                addInstructions(0, """
                    const/4 v0, 0x0
                    return v0
                """.trimIndent())
            }
        } catch (_: Exception) {
            // B() is just a wrapper; A() patch already covers it.
        }

        // Optional fallback: force RevenueCat entitlement active.
        // Coroutine suspend methods return Object (Boolean boxed). Inject early boxed true.
        // This covers cases where future version checks entitlement directly.
        try {
            ProEntitlementWFingerprint.method.toMutable().apply {
                addInstructions(0, """
                    const/4 v0, 0x1
                    invoke-static {v0}, LTc/b;->a(Z)Ljava/lang/Boolean;
                    move-result-object v0
                    return-object v0
                """.trimIndent())
            }
        } catch (_: Exception) {}

        try {
            ProEntitlementXFingerprint.method.toMutable().apply {
                addInstructions(0, """
                    const/4 v0, 0x1
                    invoke-static {v0}, LTc/b;->a(Z)Ljava/lang/Boolean;
                    move-result-object v0
                    return-object v0
                """.trimIndent())
            }
        } catch (_: Exception) {}
    }
}
